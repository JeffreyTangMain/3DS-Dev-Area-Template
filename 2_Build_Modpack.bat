@echo off
setlocal enabledelayedexpansion

for /f "usebackq delims=" %%A in ("0_Variables.txt") do %%A

for /d %%f in ("%modPath%\*") do (
	goto mods
)
goto nomods

:mods
del /s /q "%modpackPath%\" > nul
for /d %%i in ("%modpackPath%\*") do (
	rmdir /s /q "%%i" > nul
)

for /d %%f in ("%modPath%\*") do (
	for /f "delims=_" %%n in ("%%~nf") do (
		set "number=00000%%n"
		set "file[!number:~-6!]=%modPath%\%%~nf"
	)
)

for /f "tokens=2 delims==" %%i in ('set file[') do (
	ROBOCOPY "%%~fi" %modpackPath% /mir /xx /nfl /ndl /xj /r:0 /w:0 /mt:8
)

:nomods
endlocal