global selectedAddressArray, chosenAddress, chosenAddress1, FindWindow, WinNumber


waswindow=info("windowname")

;call ".dropship"
if info("formname")="treesinput" and (OrderNo<410000 or OrderNo>420000)
    call ".pool"
endif
EntryDate=today()
ono=OrderNo
vzip=Zip
vd=«C#»
conArray=Con[1," "][1,-2]+" "+Con["- ",-1][2,-1]
place=MAd["0-9",-1][1,2]
field «1stPayment»
;editcell

WinNumber=arraysearch(info("windows"), thisFYear+" mailing list", 1,¶)
if WinNumber=0
    openfile newyear+" mailing list"
endif
window newyear+" mailing list"
if vd>0
    find «C#»=vd
    if info("found")=-1
        YesNo "Enter this one?"
        if clipboard() contains "Yes"
            call "enter/e"
            stop
        endif
    endif

    if info("found")=0
        goto newzip
    endif
    window newyear+" mailing list"
endif

//*********************************************************//
//Searches by Zip
newzip:

find Zip=vzip

//Zip is in Mailing List
if info("found")=-1
    if place ≠ ""
        //check against address and zip
        find MAd contains place And Zip=vzip
            //found something that matched partially?
            if info("found")=-1
            //loop through those until the user says yes
                call newentry:
                    /*
                    OG:
                    loops through addresses and tries to find the custopmer

                    V2:
                    tried to add more data

                    V3:
                    currently called NewSearch
                    */
                        //then add a new record and fill it
                        goto addmail
                        /*
                        adds a record and fills it
                        then calls filler
                        */

            //didn't find em?
            if info("found")=0
                //try again by zip and name
                find Zip=vzip and Con contains extract(conArray," ",2)
                    //found something?
                    if info("found")=-1
                        //loop through those until the user says yes
                        goto newentry
                    endif
                    //don't find em still? 
                    call addmail:
                        /*
                        adds a record and fills it
                        then calls filler
                        */
            endif
                
            endif
    endif
    endif


//Zip that's not in Mailaing List
if info("found")=0
    find Con contains extract(conArray," ",1)and Con contains extract(conArray," ",2)
    if info("Found")=-1
        goto newentry
        /*
            OG:
            loops through addresses and tries to find the custopmer

            V2:
            tried to add more data to the search

            V3:
            currently called NewSearch
            */
    else
        call addmail:
        /*
        adds a record and fills it
        then calls filler
        */
    endif
endif
