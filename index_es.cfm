  <div class="main-banner home-solutions-hero wow fadeIn" id="top" data-wow-duration="1s" data-wow-delay="0.3s">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="row">
            <div class="col-lg-6 align-self-center">
              <div class="left-content show-up header-text wow fadeInLeft" data-wow-duration="1s" data-wow-delay="1s">
                <div class="row">
                  <div class="col-lg-12">
                    <span class="hero-kicker">Desarrollo · Modernización · Automatización</span>
                    <h1 class="hero-business-title">Soluciones de software.<em>Hechas para negocios reales.</em></h1>
                    <p class="hero-business-copy">Diseñamos, modernizamos y conectamos sistemas que impulsan operaciones reales: aplicaciones web, APIs, React.js, Python, automatización con IA, WordPress e infraestructura cloud. <strong>ColdFusion y Lucee</strong> siguen siendo una especialización profunda, no un límite.</p>
                    <div class="hero-cta-row scroll-to-section">
                      <a href="#services" class="hero-cta hero-cta-primary"><i class="fas fa-arrow-right"></i> Explorar soluciones</a>
                      <a href="#tools" class="hero-cta hero-cta-secondary"><i class="fas fa-toolbox"></i> Usar herramientas gratis</a>
                    </div>
                    <div class="hero-capabilities" aria-label="Capacidades principales">
                      <span>Software a medida</span><span>APIs &amp; Integraciones</span><span>Automatización IA</span><span>WordPress</span><span>React.js</span><span>Python</span><span>ColdFusion / Lucee</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="solutions-visual wow fadeInRight" data-wow-duration="1s" data-wow-delay="0.45s" aria-label="Arquitectura de soluciones conectadas">
                <div class="solutions-visual-header"><span>Ecosistema de software</span><span class="solutions-visual-status">Operativo</span></div>
                <cfscript>
                  local.hmCategoryLabels = {};
                  local.hmToolTotal = 0;
                  for (local.hmCat in request.toolCategories) local.hmCategoryLabels[local.hmCat.slug] = local.hmCat.labelEs;
                  for (local.hmCountSlug in request.toolOrder) if (request.toolsRegistry[local.hmCountSlug].built) local.hmToolTotal++;
                </cfscript>
                <div id="hero-tools-marquee" class="hero-tools-marquee" aria-label="Herramientas gratuitas creadas">
                <div class="hero-tools-marquee-header"><div class="hero-tools-marquee-title"><span><i class="fas fa-toolbox"></i> Herramientas creadas</span><a href="/es/tools" class="hero-tools-all-link">Ver todas <i class="fas fa-arrow-right"></i></a></div><div class="hero-tools-marquee-meta"><cfoutput><span class="hero-tools-counter"><strong data-tool-current>01</strong> / #numberFormat(local.hmToolTotal, '00')#</span></cfoutput><small><i class="fas fa-pause"></i> Pausa al pasar</small></div></div>
                <div class="hero-tools-marquee-viewport" tabindex="0">
                  <div class="hero-tools-marquee-track">
                    <div class="hero-tools-marquee-list">
                      <cfset local.hmLastCategory = ""><cfset local.hmToolNumber = 0>
                      <cfoutput><cfloop array="#request.toolOrder#" index="local.hmSlug"><cfset local.hmTool = request.toolsRegistry[local.hmSlug]><cfif local.hmTool.built><cfif local.hmTool.category neq local.hmLastCategory><div class="hero-tools-category"><span>#local.hmCategoryLabels[local.hmTool.category]#</span></div><cfset local.hmLastCategory = local.hmTool.category></cfif><cfset local.hmToolNumber++><a href="/es/tools/#local.hmSlug#" data-tool-index="#local.hmToolNumber#" data-tool-tooltip="#encodeForHTMLAttribute(local.hmTool.descEs)#" aria-label="#encodeForHTMLAttribute(local.hmTool.titleEs)#. #encodeForHTMLAttribute(local.hmTool.descEs)#"><span class="hero-tool-sequence">#numberFormat(local.hmToolNumber, '00')#</span><i class="#local.hmTool.iconPrefix# #local.hmTool.icon#"></i><span>#local.hmTool.titleEs#</span><i class="fas fa-arrow-right"></i></a></cfif></cfloop></cfoutput>
                    </div>
                    <div class="hero-tools-marquee-list" aria-hidden="true">
                      <cfset local.hmLastCategoryRepeat = ""><cfset local.hmToolNumberRepeat = 0>
                      <cfoutput><cfloop array="#request.toolOrder#" index="local.hmSlugRepeat"><cfset local.hmToolRepeat = request.toolsRegistry[local.hmSlugRepeat]><cfif local.hmToolRepeat.built><cfif local.hmToolRepeat.category neq local.hmLastCategoryRepeat><div class="hero-tools-category"><span>#local.hmCategoryLabels[local.hmToolRepeat.category]#</span></div><cfset local.hmLastCategoryRepeat = local.hmToolRepeat.category></cfif><cfset local.hmToolNumberRepeat++><a href="/es/tools/#local.hmSlugRepeat#" tabindex="-1" data-tool-index="#local.hmToolNumberRepeat#" data-tool-tooltip="#encodeForHTMLAttribute(local.hmToolRepeat.descEs)#"><span class="hero-tool-sequence">#numberFormat(local.hmToolNumberRepeat, '00')#</span><i class="#local.hmToolRepeat.iconPrefix# #local.hmToolRepeat.icon#"></i><span>#local.hmToolRepeat.titleEs#</span><i class="fas fa-arrow-right"></i></a></cfif></cfloop></cfoutput>
                    </div>
                  </div>
                </div>
              </div>
                <div class="solutions-visual-grid">
                  <div class="solution-node"><i class="fas fa-layer-group"></i><span class="solution-node-arrow">↗</span><h3>Plataformas empresariales</h3><p>Sistemas estables, escalables y preparados para evolucionar.</p></div>
                  <div class="solution-node"><i class="fas fa-random"></i><span class="solution-node-arrow">↗</span><h3>APIs &amp; Integraciones</h3><p>Datos y herramientas trabajando juntos.</p></div>
                  <div class="solution-node"><i class="fas fa-robot"></i><span class="solution-node-arrow">↗</span><h3>IA &amp; Automatización</h3><p>Menos tareas repetitivas, mejores decisiones.</p></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <section id="coldfusion-services" class="services section home-cf-services-band">
    <div class="container"><div class="row"><div class="col-12 text-center"><div class="section-heading wow fadeInDown" data-wow-duration="1s"><h4><em>Servicios ColdFusion</em></h4><img src="/assets/images/heading-line-dec.png" alt=""><p>Soporte senior para las aplicaciones CFML de las que tu negocio ya depende.</p></div></div></div><div class="row"><div class="col-12 text-center mb-4"><a href="/es/coldfusion-development" class="home-cf-services-link">Ver todos los servicios CF <i class="fas fa-arrow-right" aria-hidden="true"></i></a></div></div>
      <div class="row g-4">
        <div class="col-md-6 col-lg-3"><a class="home-cf-service-card" href="/es/coldfusion-development#legacy-support"><i class="fas fa-life-ring" aria-hidden="true"></i><h3>Soporte ColdFusion heredado</h3><span>Mantenimiento y estabilidad para sistemas CFML existentes <i class="fas fa-arrow-right" aria-hidden="true"></i></span></a></div>
        <div class="col-md-6 col-lg-3"><a class="home-cf-service-card" href="/es/coldfusion-development#upgrades-migration"><i class="fas fa-sync-alt" aria-hidden="true"></i><h3>Actualizaciones ColdFusion y Lucee</h3><span>Actualizaciones prácticas con menos interrupciones <i class="fas fa-arrow-right" aria-hidden="true"></i></span></a></div>
        <div class="col-md-6 col-lg-3"><a class="home-cf-service-card" href="/es/coldfusion-development#performance-security"><i class="fas fa-shield-alt" aria-hidden="true"></i><h3>Rendimiento y seguridad</h3><span>Más confiabilidad, velocidad y calidad de código <i class="fas fa-arrow-right" aria-hidden="true"></i></span></a></div>
        <div class="col-md-6 col-lg-3"><a class="home-cf-service-card" href="/es/coldfusion-development#api-modernization"><i class="fas fa-plug" aria-hidden="true"></i><h3>APIs y modernización</h3><span>Conexión de CFML con servicios e interfaces modernas <i class="fas fa-arrow-right" aria-hidden="true"></i></span></a></div>
      </div>
      <a href="/es/coldfusion-development#hosting" class="home-cf-hosting-callout"><span class="home-cf-hosting-icon"><i class="fas fa-server" aria-hidden="true"></i></span><span><strong>Hosting administrado multi-tecnología</strong><small>Alojá aplicaciones PHP y Adobe ColdFusion con SQL Server o MySQL y un panel de gestión práctico.</small></span><i class="fas fa-arrow-right home-cf-hosting-arrow" aria-hidden="true"></i></a>
    </div>
  </section>
  <!-- Navegación lateral por secciones: solo se muestra en escritorio. -->
  <nav class="section-rail" aria-label="Navegación por secciones">
    <ul class="section-rail-list">
      <li><a href="#top" class="section-rail-link" data-rail-target="top" data-section-label="Inicio" aria-label="Ir a Inicio"><span class="section-rail-label">Inicio</span></a></li>
      <li><a href="#coldfusion-services" class="section-rail-link" data-rail-target="coldfusion-services" data-section-label="Servicios ColdFusion" aria-label="Ir a Servicios ColdFusion"><span class="section-rail-label">Servicios ColdFusion</span></a></li>
      <li><a href="#services" class="section-rail-link" data-rail-target="services" data-section-label="Servicios especializados" aria-label="Ir a Servicios especializados"><span class="section-rail-label">Servicios especializados</span></a></li>
      <li><a href="#seo" class="section-rail-link" data-rail-target="seo" data-section-label="SEO / GEO" aria-label="Ir a SEO y GEO"><span class="section-rail-label">SEO / GEO</span></a></li>
      <li><a href="#automation" class="section-rail-link" data-rail-target="automation" data-section-label="Automatización con IA" aria-label="Ir a Automatización con IA"><span class="section-rail-label">Automatización con IA</span></a></li>
      <li><a href="#courses" class="section-rail-link" data-rail-target="courses" data-section-label="Cursos Zoom" aria-label="Ir a Cursos Zoom"><span class="section-rail-label">Cursos Zoom</span></a></li>
      <li><a href="#tools" class="section-rail-link" data-rail-target="tools" data-section-label="Herramientas" aria-label="Ir a Herramientas"><span class="section-rail-label">Herramientas</span></a></li>
      <li><a href="#projects" class="section-rail-link" data-rail-target="projects" data-section-label="Experiencia y proyectos" aria-label="Ir a Experiencia y proyectos"><span class="section-rail-label">Experiencia y proyectos</span></a></li>
      <li><a href="#Contact" class="section-rail-link" data-rail-target="Contact" data-section-label="Contacto" aria-label="Ir a Contacto"><span class="section-rail-label">Contacto</span></a></li>
    </ul>
  </nav>
  <div id="services" class="services section">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 offset-lg-2">
          <div class="section-heading  wow fadeInDown" data-wow-duration="1s" data-wow-delay="0.5s">
            <h4> <em>Servicios Especializados </em> </h4>
            <img src="/assets/images/heading-line-dec.png" alt="">
            <p>Servicios de desarrollo, arquitectura y mantenimiento para aplicaciones ColdFusion y Cloud:</p>
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
                <img class="servce_img " src="/assets/images/ColdFusion Consulting Service.svg" alt="ColdFusion Consulting" width="40" height="40">
              </picture>
            </div>
             <h4>Servicio de Consultoría ColdFusion</h4>
             <p> Adaptamos las estrategias para que se ajusten a los objetivos de su negocio.
              Evaluación de infraestructura, diagnóstico con FusionReactor y refactorización de código legacy. <br>
              <span class="highligth">¿El objetivo?</span> Maximizar la eficiencia, la seguridad y el rendimiento desde CF4 hasta Adobe ColdFusion 2025 y Lucee Server.
             </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustar%C3%ADa%20consultar%20sobre%20Consultor%C3%ADa%20ColdFusion" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Consultar por WhatsApp
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
           <h4>Desarrollo de Aplicaciones Web Personalizadas</h4>
           <p>Desarrollo de aplicaciones web escalables, seguras y vanguardistas. 
            Experiencia en CRMs empresariales, plataformas de salud (NQMBC), e-commerce e integraciones dinámicas centradas en bases de datos. <br>
            <span class="highligth">¿Los beneficios?</span> Operaciones optimizadas y arquitectura orientada al usuario.
            </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustar%C3%ADa%20consultar%20sobre%20Desarrollo%20de%20Aplicaciones%20Web%20Personalizadas" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Consultar por WhatsApp
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
            <h4>Integración de APIs y Servicios Web REST</h4>
            <p>Construcción e integración de servicios web y APIs RESTful para comunicación fluida entre sistemas.
              Integración comprobada de plataformas como JustCall, Zoom, Calendly, pasarelas de pago y autenticación JWT.</p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustaría%20consultar%20sobre%20Integración%20de%20APIs%20REST" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Consultar por WhatsApp
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
            <h4>Desarrollo de CMS y CRM ColdFusion</h4>
            <p>Sistemas potentes e intuitivos a medida para gestión de clientes, prospectos, comisiones y contenidos.
              Mantenimiento y evolución de plataformas como Svetness CRM, portales de clientes Makeway (Darran, Trinity, Peter Pepper) y sitios multitienda (800wine.com).
            </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustaría%20consultar%20sobre%20Desarrollo%20de%20CMS%20y%20CRM" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Consultar por WhatsApp
              </a>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="service-item first-service">
            <div >
              <picture>
                <source class="servce_img" srcset="/assets/images/ColdFusion%20Maintenance%20and%20Enhancement.svg" type="image/svg+xml">
                <img class="servce_img " src="/assets/images/ColdFusion Maintenance and Enhancement.svg" alt="ColdFusion Maintenance and AWS" width="40" height="40">
            </picture></div>
             <h4>Administración Cloud AWS & Soporte Servidores</h4>
             <p>Administración experta de servidores staging y producción en AWS (EC2, RDS MSSQL/MySQL, S3) e IIS Server en Windows/Linux.
               Soporte proactivo, parches de seguridad, copias de seguridad y monitoreo continuo. <br>
               <span class="highligth">¿Sus aplicaciones?</span> Estables, protegidas y a la vanguardia tecnológica.
             </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustar%C3%ADa%20consultar%20sobre%20Administraci%C3%B3n%20Cloud%20AWS%20y%20Soporte%20de%20Servidores" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Consultar por WhatsApp
              </a>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="service-item second-service">
            <div style="text-align:left!important">
              <i class="fas fa-bullhorn" style="font-size: 40px; color: #13aff0;"></i>
            </div>
            <h4>Marketing Digital</h4>
            <p>Estrategias de marketing digital, gestión de redes sociales, campañas publicitarias y crecimiento de marca online.
              Somos <strong>Partners oficiales de viralify.digital</strong> para potenciar la presencia digital de tu negocio.
            </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492281403725?text=Hola%20Viralify,%20me%20gustaría%20consultar%20sobre%20Marketing%20Digital" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Consultar por WhatsApp
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!--- Legacy inline project cards replaced by the shared data-driven renderer below. --->
  <!--- <cfsavecontent variable="request.homeProjectsSection">
    <div id="projects" class="pricing-tables">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 offset-lg-2">
          <div class="section-heading">
            <h4>Experiencia <em>Profesional </em> &amp; Proyectos</h4>
            <img src="/assets/images/heading-line-dec.png" alt="">
            <p>Proyectos actuales, desarrollos propios con Inteligencia Artificial y trayectoria corporativa destacada.</p>
          </div>
        </div>
        <!-- Card 1: Quebec Attractions -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="pricing-item-pro">
            <h4>Quebec Attractions</h4>
            <span style="font-size: 0.85rem; color: #14a800; font-weight: bold;">Trabajo Actual | Lucee Server</span>
            <div class="icon">
            <img src="/assets/images/projects/quebec-attractions.jpg" class="project-card-image" alt="Quebec Attractions">
            </div>
            <ul>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i><strong>Sitio Oficial</strong>: <a href="https://quebecattractions.ca/" target="_blank" style="color:#0077b5; font-weight:600;">quebecattractions.ca</a></li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Plataforma turística bilingüe líder en Quebec (atracciones, eventos y hospedaje).</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Desarrollo completo de la aplicación en <strong>Lucee CFML</strong>.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Diseó e implementó <strong>100% de la interfaz visual (UI/UX)</strong> y maquetación responsiva.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Administración integral de servidores e infraestructura.</li>
            </ul>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustaría%20consultar%20sobre%20Proyecto%20Quebec%20Attractions" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Consultar por WhatsApp
              </a>
            </div>
          </div>
        </div>
        <!-- Card 2: CompraInversa.com -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="pricing-item-pro">
            <h4>CompraInversa.com</h4>
            <span style="font-size: 0.85rem; color: #4b6cb7; font-weight: bold;">Proyecto Personal | ColdFusion + IA</span>
            <div class="icon">
            <img src="/assets/images/projects/comprainversa.jpg" class="project-card-image" alt="CompraInversa">
            </div>
            <ul>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i><strong>Marketplace Inteligente</strong>: <a href="https://comprainversa.com/" target="_blank" style="color:#0077b5; font-weight:600;">comprainversa.com</a></li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Plataforma propia de marketplace para conectar demandas de compra con ofertas competitivas.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Desarrollado con <strong>Adobe ColdFusion</strong> y <strong>Microsoft SQL Server</strong>.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Integración de módulos asistidos por <strong>Inteligencia Artificial (IA)</strong> para emparejamiento de requerimientos y optimización de búsqueda.</li>
            </ul>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustaría%20consultar%20sobre%20Proyecto%20CompraInversa.com" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Consultar por WhatsApp
              </a>
            </div>
          </div>
        </div>
        <!-- Card 3: Firebrand Creative -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="pricing-item-pro">
            <h4>Firebrand Creative</h4>
            <span style="font-size: 0.85rem; color: #14a800; font-weight: bold;">Rol Actual | WordPress Developer</span>
            <div class="icon">
            <img src="/assets/images/projects/firebrand.webp" class="project-card-image" alt="Firebrand Creative">
            </div>
            <ul>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i><strong>Sitio Oficial</strong>: <a href="https://iamfirebrand.com/" target="_blank" style="color:#0077b5; font-weight:600;">iamfirebrand.com</a></li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Rol actual como WordPress Developer para una agencia digital de Estados Unidos.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Trabajo sobre múltiples sitios y clientes gestionados por Firebrand Creative.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Actualización de contenidos, mejoras visuales, soporte técnico y administración de servidores.</li>
            </ul>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustaría%20consultar%20sobre%20Proyecto%20Firebrand%20Creative" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Consultar por WhatsApp
              </a>
            </div>
          </div>
        </div>
        <!-- Card 4: Makeway -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="pricing-item-pro">
            <h4>Makeway &amp; Clientes Internacionales</h4>
            <span style="font-size: 0.85rem; color: #4b6cb7; font-weight: bold;">Sep 2023 - Presente</span>
            <div class="icon">
              <img src="/assets/images/pricing-table-01.png" alt="Makeway">
            </div>
            <ul>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Gestión y optimización de rendimiento de sistemas CMS en ColdFusion y MySQL.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Refactorización de código legacy para empresas como Darran Furniture (darran.com).</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Desarrollo para Trinity Furniture (trinityfurniture.com) y Peter Pepper Products.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Creación de nuevas características y resolución de errores críticos.</li>
            </ul>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustaría%20consultar%20sobre%20Proyecto%20Makeway" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Consultar por WhatsApp
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
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Desarrollo Senior Fullstack ColdFusion + SQL Server + AWS para Svetness CRM.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Integración de APIs de comunicación: JustCall, Zoom y Calendly.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Tuning de rendimiento de ColdFusion con FusionReactor y optimización MSSQL.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Administración de infraestructura AWS (EC2, RDS, S3) y servidores Windows.</li>
            </ul>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustaría%20consultar%20sobre%20Proyecto%20Svetness%20CRM" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Consultar por WhatsApp
              </a>
            </div>
          </div>
        </div>
        <!-- Card 6: Third Wave Digital -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="pricing-item-pro">
            <h4>Third Wave Digital</h4>
            <span style="font-size: 0.85rem; color: #4b6cb7; font-weight: bold;">2011 - 2020</span>
            <div class="icon">
              <img src="/assets/images/projects/third-wave-digital.jpg" alt="Third Wave Digital">
            </div>
            <ul>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i><strong>Third Wave Digital (2019)</strong>: Sistema de diagnóstico e historial clínico para cáncer de mama (NQMBC).</li>
            </ul>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustaría%20consultar%20sobre%20Proyectos%20Salud%20y%20E-Commerce" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Consultar por WhatsApp
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  </cfsavecontent> --->
  <cfscript>
    local.homeProjectsHeading = "Experiencia <em>Profesional</em> &amp; Proyectos";
    local.homeProjectsIntro = "Productos propios y plataformas desarrolladas para clientes, con foco en resultados, tecnología y evolución continua.";
    local.homeProjectsTabsAria = "Categorías de proyectos";
    local.homeProjectsOwnLabel = "Productos propios";
    local.homeProjectsClientLabel = "Proyectos para clientes";
    local.homeProjectsTechLabel = "Tecnologías principales";
    local.homeProjectsContactLabel = "Consultar por WhatsApp";
    local.homeProjectItems = [
      {
        type="own", title="Compra Inversa", alt="Compra Inversa marketplace", label="Marketplace &amp; Commerce Platform",
        logo="/assets/images/projects/logos/comprainversa.png", logoAlt="Logo de Compra Inversa", logoTheme="dark",
        image="/assets/images/projects/comprainversa.jpg", siteUrl="https://comprainversa.com/", siteLabel="comprainversa.com",
        description="Marketplace que combina la compra tradicional con un modelo de compra inversa: los compradores publican lo que necesitan y reciben ofertas de vendedores.",
        technologies="Adobe ColdFusion, Microsoft SQL Server, JavaScript e IA aplicada", details=["Matching inteligente entre necesidades de compra y ofertas competitivas."] ,
        contactUrl="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustaría%20consultar%20sobre%20Compra%20Inversa"
      },
      {
        type="own", title="Apuesta Exitosa", alt="Apuesta Exitosa web platform", label="Web Platform · AI-Assisted Development",
        logo="/assets/images/projects/logos/apuestaexitosa.png", logoAlt="Logo de Apuesta Exitosa",
        image="/assets/images/projects/apuestaexitosa-es.jpg", siteUrl="https://apuestaexitosa.com/", siteLabel="apuestaexitosa.com",
        description="Plataforma web desarrollada mediante un flujo de trabajo fuertemente asistido por IA, Claude Code y agentes de programación.",
        technologies="ColdFusion, JavaScript, Claude Code y agentes de programación", details=["Desarrollo orientado a iterar rápido sin perder calidad ni criterio técnico."],
        contactUrl="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustaría%20consultar%20sobre%20Apuesta%20Exitosa"
      },
      {
        type="own", title="Telaruma", alt="Telaruma marketing SaaS platform", label="Marketing SaaS Platform",
        logo="/assets/images/projects/logos/telaruma.png", logoAlt="Logo de Telaruma", logoText="Telaruma",
        image="/assets/images/projects/telaruma-es.jpg", siteUrl="https://telaruma.com/", siteLabel="telaruma.com",
        description="Plataforma SaaS para agencias y negocios orientada a marketing, gestión de clientes, estrategia, comunicaciones, APIs y automatización.",
        technologies="ColdFusion, APIs, automatización y gestión de clientes", details=["Un ecosistema centralizado para convertir estrategia y comunicación en operaciones medibles."],
        contactUrl="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustaría%20consultar%20sobre%20Telaruma"
      },
      {
        type="client", title="Quebec Attractions", alt="Quebec Attractions CMS", label="Trabajo actual · Lucee Server",
        logo="/assets/images/projects/logos/quebec-attractions.jpg", logoAlt="Logo de Quebec Attractions",
        image="/assets/images/projects/quebec-attractions.jpg", siteUrl="https://quebecattractions.ca/", siteLabel="quebecattractions.ca",
        description="Desarrollo y evolución integral de una plataforma turística bilingüe para atracciones, eventos y hospedaje en Quebec.",
        technologies="Lucee CFML, UI/UX responsive, infraestructura cloud", details=["Desarrollo completo de la aplicación y administración de servidores."],
        contactUrl="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustaría%20consultar%20sobre%20Proyecto%20Quebec%20Attractions"
      },
      {
        type="client", title="Firebrand Creative", alt="Firebrand Creative agency", label="Rol actual · WordPress Developer",
        logo="/assets/images/projects/logos/firebrand.png", logoAlt="Logo de Firebrand Creative",
        image="/assets/images/projects/firebrand.jpg", siteUrl="https://iamfirebrand.com/", siteLabel="iamfirebrand.com",
        description="Mantenimiento, contenidos, mejoras visuales, soporte técnico y administración de servidores para múltiples sitios gestionados por una agencia digital de Estados Unidos.",
        technologies="WordPress, frontend, soporte técnico e infraestructura", details=["Trabajo continuo sobre los sitios y clientes de Firebrand Creative."],
        contactUrl="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustaría%20consultar%20sobre%20Proyecto%20Firebrand%20Creative"
      },
      {
        type="client", title="Makeway &amp; Clientes Internacionales", alt="Makeway client CMS platforms", label="Sep. 2023 · Presente", logoText="MAKEWAY",
        image="/assets/images/pricing-table-01.png", siteUrl="https://www.darran.com/", siteLabel="darran.com",
        description="Mantenimiento y evolución de CMS empresariales para Darran Furniture, Trinity Furniture y Peter Pepper Products.",
        technologies="ColdFusion, MySQL, refactorización y optimización", details=["Nuevas funcionalidades y resolución de errores complejos en sistemas legacy."],
        contactUrl="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustaría%20consultar%20sobre%20Proyecto%20Makeway"
      },
      {
        type="client", title="Svetness CRM", alt="Svetness CRM", label="Mar. 2021 · Oct. 2024",
        logo="/assets/images/projects/logos/svetness.png", logoAlt="Logo de Svetness", logoTheme="dark",
        image="/assets/images/projects/svetness.jpg", siteUrl="https://www.svetness.com/", siteLabel="svetness.com",
        description="Desarrollo full-stack y optimización de un CRM operativo para entrenamiento personal y gestión de equipos.",
        technologies="ColdFusion, SQL Server, AWS y FusionReactor", details=["Integraciones con JustCall, Zoom y Calendly, más administración de EC2, RDS y S3."],
        contactUrl="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustaría%20consultar%20sobre%20Proyecto%20Svetness%20CRM"
      },
      {
        type="client", title="2Connect", alt="Plataforma de networking y citas 2Connect", label="Plataforma de networking y citas · Desarrollo web",
        logo="/assets/images/projects/logos/2connect.png", logoAlt="Logo de 2Connect",
        image="/assets/images/projects/2connect.jpg", siteUrl="https://www.2connect.ie/", siteLabel="2connect.ie",
        description="Plataforma web de conexiones, citas, eventos y coaching para ayudar a las personas a encontrarse y crear vínculos.",
        technologies="ColdFusion, frontend responsive, contenidos y SEO", details=["Desarrollo y evolución de una plataforma digital orientada a networking y experiencias en Irlanda."],
        contactUrl="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustaría%20consultar%20sobre%20Proyecto%202Connect"
      },
      {
        type="client", title="Third Wave Digital", alt="Agencia digital Third Wave Digital", label="Plataforma digital · Desarrollo web",
        logo="/assets/images/projects/logos/third-wave-digital.svg", logoAlt="Logo de Third Wave Digital", logoTheme="dark",
        image="/assets/images/projects/third-wave-digital.jpg", siteUrl="https://www.thirdwavedigital.com/", siteLabel="thirdwavedigital.com",
        description="Agencia digital orientada al desarrollo de sitios web, plataformas de contenido y experiencias digitales para organizaciones y marcas.",
        technologies="ColdFusion, CMS, frontend responsive y soporte técnico", details=["Desarrollo y evolución de plataformas web con foco en experiencia, contenido y resultados digitales."],
        contactUrl="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustaría%20consultar%20sobre%20el%20Proyecto%20Third%20Wave%20Digital"
      }
    ];
  </cfscript>
  <cfsavecontent variable="request.homeProjectsSection">
    <cfinclude template="home-projects.cfm">
  </cfsavecontent>
  <div id="seo" class="services section" style="padding-top: 80px; padding-bottom: 80px;">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 offset-lg-2">
          <div class="section-heading wow fadeInDown" data-wow-duration="1s" data-wow-delay="0.5s">
            <h4>Optimización de <em>SEO Técnico &amp; GEO (IA)</em></h4>
            <img src="/assets/images/heading-line-dec.png" alt="">
            <p>Estrategias avanzadas de posicionamiento en motores de búsqueda tradicionales (Google, Bing) y optimización de visibilidad en Inteligencia Artificial (ChatGPT, Perplexity, Claude, Gemini).</p>
            <p><a href="/es/seo-ai-readiness" class="hero-cta hero-cta-secondary"><i class="fas fa-arrow-right"></i> Conocer SEO técnico + GEO</a></p>
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
            <h4>Google Search Console &amp; SEO Técnico</h4>
            <p>(Search Engine Optimization / Optimización de Motores de Búsqueda)</p>
            <p>
              Auditoría integral e indexación en <strong>Google Search Console</strong> y <strong>Bing Webmaster Tools</strong>.
              <br><br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Configuración de <strong>sitemap.xml</strong> multilingüe y <strong>robots.txt</strong>.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Implementación de etiquetas <strong>canonical</strong> y <strong>hreflang</strong>.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Corrección de errores de rastreo, coberturas e indexación de URLs.
            </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustaría%20consultar%20sobre%20Servicios%20SEO%20Técnico%20&%20Search%20Console" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Consultar por WhatsApp
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
            <h4>GEO &amp; Visibilidad en Motores de IA</h4>
            <p>(Generative Engine Optimization / Optimizacion de Motores Generativos)</p>
            <p>
              Optimización estructurada para que los sistemas de IA entiendan mejor tu empresa y su contenido público.
              <br><br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Marcado de datos estructurados <strong>JSON-LD (Schema.org)</strong>.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Configuración de permisos explícitos para rastreadores de IA (GPTBot, ClaudeBot).<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Mapeo de grafo de entidad para máxima autoridad conceptual.
            </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustaría%20consultar%20sobre%20Servicios%20GEO%20&%20Indexación%20en%20IA" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Consultar por WhatsApp
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
            <h4>Core Web Vitals &amp; Rendimiento WPO</h4>
            <p>
              Velocidad de carga extrema y tiempos de respuesta mínimos en el servidor (TTFB) en ColdFusion, Lucee e IIS/AWS.
              <br><br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Optimización de imágenes WebP/AVIF y minificación JS/CSS.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Tuning de caché de servidor y base de datos.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Máximas puntuaciones en <strong>Google PageSpeed Insights</strong>.
            </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustaría%20consultar%20sobre%20Servicios%20WPO%20&%20Core%20Web%20Vitals" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Consultar por WhatsApp
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
            <h4>Soluciones de <em>Automatización con IA</em></h4>
            <img src="/assets/images/heading-line-dec.png" alt="">
            <p>Integración de Inteligencia Artificial, agentes autónomos y automatización inteligente de procesos para optimizar la eficiencia operativa y acelerar el desarrollo.</p>
          </div>
        </div>
      </div>
      <div class="row">
        <!-- Card 1: Integracion de APIs de IA -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="service-item first-service" style="border-top: 4px solid #0077b5;">
            <div style="text-align:left!important">
              <i class="fas fa-network-wired fa-2x" style="color: #0077b5; margin-bottom: 15px;"></i>
            </div>
            <h4>Integración de APIs de IA (LLMs)</h4>
            <p>
              Integración de OpenAI, Claude, Gemini y otros modelos de lenguaje líderes con sistemas web existentes en ColdFusion, Lucee, PHP o Node.js.
              <br><br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Arquitecturas <strong>RAG</strong> (Retrieval-Augmented Generation) y bases vectoriales.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Asistentes virtuales inteligentes y agentes de atención 24/7.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Procesamiento automatizado de documentos, contratos y texto no estructurado.
            </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustar%C3%ADa%20consultar%20sobre%20Integraci%C3%B3n%20de%20APIs%20de%20IA" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Consultar por WhatsApp
              </a>
            </div>
          </div>
        </div>
        <!-- Card 2: Automatizacion de Procesos Empresariales -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="service-item second-service" style="border-top: 4px solid #14a800;">
            <div style="text-align:left!important">
              <i class="fas fa-cogs fa-2x" style="color: #14a800; margin-bottom: 15px;"></i>
            </div>
            <h4>Automatización de Flujos Empresariales</h4>
            <p>
              Automatización inteligente de procesos en CRMs, ERPs y plataformas de comercio electrónico.
              <br><br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Clasificación automática de clientes potenciales y respuestas inteligentes.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Integración de webhooks, automatización de facturación y reportes.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Eliminación de tareas manuales repetitivas aumentando la velocidad operativa.
            </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustar%C3%ADa%20consultar%20sobre%20Automatizaci%C3%B3n%20de%20Flujos%20Empresariales" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Consultar por WhatsApp
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
            <h4>Desarrollo Acelerado con IA</h4>
            <p>
              Ingeniería de prompts y uso estratégico de asistentes de IA y herramientas de desarrollo basadas en modelos de lenguaje líderes para acelerar el desarrollo de software.
              <br><br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Refactorización automatizada de código legacy ColdFusion.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Generación instantánea de pruebas unitarias y documentación técnica.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Reducción de tiempos de entrega hasta en un 60% garantizando máxima calidad.
            </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustar%C3%ADa%20consultar%20sobre%20Desarrollo%20Acelerado%20con%20IA" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Consultar por WhatsApp
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
            <h4>Cursos &amp; Capacitación <em>vía Zoom</em></h4>
            <img src="/assets/images/heading-line-dec.png" alt="">
            <p>Clases en vivo 1 a 1 y mentores personalizados para desarrolladores y equipos, respaldadas por más de 15 años de experiencia técnica y práctica.</p>
          </div>
        </div>
      </div>
      <div class="row">
        <!-- Curso 1 -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="service-item first-service" style="height: 100%; border-top: 4px solid #0077b5;">
            <div style="text-align:left!important">
              <i class="fas fa-video fa-2x" style="color: #0077b5; margin-bottom: 15px;"></i>
            </div>
            <h4>ColdFusion &amp; Lucee Mastery</h4>
            <p>
              Aprende desde los fundamentos hasta técnicas avanzadas en <strong>Adobe ColdFusion (CF4 a CF2025) y Lucee Server</strong>.
              <br><br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Arquitectura orientada a objetos (OOP) y patrones.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Migración de sistemas legacy antiguos.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Optimización de performance con FusionReactor.
            </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustaría%20consultar%20sobre%20Curso%20ColdFusion%20&%20Lucee" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Consultar por WhatsApp
              </a>
            </div>
          </div>
        </div>
        <!-- Curso 2 -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="service-item second-service" style="height: 100%; border-top: 4px solid #14a800;">
            <div style="text-align:left!important">
              <i class="fas fa-database fa-2x" style="color: #14a800; margin-bottom: 15px;"></i>
            </div>
            <h4>Bases de Datos &amp; AWS Cloud</h4>
            <p>
              Domina el diseño, afinado de consultas y administración de infraestructura en la nube.
              <br><br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Optimization de SQL Server, MySQL y PostgreSQL.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Despliegue de servidores IIS y Linux.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Administración de AWS (EC2, RDS, S3, Backups).
            </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustaría%20consultar%20sobre%20Curso%20Bases%20de%20Datos%20&%20AWS" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Consultar por WhatsApp
              </a>
            </div>
          </div>
        </div>
        <!-- Curso 3 -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="service-item third-service" style="height: 100%; border-top: 4px solid #4e4376;">
            <div style="text-align:left!important">
              <i class="fas fa-robot fa-2x" style="color: #4e4376; margin-bottom: 15px;"></i>
            </div>
            <h4>APIs &amp; Programación con IA</h4>
            <p>
              Acelera tu desarrollo creando integraciones modernas y potenciando tu flujo con Inteligencia Artificial.
              <br><br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> APIs RESTful y seguridad JWT.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Integración de Zoom, JustCall, Calendly.<br>
              <i class="fas fa-check-circle" style="color: #14a800; font-size: 0.85rem; margin-right: 6px;"></i> Prompt Engineering avanzado con ChatGPT, Claude Code y Gemini.
            </p>
            <div class="card-wa-btn-wrap">
              <a href="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustaría%20consultar%20sobre%20Curso%20APIs%20&%20Programación%20con%20IA" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Consultar por WhatsApp
              </a>
            </div>
          </div>
        </div>
      </div>
      <div class="row" style="margin-top: 20px;">
        <div class="col-lg-12 text-center">
          <div style="background: #fff; padding: 30px; border-radius: 15px; box-shadow: 0 5px 20px rgba(0,0,0,0.05); display: inline-block; max-width: 700px;">
            <h5 style="font-weight: 700; color: #2a2a2a; margin-bottom: 10px;"><i class="fas fa-graduation-cap" style="color: #14a800;"></i> ¿Te interesa coordinar una clase o entrenamiento para tu equipo?</h5>
            <p style="margin-bottom: 20px;">Sesiones flexibles en vivo vía Zoom adaptadas a tus necesidades o proyectos específicos.</p>
            <a href="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20interesan%20tus%20cursos%20via%20Zoom" target="_blank" class="btn-social btn-upwork" style="display: inline-flex;">
              <i class="fab fa-whatsapp"></i> Consultar por WhatsApp
            </a>
            <a href="mailto:flavio.di.virgilio@gmail.com?subject=Consulta%20Cursos%20Zoom%20ColdFusion" class="btn-social btn-linkedin" style="display: inline-flex;">
              <i class="fa fa-envelope"></i> Consultar por Email
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
            <h4>Nuestras <em>Herramientas Gratuitas</em></h4>
            <img src="/assets/images/heading-line-dec.png" alt="">
            <p>Una colección creciente de herramientas gratuitas para desarrolladores, profesionales de marketing y tareas de productividad diaria. Te mostramos 2 herramientas destacadas por categoría, aunque hay muchas más para explorar. <a href="/es/tools">Ver todas</a>.</p>
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
              local.ftCard.categoryLabel = local.ftCat.labelEs;
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
            <h4>#local.ftCard.titleEs#</h4>
            <p>#local.ftCard.descEs#</p>
            <a href="/es/tools/#local.ftCard.slug#" class="btn-social btn-linkedin">
              <i class="fas fa-arrow-right"></i> Ver Herramienta
            </a>
          </div>
        </cfloop>
      </div>
    </div>
    </cfoutput>
    <div class="container">
      <div class="row">
        <div class="col-lg-12 text-center">
          <a href="/es/tools" class="btn-social btn-upwork">
            <i class="fas fa-th-large"></i> Ver Todas las Herramientas
          </a>
        </div>
      </div>
    </div>
  </div>
  <cfoutput>#request.homeProjectsSection#</cfoutput>
  <cfif false><!-- Legacy personal resume content moved to /es/flavio-di-virgilio -->
  <div id="about" class="about-us section">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 align-self-center">
          <div class="section-heading">
            <h4>Sobre <em>Flavio Di Virgilio</em> &amp; Trayectoria</h4>
            <img src="/assets/images/heading-line-dec.png" alt="">
            <p>Analista de Sistemas graduado de la Universidad J.F. Kennedy de Buenos Aires y Diseñador Multimedia de la Escuela Da Vinci, Flavio cuenta con más de 15 años de experiencia práctica en desarrollo Full-Stack en ColdFusion/CFML, diseño de arquitecturas orientadas a bases de datos y administración de servidores.
            Ha liderado e implementado sistemas de comercio electrónico, diagnóstico médico e historial clínico (NQMBC), integración de servicios web (JWT, REST), gestión de clientes en tiempo real y administración de infraestructura en la nube AWS (EC2, RDS, S3).
            Freelancer Top Rated Plus en Upwork (100% Job Success, +9,700 horas registradas), se destaca por sus sólidas habilidades lógicas y de resolución de problemas, su autogestión y la aplicación proactiva de herramientas de IA (ChatGPT, Claude, Codex, Gemini) para potenciar la productividad y la calidad del desarrollo.</p>
          </div>
          <div class="row">
            <div class="col-lg-6">
              <div class="box-item">
                <h4><a href="#services">Optimización de Rendimiento</a></h4>
                <p>Refactorización de código legacy, diagnóstico con FusionReactor y tuning de consultas SQL Server y MySQL.</p>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="box-item">
                <h4><a href="#services">Infraestructura &amp; Cloud AWS</a></h4>
                <p>Administración de servidores Windows/Linux, IIS Web Server, AWS EC2, RDS (snapshots/restores) y buckets S3.</p>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="box-item">
                <h4><a href="#services">Integración de APIs &amp; REST</a></h4>
                <p>Conexión e integración fluida de APIs de terceros como Zoom, JustCall, Calendly, JWT y servicios web.</p>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="box-item">
                <h4><a href="#services">IA &amp; Prompt Engineering</a></h4>
                <p>Uso avanzado de herramientas de IA (ChatGPT, Claude Code, Gemini) para acelerar el desarrollo y mantener la máxima calidad.</p>
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
            <h4>Stack Tecnológico &amp; <em>Habilidades</em></h4>
            <img src="/assets/images/heading-line-dec.png" alt="">
            <p>Dominio amplio y actualizado de lenguajes, frameworks, bases de datos y herramientas de infraestructura cloud.</p>
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
                            <h4>WordPress, PHP &amp; Python</h4>
                          </div>
                          <div class="col-lg-4 col-sm-4 col-12">
                            <h4>IA Prompt Engineer</h4>
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
                                <p>Especializado en todas las versiones de Adobe ColdFusion (CF4 a CF2025), Lucee Server, arquitectura Fusebox y OOP. Experiencia profunda en desarrollo orientado a objetos, seguridad y migración de plataformas legadas.</p>
                              </div>
                              <div class="down-content">
                                <div class="right-content">
                                  <h4>ColdFusion &amp; CFML Core</h4>
                                  <span>Desarrollo Backend &amp; Arquitectura</span>
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
                                <p>Diseño y administración de bases de datos relacionales y NoSQL de alto rendimiento: Microsoft SQL Server, MySQL, PostgreSQL y MongoDB. Optimización de queries complejas, Stored Procedures e índices.</p>
                              </div>
                              <div class="down-content">
                                <div class="right-content">
                                  <h4>Bases de Datos Relacionales</h4>
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
                                <p>Desarrollo frontend dinámico e interactivo utilizando JavaScript moderno, jQuery, AJAX, React.js, Node.js, Bootstrap y diseños responsivos adaptados a la mejor experiencia del usuario.</p>
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
                                <p>Gestión integral de infraestructura en la nube de Amazon Web Services (EC2, RDS snapshots/restores, buckets S3, Security Groups), servidores IIS en Windows y administración de ambientes Linux.</p>
                              </div>
                              <div class="down-content">
                                <div class="right-content">
                                  <h4>AWS Cloud &amp; Server Administration</h4>
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
                                <p>Integración de servicios web RESTful, seguridad JWT, PHP, soluciones avanzadas en WordPress y aplicación estratégica de herramientas de IA (ChatGPT, Claude, Codex) para maximizar la velocidad de entrega.</p>
                              </div>
                              <div class="down-content">
                                <div class="right-content">
                                  <h4>APIs, WordPress &amp; IA Applied</h4>
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
