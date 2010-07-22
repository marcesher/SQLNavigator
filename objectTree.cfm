

<div id="sqlnavobjects">
	<h2>db objects</h2>
	<cfform action="get" name="objecttree">

	<cftree name="objectTree" format="html" >
		<cfoutput query="allNames" group="xType">
			<cftreeitem display="#xType#" value="#xType#" parent="historyTree" expand="false">

			<cfoutput>
				<cftreeitem display="#name#" value="#name#" parent="#xtype#" href="?dbobject=#name#&">
			</cfoutput>

		</cfoutput>
	</cftree>

	</cfform>
</div>

