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
