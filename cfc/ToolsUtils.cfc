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

	private boolean function isBlockedHost(required string url) {
		var host = reReplaceNoCase(arguments.url, "^https?://([^/]+).*$", "\1");
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
