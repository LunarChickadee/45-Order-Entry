global n, raya, rayb, rayc, rayd, raye, rayf, rayg, rayh, rayi, rayj, waswindow,
Com, Cost, Disc, VDisc, ODisc, stax,item, size,ono, vfax, state, sub, vzip,
vd, adj, tax, f, gr, di, da,  three, secno, alt, oono, nu, oldtot, newtot, aray, taxable,
mailaddress, mailcopies, mailheader, messageBody, newyear, newpfile, rollingdisc,ID, taxable, vEmail,vPhoneNum
expressionstacksize 75000000
ID=0
ono=0
oono=0
nu=0
n=1
raya=¶
rayb=""
rayc=""
rayd=""
raye=""
rayf=""
rayg=""
rayh=""
rayi=0
rayj=""
vEmail=0
vPhoneNum=0
mailaddress=""
mailcopies=""
mailheader=""
messageBody=""
newyear="44"
newpfile=?(today()<date("12/1/20"),"42","43")

case folderpath(dbinfo("folder","")) contains "/ogs"
    Select (OrderNo >= 300000 and OrderNo < 400000)
case folderpath(dbinfo("folder","")) contains "/seeds"
    Select (OrderNo >= 700000 and OrderNo < 1000000)
case folderpath(dbinfo("folder","")) contains "/bulbs"
    Select (OrderNo >= 500000 and OrderNo < 600000)
case folderpath(dbinfo("folder","")) contains "/trees"
    Select (OrderNo >= 400000 and OrderNo < 500000)
case folderpath(dbinfo("folder","")) contains "/mt"
    Select (OrderNo >= 600000 and OrderNo < 700000)    
endcase

field OrderNo
sortup