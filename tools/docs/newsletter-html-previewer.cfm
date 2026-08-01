<cfscript>
local.faqItems = local.isEs ? [
  {q: "¿Es seguro pegar HTML de un proveedor externo?", a: "Sí. La vista previa se renderiza dentro de un iframe en modo sandbox, sin permisos para ejecutar scripts ni acceder al resto del sitio, así que ningún código incrustado (por ejemplo un pixel de tracking con JS) puede afectarte."},
  {q: "¿Puedo pegar un documento HTML completo, con <head> y <style>?", a: "Sí. A diferencia de pegar HTML suelto dentro de una página normal, el iframe interpreta el documento completo (doctype, head, estilos incluidos) tal como lo haría el cliente de correo o el navegador del destinatario."},
  {q: "¿El HTML se envía a algún servidor?", a: "No. Todo el renderizado ocurre en tu navegador; el contenido que pegás nunca sale de tu equipo."}
] : [
  {q: "Is it safe to paste HTML from a third-party vendor?", a: "Yes. The preview renders inside a sandboxed iframe with no permission to run scripts or reach the rest of the site, so no embedded code (like a tracking pixel's JS) can affect you."},
  {q: "Can I paste a full HTML document, with <head> and <style>?", a: "Yes. Unlike pasting raw HTML into a normal page, the iframe interprets the full document (doctype, head, and styles included) the same way the recipient's email client or browser would."},
  {q: "Is the HTML sent to any server?", a: "No. All rendering happens in your browser; the content you paste never leaves your machine."}
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
      Vista previa en un iframe con sandbox: sin scripts, sin acceso al resto del sitio, todo local.
    <cfelse>
      Sandboxed iframe preview: no scripts, no access to the rest of the site, everything stays local.
    </cfif>
  </div>

  <h2>
    <i class="fas fa-info-circle"></i>
    <cfif local.isEs>Guía Completa y Preguntas Frecuentes<cfelse>Complete Guide &amp; FAQ</cfif>
  </h2>

  <h3><cfif local.isEs>¿Qué es el Previsualizador de HTML para Newsletters?<cfelse>What is the Newsletter HTML Previewer?</cfif></h3>
  <p>
    <cfif local.isEs>
      Pegá el código HTML que te mandó tu diseñador, agencia o plataforma de email marketing y vela renderizada exactamente como se va a ver antes de enviarla a tu lista de contactos, sin depender de un envío de prueba.
    <cfelse>
      Paste the HTML your designer, agency, or email marketing platform sent you and see it rendered exactly as it will look before sending it to your contact list, with no test send required.
    </cfif>
  </p>

  <h3><cfif local.isEs>Cómo funciona<cfelse>How it works</cfif></h3>
  <ul>
    <li><cfif local.isEs><strong>Pegá el código HTML completo:</strong> incluyendo estilos incrustados, tal como te lo entregaron.<cfelse><strong>Paste the full HTML code:</strong> including embedded styles, exactly as delivered to you.</cfif></li>
    <li><cfif local.isEs><strong>Renderizado aislado:</strong> el preview corre en un iframe separado, así los estilos de la newsletter no chocan con los del sitio.<cfelse><strong>Isolated rendering:</strong> the preview runs in a separate iframe, so the newsletter's styles never clash with the site's own.</cfif></li>
    <li><cfif local.isEs><strong>Un solo click:</strong> botón Renderizar para actualizar la vista previa cada vez que edites el código.<cfelse><strong>One click:</strong> a Render button to refresh the preview every time you edit the code.</cfif></li>
  </ul>

  <h3><cfif local.isEs>Preguntas Frecuentes (FAQ)<cfelse>Frequently Asked Questions (FAQ)</cfif></h3>
  <div class="faq-grid">
    <cfloop array="#local.faqItems#" index="local.nlpFaq">
      <div class="faq-card">
        <h4>#encodeForHTML(local.nlpFaq.q)#</h4>
        <p>#encodeForHTML(local.nlpFaq.a)#</p>
      </div>
    </cfloop>
  </div>
</section>
</cfoutput>
