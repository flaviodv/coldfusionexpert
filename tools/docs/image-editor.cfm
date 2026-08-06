<cfscript>
local.faqItems = local.isEs ? [
  {q: "¿Es seguro editar mis fotos en este sitio?", a: "Sí. La edición corre de forma local en tu navegador. Las imágenes elegidas desde tu dispositivo no se suben; al importar desde una URL, se guarda una copia temporal en nuestro servidor por hasta una hora."},
  {q: "¿Por qué convertir mis imágenes a WebP?", a: "WebP ofrece una compresión hasta un 30% superior a JPG y PNG sin perder calidad visible, lo que reduce el tiempo de carga del sitio y mejora el puntaje de Google PageSpeed."},
  {q: "¿Cómo genero un favicon para mi sitio web?", a: "Cargá tu logotipo o ícono, elegí la proporción 1:1, selecciona el formato Favicon (.ico), elegí el tamaño (ej. 32x32 px) y hacé clic en Descargar Imagen."}
] : [
  {q: "Is it safe to edit my photos on this site?", a: "Yes. Editing occurs locally in your browser. Images selected from your device are never uploaded; when importing from a URL, a temporary copy is stored on our server for up to one hour so it can be loaded securely."},
  {q: "Why should I convert images to WebP?", a: "WebP provides up to 30% better compression than JPG and PNG without noticeable quality loss, drastically speeding up page load times and boosting Google PageSpeed scores."},
  {q: "How do I generate a website favicon?", a: "Upload your logo or icon, select the 1:1 ratio, pick the Favicon (.ico) format, choose your size (e.g. 32x32 px), and click Download Image."}
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
      Privacidad: La edición corre en tu navegador. Si cargás desde una URL, se guarda una copia temporal en el servidor por hasta una hora.
    <cfelse>
      Privacy: Editing runs in your browser. If you load an image from a URL, a temporary server copy is kept for up to one hour.
    </cfif>
  </div>

  <h2>
    <i class="fas fa-info-circle"></i>
    <cfif local.isEs>Guía Completa y Preguntas Frecuentes<cfelse>Complete Guide &amp; FAQ</cfif>
  </h2>

  <h3><cfif local.isEs>¿Qué es el Editor de Imágenes?<cfelse>What is the Image Editor?</cfif></h3>
  <p>
    <cfif local.isEs>
      Es una herramienta web gratuita diseñada para recortar, ajustar, redimensionar y convertir imágenes al instante sin instalar programas como Photoshop o GIMP. Te permite exportar en múltiples formatos web populares como <strong>WebP, PNG, JPG/JPEG</strong> y generar <strong>favicons en formato .ico</strong> para sitios web.
    <cfelse>
      It is a free web-based tool designed to quickly crop, adjust, resize, and convert images without installing heavy software like Photoshop or GIMP. It allows you to export in popular web formats such as <strong>WebP, PNG, JPG/JPEG</strong>, and generate <strong>website favicons in .ico format</strong>.
    </cfif>
  </p>

  <h3><cfif local.isEs>Características Principales<cfelse>Key Features</cfif></h3>
  <ul>
    <li>
      <cfif local.isEs>
        <strong>Recorte Interactivo con Nodos (Cropper):</strong> Ajustá libremente el área de recorte arrastrando los puntos de control en las esquinas y bordes.
      <cfelse>
        <strong>Interactive Cropping Nodes:</strong> Adjust the crop selection box smoothly by dragging control handles on corners and edges.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Proporciones Predeterminadas:</strong> Seleccioná proporciones de aspecto fijas para redes sociales o favicons: Libre, 1:1 (Favicon/Cuadrado), 16:9 (YouTube/Sliders), 4:3 (Fotografía) y 4:5 (Instagram).
      <cfelse>
        <strong>Aspect Ratio Presets:</strong> Pick fixed aspect ratios tailored for web &amp; social media: Free, 1:1 (Favicon/Square), 16:9 (YouTube/Sliders), 4:3 (Standard Photo), and 4:5 (Instagram).
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Redimensionamiento de Píxeles (Resize):</strong> Especificá el ancho y alto deseado con bloqueo de proporción automática para evitar distorsiones.
      <cfelse>
        <strong>Custom Pixel Resizing:</strong> Specify exact target width &amp; height dimensions with an automatic aspect ratio lock to prevent stretching.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Exportación a Favicon (.ico):</strong> Generá archivos <code>favicon.ico</code> optimizados en tamaños estándar (16x16, 32x32, 48x48, 64x64, 128x128, 256x256 px).
      <cfelse>
        <strong>Favicon (.ico) Export:</strong> Generate optimized <code>favicon.ico</code> files in standard sizes (16x16, 32x32, 48x48, 64x64, 128x128, 256x256 px).
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Filtros y Ajustes Fotográficos:</strong> Controlá brillo, contraste y saturación con vista previa inmediata antes de guardar.
      <cfelse>
        <strong>Photo Adjustments &amp; Filters:</strong> Control brightness, contrast, and saturation with live updates prior to exporting.
      </cfif>
    </li>
  </ul>

  <h3><cfif local.isEs>Casos de Uso Comunes<cfelse>Common Use Cases</cfif></h3>
  <ul>
    <li><cfif local.isEs>Creación de favicons <code>.ico</code> para desarrolladores web y diseñadores UI/UX.<cfelse>Creating <code>.ico</code> favicons for web developers and UI/UX designers.</cfif></li>
    <li><cfif local.isEs>Optimizaciones SEO e imágenes livianas en formato WebP para acelerar sitios web.<cfelse>SEO image optimization using lightweight WebP format to speed up websites.</cfif></li>
    <li><cfif local.isEs>Recorte de avatares, fotos de perfil y banners para LinkedIn, Instagram o Twitter.<cfelse>Cropping profile avatars, header banners, and social posts for LinkedIn, Instagram, or Twitter.</cfif></li>
  </ul>

  <h3><cfif local.isEs>Preguntas Frecuentes (FAQ)<cfelse>Frequently Asked Questions (FAQ)</cfif></h3>
  <div class="faq-grid">
    <div class="faq-card">
      <h4><cfif local.isEs>¿Es seguro editar mis fotos en este sitio?<cfelse>Is it safe to edit my photos on this site?</cfif></h4>
      <p>
        <cfif local.isEs>
          Sí. Toda la edición corre de forma local en tu navegador utilizando la API HTML5 Canvas. Las imágenes elegidas desde tu dispositivo no se suben; al cargar desde una URL, se guarda una copia temporal en el servidor por hasta una hora.
        <cfelse>
          Absolutely. All editing runs locally in your browser using the HTML5 Canvas API. Images selected from your device are not uploaded; loading from a URL stores a temporary server copy for up to one hour.
        </cfif>
      </p>
    </div>

    <div class="faq-card">
      <h4><cfif local.isEs>¿Por qué convertir mis imágenes a WebP?<cfelse>Why should I convert images to WebP?</cfif></h4>
      <p>
        <cfif local.isEs>
          WebP ofrece una compresión hasta un 30% superior a JPG y PNG sin perder calidad visible, lo que reduce el tiempo de carga del sitio y mejora el puntaje de Google PageSpeed.
        <cfelse>
          WebP provides up to 30% better compression than JPG and PNG without noticeable quality loss, drastically speeding up page load times and boosting Google PageSpeed scores.
        </cfif>
      </p>
    </div>

    <div class="faq-card">
      <h4><cfif local.isEs>¿Cómo genero un favicon para mi sitio web?<cfelse>How do I generate a website favicon?</cfif></h4>
      <p>
        <cfif local.isEs>
          Cargá tu logotipo o ícono, elegí la proporción 1:1, selecciona el formato "Favicon (.ico)", elegí el tamaño (ej. 32x32 px) y hacé clic en "Descargar Imagen".
        <cfelse>
          Upload your logo or icon, select the 1:1 ratio, pick "Favicon (.ico)" format, choose your size (e.g. 32x32 px), and click "Download Image".
        </cfif>
      </p>
    </div>
  </div>
</section>
</cfoutput>
