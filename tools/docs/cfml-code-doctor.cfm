<cfscript>
local.faqItems = local.isEs ? [
  {q: "¿El código se envía a un servidor?", a: "No. Esta revisión rápida se ejecuta íntegramente en tu navegador."},
  {q: "¿Qué problemas detecta?", a: "Busca patrones frecuentes como SELECT *, consultas dentro de loops, posibles variables sin scope y secretos escritos en el código."}
] : [
  {q: "Is my code sent to a server?", a: "No. This quick review runs entirely in your browser."},
  {q: "What does it detect?", a: "It looks for common patterns such as SELECT *, queries inside loops, possibly unscoped variables, and hard-coded secrets."}
];
</cfscript>
<cfoutput>
<section class="tool-guide-docs">
  <div class="privacy-badge"><i class="fas fa-user-shield"></i> <cfif local.isEs>Procesamiento 100% en tu navegador.<cfelse>100% browser-based processing.</cfif></div>
  <h2><i class="fas fa-info-circle"></i> <cfif local.isEs>Sobre el Doctor de Código CFML<cfelse>About CFML Code Doctor</cfif></h2>
  <p><cfif local.isEs>Esta herramienta realiza una revisión rápida y educativa de patrones habituales en CFML y SQL. No reemplaza un análisis completo del proyecto, pero ayuda a encontrar problemas antes de pasar a producción.<cfelse>This tool performs a quick, educational review of common CFML and SQL patterns. It does not replace a full project audit, but helps find issues before production.</cfif></p>
  <h3><cfif local.isEs>Preguntas frecuentes<cfelse>Frequently Asked Questions</cfif></h3>
  <div class="faq-grid"><cfloop array="#local.faqItems#" index="local.faq"><div class="faq-card"><h4>#local.faq.q#</h4><p>#local.faq.a#</p></div></cfloop></div>
</section>
</cfoutput>
