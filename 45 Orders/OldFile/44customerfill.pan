fileglobal vDate
local Flag

Flag=""
vDate=datepattern(today(),"YY")
waswindow=info("windowname")
Num=«C#»
window newyear+" mailing list"

find «C#»=Num
rayj=«Mem?»


case waswindow contains "bulbs"
    Bf=?(Bf=0,1,Bf)
case waswindow contains "seeds"
    S=?(S=0,1,S)
case waswindow contains "ogs"
    S=?(S=0,1,S)
case waswindow contains "mt"
    S=?(S=0,1,S)
case waswindow contains "trees"
    T=?(T=0,1,T)
endcase
//******!!needs testing
SpareText3=datepattern(today(),"MM/DD/YY")+" - Most Recent Order"+" "+"S"+str(S)+" "+"T"+str(T)+" "+"B"+str(Bf)

if info("found")=0
    call "getzip/Ω"
    stop
endif

If Outstanding>0
    Message "This customer owes us from last year."
    stop
endif

window waswindow
window "customer_history"  /*#was :secret*/
find «C#»=Num
window waswindow
Flag=grabdata(newyear+" mailing list", RedFlag)


If Flag≠""
    case Flag="changed"
        Flag=""
    case Flag="new"
        Flag=""
    case Flag contains "bad" or Flag contains "returned" or Flag contains "moved" or Flag contains "no forward" or Flag contains "temp" or Flag contains "mail" or Flag contains "attempt" or Flag contains "no"
        Message "Check this order carefully."
    endcase
    
    window newyear+" mailing list"
    RedFlag=Flag+¶+RedFlag

    window waswindow
EndIf

;; #this is just trying to check whether its an internet order
if (OrderNo > 320000 and OrderNo < 400000)
or (OrderNo > 420000 and OrderNo < 500000)
or (OrderNo > 520000 and OrderNo < 600000)
or (OrderNo > 620000 and OrderNo < 700000)
or (OrderNo > 710000 and OrderNo < 1000000)
    stop
endif

Group=grabdata(newyear+" mailing list",Group)
Con=grabdata(newyear+" mailing list", Con)
MAd=grabdata(newyear+" mailing list", MAd)
City=grabdata(newyear+" mailing list", City)
St=grabdata(newyear+" mailing list", St)
Zip=grabdata(newyear+" mailing list", Zip)
SAd=grabdata(newyear+" mailing list", SAd)
Cit=grabdata(newyear+" mailing list", Cit)
Sta=grabdata(newyear+" mailing list", Sta)
Z=grabdata(newyear+" mailing list",Z)
Telephone=grabdata(newyear+" mailing list",phone)
Email=grabdata(newyear+" mailing list", email)
;comgrower=grabdata(newyear+" mailing list", CG)

case info("formname")="seedsinput"
    LastYearTotal=grabdata("customer_history", S43)
case info("formname")="bulbsinput"
    LastYearTotal=grabdata("customer_history", Bf43)
;case info("formname")="ogsinput"
    ;LastYearTotal=grabdata("customer_history", OGS43)
case info("formname")="treesinput"
    LastYearTotal=grabdata("customer_history", T43)
case info("formname")="mtinput"
    LastYearTotal=grabdata("customer_history", M43)
endcase

«C#Text»=str(«C#»)

If Taxable="N"
    window "44 mailing list:secret"
    TaxEx="Y"
    window waswindow
endif

;; exclude scionwood order number range
If info("formname")="treesinput" And Z≠ 0 and (OrderNo < 410000 or OrderNo > 420000)
    case ShipCode ="T"
        Pool = 20
    case ShipCode ="P"
        Pool = 22
    defaultcase
        call ".pool"
    endcase
endif

if rayj="Y"
    call ".memberdisc"
else
    MemDisc = 0
    call ".retotal"
endif

Field SAd

If SAd=""
    stop
else
    Field Telephone
    If Telephone≠""
        field Email
        if Email≠""
            if info("formname")="ogsinput"
                call .rollingdiscount
                Field «1stPayment»
                ;editcell
                ;field TaxCharged
            else
                Field Sub1
                editcell
                Field Sub2
                editcell
                field «1stPayment»
                ;editcell
                ;field TaxCharged
            endIf
        endif
        EditCellStop
     else
        if info("formname")="ogsinput"
            Field «1stPayment»
            ;editcell
            ;field TaxCharged
        else
            field Sub1
            editcell
            field Sub2
        endIf
    endif
Endif    