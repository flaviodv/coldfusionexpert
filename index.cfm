
<cfparam name="session.lan" default="en">
<cfif isDefined("url.lan")>
    <cfset session.lan=url.lan>
</cfif>
<cfif session.lan eq "es">
    <cfset setLocale("es_AR")>
    <cfinclude template="index_es.cfm">
<cfelse>
    <cfset setLocale("en_US")>
    <cfinclude template="index_en.cfm">
</cfif>