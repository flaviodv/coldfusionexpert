<cfscript>
local.faqItems = local.isEs ? [
  {q: "¿Qué nivel de corrección de errores debería usar?", a: "Bajo (L) alcanza para uso digital normal. Elegí uno más alto (Q o H) si vas a imprimir el código en tamaño chico o si podría ensuciarse o dañarse parcialmente, ya que siguen siendo legibles con parte del patrón cubierto."},
  {q: "¿El código QR expira o deja de funcionar?", a: "No. Es una imagen estática que codifica el texto o la URL directamente; no depende de nuestro servidor ni de ningún servicio externo, así que no expira ni se puede desactivar."},
  {q: "¿Puedo usar el mismo QR para una URL que cambia con el tiempo?", a: "No directamente: el QR codifica el texto tal cual lo generaste. Si necesitás que el destino sea editable después de imprimir el código, generá el QR apuntando a un acortador de enlaces propio que vos controles."}
] : [
  {q: "Which error correction level should I use?", a: "Low (L) is enough for regular digital use. Pick a higher level (Q or H) if you'll print the code small or it could get partially dirty or damaged, since it stays readable even with part of the pattern covered."},
  {q: "Does the QR code expire or stop working?", a: "No. It's a static image that encodes the text or URL directly; it doesn't depend on our server or any external service, so it never expires or can be disabled."},
  {q: "Can I use the same QR for a URL that changes over time?", a: "Not directly: the QR encodes the text exactly as generated. If you need the destination to stay editable after printing the code, generate the QR pointing at a link shortener you control."}
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
      El código QR se genera 100% en tu navegador (Canvas API); el contenido nunca se envía a un servidor.
    <cfelse>
      The QR code is generated 100% in your browser (Canvas API); the content is never sent to a server.
    </cfif>
  </div>

  <h2>
    <i class="fas fa-info-circle"></i>
    <cfif local.isEs>Guía Completa y Preguntas Frecuentes<cfelse>Complete Guide &amp; FAQ</cfif>
  </h2>

  <h3><cfif local.isEs>¿Qué es el Generador de Códigos QR?<cfelse>What is the QR Code Generator?</cfif></h3>
  <p>
    <cfif local.isEs>
      Convierte cualquier texto o URL en un código QR personalizado al instante. Elegí colores, tamaño y nivel de corrección de errores, y descargá el resultado en <strong>PNG</strong> o <strong>SVG</strong> listo para imprimir o publicar.
    <cfelse>
      It turns any text or URL into a custom QR code instantly. Choose colors, size, and error correction level, and download the result as <strong>PNG</strong> or <strong>SVG</strong> ready to print or publish.
    </cfif>
  </p>

  <h3><cfif local.isEs>Opciones disponibles<cfelse>Available options</cfif></h3>
  <ul>
    <li><cfif local.isEs><strong>Colores personalizados:</strong> color de trazo y de fondo, para combinar con tu identidad de marca.<cfelse><strong>Custom colors:</strong> foreground and background color, to match your brand identity.</cfif></li>
    <li><cfif local.isEs><strong>Tamaño ajustable:</strong> de 200x200 hasta 800x800 píxeles.<cfelse><strong>Adjustable size:</strong> from 200x200 up to 800x800 pixels.</cfif></li>
    <li><cfif local.isEs><strong>Corrección de errores:</strong> cuatro niveles (L, M, Q, H) según cuánto daño o suciedad deba tolerar el código.<cfelse><strong>Error correction:</strong> four levels (L, M, Q, H) depending on how much damage or dirt the code needs to tolerate.</cfif></li>
    <li><cfif local.isEs><strong>Descarga en PNG o SVG:</strong> el SVG es ideal para imprimir en gran tamaño sin perder nitidez.<cfelse><strong>PNG or SVG download:</strong> SVG is ideal for large-format printing without losing sharpness.</cfif></li>
  </ul>

  <h3><cfif local.isEs>Preguntas Frecuentes (FAQ)<cfelse>Frequently Asked Questions (FAQ)</cfif></h3>
  <div class="faq-grid">
    <cfloop array="#local.faqItems#" index="local.qrFaq">
      <div class="faq-card">
        <h4>#local.qrFaq.q#</h4>
        <p>#local.qrFaq.a#</p>
      </div>
    </cfloop>
  </div>
</section>
</cfoutput>
