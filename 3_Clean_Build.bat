setlocal

for /f "usebackq delims=" %%A in ("0_Variables.txt") do %%A

del /s /q "%moddedBuildPath%\"
for /d %%i in ("%moddedBuildPath%\*") do (
	rmdir /s /q "%%i"
)
ROBOCOPY %cleanCiaPath% %moddedBuildPath% /e /nfl /ndl /xj /r:0 /w:0 /mt:8

call "3_Quick_Build.bat"

endlocal