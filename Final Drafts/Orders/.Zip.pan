waswindow=info("windowname")
//don't do any of the following on addresschecker
    if info("formname") contains "addresschecker"
    stop
    endif
//don't do anything but move fields if I used Tab to get here
    If info("trigger")="Key.Tab"
    Field SAd
    EndIf

//GetNumber
ID=«C#»

//________Update Files with New Address from Order______//
If info("trigger")="Key.Return"
YesNo "Update "+thisFYear+" "+"mailing list & customer_history Mailing Address?"
        If clipboard()="Yes"
      window thisFYear+" mailing list:secret"
            If «C#»≠ID
            if info("selected")<info("records")
            selectall
            endif
            Find «C#»=ID
            EndIf
        MAd=grabdata(thisFYear+"orders", MAd)
        City=grabdata(thisFYear+"orders", City)
        St=grabdata(thisFYear+"orders", St)
        Zip=grabdata(thisFYear+"orders", Zip)
        adc=lookup("newadc","Zip3",pattern(Zip,"#####")[1,3],"adc",0,0)
        Field «C#»
        window "customer_history:secret"
        Find «C#»=ID
        MAd=grabdata(thisFYear+"orders", MAd)
        City=grabdata(thisFYear+"orders", City)
        St=grabdata(thisFYear+"orders", St)
        Zip=grabdata(thisFYear+"orders", Zip)
        window waswindow
        EndIf
        if info("formname")=thisFYear+"orders:addresschecker"
stop
endif
Field SAd
EndIf
