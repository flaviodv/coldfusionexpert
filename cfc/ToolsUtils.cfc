component {

	// Called from the browser (same-origin fetch) by tools/widgets/meta-tags-extractor.cfm.
	// Fetching an arbitrary third-party URL must happen server-side (browsers block this via CORS).
	remote function extractMetaTags(required string url) returnformat="json" {
		var result = {
			"success": false,
			"error": "",
			"url": arguments.url,
			"title": "",
			"description": "",
			"keywords": "",
			"ogTitle": "",
			"ogDescription": "",
			"ogImage": "",
			"canonical": ""
		};

		var targetUrl = trim(arguments.url);

		if (!reFindNoCase("^https?://", targetUrl)) {
			result.error = "invalid_url";
			return result;
		}

		if (isBlockedHost(targetUrl)) {
			result.error = "blocked_host";
			return result;
		}

		var httpResult = "";
		try {
			cfhttp(
				url = targetUrl,
				method = "get",
				timeout = 8,
				throwonerror = true,
				redirect = true,
				useragent = "Mozilla/5.0 (compatible; ColdFusionExpertToolsBot/1.0; +https://coldfusionexpert.ar)",
				result = "httpResult"
			);
		} catch (any e) {
			result.error = "fetch_failed";
			return result;
		}

		if (!isSimpleValue(httpResult.fileContent)) {
			result.error = "invalid_response";
			return result;
		}

		var html = httpResult.fileContent;

		result.title = extractFirst(html, "<title[^>]*>([^<]*)</title>");
		result.description = extractMetaContent(html, "description");
		result.keywords = extractMetaContent(html, "keywords");
		result.ogTitle = extractMetaContent(html, "og:title", true);
		result.ogDescription = extractMetaContent(html, "og:description", true);
		result.ogImage = extractMetaContent(html, "og:image", true);
		result.canonical = extractFirst(html, '<link[^>]*rel=["'']canonical["''][^>]*href=["'']([^"'']*)["'']');
		result.success = true;
		return result;
	}

	// Downloads a remote raster image to a short-lived public folder.  This lets
	// the browser work with image hosts that do not allow cross-origin requests.
	remote function importImage(required string url) returnformat="json" {
		var result = {"success": false, "error": ""};
		var targetUrl = trim(arguments.url);
		var httpResult = "";
		var tempDir = expandPath("/tools/temp-images");
		var extension = "";
		var fileName = "";
		var tempPath = "";

		if (!reFindNoCase("^https?://", targetUrl)) {
			result.error = "invalid_url";
			return result;
		}
		if (isBlockedHost(targetUrl)) {
			result.error = "blocked_host";
			return result;
		}

		try {
			if (!directoryExists(tempDir)) directoryCreate(tempDir);
			cleanupTemporaryImages(tempDir);
			cfhttp(url = targetUrl, method = "get", timeout = 12, throwonerror = true,
				redirect = false, getAsBinary = "yes", useragent = "Mozilla/5.0 (compatible; ColdFusionExpertToolsBot/1.0)", result = "httpResult");
		} catch (any e) {
			result.error = "fetch_failed";
			return result;
		}

		if (!structKeyExists(httpResult, "statusCode") || left(httpResult.statusCode, 3) != "200" || !isBinary(httpResult.fileContent)) {
			result.error = "invalid_response";
			return result;
		}

		extension = imageExtension(httpResult.fileContent);
		if (!len(extension)) {
			result.error = "not_an_image";
			return result;
		}
		// 15 MB is ample for editing while preventing the temporary folder from being abused.
		if (len(httpResult.fileContent) > 15728640) {
			result.error = "file_too_large";
			return result;
		}

		fileName = "image-" & replace(createUUID(), "-", "", "all") & "." & extension;
		tempPath = tempDir & "/" & fileName;
		fileWrite(tempPath, httpResult.fileContent);
		result.success = true;
		result.imageUrl = "/tools/temp-images/" & fileName;
		result.mimeType = "image/" & (extension == "jpg" ? "jpeg" : extension);
		return result;
	}

	// Public-page viewer used by the auto-refresh tool. The returned document is
	// sandboxed by the caller; it is not a login/session proxy.
	public struct function fetchPublicPage(required string url) {
		var result = {"success": false, "error": "", "html": "", "status": ""};
		var targetUrl = trim(arguments.url);
		var httpResult = "";
		if (!reFindNoCase("^https?://", targetUrl) || isBlockedHost(targetUrl)) {
			result.error = "invalid_url";
			return result;
		}
		try {
			cfhttp(url = targetUrl, method = "get", timeout = 12, throwonerror = true,
				redirect = false, useragent = "Mozilla/5.0 (compatible; ColdFusionExpertToolsBot/1.0)", result = "httpResult");
		} catch (any e) {
			result.error = "fetch_failed";
			return result;
		}
		if (structKeyExists(httpResult, "statusCode")) result.status = httpResult.statusCode;
		if (!structKeyExists(httpResult, "statusCode") || left(httpResult.statusCode, 3) != "200" || !isSimpleValue(httpResult.fileContent) || len(httpResult.fileContent) > 2097152) {
			result.error = "invalid_response";
			return result;
		}
		var html = toString(httpResult.fileContent);
		if (!reFindNoCase("<html|<body|<head", html)) {
			result.error = "not_html";
			return result;
		}
		// Resolve stylesheets, images, and other relative public resources against
		// the original page. Remove an upstream base tag so it cannot override this.
		html = reReplaceNoCase(html, "<base[^>]*>", "", "all");
		if (reFindNoCase("<head[^>]*>", html)) {
			html = reReplaceNoCase(html, "<head([^>]*)>", "<head\1><base href=\"" & encodeForHTMLAttribute(targetUrl) & "\">", "one");
		} else {
			html = "<base href=\"" & encodeForHTMLAttribute(targetUrl) & "\">" & html;
		}
		result.success = true;
		result.html = html;
		return result;
	}

	private void function cleanupTemporaryImages(required string tempDir) {
		var itemPath = "";
		for (itemPath in directoryList(arguments.tempDir, false, "path")) {
			if (dateDiff("n", getFileInfo(itemPath).lastModified, now()) > 60) fileDelete(itemPath);
		}
	}

	private string function imageExtension(required binary bytes) {
		var signature = binaryEncode(arguments.bytes, "hex");
		if (left(signature, 16) == "89504E470D0A1A0A") return "png";
		if (left(signature, 6) == "FFD8FF") return "jpg";
		if (left(signature, 12) == "474946383761" || left(signature, 12) == "474946383961") return "gif";
		if (left(signature, 8) == "52494646" && mid(signature, 17, 8) == "57454250") return "webp";
		return "";
	}

	private boolean function isBlockedHost(required string url) {
		var host = reReplaceNoCase(arguments.url, "^https?://([^/]+).*$", "\1");
		var address = "";
		var addresses = [];
		host = listFirst(host, ":"); // strip port
		host = lCase(host);

		if (
			host == "localhost" ||
			host == "127.0.0.1" ||
			host == "0.0.0.0" ||
			host == "::1" ||
			reFindNoCase("^127\.", host) ||
			reFindNoCase("^10\.", host) ||
			reFindNoCase("^192\.168\.", host) ||
			reFindNoCase("^172\.(1[6-9]|2[0-9]|3[0-1])\.", host) ||
			reFindNoCase("^169\.254\.", host) ||
			reFindNoCase("\.local$", host)
		) {
			return true;
		}
		// Resolve host names as well, so a public-looking hostname cannot point at
		// the local network (SSRF). If DNS cannot be checked, fail safely.
		try {
			addresses = createObject("java", "java.net.InetAddress").getAllByName(host);
			for (address in addresses) {
				if (address.isAnyLocalAddress() || address.isLoopbackAddress() || address.isLinkLocalAddress() || address.isSiteLocalAddress() || address.isMulticastAddress()) return true;
			}
		} catch (any e) {
			return true;
		}
		return false;
	}

	private string function extractFirst(required string html, required string pattern) {
		var m = reFindNoCase(arguments.pattern, arguments.html, 1, true);
		if (structKeyExists(m, "match") and arrayLen(m.match) >= 2 and len(trim(m.match[2]))) {
			return trim(decodeEntities(m.match[2]));
		}
		return "";
	}

	private string function extractMetaContent(required string html, required string name, boolean isProperty = false) {
		var attr = arguments.isProperty ? "property" : "name";
		var p1 = '<meta[^>]*' & attr & '=["'']' & arguments.name & '["''][^>]*content=["'']([^"'']*)["'']';
		var p2 = '<meta[^>]*content=["'']([^"'']*)["''][^>]*' & attr & '=["'']' & arguments.name & '["'']';
		var found = extractFirst(arguments.html, p1);
		if (len(found)) {
			return found;
		}
		return extractFirst(arguments.html, p2);
	}

	private string function decodeEntities(required string s) {
		var out = arguments.s;
		out = replaceNoCase(out, "&amp;", "&", "all");
		out = replaceNoCase(out, "&lt;", "<", "all");
		out = replaceNoCase(out, "&gt;", ">", "all");
		out = replaceNoCase(out, "&quot;", '"', "all");
		out = replaceNoCase(out, "&##039;", "'", "all");
		out = replaceNoCase(out, "&apos;", "'", "all");
		return out;
	}

}
