local vChoice,vFirstInitial,vLastName,vExtracted,vExtracted2,vFirstIntLastName,vCustNum

waswindow=info("windowname")

if info("formname")="treesinput" and (OrderNo<410000 or OrderNo>420000)
    call ".pool"
endif

/*This fills the variables for the search*/
EntryDate=today()
ono=OrderNo
vzip=Zip
vd=«C#»  // #Davids old code, leaving in case there are dependencies
rayj=Con[1," "][1,-2]+" "+Con["- ",-1][2,-1] //gets first name and last name
place=MAd["0-9",-1][1,-1]
vExtracted=""
vExtracted=extract(rayj," ",1)
vFirstInitial=vExtracted[1,1]
vExtracted2=""
vLastName=extract(rayj," ",2)
vCustNum=«C#»
vEmail=Email
vPhoneNum=Telephone
vChoice=0

;selectall

/*

supergettext vChoice,“caption="Please Choose How You'd like to Search:
1=Email 2=Phone Number 3=Mailing Address 4=Add New Customer 
Use the Command + Tilde '~' key to run this again!" captionheight=3”
*/

global ChoiceList, Choice, Options
Choice=""

ChoiceList="By Email
Phone Number
Mailing Address
My Own Search
Add New Customer Instead"
superchoicedialog ChoiceList, Choice, {caption="How Would You Like to Search?" captionstyle=bold}
message Choice

supergettext vChoice,“caption="Please Choose How You'd like to Search:
1=Email 2=Phone Number 3=Mailing Address 4=Add New Customer 
Use the Command + Tilde '~' key to run this again!" captionheight=3”


//Give user the option to search 
GetText "Search By: 1-Email, 2-Ph#, 3-MAd, 4-NewCustomer",vChoice

if vChoice="1"
    window newyear+" mailing list"
    select email=vEmail
    if info("selected")=info("records")
        message "No email match found."+¶+"Press CMD-R to search by something else."
    else 
        bigmessage "Select customer in mailing list and press cmd+option+r to enter"+¶+"If the customer doesnt appear here, press CMD-R to search by something else." 
    endif
endif


if vChoice="2"
    window newyear+" mailing list"
    select phone=vPhoneNum
    if info("selected")=info("records")
        message "No phone match found."+¶+"Press CMD-r to search by something else."
    else 
        message "Select customer in mailing list and press cmd+option+r."+¶+"If the customer doesnt appear here, press CMD-R to search by something else." 
    endif
endif

if vChoice="3"
    window newyear+" mailing list"
    select MAd=place and Zip=vzip
        if info("selected")=info("records")
        message "No address match found."+¶+"Press CMD-r to search by something else."
    else 
        message "Select customer in mailing list and press cmd+option+r."+¶+"If the customer doesnt appear here, press CMD-R to search by something else." 
    endif
endif

if vChoice="4"
    window newyear+" mailing list"
        insertrecord
        Con=grabdata(newyear+"orders",Con) 
        Group=grabdata(newyear+"orders",Group) 
        MAd=grabdata(newyear+"orders",MAd) 
        City=grabdata(newyear+"orders",City) 
        St=grabdata(newyear+"orders",St)
        Zip=grabdata(newyear+"orders",Zip) 
        adc=lookup("newadc","Zip3",pattern(Zip,"#####")[1,3],"adc",0,0)
        SAd=grabdata(newyear+"orders",SAd) 
        Cit=grabdata(newyear+"orders",Cit) 
        Sta=grabdata(newyear+"orders",Sta) 
        Z=grabdata(newyear+"orders",Z) 
        phone=grabdata(newyear+"orders",Telephone) 
        email=grabdata(newyear+"orders", Email)
        adc=lookup("fcmadc","Zip3",pattern(Zip,"#####")[1,3],"adc",0,0)
        if ono>300000 and ono<400000
            call "ogsity/ø"
        endif
        if ono>500000 and ono<600000
            call "bulbous/∫"
        endif
        if ono>400000 and ono<500000
            call "treed/†"
        endif
        if ono>700000 and ono < 1000000
            call "seedy/ß"
        endif
        if ono>600000 and ono<700000
            call "moosed/µ"
        endif
endif




