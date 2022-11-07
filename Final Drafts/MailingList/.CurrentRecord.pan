

global FindCust

FindCust=0

if vSerialNum contains info("serialnumber") or username contains "Kate"
    if DedupOn=-1
        local KeyStroke
        KeyStroke=info("trigger")[5,-1]
        ;message KeyStroke //for debugging

        waswindow = info("DatabaseName") 
        if info("files") notcontains "customer_history"
            stop
        endif

        FindCust=«C#»

        window "customer_history:customeractivity"
        find «C#»=FindCust
        window waswindow
        ////__Looks like this was designed to use tab1 to insert a new line? 
        //but tab1 does more than that......likely dup culprit
        ;KeyStroke=info("trigger")[5,1]
        if KeyStroke=chr(3)
            call ".tab1"
        endif
    endif
endif