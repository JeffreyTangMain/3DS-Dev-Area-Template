setlocal 

for /f "usebackq delims=" %%A in ("0_Variables.txt") do %%A

cd %cleanCiaPath%

for %%j in ("%~dp0\*.cia") do (
	ctrtool --contents="%cd%\contents" "%%j"
)

for %%i in (contents.*) do (
	for /F "tokens=1,2,3 delims=." %%a in ("%%i") do (
		REN %%i %%b.%%c.ncch
	)
)

endlocal