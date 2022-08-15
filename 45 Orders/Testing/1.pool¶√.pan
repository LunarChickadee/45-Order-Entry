local p1,p2,p3, p4,p5,p6,p7,p8,p9,p14,p28
p1="AL,AR,AZ,CA,FL,GA,HI,LA,MS,NC,SC,TN,TX"
p2="DC,DE,MD,MO,OK,VA,KY"
p3="IL,IN,NJ,NM,WV"
p4="OH,IA"
p5="KS,ND,NE,NV,OR,SD,WA"
p6="PA"
p7="CT,RI"
p8="MI"
p9="CO,ID,MT,UT,WY"
p14="WI,MN"
p28="AK"

if ShipCode="T"
Pool=90
else
if ShipCode="P"
    Pool=90

else
if «Notes2» contains "group order" or «1SpareText» contains "G"
if Sta≠"VT" and Sta≠"NH" and Sta≠"ME"
Pool=40
endif
if Sta="VT" or Sta="NH" or Sta="ME"
Pool=41
endif

else

// Southern NY
    Case Z>10000 and Z<12800
        Pool=10     
        
//Eastern MA
    Case Z>02000 and Z<02800
        Pool=11

//Central MA        
    Case Z>01400 and Z<02000
        Pool=12
        
//Western MA
    Case Z>01000 and Z<01400
        Pool=13

//Central/Southern VT
    Case Z>04999 and Z<05400
        Pool=15
        
//Northern NY
    Case Z>12799 and Z<15000
        Pool=16
        
//Southern NH
    Case Z>02999 and Z<03500
        Pool=17
        
        
//Central/Southern NH, Southern ME    
    Case (Z>03599 and Z<03898)
    or (Z>03899 and Z<04020)
        Pool=18
        
//Southern ME
    Case Z>04019 and Z<04100
        Pool=19
        
//Southern/Western ME
    Case Z>04099 and Z<04300
        Pool=20
        
//Midcoast ME
    Case (Z>04299 and Z<04400)
    or (Z>04499 and Z<04600)
        Pool=21
        
//Downeast ME
    Case Z>04599 and Z<04700
        Pool=22
        
//Central/Midcoast ME
    Case Z>04799 and Z≤04930
        Pool=23
        
//North/Central VT
    Case Z>05399 and Z<06000
        Pool=24
     
        
//Central/Western ME
    Case Z>04929 and Z<05000
        Pool=25
        
//Northern ME
    Case Z>04399 and Z<04500
        Pool=26
        
//Far Northern ME, Northern NH
    Case (Z>04699 and Z<04800)
    or (Z>03499 and Z<03600)
       Pool=27
       
       
Case arraycontains(p1,Sta,",")=-1
Pool=1
Case arraycontains(p2,Sta,",")=-1
Pool=2
Case arraycontains(p3,Sta,",")=-1
Pool=3
Case arraycontains(p4,Sta,",")=-1
Pool=4
Case arraycontains(p5,Sta,",")=-1
Pool=5
Case arraycontains(p6,Sta,",")=-1
Pool=6
Case arraycontains(p7,Sta,",")=-1
Pool=7
Case arraycontains(p8,Sta,",")=-1
Pool=8
Case arraycontains(p9,Sta,",")=-1
Pool=9
Case arraycontains(p14,Sta,",")=-1
Pool=14
Case arraycontains(p28,Sta,",")=-1
Pool=28
case ShipCode=D
Pool=0

        
    DefaultCase
        GetScrap "This zip code has no pool. Please assign."
        Pool=val(clipboard())
    EndCase
endif
endif
endif