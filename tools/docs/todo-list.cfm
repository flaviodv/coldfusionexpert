<cfoutput>
<section class="tool-guide-docs">
  <div class="privacy-badge">
    <i class="fas fa-database"></i>
    <cfif local.isEs>
      Almacenamiento Local (localStorage): Tus tareas se guardan 100% en tu navegador y nunca se envían a ningún servidor.
    <cfelse>
      Local Storage (localStorage): Your tasks are stored 100% in your browser and are never sent to any server.
    </cfif>
  </div>

  <h2>
    <i class="fas fa-info-circle"></i>
    <cfif local.isEs>Guía Completa y Preguntas Frecuentes<cfelse>Complete Guide &amp; FAQ</cfif>
  </h2>

  <h3><cfif local.isEs>¿Qué es el Gestor de Lista de Tareas?<cfelse>What is the Simple To-Do List Manager?</cfif></h3>
  <p>
    <cfif local.isEs>
      Es un organizador de tareas liviano, interactivo y privado diseñado para gestionar pendientes diarios, proyectos de programación, listas de compras o recordatorios de trabajo. Todo el almacenamiento se realiza localmente mediante la API <code>localStorage</code> de tu navegador, garantizando privacidad total y acceso instantáneo sin registro de usuario.
    <cfelse>
      It is a lightweight, interactive, and private task organizer designed to manage daily to-dos, coding project tasks, shopping lists, or work reminders. All storage happens locally via your browser's <code>localStorage</code> API, guaranteeing absolute privacy and instant access with no sign-up required.
    </cfif>
  </p>

  <h3><cfif local.isEs>Características Principales<cfelse>Key Features</cfif></h3>
  <ul>
    <li>
      <cfif local.isEs>
        <strong>Niveles de Prioridad y Categorías:</strong> Clasificá tus pendientes en prioridad Alta, Media o Baja y asigná categorías como Trabajo, Personal, Compras o Proyecto.
      <cfelse>
        <strong>Priority Levels &amp; Categories:</strong> Classify your to-dos into High, Medium, or Low priorities and tag them under Work, Personal, Shopping, or Project.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Barra de Progreso y Métricas:</strong> Visualizá en tiempo real el porcentaje de tareas completadas frente al total asignado.
      <cfelse>
        <strong>Progress Bar &amp; Metrics:</strong> View real-time percentages and completion metrics tracking your total progress.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Filtros y Buscador Integrado:</strong> Filtrá por estado (Todas, Pendientes, Completadas) y buscá cualquier tarea al instante por palabra clave.
      <cfelse>
        <strong>Filters &amp; Instant Search:</strong> Filter by status (All, Active, Completed) and search tasks instantly by keyword.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Integración Directa con Time Tracker (Botón Play ▶):</strong> Hacé clic en el botón verde de reproducción en cualquier tarea para cargarla automáticamente en el Time Tracker e iniciar el cronómetro al instante.
      <cfelse>
        <strong>Direct 1-Click Time Tracker Integration (Play ▶ Button):</strong> Click the green play button on any task to automatically send it to the Time Tracker and start timing instantly.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Exportación e Importación JSON:</strong> Guardá copias de seguridad de tus tareas en un archivo JSON o importalas en cualquier otro dispositivo.
      <cfelse>
        <strong>JSON Export &amp; Import:</strong> Backup your task list as a downloadable JSON file or import backups across any device.
      </cfif>
    </li>
  </ul>

  <h3><cfif local.isEs>Preguntas Frecuentes (FAQ)<cfelse>Frequently Asked Questions (FAQ)</cfif></h3>
  <div class="faq-grid">
    <div class="faq-card">
      <h4><cfif local.isEs>¿Mis tareas se borran si cierro la pestaña?<cfelse>Will my tasks disappear if I close the tab?</cfif></h4>
      <p>
        <cfif local.isEs>
          No. Las tareas quedan almacenadas en el <code>localStorage</code> de tu navegador, por lo que seguirán estando disponibles la próxima vez que abras la página en el mismo dispositivo.
        <cfelse>
          No. Tasks are saved directly in your browser's <code>localStorage</code>, so they remain available whenever you return on the same browser and device.
        </cfif>
      </p>
    </div>

    <div class="faq-card">
      <h4><cfif local.isEs>¿Puedo transferir mis tareas a otra computadora?<cfelse>Can I transfer my tasks to another computer?</cfif></h4>
      <p>
        <cfif local.isEs>
          ¡Sí! Hacéd clic en el botón <strong>"Exportar"</strong> para descargar tu lista en formato JSON y luego usá el botón <strong>"Importar"</strong> en el otro dispositivo.
        <cfelse>
          Yes! Click the <strong>"Export"</strong> button to download your task list as a JSON file, then use the <strong>"Import"</strong> button on your other device.
        </cfif>
      </p>
    </div>
  </div>
</section>
</cfoutput>
