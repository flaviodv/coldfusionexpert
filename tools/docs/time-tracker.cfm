<cfoutput>
<section class="tool-guide-docs">
  <div class="privacy-badge">
    <i class="fas fa-user-shield"></i>
    <cfif local.isEs>
      Control de Tiempo y Tarifas Local (localStorage): Todos tus registros se almacenan 100% en tu navegador y nunca se transmiten a ningún servidor externo.
    <cfelse>
      Local Time &amp; Rate Tracker (localStorage): All entries are stored 100% in your browser and are never transmitted to any external server.
    </cfif>
  </div>

  <h2>
    <i class="fas fa-book-open"></i>
    <cfif local.isEs>Guía Completa y Preguntas Frecuentes<cfelse>Complete Guide &amp; FAQ</cfif>
  </h2>

  <h3><cfif local.isEs>¿Qué es el Controlador de Tiempo y Tarifas (Time Tracker)?<cfelse>What is the Time Tracker &amp; Rate Calculator?</cfif></h3>
  <p>
    <cfif local.isEs>
      Es una completa suite web de gestión del tiempo e ingresos inspirada en herramientas profesionales como Clockify y Toggl Track. Permite a freelancers, desarrolladores, diseñadores y consultores medir con precisión el tiempo dedicado a múltiples proyectos en simultáneo, calculando automáticamente las ganancias acumuladas en tiempo real según la tarifa por hora asignada a cada cliente.
    <cfelse>
      It is a comprehensive web time &amp; earnings management suite inspired by professional tools like Clockify and Toggl Track. It empowers freelancers, developers, designers, and consultants to track time across multiple parallel projects simultaneously, automatically calculating accrued earnings in real time based on customizable hourly rates.
    </cfif>
  </p>

  <h3><cfif local.isEs>Características Destacadas y Funcionalidades<cfelse>Key Features &amp; Capabilities</cfif></h3>
  <ul>
    <li>
      <cfif local.isEs>
        <strong>Soporte Multitarea (5 Relojes en Paralelo):</strong> Disponés de 3 Cronómetros progresivos para medir tareas en ejecución y 2 Temporizadores de cuenta regresiva. Podés ejecutar varios relojes al mismo tiempo si realizás multitarea.
      <cfelse>
        <strong>Multi-Timer Multitasking (5 Parallel Clocks):</strong> Access 3 progressive count-up timers and 2 countdown timers to seamlessly manage multiple client tasks concurrently.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Interfaz por Pestañas con Tiempo en Vivo:</strong> Pestañas diferenciadas con código de colores (Azul Cyan para Cronómetros y Verde Esmeralda para Temporizadores). Cada pestaña muestra un punto indicador de ejecución y el tiempo en vivo en tiempo real directamente sobre el encabezado.
      <cfelse>
        <strong>Tabbed Navigation with Live Time Display:</strong> Distinct color-coded tabs (Cyan Blue for Timers and Emerald Green for Countdowns) displaying running indicator dots and live digits right on tab headers.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Calculadora de Dinero y Ganancias en Tiempo Real:</strong> Al ingresar una tarifa por hora (opcional) y seleccionar tu moneda ($ USD, € EUR, $ ARS, R$ BRL, £ GBP), la herramienta calcula segundo a segundo cuánto dinero vas ganando mientras trabajás.
      <cfelse>
        <strong>Real-Time Earnings Calculator:</strong> Assign an optional hourly rate in your billing currency ($ USD, € EUR, $ ARS, R$ BRL, £ GBP) to watch accrued revenue calculate second-by-second.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Alertas de Temporizador con SweetAlert2:</strong> Al finalizar la cuenta regresiva de un temporizador, se activa una alerta modal profesional con notificación visual que resetea automáticamente el contador al presionar "Aceptar".
      <cfelse>
        <strong>SweetAlert2 Countdown Notifications:</strong> When a countdown finishes, a clean modal alert notifies you immediately and resets countdown inputs cleanly upon dismissal.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Barra Flotante Global en todo el Sitio Web:</strong> Si tenés algún reloj corriendo y navegás a otra página o herramienta del sitio, una barra flotante fija al centro del pie de página muestra el tiempo acumulado y te permite regresar con 1 clic.
      <cfelse>
        <strong>Global Bottom Floating Timer Bar:</strong> If any timer is running and you navigate to other site pages, a fixed bottom-center floating pill displays live time and provides 1-click return access.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Edición Manual de Registros Pasados (Lápiz ✏️):</strong> Podés modificar la descripción, proyecto/cliente, fecha, hora de inicio, hora de fin y tarifa por hora de cualquier registro en tu historial, ajustando automáticamente el tiempo y monto acumulado.
      <cfelse>
        <strong>Full Manual Time Entry Editing (Pencil ✏️):</strong> Edit description, client, date, start/end clock times, and hourly rate for any historical record with instant recalculation.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Reanudación Rápida (Botón Play ▶):</strong> Presioná el botón circular de reproducción en cualquier registro anterior para reanudar inmediatamente la misma tarea en una pestaña disponible.
      <cfelse>
        <strong>1-Click Task Resume (Play ▶ Button):</strong> Press the circular play button on any historical entry to resume tracking that exact task instantly in an idle tab.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Exportación de Reportes a CSV:</strong> Descargá todo tu historial de horas trabajadas y ganancias en una planilla CSV lista para enviar a tus clientes o adjuntar en tus facturas.
      <cfelse>
        <strong>CSV Report Export:</strong> Download your entire time log and billing summary as a CSV spreadsheet ready for client invoicing.
      </cfif>
    </li>
  </ul>

  <h3><cfif local.isEs>Preguntas Frecuentes (FAQ)<cfelse>Frequently Asked Questions (FAQ)</cfif></h3>
  <div class="faq-grid">
    <div class="faq-card">
      <h4><cfif local.isEs>¿Qué pasa si recargo la página o cierro el navegador?<cfelse>What happens if I refresh or close my browser?</cfif></h4>
      <p>
        <cfif local.isEs>
          Todos los estados de los 5 relojes, descripciones y tiempos se guardan automáticamente en <code>localStorage</code>. Al volver o refrescar, el tiempo transcurrido se sincroniza con exactitud de milisegundos.
        <cfelse>
          All 5 timer states, descriptions, and timestamps are persisted in <code>localStorage</code>. Refreshing or reopening the tab calculates elapsed time seamlessly.
        </cfif>
      </p>
    </div>

    <div class="faq-card">
      <h4><cfif local.isEs>¿Es obligatorio ingresar una tarifa por hora?<cfelse>Is an hourly rate required?</cfif></h4>
      <p>
        <cfif local.isEs>
          No, la tarifa por hora es totalmente opcional. Si solo deseás medir tiempo o auditar tu productividad, podés dejar la tarifa en blanco y la herramienta solo registrará la duración.
        <cfelse>
          No, the hourly rate is completely optional. If you just want to track duration for productivity, leave the rate field blank.
        </cfif>
      </p>
    </div>

    <div class="faq-card">
      <h4><cfif local.isEs>¿Cómo funciona la barra flotante global?<cfelse>How does the global floating bar work?</cfif></h4>
      <p>
        <cfif local.isEs>
          Cuando hay al menos un reloj activo, aparece una cápsula flotante en la parte inferior central de cualquier página del sitio. Muestra el tiempo en vivo y te permite regresar al Time Tracker haciendo clic en ella.
        <cfelse>
          When at least one timer is active, a floating pill appears at the bottom-center of any site page. It shows live running digits and redirects back to the tracker on click.
        </cfif>
      </p>
    </div>

    <div class="faq-card">
      <h4><cfif local.isEs>¿Mis datos están seguros?<cfelse>Is my data private and secure?</cfif></h4>
      <p>
        <cfif local.isEs>
          Sí, el 100% de la información se almacena localmente en tu navegador mediante HTML5 LocalStorage. Ninguna descripción, cliente o tarifa se envía a servidores externos.
        <cfelse>
          Yes, 100% of data is stored locally in your browser via HTML5 LocalStorage. No task descriptions, clients, or rates are ever sent to remote servers.
        </cfif>
      </p>
    </div>
  </div>
</section>
</cfoutput>
