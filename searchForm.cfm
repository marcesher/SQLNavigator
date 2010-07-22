<cfparam name="formAction" default="index.cfm">
<cfoutput>

<div id="search">
<form action="#formAction#" method="post">

 	<input type="text" name="sql" value="#sql#">
	<br>
	<input type="submit" value="Search">
</form>
</div>
</cfoutput>