<cfscript>
local.faqItems = local.isEs ? [
  {q: "¿De dónde saca los datos de uso el planificador?", a: "No se conecta a ninguna API ni cuenta de IA. Vos cargás manualmente el porcentaje que te muestra cada proveedor (por ejemplo, en el panel de Codex, Claude Code o Gemini) junto con la fecha del próximo reinicio, y a partir de esos dos valores la herramienta calcula el resto."},
  {q: "¿Qué significa el estado 'Ritmo Excedido'?", a: "Significa que, al ritmo que venís consumiendo, es probable que te quedes sin cupo antes de que se reinicie la ventana. El planificador compara el porcentaje que ya usaste contra el porcentaje que deberías llevar consumido a esta altura del período, y te avisa antes de que te quedes sin margen."},
  {q: "¿Puedo controlar varias ventanas de uso para la misma IA?", a: "Sí. Muchos proveedores combinan límites distintos, por ejemplo una ventana de sesión de 5 horas y otra semanal. Podés agregar tantos límites como necesites por cada IA, y el panel siempre muestra el más restrictivo primero."},
  {q: "¿Pierdo mis datos si cambio de dispositivo o de navegador?", a: "Sí, porque todo se guarda localmente. Para llevarlos con vos, usá el botón 'Exportar JSON' para descargar una copia de seguridad y el botón 'Importar JSON' en el otro dispositivo o navegador para restaurarla."}
] : [
  {q: "Where does the planner get its usage data from?", a: "It doesn't connect to any AI account or API. You manually enter the percentage each provider shows you (for example, in the Codex, Claude Code, or Gemini dashboard) along with the next reset date, and the tool calculates everything else from those two values."},
  {q: "What does the 'Over Pace' status mean?", a: "It means that at your current rate of consumption, you're likely to run out of quota before the window resets. The planner compares the percentage you've already used against the percentage you should have used by this point in the period, warning you before you run out of room."},
  {q: "Can I track more than one usage window for the same AI?", a: "Yes. Many providers combine several limits at once, for example a 5-hour session window plus a weekly one. You can add as many limits as you need per AI, and the dashboard always surfaces the most restrictive one first."},
  {q: "Do I lose my data if I switch devices or browsers?", a: "Yes, since everything is stored locally. To carry it with you, use the 'Export JSON' button to download a backup, then use the 'Import JSON' button on the other device or browser to restore it."}
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
    <i class="fas fa-lock"></i>
    <cfif local.isEs>
      Almacenamiento Local (localStorage): Tus IAs y límites se guardan 100% en tu navegador y nunca se envían a ningún servidor.
    <cfelse>
      Local Storage (localStorage): Your AIs and limits are stored 100% in your browser and are never sent to any server.
    </cfif>
  </div>

  <h2>
    <i class="fas fa-info-circle"></i>
    <cfif local.isEs>Guía Completa y Preguntas Frecuentes<cfelse>Complete Guide &amp; FAQ</cfif>
  </h2>

  <h3><cfif local.isEs>¿Qué es el Planificador de Uso de IA?<cfelse>What is the AI Usage Planner?</cfif></h3>
  <p>
    <cfif local.isEs>
      Es una herramienta para llevar el control de cuánto cupo te queda en cada IA que usás a diario (Codex, Claude Code, Gemini u otro proveedor) cuando el panel del proveedor solo te muestra un porcentaje consumido y una fecha de reinicio. Cargás esos dos datos por cada ventana de uso &mdash; sesión de 5 horas, diaria, semanal o mensual &mdash; y el planificador calcula cuánto te queda, a qué ritmo podés consumirlo sin quedarte sin cupo antes del reinicio, y te permite comparar todas tus IAs en un mismo panel para saber cuál conviene usar ahora. Todo el cálculo se hace en tu navegador con <code>localStorage</code>, sin conexión a ninguna API ni cuenta.
    <cfelse>
      It is a tool for tracking how much quota is left on every AI you use day to day (Codex, Claude Code, Gemini, or another provider) when the provider's own dashboard only shows you a consumed percentage and a reset date. You enter those two values for each usage window &mdash; a 5-hour session, daily, weekly, or monthly &mdash; and the planner calculates how much is left, the safe pace to consume it without running out before the reset, and lets you compare every AI side by side to know which one to use right now. All the math runs in your browser via <code>localStorage</code>, with no connection to any API or account.
    </cfif>
  </p>

  <h3><cfif local.isEs>Características Principales<cfelse>Key Features</cfif></h3>
  <ul>
    <li>
      <cfif local.isEs>
        <strong>IAs y límites ilimitados:</strong> Agregá tantas IAs como uses &mdash; Codex, Claude Code, Gemini Models, Gemini Other Models o un proveedor personalizado &mdash; y varios límites por IA, por ejemplo sesión de 5 horas y semanal a la vez.
      <cfelse>
        <strong>Unlimited AIs &amp; limits:</strong> Add as many AIs as you use &mdash; Codex, Claude Code, Gemini Models, Gemini Other Models, or a custom provider &mdash; and several limits per AI, such as a 5-hour session and a weekly window at once.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Ritmo seguro calculado automáticamente:</strong> A partir del porcentaje usado y el tiempo hasta el reinicio, el panel te dice cuánto podés consumir por hora y por día sin pasarte, y compara lo esperado contra lo real.
      <cfelse>
        <strong>Automatically calculated safe pace:</strong> From the percentage used and the time left until reset, the dashboard tells you how much you can safely consume per hour and per day, and compares expected versus actual usage.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Estados de alerta por color:</strong> Cada IA se etiqueta como "En buen ritmo", "Vigilar ritmo" o "Ritmo excedido" según se acerque o supere el consumo esperado para ese momento del período.
      <cfelse>
        <strong>Color-coded alert states:</strong> Each AI is tagged "On Track", "Watch Pace", or "Over Pace" depending on how close it is to &mdash; or past &mdash; the expected usage for that point in the period.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Vista de Comparar:</strong> Ordená tus IAs una al lado de la otra según su límite más restrictivo, para saber de un vistazo cuál conviene usar en este momento.
      <cfelse>
        <strong>Compare view:</strong> Line up your AIs side by side by their most restrictive limit, so you know at a glance which one to reach for right now.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Actualización rápida de uso:</strong> Desde la pestaña "Actualizar Uso" cargás el nuevo porcentaje consumido de todas tus IAs en una sola tabla, sin abrir el formulario completo de edición.
      <cfelse>
        <strong>Quick usage updates:</strong> From the "Update Usage" tab, refresh the consumed percentage for every AI in a single table, without opening the full edit form.
      </cfif>
    </li>
    <li>
      <cfif local.isEs>
        <strong>Exportación e Importación JSON:</strong> Igual que en el resto de nuestras herramientas, descargá una copia de seguridad en JSON o importala en cualquier otro dispositivo.
      <cfelse>
        <strong>JSON Export &amp; Import:</strong> Just like our other tools, download a backup as a JSON file or import it on any other device.
      </cfif>
    </li>
  </ul>

  <h3><cfif local.isEs>Preguntas Frecuentes (FAQ)<cfelse>Frequently Asked Questions (FAQ)</cfif></h3>
  <div class="faq-grid">
    <div class="faq-card">
      <h4><cfif local.isEs>¿De dónde saca los datos de uso el planificador?<cfelse>Where does the planner get its usage data from?</cfif></h4>
      <p>
        <cfif local.isEs>
          No se conecta a ninguna API ni cuenta de IA. Vos cargás manualmente el porcentaje que te muestra cada proveedor (por ejemplo, en el panel de Codex, Claude Code o Gemini) junto con la fecha del próximo reinicio, y a partir de esos dos valores la herramienta calcula el resto.
        <cfelse>
          It doesn't connect to any AI account or API. You manually enter the percentage each provider shows you (for example, in the Codex, Claude Code, or Gemini dashboard) along with the next reset date, and the tool calculates everything else from those two values.
        </cfif>
      </p>
    </div>

    <div class="faq-card">
      <h4><cfif local.isEs>¿Qué significa el estado "Ritmo Excedido"?<cfelse>What does the "Over Pace" status mean?</cfif></h4>
      <p>
        <cfif local.isEs>
          Significa que, al ritmo que venís consumiendo, es probable que te quedes sin cupo antes de que se reinicie la ventana. El planificador compara el porcentaje que ya usaste contra el porcentaje que deberías llevar consumido a esta altura del período, y te avisa antes de que te quedes sin margen.
        <cfelse>
          It means that at your current rate of consumption, you're likely to run out of quota before the window resets. The planner compares the percentage you've already used against the percentage you should have used by this point in the period, warning you before you run out of room.
        </cfif>
      </p>
    </div>

    <div class="faq-card">
      <h4><cfif local.isEs>¿Puedo controlar varias ventanas de uso para la misma IA?<cfelse>Can I track more than one usage window for the same AI?</cfif></h4>
      <p>
        <cfif local.isEs>
          Sí. Muchos proveedores combinan límites distintos, por ejemplo una ventana de sesión de 5 horas y otra semanal. Podés agregar tantos límites como necesites por cada IA, y el panel siempre muestra primero el más restrictivo.
        <cfelse>
          Yes. Many providers combine several limits at once, for example a 5-hour session window plus a weekly one. You can add as many limits as you need per AI, and the dashboard always surfaces the most restrictive one first.
        </cfif>
      </p>
    </div>

    <div class="faq-card">
      <h4><cfif local.isEs>¿Pierdo mis datos si cambio de dispositivo o de navegador?<cfelse>Do I lose my data if I switch devices or browsers?</cfif></h4>
      <p>
        <cfif local.isEs>
          Sí, porque todo se guarda localmente. Para llevarlos con vos, usá el botón <strong>"Exportar JSON"</strong> para descargar una copia de seguridad y el botón <strong>"Importar JSON"</strong> en el otro dispositivo o navegador para restaurarla.
        <cfelse>
          Yes, since everything is stored locally. To carry it with you, use the <strong>"Export JSON"</strong> button to download a backup, then use the <strong>"Import JSON"</strong> button on the other device or browser to restore it.
        </cfif>
      </p>
    </div>
  </div>
</section>
</cfoutput>
