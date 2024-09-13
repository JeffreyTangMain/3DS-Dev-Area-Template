@echo off
setlocal

for /f "usebackq delims=" %%A in ("0_Variables.txt") do %%A

del /s /q "%moddedBuildPath%\" > nul
for /d %%i in ("%moddedBuildPath%\*") do (
	rmdir /s /q "%%i" > nul
)
for /d %%i in ("%cleanCiaPath%\*") do (
	rmdir /s /q "%%i" > nul
)
for %%i in ("%cleanCiaPath%\*") do (
	if not "%%~xi"==".exe" del "%%i" > nul
)
for %%i in ("%ciaInstallPath%\*") do (
	if "%%~xi"==".cia" del "%%i" > nul
)

endlocal