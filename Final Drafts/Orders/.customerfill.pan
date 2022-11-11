local Flag
Flag=""

waswindow=info("windowname") //XXorders
///this needs a call to info("formname") for the cases below

call .FromBranch

Num=«C#»
window thisFYear+" mailing list"
find «C#»=Num
rayj=«Mem?»

«M?»=?(«M?» contains "E" or «M?» contains "U" or «M?» contains "R", "", «M?»)

case fromBranch contains "bulbs"
    Bf=?(Bf=0,1,Bf)
case fromBranch contains "seeds"
    S=?(S=0,1,S)
case fromBranch contains "ogs"
    S=?(S=0,1,S)
case fromBranch contains "poe"
    S=?(S=0,1,S)
case fromBranch contains "trees"
    T=?(T=0,1,T)
endcase

if info("found")=0
    call "getzip/Ω"
    stop
endif

If Outstanding>0
    Message "This customer owes us from last year."
    stop
endif

window waswindow
window "customer_history:secret"
find «C#»=Num
window waswindow
Flag=grabdata(thisFYear+" mailing list", RedFlag)

If Flag≠""
    case Flag="changed"
        Flag=""
    case Flag="new"
        Flag=""
    case Flag contains "bad" or Flag contains "returned" or Flag contains "moved" or Flag contains "no forward"
        Message "Check this order carefully."
    endcase
    
    window thisFYear+" mailing list"
    RedFlag=Flag
    window waswindow
EndIf

;; this is just trying to check whether it's an internet order
if (OrderNo > 320000 and OrderNo < 400000)
or (OrderNo > 420000 and OrderNo < 500000)
or (OrderNo > 520000 and OrderNo < 600000)
or (OrderNo > 620000 and OrderNo < 700000)
or (OrderNo > 710000 and OrderNo < 1000000)
    stop
endif

Group=grabdata(thisFYear+" mailing list",Group)
Con=grabdata(thisFYear+" mailing list", Con)
MAd=grabdata(thisFYear+" mailing list", MAd)
City=grabdata(thisFYear+" mailing list", City)
St=grabdata(thisFYear+" mailing list", St)
Zip=grabdata(thisFYear+" mailing list", Zip)
SAd=grabdata(thisFYear+" mailing list", SAd)
Cit=grabdata(thisFYear+" mailing list", Cit)
Sta=grabdata(thisFYear+" mailing list", Sta)
Z=grabdata(thisFYear+" mailing list",Z)
Telephone=grabdata(thisFYear+" mailing list",phone)
Email=grabdata(thisFYear+" mailing list", email)
;comgrower=grabdata(thisFYear+" mailing list", CG)

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
    window "45 mailing list:secret"
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
            else
                Field Sub1
                editcell
                Field Sub2
                editcell
                field «1stPayment»
            endIf
        endif
        EditCellStop
     else
        if info("formname")="ogsinput"
            Field «1stPayment»
        else
            field Sub1
            editcell
            field Sub2
        endIf
    endif
Endif 