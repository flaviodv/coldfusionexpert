<cfif session.lan eq "es">
    <cfinclude template="tools_es.cfm">
<cfelse>
    <cfinclude template="tools_en.cfm">
</cfif>
