;message "1"+tabarray(nthline(info("procedurestack"),1),1)

local proceduresCalled,lineCount,proceduresPlainText
proceduresCalled=""
proceduresPlainText=""
proceduresCalled=arraystrip(info("procedurestack"),¶)
lineCount=arraysize(proceduresCalled,¶)
message lineCount

displaydata proceduresCalled

proceduresPlainText="Procedures called: "+¶+arraycolumn(proceduresCalled,1,¶,¬)+¶+"From Files: "+¶+arraycolumn(proceduresCalled,2,¶,¬)
;arrayfilter proceduresCalled,proceduresPlainText,¶,"Procedures called: "+¶+arraycolumn(proceduresCalled,1,¶,¬)+¶+" From Files: "+¶+arraycolumn(proceduresCalled,2,¶,¬)
;arrayfilter proceduresCalled,proceduresPlainText,¶,array(proceduresCalled,1,¶)

;arraydeduplicate proceduresPlainText,proceduresPlainText,
displaydata proceduresPlainText


;message "2"+callingprocedure()


