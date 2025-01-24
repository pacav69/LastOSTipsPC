

https://stackoverflow.com/questions/70320947/how-do-i-create-help-command-for-custom-bat-files

I want user to try "help" command, so that they get the help on syntax for using the commands as shown below

help converttoupper
something like this

# help converttoupper
For more information on a specific command, type HELP command-name
CONVERTTOUPPER This converts the text to upper case
Update

I am fine even if I get something as shown below. I do not want to overwrite any windows command.

helpme converttoupper

  or

  helpme connectvpn
I have many BAT files, and wish to display respective helps when each executed.

enter image description here

batch-file

You can create a "fake" function. Let's call this define.cmd and place it in %systemroot%\system32

We add the code:

@echo off
for /f "tokens=1,*delims=? " %%i in ('type "%~1" ^|findstr ":?"') do echo %%j
Then in all your batch files you want people to read the help for, add the help lines by starting them off with a :? using your convertoupper.cmd file as example:

@echo off & set upper=
if "%~1" == "" echo incorrect usage & call define.cmd "%0"
if "%~1" == "/?" call define.cmd "%0"

for /f "skip=2 delims=" %%I in ('tree "\%~1"') do if not defined upper set "upper=%%~I"
set "upper=%upper:~3%"
echo %upper%
goto :eof
:? # help converttoupper
:? "define %0" or "%0 /?" will display this help content
:? For more information on a specific command, type HELP command-name
:? CONVERTTOUPPER This converts the text to upper case
Now you can run define converttoupper or converttoupper /?. If you run converttoupper without any arguments, it will also display the same help.

I am getting below error - incorrect usage 'define.cmd' is not recognized as an internal or external command, operable program or batch file. – 
kudlatiger
 CommentedDec 12, 2021 at 15:17 
1
Yes, save it as helpme instead. You can put it anywhere else if you want to not use System32, but then simply define that path in your %path% – 
user7818749
 CommentedDec 12, 2021 at 15:21
1
it will, if you standardize your batch files with the :? and have helpme in the path. – 
user7818749
 CommentedDec 12, 2021 at 15:35
1
It's fine. Answer was posted before closure. – 
user7818749
 CommentedDec 13, 2021 at 16:10
1
on those, just remove the first line if "%~1" == "" echo incorrect usage & call define.cmd "%0" – 

elow is an example of safely handling arg capture and help enqueries.

After arguments are safely Captured, Findstr is used to test the content for valid help switches:

Set Args | %SystemRoot%\System32\Findstr.exe /bli "Args=\/? Args=-? Args=Help?" > nul && (Rem commands)

Set Args : allows the argument string to be piped to findstr without any risk of failure due to poison characters.
/bli : findstr sawitches : match literal string at beginning of line ignoring case.
"Args=\/? Args=-? Args=Help?" : Space delimited list of strings to match; treated as match string a or b or c
> nul : Suppress the output of any match
&& : Conditional operator; 'On command success'
Note: Terminating each help switch with ? allows use of substring modification to remove the leading switch and space and directly Call a label prefixed with the query keyword

###########################

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

:Demo_Syntax
Echo %~0 help info
Exit /b 0


:Example_Syntax
Echo %~0 help info
Exit /b 0

###########################

