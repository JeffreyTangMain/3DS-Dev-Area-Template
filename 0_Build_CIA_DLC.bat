setlocal enabledelayedexpansion

for /f "usebackq delims=" %%A in ("0_Variables.txt") do %%A

cd %moddedBuildPath%
for /d %%i in (*.romfs) do (
	Romfs_Builder_CMD %%i
)
for %%i in (*.exefs.bin) do (
	for /F "tokens=1,2 delims=." %%a in ("%%i") do (
		3dstool -cvtf exefs %%a.%%b.exefs.bin --header %%a.%%b.exefsheader.bin --exefs-dir "%cd%\%%a.%%b.exefs"
	)
)

for %%i in (*.romfs.bin) do (
	for /F "tokens=1,2 delims=." %%a in ("%%i") do (
		3dstool -cvtf %ncchType% %%a.%%b.ncch --header %%a.%%b.ncchheader.bin --exh %%a.%%b.exheader.bin --exefs %%a.%%b.exefs.bin --romfs %%a.%%b.romfs.bin %toolParams%
	)
)
for %%i in (*.exefs.bin) do (
	for /F "tokens=1,2 delims=." %%a in ("%%i") do (
		3dstool -cvtf %ncchType% %%a.%%b.ncch --header %%a.%%b.ncchheader.bin --exh %%a.%%b.exheader.bin --exefs %%a.%%b.exefs.bin --romfs %%a.%%b.romfs.bin %toolParams%
	)
)

SET buildCommand=%buildcommand% %ciaName%
for %%i in (*.ncch) do (
	for /F "tokens=1,2 delims=." %%a in ("%%i") do (
		SET buildCommand=!buildCommand! -content %%i:0x%%a:0x%%b
	)
)

%buildCommand%
MOVE /Y %ciaName% "..\%ciaInstallPath%"

endlocal