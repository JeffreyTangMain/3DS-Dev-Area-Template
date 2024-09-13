@echo off
setlocal 

for /f "usebackq delims=" %%A in ("0_Variables.txt") do %%A

cd %cleanCiaPath%
for /d %%i in ("%cd%\*") do (
	rmdir /s /q "%%i" > nul
)
del "%cd%\*.bin" > nul

for %%i in (*.ncch) do (
	for /F "tokens=1,2 delims=." %%a in ("%%i") do (
		3dstool -xvtf %ncchType% %%i --header %%a.%%b.ncchheader.bin --exh %%a.%%b.exheader.bin --exefs %%a.%%b.exefs.bin --romfs %%a.%%b.romfs.bin > nul
		3dstool -xvtf romfs %%a.%%b.romfs.bin --romfs-dir "%cd%\%%a.%%b.romfs" > nul
		3dstool -xvtf exefs %%a.%%b.exefs.bin --exefs-dir "%cd%\%%a.%%b.exefs" --header %%a.%%b.exefsheader.bin > nul
	)
)

endlocal