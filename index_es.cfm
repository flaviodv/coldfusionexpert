  <div class="main-banner wow fadeIn" id="top" data-wow-duration="1s" data-wow-delay="0.5s">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="row">
            <div class="col-lg-6 align-self-center">
              <div class="left-content show-up header-text wow fadeInLeft" data-wow-duration="1s" data-wow-delay="1s">
                <div class="row">
                  <div class="col-lg-12">
                    <span class="badge-experience"><i class="fas fa-award"></i> +15 Años de Experiencia | Senior Full-Stack Developer</span>
                    <span class="hero-eyebrow">ColdFusion Expert</span>
                    <h1>Flavio Di Virgilio</h1>
                    <h3>ColdFusion Senior Developer<br>&amp; AWS / Server Administrator</h3>
                    <h5>Especialista en aplicaciones web de alto rendimiento, arquitectura de datos, migración de sistemas legacy y optimización Cloud.</h5>
                    <div class="hero-stats">
                      <span class="badge-upwork" style="white-space: nowrap;"><i class="fas fa-check-circle"></i> Upwork Top Rated Plus</span>
                      <span class="hero-stat"><i class="fas fa-check-circle" style="background-color:white; border-radius: 20px;"></i> 100% Job Success</span><br>
                    </div>
                    <div class="hero-stats">
                      <span class="hero-stat"><i class="fas fa-check-circle" style="background-color:white; border-radius: 20px;"></i> +9,700 Horas</span>
                      <span class="hero-stat"><i class="fas fa-check-circle" style="background-color:white; border-radius: 20px;"></i> +70 Proyectos Exitosos</span>
                    </div>
                    <div class="hero-availability"><i class="far fa-clock"></i> Disponibilidad flexible para América (EST/PST)</div>
                    <div class="hero-actions">
                      <a href="https://wa.me/5492236026142?text=Hola%20Flavio,%20hablemos%20de%20mi%20proyecto" target="_blank" rel="noopener" class="btn-social btn-upwork">
                        <i class="fab fa-whatsapp"></i> Hablemos de tu proyecto
                      </a>
                      <a href="https://www.upwork.com/freelancers/coldfusionexpert" target="_blank" class="hero-upwork-link">
                        <img src="/assets/images/upwork-perfil.webp" class="hero-upwork-image" alt="Perfil de Upwork">
                      </a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6">
              <div class="right-image wow fadeInRight" data-wow-duration="1s" data-wow-delay="0.5s">
                <div class="hero-blink-frame">
                  <cfoutput><img src="/assets/images/flavio-ondas-sin-marco.webp#request.heroImageVer#" alt="ColdFusion Expert" class="hero-profile-image hero-profile-open"></cfoutput>
                  <cfoutput><img src="/assets/images/flavio-ondas-ojos-cerrados.webp#request.heroBlinkImageVer#" alt="" aria-hidden="true" class="hero-profile-image hero-profile-closed"></cfoutput>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script>
  (function () {
    function iniciarParpadeoHero() {
      var retrato = document.querySelector('.main-banner .right-image');
      if (!retrato) return;
      function parpadear() {
        retrato.classList.add('is-blinking');
        window.setTimeout(function () {
          retrato.classList.remove('is-blinking');
          window.setTimeout(parpadear, 5500 + Math.random() * 6500);
        }, 100);
      }
      window.setTimeout(parpadear, 4000);
    }
    if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', iniciarParpadeoHero);
    else iniciarParpadeoHero();
  }());
  </script>
  <div id="services" class="services section">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 offset-lg-2">
          <div class="section-heading  wow fadeInDown" data-wow-duration="1s" data-wow-delay="0.5s">
            <h4> <em>Servicios Especializados </em> </h4>
            <img src="assets/images/heading-line-dec.png" alt="">
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
                <source class="servce_img" srcset="assets/images/ColdFusion Consulting Service.svg" type="image/webp">
                <img class="servce_img " src="assets/images/ColdFusion Consulting Service.svg" alt="ColdFusion Consulting" width="40" height="40">
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
                <source class="servce_img" srcset="assets/images/ColdFusion Web Application Development.svg" type="image/webp">
                <img class="servce_img " src="assets/images/ColdFusion Web Application Development.svg" alt="ColdFusion Web Application Development" width="40" height="40">
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
                <source class="servce_img" srcset="assets/images/ColdFusion Web Service Development.svg" type="image/webp">
                <img class="servce_img " src="assets/images/ColdFusion Web Service Development.svg" alt="ColdFusion Web Service Development" width="40" height="40">
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
                <source class="servce_img" srcset="assets/images/ColdFusion CMS Development.svg" type="image/webp">
                <img class="servce_img " src="assets/images/ColdFusion CMS Development.svg" alt="ColdFusion CMS & CRM Development" width="40" height="40">
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
                <source class="servce_img" srcset="assets/images/ColdFusion Maintenance and Enhancement.svg" type="image/webp">
                <img class="servce_img " src="assets/images/ColdFusion Maintenance and Enhancement.svg" alt="ColdFusion Maintenance and AWS" width="40" height="40">
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
              <a href="https://wa.me/5492236026142?text=Hola%20Flavio,%20me%20gustaría%20consultar%20sobre%20Marketing%20Digital" target="_blank" class="btn-social btn-upwork" style="font-size: 0.82rem; padding: 6px 14px; margin: 0; display: inline-flex;">
                <i class="fab fa-whatsapp"></i> Consultar por WhatsApp
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
    <div id="pricing" class="pricing-tables">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 offset-lg-2">
          <div class="section-heading">
            <h4>Experiencia <em>Profesional </em> &amp; Proyectos</h4>
            <img src="assets/images/heading-line-dec.png" alt="">
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
            <span style="font-size: 0.85rem; color: #14a800; font-weight: bold;">Trabajo Actual | Agencia Digital US</span>
            <div class="icon">
            <img src="/assets/images/projects/firebrand.webp" class="project-card-image" alt="Firebrand Creative">
            </div>
            <ul>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i><strong>Sitio Oficial</strong>: <a href="https://iamfirebrand.com/" target="_blank" style="color:#0077b5; font-weight:600;">iamfirebrand.com</a></li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Desarrollo senior continuo para la agencia norteamericana Firebrand Creative.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Construcción, optimización y mantenimiento de sistemas web para diversos clientes globales.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i>Integraciones backend, desarrollo ColdFusion / PHP y soporte de plataformas complejas.</li>
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
            <span style="font-size: 0.85rem; color: #4b6cb7; font-weight: bold;">Sep 2025 - Presente</span>
            <div class="icon">
              <img src="assets/images/pricing-table-01.png" alt="Makeway">
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
              <img src="assets/images/pricing-table-01.png" alt="Contensive Svetness CRM">
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
        <!-- Card 6: Third Wave Digital & FortSystems -->
        <div class="col-lg-4 col-md-6" style="margin-bottom: 30px;">
          <div class="pricing-item-pro">
            <h4>Third Wave Digital, FortSystems &amp; 2Connect</h4>
            <span style="font-size: 0.85rem; color: #4b6cb7; font-weight: bold;">2011 - 2020</span>
            <div class="icon">
              <img src="assets/images/pricing-table-01.png" alt="Third Wave Digital">
            </div>
            <ul>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i><strong>Third Wave Digital (2019)</strong>: Sistema de diagnóstico e historial clínico para cáncer de mama (NQMBC).</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i><strong>FortSystems (2011-2018)</strong>: Desarrollo y administración de 800wine.com y plataformas multitienda.</li>
              <li><i class="fas fa-check-circle" style="color: #14a800; margin-right: 6px;"></i><strong>2Connect (2018-2020)</strong>: Desarrollo de plataforma web interactiva con ColdFusion, MySQL y Bootstrap.</li>
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
  <div id="seo" class="services section" style="padding-top: 80px; padding-bottom: 80px;">
    <div class="container">
      <div class="row">
        <div class="col-lg-8 offset-lg-2">
          <div class="section-heading wow fadeInDown" data-wow-duration="1s" data-wow-delay="0.5s">
            <h4>Optimización <em>SEO &amp; GEO (IA)</em></h4>
            <img src="assets/images/heading-line-dec.png" alt="">
            <p>Estrategias avanzadas de posicionamiento en motores de búsqueda tradicionales (Google, Bing) y optimización de visibilidad en Inteligencia Artificial (ChatGPT, Perplexity, Claude, Gemini).</p>
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
              Optimización estructurada para que modelos de IA (ChatGPT, Perplexity, Claude) reconozcan y citen tu marca.
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
            <img src="assets/images/heading-line-dec.png" alt="">
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
            <img src="assets/images/heading-line-dec.png" alt="">
            <p>Clases en vivo 1 a 1 y mentores personalizados para desarrolladores y equipos, cubriendo más de 15 años de conocimiento técnico y práctico acumulado.</p>
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
            <img src="assets/images/heading-line-dec.png" alt="">
            <p>Creadas por nosotros: una colección creciente de herramientas gratuitas para desarrolladores, marketing y productividad diaria - dos destacadas por categoría.</p>
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
            <div class="tool-card-icon"><i class="#local.ftCard.iconPrefix# #local.ftCard.icon#"></i></div>
            <h4>#local.ftCard.titleEs#</h4>
            <p>#local.ftCard.descEs#</p>
            <a href="/tools/#local.ftCard.slug#" class="btn-social btn-linkedin">
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
          <a href="/tools" class="btn-social btn-upwork">
            <i class="fas fa-th-large"></i> Ver Todas las Herramientas
          </a>
        </div>
      </div>
    </div>
  </div>
  <div id="about" class="about-us section">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 align-self-center">
          <div class="section-heading">
            <h4>Sobre <em>Flavio Di Virgilio</em> &amp; Trayectoria</h4>
            <img src="assets/images/heading-line-dec.png" alt="">
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
            <img src="assets/images/flavio-ondas-sin-marco.webp" alt="Flavio Di Virgilio - ColdFusion Expert" style="max-width: 85%; border-radius: 24px; box-shadow: 0 15px 35px rgba(0,0,0,0.18); border: 5px solid #ffffff;">
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
            <img src="assets/images/heading-line-dec.png" alt="">
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
                            <h4>WordPress &amp; PHP</h4>
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
                                <img src="assets/images/quote.png" alt="">
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
                                <img src="assets/images/quote.png" alt="">
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
                                <img src="assets/images/quote.png" alt="">
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
                                <img src="assets/images/quote.png" alt="">
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
                                <img src="assets/images/quote.png" alt="">
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
