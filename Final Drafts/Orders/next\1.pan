///__tests the first two digits to see if it's an internet order____///
global paper_orders_array,paper_order,internet_order
paper_orders_array="30,31,40,41,50,51,60,61,70"
internet_order=0
paper_order=0
if  paper_orders_array notcontains str(OrderNo)[1,2]
        internet_order=-1
    else
        paper_order=-1
endif

global WinCheck, intOrder1, fromBranch,restartRun,formCheck



intOrder1=int(OrderNo)
fromBranch=""
WinCheck=info("windows")
formCheck=info("formname")

if WinCheck notcontains "input" or formCheck notcontains "input"
    message "This Must be run from an 'order Input' form"
    stop
endif


//___Check Selection/Entered___//
if val(EntryDate)>0
    yesno "This Order Has already been entered, would you like to select Orders that have not been entered?"
    if clipboard()="Yes"
        select OrderNo>0
        selectwithin Sequence≠0
        selectwithin val(EntryDate)=0
        firstrecord
        restartRun=-1
        Goto CheckForm

        //___This was meant to find the next order they should do in the same category, but could cause skips___//
        /* 
        find OrderNo>intOrder1
            if (not info("found"))
                firstrecord
            endif   
        */ 
    else
        stop
    endif
endif

//_____CheckForm_________//


restartRun=0

CheckForm:

//___duplicated for checkform looping___//
if restartRun=-1
    intOrder1=int(OrderNo)
    fromBranch=""
    WinCheck=info("windows")
endif
//____________________________________//

case intOrder1 ≥ 700000
    fromBranch="Seeds"
        //__opens or goes to open input window__//
        if WinCheck notcontains "seedsinput"
            setwindow 336,132,643,844,""
            openform "seedsinput"
        endif

        if info("formname") notcontains "seedsinput"
            goform "seedsinput"
        endif  
case intOrder1 ≥ 600000 and intOrder1 < 700000
    fromBranch="OGS;POE"
        if WinCheck notcontains "mtinput"
            setwindow 336,132,588,977,""
            openform "mtinput"
         endif

        if info("formname") notcontains "mtinput"
            goform "mtinput"
        endif 
case intOrder1 ≥ 500000 and intOrder1 < 600000
    fromBranch="OGS;Bulbs"
        if WinCheck notcontains "bulbsinput"
            setwindow 356,71,521,856,""
            openform "bulbsinput"
        endif

        if info("formname") notcontains "bulbsinput"
            goform "bulbsinput"
        endif 
case intOrder1 ≥ 400000 and intOrder1 < 500000
    fromBranch="Trees"
        if WinCheck notcontains "treesinput"
            setwindow 339,79,591,779,""
            openform "treesinput"
        endif

        if info("formname") notcontains "treesinput"
            goform "treesinput"
        endif 
case intOrder1 ≥ 300000 and intOrder1 <400000
    fromBranch="OGS"
        if WinCheck notcontains "ogsinput"
            setwindow 420,77,521,856,""
            openform "ogsinput"
        endif

        if info("formname") notcontains "ogsinput"
            goform "ogsinput"
        endif 
endcase
//____EndCheckForm______//




groupArray=?(Group≠"", Group, Con)
;rayc=«C#Text»

//__apply discount__//
if OrderNo=int(OrderNo)
    rayg=?(MemDisc=round(Subtotal*.01,.01),"Y","")
endif

//__getPool__//
if info("formname")="treesinput"
    rayi=Pool
endif

//downrecords if not starting over

ono=OrderNo
if restartRun=0
    downrecord
endif
oono=0

//___Not Sure why this is here__ ASK KATE AND BRIA IF THEY NEED CMD-1 TO WORK WITH THIS//
if info("formname")="addresschecker" 
    stop
endif

field «C#»
if OrderNo≠int(OrderNo)
    Group=groupArray
    ;«C#Text»=rayc
    MemDisc=?(rayg="Y",.01,MemDisc)
    if info("formname")="treesinput"
        Pool=rayi
    endif
    field Con
    ;call ".dropship"
endif

if str(OrderNo) contains "."
    EntryDate = today()
    stop
else
    EntryDate=today()
endif

;; selecting just internet orders

if OrderNo=int(OrderNo)
    if (OrderNo >= 320000 and OrderNo < 400000)
    or (OrderNo >= 420000 and OrderNo < 500000)
    or (OrderNo >= 520000 and OrderNo < 600000)
    or (OrderNo >= 620000 and OrderNo < 700000)
    or (OrderNo >= 710000 and OrderNo < 1000000)
            ;call "updatemail/7"
            call "NewSearch/ßß"
    endif
endif

if restartRun=-1
downrecord
endif

///________testspace____Delete me______////


