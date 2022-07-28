


//#moved variable from the top due to this loop clearing them

loop
if info("windows") contains "New Database Wizard"
    window "New Database Wizard"
    closewindow
    ;message "Hit Ok or Enter to continue loading"
    window "45 mailing list"
endif
until info("windows") notcontains "New Database Wizard"

////Variables need to be redeclared for the above loop to not break the file
global New, Num, Numb, enter, place, ID, CC, ED, credit, orders, ship, Flag, waswindow,vfindcurrent, vGlobeSerialNum, wMailList, wCustHist, wOrders, wCustNum
fileglobal searchcust, findcust, getcust, searchname, findname, getname, findcurrent, vSerialNum

//Gets windows into variables to call

wCustHist="customer_history"
wOrders="45orders"
wMailList="45 mailing list"
wCustNum="Customer#"



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
