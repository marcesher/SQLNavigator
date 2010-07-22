<cfcomponent extends="mxunit.framework.TestCase">

	<cffunction name="setUp" returntype="void" access="public" hint="put things here that you want to run before each test">
		<cfset ds = "">
		<cfset ss = new sqlnavigator.cfc.adapters.SQLServer(ds)>

	</cffunction>
	<cffunction name="tearDown" returntype="void" access="public" hint="put things here that you want to run after each test">

	</cffunction>

	<cffunction name="getAll_should_return_SP_FN_TR" returntype="void" access="public">
		<cfset var all = ss.getAllObjectNames()>
		<!---<cfset debug(all)>--->
		<cfset var theList = valueList(all.name,"|")>
		<cfset debug(theList)>
	</cffunction>


</cfcomponent>
