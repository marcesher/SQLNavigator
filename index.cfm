<cfset structAppend(form,url,"false")>
<cfparam name="form.sql" default="">
<cfparam name="form.dbobject" default="">

<cfset sql = form.sql>
<cfset dbobject = form.dbobject>

<cfset uiHelper = new cfc.UIHelper()>
<cfset dbAdapter = new cfc.adapters.SQLServer("")>
<cfset allNames = dbAdapter.getAllObjectNames()>
<cfset namesAsList = dbAdapter.getAllObjectNamesAsRegex()>

<cfset uiHelper.ensureAllCookies()>

<cfif len(sql)>
	<cfset uiHelper.writeSearchHistoryCookie(sql)>
	<cfset result = dbAdapter.getObjectsWithText(sql)>
</cfif>

<cfif len(dbobject)>
	<cfset uiHelper.writeObjectHistoryCookie(dbobject)>
	<cfset result = dbAdapter.getObject(dbobject)>
</cfif>


<html>

<head>
	<script language='javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'></script>
	<script language='javascript' src='syntaxhighlighter/scripts/shCore.js'></script>
	<script language='javascript' src='syntaxhighlighter/scripts/shBrushSql.js'></script>
	<link href='syntaxhighlighter/styles/shCore.css' rel='stylesheet' type='text/css'/>
	<link href='syntaxhighlighter/styles/shThemeEclipse.css' rel='stylesheet' type='text/css'/>
	<link href='style.css' rel='stylesheet' type='text/css'/>


	<script type='text/javascript'>
		SyntaxHighlighter.all();

		var theRegex = /<cfoutput>(#namesAsList#)</cfoutput>/ig

		$(document).ready(function(){
			$('div.syntaxhighlighter').live('DOMNodeInserted', addLinks);
	    });

		function addLinks(event){
			if(!$.data(this, 'writing')){
				$.data(this, 'writing', 1);
				//console.log(event);
				var input = event.target.innerHTML;
				var newInput = input.replace(theRegex, "<a href='?dbobject=$1'>$1</a>");
				//console.log(newInput);
				$(event.target).html(newInput);
				$.data(this, 'writing', 0);
			}
			return false;

		}
	</script>
</head>

<body>

<div id="sqlnavsidebar" style="float:left">

	<cfinclude template="header.cfm">

	<cfinclude template="objectRecentHistory.cfm">

	<cfinclude template="objectTree.cfm">

</div>

<div id="sqlnavmain" style="float:left; width:75%">

	<cfinclude template="searchForm.cfm">

	<cfif structKeyExists(variables,"result")>
		<cfinclude template="objectText.cfm">
	</cfif>

</div>

<div style="clear:both"></div>



</body>
</html>