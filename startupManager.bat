::
:: StartupManager by Niilo Vertainen
::
:: To make Startup Manager start automatically when computer starts (Windows 11):
::  1. Press WindowsKey + R
::  2. Type "shell:startup" without quotation marks and press enter
::  3. Save this file to folder that opens as "startupManager.bat". Make sure that file is batch-file (".bat")
::


:: Print start screen to terminal
:: mark "^" is used before mark "|". Otherwise "|" would be or-operator.
@echo off
echo  ------------------------------------------------------------------------------------------------------------------
echo ^|                                                                                                                 ^|
echo ^|  ,---.   ,--.                   ,--.                                                                            ^|
echo ^| '   .-',-'  '-. ,--,--.,--.--.,-'  '-.,--.,--. ,---.    ,--,--,--. ,--,--.,--,--,  ,--,--. ,---.  ,---. ,--.--. ^|
echo ^| `.  `-.'-.  .-'' ,-.  ^|^|  .--''-.  .-'^|  ^|^|  ^|^| .-. ^|   ^|        ^|' ,-.  ^|^|      \' ,-.  ^|^| .-. ^|^| .-. :^|  .--' ^|
echo ^| .-'    ^| ^|  ^|  \ '-'  ^|^|  ^|     ^|  ^|  '  ''  '^| '-' '   ^|  ^|  ^|  ^|\ '-'  ^|^|  ^|^|  ^|\ '-'  ^|' '-' '\   --.^|  ^|    ^|
echo ^| `-----'  `--'   `--`--'`--'     `--'   `----' ^|  ^|-'    `--`--`--' `--`--'`--''--' `--`--'.`-  /  `----'`--'    ^|
echo ^|                                               `--'                                        `---'                 ^|
echo ^|                                                                                                                 ^|
echo ^| 18.6.2025 by Niilo Vertainen                                                                          (C)2025   ^|
echo ^|_________________________________________________________________________________________________________________^|
echo ^|                                                                                                                 ^|
echo ^| To disable this window, remove or edit file "startupManager.bat" in                                             ^|
echo ^| "C:\Users\username\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"                               ^|
echo ^|                                                                                                                 ^|

:: Ask which project user wants to continue. User types project corresponding letter and presses enter.
:: For example I have GitHub and Blender projects. 
:Ask
echo ^|-----------    .-------------. .---------. .-------------.                                                       ^|
echo ^| Commands:     ^| B (Blender) ^| ^| G (Git) ^| ^| N (No apps) ^|                                                       ^|
echo ^|-----------    '-------------' '---------' '-------------'                                                       ^|
echo ^|                                                                                                                 ^|

:: Ask user input
set INPUT=
set /P INPUT=^| Type input: %=%

:: Program uses "goto"-commands to choose right code snippet
If /I "%INPUT%"=="b" goto blender
If /I "%INPUT%"=="g" goto git
If /I "%INPUT%"=="n" goto no
echo ^| Incorrect input. (n and enter to skip and quit)                                                                 ^| & goto Ask
:: ( "/I" on lines above makes program to ignore upper and lower case )




:: Deside which programs should be started with blender
:blender
:: Browser opening takes time, so we should first open one page 
start "" "https://www.duckduckgo.com"
:: Then we can start our ".blend"-file that we want to edit
start "" "D:\Projects\3D projects\myBlenderProject.blend" ::                     <- change path. For example: start "" "D:\Projects\3D projects\myBlenderProject.blend"
:: I usually need gimp to edit textures when I use blender
start "" "C:\Users\username\AppData\Local\Microsoft\WindowsApps\gimp-3.exe"::    <- change path. For example: start "" "C:\Users\username\AppData\Local\Microsoft\WindowsApps\gimp-3.exe"
:: I also use paint.net
start "" "D:\Apps\paint.net\paintdotnet.exe" ::                                  <- change path. For example: start "" "D:\Apps\paint.net\paintdotnet.exe"
:: We should wait browser to open...
TIMEOUT /T 7 ::                                                                  <- If browser takes more time to start, you can change number (seconds)
:: About seven seconds later browser is ready and we can open the page we want
start "" "https://open.spotify.com/"




:: Deside which programs should be started with GitHub projects
:git
:: Browser opening takes time, so we should first open one page 
start "" "https://www.duckduckgo.com"
:: I use notepad++
start "" "D:\Apps\Notepad++\notepad++.exe" ::                                    <- change path. For example: start "" "D:\Apps\Notepad++\notepad++.exe"
start "" "C:\Users\username\AppData\Local\GitHubDesktop\GitHubDesktop.exe" ::    <- change path. For example: start "" "C:\Users\username\AppData\Local\GitHubDesktop\GitHubDesktop.exe"
:: Open File Explorer and open right GitHub folder
start "" "C:\Users\username\Documents\GitHub" ::                                 <- change path. For example: start "" "C:\Users\username\Documents\GitHub"
:: We should wait browser to open...
TIMEOUT /T 7 ::                                                                  <- If browser takes more time to start, you can change number (seconds)
:: About seven seconds later browser is ready and we can open the page we want
start "" "https://open.spotify.com/"
:: To make sure all tabs open correctly, I've added one second time delay
TIMEOUT /T 1
start "" "https://qettu.github.io/" ::                                           <- change your GitHub username
TIMEOUT /T 1
start "" "file:///C:/Users/username/Documents/GitHub/qettu.github.io/index.html" :: <- change your local git path
TIMEOUT /T 1
start "" "https://github.com/qettu?tab=repositories" ::                          <- change your GitHub repository url




:no
:: Sometimes we want to do something else and not open our old projects. Then program quits.