
///*********This is the FileChecker macro in GetMacros
local fileNeeded,folderArray,smallFolderArray,sizeCheck, procList, mostRecentProc

//replace this with whatever file you're error checking
//----------------------//
fileNeeded="members"    //
//----------------------//


case info("files") notcontains fileNeeded and listfiles(folder(""),"????KASX") contains fileNeeded
openfile fileNeeded

case listfiles(folder(""),"????KASX") notcontains fileNeeded
    mostRecentProc=array(info("procedurestack"),1,¬)
    procList=info("procedurestack")
    folderArray=folderpath(folder(""))
    sizeCheck=arraysize(folderArray,":")
    smallFolderArray=arrayrange(folderArray,4,sizeCheck,":")
    message mostRecentProc

//See an example below this codebase of what this looks like 
displaydata "Hi! This is an error checker by Lunar!"
+¶+¶+¶+
"ERROR:"
+¶+
"You are missing the '"+fileNeeded+"' Panorama file in this folder 
and can't continue the '"+mostRecentProc+"'"+¶+" procedure without it. Please move a copy of
'"+fileNeeded+"' to the appropriate folder and try the procedure again"
+¶+¶+¶+
"Pressing 'Ok' will open the Finder to your current folder"
+¶+¶+
"Press 'Stop' will stop this procedure"
+¶+¶+
"You can hit the 'copy' button, and send this to tech-support@fedcoseeds.com if you need help"
+¶+¶+¶+¶+¶+¶+
"THE FOLLOWING LINES ARE TO HELP WITH ERROR CHECKING AND CAN BE DISREGARDED"
+¶+¶+¶+
"folder you're currently running from is: "
+¶+
smallFolderArray
+¶+¶+¶+
"current Pan files in that folder are: "
+¶+
listfiles(folder(""),"????KASX")
+¶+¶+¶+
"currently open files are: "
+¶+
info("files")
+¶+¶+¶+
"last procedures run were"
+¶+
info("procedurestack")
, {title="Missing File!!!!" captionwidth=900 size=17 height=900 width=800}
revealinfinder folder(""),""
stop

defaultcase
window fileNeeded

endcase

/*
Example:

You are missing the 'members' Panorama file in this folder 
and can't continue this procedure without it. Please move a copy of
'members' to the appropriate folder and try the procedure again


folder you're currently running from is: 
Desktop:Panorama:FY45 Panorama Projects:GetMacros:


current Pan files in that folder are: 
GetMacros
GetMacrosDL
GetMacros44


Pressing 'Ok' will open the Finder to your current folder

Press 'Stop' will stop this procedure
*/

debug

