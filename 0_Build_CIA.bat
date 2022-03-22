setlocal enabledelayedexpansion

for /f "usebackq delims=" %%A in ("0_Variables.txt") do %%A

cd "%moddedBuildPath%"
Romfs_Builder_CMD romfs
3dstool -cvtf exefs exefs.bin --header exefsheader.bin --exefs-dir exefs

SET toolCommand=3dstool -cvtf cxi "%outputCxi%" --header ncchheader.bin --exh exheader.bin --logo "%%~fj" --plain plain.bin --exefs exefs.bin --romfs romfs.bin %toolParams%
for %%j in ("%cd%\exefs\logo.*") do (
	%toolCommand%
	goto toolComplete
)
for %%j in ("%cd%\logo.*") do (
	%toolCommand%
	goto toolComplete
)
:toolComplete

SET buildCommand=%buildcommand% "%ciaName%"
for %%i in (*.ncch) do (
	for /F "tokens=1,2 delims=." %%a in ("%%i") do (
		SET buildCommand=!buildCommand! -content %%i:0x%%a:0x%%b
	)
)

%buildCommand%
MOVE /Y %ciaName% "..\%ciaInstallPath%"

endlocal