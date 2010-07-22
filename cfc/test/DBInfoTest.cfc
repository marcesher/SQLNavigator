<cfcomponent extends="mxunit.framework.TestCase">

	<cffunction name="setUp" returntype="void" access="public" hint="put things here that you want to run before each test">
		<cfset datasource = "">
		<cfset dbinfo = new sqlnavigator.cfc.DBInfo(datasource)>
	</cffunction>

	<cffunction name="getDatabases" output="false" access="public" returntype="any" hint="">
		<cfdbinfo datasource="#datasource#" type="DBNames" name="result">
		<cfset debug(result)>
	</cffunction>

	<cffunction name="getTables_should_return_tables" returntype="void" access="public">
		<cfdbinfo datasource="#datasource#" type="Procedures" name="result">
		<cfset debug(result)>

	</cffunction>

</cfcomponent>
