CFWheels plugin for LESS v0.1
http://github.com/mhenke/lessForWheels

Third party software:
http://javaloader.riaforge.org/
http://www.mozilla.org/rhino/
http://www.asual.com/lesscss/

Requires:
# Wheels 1.0.5
# javaloaderCFWheels plugin
# http://github.com/mhenke/javaloaderCFWheels
 
TO USE
1) Create a lib folder for your jar files under your webroot
	Exampe Of Directory Layout:
	webroot
	==index.cfm
	==IsapiRewrite4.ini
	==Application.cfc
	====wheels
	====views
	====models
	====events
	====controllers
	====lib
l
2) Place the lesscss-engine-X.X.XX.jar in the lib folder you added in step 1.

3) Place the JavaLoader-xx.xx.zip in the plugins folder of Wheels.

4) Add to events/onapplicationstart.cfm this code 
	a)for loading any default jars
		<cfset application.javaloader = javaLoader() />

You should be good to go now and able to access the jar.

EXAMPLES OF USE
<!--- example of creating java object--->
<cfset jTidy = application.javaloader.create("org.w3c.tidy.Tidy").init() />
 
ADDITIONAL FOR DEMO 
Unzip the Demo-x.x.zip file into CFWheel's webroot.
 
Reload your Wheels application.
Example: http://localhost/index.cfm?reload=true