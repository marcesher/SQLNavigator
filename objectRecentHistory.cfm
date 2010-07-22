
<cfset searchHistory = uiHelper.readSearchHistoryCookie()>
<cfset objectHistory = uiHelper.readObjectHistoryCookie()>

<div id="sqlnavobjecthistory">

	<h2>Recent History</h2>

	<cfform method="get" name="objecthistory">

		<cftree name="historyTree" format="html" >
			<cftreeitem display="searches" value="Searches">

			<cfloop array="#searchHistory#" index="item">
				<cftreeitem display="#item#" value="#item#" parent="searches" href="?sql=#item#&">
			</cfloop>

			<cftreeitem display="objects" value="Objects">

			<cfloop array="#objectHistory#" index="item">
				<cftreeitem display="#item#" value="#item#" parent="objects" href="?dbobject=#item#&">
			</cfloop>

		</cftree>

	</cfform>

</div>