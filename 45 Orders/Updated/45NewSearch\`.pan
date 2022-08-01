global vChoice,vFirstInitial,vLastName,vExtracted,vExtracted2,vFirstIntLastName,vCustNum, EntryDate, ono, vzip, vd, rayj,place,vExtrated, vFirstInitial, vExtracted2, vLastName,vCustNum,vEmail,vPhoneNum,vChoice

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

global ChoiceList, Choice, Options, EmailList, Choice2
Choice=""

ChoiceList="By Email
Phone Number
Mailing Address
My Own Search
Add New Customer Instead"
superchoicedialog ChoiceList, Choice, {caption="How Would You Like to Search?" captionstyle=bold}
message Choice

vChoice=arraysearch(ChoiceList, Choice, 1, ¶)

if vChoice=1
    window newyear+" mailing list"
    select email=vEmail
    if info("selected")=info("records")
        message "No email match found."
        call "NewSearch/`"
    else 
       
    endif
endif


if vChoice=2
    window newyear+" mailing list"
    select phone=vPhoneNum
    if info("selected")=info("records")
        message "No phone match found."
        call "NewSearch/`"
    else 
        message "Select customer in mailing list and press cmd+option+r."+¶+"If the customer doesnt appear here, press CMD-R to search by something else." 
    endif
endif

if vChoice=3
    window newyear+" mailing list"
    select MAd=place and Zip=vzip
        if info("selected")=info("records")
        message "No address match found."
        call "NewSearch/`"
    else 
        select MAd contains place And Zip=vzip
        selectedAddressArray=""
        arrayselectedbuild selectedAddressArray, ¶,"",?(«C#» >0 ,str(«C#»), "NoNumberYet")+¬+«Con»+¬+«MAd»+¬+«City»+¬+«St»
        superchoicedialog selectedAddressArray, chosenAddress, 
            {title="Choose the Correct Customer/Address" caption="Click -Other Search- to Search by something else" buttons="ok;other search;cancel"}

        if info("dialogtrigger") contains "ok"
            call "enter/e"
        endif
        if info("dialogtrigger") contains "search"
            call NewSearch/`
        endif
    endif
endif

if vChoice=4
    findselectdialog
endif

if vChoice=5
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




