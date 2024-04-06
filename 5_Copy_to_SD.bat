setlocal

for /f "usebackq delims=" %%A in ("0_Variables.txt") do %%A

SET sdLumaPath=%sdPath%\%sdLumaPath%

for /d %%i in ("%cd%\%modpackPath%\*") do (
	ROBOCOPY "%%i\romfs" "%sdLumaPath%\%%~nxi\romfs" /e /is /it /im /nfl /ndl /xj /r:0 /w:0 /mt:8
)

endlocal