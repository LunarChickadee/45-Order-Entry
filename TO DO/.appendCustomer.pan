global appendChoice

appendChoice="default"
appendChoice=str(parameter(1))
    if error
    appendChoice=appendChoice
    endif

////____debug________
;displaydata appendChoice
//__________________

case appendChoice contains "member"
    window "members"
    lastrecord
    insertbelow
    «C#»=grabdata("45 mailing list", «C#»)
    Con=grabdata("45 mailing list", Con)
    Group=grabdata("45 mailing list", Group)
    MAd=grabdata("45 mailing list", MAd)
    City=grabdata("45 mailing list", City)
    St=grabdata("45 mailing list", St)
    Zip=grabdata("45 mailing list", Zip)
    SAd=grabdata("45 mailing list", SAd)
    Cit=grabdata("45 mailing list", Cit)
    Sta=grabdata("45 mailing list", Sta)
    Z=grabdata("45 mailing list", Z)
    phone=grabdata("45 mailing list", phone)
    email=grabdata("45 mailing list", email)
    inqcode=grabdata("45 mailing list", inqcode)
    «Mem?»=grabdata("45 mailing list", «Mem?»)
    windowtoback "members"
    window thisFYear+" mailing list"

case appendChoice contains ""
endcase