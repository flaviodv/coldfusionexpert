<cfif session.lan eq "es">
  <cfinclude template="coldfusion-development_es.cfm">
<cfelse>
<main class="cf-development-page">
  <section id="top" class="cf-hero wow fadeIn" data-wow-duration="1s" data-wow-delay="0.2s">
    <div class="container">
      <div class="row">
        <div class="col-lg-7 wow fadeInLeft" data-wow-duration="1s" data-wow-delay="0.45s">
          <span class="hero-kicker">ColdFusion &middot; Lucee &middot; CFML</span>
          <h1>ColdFusion Development, <em>Support &amp; Modernization</em></h1>
          <p class="cf-subtitle">Keep your CFML applications reliable today and ready for what comes next.</p>
          <p class="cf-lede">I help businesses maintain, modernize, and extend Adobe ColdFusion and Lucee applications&mdash;without disrupting the systems they rely on every day.</p>
          <div class="hero-cta-row scroll-to-section">
            <a href="https://wa.me/5492236026142?text=Hello%20Flavio%2C%20I%27d%20like%20to%20discuss%20my%20ColdFusion%20project" target="_blank" rel="noopener" class="hero-cta hero-cta-primary"><i class="fab fa-whatsapp"></i> Discuss Your ColdFusion Project</a>
            <a href="#services" class="hero-cta hero-cta-secondary"><i class="fas fa-arrow-down"></i> Explore Services</a>
          </div>
        </div>
        <div class="col-lg-5 wow fadeInRight" data-wow-duration="1s" data-wow-delay="0.65s"><div class="cf-hero-visual"><div class="cf-hero-visual-header"><span>ColdFusion ecosystem</span><span class="cf-hero-visual-status">Operational</span></div><aside class="cf-hero-panel" aria-label="ColdFusion project focus"><span class="cf-hero-panel-label">A practical partner</span><h2>Clarity for the next technical decision.</h2><ul class="cf-hero-panel-list"><li><i class="fas fa-check-circle" aria-hidden="true"></i> Existing applications</li><li><i class="fas fa-check-circle" aria-hidden="true"></i> Adobe ColdFusion &amp; Lucee</li><li><i class="fas fa-check-circle" aria-hidden="true"></i> Performance, APIs &amp; databases</li></ul></aside>
  <div id="tools" class="cf-development-tools wow fadeInUp" data-wow-duration="1s">
    <div class="container">
      <div class="cf-section-heading"><span class="hero-kicker">Tools for CFML work</span><h2>Useful tools for development, data, CFML and servers.</h2><p>Explore the free tools I built for the practical work around ColdFusion applications and their infrastructure.</p></div>
      <cfscript>
        local.cfToolCategories = ["desarrollo-datos", "cfml-servidores"];
        local.cfToolLabels = {};
        for (local.cfCat in request.toolCategories) local.cfToolLabels[local.cfCat.slug] = local.cfCat.labelEn;
        local.cfToolCount = 0;
        for (local.cfCountSlug in request.toolOrder) if (request.toolsRegistry[local.cfCountSlug].built and arrayFind(local.cfToolCategories, request.toolsRegistry[local.cfCountSlug].category)) local.cfToolCount++;
        local.cfToolNumber = 0;
      </cfscript>
      <div id="cf-tools-marquee" class="hero-tools-marquee cf-tools-marquee" aria-label="Development and CFML server tools">
        <div class="hero-tools-marquee-header"><div class="hero-tools-marquee-title"><span><i class="fas fa-toolbox"></i> Selected tools</span><a href="/tools" class="hero-tools-all-link">View all <i class="fas fa-arrow-right"></i></a></div><div class="hero-tools-marquee-meta"><small><i class="fas fa-pause"></i> Hover to pause</small></div></div>
        <div class="hero-tools-marquee-viewport" tabindex="0"><div class="hero-tools-marquee-track"><div class="hero-tools-marquee-list">
          <cfset local.cfLastCategory = "">
          <cfoutput><cfloop array="#request.toolOrder#" index="local.cfSlug"><cfset local.cfTool = request.toolsRegistry[local.cfSlug]><cfif local.cfTool.built and arrayFind(local.cfToolCategories, local.cfTool.category)><cfif local.cfTool.category neq local.cfLastCategory><div class="hero-tools-category"><span>#local.cfToolLabels[local.cfTool.category]#</span></div><cfset local.cfLastCategory = local.cfTool.category></cfif><cfset local.cfToolNumber = local.cfToolNumber + 1><a href="/tools/#local.cfSlug#" data-tool-tooltip="#encodeForHTMLAttribute(local.cfTool.descEn)#" aria-label="#encodeForHTMLAttribute(local.cfTool.titleEn)#. #encodeForHTMLAttribute(local.cfTool.descEn)#"><span class="hero-tool-sequence">#numberFormat(local.cfToolNumber, '00')#</span><i class="#local.cfTool.iconPrefix# #local.cfTool.icon#"></i><span>#local.cfTool.titleEn#</span><i class="fas fa-arrow-right"></i></a></cfif></cfloop></cfoutput>
        </div><div class="hero-tools-marquee-list" aria-hidden="true"><cfset local.cfLastCategoryRepeat = ""><cfoutput><cfloop array="#request.toolOrder#" index="local.cfSlugRepeat"><cfset local.cfToolRepeat = request.toolsRegistry[local.cfSlugRepeat]><cfif local.cfToolRepeat.built and arrayFind(local.cfToolCategories, local.cfToolRepeat.category)><cfif local.cfToolRepeat.category neq local.cfLastCategoryRepeat><div class="hero-tools-category"><span>#local.cfToolLabels[local.cfToolRepeat.category]#</span></div><cfset local.cfLastCategoryRepeat = local.cfToolRepeat.category></cfif><a href="/tools/#local.cfSlugRepeat#" tabindex="-1" data-tool-tooltip="#encodeForHTMLAttribute(local.cfToolRepeat.descEn)#"><span class="hero-tool-sequence"></span><i class="#local.cfToolRepeat.iconPrefix# #local.cfToolRepeat.icon#"></i><span>#local.cfToolRepeat.titleEn#</span><i class="fas fa-arrow-right"></i></a></cfif></cfloop></cfoutput></div></div></div>
      </div>
    </div>
  </div></div></div></div></div></section>

  <nav class="section-rail" aria-label="Section navigation">
    <ul class="section-rail-list">
      <li><a href="#top" class="section-rail-link" data-rail-target="top" data-section-label="Overview" aria-label="Go to Overview"><span class="section-rail-label">Overview</span></a></li>
      <li><a href="#expertise" class="section-rail-link" data-rail-target="expertise" data-section-label="Expertise" aria-label="Go to Expertise"><span class="section-rail-label">Expertise</span></a></li>
      <li><a href="#tools" class="section-rail-link" data-rail-target="tools" data-section-label="Tools" aria-label="Go to Tools"><span class="section-rail-label">Tools</span></a></li>
      <li><a href="#services" class="section-rail-link" data-rail-target="services" data-section-label="Services" aria-label="Go to Services"><span class="section-rail-label">Services</span></a></li>
      <li><a href="#approach" class="section-rail-link" data-rail-target="approach" data-section-label="How I work" aria-label="Go to How I work"><span class="section-rail-label">How I work</span></a></li>
      <li><a href="#faq" class="section-rail-link" data-rail-target="faq" data-section-label="FAQ" aria-label="Go to FAQ"><span class="section-rail-label">FAQ</span></a></li>
      <li><a href="#contact" class="section-rail-link" data-rail-target="contact" data-section-label="Contact" aria-label="Go to Contact"><span class="section-rail-label">Contact</span></a></li>
    </ul>
  </nav>

  <section id="expertise" class="cf-section wow fadeInUp" data-wow-duration="1s">
    <div class="container cf-expertise-copy">
      <span class="hero-kicker">Trusted ColdFusion Expertise</span>
      <h2>Keep valuable systems dependable.</h2>
      <p>Legacy applications are valuable business systems, not disposable software. The right work improves stability, removes practical sources of risk, and gives your team a clear view of what should happen next. I focus on useful improvements, careful delivery, and communication you can rely on.</p>
    </div>
  </section>

  <section id="services" class="cf-section is-soft wow fadeInUp" data-wow-duration="1s">
    <div class="container">
      <div class="cf-section-heading"><span class="hero-kicker">Services</span><h2>Focused help for every stage of your CFML application.</h2><p>From a specific issue to ongoing technical partnership, I work within the application and infrastructure you already have.</p></div>
      <div class="row g-4">
        <div class="col-md-6 col-lg-4"><article id="legacy-support" class="cf-service-card"><i class="fas fa-life-ring" aria-hidden="true"></i><h3>Legacy ColdFusion &amp; Lucee Support</h3><p>Maintain, debug, enhance, and stabilize existing CFML applications.</p></article></div>
        <div class="col-md-6 col-lg-4"><article id="upgrades-migration" class="cf-service-card"><i class="fas fa-sync-alt" aria-hidden="true"></i><h3>ColdFusion Upgrades &amp; Migration</h3><p>Plan and execute upgrades to supported Adobe ColdFusion or Lucee versions with minimal disruption.</p></article></div>
        <div class="col-md-6 col-lg-4"><article id="performance-security" class="cf-service-card"><i class="fas fa-shield-alt" aria-hidden="true"></i><h3>Performance &amp; Security Optimization</h3><p>Improve slow queries, application performance, reliability, code quality, and security posture.</p></article></div>
        <div class="col-md-6 col-lg-4"><article id="api-modernization" class="cf-service-card"><i class="fas fa-plug" aria-hidden="true"></i><h3>API Integrations &amp; Modernization</h3><p>Connect CFML applications with REST APIs, payment providers, CRMs, cloud services, and modern JavaScript interfaces.</p></article></div>
        <div class="col-md-6 col-lg-4"><article class="cf-service-card"><i class="fas fa-database" aria-hidden="true"></i><h3>SQL Server &amp; Database Optimization</h3><p>Diagnose bottlenecks, optimize queries and indexes, and improve data-layer reliability.</p></article></div>
        <div class="col-md-6 col-lg-4"><article class="cf-service-card"><i class="fas fa-tools" aria-hidden="true"></i><h3>Ongoing Technical Support</h3><p>Provide dependable ongoing maintenance, issue resolution, and planned improvements.</p></article></div>
        <div class="col-md-6 col-lg-4"><article id="hosting" class="cf-service-card cf-hosting-card"><i class="fas fa-server" aria-hidden="true"></i><h3>Managed Multi-Technology Hosting</h3><p>Host PHP and Adobe ColdFusion applications with SQL Server or MySQL, supported by a practical management panel.</p></article></div>
        <div class="col-md-6 col-lg-4"><article class="cf-service-card cf-hosting-card"><i class="fas fa-sliders-h" aria-hidden="true"></i><h3>Hosting Panel &amp; Service Management</h3><p>Manage domains, SSL, databases, backups, logs, and the operational details your application needs.</p></article></div>
        <div class="col-md-6 col-lg-4"><article class="cf-service-card cf-hosting-card"><i class="fas fa-code" aria-hidden="true"></i><h3>PHP &amp; ColdFusion Application Hosting</h3><p>Deploy and operate business applications built with PHP or Adobe ColdFusion in one dependable hosting environment.</p></article></div>
      </div>
    </div>
  </section>

  <section id="why-work-with-me" class="cf-section wow fadeInUp" data-wow-duration="1s">
    <div class="container">
      <div class="cf-section-heading"><span class="hero-kicker">Why work with me</span><h2>Experience grounded in the work applications need.</h2></div>
      <div class="row justify-content-center"><div class="col-lg-9"><ul class="cf-reason-list">
        <li><i class="fas fa-check-circle" aria-hidden="true"></i><span>15+ years of web development experience</span></li>
        <li><i class="fas fa-check-circle" aria-hidden="true"></i><span>Strong ColdFusion, Lucee, CFML and SQL Server background</span></li>
        <li><i class="fas fa-check-circle" aria-hidden="true"></i><span>Practical approach for legacy and business-critical applications</span></li>
        <li><i class="fas fa-check-circle" aria-hidden="true"></i><span>Modern integrations, APIs, HTML5, JavaScript, Bootstrap and cloud-ready solutions</span></li>
        <li><i class="fas fa-check-circle" aria-hidden="true"></i><span>Clear communication and ownership from diagnosis to delivery</span></li>
      </ul></div></div>
    </div>
  </section>

  <section id="approach" class="cf-section is-soft wow fadeInUp" data-wow-duration="1s">
    <div class="container"><div class="cf-section-heading"><span class="hero-kicker">How I work</span><h2>A clear path from diagnosis to delivery.</h2></div><div class="row g-4">
      <div class="col-md-6 col-lg-3"><article class="cf-step-card"><span class="cf-step-number">1</span><h3>Understand</h3><p>Review the application, infrastructure, business needs, and current risks.</p></article></div>
      <div class="col-md-6 col-lg-3"><article class="cf-step-card"><span class="cf-step-number">2</span><h3>Plan</h3><p>Define practical priorities, scope, and an implementation path.</p></article></div>
      <div class="col-md-6 col-lg-3"><article class="cf-step-card"><span class="cf-step-number">3</span><h3>Improve</h3><p>Deliver focused changes with clean, maintainable code.</p></article></div>
      <div class="col-md-6 col-lg-3"><article class="cf-step-card"><span class="cf-step-number">4</span><h3>Support</h3><p>Keep the application stable and evolve it when needed.</p></article></div>
    </div></div>
  </section>

  <section id="faq" class="cf-section wow fadeInUp" data-wow-duration="1s"><div class="container"><div class="cf-section-heading"><span class="hero-kicker">FAQ</span><h2>Common questions about ColdFusion support.</h2></div><div class="cf-faq">
    <details><summary>Do you support legacy ColdFusion applications?</summary><p>Yes. I maintain, debug, refactor, and extend existing Adobe ColdFusion applications, including older codebases.</p></details>
    <details><summary>Do you work with Lucee?</summary><p>Yes. Lucee Server and CFML application support are part of my core experience.</p></details>
    <details><summary>Can you upgrade an older ColdFusion application?</summary><p>Yes. I can assess the application, identify compatibility risks, and plan an upgrade path to a supported Adobe ColdFusion or Lucee version.</p></details>
    <details><summary>Can you improve a slow ColdFusion application?</summary><p>Yes. I can investigate application behavior, database queries, infrastructure, and code to identify practical performance improvements.</p></details>
    <details><summary>Can you integrate a ColdFusion application with third-party APIs?</summary><p>Yes. I work with REST APIs, payment providers, CRMs, cloud services, and JavaScript interfaces.</p></details>
    <details><summary>Do you provide ongoing support?</summary><p>Yes. Ongoing maintenance, issue resolution, and planned improvements can be arranged around the application’s needs.</p></details>
  </div></div></section>

  <section id="contact" class="cf-final-cta wow fadeInUp" data-wow-duration="1s"><div class="container"><h2>Need an experienced ColdFusion developer for your existing application?</h2><p>Let’s discuss the next practical step for your application, whether it needs support, modernization, performance improvements, or a new integration.</p><a href="https://wa.me/5492236026142?text=Hello%20Flavio%2C%20I%27d%20like%20to%20discuss%20my%20ColdFusion%20application" target="_blank" rel="noopener" class="hero-cta hero-cta-primary"><i class="fab fa-whatsapp"></i> Start a Conversation</a></div></section>
</main>
</cfif>
