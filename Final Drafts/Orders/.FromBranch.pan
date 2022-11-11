//this came from next/1 and is simplified just to check what branch something is from for other things

global intOrder1, fromBranch, BranchNum

intOrder1=int(OrderNo)
fromBranch=""
BranchNum=0

case intOrder1 ≥ 700000
    fromBranch="Seeds"
    BranchNum=1
case intOrder1 ≥ 600000 and intOrder1 < 700000
    fromBranch="OGS;POE"
    BranchNum=2
case intOrder1 ≥ 500000 and intOrder1 < 600000
    fromBranch="OGS;Bulbs"
    BranchNum=3
case intOrder1 ≥ 400000 and intOrder1 < 500000
    fromBranch="Trees"
    BranchNum=4
case intOrder1 ≥ 300000 and intOrder1 <400000
    fromBranch="OGS"
    BranchNum=5
endcase
