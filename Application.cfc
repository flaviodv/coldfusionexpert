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

    // Language is now purely URL-driven (unprefixed = English, /es/... = Spanish,
    // via the internal ?lan= that web.config's rewrite rules attach). Page requests
    // must NOT fall back to whatever language a previous request left in the session,
    // otherwise an unprefixed /tools/x URL could silently render Spanish (and vice
    // versa) depending on browsing history - the URL itself has to be the single
    // source of truth. API/proxy calls (tools-api.cfm, tools-proxy.cfm, *.cfc) keep
    // the old lenient/sticky behavior since they don't carry ?lan= and shouldn't
    // clobber the session language mid-page.
    var isApiOrCfcCall = findNoCase(".cfc", arguments.targetPage) || findNoCase("tools-api.cfm", arguments.targetPage) || findNoCase("tools-proxy.cfm", arguments.targetPage);
    if(isApiOrCfcCall){
        param name="session.lan" default="en";
        if(isDefined("url.lan")){
            session.lan = url.lan;
        }
    } else if(isDefined("url.lan")){
        session.lan = url.lan;
    } else {
        session.lan = "en";
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
        request.isHomePage = false;
        request.isAboutPage = false;
        request.isColdFusionPage = false;
        request.langPrefix = (session.lan eq "es") ? "/es" : "";

        // Base clean path (no language prefix, no ?lan=) for the current page - used to
        // build canonical/hreflang/JSON-LD URLs and the language-switch link below.
        var basePath = "/";
        if(structKeyExists(request.toolsRegistry, slug)){
            basePath = "/tools/" & slug;
        } else if(fileName eq "tools.cfm"){
            basePath = "/tools";
        } else if(fileName eq "flavio-di-virgilio.cfm"){
            basePath = "/flavio-di-virgilio";
        } else if(fileName eq "coldfusion-development.cfm"){
            basePath = "/coldfusion-development";
        }
        request.langSwitchUrl = (session.lan eq "es") ? basePath : ("/es" & basePath);
        if(isDefined("url.category") and fileName eq "tools.cfm"){
            request.langSwitchUrl = request.langSwitchUrl & "?category=" & url.category;
        }

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
            request.pageCanonical = "https://coldfusionexpert.ar" & request.langPrefix & "/tools/" & slug;
            request.pageAlternateEs = "https://coldfusionexpert.ar/es/tools/" & slug;
            request.pageAlternateEn = "https://coldfusionexpert.ar/tools/" & slug;
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
                            {"@type": "ListItem", "position": 1, "name": (session.lan eq "es") ? "Herramientas" : "Tools", "item": "https://coldfusionexpert.ar" & request.langPrefix & "/tools"},
                            {"@type": "ListItem", "position": 2, "name": categoryLabel, "item": "https://coldfusionexpert.ar" & request.langPrefix & "/tools?category=" & tool.category},
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
            request.pageCanonical = "https://coldfusionexpert.ar" & request.langPrefix & "/tools";
            request.pageAlternateEs = "https://coldfusionexpert.ar/es/tools";
            request.pageAlternateEn = "https://coldfusionexpert.ar/tools";
            request.isToolsSection = true;
        } else if(fileName eq "flavio-di-virgilio.cfm"){
            request.isAboutPage = true;
            request.pageTitle = (session.lan eq "es")
                ? "Sobre mi y trayectoria | Flavio Di Virgilio"
                : "About Me & Resume | Flavio Di Virgilio";
            request.pageDescription = (session.lan eq "es")
                ? "Trayectoria, experiencia y habilidades de Flavio Di Virgilio: desarrollo de software, ColdFusion/Lucee, AWS, APIs, WordPress y automatizacion con IA."
                : "Flavio Di Virgilio's experience and expertise across software development, ColdFusion/Lucee, AWS, APIs, WordPress, and AI automation.";
            request.pageKeywords = (session.lan eq "es")
                ? "Flavio Di Virgilio, curriculum ColdFusion, desarrollador senior, Lucee, AWS, APIs, WordPress, automatizacion IA"
                : "Flavio Di Virgilio, ColdFusion resume, senior developer, Lucee, AWS, APIs, WordPress, AI automation";
            request.pageCanonical = "https://coldfusionexpert.ar" & request.langPrefix & "/flavio-di-virgilio";
            request.pageAlternateEs = "https://coldfusionexpert.ar/es/flavio-di-virgilio";
            request.pageAlternateEn = "https://coldfusionexpert.ar/flavio-di-virgilio";
            request.pageOgTitle = request.pageTitle;
            request.pageOgDescription = request.pageDescription;
            request.pageOgUrl = request.pageCanonical;
        } else if(fileName eq "coldfusion-development.cfm"){
            request.isColdFusionPage = true;
            request.pageTitle = (session.lan eq "es")
                ? "Desarrollo, Soporte y Modernización ColdFusion | ColdFusion Expert"
                : "ColdFusion Development, Support & Modernization | ColdFusion Expert";
            request.pageDescription = (session.lan eq "es")
                ? "Soporte y desarrollo senior para mantener, modernizar, optimizar y ampliar aplicaciones existentes de ColdFusion, Lucee y CFML."
                : "Senior ColdFusion and Lucee development support for maintaining, modernizing, optimizing, and extending existing CFML applications.";
            request.pageKeywords = (session.lan eq "es")
                ? "desarrollo ColdFusion, soporte ColdFusion, desarrollador Lucee, modernización CFML, actualización ColdFusion, optimización SQL Server"
                : "ColdFusion development, ColdFusion support, Lucee developer, CFML modernization, ColdFusion upgrade, SQL Server optimization";
            request.pageCanonical = "https://coldfusionexpert.ar" & request.langPrefix & "/coldfusion-development";
            request.pageAlternateEs = "https://coldfusionexpert.ar/es/coldfusion-development";
            request.pageAlternateEn = "https://coldfusionexpert.ar/coldfusion-development";
            request.pageOgTitle = request.pageTitle;
            request.pageOgDescription = request.pageDescription;
            request.pageOgUrl = request.pageCanonical;
        } else if(fileName eq "index.cfm"){
            request.isHomePage = true;
            request.pageCanonical = "https://coldfusionexpert.ar" & request.langPrefix & "/";
            request.pageAlternateEs = "https://coldfusionexpert.ar/es/";
            request.pageAlternateEn = "https://coldfusionexpert.ar/";
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
