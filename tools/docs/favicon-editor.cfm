<cfscript>
local.faqItems = local.isEs ? [
  {q: "¿Qué formatos puedo exportar?", a: "PNG en el tamaño exacto del canvas, ICO multi-resolución con capas de 16×16 a 64×64 px (compatible con todos los navegadores), o un lote de cuatro PNG independientes en 16, 32, 48 y 64 px."},
  {q: "¿Las imágenes se suben a algún servidor?", a: "No. Todo el procesamiento ocurre en tu navegador. Ningún píxel sale de tu dispositivo."},
  {q: "¿Puedo importar una imagen existente y editarla como pixelart?", a: "Sí. Hacé clic en 'Elegir archivo' para cargar cualquier imagen (PNG, JPG, ICO, etc.). El editor la reescala automáticamente al tamaño del canvas y la convierte en una grilla editable pixel a pixel."},
  {q: "¿Qué hace la herramienta Cuentagotas?", a: "Selecciona el color del píxel sobre el que hacés clic y lo establece como color de primer plano activo, listo para pintar."},
  {q: "¿Puedo deshacer cambios?", a: "Sí. El editor guarda hasta 80 pasos de historial. Usá Ctrl+Z para deshacer y Ctrl+Y (o Ctrl+Shift+Z) para rehacer, o los botones del panel lateral."}
] : [
  {q: "What formats can I export?", a: "PNG at the exact canvas size, a multi-resolution ICO file with layers from 16×16 to 64×64 px (compatible with all browsers), or a batch of four separate PNGs at 16, 32, 48, and 64 px."},
  {q: "Are images uploaded to a server?", a: "No. All processing happens entirely in your browser. No pixel leaves your device."},
  {q: "Can I import an existing image and edit it as pixel art?", a: "Yes. Click 'Choose file' to load any image (PNG, JPG, ICO, etc.). The editor automatically scales it to the canvas size and converts it into an editable pixel-by-pixel grid."},
  {q: "What does the Eyedropper tool do?", a: "It picks the color of the pixel you click on and sets it as the active foreground color, ready to paint."},
  {q: "Can I undo changes?", a: "Yes. The editor saves up to 80 history steps. Use Ctrl+Z to undo and Ctrl+Y (or Ctrl+Shift+Z) to redo, or the buttons in the side panel."}
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
      Privacidad: Todo corre en tu navegador. Ningún archivo se sube a ningún servidor.
    <cfelse>
      Privacy: Everything runs in your browser. No file is ever uploaded to any server.
    </cfif>
  </div>

  <h2>
    <i class="fas fa-info-circle"></i>
    <cfif local.isEs>Guía y Preguntas Frecuentes<cfelse>Guide &amp; FAQ</cfif>
  </h2>

  <h3><cfif local.isEs>¿Qué es el Editor de Favicon Pixel a Pixel?<cfelse>What is the Pixel Favicon Editor?</cfif></h3>
  <p>
    <cfif local.isEs>
      Es una herramienta de dibujo pixel a pixel diseñada para crear favicons desde cero directamente en el navegador. Te permite trabajar en grillas de <strong>16×16, 32×32, 48×48 o 64×64 px</strong>, elegir colores con opacidad variable, usar herramientas de lápiz, borrador, relleno por inundación, cuentagotas, línea y rectángulo, y exportar el resultado como <strong>.ico</strong> o <strong>.png</strong>.
    <cfelse>
      A pixel-by-pixel drawing tool designed to create favicons from scratch directly in the browser. It lets you work on grids of <strong>16×16, 32×32, 48×48 or 64×64 px</strong>, pick colors with variable opacity, use pencil, eraser, flood fill, eyedropper, line and rectangle tools, and export the result as <strong>.ico</strong> or <strong>.png</strong>.
    </cfif>
  </p>

  <h3><cfif local.isEs>Herramientas disponibles<cfelse>Available tools</cfif></h3>
  <ul>
    <li><strong><cfif local.isEs>Lápiz (P)<cfelse>Pencil (P)</cfif></strong> — <cfif local.isEs>Pinta un píxel con el color de primer plano.<cfelse>Paints a pixel with the foreground color.</cfif></li>
    <li><strong><cfif local.isEs>Borrador (E)<cfelse>Eraser (E)</cfif></strong> — <cfif local.isEs>Elimina el color del píxel (transparencia total).<cfelse>Removes the pixel color (fully transparent).</cfif></li>
    <li><strong><cfif local.isEs>Relleno (F)<cfelse>Fill (F)</cfif></strong> — <cfif local.isEs>Relleno por inundación: colorea toda el área conectada del mismo color.<cfelse>Flood fill: colors the entire connected area of the same color.</cfif></li>
    <li><strong><cfif local.isEs>Cuentagotas (I)<cfelse>Eyedropper (I)</cfif></strong> — <cfif local.isEs>Toma el color del píxel sobre el que hacés clic.<cfelse>Picks the color from the pixel you click.</cfif></li>
    <li><strong><cfif local.isEs>Línea (L)<cfelse>Line (L)</cfif></strong> — <cfif local.isEs>Traza una línea recta entre dos puntos (algoritmo de Bresenham).<cfelse>Draws a straight line between two points (Bresenham algorithm).</cfif></li>
    <li><strong><cfif local.isEs>Rectángulo (R)<cfelse>Rectangle (R)</cfif></strong> — <cfif local.isEs>Dibuja el contorno de un rectángulo.<cfelse>Draws the outline of a rectangle.</cfif></li>
  </ul>

  <h3>FAQ</h3>
  <dl class="tool-faq">
    <cfloop array="#local.faqItems#" index="local.faqItem">
      <dt>#local.faqItem.q#</dt>
      <dd>#local.faqItem.a#</dd>
    </cfloop>
  </dl>
</section>
</cfoutput>
