<cfcomponent extends="Base">


	<cffunction name="getObjectsWithText" output="false" access="public" returntype="any" hint="">
		<cfargument name="search" type="string" required="true"/>
		<cfargument name="objectTypes" type="string" required="false" default="FN,P,TR"/>
		<cfset var q = "">
		<cfquery datasource="#datasource#" name="q">
			--#getCurrentTemplatePath()#
			SELECT DISTINCT name, text
			FROM syscomments
			JOIN sysobjects ON syscomments.id = sysobjects.id
			WHERE sysobjects.xtype IN ( <cfqueryparam value="#arguments.objectTypes#" cfsqltype="cf_sql_varchar" list="true"/> )
			AND sysobjects.status >= 0
			AND sysobjects.category <> 2
			AND [text] LIKE  <cfqueryparam value="%#search#%" cfsqltype="cf_sql_varchar"/>
		</cfquery>
		<cfreturn q>

	</cffunction>

	<cffunction name="getAllObjectNames" output="false" access="public" returntype="any" hint="">
		<cfargument name="objectTypes" type="string" required="false" default="FN,P,TR"/>
		<cfset var q = "">
		<cfquery datasource="#datasource#" name="q">
			--#getCurrentTemplatePath()#
			SELECT DISTINCT name, xtype, len(name) as namelength
			FROM sysobjects
			WHERE sysobjects.xtype IN ( <cfqueryparam value="#arguments.objectTypes#" cfsqltype="cf_sql_varchar" list="true"/> )
			AND sysobjects.status >= 0
			AND sysobjects.category <> 2
			ORDER BY xtype, name

		</cfquery>
		<cfreturn q>
	</cffunction>

	<cffunction name="getAllObjectNamesAsRegex" output="false" access="public" returntype="string" hint="">
		<cfargument name="objectTypes" type="string" required="false" default="FN,P,TR"/>
		<cfset var q = getAllObjectNames(objectTypes)>
		<cfquery dbtype="query" name="q">
		select * from q order by namelength desc
		</cfquery>
		<cfreturn valueList(q.name,"|")>
	</cffunction>

	<cffunction name="getObject" output="false" access="public" returntype="query" hint="">
		<cfargument name="objectName" type="string" required="true"/>
		<!--- gotta strip off the schema --->
		<cfset objectName = listLast(objectName,".")>
		<cfset var q = "">
		<cfquery datasource="#datasource#" name="q">
			--#getCurrentTemplatePath()#
			SELECT DISTINCT name, text
			FROM syscomments
			JOIN sysobjects ON syscomments.id = sysobjects.id
			WHERE name = <cfqueryparam value="#objectName#" cfsqltype="cf_sql_varchar"/>
		</cfquery>
		<cfreturn q>
	</cffunction>

</cfcomponent>