setlocal

for /f "usebackq delims=" %%A in ("0_Variables.txt") do %%A

del /s /q "%moddedBuildPath%\"
for /d %%i in ("%moddedBuildPath%\*") do (
	rmdir /s /q "%%i"
)
for /d %%i in ("%cleanCiaPath%\*") do (
	rmdir /s /q "%%i"
)
for %%i in ("%cleanCiaPath%\*") do (
	if not "%%~xi"==".exe" del "%%i"
)
for %%i in ("%ciaInstallPath%\*") do (
	if "%%~xi"==".cia" del "%%i"
)

endlocal