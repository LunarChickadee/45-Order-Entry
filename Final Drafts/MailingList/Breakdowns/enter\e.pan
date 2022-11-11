
Num=«C#»
If Num=0
    call "numberNeeded"
                endif


///this figures out if it's an internet order and then stops if Con has any info
        ///WHY????
window (thisFYear+"orders")
    «C#»=Num
    «C#Text»=str(Num)

    //originally checked if it was an internet order and had an empty name, then stopped

    call ".IsInternetOrder"

    call ".customerfill"