setlocal

for /f "usebackq delims=" %%A in ("0_Variables.txt") do %%A

del /s /q "%moddedBuildPath%\"
for /d %%i in ("%moddedBuildPath%\*") do (
	rmdir /s /q "%%i"
)
ROBOCOPY %cleanCiaPath% %moddedBuildPath% /E

"3_Quick_Build.bat"

endlocal