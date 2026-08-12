  <div class="main-banner home-solutions-hero wow fadeIn" id="top" data-wow-duration="1s" data-wow-delay="0.3s">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="row">
            <div class="col-lg-6 align-self-center">
              <div class="left-content show-up header-text wow fadeInLeft" data-wow-duration="1s" data-wow-delay="1s">
                <div class="row">
                  <div class="col-lg-12">
                    <span class="hero-kicker">Development · Modernization · Automation</span>
                    <h1 class="hero-business-title">Software solutions.<em>Built for real business.</em></h1>
                    <p class="hero-business-copy">We design, modernize, and connect systems that power real operations: web applications, APIs, AI automation, WordPress, and cloud infrastructure. <strong>ColdFusion and Lucee</strong> remain a deep specialization—not a limitation.</p>
                    <div class="hero-cta-row scroll-to-section">
                      <a href="#services" class="hero-cta hero-cta-primary"><i class="fas fa-arrow-right"></i> Explore solutions</a>
                      <a href="#tools" class="hero-cta hero-cta-secondary"><i class="fas fa-toolbox"></i> Use free tools</a>
                    </div>
                    <div class="hero-capabilities" aria-label="Core capabilities">
                      <span>Custom Software</span><span>APIs &amp; Integrations</span><span>AI Automation</span><span>WordPress</span><span>ColdFusion / Lucee</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="solutions-visual wow fadeInRight" data-wow-duration="1s" data-wow-delay="0.45s" aria-label="Connected software solutions architecture">
                <div class="solutions-visual-header"><span>Software ecosystem</span><span class="solutions-visual-status">Operational</span></div>
                <cfscript>
                  local.hmCategoryLabels = {};
                  local.hmToolTotal = 0;
                  for (local.hmCat in request.toolCategories) local.hmCategoryLabels[local.hmCat.slug] = local.hmCat.labelEn;
                  for (local.hmCountSlug in request.toolOrder) if (request.toolsRegistry[local.hmCountSlug].built) local.hmToolTotal++;
                </cfscript>
                <div id="hero-tools-marquee" class="hero-tools-marquee" aria-label="Free tools created">
                <div class="hero-tools-marquee-header"><div class="hero-tools-marquee-title"><span><i class="fas fa-toolbox"></i> Tools I've built</span><a href="/tools.cfm" class="hero-tools-all-link">View all <i class="fas fa-arrow-right"></i></a></div><div class="hero-tools-marquee-meta"><cfoutput><span class="hero-tools-counter"><strong data-tool-current>01</strong> / #numberFormat(local.hmToolTotal, '00')#</span></cfoutput><small><i class="fas fa-pause"></i> Hover to pause</small></div></div>
                <div class="hero-tools-marquee-viewport" tabindex="0">
                  <div class="hero-tools-marquee-track">
                    <div class="hero-tools-marquee-list">
                      <cfset local.hmLastCategory = ""><cfset local.hmToolNumber = 0>
                      <cfoutput><cfloop array="#request.toolOrder#" index="local.hmSlug"><cfset local.hmTool = request.toolsRegistry[local.hmSlug]><cfif local.hmTool.built><cfif local.hmTool.category neq local.hmLastCategory><div class="hero-tools-category"><span>#local.hmCategoryLabels[local.hmTool.category]#</span></div><cfset local.hmLastCategory = local.hmTool.category></cfif><cfset local.hmToolNumber++><a href="/tools/#local.hmSlug#" data-tool-index="#local.hmToolNumber#" data-tool-tooltip="#encodeForHTMLAttribute(local.hmTool.descEn)#" aria-label="#encodeForHTMLAttribute(local.hmTool.titleEn)#. #encodeForHTMLAttribute(local.hmTool.descEn)#"><span class="hero-tool-sequence">#numberFormat(local.hmToolNumber, '00')#</span><i class="#local.hmTool.iconPrefix# #local.hmTool.icon#"></i><span>#local.hmTool.titleEn#</span><i class="fas fa-arrow-right"></i></a></cfif></cfloop></cfoutput>
                    </div>
                    <div class="hero-tools-marquee-list" aria-hidden="true">
                      <cfset local.hmLastCategoryRepeat = ""><cfset local.hmToolNumberRepeat = 0>
                      <cfoutput><cfloop array="#request.toolOrder#" index="local.hmSlugRepeat"><cfset local.hmToolRepeat = request.toolsRegistry[local.hmSlugRepeat]><cfif local.hmToolRepeat.built><cfif local.hmToolRepeat.category neq local.hmLastCategoryRepeat><div class="hero-tools-category"><span>#local.hmCategoryLabels[local.hmToolRepeat.category]#</span></div><cfset local.hmLastCategoryRepeat = local.hmToolRepeat.category></cfif><cfset local.hmToolNumberRepeat++><a href="/tools/#local.hmSlugRepeat#" tabindex="-1" data-tool-index="#local.hmToolNumberRepeat#" data-tool-tooltip="#encodeForHTMLAttribute(local.hmToolRepeat.descEn)#"><span class="hero-tool-sequence">#numberFormat(local.hmToolNumberRepeat, '00')#</span><i class="#local.hmToolRepeat.iconPrefix# #local.hmToolRepeat.icon#"></i><span>#local.hmToolRepeat.titleEn#</span><i class="fas fa-arrow-right"></i></a></cfif></cfloop></cfoutput>
                    </div>
                  </div>
                </div>
              </div>
                <div class="solutions-visual-grid">
                  <div class="solution-node"><i class="fas fa-layer-group"></i><span class="solution-node-arrow">↗</span><h3>Business platforms</h3><p>Stable, scalable systems built to evolve.</p></div>
                  <div class="solution-node"><i class="fas fa-random"></i><span class="solution-node-arrow">↗</span><h3>APIs &amp; integrations</h3><p>Data and tools working together.</p></div>
                  <div class="solution-node"><i class="fas fa-robot"></i><span class="solution-node-arrow">↗</span><h3>AI &amp; automation</h3><p>Less repetitive work, better decisions.</p></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <section id="coldfusion-services" class="services section home-cf-services-band">
    <div class="container">
      <div class="row">
        <div class="col-12 text-center">
          <div class="section-heading wow fadeInDown" data-wow-duration="1s">
            <h4><em>ColdFusion Services</em></h4>
            <img src="/assets/images/heading-line-dec.png" alt="">
            <p>Senior support for the CFML applications your business already depends on.</p>
          </div>
        </div>
      </div>
      <div class="row"><div class="col-12 text-center mb-4"><a href="/coldfusion-development" class="home-cf-services-link">View All CF Services <i class="fas fa-arrow-right" aria-hidden="true"></i></a></div></div>
      <div class="row g-4">
        <div class="col-md-6 col-lg-3"><a class="home-cf-service-card" href="/coldfusion-development#legacy-support"><i class="fas fa-life-ring" aria-hidden="true"></i><h3>Legacy ColdFusion Support</h3><span>Maintain and stabilize existing CFML systems <i class="fas fa-arrow-right" aria-hidden="true"></i></span></a></div>
        <div class="col-md-6 col-lg-3"><a class="home-cf-service-card" href="/coldfusion-development#upgrades-migration"><i class="fas fa-sync-alt" aria-hidden="true"></i><h3>ColdFusion &amp; Lucee Upgrades</h3><span>Plan practical upgrades with less disruption <i class="fas fa-arrow-right" aria-hidden="true"></i></span></a></div>
        <div class="col-md-6 col-lg-3"><a class="home-cf-service-card" href="/coldfusion-development#performance-security"><i class="fas fa-shield-alt" aria-hidden="true"></i><h3>Performance &amp; Security Optimization</h3><span>Improve reliability, speed, and code quality <i class="fas fa-arrow-right" aria-hidden="true"></i></span></a></div>
        <div class="col-md-6 col-lg-3"><a class="home-cf-service-card" href="/coldfusion-development#api-modernization"><i class="fas fa-plug" aria-hidden="true"></i><h3>API Integrations &amp; Modernization</h3><span>Connect CFML with modern services and interfaces <i class="fas fa-arrow-right" aria-hidden="true"></i></span></a></div>
      </div>
      <a href="/coldfusion-development#hosting" class="home-cf-hosting-callout"><span class="home-cf-hosting-icon"><i class="fas fa-server" aria-hidden="true"></i></span><span><strong>Managed Multi-Technology Hosting</strong><small>Host PHP and Adobe ColdFusion applications with SQL Server or MySQL and a practical management panel.</small></span><i class="fas fa-arrow-right home-cf-hosting-arrow" aria-hidden="true"></i></a>
    </div>
  </section>
  <!-- Section rail navigation: displayed on desktop only. -->
  <nav class="section-rail" aria-label="Section navigation">
    <ul class="section-rail-list">
      <li><a href="#top" class="section-rail-link" data-rail-target="top" data-section-label="Home" aria-label="Go to Home"><span class="section-rail-label">Home</span></a></li>
      <li><a href="#coldfusion-services" class="section-rail-link" data-rail-target="coldfusion-services" data-section-label="ColdFusion Services" aria-label="Go to ColdFusion Services"><span class="section-rail-label">ColdFusion Services</span></a></li>
      <li><a href="#services" class="section-rail-link" data-rail-target="services" data-section-label="Specialized services" aria-label="Go to Specialized services"><span class="section-rail-label">Specialized services</span></a></li>
      <li><a href="#seo" class="section-rail-link" data-rail-target="seo" data-section-label="SEO / GEO" aria-label="Go to SEO and GEO"><span class="section-rail-label">SEO / GEO</span></a></li>
      <li><a href="#automation" class="section-rail-link" data-rail-target="automation" data-section-label="AI automation" aria-label="Go to AI automation"><span class="section-rail-label">AI automation</span></a></li>
      <li><a href="#courses" class="section-rail-link" data-rail-target="courses" data-section-label="Zoom courses" aria-label="Go to Zoom courses"><span class="section-rail-label">Zoom courses</span></a></li>
      <li><a href="#tools" class="section-rail-link" data-rail-target="tools" data-section-label="Tools" aria-label="Go to Tools"><span class="section-rail-label">Tools</span></a></li>
      <li><a href="#pricing" class="section-rail-link" data-rail-target="pricing" data-section-label="Experience and projects" aria-label="Go to Experience and projects"><span class="section-rail-label">Experience and projects</span></a></li>
      <li><a href="#Contact" class="section-rail-link" data-rail-target="Contact" data-section-label="Contact" aria-label="Go to Contact"><span class="section-rail-label">Contact</span></a></li>
    </ul>
  </nav>
  <div id="services" class="services section">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 offset-lg-2">
          <div class="section-heading  wow fadeInDown" data-wow-duration="1s" data-wow-delay="0.5s">
            <h4> <em>Specialized Services </em> </h4>
            <img src="/assets/images/heading-line-dec.png" alt="">
            <p>End-to-end development, architecture, and server management services for ColdFusion and Cloud applications:</p>
          </div>
        </div>
      </div>
    </div>
    <div class="container">
      <div class="row">
        <div class="col-lg-4">
          <div class="service-item first-service">
            <div style="text-align:left!important">
              <picture>
                <source class="servce_img" srcset="/assets/images/ColdFusion%20Consulting%20Service.svg" type="image/svg+xml">
                <img class="servce_img " src="/assets/images/ColdFusion Consulting Service.svg" alt="ColdFusion Consulting Service" width="40" height="40">
              </picture>
            </div>
             <h4>ColdFusion Consulting Service</h4>
             <p> We tailor strategies to align with your business objectives. 
              Comprehensive infrastructure evaluation, bottleneck diagnostics with FusionReactor, and legacy code refactoring. <br>
              <span class="highligth">The goal?</span> Maximize efficiency, security, and performance across CF4 to Adobe ColdFusion 2025 and Lucee Server.
             </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hello%20Flavio,%20I%20would%20like%20to%20inquire%20about%20ColdFusion%20Consulting" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Inquire via WhatsApp
              </a>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="service-item second-service">
            <div >
              <picture>
                <source class="servce_img" srcset="/assets/images/ColdFusion%20Web%20Application%20Development.svg" type="image/svg+xml">
                <img class="servce_img " src="/assets/images/ColdFusion Web Application Development.svg" alt="ColdFusion Web Application Development" width="40" height="40">
            </picture></div>
           <h4>Custom Web Application Development</h4>
           <p>Expertise in developing scalable, secure, and cutting-edge web applications. 
            Experience in enterprise CRMs, healthcare diagnostics (NQMBC), e-commerce platforms, and database-centric systems. <br>
            <span class="highligth">The benefit?</span> Streamlined operations, clean architecture, and enhanced digital presence.
            </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hello%20Flavio,%20I%20would%20like%20to%20inquire%20about%20Custom%20Web%20Application%20Development" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Inquire via WhatsApp
              </a>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="service-item third-service">
            <div >
              <picture>
                <source class="servce_img" srcset="/assets/images/ColdFusion%20Web%20Service%20Development.svg" type="image/svg+xml">
                <img class="servce_img " src="/assets/images/ColdFusion Web Service Development.svg" alt="ColdFusion Web Service Development" width="40" height="40">
            </picture></div>
            <h4>API Integration &amp; RESTful Web Services</h4>
            <p>Building and integrating RESTful web services for seamless inter-system communication.
              Proven track record of integrating third-party platforms such as JustCall, Zoom, Calendly, payment gateways, and JWT authentication.</p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hello%20Flavio,%20I%20would%20like%20to%20inquire%20about%20API%20Integration" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Inquire via WhatsApp
              </a>
            </div>
          </div>
        </div>
      </div>
      <div class="row" style="margin-top: 30px;">
        <div class="col-lg-4">
          <div class="service-item fourth-service">
            <div >
              <picture>
                <source class="servce_img" srcset="/assets/images/ColdFusion%20CMS%20Development.svg" type="image/svg+xml">
                <img class="servce_img " src="/assets/images/ColdFusion CMS Development.svg" alt="ColdFusion CMS & CRM Development" width="40" height="40">
            </picture></div>
            <h4>ColdFusion CMS &amp; CRM Development</h4>
            <p>Intuitive, powerful, and tailored systems for lead management, customer tracking, commissions, and digital content delivery.
              Experience managing Svetness CRM, Makeway client portals (Darran, Trinity, Peter Pepper), and multi-store platforms (800wine.com).
            </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hello%20Flavio,%20I%20would%20like%20to%20inquire%20about%20ColdFusion%20CMS%20&%20CRM" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Inquire via WhatsApp
              </a>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="service-item first-service">
            <div >
              <picture>
                <source class="servce_img" srcset="/assets/images/ColdFusion%20Maintenance%20and%20Enhancement.svg" type="image/svg+xml">
                <img class="servce_img " src="/assets/images/ColdFusion Maintenance and Enhancement.svg" alt="ColdFusion Maintenance and AWS Administration" width="40" height="40">
            </picture></div>
             <h4>AWS Cloud Administration &amp; Server Maintenance</h4>
             <p>Expert administration of staging and production environments on AWS (EC2, RDS MSSQL/MySQL, S3) and IIS Server on Windows/Linux.
               Proactive support, regular security patching, automated backups, and 24/7 server monitoring. <br>
              <span class="highligth">Your applications?</span> Secure, highly available, and always ahead of technological updates.
            </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hello%20Flavio,%20I%20would%20like%20to%20inquire%20about%20AWS%20Cloud%20&%20Server%20Maintenance" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Inquire via WhatsApp
              </a>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="service-item second-service">
            <div style="text-align:left!important">
              <i class="fas fa-bullhorn" style="font-size: 40px; color: #13aff0;"></i>
            </div>
            <h4>Digital Marketing</h4>
            <p>Digital marketing strategy, social media management, ad campaigns, and online brand growth.
              We are official <strong>Partners of viralify.digital</strong> to boost your business's digital presence.
            </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492281403725?text=Hello%20Viralify,%20I%20would%20like%20to%20inquire%20about%20Digital%20Marketing" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Inquire via WhatsApp
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <cfsavecontent variable="request.homeProjectsSection">
    <div id="pricing" class="pricing-tables">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 offset-lg-2">
          <div class="section-heading">
            <h4>Featured <em>Professional Experience</em> &amp; Projects</h4>
            <img src="/assets/images/heading-line-dec.png" alt="">
            <p>Current enterprise roles, proprietary AI-powered developments, and proven track record.</p>
          </div>
        </div>
        <!-- Card 1: Quebec Attractions -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="pricing-item-pro">
            <h4>Quebec Attractions</h4>
            <span style="font-size: 0.85rem; color: #14a800; font-weight: bold;">Current Role | Lucee Server</span>
            <div class="icon">
            <img src="/assets/images/projects/quebec-attractions.jpg" class="project-card-image" alt="Quebec Attractions">
            </div>
            <ul>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i><strong>Official Website</strong>: <a href="https://quebecattractions.ca/" target="_blank" style="color:#0077b5; font-weight:600;">quebecattractions.ca</a></li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Leading bilingual tourism platform in Quebec (attractions, events, and accommodations).</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Full web application development built in <strong>Lucee CFML</strong>.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Designed and implemented <strong>100% of the UI/UX layout</strong> and responsive design.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Complete server and cloud infrastructure administration.</li>
            </ul>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hello%20Flavio,%20I%20would%20like%20to%20inquire%20about%20Quebec%20Attractions%20Project" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Inquire via WhatsApp
              </a>
            </div>
          </div>
        </div>
        <!-- Card 2: CompraInversa.com -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="pricing-item-pro">
            <h4>CompraInversa.com</h4>
            <span style="font-size: 0.85rem; color: #4b6cb7; font-weight: bold;">Personal Project | ColdFusion + AI</span>
            <div class="icon">
            <img src="/assets/images/projects/comprainversa.jpg" class="project-card-image" alt="CompraInversa">
            </div>
            <ul>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i><strong>Smart Marketplace</strong>: <a href="https://comprainversa.com/" target="_blank" style="color:#0077b5; font-weight:600;">comprainversa.com</a></li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Proprietary marketplace platform connecting purchase procurement demands with competitive seller offers.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Built with <strong>Adobe ColdFusion</strong> and <strong>Microsoft SQL Server</strong>.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Integrated <strong>Artificial Intelligence (AI)</strong> modules for automated requirement matching and smart search optimization.</li>
            </ul>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hello%20Flavio,%20I%20would%20like%20to%20inquire%20about%20CompraInversa.com%20Project" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Inquire via WhatsApp
              </a>
            </div>
          </div>
        </div>
        <!-- Card 3: Firebrand Creative -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="pricing-item-pro">
            <h4>Firebrand Creative</h4>
            <span style="font-size: 0.85rem; color: #14a800; font-weight: bold;">Current Role | WordPress Developer</span>
            <div class="icon">
            <img src="/assets/images/projects/firebrand.webp" class="project-card-image" alt="Firebrand Creative">
            </div>
            <ul>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i><strong>Official Website</strong>: <a href="https://iamfirebrand.com/" target="_blank" style="color:#0077b5; font-weight:600;">iamfirebrand.com</a></li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Current role as a WordPress Developer for a US digital agency.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Work across multiple websites and clients managed by Firebrand Creative.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Content updates, visual improvements, technical support, and server administration.</li>
            </ul>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hello%20Flavio,%20I%20would%20like%20to%20inquire%20about%20Firebrand%20Creative%20Project" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Inquire via WhatsApp
              </a>
            </div>
          </div>
        </div>
        <!-- Card 4: Makeway -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="pricing-item-pro">
            <h4>Makeway &amp; International Clients</h4>
            <span style="font-size: 0.85rem; color: #4b6cb7; font-weight: bold;">Sep 2023 - Present</span>
            <div class="icon">
              <img src="/assets/images/pricing-table-01.png" alt="Makeway">
            </div>
            <ul>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Management and performance enhancement of CMS systems using MySQL and ColdFusion.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Code refactoring and performance optimization for Darran Furniture (darran.com).</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Feature development for Trinity Furniture (trinityfurniture.com) &amp; Peter Pepper Products.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Resolving complex legacy system bugs and enhancing user experience.</li>
            </ul>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hello%20Flavio,%20I%20would%20like%20to%20inquire%20about%20Makeway%20and%20International%20Clients" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Inquire via WhatsApp
              </a>
            </div>
          </div>
        </div>
        <!-- Card 5: Contensive Svetness CRM -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="pricing-item-pro">
            <h4>Contensive - Svetness CRM</h4>
            <span style="font-size: 0.85rem; color: #4b6cb7; font-weight: bold;">Mar 2021 - Oct 2024</span>
            <div class="icon">
              <img src="/assets/images/pricing-table-01.png" alt="Contensive Svetness CRM">
            </div>
            <ul>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Senior Fullstack ColdFusion + SQL Server + AWS development for Svetness CRM.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Communication API integrations: JustCall, Zoom, and Calendly.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>ColdFusion performance tuning using FusionReactor and MSSQL optimization.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>AWS infrastructure management (EC2, RDS snapshots/restores, S3) &amp; Windows Servers.</li>
            </ul>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hello%20Flavio,%20I%20would%20like%20to%20inquire%20about%20Svetness%20CRM%20Project" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Inquire via WhatsApp
              </a>
            </div>
          </div>
        </div>
        <!-- Card 6: Third Wave Digital & FortSystems -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="pricing-item-pro">
            <h4>Third Wave Digital, FortSystems &amp; 2Connect</h4>
            <span style="font-size: 0.85rem; color: #4b6cb7; font-weight: bold;">2011 - 2020</span>
            <div class="icon">
              <img src="/assets/images/pricing-table-01.png" alt="Third Wave Digital">
            </div>
            <ul>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i><strong>Third Wave Digital (2019)</strong>: Internal diagnosis and medical history system for breast cancer patients (NQMBC).</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i><strong>FortSystems (2011-2018)</strong>: Development and administration of 800wine.com and multi-store platforms.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i><strong>2Connect (2018-2020)</strong>: Web platform development using ColdFusion, MySQL, and Bootstrap.</li>
            </ul>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hello%20Flavio,%20I%20would%20like%20to%20inquire%20about%20Healthcare%20&%20E-Commerce%20Projects" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Inquire via WhatsApp
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </cfsavecontent>
  <div id="seo" class="services section" style="padding-top: 80px; padding-bottom: 80px;">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 offset-lg-2">
          <div class="section-heading wow fadeInDown" data-wow-duration="1s" data-wow-delay="0.5s">
            <h4>SEO &amp; GEO (AI) <em>Optimization Services</em></h4>
           
            <img src="/assets/images/heading-line-dec.png" alt="">
            <p>Advanced positioning strategies for traditional search engines (Google, Bing) and visibility optimization for Artificial Intelligence engines (ChatGPT, Perplexity, Claude, Gemini).</p>
          </div>
        </div>
      </div>
      <div class="row">
        <!-- Pillar 1: Search Console & Technical SEO -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="service-item first-service" style="height: 100%; border-top: 4px solid #0077b5;">
            <div style="text-align:left!important">
              <i class="fas fa-search fa-2x" style="color: #0077b5; margin-bottom: 15px;"></i>
            </div>
            <h4>Google Search Console &amp; Technical SEO</h4>
             <p>(Search Engine Optimization)</p>
            <p>
              End-to-end setup and technical audit in <strong>Google Search Console</strong> and <strong>Bing Webmaster Tools</strong>.
              <br><br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Multilingual <strong>sitemap.xml</strong> &amp; <strong>robots.txt</strong> configuration.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Implementation of <strong>canonical</strong> &amp; <strong>hreflang</strong> annotations.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Resolving crawl errors, coverage issues, and indexation gaps.
            </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hello%20Flavio,%20I%20would%20like%20to%20inquire%20about%20Technical%20SEO%20&%20Search%20Console%20Services" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Inquire via WhatsApp
              </a>
            </div>
          </div>
        </div>
        <!-- Pillar 2: GEO & AI Indexation -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="service-item second-service" style="height: 100%; border-top: 4px solid #14a800;">
            <div style="text-align:left!important">
              <i class="fas fa-brain fa-2x" style="color: #14a800; margin-bottom: 15px;"></i>
            </div>
            <h4>GEO &amp; AI Engine Visibility</h4>
             <p>(Generative Engine Optimization)</p>
            <p>
              Structured optimization ensuring AI models (ChatGPT, Perplexity, Claude) accurately recognize and cite your business.
              <br><br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Structured data implementation via <strong>JSON-LD (Schema.org)</strong>.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Explicit crawler permissions for AI bots (GPTBot, ClaudeBot, PerplexityBot).<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Entity graph mapping for high authority and citation relevance.
            </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hello%20Flavio,%20I%20would%20like%20to%20inquire%20about%20GEO%20&%20AI%20Visibility%20Services" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Inquire via WhatsApp
              </a>
            </div>
          </div>
        </div>
        <!-- Pillar 3: WPO & Core Web Vitals -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="service-item third-service" style="height: 100%; border-top: 4px solid #4e4376;">
            <div style="text-align:left!important">
              <i class="fas fa-tachometer-alt fa-2x" style="color: #4e4376; margin-bottom: 15px;"></i>
            </div>
            <h4>Core Web Vitals &amp; WPO Performance</h4>
            <p>
              Ultra-fast page load times and minimal Time to First Byte (TTFB) on ColdFusion, Lucee, IIS, and AWS.
              <br><br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> WebP/AVIF image optimization &amp; JS/CSS minification.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Server-side and database query caching.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Top scores on <strong>Google PageSpeed Insights</strong>.
            </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hello%20Flavio,%20I%20would%20like%20to%20inquire%20about%20WPO%20&%20Core%20Web%20Vitals%20Performance" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Inquire via WhatsApp
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div id="automation" class="services section" style="background-color: #f7f9fc; padding-top: 80px; padding-bottom: 80px;">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 offset-lg-2">
          <div class="section-heading wow fadeInDown" data-wow-duration="1s" data-wow-delay="0.5s">
            <h4>AI Automation <em>Solutions</em></h4>
            <img src="/assets/images/heading-line-dec.png" alt="">
            <p>Integration of Artificial Intelligence, autonomous agents, and smart workflow automation to optimize operational efficiency and accelerate software delivery.</p>
          </div>
        </div>
      </div>
      <div class="row">
        <!-- Card 1: AI API Integration -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="service-item first-service" style="border-top: 4px solid #0077b5;">
            <div style="text-align:left!important">
              <i class="fas fa-network-wired fa-2x" style="color: #0077b5; margin-bottom: 15px;"></i>
            </div>
            <h4>AI API Integration (LLMs)</h4>
            <p>
              Integrating OpenAI, Claude, Gemini, and other leading language models with custom web applications and ColdFusion/Lucee/Node.js backends.
              <br><br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> <strong>RAG</strong> architectures (Retrieval-Augmented Generation) &amp; vector databases.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Intelligent virtual assistants &amp; 24/7 support agents.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Automated processing of unstructured documents, contracts, and text.
            </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hello%20Flavio,%20I%20would%20like%20to%20inquire%20about%20AI%20API%20Integration" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Inquire via WhatsApp
              </a>
            </div>
          </div>
        </div>
        <!-- Card 2: Business Process Automation -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="service-item second-service" style="border-top: 4px solid #14a800;">
            <div style="text-align:left!important">
              <i class="fas fa-cogs fa-2x" style="color: #14a800; margin-bottom: 15px;"></i>
            </div>
            <h4>Business Workflow Automation</h4>
            <p>
              End-to-end intelligent workflow automation across CRMs, ERPs, and E-Commerce platforms.
              <br><br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Automated lead categorization and smart response workflows.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Webhook integrations, automated invoicing, and report generation.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Eliminating repetitive manual tasks, boosting enterprise turnaround times.
            </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hello%20Flavio,%20I%20would%20like%20to%20inquire%20about%20Business%20Workflow%20Automation" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Inquire via WhatsApp
              </a>
            </div>
          </div>
        </div>
        <!-- Card 3: AI-Driven Development -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="service-item third-service" style="border-top: 4px solid #4e4376;">
            <div style="text-align:left!important">
              <i class="fas fa-magic fa-2x" style="color: #4e4376; margin-bottom: 15px;"></i>
            </div>
            <h4>AI-Driven Development</h4>
            <p>
              Advanced prompt engineering and strategic use of AI coding assistants and development tools powered by leading language models for rapid software delivery.
              <br><br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Automated refactoring of legacy ColdFusion codebases.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Instant generation of unit tests and technical documentation.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Accelerating delivery cycles by up to 60% while maintaining peak quality.
            </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hello%20Flavio,%20I%20would%20like%20to%20inquire%20about%20AI-Driven%20Development" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Inquire via WhatsApp
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div id="courses" class="services section" style="background-color: #f7f9fc; padding-top: 80px; padding-bottom: 80px;">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 offset-lg-2">
          <div class="section-heading wow fadeInDown" data-wow-duration="1s" data-wow-delay="0.5s">
            <h4>Live Training &amp; <em>Zoom Courses</em></h4>
            <img src="/assets/images/heading-line-dec.png" alt="">
            <p>1-on-1 live classes and tailored mentoring for individual developers and tech teams, backed by more than 15 years of technical and practical experience.</p>
          </div>
        </div>
      </div>
      <div class="row">
        <!-- Course 1 -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="service-item first-service" style="height: 100%; border-top: 4px solid #0077b5;">
            <div style="text-align:left!important">
              <i class="fas fa-video fa-2x" style="color: #0077b5; margin-bottom: 15px;"></i>
            </div>
            <h4>ColdFusion &amp; Lucee Mastery</h4>
            <p>
              Master fundamentals to advanced techniques in <strong>Adobe ColdFusion (CF4 to CF2025) and Lucee Server</strong>.
              <br><br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Object-Oriented Programming (OOP) &amp; patterns.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Refactoring legacy systems.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Performance tuning using FusionReactor.
            </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hello%20Flavio,%20I%20would%20like%20to%20inquire%20about%20ColdFusion%20&%20Lucee%20Course" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Inquire via WhatsApp
              </a>
            </div>
          </div>
        </div>
        <!-- Course 2 -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="service-item second-service" style="height: 100%; border-top: 4px solid #14a800;">
            <div style="text-align:left!important">
              <i class="fas fa-database fa-2x" style="color: #14a800; margin-bottom: 15px;"></i>
            </div>
            <h4>Databases &amp; AWS Cloud</h4>
            <p>
              Master database tuning, query optimization, and cloud infrastructure management.
              <br><br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> SQL Server, MySQL, and PostgreSQL optimization.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> IIS Server &amp; Linux administration.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> AWS Cloud management (EC2, RDS, S3, Backups).
            </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hello%20Flavio,%20I%20would%20like%20to%20inquire%20about%20Databases%20&%20AWS%20Course" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Inquire via WhatsApp
              </a>
            </div>
          </div>
        </div>
        <!-- Course 3 -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="service-item third-service" style="height: 100%; border-top: 4px solid #4e4376;">
            <div style="text-align:left!important">
              <i class="fas fa-robot fa-2x" style="color: #4e4376; margin-bottom: 15px;"></i>
            </div>
            <h4>APIs &amp; AI-Driven Coding</h4>
            <p>
              Accelerate your development by building modern integrations and supercharging your workflow with AI.
              <br><br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> RESTful APIs &amp; JWT security.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Zoom, JustCall, Calendly API integrations.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Advanced Prompt Engineering with ChatGPT, Claude Code &amp; Gemini.
            </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hello%20Flavio,%20I%20would%20like%20to%20inquire%20about%20APIs%20&%20AI%20Coding%20Course" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Inquire via WhatsApp
              </a>
            </div>
          </div>
        </div>
      </div>
      <div class="row" style="margin-top: 20px;">
        <div class="col-lg-12 text-center">
          <div style="background: #fff; padding: 30px; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.05); display: inline-block; max-width: 700px;">
            <h5 style="font-weight: 700; color: #2a2a2a; margin-bottom: 10px;"><i class="fas fa-graduation-cap" style="color: #14a800;"></i> Interested in scheduling a live Zoom class or team training?</h5>
            <p style="margin-bottom: 20px;">Flexible live Zoom sessions tailored to your exact tech requirements or project goals.</p>
            <a href="https://wa.me/5492236026142?text=Hello%20Flavio,%20I'm%20interested%20in%20your%20Zoom%20courses" target="_blank" class="btn-social btn-upwork" style="display: inline-flex;">
              <i class="fab fa-whatsapp"></i> Inquire via WhatsApp
            </a>
            <a href="mailto:flavio.di.virgilio@gmail.com?subject=Zoom%20Course%20Inquiry%20ColdFusion" class="btn-social btn-linkedin" style="display: inline-flex;">
              <i class="fa fa-envelope"></i> Inquire via Email
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div id="tools" class="services section tools-band" style="padding-top: 80px; padding-bottom: 80px;">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 offset-lg-2">
          <div class="section-heading wow fadeInDown" data-wow-duration="1s" data-wow-delay="0.5s">
            <h4>Our <em>Free Tools</em></h4>
            <img src="/assets/images/heading-line-dec.png" alt="">
            <p>A growing set of free browser-based tools for developers, marketers, and everyday productivity. We show 2 featured tools per category, with many more to explore. <a href="/tools">View all</a>.</p>
          </div>
        </div>
      </div>
      <cfscript>
        local.ftCards = [];
        for (local.ftCatIdx = 1; local.ftCatIdx <= arrayLen(request.toolCategories); local.ftCatIdx++) {
          local.ftCat = request.toolCategories[local.ftCatIdx];
          local.ftCount = 0;
          for (local.ftSlugIdx = 1; local.ftSlugIdx <= arrayLen(request.toolOrder); local.ftSlugIdx++) {
            local.ftSlug = request.toolOrder[local.ftSlugIdx];
            local.ftTool = request.toolsRegistry[local.ftSlug];
            if (local.ftTool.category eq local.ftCat.slug and local.ftTool.built and local.ftCount < 2) {
              local.ftCard = duplicate(local.ftTool);
              local.ftCard.slug = local.ftSlug;
              local.ftCard.categoryLabel = local.ftCat.labelEn;
              arrayAppend(local.ftCards, local.ftCard);
              local.ftCount++;
            }
          }
        }
      </cfscript>
    </div>
    <cfoutput>
    <div class="tools-carousel-wrap">
      <div class="owl-carousel tools-carousel">
        <cfloop array="#local.ftCards#" index="local.ftCard">
          <div class="tool-card">
            <div class="tool-card-category">#local.ftCard.categoryLabel#</div>
            <div class="tool-card-icon"><i class="#local.ftCard.iconPrefix# #local.ftCard.icon#"></i></div>
            <h4>#local.ftCard.titleEn#</h4>
            <p>#local.ftCard.descEn#</p>
            <a href="/tools/#local.ftCard.slug#" class="btn-social btn-linkedin">
              <i class="fas fa-arrow-right"></i> View Tool
            </a>
          </div>
        </cfloop>
      </div>
    </div>
    </cfoutput>
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <a href="/tools" class="btn-social btn-upwork">
            <i class="fas fa-th-large"></i> View All Tools
          </a>
        </div>
      </div>
    </div>
  </div>
  <cfoutput>#request.homeProjectsSection#</cfoutput>
  <cfif false><!-- Legacy personal resume content moved to /flavio-di-virgilio -->
  <div id="about" class="about-us section">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 align-self-center">
          <div class="section-heading">
            <h4>About <em>Flavio Di Virgilio</em> &amp; Background</h4>
            <img src="/assets/images/heading-line-dec.png" alt="">
            <p>Flavio is a Systems Analyst graduated from J.F. Kennedy University (Buenos Aires, Argentina) and a Multimedia Designer from Da Vinci Institute, with over 15 years of hands-on experience in Full-Stack ColdFusion/CFML web application development, database architecture, and server management in high-demand environments.
            Throughout his career, he has designed and delivered e-commerce systems, healthcare diagnostic platforms (NQMBC), REST API integrations with JWT authentication, real-time CRM platforms, and full AWS cloud infrastructure (EC2, RDS, S3).
            Top Rated Plus Freelancer on Upwork with a 100% Job Success score and over 9,700 hours logged, he is a self-motivated professional with strong logical and coding skills who also leverages modern AI development tools (ChatGPT, Claude, Codex, Gemini) to accelerate productivity and maintain top code quality.</p>
          </div>
          <div class="row">
            <div class="col-lg-6">
              <div class="box-item">
                <h4><a href="#services">Performance Tuning</a></h4>
                <p>Legacy code refactoring, FusionReactor diagnostics, and SQL Server / MySQL query optimization.</p>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="box-item">
                <h4><a href="#services">AWS Cloud Infrastructure</a></h4>
                <p>Windows/Linux server administration, IIS Server, AWS EC2, RDS (snapshots/restores), and S3 storage.</p>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="box-item">
                <h4><a href="#services">API &amp; REST Integrations</a></h4>
                <p>Seamless connection of third-party APIs including Zoom, JustCall, Calendly, JWT, and payment gateways.</p>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="box-item">
                <h4><a href="#services">AI &amp; Prompt Engineering</a></h4>
                <p>Advanced use of AI tools (ChatGPT, Claude Code, Gemini) to streamline workflows and deliver quality code fast.</p>
              </div>
            </div>
            <div class="col-lg-12">
            </div>
          </div>
        </div>
        <div class="col-lg-6">
          <div class="right-image">
            
            <img src="/assets/images/flavio-ondas-sin-marco.webp" alt="Flavio Di Virgilio - ColdFusion Expert" style="max-width: 85%; border-radius: 24px; box-shadow: 0 15px 35px rgba(0,0,0,0.18); border: 5px solid #ffffff;">
          </div>
        </div>
      </div>
    </div>
  </div>
  <div id="clients" class="the-clients skills-band">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 offset-lg-2">
          <div class="section-heading">
            <h4>Technical Stack &amp; <em>Core Skills</em></h4>
            <img src="/assets/images/heading-line-dec.png" alt="">
            <p>Comprehensive expertise across modern languages, frameworks, databases, and cloud infrastructure.</p>
          </div>
        </div>
        <div class="col-lg-12">
          <div class="naccs">
            <div class="grid">
              <div class="row">
                <div class="col-lg-7 align-self-center">
                  <div class="menu">
                    <div class="first-thumb active">
                      <div class="thumb">
                        <div class="row">
                          <div class="col-lg-4 col-sm-4 col-12">
                            <h4>ColdFusion (All)</h4>
                          </div>
                          <div class="col-lg-4 col-sm-4 d-none d-sm-block">
                            <h4>Lucee &amp; CommandBox</h4>
                          </div>
                          <div class="col-lg-4 col-sm-4 col-12">
                            <h4>Fusebox &amp; OOP</h4>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="first-thumb">
                      <div class="thumb">
                        <div class="row">
                          <div class="col-lg-4 col-sm-4 col-12">
                            <h4>SQL Server</h4>
                          </div>
                          <div class="col-lg-4 col-sm-4 d-none d-sm-block">
                            <h4>MySQL &amp; PostgreSQL</h4>
                          </div>
                          <div class="col-lg-4 col-sm-4 col-12">
                            <h4>MongoDB</h4>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="first-thumb">
                      <div class="thumb">
                        <div class="row">
                          <div class="col-lg-4 col-sm-4 col-12">
                            <h4>JavaScript &amp; jQuery</h4>
                          </div>
                          <div class="col-lg-4 col-sm-4 d-none d-sm-block">
                            <h4>React.js &amp; Node.js</h4>
                          </div>
                          <div class="col-lg-4 col-sm-4 col-12">
                            <h4>Bootstrap &amp; HTML5/CSS3</h4>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="first-thumb">
                      <div class="thumb">
                        <div class="row">
                          <div class="col-lg-4 col-sm-4 col-12">
                            <h4>AWS EC2 / RDS / S3</h4>
                          </div>
                          <div class="col-lg-4 col-sm-4 d-none d-sm-block">
                            <h4>IIS &amp; Linux Admin</h4>
                          </div>
                          <div class="col-lg-4 col-sm-4 col-12">
                            <h4>Docker &amp; CI/CD</h4>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="last-thumb">
                      <div class="thumb">
                        <div class="row">
                          <div class="col-lg-4 col-sm-4 col-12">
                            <h4>REST &amp; JWT API</h4>
                          </div>
                          <div class="col-lg-4 col-sm-4 d-none d-sm-block">
                            <h4>WordPress &amp; PHP</h4>
                          </div>
                          <div class="col-lg-4 col-sm-4 col-12">
                            <h4>AI Prompt Engineer</h4>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div> 
                <div class="col-lg-5">
                  <ul class="nacc">
                    <li class="active">
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-12">
                              <div class="client-content">
                                <img src="/assets/images/quote.png" alt="">
                                <p>Specialized in all versions of Adobe ColdFusion (CF4 to CF2025), Lucee Server, Fusebox framework, and Object-Oriented Programming (OOP). Deep expertise in legacy code migration and secure CFML development.</p>
                              </div>
                              <div class="down-content">
                                <div class="right-content">
                                  <h4>ColdFusion &amp; CFML Core</h4>
                                  <span>Backend &amp; Architecture</span>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-12">
                              <div class="client-content">
                                <img src="/assets/images/quote.png" alt="">
                                <p>Design, tuning, and management of high-performance relational and NoSQL databases: Microsoft SQL Server, MySQL, PostgreSQL, and MongoDB. Complex query optimization and Stored Procedures.</p>
                              </div>
                              <div class="down-content">
                                <div class="right-content">
                                  <h4>Relational Databases &amp; SQL</h4>
                                  <span>MSSQL, MySQL, PostgreSQL, MongoDB</span>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-12">
                              <div class="client-content">
                                <img src="/assets/images/quote.png" alt="">
                                <p>Dynamic frontend interface development using modern JavaScript, jQuery, AJAX, React.js, Node.js, Bootstrap, and responsive UI components tailored for optimal user experience.</p>
                              </div>
                              <div class="down-content">
                                <div class="right-content">
                                  <h4>Frontend &amp; UI Development</h4>
                                  <span>JavaScript, React.js, Bootstrap, CSS3</span>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-12">
                              <div class="client-content">
                                <img src="/assets/images/quote.png" alt="">
                                <p>End-to-end Amazon Web Services infrastructure management (EC2, RDS snapshots/restores, S3 buckets, Security Groups), IIS Web Server configuration on Windows, and Linux system administration.</p>
                              </div>
                              <div class="down-content">
                                <div class="right-content">
                                  <h4>AWS Cloud &amp; Server Admin</h4>
                                  <span>AWS EC2/RDS/S3, IIS Server, Docker</span>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <li>
                      <div>
                        <div class="thumb">
                          <div class="row">
                            <div class="col-lg-12">
                              <div class="client-content">
                                <img src="/assets/images/quote.png" alt="">
                                <p>Integration of RESTful web services, JWT token security, PHP, custom WordPress themes/plugins, and strategic application of AI tools (ChatGPT, Claude, Codex) to maximize delivery speed.</p>
                              </div>
                              <div class="down-content">
                                <div class="right-content">
                                  <h4>APIs, WordPress &amp; AI Engineering</h4>
                                  <span>REST Services, JWT, Prompt Engineering</span>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                  </ul>
                </div>          
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </cfif>
