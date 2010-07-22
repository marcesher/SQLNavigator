<cfcomponent>

	<cffunction name="init" output="false" access="public" returntype="any" hint="">
		<cfargument name="datasource" type="string" required="true"/>
		<cfset variables.datasource = arguments.datasource>
		<cfreturn this>
	</cffunction>

	<cffunction name="getAllObjects" output="false" access="public" returntype="any" hint="">

	</cffunction>

	<cffunction name="getTables" output="false" access="public" returntype="any" hint="">

	</cffunction>

	<cffunction name="getProcedures" output="false" access="public" returntype="any" hint="">

	</cffunction>

	<cffunction name="getTriggers" output="false" access="public" returntype="any" hint="">

	</cffunction>

	<cffunction name="getFunctions" output="false" access="public" returntype="any" hint="">

	</cffunction>

</cfcomponent>