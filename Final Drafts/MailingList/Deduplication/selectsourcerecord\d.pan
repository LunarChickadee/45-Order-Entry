/*
if vSerialNum notcontains "2074269900"
message "Sorry, you can not use Coman+d (Deduplication) without approval from Ken or Lunar"
stop
endif
*/

if username notcontains "Kate"
message "Sorry, you can not use Coman+d (Deduplication) without approval from Ken or Lunar"
stop
endif


global vsourcecust, vMem,  vTaxEx, vResale
vsourcecust=«C#»
vMem=«Mem?»
 vTaxEx=TaxEx
 vResale=resale
message "Customer "+str(«C#»)+ " selected!"



/* //This was originally done with the panorama serial number, but it was a bit too finicky for folks who needed to also do orders
if vSerialNum notcontains info("serialnumber") 
message "Sorry, you can not use Coman+d without approval from Ken or Rachel"
stop
endif

global vsourcecust, vMem,  vTaxEx, vResale
vsourcecust=«C#»
vMem=«Mem?»
 vTaxEx=TaxEx
 vResale=resale
message "Customer "+str(«C#»)+ " selected!"
*/