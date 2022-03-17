setlocal

for /f "usebackq delims=" %%A in ("0_Variables.txt") do %%A

cd %ciaInstallPath%

for %%i in (*.cia) do (
	python custominstall.py -b boot9.bin -s seeddb.bin -m movable.sed --sd %sdPath% %%~nxi
)

sync64 -e %sdPath:~0,1%

endlocal