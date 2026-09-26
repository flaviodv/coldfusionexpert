<div id="projects" class="pricing-tables">
  <div class="container">
    <div class="row">
      <div class="col-lg-8 offset-lg-2">
        <div class="section-heading">
          <h4><cfoutput>#local.homeProjectsHeading#</cfoutput></h4>
          <img src="/assets/images/heading-line-dec.png" alt="">
          <p><cfoutput>#local.homeProjectsIntro#</cfoutput></p>
        </div>
      </div>
      <div class="col-12">
        <div class="projects-tabs" role="tablist" aria-label="<cfoutput>#local.homeProjectsTabsAria#</cfoutput>">
          <button type="button" class="projects-tab is-active" id="projects-tab-own" role="tab" aria-selected="true" aria-controls="projects-grid" data-project-tab="own">
            <i class="fas fa-cubes" aria-hidden="true"></i> <cfoutput>#local.homeProjectsOwnLabel#</cfoutput>
          </button>
          <button type="button" class="projects-tab" id="projects-tab-client" role="tab" aria-selected="false" aria-controls="projects-grid" data-project-tab="client" tabindex="-1">
            <i class="fas fa-briefcase" aria-hidden="true"></i> <cfoutput>#local.homeProjectsClientLabel#</cfoutput>
          </button>
        </div>
      </div>
      <div class="col-12">
        <div id="projects-grid" class="row projects-grid" role="tabpanel" aria-live="polite" data-project-own-label="<cfoutput>#local.homeProjectsOwnLabel#</cfoutput>" data-project-client-label="<cfoutput>#local.homeProjectsClientLabel#</cfoutput>" aria-label="<cfoutput>#local.homeProjectsOwnLabel#</cfoutput>">
          <cfoutput><cfloop array="#local.homeProjectItems#" index="local.project">
            <article class="col-lg-4 col-md-6 project-card<cfif local.project.type eq 'client'> is-filtered-out</cfif>" data-project-card data-project-type="#local.project.type#" aria-hidden="<cfif local.project.type eq 'client'>true<cfelse>false</cfif>">
              <div class="pricing-item-pro">
                <cfif structKeyExists(local.project, "logo") AND len(local.project.logo)>
                  <div class="project-card-logo<cfif structKeyExists(local.project, "logoTheme") AND len(local.project.logoTheme)> project-card-logo-#local.project.logoTheme#</cfif>">
                    <img src="#local.project.logo#" class="project-card-logo-image" alt="#encodeForHTMLAttribute(local.project.logoAlt)#" loading="lazy">
                    <cfif structKeyExists(local.project, "logoText") AND len(local.project.logoText)><span class="project-card-logo-word">#local.project.logoText#</span></cfif>
                  </div>
                <cfelse>
                  <div class="project-card-logo project-card-logo-fallback" aria-label="#encodeForHTMLAttribute(local.project.title)# logo">
                    <span class="project-card-logo-mark">#local.project.logoText#</span>
                  </div>
                </cfif>
                <h4>#local.project.title#</h4>
                <span class="project-card-label">#local.project.label#</span>
                <div class="icon">
                  <img src="#local.project.image#" class="project-card-image" alt="#encodeForHTMLAttribute(local.project.alt)#">
                </div>
                <p class="project-card-description">#local.project.description#</p>
                <ul class="project-card-details">
                  <li><i class="fas fa-check-circle" aria-hidden="true"></i><strong>#local.homeProjectsTechLabel#</strong>: #local.project.technologies#</li>
                  <cfloop array="#local.project.details#" index="local.detail"><li><i class="fas fa-check-circle" aria-hidden="true"></i>#local.detail#</li></cfloop>
                </ul>
                <div class="project-card-links">
                  <cfif len(local.project.siteUrl)>
                    <a href="#local.project.siteUrl#" target="_blank" rel="noopener" class="project-visit-link"><i class="fas fa-external-link-alt" aria-hidden="true"></i> #local.project.siteLabel#</a>
                  </cfif>
                  <a href="#local.project.contactUrl#" target="_blank" rel="noopener" class="btn-social btn-upwork project-contact-link"><i class="fab fa-whatsapp" aria-hidden="true"></i> #local.homeProjectsContactLabel#</a>
                </div>
              </div>
            </article>
          </cfloop></cfoutput>
        </div>
      </div>
    </div>
  </div>
</div>
