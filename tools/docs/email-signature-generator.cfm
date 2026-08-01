<cfscript>
local.faqItems = local.isEs ? [
  {q: "¿Cómo instalo la firma en Gmail?", a: "Copiá el código HTML, andá a Configuración > Ver todos los ajustes > Firma en Gmail, pegá el código en el editor (o directamente la vista previa, según el navegador) y guardá los cambios."},
  {q: "¿Funciona en todos los clientes de correo?", a: "Está armada con una tabla HTML y estilos en línea, el formato más compatible entre Gmail, Outlook y Apple Mail. Algunos clientes muy restrictivos pueden ignorar ciertos estilos, así que conviene probarla antes de usarla de forma definitiva."},
  {q: "¿Se guardan mis datos en algún servidor?", a: "No. Todo el armado del HTML sucede en tu navegador; nada se envía ni se almacena."}
] : [
  {q: "How do I install the signature in Gmail?", a: "Copy the HTML code, go to Settings > See all settings > Signature in Gmail, paste the code into the editor (or the preview directly, depending on the browser), and save your changes."},
  {q: "Does it work in every email client?", a: "It's built with an HTML table and inline styles, the most widely compatible format across Gmail, Outlook, and Apple Mail. Some very restrictive clients may ignore certain styles, so it's worth testing before relying on it."},
  {q: "Is my data stored on any server?", a: "No. All the HTML is built locally in your browser; nothing is sent or stored."}
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
      Generación 100% local: tu información de contacto nunca sale de tu navegador.
    <cfelse>
      100% local generation: your contact details never leave your browser.
    </cfif>
  </div>

  <h2>
    <i class="fas fa-info-circle"></i>
    <cfif local.isEs>Guía Completa y Preguntas Frecuentes<cfelse>Complete Guide &amp; FAQ</cfif>
  </h2>

  <h3><cfif local.isEs>¿Qué es el Generador de Firmas de Correo Electrónico?<cfelse>What is the Email Signature Generator?</cfif></h3>
  <p>
    <cfif local.isEs>
      Arma una firma de email profesional con vista previa en tiempo real: completá tu nombre, cargo, empresa y datos de contacto, elegí un color de acento y copiá el código HTML listo para pegar en Gmail, Outlook o cualquier cliente de correo.
    <cfelse>
      Build a professional email signature with a live preview: fill in your name, title, company, and contact details, pick an accent color, and copy the ready-to-paste HTML code into Gmail, Outlook, or any mail client.
    </cfif>
  </p>

  <h3><cfif local.isEs>Qué incluye<cfelse>What it includes</cfif></h3>
  <ul>
    <li><cfif local.isEs><strong>Datos de contacto:</strong> nombre, cargo, empresa, teléfono, email y sitio web.<cfelse><strong>Contact details:</strong> name, job title, company, phone, email, and website.</cfif></li>
    <li><cfif local.isEs><strong>Color de acento personalizable:</strong> para que la firma combine con tu marca.<cfelse><strong>Customizable accent color:</strong> so the signature matches your brand.</cfif></li>
    <li><cfif local.isEs><strong>Vista previa en tiempo real:</strong> ves exactamente cómo va a quedar antes de copiarla.<cfelse><strong>Live preview:</strong> see exactly how it will look before copying it.</cfif></li>
    <li><cfif local.isEs><strong>Código HTML compatible:</strong> tabla con estilos en línea, el formato más aceptado por los clientes de correo.<cfelse><strong>Compatible HTML code:</strong> a table with inline styles, the format most widely accepted by mail clients.</cfif></li>
  </ul>

  <h3><cfif local.isEs>Preguntas Frecuentes (FAQ)<cfelse>Frequently Asked Questions (FAQ)</cfif></h3>
  <div class="faq-grid">
    <cfloop array="#local.faqItems#" index="local.sigFaq">
      <div class="faq-card">
        <h4>#local.sigFaq.q#</h4>
        <p>#local.sigFaq.a#</p>
      </div>
    </cfloop>
  </div>
</section>
</cfoutput>
