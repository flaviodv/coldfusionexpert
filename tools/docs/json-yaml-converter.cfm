<cfscript>
local.faqItems = local.isEs ? [
  {q: "¿Soporta funciones avanzadas de YAML como anchors o documentos múltiples?", a: "No, admite YAML básico: mapas, listas y valores escalares (texto, números, booleanos y null). Cubre la gran mayoría de los archivos de configuración (Docker Compose, GitHub Actions, etc.), pero no características avanzadas del spec completo."},
  {q: "¿Qué pasa si el YAML o JSON tiene un error de sintaxis?", a: "Se muestra un mensaje de error de conversión indicando el problema, sin modificar el resultado anterior."},
  {q: "¿En qué casos conviene usar YAML en vez de JSON?", a: "YAML es más legible para archivos de configuración editados a mano (sin comillas ni llaves obligatorias), mientras que JSON es el formato estándar para intercambio de datos entre sistemas."}
] : [
  {q: "Does it support advanced YAML features like anchors or multi-document files?", a: "No, it supports basic YAML: maps, lists, and scalar values (text, numbers, booleans, and null). It covers the vast majority of configuration files (Docker Compose, GitHub Actions, etc.), but not advanced features of the full spec."},
  {q: "What happens if the YAML or JSON has a syntax error?", a: "A conversion error message is shown describing the problem, without altering the previous result."},
  {q: "When should I use YAML instead of JSON?", a: "YAML is more readable for hand-edited configuration files (no mandatory quotes or braces), while JSON is the standard format for data interchange between systems."}
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
      Conversión 100% en tu navegador: tu configuración nunca se sube a ningún servidor.
    <cfelse>
      100% browser-based conversion: your config never gets uploaded to any server.
    </cfif>
  </div>

  <h2>
    <i class="fas fa-info-circle"></i>
    <cfif local.isEs>Guía Completa y Preguntas Frecuentes<cfelse>Complete Guide &amp; FAQ</cfif>
  </h2>

  <h3><cfif local.isEs>¿Qué es el Conversor de JSON a YAML / YAML a JSON?<cfelse>What is the JSON &harr; YAML Converter?</cfif></h3>
  <p>
    <cfif local.isEs>
      Convierte estructuras de datos entre los dos formatos de configuración más usados en desarrollo: pegá JSON y obtené su equivalente en YAML, o pegá YAML y obtené el JSON correspondiente, al instante.
    <cfelse>
      It converts data structures between the two most widely used configuration formats in development: paste JSON and get its YAML equivalent, or paste YAML and get the corresponding JSON, instantly.
    </cfif>
  </p>

  <h3><cfif local.isEs>Qué hace<cfelse>What it does</cfif></h3>
  <ul>
    <li><cfif local.isEs><strong>JSON → YAML:</strong> ideal para pasar respuestas de API a archivos de configuración legibles.<cfelse><strong>JSON → YAML:</strong> ideal for turning API responses into readable configuration files.</cfif></li>
    <li><cfif local.isEs><strong>YAML → JSON:</strong> útil para consumir archivos de configuración (Docker Compose, CI/CD) desde código que espera JSON.<cfelse><strong>YAML → JSON:</strong> useful for consuming configuration files (Docker Compose, CI/CD) from code that expects JSON.</cfif></li>
    <li><cfif local.isEs><strong>Soporte de YAML básico:</strong> mapas, listas y valores escalares.<cfelse><strong>Basic YAML support:</strong> maps, lists, and scalar values.</cfif></li>
  </ul>

  <h3><cfif local.isEs>Preguntas Frecuentes (FAQ)<cfelse>Frequently Asked Questions (FAQ)</cfif></h3>
  <div class="faq-grid">
    <cfloop array="#local.faqItems#" index="local.yamlFaq">
      <div class="faq-card">
        <h4>#local.yamlFaq.q#</h4>
        <p>#local.yamlFaq.a#</p>
      </div>
    </cfloop>
  </div>
</section>
</cfoutput>
