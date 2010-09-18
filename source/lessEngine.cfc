<cfcomponent output="false">
	 <cffunction name="init">
		<cfset this.version = "1.0.5">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="LessEngine" returntype="Any" access="public" output="false"  hint="I return the javaloader object ready for you to create ???">
		
		<cfscript>
			var lessEngine = getLessEngine();
			var lessFileArrayComplete = getLessFiles();
			var generate = generateFiles(lessEngine,lessFileArrayComplete);
		</cfscript>
		
		<cfreturn true />
	</cffunction>
	
	<cffunction name="getLessEngine">
		<cfset var lessEngine = application.javaLoader.create("com.asual.lesscss.LessEngine").init() />
		<cfreturn lessEngine />
	</cffunction>
	
	<cffunction name="getLessFiles">
		
		<cfscript>
			var loadMe = "";
			var i = "";
		    // create less file array
			var loadLessFiles = ArrayNew(1); 
			var dirPath = ReturnWebRootTranslated2() & "/stylesheets/less/";
		</cfscript>
		
		<!--- read directory for less files --->
		<cfdirectory 
		   action = "list"
		   directory = "#dirPath#"
		   name = "loadMe"
		   filter = "*.less">
		 
		<!--- add default less in /stylesheets/less folder --->
		<cfloop index="i" from="1" to="#loadMe.RecordCount#">
		 	<cfset loadLessFiles[#i#] = dirPath & loadMe.Name[i] />
		</cfloop>
		
		 <cfreturn loadLessFiles />
	</cffunction>
	
	<!--- function altered from
		http://bears-eat-beets.blogspot.com/2010/08/creating-less-css-plugin-for-coldmvc.html
	 --->
	<cffunction name="generateFiles" returntype="Any" access="public" output="false"  hint="I return the javaloader object ready for you to create ???">
  		<cfargument name="lessEngine" required="true" type="any" />
  		<cfargument name="lessFileArrayComplete" required="true" type="array" />
		
		<cfset var css_file = "" />
		<cfset var destination = "" />
		<cfset var i = "" />
		<cfset var content = "" />
		
		<cfloop array="#arguments.lessFileArrayComplete#" index="i">
			<!--- check if less file exists --->
			<cfif fileExists(#i#)>
			 	<cfset css_file = replaceNoCase(i, ".less", ".css") />
				<cfset destination = replaceNoCase(css_file, "/less/", "/") />
				
				<cfset content = fileRead(i) />
				<cfset fileWrite(destination, arguments.lessEngine.compile(content)) />
			</cfif>
		</cfloop>
		
	</cffunction>
	
	<cffunction name="ReturnWebRootTranslated2" access="public" returntype="string" hint="Returns the translated (file system) location of the web root directory">
		<cfscript>
		/**
		* Returns the translated (file system) location of the web root directory.
		*
		* @return Returns a string.
		* @author David Whiterod (whiterod.david@saugov.sa.gov.au)
		* @version 1, May 9, 2003
		*/
		var tmpPath = Replace(CGI.SCRIPT_NAME, "/", "\", "ALL");
		return Replace(ReplaceNoCase(CGI.PATH_TRANSLATED, tmpPath, "", "ALL"), "\", "/", "ALL");
		</cfscript>
	</cffunction>
	
</cfcomponent>