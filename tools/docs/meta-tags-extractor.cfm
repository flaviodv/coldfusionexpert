<cfprocessingdirective pageencoding="utf-8">
<cfscript>
local.faqItems = local.isEs ? [
  {q: "¿Por qué a veces falla la extracción?", a: "Algunos sitios bloquean solicitudes automáticas o pueden estar temporalmente caídos. Si eso pasa, probá de nuevo más tarde o verificá que la URL sea accesible públicamente."},
  {q: "¿Se guarda la URL que reviso?", a: "No. La URL se usa únicamente para esa consulta puntual y no queda almacenada en nuestros servidores."},
  {q: "¿Qué diferencia hay entre los meta tags y las etiquetas Open Graph?", a: "Los meta tags (title, description, keywords) los usan los buscadores; las etiquetas Open Graph (og:title, og:description, og:image) definen cómo se ve el link al compartirlo en redes sociales como Facebook o LinkedIn."}
] : [
  {q: "Why does extraction sometimes fail?", a: "Some sites block automated requests or may be temporarily down. If that happens, try again later or confirm the URL is publicly accessible."},
  {q: "Do you store the URLs I check?", a: "No. The URL is only used for that single lookup and is never stored on our servers."},
  {q: "What's the difference between meta tags and Open Graph tags?", a: "Meta tags (title, description, keywords) are used by search engines; Open Graph tags (og:title, og:description, og:image) control how the link looks when shared on social networks like Facebook or LinkedIn."}
];
</cfscript>
<cfoutput>
<script type="application/ld+json">
#serializeJSON({
  "@context": "https://schema.org",
  "@type": "FAQPage",
  "mainEntity": local.faqItems.map(function(item) {
    return {"@type": "Question", "name": item.q, "acceptedAnswer": {"@type": "Answer", "text": item.a}};
  })
})#
</script>
<section class="tool-guide-docs">
  <div class="privacy-badge">
    <i class="fas fa-user-shield"></i>
    <cfif local.isEs>
      La URL se consulta al vuelo desde nuestro servidor; no se almacena ningún dato de tu búsqueda.
    <cfelse>
      The URL is fetched on the fly from our server; none of your search data is stored.
    </cfif>
  </div>

  <h2>
    <i class="fas fa-info-circle"></i>
    <cfif local.isEs>Guía Completa y Preguntas Frecuentes<cfelse>Complete Guide &amp; FAQ</cfif>
  </h2>

  <h3><cfif local.isEs>¿Qué es el Extractor de Meta Tags y Datos Estructurados?<cfelse>What is the Meta Tags &amp; Structured Data Extractor?</cfif></h3>
  <p>
    <cfif local.isEs>
      Es una herramienta gratuita para auditar el SEO on-page y los datos estructurados de cualquier sitio web. Ingresá una URL y obtené al instante su <strong>título</strong>, <strong>meta descripción</strong>, <strong>palabras clave</strong>, <strong>URL canónica</strong>, etiquetas <strong>Open Graph y Twitter Cards</strong>, y un desglose completo de sus <strong>datos estructurados Schema.org (JSON-LD)</strong> organizados en pestañas interactivas.
    <cfelse>
      It is a free tool for auditing any website's on-page SEO and structured data. Enter a URL and instantly get its <strong>title</strong>, <strong>meta description</strong>, <strong>keywords</strong>, <strong>canonical URL</strong>, <strong>Open Graph &amp; Twitter Cards</strong>, and a complete breakdown of its <strong>Schema.org (JSON-LD) structured data</strong> organized in interactive tabs.
    </cfif>
  </p>

  <h3><cfif local.isEs>Qué extrae<cfelse>What it extracts</cfif></h3>
  <ul>
    <li><cfif local.isEs><strong>Meta Tags SEO:</strong> Título, descripción (con indicadores de longitud óptima), keywords, robots, viewport, autor y URL canónica (con validación de coincidencia).<cfelse><strong>SEO Meta Tags:</strong> Title, description (with optimal length indicators), keywords, robots, viewport, author, and canonical URL (with mismatch detection).</cfif></li>
    <li><cfif local.isEs><strong>Open Graph y Redes Sociales:</strong> Etiquetas og:title, og:description, og:image, og:type, Twitter Cards y una previsualización de cómo se ve al compartir el enlace.<cfelse><strong>Open Graph &amp; Social:</strong> og:title, og:description, og:image, og:type, Twitter Cards, and a live social snippet preview.</cfif></li>
    <li><cfif local.isEs><strong>Datos Estructurados Schema.org (JSON-LD):</strong> Desglose completo de todas las entidades detectadas (Eventos, Organizaciones, Lugares, Productos, FAQs, etc.) con todas sus propiedades anidadas, fechas, imágenes y ofertas.<cfelse><strong>Schema.org Structured Data (JSON-LD):</strong> Full inspection of detected entities (Events, Organizations, Places, Products, FAQs, etc.) with all nested properties, dates, images, and offers.</cfif></li>
    <li><cfif local.isEs><strong>Código JSON-LD Raw:</strong> Visualización del código fuente en bruto formateado, con botón de copia rápida y enlace a la herramienta Rich Results Test de Google.<cfelse><strong>Raw JSON-LD Code:</strong> Formatted source script blocks with quick copy button and link to Google Rich Results Test.</cfif></li>
  </ul>

  <h3><cfif local.isEs>Preguntas Frecuentes (FAQ)<cfelse>Frequently Asked Questions (FAQ)</cfif></h3>
  <div class="faq-grid">
    <cfloop array="#local.faqItems#" index="local.mteFaq">
      <div class="faq-card">
        <h4>#local.mteFaq.q#</h4>
        <p>#local.mteFaq.a#</p>
      </div>
    </cfloop>
  </div>
</section>
</cfoutput>
