<cfif not isDefined("request.toolsRegistry")>
  <cfinclude template="_tools-registry.cfm">
</cfif>
<cfset local.sbCurrentFile = listLast(cgi.script_name, "/")>
<cfset local.sbIsEs = (session.lan eq "es")>
<cfset local.sbActiveCategory = "">
<cfloop array="#request.toolOrder#" index="local.sbSlugCheck">
  <cfif local.sbCurrentFile eq local.sbSlugCheck & '.cfm'>
    <cfset local.sbActiveCategory = request.toolsRegistry[local.sbSlugCheck].category>
  </cfif>
</cfloop>
<cfif local.sbActiveCategory eq "" and isDefined("url.category")>
  <cfloop array="#request.toolCategories#" index="local.sbCatCheck">
    <cfif local.sbCatCheck.slug eq url.category>
      <cfset local.sbActiveCategory = url.category>
    </cfif>
  </cfloop>
</cfif>
<cfoutput>
<nav class="tools-sidebar">
  <a href="/tools" class="tools-sidebar-home<cfif local.sbCurrentFile eq 'tools.cfm'> active</cfif>">
    <i class="fas fa-toolbox"></i> <cfif local.sbIsEs>Todas las Herramientas<cfelse>All Tools</cfif>
  </a>
  <cfloop array="#request.toolCategories#" index="local.sbCat">
    <div class="tools-sidebar-category<cfif local.sbActiveCategory eq local.sbCat.slug> open</cfif>" data-category="#local.sbCat.slug#">
      <button type="button" class="tools-sidebar-cat-toggle" aria-expanded="<cfif local.sbActiveCategory eq '' or local.sbActiveCategory eq local.sbCat.slug>true<cfelse>false</cfif>">
        <span><i class="fas #local.sbCat.icon#"></i> <cfif local.sbIsEs>#local.sbCat.labelEs#<cfelse>#local.sbCat.labelEn#</cfif></span>
        <i class="fas fa-chevron-down tools-sidebar-chevron"></i>
      </button>
      <ul>
        <cfloop array="#request.toolOrder#" index="local.sbSlug">
          <cfset local.sbTool = request.toolsRegistry[local.sbSlug]>
          <cfif local.sbTool.category eq local.sbCat.slug>
            <li>
              <a href="/tools/#local.sbSlug#"<cfif local.sbCurrentFile eq local.sbSlug & '.cfm'> class="active"</cfif>>
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
