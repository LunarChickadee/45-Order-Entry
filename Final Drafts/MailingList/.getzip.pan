fileglobal listzip, thiszip, findher, findzip, findaddress, newcity, arraynumb,sortzip, sortcity
serverlookup "off" 
sortzip=""
sortcity=""
arraynumb=0
listzip=""
thiszip=""
newcity=""
again:
findher=""
waswindow=info("windowname")



supergettext findher, {caption="Enter Address.Zip or .Zip to find everyone" height=100 width=400 captionfont=Times captionsize=14 captioncolor="cornflowerblue"
    buttons="Find;Redo;Cancel"}
    if info("dialogtrigger") contains "Find"
        findzip=extract(findher,".",2)
        findzip=strip(findzip)
        if length(findzip)=4
            findzip="0"+findzip
        endif
        findaddress=extract(findher,".",1)
        liveclairvoyance findzip,listzip,¶,"",thisFYear+" mailing list",pattern(Zip,"#####"),"=",str(«C#»)+¬+rep(" ",7-length(str(«C#»)))+Con+rep(" ",max(20-length(Con),1))+¬+MAd+¬+City+¬+St+¬+pattern(Zip,"#####"),0,0,""
        if findaddress=""
            sortzip=listzip
        else
            arraysubset listzip, listzip, ¶, import() contains findaddress
            loop arraynumb=arraynumb+1
            stoploopif arraynumb>arraysize(listzip,¶)
                sortzip=sortzip+?(extract(extract(listzip,¶,arraynumb),¬,3) contains findaddress,extract(listzip,¶,arraynumb)+¶,"")
            until arraynumb=arraysize(listzip,¶)+1
        endif
        if info("found")=0
            beep
            NoYes "No one in that zip. Try another?"
            findher=""
            If clipboard()="Yes"
                goto again
            else
                insertbelow
                stop
            endif
        endif
        if arraysize(listzip,¶)=1
            find MAd contains findaddress and pattern(Zip,"#####") contains findzip
            field MAd
            if «C#»>0
                CC=«C#»
                window "customer_history:customeractivity"
                find «C#»=CC
                window waswindow
            endif
            stop
        endif
    endif
    if info("dialogtrigger") contains "Redo"
        findher=""
        goto again
    endif
    if info("dialogtrigger") contains "Cancel"
        stop
    endif

superchoicedialog sortzip, thiszip, {height=400 width=800 font=Courier caption="Click on one and then hit Choose or New for new entry" 
    captionfont=Times captionsize=12 captioncolor=red size=16 buttons="OK:100;New:100;Cancel:100"}
if info("dialogtrigger") contains "OK"
    
    find «C#» = val(strip(extract(thiszip, ¬,1))) and MAd=extract(thiszip, ¬,3) and City contains extract(thiszip, ¬,4)
    ;;find MAd=extract(thiszip, ¬,3) and City contains extract(thiszip, ¬,4)
    field MAd
    if «C#»>0
        CC=«C#»
        window "customer_history:customeractivity"
        find «C#»=CC
        window waswindow
    endif
endif
if info("dialogtrigger") contains "New"
    arrayfilter sortzip, sortcity, ¶, extract(extract(sortzip,¶,seq()),¬,4)
    arraydeduplicate sortcity,  sortcity, ¶

    if (findaddress≠"" and arraysize(sortcity,¶)>2) or (findaddress="" and arraysize(sortcity,¶)>1)
        gettext "Which town?", newcity
    endif
    if newcity≠""
        find Z=val(findzip) and City contains newcity
        insertbelow
        field Con
    else
        find Zip=val(findzip)
        insertbelow
        field Con
    endif
endif
showpage
serverlookup "on"