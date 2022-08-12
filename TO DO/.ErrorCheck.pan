
///*********This is the FileChecker macro in GetMacros
local fileNeeded,folderArray,smallFolderArray,sizeCheck, procList, mostRecentProc, panFilesList,activeFiles


mostRecentProc=array(info("procedurestack"),1,¬)
procList=info("procedurestack")
folderArray=folderpath(folder(""))
sizeCheck=arraysize(folderArray,":")
smallFolderArray=arrayrange(folderArray,4,sizeCheck,":")
panFilesList=listfiles(folder(""),"????KASX")
activeFiles=info("files")
allvariables="Global variables"+¶+¶+info("globalvariables")+¶+¶+"local variables"+¶+¶+info("localvariables")+¶+¶+"fileglobal variables"+¶+¶+info("filevariables")+¶+¶+"window variables"+¶+¶+info("windowvariables")
procsNames=arraycolumn(proceduresCalled,1,¶,¬)
procsDBs=arraycolumn(proceduresCalled,2,¶,¬)



errorList="array of error to call to below"

displaydata "Hi! This is an error checker by Lunar!"
+¶+¶+¶+
"ERROR:"
+¶+
"You can't continue the '"+mostRecentProc+"'"+¶+" procedure without correcting an error."
+¶+¶+
"Press 'Stop' to stop this procedure"
+¶+¶+
"You can hit the 'copy' button, and send this to tech-support@fedcoseeds.com if you need help"
+¶+¶+¶+¶+¶+¶+
"THE FOLLOWING LINES ARE TO HELP WITH ERROR CHECKING AND CAN BE DISREGARDED"
+¶+¶+¶+
"folder user was in: "
+¶+
folderArray
+¶+¶+¶+
"current Pan files in that folder are: "
+¶+
panFilesList
+¶+¶+¶+
"currently open files are: "
+¶+
activeFiles
+¶+¶+¶+
"last procedures run were"
+¶+
procList
, {title="Error Capture Bot 1.0" captionwidth=900 size=17 height=900 width=800}
revealinfinder folder(""),""
stop

