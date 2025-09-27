!macro CustomCodePreInstall
	${If} ${FileExists} "$INSTDIR\App\Autoruns-Modern"
		Rename "$INSTDIR\App\Autoruns" "$INSTDIR\App\Autoruns-Legacy"
		Rename "$INSTDIR\App\Autoruns-Modern" "$INSTDIR\App\Autoruns"
	${EndIf}
!macroend

!macro CustomCodePostInstall
	Delete "$INSTDIR\App\Autoruns\Autoruns64a.dll"
	Delete "$INSTDIR\App\Autoruns\Autoruns64a.exe"
	Delete "$INSTDIR\App\Autoruns\autorunsc64a.exe"
	
	Delete "$INSTDIR\App\Autoruns-Legacy\Autoruns64a.dll"
	Delete "$INSTDIR\App\Autoruns-Legacy\Autoruns64a.exe"
	Delete "$INSTDIR\App\Autoruns-Legacy\autorunsc64a.exe"
!macroend
