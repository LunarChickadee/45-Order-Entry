if S+T+Bf=0 and RedFlag=""
    yesno "- Customer has no catalogs requested"+¶+"- Customer has no RedFlag(s)"+¶+¶+"Autofill catalog requests by Zip/Order?"
    if clipboard()="Yes"
        Case Zip < 19000  And Zip>1000
            S=1
            T=1
            Bf=1
        Case (Zip > 43000 And Zip < 46000) 
        or (Zip > 48000 And Zip < 50000) 
        or (Zip > 53000 And Zip < 57000) 
        or Zip>97000
            S=1
            T=1
            Bf=0
        DefaultCase
            S=1
            T=0
            Bf=0
        endcase     
    endif 
else 
    case RedFlag≠""
        message "Customer has a RedFlag."+¶+"Catalog requests will be set to zero"
            S=0
            T=0
            Bf=0
    defaultcase 
    noyes "Update Catalog Requests?"
    +¶+
    "Currently, Customer is set to receive"
    +¶+
    "Seeds:"+str(S)+" Bulbs:"+str(Bf)+" Trees:"+str(T)
    
    //make this smart enough to only say whaty they're getting?
        if clipboard()="Yes"

        ///this loop is from .UpdateCats
            loop
                rundialog
                “Form="CatalogRequest"
                    Movable=yes
                    okbutton=Update
                    Menus=normal
                    WindowTitle={CatalogRequest}
                    Height=264 Width=190
                    AutoEdit="Text Editor"
                    Variable:"val(«dS»)=val(«S»)"
                    Variable:"val(«dBf»)=val(«Bf»)"
                    Variable:"val(«dT»)=val(«T»)"”
                stoploopif info("trigger")="Dialog.Close"
            while forever 
              message "Customer is now set to receive"
                        +¶+
                        "Seeds:"+str(S)+" Bulbs:"+str(Bf)+" Trees:"+str(T)
        endif
    endcase
endif 


