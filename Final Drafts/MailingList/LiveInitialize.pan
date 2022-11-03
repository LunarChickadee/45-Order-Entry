
//______This is to set users for deduplication and other specific funtions_______//
global special_user_list,DedupOn
permanent username

DedupOn=0

define username,"None"
special_user_list="Bria
Kate
NoneOfTheAbove"

if username="None" or username=""
    
superchoicedialog special_user_list,username,
{caption="This should only run the first time you run this file. 
Please choose NoneOfTheAbove unless you see your name here." 
captionheight=2 title="User Name Choice"}
endif

//_________________________________end username______//


global New, Num, Numb, enter, place, ID, CC, ED, credit, orders, ship, Flag, waswindow, vfindcurrent, vGlobeSerialNum
fileglobal searchcust, findcust, getcust, searchname, findname, getname, findcurrent, vSerialNum

vSerialNum=""

expressionstacksize 75000000
Num=0
findname=""
searchname=""
searchcust=""
vGlobeSerialNum="0"
gosheet
noshow
call "listsortcomplete/1"
endnoshow
waswindow = info("DatabaseName") 

case lower(folderpath(dbinfo("folder",""))) contains "dedup"
vSerialNum="2074269900"
vGlobeSerialNum="2074269900"
endcase


Openfile "customer_history"
local findcurrent
;, vSerialNum  //FLAG
vfindcurrent=0



global findcurrent
case folderpath(dbinfo("folder","")) CONTAINS "ogs" or folderpath(dbinfo("folder","")) CONTAINS "walk"
    makesecret
    goform "Add Walkin Customer"
    waswindow = info("windowname")
case lower(folderpath(dbinfo("folder",""))) contains "dedup"
    bigmessage "This is a deduplication specific Mailing List, please don't use it for order entry"
defaultcase
    ;openfile "fcmadc"   ///UNCOMMENT THIS
    ;makesecret
    
    Openfile "44orders"
    save
    Openfile "45orders"
    save
    openfile "ZipCodeList"
    save
    makesecret
endcase


//////#Change this to a folder specific
if vGlobeSerialNum contains "2074269900"
setwindow  290,127,800,1059,""
openform "customeractivity"
window  waswindow
zoomwindow 26,429,346,1280,"" //I think this was causing issues
showpage
endif
///#edit this one too
if vGlobeSerialNum notcontains "2074269900"
Openfile "44orders"
Openfile "45orders"
Openfile "Customer#"
endif


window  waswindow
//zoomwindow 26,429,346,1280,"" //I think this was causing issues
//showpage

//openfile "ZipCodeList"
//makesecret
//window waswindow



message "All Done Loading Mailing List!"




/*'#######################################Old Code############## 

moved 3/11/22
SerialNumberFind for an old way of doing deduplication
vGlobeSerialNum=grabfilevariable("45 mailing list", vSerialNum)
//added to get the customeractivity form to open for those doing mailing list deduplicaiton work -rach

//vSerialNum="73229.osmegmce, 81405.swjgkecx, 81408.H%v"

'#######################################Old Code##############*/
