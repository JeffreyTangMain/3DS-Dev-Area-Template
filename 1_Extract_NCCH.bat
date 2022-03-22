setlocal 

for /f "usebackq delims=" %%A in ("0_Variables.txt") do %%A

cd %cleanCiaPath%
rmdir /s /q "%cd%\romfs"
rmdir /s /q "%cd%\exefs"
3dstool -xvtf %ncchType% %outputNcch% --header ncchheader.bin --exh exheader.bin --logo logo.bcma.lz --plain plain.bin --exefs exefs.bin --romfs romfs.bin
3dstool -xvtf romfs romfs.bin --romfs-dir "%cd%\romfs"
3dstool -xvtf exefs exefs.bin --exefs-dir "%cd%\exefs" --header exefsheader.bin

endlocal