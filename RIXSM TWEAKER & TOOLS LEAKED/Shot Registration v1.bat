:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------
@echo off
title RISXN SHOT REGISTRATION V1
::Disable UAC
Reg.exe ADD "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "0" /f > nul

:: Enable ANSI Escape Sequences
Reg.exe add "HKCU\CONSOLE" /v "VirtualTerminalLevel" /t REG_DWORD /d "1" /f  > nul

::Enable Delayed Expansion
setlocal EnableDelayedExpansion > nul
cls 

::Enable Restore points 
Reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsNT\CurrentVersion\SystemRestore" /v "RPSessionInterval" /f  >nul 2>&1
Reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsNT\CurrentVersion\SystemRestore" /v "DisableConfig" /f >nul 2>&1
Reg.exe add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d 0 /f  >nul 2>&1
powershell -ExecutionPolicy Unrestricted -NoProfile Enable-ComputerRestore -Drive 'C:\'>nul 2>&1
cls 

:: Creating Restore Point
echo Creating Restore Point


cls
set w=[97m
set p=[95m
set b=[96m

chcp 65001 >nul 2>&1
cls

goto menu 


:Menu
cls
echo.
echo.
echo.
echo.
echo.       %f%%w%                  ██████╗ ██╗███████╗██╗  ██╗███╗   ██╗    ███████╗██╗  ██╗ ██████╗ ████████╗    ██████╗ ███████╗ ██████╗ ██╗███████╗████████╗██████╗  █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
echo.       %f%%w%                  ██╔══██╗██║██╔════╝╚██╗██╔╝████╗  ██║    ██╔════╝██║  ██║██╔═══██╗╚══██╔══╝    ██╔══██╗██╔════╝██╔════╝ ██║██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
echo.       %f%%w%                  ██████╔╝██║███████╗ ╚███╔╝ ██╔██╗ ██║    ███████╗███████║██║   ██║   ██║       ██████╔╝█████╗  ██║  ███╗██║███████╗   ██║   ██████╔╝███████║   ██║   ██║██║   ██║██╔██╗ ██║
echo.       %f%%w%                  ██╔══██╗██║╚════██║ ██╔██╗ ██║╚██╗██║    ╚════██║██╔══██║██║   ██║   ██║       ██╔══██╗██╔══╝  ██║   ██║██║╚════██║   ██║   ██╔══██╗██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
echo.       %f%%w%                  ██║  ██║██║███████║██╔╝ ██╗██║ ╚████║    ███████║██║  ██║╚██████╔╝   ██║       ██║  ██║███████╗╚██████╔╝██║███████║   ██║   ██║  ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
echo.       %f%%w%                  ╚═╝  ╚═╝╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝    ╚══════╝╚═╝  ╚═╝ ╚═════╝    ╚═╝       ╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
                                                                                                       
echo.       %f%%w%
echo.       %f%%w% -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
echo.       %f%%w%
echo.       %f%%w%
echo.       %f%%w%                                                                                                                  %f%
echo.       %f%%w%                                                                                                                  %f%
echo.       %f%%f%
echo.       %f%%w%                                                                                                                  %f%
echo.       %f%%w%                      %f%[1]%w% Activate Shot Registration Pack                  %f%[2]%w% Disable Shot Registration                               %f%        
echo.       %f%%w%                                                                                                                  %f%
echo.       %f%%w%                                                                                                                  %f%
echo.       %f%%w%                                                    %f%[3]%w% Discord                                                     %f%    
echo.       %f%%w%                                                                                                                  %f%


set /p input=:
if /i %input% == 1 goto a
if /i %input% == 2 goto b
if /i %input% == 3 start https://discord.gg/Risxn

) ELSE (
echo Invalid Input & goto menu
:MisspellRedirect
cls
echo WRONG SELECTION
timeout 2 
goto RedirectMenu

:RedirectMenu
cls
goto :menu

:a 
cls 
echo. IF YOU GET AN ERROR IT IS FINE I HAVE IT SET UP FOR UP TO 5 DRIVES AND IF YOU DON'T HAVE 5 IT GIVES ERROR (IGNORE)
echo.
echo [-] Restore Point
echo.

Reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsNT\CurrentVersion\SystemRestore" /v "RPSessionInterval" /f  > nul
cls
Reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsNT\CurrentVersion\SystemRestore" /v "DisableConfig" /f > nul
cls
Reg.exe  add "HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d 0 /f  > nul
cls
powershell -ExecutionPolicy Unrestricted -NoProfile Enable-ComputerRestore -Drive 'C:\', 'D:\', 'E:\', 'F:\', 'G:\'  > nul
cls
powershell -ExecutionPolicy Unrestricted -NoProfile Checkpoint-Computer -Description 'Risxn Restore Point'  > nul
REM ;Reinforce Network Priorities
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d "5" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d "6" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d "7" /f
taskkill F FI IMAGENAME eq SystemSettings.exe
@echo
net stop wuauserv
net stop UsoSvc
@echo
reg add HKLMSOFTWAREPoliciesMicrosoftWindowsWindowsUpdate v DoNotConnectToWindowsUpdateInternetLocations t REG_DWORD d 1 f
@echo
reg add HKLMSOFTWAREPoliciesMicrosoftWindowsWindowsUpdate v SetDisableUXWUAccess t REG_DWORD d 1 f
reg add HKLMSOFTWAREPoliciesMicrosoftWindowsWindowsUpdateAU v NoAutoUpdate t REG_DWORD d 1 f
reg add HKLMSOFTWAREPoliciesMicrosoftWindowsWindowsUpdate v ExcludeWUDriversInQualityUpdate t REG_DWORD d 1 f
@echo
gpupdate force
rd s q CWindowsSoftwareDistribution
md CWindowsSoftwareDistribution
net start wuauserv
net start UsoSvc
@echo off
echo Batch File By GMAN
taskkill F FI IMAGENAME eq SystemSettings.exe
@echo
net stop wuauserv
net stop UsoSvc
@echo
reg add HKLMSOFTWAREPoliciesMicrosoftWindowsWindowsUpdate v DoNotConnectToWindowsUpdateInternetLocations t REG_DWORD d 1 f
@echo
reg add HKLMSOFTWAREPoliciesMicrosoftWindowsWindowsUpdate v SetDisableUXWUAccess t REG_DWORD d 1 f
reg add HKLMSOFTWAREPoliciesMicrosoftWindowsWindowsUpdateAU v NoAutoUpdate t REG_DWORD d 1 f
reg add HKLMSOFTWAREPoliciesMicrosoftWindowsWindowsUpdate v ExcludeWUDriversInQualityUpdate t REG_DWORD d 1 f
@echo
gpupdate force
rd s q CWindowsSoftwareDistribution
md CWindowsSoftwareDistribution
@echo
net start wuauserv
net start UsoSvc
echo Windows Updates Are Successfully Disabled!
pause
pause
echo.
echo.
echo.
echo.                                              %f% -----------------------------------
echo.                                              %f%  %w%  Success Restart your PC!  %f%
echo.                                              %f% -----------------------------------
pause > nul
cls
goto :menu

:b 
cls 
rstrui.exe
 echo.
echo.
echo.
echo.                                              %f% -----------------------------------
echo.                                              %f%  %w%  Success Restart your PC!  %f%
echo.                                              %f% -----------------------------------
pause > nul
cls
goto :menu