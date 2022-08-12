
///*********This is the FileChecker macro in GetMacros
local fileNeeded,folderArray,smallFolderArray,sizeCheck, procList, mostRecentProc, 
panFilesList,activeFiles,allvariables,procNames,procDBs,errorList, procText, procTextArray,
lineNum, procCount, usedvariables,strippedText


strippedText=""
procList=info("procedurestack")
procNames=arraycolumn(procList,1,¶,¬)
procDBs=arraycolumn(procList,2,¶,¬)
mostRecentProc=array(procNames,2,¶) //it's 2 because this procedure will be in the list and we want the procedure that got the error
folderArray=folderpath(folder(""))
sizeCheck=arraysize(folderArray,":")
smallFolderArray=arrayrange(folderArray,4,sizeCheck,":")
panFilesList=listfiles(folder(""),"????KASX")
activeFiles=info("files")
allvariables="Global variables"+¶+¶+info("globalvariables")+¶+¶+"local variables"+¶+¶+info("localvariables")+¶+¶+"fileglobal variables"+¶+¶+info("filevariables")+¶+¶+"window variables"+¶+¶+info("windowvariables")
procTextArray=""
procText=""

;displaydata procNames
;displaydata procDBs
lineNum=1
procCount=arraysize(procNames,¶)-1
;message "count"+str(procCount)

Repeat:
arraybuild procTextArray,¶,"",
"__________"+nthline(procList,seq())+¶+¶+getproceduretext(nthline(procDBs,seq()),nthline(procNames,seq()))+¶+¶
if error
    goto Repeat
endif
strippedText=replacemultiple(procTextArray,
“.||?||!||,||;||:||-||_||(||)||[||]||{||}||"||'||+||¶||¬||/||=||*||”,
“ || || || || || || || || || || || || || || || || || || || || || ||”,
"||")
displaydata strippedText
stop
/*
tallmessage strippedText
arraybuild usedvariables, ¶,"",strippedText contains array(allvariables,seq(),¶)


//arrayfilter(allvariables,¶,?(procTextArray contains array(allvariables,seq(),¶),import(),""))
displaydata usedvariables
*/

debug
    
errorList="array of error to call to below"

displaydata "Hi! This is an error checker by Lunar!"
+¶+¶+¶+
"ERROR:"
+¶+
"The '"+mostRecentProc+"' created an error."
+¶+¶+
"Hit Okay if you want to try what you were doing again"
+¶+¶+
"if the problem persists, use the 'copy' button, paste this error in an e-mail 
and send it to: tech-support@fedcoseeds.com with a description of what happened"
+¶+¶+¶+¶+¶+¶+¶+¶+¶+¶+¶+¶+
"THE FOLLOWING LINES ARE TO HELP WITH ERROR CHECKING"
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
+¶+¶+¶+
"text of non-design/form procedures:"
+¶+
procTextArray
+¶+¶+¶+
"All initialized variables"
+¶+
allvariables
, {title="Error Capture Bot 1.0" captionwidth=900 size=17 height=900 width=1000}
stop