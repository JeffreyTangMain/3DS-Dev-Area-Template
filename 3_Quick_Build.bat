setlocal

for /f "usebackq delims=" %%A in ("0_Variables.txt") do %%A

for /d %%i in ("%~dp0\%modpackPath%\*") do (
	ROBOCOPY "%%i\romfs" "%moddedBuildPath%\romfs" /E /is /it /im
)

"0_Build_CIA.bat"

endlocal