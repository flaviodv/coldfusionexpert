<cfif not isDefined("request.toolsRegistry")>
  <cfinclude template="tools/_tools-registry.cfm">
</cfif>
<div class="tools-layout">
  <cfinclude template="tools/_sidebar.cfm">
  <cfoutput>
  <main class="tools-main">
    <div class="tools-hero">
      <h1>Nuestras Herramientas Gratuitas</h1>
      <p>Creadas por nosotros: una colección creciente de herramientas gratuitas para desarrolladores, marketing y productividad diaria, 100% desde el navegador. Elegí una categoría a la izquierda o recorré todas abajo.</p>
    </div>
    <cfloop array="#request.toolCategories#" index="local.cat">
      <section class="tools-category-section" id="#local.cat.slug#">
        <h2><i class="fas #local.cat.icon#"></i> #local.cat.labelEs#</h2>
        <div class="tools-grid">
          <cfloop array="#request.toolOrder#" index="local.slug">
            <cfset local.tool = request.toolsRegistry[local.slug]>
            <cfif local.tool.category eq local.cat.slug>
              <div class="tool-card">
                <div class="tool-card-icon"><i class="#local.tool.iconPrefix# #local.tool.icon#"></i></div>
                <h4>#local.tool.titleEs#</h4>
                <p>#local.tool.descEs#</p>
                <a href="/tools/#local.slug#.cfm" class="btn-social btn-linkedin">
                  <i class="fas fa-arrow-right"></i> Ver Herramienta
                </a>
              </div>
            </cfif>
          </cfloop>
        </div>
      </section>
    </cfloop>
  </main>
  </cfoutput>
</div>
