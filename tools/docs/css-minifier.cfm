<cfscript>
local.faqItems = local.isEs ? [
  {q: "¿Detecta errores de sintaxis en mi CSS?", a: "Sí. Valida llaves sin cerrar, comentarios sin cerrar y cadenas de texto sin cerrar, e indica la línea y columna exacta donde está el problema antes de minificar o formatear."},
  {q: "¿Puedo subir un archivo .css en vez de pegar el código?", a: "Sí, el botón de subir archivo carga el contenido directamente en el editor y lo minifica automáticamente."},
  {q: "¿Cuánto reduce el tamaño del archivo?", a: "Depende del CSS original, pero eliminar comentarios, espacios y saltos de línea innecesarios suele reducir entre un 15% y un 40% el tamaño del archivo, mejorando el tiempo de carga del sitio."}
] : [
  {q: "Does it catch syntax errors in my CSS?", a: "Yes. It validates unclosed braces, unclosed comments, and unclosed strings, and reports the exact line and column of the problem before minifying or formatting."},
  {q: "Can I upload a .css file instead of pasting the code?", a: "Yes, the upload button loads the file's content directly into the editor and minifies it automatically."},
  {q: "How much does it reduce the file size?", a: "It depends on the original CSS, but removing comments, whitespace, and unnecessary line breaks usually cuts file size by 15% to 40%, improving your site's load time."}
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
      Procesamiento 100% en tu navegador: tu código CSS nunca se sube a ningún servidor.
    <cfelse>
      100% browser-based processing: your CSS code is never uploaded to any server.
    </cfif>
  </div>

  <h2>
    <i class="fas fa-info-circle"></i>
    <cfif local.isEs>Guía Completa y Preguntas Frecuentes<cfelse>Complete Guide &amp; FAQ</cfif>
  </h2>

  <h3><cfif local.isEs>¿Qué es el Minificador y Formateador de CSS?<cfelse>What is the CSS Minifier &amp; Formatter?</cfif></h3>
  <p>
    <cfif local.isEs>
      Limpia, ordena y comprime hojas de estilo al instante. Pegá tu CSS (o subí el archivo) y elegí entre <strong>minificarlo</strong> para producción, quitando comentarios y espacios innecesarios, o <strong>formatearlo</strong> con sangría legible para trabajarlo en desarrollo.
    <cfelse>
      It cleans up, organizes, and compresses stylesheets instantly. Paste your CSS (or upload the file) and choose to <strong>minify</strong> it for production, stripping comments and unnecessary whitespace, or <strong>format</strong> it with readable indentation for development.
    </cfif>
  </p>

  <h3><cfif local.isEs>Qué hace<cfelse>What it does</cfif></h3>
  <ul>
    <li><cfif local.isEs><strong>Minificar:</strong> elimina comentarios, espacios y saltos de línea para reducir el peso del archivo.<cfelse><strong>Minify:</strong> removes comments, whitespace, and line breaks to reduce file weight.</cfif></li>
    <li><cfif local.isEs><strong>Formatear:</strong> reordena el CSS con sangría consistente, ideal para revisarlo o depurarlo.<cfelse><strong>Format:</strong> re-indents the CSS consistently, ideal for reviewing or debugging.</cfif></li>
    <li><cfif local.isEs><strong>Validación de sintaxis:</strong> detecta llaves, comillas o comentarios sin cerrar antes de procesar.<cfelse><strong>Syntax validation:</strong> catches unclosed braces, quotes, or comments before processing.</cfif></li>
    <li><cfif local.isEs><strong>Subida y descarga de archivos:</strong> cargá un .css y descargá el resultado minificado con un click.<cfelse><strong>File upload &amp; download:</strong> upload a .css file and download the minified result with one click.</cfif></li>
  </ul>

  <h3><cfif local.isEs>Preguntas Frecuentes (FAQ)<cfelse>Frequently Asked Questions (FAQ)</cfif></h3>
  <div class="faq-grid">
    <cfloop array="#local.faqItems#" index="local.cssFaq">
      <div class="faq-card">
        <h4>#local.cssFaq.q#</h4>
        <p>#local.cssFaq.a#</p>
      </div>
    </cfloop>
  </div>
</section>
</cfoutput>
