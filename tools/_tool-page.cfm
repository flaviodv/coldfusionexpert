<cfif not isDefined("request.toolsRegistry")>
  <cfinclude template="_tools-registry.cfm">
</cfif>
<cfset local.tool = request.toolsRegistry[local.slug]>
<cfset local.cat = "">
<cfloop array="#request.toolCategories#" index="local.c">
  <cfif local.c.slug eq local.tool.category>
    <cfset local.cat = local.c>
  </cfif>
</cfloop>
<cfset local.isEs = (session.lan eq "es")>
<cfset local.title = local.isEs ? local.tool.titleEs : local.tool.titleEn>
<cfset local.desc = local.isEs ? local.tool.descEs : local.tool.descEn>
<cfset local.catLabel = local.isEs ? local.cat.labelEs : local.cat.labelEn>
<div class="tools-layout">
  <cfinclude template="_sidebar.cfm">
  <cfoutput>
  <main class="tools-main">
    <p class="tools-breadcrumb">
      <a href="/tools.cfm"><cfif local.isEs>Herramientas<cfelse>Tools</cfif></a>
      <i class="fas fa-angle-right"></i> #local.catLabel#
      <i class="fas fa-angle-right"></i> #local.title#
    </p>
    <div class="tool-header">
      <div class="tool-header-icon"><i class="#local.tool.iconPrefix# #local.tool.icon#"></i></div>
      <h1>#local.title#</h1>
    </div>
    <div class="tool-placeholder">
      <i class="fas fa-hammer"></i>
      <p><cfif local.isEs>Esta herramienta está en construcción. ¡Muy pronto vas a poder usarla acá mismo!<cfelse>This tool is under construction. You'll be able to use it right here very soon!</cfif></p>
    </div>
    <div class="tool-description">
      <p>#local.desc#</p>
    </div>
    <div class="tool-actions">
      <a href="/tools.cfm" class="btn-social btn-linkedin">
        <i class="fas fa-arrow-left"></i> <cfif local.isEs>Volver a Herramientas<cfelse>Back to Tools</cfif>
      </a>
      <a href="https://wa.me/5492236026142?text=<cfif local.isEs>Hola%20Flavio,%20me%20interesar%C3%ADa%20que%20prioricen%20la%20herramienta%20#UrlEncodedFormat(local.title)#<cfelse>Hello%20Flavio,%20I%20would%20like%20you%20to%20prioritize%20the%20#UrlEncodedFormat(local.title)#%20tool</cfif>" target="_blank" class="btn-social btn-upwork">
        <i class="fab fa-whatsapp"></i> <cfif local.isEs>Pedir que la prioricen<cfelse>Ask us to prioritize it</cfif>
      </a>
    </div>
  </main>
  </cfoutput>
</div>
