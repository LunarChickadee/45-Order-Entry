if «C#»≠0
stop 
endif
Code="I45o"
openfile "Customer#"
call "newnumber"
window "45 mailing list"
Field «C#»
Paste
SpareText2=str(«C#»)
If inqcode=""
Field inqcode
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