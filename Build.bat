@echo off
call "C:\Program Files (x86)\Embarcadero\RAD Studio\12.0\bin\rsvars.bat"
msbuild "NewEficaz.dproj" /p:configuration="Release"

pause
if %ERRORLEVEL% neq 0 Exit /b 1
msbuild "NewEficaz.dproj" /p:configuration="BuildAutomatizado"
if %ERRORLEVEL% neq 0 Exit /b 1



