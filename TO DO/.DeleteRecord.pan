global cNumVal,hasAnAddress,hasACon

cNumVal=0
hasACon=""
hasAnAddress=""

field «C#»
    copycell
    cNumVal=val(clipboard())

hasAnAddress=?(MAd≠"",MAd+" "+str(Zip),"No Mailing Address")

case «Con»="" and «Group»=""
    hasACon = "No Name or Group"
case «Con»≠"" and «Group»≠""
    hasACon = «Con»+"|"+«Group»
defaultcase
    hasACon =«Con»
endcase

YesNo "Delete Customer #:"+str(«C#»)+¶+
"Con: "+hasACon+¶+
"MAd: "+hasAnAddress
    if clipboard()="No"
    stop
    endif
deleterecord

if cNumVal>0
    window "customer_history:customeractivity"
    if «C#»≠cNumVal
        find «C#»=cNumVal
            if info("found")=0
                window thisFYear+" mailing list"
                stop
            else
                case «Con»="" and «Group»=""
                    hasACon = "No Name or Group"
                case «Con»≠"" and «Group»≠""
                    hasACon = «Con»+"|"+«Group»
                defaultcase
                    hasACon =«Con»
                endcase

                YesNo "delete in customer history?"+¶+
                str(«C#»)+" "+hasACon
                    if clipboard()="Yes"
                        deleterecord
                    endif
            endif
    endif
endif

window thisFYear+" mailing list"
if info("selected")<info("records")
    downrecord
endif

