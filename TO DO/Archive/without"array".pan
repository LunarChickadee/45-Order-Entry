extendedexpressionstack
///*********This is the .GetError macro in GetMacros
fileglobal fileNeeded,folderArray,smallFolderArray,sizeCheck, procList, mostRecentProc, 
panFilesList,activeFiles,allvariables,procNames,procDBs,errorList, procText, procTextArray,
lineNum, procCount, usedvariables,printVariables,strippedText,getError,errorMsg,vDb,vProc

permanent errorDictionary

errorMsg=""
getError=""
getError=str(parameter(1))
if error
getError="Unknown"
endif

strippedText=""
sizeCheck=""
procList=""
procNames=""
procDBs=""
mostRecentProc=""
folderArray=""
sizeCheck=""
smallFolderArray=""
panFilesList=""
activeFiles=""
allvariables=""
procTextArray=""
procText=""

sizeCheck=arraysize(info("procedurestack"),¶)-1
procList=?(sizeCheck>2,arrayrange(info("procedurestack"),2,sizeCheck,¶),info("procedurestack"))
procNames=arraycolumn(procList,1,¶,¬)
procDBs=arraycolumn(procList,2,¶,¬)
mostRecentProc=array(procNames,1,¶) //it's 2 because the .GetError procedure will be in the list and we want the procedure that got the error
folderArray=folderpath(folder(""))
sizeCheck=arraysize(folderArray,":")
smallFolderArray=arrayrange(folderArray,4,sizeCheck,":")
panFilesList=listfiles(folder(""),"????KASX")
activeFiles=info("files")
allvariables="Global variables"+¶+¶+info("globalvariables")+¶+¶+"local variables"+¶+¶+info("localvariables")+¶+¶+"fileglobal variables"+¶+¶+info("filevariables")+¶+¶+"window variables"+¶+¶+info("windowvariables")


;displaydata procNames
;displaydata procDBs
lineNum=1
procCount=arraysize(procNames,¶)-1
;message "count"+str(procCount)


debug

//Repeat:
loop
vDb=array(procDBs,lineNum,¶)
vProc=array(procNames,lineNum,¶)
getproceduretext vDb,vProc,procText

procTextArray=vProc+¶+¶+procText+¶+procTextArray
increment lineNum,1
until lineNum=procCount

/*
if error
    goto Repeat
endif
*/




//_________________Make code into word array______________________//

///this function makes two arrays similar enough to compare to find out
//which of the active variables was in the procedures that were recently called

//gets rid of the most common characters in the text and replaces them with ; to give the other functions
//a separator to work with
strippedText=replacemultiple(procTextArray,
“.||?||!||,||;||:||-||_||(||)||[||]||{||}||"||'||+||¶||¬||/||=||*||" "|| ||”,
“;||;||;||;||;||;||;||;||;||;||;||;||;||;||;||;||;||;||;||;||;||;||;||;||”,
"||")

strippedText=stripchar(strippedText,"AZaz09;")
arraystrip strippedText,";"

//take that array and make it a ¶ delimited one
strippedText=replace(strippedText,";",¶)
arraydeduplicate strippedText,strippedText,¶

//get rid of the blank elements in the variable lis
usedvariables=arraystrip(allvariables,¶)

//do a comparison for whats in both of them and put that in printVariables
arrayboth strippedText, usedvariables, ¶, printVariables
;displaydata printVariables
////________________________________________________________________//



////_____________ErrorDisplay________________________________________

errorList="array of error to call to below"

displaydata "Error: '"+mostRecentProc+"' created an error."
+¶+¶+
"ErrorCode: "+getError
+¶+¶+
"Warning! Clicking OK will continue the macro without fixing
the error. Double check your results."
+¶+¶+
"Click 'stop' to end the macro here and try what you were doing again"
+¶+¶+
"If the problem persists, use the 'COPY' button, paste this error in an e-mail 
and send it to: tech-support@fedcoseeds.com with a description of what happened



_______________________________________________________________________________"
+¶+¶+¶+
"---------------------------------------------------
THE FOLLOWING LINES ARE TO HELP WITH ERROR CHECKING
---------------------------------------------------"
+¶+¶+¶+
"folder in use: "
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
"variables used in last macros:"
+¶+
printVariables, 
{title="Error Capture Bot 3.0" 
captionwidth=900 
size=17 
height=500 
width=1000}


