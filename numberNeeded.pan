if «C#»≠0
    message "This Customer already has a Number"
    stop 
endif

//gives them an First Year and Branch of Order code
    case fromBranch contains ";"
        if fromBranch contains "Bulb"
            Code="I"+thisFYear+"b"
        endif
        if fromBranch contains "POE"
            Code="I"+thisFYear+"p"
        endif
    case fromBranch contains "Seeds"
    Code = "I"+thisFYear+"s"
    case fromBranch contains "OGS"
    Code = "I"+thisFYear+"o"
    case fromBranch contains "Trees"
    Code = "I"+thisFYear+"t"
    endcase

//gets a new number
openfile "Customer#"
call "newnumber"
window thisFYear+" mailing list"
Field «C#»
    Paste
SpareText2=str(«C#»)
If inqcode=""
    Field inqcode
    inqcode=?(inqcode contains "17", inqcode[3,-1], inqcode)
    EditCell
    field «C#»
EndIf

//fills in catalog requests based on order/location/redflags
call "filler/¬"

If inqcode=""
field inqcode
editcell
endif


//_______________________________//
window "customer_history:secret"
opensheet
insertbelow
«C#»=grabdata(thisFYear+" mailing list", «C#»)
«Group»=grabdata(thisFYear+" mailing list", «Group»)
Con=grabdata(thisFYear+" mailing list", Con)
MAd=grabdata(thisFYear+" mailing list", MAd)
City=grabdata(thisFYear+" mailing list", City)
St=grabdata(thisFYear+" mailing list", St)
Zip=grabdata(thisFYear+" mailing list", Zip)
Email=grabdata(thisFYear+" mailing list", email)
SpareText2=grabdata(thisFYear+" mailing list", SpareText2)
;CloseWindow
window thisFYear+" mailing list"
Call "enter/e"
