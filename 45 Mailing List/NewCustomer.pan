

//This Function should not run if they have a customer Number already
if «C#»≠0
    stop 
endif

case fromBranch contains "Seeds"
Code = "I45s"
case fromBranch contains "OGS"
Code = "I45o"
case fromBranch contains "Trees"
Code = "I45t"


case intOrder1 ≥ 700000
    openform "seedsinput"
    fromBranch="Seeds"
case intOrder1 ≥ 600000 and intOrder1 < 700000
    openform "mtinput"
    fromBranch="OGS"
case intOrder1 ≥ 500000 and intOrder1 < 600000
    openform "bulbsinput"
    fromBranch="OGS"
case intOrder1 ≥ 400000 and intOrder1 < 500000
    openform "treesinput"
    fromBranch="Trees"
case intOrder1 ≥ 300000 and intOrder1 <400000
    openform "ogsinput"
    fromBranch="OGS"
endcase




openfile "Customer#"
call "newnumber"
window "45 mailing list"
Field «C#»
Paste
SpareText2=str(«C#»)
If inqcode=""
Field inqcode
inqcode=?(inqcode contains "17", inqcode[3,-1], inqcode)
EditCell
field «C#»
EndIf
if S=0
call "filler/¬"
endif
window "customer_history:secret"
opensheet
insertbelow
«C#»=grabdata("45 mailing list", «C#»)
Group=grabdata("45 mailing list", Group)
Con=grabdata("45 mailing list", Con)
MAd=grabdata("45 mailing list", MAd)
City=grabdata("45 mailing list", City)
St=grabdata("45 mailing list", St)
Zip=grabdata("45 mailing list", Zip)
Email=grabdata("45 mailing list", email)
SpareText2=grabdata("45 mailing list", SpareText2)
;CloseWindow
window "45 mailing list"
Call "enter/e"