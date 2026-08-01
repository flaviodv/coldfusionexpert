<cfscript>
local.faqItems = local.isEs ? [
  {q: "¿Qué formato debe tener el número de teléfono?", a: "Solo dígitos, con el código de país incluido y sin el signo +, espacios o guiones. Por ejemplo, para Argentina: 5492236026142."},
  {q: "¿Funciona para cualquier país?", a: "Sí, mientras uses el código de país correcto de ese destino, el enlace wa.me funciona a nivel mundial."},
  {q: "¿El mensaje predefinido es obligatorio?", a: "No, es opcional. Si lo dejás vacío, el enlace abre el chat sin ningún texto cargado."}
] : [
  {q: "What format should the phone number be in?", a: "Digits only, including the country code, with no plus sign, spaces, or dashes. For example, for Argentina: 5492236026142."},
  {q: "Does it work for any country?", a: "Yes, as long as you use that destination's correct country code, wa.me links work worldwide."},
  {q: "Is the pre-filled message required?", a: "No, it's optional. If you leave it empty, the link opens the chat with no text pre-loaded."}
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
      Generación 100% en tu navegador: el número y el mensaje nunca se envían a ningún servidor.
    <cfelse>
      100% browser-based generation: the number and message are never sent to any server.
    </cfif>
  </div>

  <h2>
    <i class="fas fa-info-circle"></i>
    <cfif local.isEs>Guía Completa y Preguntas Frecuentes<cfelse>Complete Guide &amp; FAQ</cfif>
  </h2>

  <h3><cfif local.isEs>¿Qué es el Generador de Enlaces de WhatsApp?<cfelse>What is the WhatsApp Link Generator?</cfif></h3>
  <p>
    <cfif local.isEs>
      Crea enlaces <code>wa.me</code> directos que abren una conversación de WhatsApp con un mensaje predefinido, sin necesidad de tener el número guardado en la agenda. Ideal para botones de contacto en sitios web, firmas de email o campañas de redes sociales.
    <cfelse>
      It creates direct <code>wa.me</code> links that open a WhatsApp conversation with a pre-filled message, with no need to have the number saved as a contact. Ideal for contact buttons on websites, email signatures, or social media campaigns.
    </cfif>
  </p>

  <h3><cfif local.isEs>Cómo usarlo<cfelse>How to use it</cfif></h3>
  <ul>
    <li><cfif local.isEs><strong>Número con código de país:</strong> ingresá solo dígitos, sin el signo +.<cfelse><strong>Number with country code:</strong> enter digits only, no + sign.</cfif></li>
    <li><cfif local.isEs><strong>Mensaje predefinido (opcional):</strong> se carga automáticamente en el campo de texto de WhatsApp.<cfelse><strong>Pre-filled message (optional):</strong> loads automatically into WhatsApp's text field.</cfif></li>
    <li><cfif local.isEs><strong>Copiar o probar el enlace:</strong> copiá el link generado o abrilo directamente para verificarlo antes de publicarlo.<cfelse><strong>Copy or test the link:</strong> copy the generated link or open it directly to verify it before publishing.</cfif></li>
  </ul>

  <h3><cfif local.isEs>Preguntas Frecuentes (FAQ)<cfelse>Frequently Asked Questions (FAQ)</cfif></h3>
  <div class="faq-grid">
    <cfloop array="#local.faqItems#" index="local.waFaq">
      <div class="faq-card">
        <h4>#local.waFaq.q#</h4>
        <p>#local.waFaq.a#</p>
      </div>
    </cfloop>
  </div>
</section>
</cfoutput>
