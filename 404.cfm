<cfscript>getPageContext().getResponse().setStatus(404);</cfscript>
<main class="container" style="min-height: 45vh; padding-top: 150px; padding-bottom: 80px; text-align: center;">
  <p class="hero-kicker">404</p>
  <h1><cfif session.lan eq "es">No encontramos esa página.<cfelse>We could not find that page.</cfif></h1>
  <p><cfif session.lan eq "es">La dirección puede haber cambiado o no existir. Podés volver al inicio, consultar los servicios o explorar las herramientas gratuitas.<cfelse>The address may have changed or may not exist. You can return home, review services, or explore the free tools.</cfif></p>
  <cfoutput><p><a class="hero-cta hero-cta-primary" href="#request.langPrefix#/"><cfif session.lan eq "es">Ir al inicio<cfelse>Go to home</cfif></a> <a class="hero-cta hero-cta-secondary" href="#request.langPrefix#/tools"><cfif session.lan eq "es">Ver herramientas<cfelse>Browse tools</cfif></a></p></cfoutput>
</main>
