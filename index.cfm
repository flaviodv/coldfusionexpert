<cfif session.lan eq "es">
    <cfinclude template="index_es.cfm">
<cfelse>
    <cfinclude template="index_en.cfm">
</cfif>
