setlocal

for /f "usebackq delims=" %%A in ("0_Variables.txt") do %%A

call "2_Build_Modpack.bat"

for /d %%i in ("%cd%\%modpackPath%\*") do (
	for /d %%j in ("%%i\*") do (
		ROBOCOPY "%%j" "%moddedBuildPath%\%%~nj" /E /is /it /im
	)
)

call "0_Build_CIA.bat"

endlocal