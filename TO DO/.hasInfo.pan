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