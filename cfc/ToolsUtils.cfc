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
			"robots": "",
			"viewport": "",
			"author": "",
			"canonical": "",
			"charset": "",
			"language": "",
			"ogTitle": "",
			"ogDescription": "",
			"ogImage": "",
			"ogType": "",
			"ogUrl": "",
			"ogSiteName": "",
			"ogLocale": "",
			"twitterCard": "",
			"twitterTitle": "",
			"twitterDescription": "",
			"twitterImage": "",
			"twitterSite": "",
			"twitterCreator": "",
			"schemaItems": [],
			"schemaRawBlocks": []
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
		var hop = 0;
		var location = "";
		try {
			for (hop = 0; hop <= 5; hop++) {
				cfhttp(
					url = targetUrl,
					method = "get",
					timeout = 10,
					throwonerror = false,
					redirect = false,
					useragent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36",
					result = "httpResult"
				) {
					cfhttpparam(type = "header", name = "Accept", value = "text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8");
					cfhttpparam(type = "header", name = "Accept-Language", value = "en-US,en;q=0.9,es;q=0.8,fr;q=0.7");
					cfhttpparam(type = "header", name = "Upgrade-Insecure-Requests", value = "1");
				}

				if (!structKeyExists(httpResult, "statusCode") || !reFind("^3[0-9][0-9]", httpResult.statusCode)) break;

				location = structKeyExists(httpResult, "responseHeader") && structKeyExists(httpResult.responseHeader, "Location")
					? httpResult.responseHeader.Location : "";
				if (isArray(location)) location = arrayLen(location) ? location[1] : "";
				location = trim(location);
				if (!len(location) || hop == 5) {
					result.error = "fetch_failed";
					return result;
				}
				// Relative Location headers are resolved against the current target.
				if (!reFindNoCase("^https?://", location)) {
					location = reReplaceNoCase(targetUrl, "^(https?://[^/]+).*$", "\1")
						& (left(location, 1) == "/" ? location : "/" & location);
				}
				targetUrl = location;
				if (isBlockedHost(targetUrl)) {
					result.error = "blocked_host";
					return result;
				}
			}
		} catch (any e) {
			result.error = "fetch_failed";
			return result;
		}

		if (!structKeyExists(httpResult, "statusCode") || !reFind("^(200|304)", httpResult.statusCode) || !isSimpleValue(httpResult.fileContent) || !len(trim(httpResult.fileContent))) {
			result.error = "fetch_failed";
			return result;
		}
		if (len(httpResult.fileContent) > 4194304) {
			result.error = "invalid_response";
			return result;
		}

		var html = httpResult.fileContent;

		result["title"] = extractFirst(html, "<title[^>]*>([^<]*)</title>");
		result["description"] = extractMetaContent(html, "description");
		result["keywords"] = extractMetaContent(html, "keywords");
		result["robots"] = extractMetaContent(html, "robots");
		result["viewport"] = extractMetaContent(html, "viewport");
		result["author"] = extractMetaContent(html, "author");
		result["canonical"] = extractFirst(html, '<link[^>]*rel=["'']canonical["''][^>]*href=["'']([^"'']*)["'']');
		result["charset"] = extractFirst(html, '<meta[^>]*charset=["'']?([^"''\s/>]+)');
		if (!len(result["charset"])) {
			result["charset"] = extractFirst(html, '<meta[^>]*http-equiv=["'']Content-Type["''][^>]*content=["''][^"'']*charset=([^"''\s;]+)');
		}
		result["language"] = extractFirst(html, '<html[^>]*lang=["'']([^"'']*)["'']');

		result["ogTitle"] = extractMetaContent(html, "og:title", true);
		result["ogDescription"] = extractMetaContent(html, "og:description", true);
		result["ogImage"] = extractMetaContent(html, "og:image", true);
		result["ogType"] = extractMetaContent(html, "og:type", true);
		result["ogUrl"] = extractMetaContent(html, "og:url", true);
		result["ogSiteName"] = extractMetaContent(html, "og:site_name", true);
		result["ogLocale"] = extractMetaContent(html, "og:locale", true);

		result["twitterCard"] = extractMetaContent(html, "twitter:card", false);
		result["twitterTitle"] = extractMetaContent(html, "twitter:title", false);
		result["twitterDescription"] = extractMetaContent(html, "twitter:description", false);
		result["twitterImage"] = extractMetaContent(html, "twitter:image", false);
		result["twitterSite"] = extractMetaContent(html, "twitter:site", false);
		result["twitterCreator"] = extractMetaContent(html, "twitter:creator", false);

		var schemaData = extractSchemaData(html);
		result["schemaItems"] = schemaData.items;
		result["schemaRawBlocks"] = schemaData.rawBlocks;
		result["success"] = true;
		return result;
	}

	// Downloads a remote raster image to a short-lived public folder.  This lets
	// the browser work with image hosts that do not allow cross-origin requests.
	remote function importImage(required string url) returnformat="json" {
		// Keys must be declared quoted: unquoted dot-assignment (result.imageUrl)
		// creates an upper-cased key, and serializeJSON then emits IMAGEURL, which
		// the browser-side JS (case-sensitive) reads as undefined.
		var result = {"success": false, "error": "", "imageUrl": "", "mimeType": ""};
		var targetUrl = trim(arguments.url);
		var httpResult = "";
		var tempDir = expandPath("/tools/temp-images");
		var extension = "";
		var fileName = "";
		var tempPath = "";
		var hop = 0;
		var location = "";

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
			// redirect=false on purpose: cfhttp's own redirect follower would skip the
			// isBlockedHost check on each hop (SSRF). Follow up to 3 hops by hand instead,
			// re-validating every destination. Plenty of CDNs answer 301/302 on image URLs.
			for (hop = 0; hop <= 3; hop++) {
				cfhttp(url = targetUrl, method = "get", timeout = 12, throwonerror = false,
					redirect = false, getAsBinary = "yes", useragent = "Mozilla/5.0 (compatible; ColdFusionExpertToolsBot/1.0)", result = "httpResult");

				if (!structKeyExists(httpResult, "statusCode") || !reFind("^3[0-9][0-9]", httpResult.statusCode)) break;

				location = structKeyExists(httpResult, "responseHeader") && structKeyExists(httpResult.responseHeader, "Location")
					? httpResult.responseHeader.Location : "";
				if (isArray(location)) location = arrayLen(location) ? location[1] : "";
				location = trim(location);
				if (!len(location) || hop == 3) {
					result.error = "fetch_failed";
					return result;
				}
				// Relative Location headers are resolved against the current target.
				if (!reFindNoCase("^https?://", location)) {
					location = reReplaceNoCase(targetUrl, "^(https?://[^/]+).*$", "\1")
						& (left(location, 1) == "/" ? location : "/" & location);
				}
				targetUrl = location;
				if (isBlockedHost(targetUrl)) {
					result.error = "blocked_host";
					return result;
				}
			}
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
		result["success"] = true;
		result["imageUrl"] = "/tools/temp-images/" & fileName;
		result["mimeType"] = (extension == "svg" ? "image/svg+xml" : ("image/" & (extension == "jpg" ? "jpeg" : extension)));
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

	private string function imageExtension(required any bytes) {
		var signature = "";
		var rawText = "";

		if (isBinary(arguments.bytes)) {
			signature = uCase(binaryEncode(arguments.bytes, "hex"));
			if (left(signature, 16) == "89504E470D0A1A0A") return "png";
			if (left(signature, 6) == "FFD8FF") return "jpg";
			if (left(signature, 12) == "474946383761" || left(signature, 12) == "474946383961") return "gif";
			if (left(signature, 8) == "52494646" && mid(signature, 17, 8) == "57454250") return "webp";

			// Try converting binary to string for SVG inspection
			try {
				rawText = createObject("java", "java.lang.String").init(arguments.bytes, "UTF-8");
			} catch (any e) {
				try {
					rawText = toString(arguments.bytes);
				} catch (any e2) {}
			}
			// Hex fallback for SVG (<svg or <SVG in the first 2KB of hex)
			if (!len(rawText) && (findNoCase("3C737667", left(signature, 2048)) || findNoCase("3C535647", left(signature, 2048)))) {
				return "svg";
			}
		} else if (isSimpleValue(arguments.bytes)) {
			rawText = arguments.bytes;
		}

		if (len(rawText)) {
			var sampleHead = left(rawText, 2048);
			if (reFindNoCase("<svg[\s>]", sampleHead) || reFindNoCase("<svg[^>]*xmlns", sampleHead)) {
				return "svg";
			}
		}

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
		if (structKeyExists(m, "pos") and arrayLen(m.pos) >= 2 and m.pos[2] > 0 and m.len[2] > 0) {
			return trim(decodeEntities(mid(arguments.html, m.pos[2], m.len[2])));
		}
		return "";
	}

	private string function extractMetaContent(required string html, required string name, boolean isProperty = false) {
		var pAttr = arguments.isProperty ? "property" : "name";
		var sAttr = arguments.isProperty ? "name" : "property";
		var safeName = replace(arguments.name, ":", "\:", "all");
		var found = "";

		found = extractFirst(arguments.html, '<meta[^>]*' & pAttr & '=["'']' & safeName & '["''][^>]*content=["'']([^"'']*)["'']');
		if (len(found)) return found;
		found = extractFirst(arguments.html, '<meta[^>]*content=["'']([^"'']*)["''][^>]*' & pAttr & '=["'']' & safeName & '["'']');
		if (len(found)) return found;

		found = extractFirst(arguments.html, '<meta[^>]*' & sAttr & '=["'']' & safeName & '["''][^>]*content=["'']([^"'']*)["'']');
		if (len(found)) return found;
		found = extractFirst(arguments.html, '<meta[^>]*content=["'']([^"'']*)["''][^>]*' & sAttr & '=["'']' & safeName & '["'']');
		return found;
	}

	// Reads Schema.org JSON-LD blocks. A page may publish a single entity, an
	// array, or an @graph, so each typed object is collected recursively.
	private struct function extractSchemaData(required string html) {
		var result = {
			"items": [],
			"rawBlocks": []
		};
		var scripts = reMatchNoCase('(?s)<script[^>]*type\s*=\s*["'']?application/ld\+json["'']?[^>]*>.*?</script>', arguments.html);
		var script = "";
		var jsonText = "";
		var data = "";

		// Fallback in case type attribute appears after or without standard spacing
		if (!arrayLen(scripts)) {
			scripts = reMatchNoCase("(?s)<script[^>]*>.*?</script>", arguments.html);
			var filtered = [];
			for (script in scripts) {
				if (reFindNoCase('application/ld\+json', script)) arrayAppend(filtered, script);
			}
			scripts = filtered;
		}

		for (script in scripts) {
			jsonText = trim(reReplaceNoCase(script, "(?is)^\s*<script[^>]*>", "", "one"));
			jsonText = trim(reReplaceNoCase(jsonText, "(?is)</script>\s*$", "", "one"));
			if (!len(jsonText)) continue;
			arrayAppend(result.rawBlocks, jsonText);
			try {
				data = deserializeJSON(jsonText);
				collectSchemaItems(data, result.items);
			} catch (any e) {
				// Invalid third-party JSON-LD should not prevent ordinary metadata extraction.
			}
		}
		return result;
	}

	private array function extractSchemaItems(required string html) {
		return extractSchemaData(arguments.html).items;
	}

	private void function collectSchemaItems(required any node, required array items) {
		var key = "";
		var value = "";
		var typeValue = "";
		var typeName = "";
		var item = {};

		if (isArray(arguments.node)) {
			for (value in arguments.node) collectSchemaItems(value, arguments.items);
			return;
		}
		if (!isStruct(arguments.node)) return;

		if (structKeyExists(arguments.node, "@type")) {
			typeValue = arguments.node["@type"];
			typeName = isArray(typeValue) ? arrayToList(typeValue, ", ") : toString(typeValue);
			if (len(trim(typeName)) && arrayLen(arguments.items) < 60) {
				item = {
					"type": typeName,
					"name": schemaValue(arguments.node, "name"),
					"url": schemaValue(arguments.node, "url"),
					"description": schemaValue(arguments.node, "description"),
					"id": schemaValue(arguments.node, "@id"),
					"data": arguments.node,
					"raw": arguments.node
				};
				arrayAppend(arguments.items, item);
			}
		}

		for (key in arguments.node) {
			value = arguments.node[key];
			if (isArray(value) || isStruct(value)) collectSchemaItems(value, arguments.items);
		}
	}

	private string function schemaValue(required struct node, required string key) {
		var value = "";
		if (!structKeyExists(arguments.node, arguments.key)) return "";
		value = arguments.node[arguments.key];
		return isSimpleValue(value) ? trim(toString(value)) : "";
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
