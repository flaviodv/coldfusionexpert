<cfoutput>
<section class="tool-guide-docs">
  <div class="privacy-badge">
    <i class="fas fa-code"></i>
    <cfif local.isEs>
      Código CSS Limpio y Optimizado: Generación instantánea en tiempo real sin librerías externas.
    <cfelse>
      Clean &amp; Optimized CSS Code: Instant real-time generation with zero external dependencies.
    </cfif>
  </div>

  <h2>
    <i class="fas fa-info-circle"></i>
    <cfif local.isEs>Guía Completa y Documentación CSS<cfelse>Complete Guide &amp; CSS Documentation</cfif>
  </h2>

  <h3><cfif local.isEs>¿Qué es el Generador de Efectos CSS?<cfelse>What is the CSS Effects Generator?</cfif></h3>
  <p>
    <cfif local.isEs>
      Es una herramienta visual interactiva que permite a diseñadores y desarrolladores web crear efectos de diseño CSS modernos como <strong>sombras (box-shadow y text-shadow)</strong>, <strong>bordes redondeados (border-radius)</strong>, <strong>transiciones y animaciones con funciones de tiempo (easing)</strong> y <strong>degradados (linear-gradient y radial-gradient)</strong> con previsualización en tiempo real y copiado de código con 1 solo clic.
    <cfelse>
      It is an interactive visual tool that enables web designers and developers to construct modern CSS effects including <strong>box-shadow and text-shadow</strong>, <strong>border-radius corner controls</strong>, <strong>transitions and easing animations</strong>, and <strong>linear &amp; radial gradients</strong> with live previews and 1-click code copying.
    </cfif>
  </p>

  <h3><cfif local.isEs>Módulos Disponibles<cfelse>Available Modules</cfif></h3>
  <ul>
    <li>
      <cfif local.isEs>
        <strong>Generador de Sombras (Box &amp; Text Shadow):</strong> Ajustá desplazamiento X/Y, desenfoque (blur), propagación (spread), color de sombra con transparencia RGBA y toggle de sombra interna (inset).
      <cfelse>
        <strong>Shadow Generator (Box &amp; Text Shadow):</strong> Adjust X/Y offsets, blur radius, spread radius, shadow color opacity via RGBA, and inset shadow toggle.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Bordes Redondeados (Border Radius):</strong> Creá esquinas suavizadas o formas asimétricas ajustando individualmente el radio de cada esquina (Superior Izquierda, Superior Derecha, Inferior Derecha, Inferior Izquierda).
      <cfelse>
        <strong>Border Radius Controls:</strong> Create rounded containers or unique asymmetric shapes by tweaking each corner individually (Top-Left, Top-Right, Bottom-Right, Bottom-Left).
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Transiciones y Animaciones:</strong> Elegí la propiedad a animar (transform, opacity, background-color), duración, delay y curvas de velocidad personalizadas como <code>cubic-bezier</code> con prueba interactiva al hacer hover.
      <cfelse>
        <strong>Transitions &amp; Easing:</strong> Select property triggers, transition durations, delays, and custom speed curves like <code>cubic-bezier</code> with instant interactive hover previewing.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Generador de Degradados CSS:</strong> Diseñá degradados lineales (con ángulo personalizable de 0° a 360°) o radiales con múltiples puntos de color y porcentajes de transición.
      <cfelse>
        <strong>CSS Gradient Builder:</strong> Design smooth linear gradients (with custom angles from 0° to 360°) or radial gradients with multiple color stops and position percentages.
      </cfif>
    </li>
  </ul>

  <h3><cfif local.isEs>Preguntas Frecuentes (FAQ)<cfelse>Frequently Asked Questions (FAQ)</cfif></h3>
  <div class="faq-grid">
    <div class="faq-card">
      <h4><cfif local.isEs>¿El código generado es compatible con todos los navegadores?<cfelse>Is the generated CSS compatible across all browsers?</cfif></h4>
      <p>
        <cfif local.isEs>
          Sí. Propiedades como <code>box-shadow</code>, <code>border-radius</code>, <code>transition</code> y <code>linear-gradient</code> son estándares W3C ampliamente soportados por Chrome, Firefox, Safari, Edge y navegadores móviles modernos.
        <cfelse>
          Yes. Properties such as <code>box-shadow</code>, <code>border-radius</code>, <code>transition</code>, and <code>linear-gradient</code> are standard W3C CSS properties fully supported across all modern desktop and mobile browsers.
        </cfif>
      </p>
    </div>

    <div class="faq-card">
      <h4><cfif local.isEs>¿Cómo copio el código a mi hoja de estilos?<cfelse>How do I copy the generated code to my stylesheet?</cfif></h4>
      <p>
        <cfif local.isEs>
          Simplemente ajustá los deslizadores hasta lograr el diseño deseado y hacé clic en el botón <strong>"Copiar"</strong> en el bloque de código oscuro ubicado debajo de la vista previa.
        <cfelse>
          Adjust the sliders until you achieve the desired visual style, then click the <strong>"Copy"</strong> button in the dark code box underneath the live preview stage.
        </cfif>
      </p>
    </div>
  </div>
</section>
</cfoutput>
