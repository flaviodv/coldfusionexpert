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

  <h3><cfif local.isEs>¿Qué es el Extractor de Meta Tags y Keywords?<cfelse>What is the Meta Tags &amp; Keyword Extractor?</cfif></h3>
  <p>
    <cfif local.isEs>
      Es una herramienta gratuita para auditar el SEO on-page de cualquier sitio web. Ingresá una URL y obtené al instante su <strong>título</strong>, <strong>descripción</strong>, <strong>palabras clave</strong>, <strong>URL canónica</strong> y sus etiquetas <strong>Open Graph</strong> (incluida la imagen de vista previa), sin instalar extensiones de navegador.
    <cfelse>
      It is a free tool for auditing any website's on-page SEO. Enter a URL and instantly get its <strong>title</strong>, <strong>description</strong>, <strong>keywords</strong>, <strong>canonical URL</strong>, and <strong>Open Graph</strong> tags (including the preview image), with no browser extension required.
    </cfif>
  </p>

  <h3><cfif local.isEs>Qué extrae<cfelse>What it extracts</cfif></h3>
  <ul>
    <li><cfif local.isEs><strong>Título y descripción:</strong> los mismos que Google muestra en los resultados de búsqueda.<cfelse><strong>Title &amp; description:</strong> the same ones Google shows in search results.</cfif></li>
    <li><cfif local.isEs><strong>Palabras clave y URL canónica:</strong> útil para detectar contenido duplicado o mal configurado.<cfelse><strong>Keywords &amp; canonical URL:</strong> useful for catching duplicate or misconfigured content.</cfif></li>
    <li><cfif local.isEs><strong>Open Graph (og:title, og:description, og:image):</strong> con vista previa de la imagen, tal como se vería al compartir el link.<cfelse><strong>Open Graph (og:title, og:description, og:image):</strong> with an image preview, just like it would appear when the link is shared.</cfif></li>
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
