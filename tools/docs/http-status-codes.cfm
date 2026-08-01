<cfscript>
local.faqItems = local.isEs ? [
  {q: "¿Qué significa un código 429?", a: """Too Many Requests"" (demasiadas solicitudes): indica que se superó el límite de tasa (rate limit) que el servidor permite para ese cliente en un período de tiempo determinado."},
  {q: "¿Está la lista completa de todos los códigos HTTP?", a: "Cubre los códigos más comunes y usados en el día a día del desarrollo web (1xx a 5xx). Para el listado exhaustivo y oficial, la referencia definitiva es el registro de la IANA."},
  {q: "¿Cuál es la diferencia entre un 301 y un 302?", a: "301 es una redirección permanente (los buscadores actualizan el índice al nuevo destino); 302 es una redirección temporal (el destino original se sigue considerando el válido)."}
] : [
  {q: "What does a 429 status code mean?", a: """Too Many Requests"": it means the rate limit the server allows for that client within a given time window has been exceeded."},
  {q: "Is this a complete list of every HTTP status code?", a: "It covers the codes most commonly used in day-to-day web development (1xx through 5xx). For the exhaustive, official list, the definitive reference is the IANA registry."},
  {q: "What's the difference between a 301 and a 302?", a: "301 is a permanent redirect (search engines update their index to the new destination); 302 is a temporary redirect (the original destination is still considered the valid one)."}
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
      Referencia estática: la búsqueda funciona 100% en tu navegador, sin consultas a ningún servidor.
    <cfelse>
      Static reference: search runs 100% in your browser, with no calls to any server.
    </cfif>
  </div>

  <h2>
    <i class="fas fa-info-circle"></i>
    <cfif local.isEs>Guía Completa y Preguntas Frecuentes<cfelse>Complete Guide &amp; FAQ</cfif>
  </h2>

  <h3><cfif local.isEs>¿Qué es la Referencia de Códigos de Estado HTTP?<cfelse>What is the HTTP Status Code Reference?</cfif></h3>
  <p>
    <cfif local.isEs>
      Una tabla buscable con los códigos de estado HTTP más comunes (200, 301, 404, 500, etc.), su nombre oficial y una descripción breve de qué significan, para consultar rápido durante el desarrollo o la depuración de una API.
    <cfelse>
      A searchable table of the most common HTTP status codes (200, 301, 404, 500, etc.), their official name, and a brief description of what they mean, for quick lookup during development or API debugging.
    </cfif>
  </p>

  <h3><cfif local.isEs>Qué incluye<cfelse>What it includes</cfif></h3>
  <ul>
    <li><cfif local.isEs><strong>Búsqueda instantánea:</strong> filtrá por número de código, nombre o palabra dentro de la descripción.<cfelse><strong>Instant search:</strong> filter by code number, name, or a word inside the description.</cfif></li>
    <li><cfif local.isEs><strong>Cobertura de las 5 categorías:</strong> informativos (1xx), éxito (2xx), redirección (3xx), error del cliente (4xx) y error del servidor (5xx).<cfelse><strong>Coverage of all 5 categories:</strong> informational (1xx), success (2xx), redirection (3xx), client error (4xx), and server error (5xx).</cfif></li>
  </ul>

  <h3><cfif local.isEs>Preguntas Frecuentes (FAQ)<cfelse>Frequently Asked Questions (FAQ)</cfif></h3>
  <div class="faq-grid">
    <cfloop array="#local.faqItems#" index="local.httpFaq">
      <div class="faq-card">
        <h4>#local.httpFaq.q#</h4>
        <p>#local.httpFaq.a#</p>
      </div>
    </cfloop>
  </div>
</section>
</cfoutput>
