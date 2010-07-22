
<cfcomponent accessors="true">

	<cfproperty name="maxItemsInHistory">
	<cfset maxItemsInHistory = 10>

	<cfscript>
	    function getHighlightLineNumbers(String text, String search){
			if(trim(search) eq "") return [];
			var lineNumbers = [];
			var lines = listToArray(text,chr(10));
			var lineCount = arrayLen(lines);
		   	var i = 1;
			var line = "";
			for(line in lines){
				if(findNoCase(search,line)){
					arrayAppend(lineNumbers,javacast("int",i));
				}
				i++;
			}
			return lineNumbers;
	   	}
    </cfscript>

	<cffunction name="writeSearchHistoryCookie" output="false" access="public" returntype="any" hint="">
		<cfargument name="name" type="string" required="true"/>
		<cfset var history = readSearchHistoryCookie()>
		<cfset updateHistoryCookie("SQLNAVSEARCHHISTORY", history, name)>
	</cffunction>

	<cffunction name="writeObjectHistoryCookie" output="false" access="public" returntype="any" hint="">
		<cfargument name="name" type="string" required="true"/>
		<cfset var history = readObjectHistoryCookie()>
		<cfset updateHistoryCookie("SQLNAVOBJECTHISTORY", history, name)>
	</cffunction>


	<cffunction name="readSearchHistoryCookie" output="false" access="public" returntype="array" hint="">
		<cfset ensureCookie("SQLNAVSEARCHHISTORY")>
		<cfreturn deserializeJSON(cookie.SQLNAVSEARCHHISTORY)>
	</cffunction>

	<cffunction name="readObjectHistoryCookie" output="false" access="public" returntype="array" hint="">
		<cfset ensureCookie("SQLNAVOBJECTHISTORY")>
		<cfreturn deserializeJSON(cookie.SQLNAVOBJECTHISTORY)>
	</cffunction>

	<cffunction name="updateHistoryCookie" output="false" access="public" returntype="any" hint="">
		<cfargument name="cookiename" type="string" required="true"/>
		<cfargument name="currentCookie" type="array" required="true"/>
		<cfargument name="value" type="string" required="true"/>
		<cfset var history = currentCookie>
		<cfset arrayDelete(history,value)>

		<cfif arrayLen(history) GTE getMaxItemsInHistory()>
			<cfset arrayDeleteAt(history,getMaxItemsInHistory())>
		</cfif>

		<cfset arrayPrepend(history,value)>
		<cfcookie name="#cookiename#" value="#serializeJSON(history)#">
	</cffunction>

	<cffunction name="ensureCookie" output="false" access="public" returntype="any" hint="">
		<cfargument name="name" type="string" required="true"/>
		<cfif not structKeyExists(cookie,name)>
			<cfcookie name="#name#" value="#serializeJSON([])#">
		</cfif>
	</cffunction>

	<cffunction name="ensureAllCookies" output="false" access="public" returntype="any" hint="">
		<cfset readSearchHistoryCookie()>
		<cfset readObjectHistoryCookie()>
	</cffunction>


</cfcomponent>
