/*
This Function is supposed to either 
1. find the customer already in the list
    1a. Call Enter

or

2. add a new line and fill it with this new data

*/


///__tests the first two digits to see if it's an internet order____///
global paper_orders_array,paper_order,internet_order
paper_orders_array="30,31,40,41,50,51,60,61,70"
internet_order=0
paper_order=0
if  paper_orders_array notcontains str(OrderNo)[1,2]
        internet_order=-1
    else
        paper_order=-1
    endif

if paper_order=-1
message "Sorry, this function only works for internet orders right now. Try CMD-1 or CMD-E instead"
stop
endif 

global vChoice,vFirstInitial,vLastName,vExtracted,vExtracted2,vFirstIntLastName,vCustNum,WinNumber,
vEmail,vPhoneNum, chooseCustomerArray,chooseCustChoice,rayj,MLWildCard,MLWildCard2,orderWildCard,amperArray,thisCustomerLine,
string_zip

//gets first name and last name
//kept for possible dependencies, 
//but made conArray to replace it
//so I know when other things are calling for the Con
rayj=Con[1," "][1,-2]+" "+Con["- ",-1][2,-1] 
conArray=Con[1," "][1,-2]+" "+Con["- ",-1][2,-1]

waswindow=info("windowname")

window thisFYear+"orders"

if info("formname")="treesinput" and (OrderNo<410000 or OrderNo>420000)
    call ".pool"
    endif

/*This fills the variables for the search*/
EntryDate=today()
ono=«OrderNo»
vzip=Zip
//____added to fix inital zeros disappearing_____///
string_zip=pattern(Zip,"#####")
vd=«C#»  // #Davids old code, leaving in case there are dependencies
vCustNum=«C#»
vEmail=Email
vPhoneNum=Telephone
vChoice=0
place=MAd  //was originally just the number to the end of the address, but PO boxes broke it
vCustNum=«C#»
vEmail=Email
vPhoneNum=Telephone
vChoice=0
MLWildCard=""
MLWildCard2=""
orderWildCard=""
thisCustomerLine=""


//builds a WildCard of the name (see MATCH in the Pan Ref)
    vExtracted=""
    vExtracted=extract(conArray," ",1)
    vFirstInitial=?(vExtracted[1,2] notcontains "", vExtracted[1,2],vExtracted[1,1])
    vExtracted2=""
    vLastName=extract(conArray," ",2)
    orderWildCard=str(vFirstInitial+"*"+vLastName)



field «1stPayment»

///___make sure mailing list is open_____
WinNumber=arraysearch(info("windows"), thisFYear+" mailing list", 1,¶)
if WinNumber=0
    openfile thisFYear+" mailing list"
endif

///____can we find them just with the C# they have on the order?

window thisFYear+" mailing list"
selectall
if vd>0
    find «C#»=vd
    if info("found")=-
        thisCustomerLine=str(«C#»)+" "+Con+" "+Group+¶+MAd+" "+pattern(Zip,"#####")
        YesNo "C# Found. Enter This one?"+¶+thisCustomerLine
        if clipboard() contains "Yes"
            call "enter/e"
            stop
            endif
    endif
endif


Choose:

global ChoiceList, Choice, Options
Choice=""

ChoiceList="First Initial & Last Name
By Email
Phone Number
Mailing Address
Open CMD-F and Let me Search (Pan5 version)
Open CMD-F and Let me Search (Pan6 version)
Add New Customer"

superchoicedialog ChoiceList, Choice, {
caption="No Cust Number Match Found. 
How Would You Like to Search? Cancel = Stop 
CMD+Opt+S will get you to this menu again." captionstyle=bold captionheight="3" height="250" 
}
if info("dialogtrigger") contains "cancel"
Stop
endif
;message Choice

vChoice=arraysearch(ChoiceList, Choice, 1, ¶)

case vChoice=1
    window thisFYear+" mailing list"
    //try to find the first initial and last name
    //example J*Forester would be the wildcard, and would match names like Jane Forester
    select Con match orderWildCard
        //if it doesn't find it, check the & names
        if info("empty")
            select Con contains "&"
                selectwithin strip(array(Con,1,"&")) match orderWildCard // name left of & matches (Jane Forester & Kathrine Kidd)
                    or strip(array(Con,2,"&")) match orderWildCard // name right of & matches (Katherine Kidd & Jane Forester)
                    or strip(array(Con,1,"&"))+" "+extract(strip(array(Con,2,"&"))," ",2)["- ",-1] match orderWildCard 
                    //name to the left plus the last name to the right matches (Jane & Katherine Forester)
                        if info("empty")
                            message "Unable to find anyone with that name. Please, choose another option"
                                goto Choose
                        endif
        else
            field Con
            sortup
        endif

case vChoice=2
    if vEmail=""
        message "Customer doesn't have an email on order. Reverting to Search."
        goto Choose
    endif
    window thisFYear+" mailing list"
    select email=vEmail
    if info("empty")
        message "No email match found."
        goto Choose
    endif
case vChoice=3
     if vPhoneNum=""
        message "Customer doesn't have an Phone Num on order. Reverting to Search."
        goto Choose
    endif
    window thisFYear+" mailing list"
    select phone=vPhoneNum
        if info("empty")
            message "No phone match found."
            goto Choose
        endif
case vChoice=4
    window thisFYear+" mailing list"
    //confirm this works for all zips
    select MAd contains place and str(Zip) contains str(vzip)
        if info("empty")
            message "No address match found."
            goto Choose
        endif
case vChoice=5
    window thisFYear+" mailing list"
    findselect
    if info("dialogtrigger") contains "cancel"
    goto Choose
    else 
        stop
    endif

case vChoice=6
    window thisFYear+" mailing list"
    findselectdialog
    if info("dialogtrigger") contains "cancel"
    goto Choose
    else 
        stop
    endif

case vChoice=7
    window thisFYear+" mailing list"
        insertrecord
        Con=grabdata(thisFYear+"orders",Con) 
        Group=grabdata(thisFYear+"orders",Group) 
        MAd=grabdata(thisFYear+"orders",MAd) 
        City=grabdata(thisFYear+"orders",City) 
        St=grabdata(thisFYear+"orders",St)
        Zip=grabdata(thisFYear+"orders",Zip) 
        adc=lookup("newadc","Zip3",pattern(Zip,"#####")[1,3],"adc",0,0)
        SAd=grabdata(thisFYear+"orders",SAd) 
        Cit=grabdata(thisFYear+"orders",Cit) 
        Sta=grabdata(thisFYear+"orders",Sta) 
        Z=grabdata(thisFYear+"orders",Z) 
        phone=grabdata(thisFYear+"orders",Telephone) 
        email=grabdata(thisFYear+"orders", Email)
        adc=lookup("fcmadc","Zip3",pattern(Zip,"#####")[1,3],"adc",0,0)
       call "numberNeeded"
endcase


window thisFYear+" mailing list"

arrayselectedbuild chooseCustomerArray,¶,"",str(«C#»)+" "+?(Con≠"",Con+", ","")+?(Group≠"",Group+", ","")+MAd+" "+City+", "+St+" "+pattern(Zip,"#####")
        superchoicedialog chooseCustomerArray,chooseCustChoice, {
        captionstyle=bold
        caption="Please choose the appropriate customer or click other search to try something else.
        You can click cancel to look through the selection at any time"
        buttons=OK;OtherSearch:100;Cancel
        captionheight="2" 
        height="600" width="800"
        }
            if info("dialogtrigger") contains "cancel"
                stop
                    endif
            if info("dialogtrigger") contains "other"
                goto Choose
                    endif
            if info("dialogtrigger") contains "ok"
                find exportline() contains chooseCustChoice
                if info("found")=-1
                    thisCustomerLine=str(«C#»)+" "+Con+" "+Group+¶+MAd+" "+string_zip
                    YesNo "Is this is the customer you want?"+¶+thisCustomerLine
                    if clipboard() contains "Yes"
                        call "enter/e"
                        endif
                    endif
                endif

Message "Customer has been entered!"


