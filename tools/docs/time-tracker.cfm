<cfoutput>
<section class="tool-guide-docs">
  <div class="privacy-badge">
    <i class="fas fa-stopwatch"></i>
    <cfif local.isEs>
      Control de Tiempo y Tarifas Local (localStorage): Todos tus registros se almacenan 100% en tu navegador y nunca se transmiten a ningún servidor.
    <cfelse>
      Local Time &amp; Rate Tracker (localStorage): All entries are stored 100% in your browser and are never transmitted to any server.
    </cfif>
  </div>

  <h2>
    <i class="fas fa-info-circle"></i>
    <cfif local.isEs>Guía Completa y Preguntas Frecuentes<cfelse>Complete Guide &amp; FAQ</cfif>
  </h2>

  <h3><cfif local.isEs>¿Qué es el Controlador de Tiempo y Tarifas (Time Tracker)?<cfelse>What is the Time Tracker &amp; Rate Calculator?</cfif></h3>
  <p>
    <cfif local.isEs>
      Es una herramienta web interactiva inspirada en aplicaciones como Clockify y Toggl. Permite a freelancers, programadores, diseñadores y profesionales independientes medir en tiempo real el tiempo dedicado a cada proyecto y tarea, calculando de forma automática las ganancias obtenidas según una tarifa por hora opcional.
    <cfelse>
      It is an interactive web tool inspired by apps like Clockify and Toggl. It allows freelancers, developers, designers, and consultants to track time spent on projects in real time, automatically calculating accrued earnings based on an optional hourly rate.
    </cfif>
  </p>

  <h3><cfif local.isEs>Características Destacadas<cfelse>Key Features</cfif></h3>
  <ul>
    <li>
      <cfif local.isEs>
        <strong>Temporizador en Vivo con Conteo de Dinero:</strong> Al iniciar el reloj con una tarifa por hora asignada, podés ver cómo aumentan tus ganancias segundo a segundo en tiempo real.
      <cfelse>
        <strong>Live Timer with Real-Time Earnings:</strong> When starting the clock with an hourly rate, watch your earnings accrue second-by-second in real time.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Tarifa por Hora Opcional:</strong> Si dejás la tarifa en blanco o en 0, la herramienta solo registrará el tiempo transcurrido sin calcular montos de dinero.
      <cfelse>
        <strong>Optional Hourly Rate:</strong> If left blank or set to 0, the tool tracks duration without calculating money amounts.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Soporte Multi-Moneda:</strong> Elegí entre USD ($), EUR (€), ARS ($), BRL (R$) o GBP (£) para visualizar tus registros en la divisa que utilizás con tus clientes.
      <cfelse>
        <strong>Multi-Currency Support:</strong> Choose between USD ($), EUR (€), ARS ($), BRL (R$), or GBP (£) matching your client billing terms.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Reanudación Rápida con 1 Clic (Boton Play):</strong> Hacé clic en el botón de reproducción en cualquier registro anterior para cargar la misma tarea y continuar cronometrando.
      <cfelse>
        <strong>1-Click Task Resume (Play Button):</strong> Click the play button on any previous entry to reload its description and rate and restart tracking instantly.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Exportación de Reportes a CSV:</strong> Descargá todo tu historial de horas y importes calculados en formato CSV para incluir en tus facturas o reportes de trabajo.
      <cfelse>
        <strong>CSV Report Export:</strong> Export your complete time &amp; earnings history into a CSV spreadsheet for client invoicing.
      </cfif>
    </li>
  </ul>

  <h3><cfif local.isEs>Preguntas Frecuentes (FAQ)<cfelse>Frequently Asked Questions (FAQ)</cfif></h3>
  <div class="faq-grid">
    <div class="faq-card">
      <h4><cfif local.isEs>¿Qué pasa si recargo la página mientras el cronómetro está corriendo?<cfelse>What happens if I refresh the page while the timer is running?</cfif></h4>
      <p>
        <cfif local.isEs>
          El estado del temporizador activo se guarda continuamente en <code>localStorage</code>. Al recargar la página o volver más tarde, el reloj seguirá corriendo sin perder un solo segundo.
        <cfelse>
          Active timer state persists in <code>localStorage</code>. Refreshing the page or returning later will keep the clock running seamlessly without losing a single second.
        </cfif>
      </p>
    </div>

    <div class="faq-card">
      <h4><cfif local.isEs>¿Es necesario ingresar una tarifa por hora?<cfelse>Is an hourly rate required?</cfif></h4>
      <p>
        <cfif local.isEs>
          No, la tarifa por hora es 100% opcional. Si solo querés auditar tu productividad o saber cuántas horas dedicaste a una tarea sin calcular dinero, podés dejar ese campo vacío.
        <cfelse>
          No, the hourly rate is completely optional. If you just want to track duration for productivity without calculating money, leave the rate field blank.
        </cfif>
      </p>
    </div>
  </div>
</section>
</cfoutput>
