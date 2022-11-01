//this runs when C# is changed in Orders
//users are currently using two enters to get this to run during order entry
waswindow=info("windowname")

Global Num,addressArray,return_to_form
return_to_form=info("formname")
Num=«C#»
ono=OrderNo
addressArray=""
conArray=""


if MAd≠""
    aray=MAd+"."+pattern(Zip,"#####") //old, and left for compatibility
    addressArray=MAd+"."+pattern(Zip,"#####")
endif

if Con≠""
    conArray=Con[1," "][1,-2]+" "+Con["- ",-1][2,-1]
endif

if «C#»=0
    window newyear+" mailing list"
    call ".newzip"
    stop
endIf 

window newyear+" mailing list"
find «C#»=Num

if info("found")=0
    call "getzip/Ω"
else
    window waswindow
    call ".customerfill"   
endif
