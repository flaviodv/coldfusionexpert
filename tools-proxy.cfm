<cfscript>
param name="url.url" default="";
result = new cfc.ToolsUtils().fetchPublicPage(url = url.url);
getPageContext().getResponse().setContentType("text/html; charset=UTF-8");
if (!result.success) {
  writeOutput("<!doctype html><html><body style='font-family:Arial,sans-serif;padding:24px'><h2>Page unavailable</h2><p>The site did not allow the server to load this public page.</p><p>Response: " & encodeForHTML(result.status) & "</p></body></html>");
} else {
  writeOutput(result.html);
}
</cfscript>
