<cfif not isDefined("request.toolsRegistry")>
  <cfinclude template="tools/_tools-registry.cfm">
</cfif>
<div class="tools-layout">
  <cfinclude template="tools/_sidebar.cfm">
  <cfoutput>
  <main class="tools-main">
    <div class="tools-hero">
      <h1>Our Free Tools</h1>
      <p>Built in-house by us: a growing collection of free browser-based tools for developers, marketers, and everyday productivity. Pick a category on the left, or browse everything below.</p>
    </div>
    <cfloop array="#request.toolCategories#" index="local.cat">
      <section class="tools-category-section" id="#local.cat.slug#">
        <h2><i class="fas #local.cat.icon#"></i> #local.cat.labelEn#</h2>
        <div class="tools-grid">
          <cfloop array="#request.toolOrder#" index="local.slug">
            <cfset local.tool = request.toolsRegistry[local.slug]>
            <cfif local.tool.category eq local.cat.slug>
              <div class="tool-card">
                <div class="tool-card-icon"><i class="#local.tool.iconPrefix# #local.tool.icon#"></i></div>
                <h4>#local.tool.titleEn#</h4>
                <p>#local.tool.descEn#</p>
                <a href="/tools/#local.slug#.cfm" class="btn-social btn-linkedin">
                  <i class="fas fa-arrow-right"></i> View Tool
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
