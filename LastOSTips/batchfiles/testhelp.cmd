@REM https://stackoverflow.com/questions/70320947/how-do-i-create-help-command-for-custom-bat-files
@Echo off & SETLOCAL
=========================================================================
 Rem -- Arg capture method is a modified version of Dave Benhams method:
 Rem -- https://www.dostips.com/forum/viewtopic.php?t=4288#p23980
SETLOCAL EnableDelayedExpansion
 1>"%~f0:Params.dat" <"%~f0:Params.dat" (
  SETLOCAL DisableExtensions
  Set prompt=#
  Echo on
  For %%a in (%%a) do rem . %*.
  Echo off
  ENDLOCAL
  Set /p "Args="
  Set /p "Args="
  Set "Args=!Args:~7,-2!"
  @Rem duplicate Args for the purpose of counting doublequotes [destructive].
  Set "DQcount=!Args!"
 ) || (
  Echo(%~nx0 requires an NTFS drive system to function as intended.
  CMD /C Exit -1073741510
 ) || Goto:Eof

 If Not defined Args Goto:NoArgs
REM substitute doublequotes in Args clone 'DQcount'; count substring in string;
REM assess if count is even; If false "||": Remove doublequotes from string. If true "&&" and if entire
REM arg line is doublequoted, remove outer quotes.
 Set Div="is=#", "1/(is<<9)"
 Set "{DQ}=0"
 Set ^"DQcount=!DQcount:"={DQ}!"
 2> nul Set "null=%DQcount:{DQ}=" & Set /A {DQ}+=1& set "null=%"

 Set /A !Div:#={DQ} %% 2! 2> nul && Set ^"Args=!Args:"=!" || If [^%Args:~0,1%^%Args:~-1%] == [""] Set "Args=!Args:~1,-1!")

 For /f Delims^= %%G in ("!Args!")Do Endlocal & Set "Args=%%G" 2> nul
:NoArgs

=====================================================================

Rem help query assessment
 (
  Set Args | %SystemRoot%\System32\Findstr.exe /bli "Args=\/? Args=-? Args=Help?" > nul && (
   Rem Args value has leading /? -? or help?
   If not "%Args:*?=%"=="" (
    Rem Args value contains leading /? -? or help? with additional Parameter
    Call:%Args:*? =%_Syntax && Goto:Eof || (
     Rem quit after Call to Syntax info if valid Parameter; else notify invalid and show valid syntax queries.
     Echo(Invalid query: "%Args:*? =%" : Does not Match a valid Help Query:
    )
   )
   Rem show valid syntax queries.
   For /F "Tokens=1 Delims=:_" %%G in ('%SystemRoot%\System32\Findstr.exe /R "^:.*_Syntax" "%~f0"') Do Echo(%~nx0 /? %%G
   ENDLOCAL & Exit /b 0
  )
 ) 2> nul

 Set Args

 Goto:Eof

Rem Demo syntax labels

:usage help x16debug -prg <prg name> load program_Syntax
Echo %~0 help info
Exit /b 0


:Example_Syntax
Echo %~0 help info
Exit /b 0