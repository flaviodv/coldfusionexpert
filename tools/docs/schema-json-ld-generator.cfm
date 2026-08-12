<cfscript>
local.faqItems = local.isEs ? [
  {q: "¿Dónde pego el JSON-LD?", a: "Copialo dentro de la sección head de la página, en un elemento script con type application/ld+json."},
  {q: "¿El generador garantiza resultados enriquecidos?", a: "No. Google decide cuándo mostrar resultados enriquecidos según sus propias reglas y la calidad de la página."},
  {q: "¿Qué tipo debo elegir?", a: "Elegí el tipo que describa mejor el contenido real de la página. No uses Product, FAQ o Article si la página no corresponde a ese contenido."}
] : [
  {q: "Where do I paste the JSON-LD?", a: "Copy it into the page head inside a script element with type application/ld+json."},
  {q: "Does the generator guarantee rich results?", a: "No. Google decides when to show rich results based on its own rules and page quality."},
  {q: "Which type should I choose?", a: "Choose the type that best describes the actual page content. Do not use Product, FAQ, or Article when the page does not match that content."}
];
</cfscript>
<cfoutput><section class="tool-guide-docs"><div class="privacy-badge"><i class="fas fa-user-shield"></i> <cfif local.isEs>El análisis de URL usa el servidor como intermediario; los datos no se guardan.<cfelse>URL analysis uses the server as an intermediary; data is not stored.</cfif></div><h2><i class="fas fa-info-circle"></i> <cfif local.isEs>Cómo usar el generador JSON-LD<cfelse>How to use the JSON-LD generator</cfif></h2><p><cfif local.isEs>Podés completar los campos manualmente o analizar una URL existente. El lector toma el título, la descripción, la imagen Open Graph y el canonical; después revisá los datos antes de generar el bloque final.<cfelse>You can fill the fields manually or analyze an existing URL. The reader imports the title, description, Open Graph image, and canonical; review the data before generating the final block.</cfif></p><h3><cfif local.isEs>Preguntas frecuentes<cfelse>Frequently Asked Questions</cfif></h3><div class="faq-grid"><cfloop array="#local.faqItems#" index="local.faq"><div class="faq-card"><h4>#local.faq.q#</h4><p>#local.faq.a#</p></div></cfloop></div></section></cfoutput>
