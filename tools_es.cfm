<cfif not isDefined("request.toolsRegistry")>
  <cfinclude template="tools/_tools-registry.cfm">
</cfif>
<cfset local.activeCategory = "all">
<cfif isDefined("url.category")>
  <cfloop array="#request.toolCategories#" index="local.catCheck">
    <cfif local.catCheck.slug eq url.category>
      <cfset local.activeCategory = url.category>
    </cfif>
  </cfloop>
</cfif>
<div class="tools-layout">
  <cfinclude template="tools/_sidebar.cfm">
  <cfoutput>
  <main class="tools-main">
    <div class="tools-hero">
      <h1>Nuestras Herramientas Gratuitas</h1>
      <p>Creadas por nosotros: una colección creciente de herramientas gratuitas para desarrolladores, marketing y productividad diaria, 100% desde el navegador. Elegí una categoría a la izquierda o recorré todas abajo.</p>
    </div>
    <div class="tools-chip-filter">
      <button type="button" class="tool-chip<cfif local.activeCategory eq 'all'> active</cfif>" data-filter="all">Todos</button>
      <cfloop array="#request.toolCategories#" index="local.cat">
        <button type="button" class="tool-chip<cfif local.activeCategory eq local.cat.slug> active</cfif>" data-filter="#local.cat.slug#"><i class="fas #local.cat.icon#"></i> #local.cat.labelEs#</button>
      </cfloop>
    </div>
    <cfloop array="#request.toolCategories#" index="local.cat">
      <section class="tools-category-section<cfif local.activeCategory neq 'all' and local.activeCategory neq local.cat.slug> tools-category-hidden</cfif>" id="#local.cat.slug#" data-category="#local.cat.slug#">
        <h2><i class="fas #local.cat.icon#"></i> #local.cat.labelEs#</h2>
        <div class="tools-grid">
          <cfloop array="#request.toolOrder#" index="local.slug">
            <cfset local.tool = request.toolsRegistry[local.slug]>
            <cfif local.tool.category eq local.cat.slug>
              <div class="tool-card">
                <div class="tool-card-icon"><i class="#local.tool.iconPrefix# #local.tool.icon#"></i></div>
                <h4>#local.tool.titleEs#</h4>
                <p>#local.tool.descEs#</p>
                <a href="/tools/#local.slug#.cfm" class="btn-social btn-linkedin<cfif not local.tool.built> tool-card-unbuilt</cfif>">
                  <i class="fas <cfif local.tool.built>fa-arrow-right<cfelse>fa-hammer</cfif>"></i> <cfif local.tool.built>Ver Herramienta<cfelse>Próximamente</cfif>
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
