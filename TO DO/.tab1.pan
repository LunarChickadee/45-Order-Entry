global thisCustomerLine,userPick,matchingCustomersArray
;if info("fieldname")="C#"
style "record blue"
;endif

thisCustomerLine=""
thisCustomerLine=exportline()
Numb=0
if «C#»>0
    Numb=«C#»
    window "customer_history:secret"
    Find «C#» = Numb
        if info("found")=0

        select exportline() contains array(thisCustomerLine,seq(),¬)

        if exportline() contains arrayfilter matchingCustomersArray, matchingCustomersArray,
        arraybuild matchingCustomersArray,¶,"",?(exportline() contains array(thisCustomerLine,seq(),¬),exportline()+¶+matchingCustomersArray,""),
        ;superchoicedialog 
            OpenSheet
            lastrecord
            insertbelow
        endif
    «C#»=grabdata(thisFYear+" mailing list", «C#»)
    Con=grabdata(thisFYear+" mailing list", Con)
    Group=grabdata(thisFYear+" mailing list", Group)
    MAd=grabdata(thisFYear+" mailing list", MAd)
    City=grabdata(thisFYear+" mailing list", City)
    St=grabdata(thisFYear+" mailing list", St)
    Zip=grabdata(thisFYear+" mailing list", Zip)
    «SpareText2»=grabdata(thisFYear+" mailing list", «SpareText2»)
    ;closewindow
    ;window "customer_history:customeractivity"

    window thisFYear+" mailing list"
endif

