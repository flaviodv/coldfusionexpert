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

    if(!findNoCase(".cfc", arguments.targetPage)){
        include "tools/_tools-registry.cfm";

        var fileName = getFileFromPath(arguments.targetPage);
        var slug = listFirst(fileName, ".");
        request.isToolsSection = false;
        if(structKeyExists(request.toolsRegistry, slug)){
            var tool = request.toolsRegistry[slug];
            request.pageTitle = (session.lan eq "es")
                ? tool.titleEs & " | ColdFusion Expert"
                : tool.titleEn & " | ColdFusion Expert";
            request.pageCanonical = "https://coldfusionexpert.ar/tools/" & slug & ".cfm?lan=" & session.lan;
            request.pageNoindex = !tool.built;
            request.isToolsSection = true;
        } else if(fileName eq "tools.cfm"){
            request.pageTitle = (session.lan eq "es")
                ? "Nuestras Herramientas Gratuitas | ColdFusion Expert"
                : "Our Free Tools | ColdFusion Expert";
            request.pageCanonical = "https://coldfusionexpert.ar/tools.cfm?lan=" & session.lan;
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
    if(!findNoCase(".cfc", arguments.targetPage)){
        if(session.lan eq "es"){
            include "footer_es.cfm";
        } else {
            include "footer_en.cfm";
        }
    }
}
}
