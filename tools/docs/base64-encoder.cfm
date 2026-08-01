<cfscript>
local.faqItems = local.isEs ? [
  {q: "Si decodifico una imagen, ¿por qué no veo el texto sino la imagen?", a: "La herramienta detecta automáticamente la firma de bytes de formatos de imagen comunes (PNG, JPEG, GIF, WEBP, BMP) y, en vez de mostrarte el contenido binario ilegible como texto, arma un data URL y te muestra la imagen decodificada directamente."},
  {q: "¿Hay un límite de tamaño de archivo para codificar?", a: "No hay un límite fijo impuesto por la herramienta; depende de la memoria disponible en tu navegador. Funciona sin problemas con imágenes y archivos de tamaño típico (hasta varios MB)."},
  {q: "¿Qué significa el error ""El valor no es Base64 válido""?", a: "Aparece cuando el texto pegado en el campo de decodificación contiene caracteres que no forman parte del alfabeto Base64, o cuando la cadena está incompleta/corrupta."}
] : [
  {q: "If I decode an image, why do I see the image instead of text?", a: "The tool automatically detects the byte signature of common image formats (PNG, JPEG, GIF, WEBP, BMP) and, instead of showing you unreadable binary content as text, builds a data URL and displays the decoded image directly."},
  {q: "Is there a file size limit for encoding?", a: "There's no fixed limit imposed by the tool; it depends on your browser's available memory. It works fine with typical-sized images and files (up to several MB)."},
  {q: "What does the ""The value is not valid Base64"" error mean?", a: "It appears when the text pasted into the decode field contains characters outside the Base64 alphabet, or when the string is incomplete or corrupted."}
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
      Codificación y decodificación 100% en tu navegador: nada se sube a ningún servidor.
    <cfelse>
      100% browser-based encoding and decoding: nothing is uploaded to any server.
    </cfif>
  </div>

  <h2>
    <i class="fas fa-info-circle"></i>
    <cfif local.isEs>Guía Completa y Preguntas Frecuentes<cfelse>Complete Guide &amp; FAQ</cfif>
  </h2>

  <h3><cfif local.isEs>¿Qué es el Codificador y Decodificador Base64?<cfelse>What is the Base64 Encoder / Decoder?</cfif></h3>
  <p>
    <cfif local.isEs>
      Convierte texto y archivos hacia y desde Base64 al instante. Codificá texto plano, subí un archivo para obtener su data URL, o pegá una cadena Base64 para decodificarla: si el resultado es una imagen, la herramienta la reconoce y te la muestra en lugar de un bloque de texto ilegible.
    <cfelse>
      It converts text and files to and from Base64 instantly. Encode plain text, upload a file to get its data URL, or paste a Base64 string to decode it: if the result is an image, the tool recognizes it and shows it to you instead of an unreadable block of text.
    </cfif>
  </p>

  <h3><cfif local.isEs>Qué hace<cfelse>What it does</cfif></h3>
  <ul>
    <li><cfif local.isEs><strong>Codificar / decodificar texto:</strong> conversión segura para UTF-8, incluyendo acentos y emojis.<cfelse><strong>Encode / decode text:</strong> UTF-8-safe conversion, including accents and emoji.</cfif></li>
    <li><cfif local.isEs><strong>Codificar archivos:</strong> subí cualquier archivo y obtené su representación como data URL en Base64.<cfelse><strong>Encode files:</strong> upload any file and get its Base64 data URL representation.</cfif></li>
    <li><cfif local.isEs><strong>Detección automática de imágenes:</strong> al decodificar, si el contenido es una imagen (PNG, JPEG, GIF, WEBP, BMP) se muestra una vista previa en vez de texto binario.<cfelse><strong>Automatic image detection:</strong> when decoding, if the content is an image (PNG, JPEG, GIF, WEBP, BMP), a preview is shown instead of binary text.</cfif></li>
    <li><cfif local.isEs><strong>Zoom con un click:</strong> hacé click en la vista previa para abrirla en grande dentro de un modal.<cfelse><strong>One-click zoom:</strong> click the preview to open it full-size in a modal.</cfif></li>
  </ul>

  <h3><cfif local.isEs>Preguntas Frecuentes (FAQ)<cfelse>Frequently Asked Questions (FAQ)</cfif></h3>
  <div class="faq-grid">
    <cfloop array="#local.faqItems#" index="local.b64Faq">
      <div class="faq-card">
        <h4>#local.b64Faq.q#</h4>
        <p>#local.b64Faq.a#</p>
      </div>
    </cfloop>
  </div>
</section>
</cfoutput>
