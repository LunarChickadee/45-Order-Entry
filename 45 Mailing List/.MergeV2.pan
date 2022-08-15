if vSerialNum notcontains "2074269900" 
message "Sorry, you can not use CMD+Opt+a (DeDuplication) without approval."
stop
endif


global vtargetcust
global vS45, vS44, vS43, vS42, vS41, vS40, vS39, vS38, vS37, vS36, vS35, vS34, vS33, vS32, vS31, vS30, vS29, 
vS28, vS27, vS26, vS25, vS24, vS23, vS22, vS21, vS20, vS19, 
vBf45, vBf44, vBf43, vBf42, vBf41, vBf40, vBf39, vBf38, vBf37, vBf36, vBf35, vBf34, vBf33, vBf32, vBf31, vBf30, vBf29, vBf28, vBf27, vBf26, vBf25, 
vBf24, vBf23, vBf22, vBf21, vBf20, vBf19, 
vM45, vM44, vM43, vM42, vM41, vM40, vM39, vM38, vM37, vM36, vM35, vM34, vM33, vM32, vM31, vM30, 
vM29, vM28, vM27, vM26, vM25, vM24, vM23, vM22, vM21, vM20, vM19,
vOGS45, vOGS44, vOGS43, vOGS42, vOGS41, vOGS40, vOGS39, vOGS38, vOGS37, vOGS36, vOGS35, vOGS34, vOGS33, 
vOGS32, vOGS31, vOGS30, vOGS29, vOGS28, vOGS27, vOGS26, vOGS25, vOGS24, vOGS23, 
vOGS22, vOGS21, vOGS20, 
vT42, vT43, vT44, vT45, vT41, vT40, vT39, vT38, vT37, vT36, vT35, vT34, vT33, vT32, vT31, vT30, 
vT29, vT28, vT27, vT26, vT25, vT24, vT23, vT22, vT21, vT20, vT19,
vTaxName, vTIN, vConsent, vNotified, vEquity

///we should be able to shorten this with the SET command
//____________________________________NOtes____________
vtargetcust=«C#»

if «Mem?»=""
    «Mem?»=vMem
    ;stop
endif

if «TaxEx»=""
    «TaxEx»=vTaxEx
    ;stop
endif

if «resale»=""
    «resale»=vResale
    ;stop
endif



window "customer_history:customeractivity"
if «C#»≠vsourcecust
    find «C#»=vsourcecust
        if info("found")=0
            window thisFYear+" mailing list"
            
             "Nothing found!"
            Stop
        ;else
            ;Message "found source record"
        endif
endif

farcall (thisFYear+" mailing list"), .SetVariables
//**** This if clause may be an unnecessary diplication of the step above**//
if «C#»≠vtargetcust
    find «C#»=vtargetcust
        if info("found")=0
            message "target not found! Process stopped, nothing merged."
            Stop
        else
            ;Message "found target record" 
        endif
endif
//**************************//
if CChistory=""
    CChistory=str(vsourcecust)
        else
            CChistory=CChistory+", "+str(vsourcecust)
endif

if vTaxName≠""
    if taxname=""
    taxname=vTaxName
        else 
            taxname=vTaxName+", "+taxname
    endif
endif

if vTIN≠""
   if TIN=""
    TIN=vTIN
        else 
            TIN=vTIN+", "+TIN
    endif
endif

if vConsent≠""
   if Consent=""
    Consent=vConsent
        else 
            Consent=vConsent+", "+Consent
    endif
endif

if vNotified≠""
   if Notified=""
    Notified=vNotified
        else 
            Notified=vNotified+", "+Notified
    endif
endif

if vEquity≠0
   if Equity=0
    Equity=vEquity
    endif
endif

farcall (thisFYear+" mailing list"), .FillTargetFields

«45Total»=S45+Bf45+M45+T45
«44Total»=S44+Bf44+M44+T44
«43Total»=S43+Bf43+M43+T43
«42Total»=S42+Bf42+M42+T42
«41Total»=S41+Bf41+M41+T41
«40Total»=S40+Bf40+M40+OGS40+T40
«39Total»=S39+Bf39+M39+OGS39+T39
«38Total»=S38+Bf38+M38+OGS38+T38
«37Total»=S37+Bf37+M37+OGS37+T37
«36Total»=S36+Bf36+M36+OGS36+T36
«35Total»=S35+Bf35+M35+OGS35+T35
«34Total»=S34+Bf34+M34+OGS34+T34
«33Total»=S33+Bf33+M33+OGS33+T33
«32Total»=S32+Bf32+M32+OGS32+T32
«31Total»=S31+Bf31+M31+OGS31+T31
«30Total»=S30+Bf30+M30+OGS30+T30
«29Total»=S29+Bf29+M29+OGS29+T29
«28Total»=S28+Bf28+M28+OGS28+T28
«27Total»=S27+Bf27+M27+OGS27+T27
«26Total»=S26+Bf26+M26+OGS26+T26
«25Total»=S25+Bf25+M25+OGS25+T25
«24Total»=S24+Bf24+M24+OGS24+T24
«23Total»=S23+Bf23+M23+OGS23+T23
«22Total»=S22+Bf22+M22+OGS22+T22
«21Total»=S21+Bf21+M21+OGS21+T21
«20Total»=S20+Bf20+M20+OGS20+T20
«19Total»=S19+Bf19+M19+T19
;Message "Totals run"
window thisFYear+" mailing list"

find «C#» = vsourcecust
field «C#»
    copycell
YESNO "do you want to delete the customer number " + str(vsourcecust)+" "+Con+" from the mailinglist?"
    if clipboard()="Yes"
    field «C#»
    copycell
        deleterecord
        call .HistoryDelete
    endif
;vsourcecust i