rollingdisc=""
global finddisccust
waswindow=info("windowname")
if info("files") notcontains "discounttable"
    openfile "discounttable"
    makesecret
endif
finddisccust=«C#»
window "discounttable:secret"
find «C#»=finddisccust
if info("found")=0
    rollingdisc="Not in discount table yet"
else
    if Bulk=1
        rollingdisc="Bulk Prices"
    else
        rollingdisc="Rolling Discount= "+str(Discount*100)+"%"
    endif
endif
window waswindow
«2SpareText»=rollingdisc
drawobjects  ///is this in a formwindow?