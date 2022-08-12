///*********This is the FileChecker macro in GetMacros
local fileNeeded,folderArray,smallFolderArray,sizeCheck

//replace this with whatever file you're error checking
//----------------------//
fileNeeded="members"    //
//----------------------//


case info("files") notcontains fileNeeded and listfiles(folder(""),"????KASX") contains fileNeeded
openfile fileNeeded

case listfiles(folder(""),"????KASX") notcontains fileNeeded

    folderArray=folderpath(folder(""))
    sizeCheck=arraysize(folderArray,":")
    smallFolderArray=arrayrange(folderArray,4,sizeCheck,":")

//See an example below this codebase of what this looks like 
    displaydata "Error:"
    +¶+
    "You are missing the '"+fileNeeded+"' Panorama file in this folder 
    and can't continue this procedure without it. Please move a copy of
    '"+fileNeeded+"' to the appropriate folder and try the procedure again"
    +¶+¶+¶+
    "folder you're currently running from is: "
    +¶+
    smallFolderArray
    +¶+¶+¶+
    "current Pan files in that folder are: "
    +¶+
    listfiles(folder(""),"????KASX")
    +¶+¶+¶+
    "Pressing 'Ok' will open the Finder to your current folder"
    +¶+¶+
    "Press 'Stop' will stop this procedure", {title="Missing File!!!!" captionwidth=900 size=17 height=500 width=800}
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