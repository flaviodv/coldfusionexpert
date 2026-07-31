component {
this.Name="ColdfusionExpert";
this.SessionManagement=true;
this.SessionTimeout=CreateTimeSpan(0,1,0,0);
this.ClientManagement=true;
this.scriptProtect=true;
this.mappings = structNew();
this.mappings["/assets"] = getDirectoryFromPath(getCurrentTemplatePath()) & "assets/";
this.mappings["/cfexpertCFC"] = getDirectoryFromPath(getCurrentTemplatePath()) & "cfc/";

function onRequest(targetPage){
    SetEncoding("form", "utf-8");
    SetEncoding("url", "utf-8");
    getPageContext().getResponse().setContentType("text/html; charset=UTF-8");
    getPageContext().getResponse().setHeader("Content-Type", "text/html; charset=UTF-8");
    setLocale("es_AR");
    request.targetPage=targetPage;
    include arguments.targetPage;
    return true;
}
}
