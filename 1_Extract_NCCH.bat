@echo off
setlocal 

for /f "usebackq delims=" %%A in ("0_Variables.txt") do %%A

cd %cleanCiaPath%
rmdir /s /q "%cd%\romfs" > nul
rmdir /s /q "%cd%\exefs" > nul
3dstool -xvtf %ncchType% %outputNcch% --header ncchheader.bin --exh exheader.bin --logo logo.bcma.lz --plain plain.bin --exefs exefs.bin --romfs romfs.bin > nul
3dstool -xvtf romfs romfs.bin --romfs-dir "%cd%\romfs" > nul
3dstool -xvtf exefs exefs.bin --exefs-dir "%cd%\exefs" --header exefsheader.bin > nul

endlocal