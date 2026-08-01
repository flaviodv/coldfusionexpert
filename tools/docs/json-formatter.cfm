<cfscript>
local.faqItems = local.isEs ? [
  {q: "¿Cómo sé dónde está el error si mi JSON es inválido?", a: "El mensaje de error indica la línea y columna exacta donde el parser encontró el problema, así podés ir directo a corregirlo en vez de revisar todo el archivo."},
  {q: "¿Cuál es la diferencia entre formatear y minificar?", a: "Formatear agrega sangría de 2 espacios para que sea legible durante el desarrollo; minificar quita todos los espacios innecesarios para reducir el peso del archivo en producción."},
  {q: "¿Puedo subir un archivo .json?", a: "Sí, el botón de subir archivo carga el contenido directamente en el editor."}
] : [
  {q: "How do I know where the error is if my JSON is invalid?", a: "The error message shows the exact line and column where the parser hit the problem, so you can jump straight to fixing it instead of scanning the whole file."},
  {q: "What's the difference between formatting and minifying?", a: "Formatting adds 2-space indentation for readability during development; minifying strips all unnecessary whitespace to reduce file weight in production."},
  {q: "Can I upload a .json file?", a: "Yes, the upload button loads the file's content directly into the editor."}
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
      Procesamiento 100% en tu navegador: tu JSON nunca se sube a ningún servidor.
    <cfelse>
      100% browser-based processing: your JSON is never uploaded to any server.
    </cfif>
  </div>

  <h2>
    <i class="fas fa-info-circle"></i>
    <cfif local.isEs>Guía Completa y Preguntas Frecuentes<cfelse>Complete Guide &amp; FAQ</cfif>
  </h2>

  <h3><cfif local.isEs>¿Qué es el Minificador y Formateador de JSON?<cfelse>What is the JSON Minifier &amp; Formatter?</cfif></h3>
  <p>
    <cfif local.isEs>
      Valida, ordena y comprime estructuras JSON al instante. Pegá tu JSON (o subí el archivo) y elegí <strong>formatearlo</strong> con sangría legible para depurar respuestas de API, o <strong>minificarlo</strong> para reducir su peso antes de enviarlo o guardarlo.
    <cfelse>
      It validates, organizes, and compresses JSON structures instantly. Paste your JSON (or upload the file) and choose to <strong>format</strong> it with readable indentation for debugging API responses, or <strong>minify</strong> it to reduce its weight before sending or storing it.
    </cfif>
  </p>

  <h3><cfif local.isEs>Qué hace<cfelse>What it does</cfif></h3>
  <ul>
    <li><cfif local.isEs><strong>Formatear:</strong> aplica sangría de 2 espacios para que sea fácil de leer.<cfelse><strong>Format:</strong> applies 2-space indentation for easy reading.</cfif></li>
    <li><cfif local.isEs><strong>Minificar:</strong> elimina todos los espacios y saltos de línea innecesarios.<cfelse><strong>Minify:</strong> strips all unnecessary whitespace and line breaks.</cfif></li>
    <li><cfif local.isEs><strong>Validación con ubicación de errores:</strong> si el JSON es inválido, indica línea y columna exactas.<cfelse><strong>Validation with error location:</strong> if the JSON is invalid, it reports the exact line and column.</cfif></li>
    <li><cfif local.isEs><strong>Subida y descarga de archivos:</strong> cargá un .json y descargá el resultado con un click.<cfelse><strong>File upload &amp; download:</strong> upload a .json file and download the result with one click.</cfif></li>
  </ul>

  <h3><cfif local.isEs>Preguntas Frecuentes (FAQ)<cfelse>Frequently Asked Questions (FAQ)</cfif></h3>
  <div class="faq-grid">
    <cfloop array="#local.faqItems#" index="local.jsonFaq">
      <div class="faq-card">
        <h4>#local.jsonFaq.q#</h4>
        <p>#local.jsonFaq.a#</p>
      </div>
    </cfloop>
  </div>
</section>
</cfoutput>
