<cfif not isDefined("request.toolsRegistry")>
  <cfinclude template="_tools-registry.cfm">
</cfif>
<cfset local.sbCurrentFile = listLast(cgi.script_name, "/")>
<cfset local.sbIsEs = (session.lan eq "es")>
<cfoutput>
<nav class="tools-sidebar">
  <a href="/tools.cfm" class="tools-sidebar-home<cfif local.sbCurrentFile eq 'tools.cfm'> active</cfif>">
    <i class="fas fa-toolbox"></i> <cfif local.sbIsEs>Todas las Herramientas<cfelse>All Tools</cfif>
  </a>
  <cfloop array="#request.toolCategories#" index="local.sbCat">
    <div class="tools-sidebar-category">
      <h6><i class="fas #local.sbCat.icon#"></i> <cfif local.sbIsEs>#local.sbCat.labelEs#<cfelse>#local.sbCat.labelEn#</cfif></h6>
      <ul>
        <cfloop array="#request.toolOrder#" index="local.sbSlug">
          <cfset local.sbTool = request.toolsRegistry[local.sbSlug]>
          <cfif local.sbTool.category eq local.sbCat.slug>
            <li>
              <a href="/tools/#local.sbSlug#.cfm"<cfif local.sbCurrentFile eq local.sbSlug & '.cfm'> class="active"</cfif>>
                <i class="#local.sbTool.iconPrefix# #local.sbTool.icon#"></i>
                <cfif local.sbIsEs>#local.sbTool.titleEs#<cfelse>#local.sbTool.titleEn#</cfif>
              </a>
            </li>
          </cfif>
        </cfloop>
      </ul>
    </div>
  </cfloop>
</nav>
</cfoutput>
