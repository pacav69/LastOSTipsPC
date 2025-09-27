${SegmentFile}

${SegmentInit}
    ${If} ${IsWin2000}
	${OrIf} ${IsWinXP}
	${OrIf} ${IsWin2003}
	${OrIf} ${IsWinVista}
	${OrIf} ${IsWin2008}
	${OrIf} ${IsWin7}
	${OrIf} ${IsWin2008R2}
		${If} ${FileExists} "$EXEDIR\App\Autoruns-Legacy\*.*"
			Rename "$EXEDIR\App\Autoruns" "$EXEDIR\App\Autoruns-Modern"
			Rename "$EXEDIR\App\Autoruns-Legacy" "$EXEDIR\App\Autoruns"
		${EndIf}
    ${Else}
	    ${If} ${FileExists} "$EXEDIR\App\Autoruns-Modern\*.*"
			Rename "$EXEDIR\App\Autoruns" "$EXEDIR\App\Autoruns-Legacy"
			Rename "$EXEDIR\App\Autoruns-Modern" "$EXEDIR\App\Autoruns"
		${EndIf}
	
	${EndIf}
!macroend
