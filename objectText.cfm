<!---
	expects:
	sql
	result
 --->
<div class="sqlnavsqloutput">

	<h1><cfoutput>#result.RecordCount# Results</cfoutput></h1>

	<cfoutput query="result">
		<cfset newtext = trim(result.text)>
		<cfset highlights = uiHelper.getHighlightLineNumbers(newtext,sql)>

		<h2>#result.name# </h2>

		<p>
			<pre class="brush: sql; toolbar: false; highlight: #highlights.toString()#">#newtext#</pre>
		</p>
	</cfoutput>
</div>