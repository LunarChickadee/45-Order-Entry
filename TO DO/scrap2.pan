global thisCustomerLine,userPick,matchingCustomersArray
;if info("fieldname")="C#"
style "record blue"
;endif

thisCustomerLine=""
thisCustomerLine=arrayrange(exportline(),1,7,¬)+array(exportline(),16,¬)
displaydata thisCustomerLine
Numb=0
if «C#»>0
    Numb=«C#»
    window "customer_history"
    Find «C#» = Numb
        arraybuild arrayrange(exportline(),1,9,¬),matchingCustomersArray,¬,?(arrayrange(exportline(),1,9,¬) contains array(thisCustomerLine,seq(),¬),matchingCustomersArray=matchingCustomersArray+arrayrange(exportline(),1,9,¬),matchingCustomersArray=matchingCustomersArray)
        displaydata matchingCustomersArray
        ;select exportline() contains array(thisCustomerLine,seq(),¬)
        ;displaydata matchingCustomersArray
endif
        


__________________________________________

global thisCustomerLine,userPick,matchingCustomersArray
;if info("fieldname")="C#"
style "record blue"
;endif

thisCustomerLine=""
thisCustomerLine=arrayrange(exportline(),1,7,¬)+array(exportline(),16,¬)
arraystrip thisCustomerLine, ¬
;displaydata thisCustomerLine
Numb=0
if «C#»>0
    Numb=«C#»
    window "customer_history"
    Find «C#» = Numb
        displaydata arrayrange(exportline(),1,9,¬) contains arrayfilter array(thisCustomerLine,seq(),¬), matchingCustomersArray, 
        stop
        arraybuild arrayrange(exportline(),1,9,¬),matchingCustomersArray,¬,?(arrayrange(exportline(),1,9,¬) contains array(thisCustomerLine,seq(),¬),matchingCustomersArray=matchingCustomersArray+arrayrange(exportline(),1,9,¬),matchingCustomersArray=matchingCustomersArray)
        displaydata matchingCustomersArray
        ;select exportline() contains array(thisCustomerLine,seq(),¬)
        ;displaydata matchingCustomersArray
endif
        
global thisCustomerLine,userPick,matchingCustomersArray,custHist19
;if info("fieldname")="C#"
style "record blue"
;endif

thisCustomerLine=""
thisCustomerLine=arrayrange(exportline(),1,7,¬)+array(exportline(),16,¬)
arraystrip thisCustomerLine, ¬
;displaydata thisCustomerLine
Numb=0
if «C#»>0
    Numb=«C#»
    window "customer_history"
    Find «C#» = Numb
        custHist19=arrayrange(exportline(),1,9,¬)
        arraybuild matchingCustomersArray,matchingCustomersArray, ¬,?(
            custHist19 contains arrayfilter(thisCustomerLine,¬,array(thisCustomerLine,seq(),¬)),import(),"")
endif
        

global thisCustomerLine,userPick,matchingCustomersArray,custHist19, custCounter1
;if info("fieldname")="C#"
style "record blue"
;endif

thisCustomerLine=""
thisCustomerLine=arrayrange(exportline(),1,7,¬)+array(exportline(),16,¬)
arraystrip thisCustomerLine, ¬
;displaydata thisCustomerLine
Numb=0
if «C#»>0
    Numb=«C#»
    window "customer_history"
    Find «C#» = Numb

        custHist19=arrayrange(exportline(),1,9,¬)
        custCounter1=1
        find arrarrayrange(exportline(),1,9,¬) contains array(thisCustomerLine, seq(),¬)
        loop
            next
        while info("found")
        
endif
        
