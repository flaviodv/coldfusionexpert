<cfoutput>
<section class="tool-guide-docs">
  <div class="privacy-badge">
    <i class="fas fa-palette"></i>
    <cfif local.isEs>
      Conversión de Color Instantánea &amp; Extracción de Paletas de Imágenes
    <cfelse>
      Instant Color Space Conversion &amp; Image Palette Extraction
    </cfif>
  </div>

  <h2>
    <i class="fas fa-info-circle"></i>
    <cfif local.isEs>Guía Completa de Conversión de Colores<cfelse>Complete Color Space &amp; Palette Guide</cfif></h2>

  <h3><cfif local.isEs>¿Qué es el Convertidor y Creador de Paletas de Colores?<cfelse>What is the Color Picker &amp; Palette Generator?</cfif></h3>
  <p>
    <cfif local.isEs>
      Es una herramienta en línea esencial para diseñadores web, ilustradores y desarrolladores frontend. Permite realizar conversiones bidireccionales automáticas entre los modelos de color más utilizados en desarrollo web: <strong>HEX (#13AFF0)</strong>, <strong>RGB (rgb(19, 175, 240))</strong> y <strong>HSL (hsl(198, 86%, 51%))</strong>. Además, cuenta con un generador automático de variantes cromáticas y un extractor de paletas a partir de imágenes subidas.
    <cfelse>
      It is an essential online tool for web designers, illustrators, and frontend developers. It performs instant two-way conversions between the most widely used web color formats: <strong>HEX (#13AFF0)</strong>, <strong>RGB (rgb(19, 175, 240))</strong>, and <strong>HSL (hsl(198, 86%, 51%))</strong>. Additionally, it features an automated color variant generator and an image palette extractor.
    </cfif>
  </p>

  <h3><cfif local.isEs>Funciones Destacadas<cfelse>Highlighted Features</cfif></h3>
  <ul>
    <li>
      <cfif local.isEs>
        <strong>Conversión Bidireccional en Tiempo Real:</strong> Escribí cualquier valor en HEX, RGB o HSL y los demás formatos se actualizarán solos instantáneamente.
      <cfelse>
        <strong>Live Two-Way Conversion:</strong> Type any value into HEX, RGB, or HSL inputs, and all other formats sync automatically in real time.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Selector de Color Nativo (Eye-Dropper):</strong> Hacé clic en la muestra de color para abrir el selector nativo del sistema operativo y capturar cualquier tono.
      <cfelse>
        <strong>Native Color Picker (Eye-Dropper):</strong> Click the color swatch box to invoke your operating system's native color picker.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Generador de Tonos y Sombras (Tints &amp; Shades):</strong> Obtené automáticamente 6 escalas de luminosidad graduales a partir de tu color base para construir temas web armónicos.
      <cfelse>
        <strong>Tints &amp; Shades Generator:</strong> Automatically build 6 gradual lightness step variations from your base color to craft cohesive website themes.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Extractor de Paletas de Imágenes:</strong> Subí cualquier fotografía o archivo gráfico y la herramienta analizará los píxeles vía Canvas API para extraer los 8 colores más dominantes de la imagen.
      <cfelse>
        <strong>Image Color Extractor:</strong> Upload any photograph or image file to sample pixels via Canvas API and extract its top 8 dominant color swatches.
      </cfif>
    </li>
  </ul>

  <h3><cfif local.isEs>Preguntas Frecuentes (FAQ)<cfelse>Frequently Asked Questions (FAQ)</cfif></h3>
  <div class="faq-grid">
    <div class="faq-card">
      <h4><cfif local.isEs>¿Cuándo conviene usar HSL en lugar de HEX o RGB?<cfelse>When should I use HSL instead of HEX or RGB?</cfif></h4>
      <p>
        <cfif local.isEs>
          HSL (Hue, Saturation, Lightness) es ideal cuando querés ajustar la luminosidad u oscuridad de un color o crear sistemas de diseño responsivos, ya que solo necesitas cambiar el porcentaje de Lightness sin recalcular los componentes de rojo, verde y azul.
        <cfelse>
          HSL (Hue, Saturation, Lightness) is ideal when you want to adjust lightness or darkness or design responsive design systems, as you only need to tweak the Lightness percentage without recalculating Red, Green, and Blue channels.
        </cfif>
      </p>
    </div>

    <div class="faq-card">
      <h4><cfif local.isEs>¿Cómo extraigo la paleta de colores de una imagen o logo?<cfelse>How do I extract a color palette from an image or logo?</cfif></h4>
      <p>
        <cfif local.isEs>
          Hacé clic en el botón <strong>"Extraer de Imagen"</strong>, elegí tu archivo (PNG, JPG, WebP) y la herramienta analizará la imagen mostrando los 8 colores principales con sus códigos HEX listos para copiar.
        <cfelse>
          Click the <strong>"Extract from Image"</strong> button, upload your file (PNG, JPG, WebP), and the tool will sample the image and present the top 8 color swatches with 1-click HEX copy buttons.
        </cfif>
      </p>
    </div>
  </div>
</section>
</cfoutput>
