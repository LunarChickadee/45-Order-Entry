DedupOn=-1

global DedupList,SortThis, con_email_dups,Group_Dups,Phone_Dups,Con_Email_Group_Phone

define con_email_dups,""
define Group_Dups,""
define Phone_Dups,""
define Con_Email_Group_Phone,""

DedupList="Find Same Con&Email [default setup]
Find Same Group Name 
Find Same Phone Number and Con
Find Same Con,Email, Group, and Phone"


superchoicedialog DedupList,SortThis,
{caption="Please choose how to sort for duplicates. 
Please choose NoneOfTheAbove unless you see your name here." captionheight=2 title="User Name Choice"}


Case SortThis contains "Con&Email"
selectall
Field Con
    sortup
    field email
    sortupwithin
selectduplicates Con+email
selectwithin email ≠ ""
arrayselectedbuild con_email_dups,¶,"",str(«C#»)+¬+Con
lastrecord


case SortThis contains "Group Name"
selectall
Field Group
    sortup
    field Con
    sortupwithin
selectduplicates Group
arrayselectedbuild Group_Dups,¶,"",str(«C#»)+¬+Con
lastrecord

case SortThis contains "Phone Number"
selectall 
Field phone
    sortup
    field Con
    sortupwithin
selectduplicates phone+Con
arrayselectedbuild Phone_Dups,¶,"",str(«C#»)+¬+Con
lastrecord

case SortThis contains "Con,Email,Group"
selectall 
Field Con
    sortup
    field phone
    sortupwithin
    field email
    sortupwithin
    field Group
    sortupwithin
selectduplicates Con+phone+email+«Group»
arrayselectedbuild Con_Email_Group_Phone,¶,"",str(«C#»)+¬+Con
Field «C#»
lastrecord
endcase






