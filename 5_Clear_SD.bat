setlocal

for /f "usebackq delims=" %%A in ("0_Variables.txt") do %%A

SET sdLumaPath=%sdPath%\%sdLumaPath%

for /d %%i in ("%cd%\%modpackPath%\*") do (
	rmdir /s /q "%sdLumaPath%\%%~nxi\romfs"
)

endlocal