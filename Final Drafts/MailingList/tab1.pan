;if info("fieldname")="C#"
style "record black"
;endif

//_______User Edits C#,Con, or Group____
    //______If they have a customer number, see if they are in customer history already
    //______If not there, create a record for them
Numb=0
if «C#»>0
    Numb=«C#»
    window "customer_history"
    Find «C#» = Numb
    if (not info("found"))
        OpenSheet
        lastrecord
        insertbelow
    endif
    «C#»=grabdata(thisFYear+" mailing list", «C#»)
    Con=grabdata(thisFYear+" mailing list", Con)
    «Group»=grabdata(thisFYear+" mailing list", «Group»)
    MAd=grabdata(thisFYear+" mailing list", MAd)
    City=grabdata(thisFYear+" mailing list", City)
    St=grabdata(thisFYear+" mailing list", St)
    Zip=grabdata(thisFYear+" mailing list", Zip)
    «SpareText2»=grabdata(thisFYear+" mailing list", «SpareText2»)
    ;closewindow
    ;window "customer_history:customeractivity"

    window thisFYear+" mailing list"
endif

