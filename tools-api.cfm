<cfscript>
// Thin .cfm proxy in front of cfc/ToolsUtils.cfc.
// Lives at the site root (not under /cfc/ or /tools/) because /cfc/ is blocked
// to direct browser requests at the server level, and /tools/*.cfm gets
// 301-redirected to a clean URL by web.config, which would break a JSON fetch.
param name="url.method" default="";
param name="url.url" default="";

result = {"success": false, "error": "invalid_method"};

switch (url.method) {
    case "extractMetaTags":
        result = new cfc.ToolsUtils().extractMetaTags(url = url.url);
        break;
    case "importImage":
        result = new cfc.ToolsUtils().importImage(url = url.url);
        break;
}

getPageContext().getResponse().setContentType("application/json; charset=UTF-8");
writeOutput(serializeJSON(result));
</cfscript>
