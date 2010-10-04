<!--- Place HTML here that should be used as the default layout of your application --->
<html>
	<head>
	  <cfoutput>
	  	#stylesheetLinkTag("variables,operations,nested_rules,mixins")#
	  </cfoutput>
	</head>
	<body>
		<div id="header" style="border-style:solid;border-width:5px;">
			This is the header id with a <a href="#">link</a>
		</div>
		<cfoutput>#contentForLayout()#</cfoutput>
		<div id="footer" style="border-style:solid;border-width:5px;">
			This is the footer id
		</div>
	</body>
</html>