@echo off

rem Download the latest SpotifyAdBlocker-x86 release from github using Invoke-WebRequest
powershell.exe Invoke-WebRequest -Uri https://github.com/moadfakhri/SpotifyAdBlocker-Windows/releases/latest/download/SpotifyAdBlocker-x86.zip -OutFile SpotifyAdBlocker-x86.zip

rem Extract the latest version of SpotifyAdBlocker-x86
powershell.exe Expand-Archive -Force SpotifyAdBlocker-x86.zip SpotifyAdBlocker-x86

rem Change directory into "%appdata%/Spotify"
cd "%appdata%/Spotify"

rem Delete the old libcefNative.dll (renamed original libcef.dll) to prevent crashes after an update
if exist libcefNative.dll del /f /q libcefNative.dll

rem Rename libcef.dll to libcefNative.dll
ren libcef.dll libcefNative.dll

rem Go back to the original directory the user executed the script from
cd "%~dp0"

rem Change directory into the folder we executed the latest SpotifyAdBlocker-x86 in
cd "%~dp0/SpotifyAdBlocker-x86"

rem Move the modded libcef.dll to "%appdata%/Spotify/"
move libcef.dll "%appdata%/Spotify"

rem Go back to the "%~dp0"
cd "%~dp0"

rem Cleanup temporary files
del SpotifyAdBlocker-x86.zip
rmdir SpotifyAdBlocker-x86 /q /s

rem Clear screen of previous commands and their outputs
cls

rem Print the following message
echo Enjoy Spotify without Ads.

rem Print an empty line
echo.

pause
