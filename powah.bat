@ECHO OFF
title powah
CLS 
SET "thms= C:\Users\%username%\Documents\WindowsPowerShell\ds\allposhthemes.txt"
SET "pop= C:\Users\%username%\Documents\WindowsPowerShell\ds\popeye.txt"
SET "pop2= C:\Users\%username%\Documents\WindowsPowerShell\ds\popeye2.txt"
SET "pop2b= C:\Users\%username%\Documents\WindowsPowerShell\ds\popeye2b.txt"
SET "pop3= C:\Users\%username%\Documents\WindowsPowerShell\ds\popeye3.txt"
SET "pop3b= C:\Users\%username%\Documents\WindowsPowerShell\ds\popeye3b.txt"
SET "pop4= C:\Users\%username%\Documents\WindowsPowerShell\ds\popeye4.txt"
SET "pop4b= C:\Users\%username%\Documents\WindowsPowerShell\ds\popeye4b.txt"
SET "ds= C:\Users\%username%\Documents\WindowsPowerShell\ds"
SET "powahdir= C:\Users\%username%\Documents\WindowsPowerShell"
SET "prompt= C:\Users\%username%\Documents\WindowsPowerShell\ds\winhelper.txt"
SET "psprofile= C:\Users\%username%\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"

CLS

:MENU
cls
Type %pop%
SET INPUT=
SET /P INPUT= Choose An Option (Or Q To Quit):  
IF /I '%INPUT%'=='1' GOTO themebyname
IF /I '%INPUT%'=='2' GOTO themesonline
IF /I '%INPUT%'=='3' GOTO upthemes
IF /I '%INPUT%'=='4' GOTO uppowah
IF /I '%INPUT%'=='5' GOTO MENU2
IF /I '%INPUT%'=='6' GOTO newalias
IF /I '%INPUT%'=='7' GOTO winhelper
IF /I '%INPUT%'=='Q' GOTO Quit
CLS
GOTO MENU
:themebyname
CLS
Type %thms%
set theme=
set /p theme= Enter The Theme Name: 
IF /I '%theme%'=='glowsticks' GOTO exception
IF /I '%theme%'=='devious-diamonds' GOTO exception
GOTO usual
:usual
DEL C:\Users\%username%\Documents\WindowsPowerShell\ds\custom*
copy /y C:\Users\%username%\AppData\Local\Programs\oh-my-posh\themes\%theme%.omp.json C:\Users\%username%\Documents\WindowsPowerShell\ds\custom.omp.json
GOTO Reload
:exception
DEL C:\Users\%username%\Documents\WindowsPowerShell\ds\custom*
copy /y C:\Users\%username%\AppData\Local\Programs\oh-my-posh\themes\%theme%.omp.yaml C:\Users\%username%\Documents\WindowsPowerShell\ds\custom.omp.yaml
GOTO Reload
:themesonline
start https://ohmyposh.dev/docs/themes
GOTO Quit
:upthemes
SET "thmdir= C:\Users\%username%\AppData\Local\Programs\oh-my-posh\themes"
cd %TEMP%
IF EXIST %TEMP%\oh-my-posh (
    RMDIR /S /Q %TEMP%\oh-my-posh
)
git clone https://github.com/JanDeDobbeleer/oh-my-posh.git
xcopy /s /q /y %TEMP%\oh-my-posh\themes %thmdir%\ 
powershell -Command "Get-ChildItem -Path $HOME\AppData\Local\Programs\oh-my-posh\themes | Select-Object -ExpandProperty Name | Out-File $HOME\AppData\Local\Temp\pthemp.txt"
cls
GOTO MENU
:Reload
powershell -Command [void]"{. $PROFILE; Clear-Host}"
GOTO Quit
:uppowah
cls
cd %TEMP%
IF EXIST %TEMP%\powahds (
    RMDIR /S /Q %TEMP%\powahds
)
IF EXIST %TEMP%\powah (
    RMDIR /S /Q %TEMP%\powah
)
git clone https://github.com/nrdrch/powah.git %TEMP%\powah
git clone https://github.com/nrdrch/powahds.git %TEMP%\powahds
copy /y %TEMP%\powah\powah.bat %powahdir%\powah.bat
xcopy /s /q /y %TEMP%\powahds %powahdir%\ds\
GOTO MENU
:MENU2
CLS
type %pop2%
SET INPUT=
SET /P INPUT= Choose An Option (Or Q To Quit): 
IF /I '%INPUT%'=='1' GOTO newmodule
IF /I '%INPUT%'=='2' GOTO helpnm
IF /I '%INPUT%'=='0' GOTO MENU
IF /I '%INPUT%'=='Q' GOTO Quit
CLS
:newmodule
CLS
IF EXIST %TEMP%\modulebuilder.txt (
    DEL /q %TEMP%\modulebuilder.txt
)
IF EXIST %TEMP%\modulebuilder2.txt (
    DEL /q %TEMP%\modulebuilder2.txt
)
set /p alias= Name Your Custom Alias: 
ECHO What you type to Run   :%alias% >> %TEMP%\modulebuilder.txt
ECHO function Pop-PWH%alias% { >> %TEMP%\modulebuilder2.txt
ECHO     [CmdletBinding()] >> %TEMP%\modulebuilder2.txt
ECHO     param ( >> %TEMP%\modulebuilder2.txt
ECHO     )        >> %TEMP%\modulebuilder2.txt
set /p modulecode= Enter the Main Code you want to run: 
ECHO Code beeing executed   :%modulecode% >> %TEMP%\modulebuilder.txt
ECHO     %modulecode% >> %TEMP%\modulebuilder2.txt
echo } >> %TEMP%\modulebuilder2.txt
GOTO progr
cls
:progr
cls
type %TEMP%\modulebuilder.txt
type %pop3%
SET INPUT=
SET /P INPUT= Choose An Option (Or Q To Quit):
IF /I '%INPUT%'=='1' GOTO savemodule
IF /I '%INPUT%'=='0' GOTO MENU
IF /I '%INPUT%'=='Q' GOTO Quit
:savemodule
cls
IF NOT EXIST C:\Users\%username%\Documents\WindowsPowerShell\mods.psm1 (
    ECHO Import-Module "$HOME\Documents\WindowsPowerShell\mods.psm1" >> %psprofile%
)
ECHO New-Alias -Name %alias% -Value Pop-PWH%alias% >> %psprofile%
type %TEMP%\modulebuilder2.txt >> C:\Users\%username%\Documents\WindowsPowerShell\mods.psm1
GOTO Quit
:helpnm
cls
type %pop4%
SET /P INPUT= Understood? (Y): 
IF /I '%INPUT%'=='Y' GOTO MENU2
cls
:winhelper
cls

:MENU4
type %prompt%
SET INPUT=
SET /P INPUT= Choose An Option (Or Q To Quit): 
IF /I '%INPUT%'=='1' GOTO winactivation
IF /I '%INPUT%'=='2' GOTO tronscript
IF /I '%INPUT%'=='3' GOTO winfilecheck
IF /I '%INPUT%'=='4' GOTO windebloater
IF /I '%INPUT%'=='5' GOTO reclaimwin
IF /I '%INPUT%'=='6' GOTO edgerd
IF /I '%INPUT%'=='0' GOTO MENU
IF /I '%INPUT%'=='Q' GOTO Quit
cls
:winactivation
cls
powershell -C "iwr -useb https://massgrave.dev/get | iex"
cls
GOTO MENU4
:tronscript
cls
powershell -C "start https://github.com/bmrf/tron#use"
powershell -C "Powershell.exe -executionpolicy remotesigned -File $HOME\Documents\WindowsPowerShell\ds\installtron.ps1"
start C:\Users\%username%\Desktop\Tron.exe
GOTO MENU4
:winfilecheck
cls
powershell -C "sfc /scannow"
GOTO MENU4
:windebloater
cls
IF NOT EXIST C:\Users\%username%\Documents\winutil (
    powershell -C "cd $HOME\Documents; git clone https://github.com/ChrisTitusTech/winutil.git; cd winutil; Powershell.exe -executionpolicy remotesigned -File winutil.ps1"
) 
IF EXIST C:\Users\%username%\Documents\winutil (
    powershell -C "cd $HOME\Documents\winutil; Powershell.exe -executionpolicy remotesigned -File winutil.ps1"
)
GOTO MENU4
:reclaimwin
cls
Powershell -executionpolicy remotesigned -File %~dp0\ds\rcwin.ps1
:edgerd
cls
IF NOT EXIST "C:\Program Files\MSEdgeRedirect" ( 
    winget install --id=rcmaehl.MSEdgeRedirect -e 
)
IF EXIST "C:\Program Files\MSEdgeRedirect" (
    ECHO MSEdgeRedirect is already Installed
)
GOTO MENU4
:newalias
cls
Type %pop2b%
SET INPUT=
SET /P INPUT= Choose An Option (Or Q To Quit): 
IF /I '%INPUT%'=='1' GOTO mknewalias
IF /I '%INPUT%'=='2' GOTO hpnewalias
IF /I '%INPUT%'=='0' GOTO MENU
IF /I '%INPUT%'=='Q' GOTO Quit
:mknewalias
cls
SET nameofalias=
SET /P nameofalias= Name Of The Alias: 
SET originalcmd=
SET /P originalcmd= Command The Alias The Should Replace: 
cls
GOTO confirmalias
:hpnewalias
cls
Type %pop4b%
SET /P INPUT= Understood? (Y): 
IF /I '%INPUT%'=='Y' GOTO newalias
cls
:confirmalias
CLS
ECHO New-Alias -Name %nameofalias% -Value %originalcmd%
Type %pop3b%
SET INPUT=
SET /P INPUT= Choose An Option (Or Q To Quit): 
IF /I '%INPUT%'=='1' GOTO svalias
IF /I '%INPUT%'=='0' GOTO MENU
IF /I '%INPUT%'=='Q' GOTO Quit
cls
:svalias
cls
ECHO New-Alias -Name %nameofalias% -Value %originalcmd% >> %psprofile%
GOTO Quit
:Quit
cls
ECHO If Your Theme DID NOT Load, Manually Reload Your PowerShellProfile. (e.g.: . $PROFILE)
ECHO If You Created A New Module, Restart PowerShell.
