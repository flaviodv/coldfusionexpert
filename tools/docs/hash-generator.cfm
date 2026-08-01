<cfscript>
local.faqItems = local.isEs ? [
  {q: "¿Para qué sirve generar un hash?", a: "Para verificar la integridad de un archivo descargado, comparar si dos textos son idénticos sin exponerlos, o generar checksums usados en desarrollo y control de versiones."},
  {q: "¿Es seguro usar MD5 para contraseñas?", a: "No. MD5 y SHA-1 se consideran criptográficamente débiles (tienen colisiones conocidas) y no deben usarse para almacenar contraseñas. Se incluyen acá solo por compatibilidad con sistemas legacy y verificación de checksums; para seguridad real usá SHA-256 o, mejor aún, un algoritmo diseñado para contraseñas (bcrypt, Argon2)."},
  {q: "¿El mismo texto siempre genera el mismo hash?", a: "Sí, un hash es determinístico: la misma entrada siempre produce la misma salida, lo que lo hace útil para comparar y verificar contenido."}
] : [
  {q: "What is generating a hash useful for?", a: "For verifying the integrity of a downloaded file, comparing whether two pieces of text are identical without exposing them, or generating checksums used in development and version control."},
  {q: "Is MD5 safe to use for passwords?", a: "No. MD5 and SHA-1 are considered cryptographically weak (they have known collisions) and should not be used to store passwords. They're included here only for legacy compatibility and checksum verification; for real security use SHA-256, or better yet, an algorithm designed for passwords (bcrypt, Argon2)."},
  {q: "Does the same text always produce the same hash?", a: "Yes, a hash is deterministic: the same input always produces the same output, which makes it useful for comparing and verifying content."}
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
      Cálculo 100% en tu navegador con la Web Crypto API nativa: el texto nunca se envía a un servidor.
    <cfelse>
      100% browser-based computation using the native Web Crypto API: the text is never sent to a server.
    </cfif>
  </div>

  <h2>
    <i class="fas fa-info-circle"></i>
    <cfif local.isEs>Guía Completa y Preguntas Frecuentes<cfelse>Complete Guide &amp; FAQ</cfif>
  </h2>

  <h3><cfif local.isEs>¿Qué es el Generador de Hashes de Seguridad?<cfelse>What is the Security Hash Generator?</cfif></h3>
  <p>
    <cfif local.isEs>
      Calcula al instante los hashes <strong>MD5</strong>, <strong>SHA-1</strong> y <strong>SHA-256</strong> de cualquier texto que ingreses, usando la Web Crypto API nativa del navegador para los algoritmos SHA.
    <cfelse>
      It instantly computes the <strong>MD5</strong>, <strong>SHA-1</strong>, and <strong>SHA-256</strong> hashes of any text you enter, using the browser's native Web Crypto API for the SHA algorithms.
    </cfif>
  </p>

  <h3><cfif local.isEs>Qué hace<cfelse>What it does</cfif></h3>
  <ul>
    <li><cfif local.isEs><strong>Tres algoritmos a la vez:</strong> MD5, SHA-1 y SHA-256 calculados simultáneamente.<cfelse><strong>Three algorithms at once:</strong> MD5, SHA-1, and SHA-256 computed simultaneously.</cfif></li>
    <li><cfif local.isEs><strong>Copiar cada resultado:</strong> cada hash tiene su propio campo listo para copiar.<cfelse><strong>Copy each result:</strong> every hash has its own field, ready to copy.</cfif></li>
    <li><cfif local.isEs><strong>Sin límite de uso:</strong> corre enteramente en tu navegador, sin llamadas a servidores externos.<cfelse><strong>No usage limits:</strong> runs entirely in your browser, with no calls to external servers.</cfif></li>
  </ul>

  <h3><cfif local.isEs>Preguntas Frecuentes (FAQ)<cfelse>Frequently Asked Questions (FAQ)</cfif></h3>
  <div class="faq-grid">
    <cfloop array="#local.faqItems#" index="local.hashFaq">
      <div class="faq-card">
        <h4>#local.hashFaq.q#</h4>
        <p>#local.hashFaq.a#</p>
      </div>
    </cfloop>
  </div>
</section>
</cfoutput>
