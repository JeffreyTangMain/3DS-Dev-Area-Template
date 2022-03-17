setlocal

for /f "usebackq delims=" %%A in ("0_Variables.txt") do %%A

SET sdLumaPath=%sdPath%\%sdLumaPath%
echo %sdLumaPath%

for /d %%i in ("%~dp0\%modpackPath%\*") do (
	ROBOCOPY "%%i\romfs" "%sdLumaPath%\%%~nxi\romfs" /E /is /it /im
)

endlocal