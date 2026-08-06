<cfscript>
local.faqItems = local.isEs ? [
  {q: "¿Por qué algunos sitios no se cargan dentro de la herramienta?", a: "Algunos sitios bloquean su visualización dentro de un iframe. Elegí Pestaña externa para abrir la página fuera de la vista previa integrada."},
  {q: "¿Puede actualizar una página después de que navegué a otra dentro del iframe?", a: "Solo si el sitio es del mismo origen. Por seguridad, el navegador no permite que una página conozca la URL a la que navegaste dentro de un iframe de otro sitio, así que en esos casos la herramienta vuelve a cargar la dirección original en lugar de la página actual."},
  {q: "¿Qué pasa si cierro la pestaña externa?", a: "La actualización se detiene. Presioná Iniciar para abrir nuevamente la misma pestaña externa y reiniciar el intervalo."}
] : [
  {q: "Why don't some sites load inside the tool?", a: "Some sites block being displayed in an iframe. Choose External tab to open the page outside the in-page preview."},
  {q: "Can it refresh a page after I navigate to another one inside the iframe?", a: "Only if the site is same-origin. For security reasons, browsers don't let a page know the URL you navigated to inside another site's iframe, so in those cases the tool reloads the original address instead of the current page."},
  {q: "What if I close the external tab?", a: "Refreshing stops. Press Start to reopen the same external tab and restart the interval."}
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
      La herramienta funciona en tu navegador y no guarda credenciales ni sesiones.
    <cfelse>
      This tool runs in your browser and does not store credentials or sessions.
    </cfif>
  </div>

  <h2>
    <i class="fas fa-info-circle"></i>
    <cfif local.isEs>Guía Completa y Preguntas Frecuentes<cfelse>Complete Guide &amp; FAQ</cfif>
  </h2>

  <h3><cfif local.isEs>¿Qué es el Actualizador Automático de Páginas?<cfelse>What is the Page Auto-Refresh tool?</cfif></h3>
  <p>
    <cfif local.isEs>
      Ingresá una URL, elegí el destino y cada cuántos segundos actualizarla. Para la vista previa integrada también podés configurar su alto. Podés escribir solo el dominio, como <code>infobae.com</code>: la herramienta agrega <code>https://</code> automáticamente.
    <cfelse>
      Enter a URL, choose its destination and refresh interval. You can also configure the in-page preview height. Type only a domain, such as <code>infobae.com</code>, and the tool adds <code>https://</code> automatically.
    </cfif>
  </p>

  <h3><cfif local.isEs>Qué hace<cfelse>What it does</cfif></h3>
  <ul>
    <li><cfif local.isEs><strong>Intervalo configurable:</strong> elegí cada cuántos segundos se actualiza, de 10 a 3600.<cfelse><strong>Configurable interval:</strong> choose how often it refreshes, from 10 to 3600 seconds.</cfif></li>
    <li><cfif local.isEs><strong>Altura configurable:</strong> ajustá la vista previa entre 300 y 2000 px.<cfelse><strong>Configurable height:</strong> adjust the preview between 300 and 2000 px.</cfif></li>
    <li><cfif local.isEs><strong>Reinicio rápido:</strong> al presionar Iniciar mientras está activa, la actualización se reinicia con la configuración actual.<cfelse><strong>Quick restart:</strong> pressing Start while active restarts the refresh with the current settings.</cfif></li>
    <li><cfif local.isEs><strong>Dos destinos:</strong> Vista previa integrada conserva el comportamiento dentro de la herramienta; Pestaña externa abre una sola pestaña reutilizable y la actualiza con la URL original.<cfelse><strong>Two destinations:</strong> In-page preview keeps the tool-contained behavior; External tab opens one reusable tab and refreshes it with the original URL.</cfif></li>
  </ul>

  <h3><cfif local.isEs>Limitaciones importantes<cfelse>Important limitations</cfif></h3>
  <p>
    <cfif local.isEs>
      Algunos sitios externos, incluido Upwork, pueden bloquear la visualización dentro de un iframe. Usá Pestaña externa en esos casos. En ambos destinos el refresco vuelve a la URL original ingresada; si navegás a otra dirección dentro de la página, la herramienta no puede conocerla por las reglas de seguridad del navegador.
    <cfelse>
      Some external sites, including Upwork, can block being displayed in an iframe. Use External tab in those cases. In both destinations, refresh returns to the original URL entered; if you navigate elsewhere within the page, browser security prevents the tool from learning that address.
    </cfif>
  </p>

  <h3><cfif local.isEs>Preguntas Frecuentes (FAQ)<cfelse>Frequently Asked Questions (FAQ)</cfif></h3>
  <div class="faq-grid">
    <cfloop array="#local.faqItems#" index="local.refreshFaq">
      <div class="faq-card">
        <h4>#local.refreshFaq.q#</h4>
        <p>#local.refreshFaq.a#</p>
      </div>
    </cfloop>
  </div>
</section>
</cfoutput>
