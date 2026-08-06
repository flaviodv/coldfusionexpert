component {
this.Name="ColdfusionExpert";
this.SessionManagement=true;
this.SessionTimeout=CreateTimeSpan(0,1,0,0);
this.ClientManagement=true;
this.scriptProtect=true;
this.mappings = structNew();
this.mappings["/assets"] = getDirectoryFromPath(getCurrentTemplatePath()) & "assets/";
this.mappings["/cfexpertCFC"] = getDirectoryFromPath(getCurrentTemplatePath()) & "cfc/";

function onRequestStart(targetPage){
    SetEncoding("form", "utf-8");
    SetEncoding("url", "utf-8");
    getPageContext().getResponse().setContentType("text/html; charset=UTF-8");
    getPageContext().getResponse().setHeader("Content-Type", "text/html; charset=UTF-8");

    param name="session.lan" default="en";
    if(isDefined("url.lan")){
        session.lan = url.lan;
    }

    if(session.lan eq "es"){
        setLocale("es_AR");
    } else {
        setLocale("en_US");
    }

    // Cache-busting query string for the two actively-edited assets, derived from
    // each file's real last-modified time so browsers auto-fetch new versions
    // instead of serving a stale cached copy after an edit.
    try {
        request.toolsCssVer = "?v=" & dateFormat(getFileInfo(expandPath("/assets/css/tools.css")).lastmodified, "yyyymmdd") & timeFormat(getFileInfo(expandPath("/assets/css/tools.css")).lastmodified, "HHmmss");
    } catch (any e) {
        request.toolsCssVer = "";
    }
    try {
        request.customJsVer = "?v=" & dateFormat(getFileInfo(expandPath("/assets/js/custom.js")).lastmodified, "yyyymmdd") & timeFormat(getFileInfo(expandPath("/assets/js/custom.js")).lastmodified, "HHmmss");
    } catch (any e) {
        request.customJsVer = "";
    }
    try {
        request.templateCssVer = "?v=" & dateFormat(getFileInfo(expandPath("/assets/css/templatemo-chain-app-dev.css")).lastmodified, "yyyymmdd") & timeFormat(getFileInfo(expandPath("/assets/css/templatemo-chain-app-dev.css")).lastmodified, "HHmmss");
    } catch (any e) {
        request.templateCssVer = "";
    }
    try {
        request.heroImageVer = "?v=" & dateFormat(getFileInfo(expandPath("/assets/images/flavio-ondas-sin-marco.webp")).lastmodified, "yyyymmdd") & timeFormat(getFileInfo(expandPath("/assets/images/flavio-ondas-sin-marco.webp")).lastmodified, "HHmmss");
    } catch (any e) {
        request.heroImageVer = "";
    }
    try {
        request.heroBlinkImageVer = "?v=" & dateFormat(getFileInfo(expandPath("/assets/images/flavio-ondas-ojos-cerrados.webp")).lastmodified, "yyyymmdd") & timeFormat(getFileInfo(expandPath("/assets/images/flavio-ondas-ojos-cerrados.webp")).lastmodified, "HHmmss");
    } catch (any e) {
        request.heroBlinkImageVer = "";
    }

    // Requests under /cfc/ are either direct CFC calls or thin JSON API proxies
    // (e.g. tools-api.cfm) — neither wants the HTML header/footer wrapped around them.
    if(!findNoCase(".cfc", arguments.targetPage) && !findNoCase("tools-api.cfm", arguments.targetPage) && !findNoCase("tools-proxy.cfm", arguments.targetPage)){
        include "tools/_tools-registry.cfm";

        var fileName = getFileFromPath(arguments.targetPage);
        var slug = listFirst(fileName, ".");
        request.isToolsSection = false;
        if(structKeyExists(request.toolsRegistry, slug)){
            var tool = request.toolsRegistry[slug];
            var toolTitle = (session.lan eq "es") ? tool.titleEs : tool.titleEn;
            var toolDescription = (session.lan eq "es") ? tool.descEs : tool.descEn;
            var toolCategory = "";
            var categoryLabel = "";
            var categoryIndex = 0;
            for(var categoryIndex = 1; categoryIndex <= arrayLen(request.toolCategories); categoryIndex++){
                if(request.toolCategories[categoryIndex].slug eq tool.category){
                    toolCategory = request.toolCategories[categoryIndex];
                    categoryLabel = (session.lan eq "es") ? toolCategory.labelEs : toolCategory.labelEn;
                    break;
                }
            }
            request.pageTitle = (session.lan eq "es")
                ? toolTitle & " | Herramienta gratuita | ColdFusion Expert"
                : toolTitle & " | Free Online Tool | ColdFusion Expert";
            request.pageDescription = toolDescription;
            request.pageKeywords = toolTitle & ", " & categoryLabel & ", " & ((session.lan eq "es") ? "herramienta online gratuita" : "free online tool") & ", " & toolDescription;
            request.pageCanonical = "https://coldfusionexpert.ar/tools/" & slug & "?lan=" & session.lan;
            request.pageAlternateEs = "https://coldfusionexpert.ar/tools/" & slug & "?lan=es";
            request.pageAlternateEn = "https://coldfusionexpert.ar/tools/" & slug & "?lan=en";
            request.pageOgTitle = request.pageTitle;
            request.pageOgDescription = toolDescription;
            request.pageOgUrl = request.pageCanonical;
            request.pageSchemaJson = serializeJSON({
                "@context": "https://schema.org",
                "@graph": [
                    {
                        "@type": "WebApplication",
                        "@id": request.pageCanonical & "##webapplication",
                        "name": toolTitle,
                        "url": request.pageCanonical,
                        "description": toolDescription,
                        "applicationCategory": "UtilitiesApplication",
                        "applicationSubCategory": categoryLabel,
                        "operatingSystem": "Any",
                        "browserRequirements": (session.lan eq "es") ? "Requiere un navegador web moderno" : "Requires a modern web browser",
                        "isAccessibleForFree": true,
                        "inLanguage": session.lan,
                        "provider": {
                            "@type": "Organization",
                            "name": "ColdFusion Expert",
                            "url": "https://coldfusionexpert.ar",
                            "logo": "https://coldfusionexpert.ar/assets/images/cf%20expert.png"
                        },
                        "breadcrumb": {"@id": request.pageCanonical & "##breadcrumb"}
                    },
                    {
                        "@type": "BreadcrumbList",
                        "@id": request.pageCanonical & "##breadcrumb",
                        "itemListElement": [
                            {"@type": "ListItem", "position": 1, "name": (session.lan eq "es") ? "Herramientas" : "Tools", "item": "https://coldfusionexpert.ar/tools?lan=" & session.lan},
                            {"@type": "ListItem", "position": 2, "name": categoryLabel, "item": "https://coldfusionexpert.ar/tools?lan=" & session.lan & "&category=" & tool.category},
                            {"@type": "ListItem", "position": 3, "name": toolTitle, "item": request.pageCanonical}
                        ]
                    }
                ]
            });
            request.pageNoindex = !tool.built;
            request.isToolsSection = true;
        } else if(fileName eq "tools.cfm"){
            request.pageTitle = (session.lan eq "es")
                ? "Nuestras Herramientas Gratuitas | ColdFusion Expert"
                : "Our Free Tools | ColdFusion Expert";
            request.pageCanonical = "https://coldfusionexpert.ar/tools?lan=" & session.lan;
            request.pageAlternateEs = "https://coldfusionexpert.ar/tools?lan=es";
            request.pageAlternateEn = "https://coldfusionexpert.ar/tools?lan=en";
            request.isToolsSection = true;
        }

        if(session.lan eq "es"){
            include "header_es.cfm";
        } else {
            include "header_en.cfm";
        }
    }
    return true;
}

function onRequest(targetPage){
    request.targetPage=targetPage;
    include arguments.targetPage;
    return true;
}

function onRequestEnd(targetPage){
    if(!findNoCase(".cfc", arguments.targetPage) && !findNoCase("tools-api.cfm", arguments.targetPage) && !findNoCase("tools-proxy.cfm", arguments.targetPage)){
        if(session.lan eq "es"){
            include "footer_es.cfm";
        } else {
            include "footer_en.cfm";
        }
    }
}
}
