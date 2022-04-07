# 3DS-Dev-Area-Template
A template work area for modifying and recompiling 3DS CIAs. Feel free to delete the .placeholder files after downloading a copy of this repo.

Modify 0_Variables.txt to set paths, output names, and parameters for 3dstool.

DLC modification is *generally* the same as regular CIA or update modification, but their ncch files are sometimes (maybe always?) **CFA** files. This means you have to change the ncchType variable from cxi to cfa. This goes for anything with cfa files.

Your *unmodified* dump of the CIA will be put into 1_Clean_CIA_Dump alongside the existing .exe files. This should be the dump you want to put your mods onto and it should have a romfs folder, an exefs folder, all the ncch files needed to build the CIA, exefsheader.bin, exheader.bin, ncchheader.bin, and plain.bin.

Your modpack goes into 2_Modpack, into the titleID folder (rename this to the titleID of your game), and all modifications should go into romfs. The scripts are specifically tailored for the single romfs folder, but likely could be molded to manipulate any other extracted folders. 

You shouldn't need to touch any other folder, the batch files should be able to handle everything else for you. 

These scripts are designed to be relatively light and modular, but the nature of CIA files makes it hard to pack everything into an all in one solution.

# Scripts
0_Build_CIA: This builds the CIA after it's been modified from inside 3_Modded_Build, copying the CIA output to inside 4_SD_Card_CIA_Install.

0_Build_CIA_DLC: A version of the build script specifically designed for DLC building because of the unique file names that come out of the corresponding DLC script for DLC ncch files. Enable this by changing scriptType from .bat to \_DLC.bat.

1_Clean_Workspace: This deletes all non .exe files in 1_Clean_CIA_Dump, clears out 3_Modded_Build, and deletes any .cia files in 4_SD_Card_CIA_Install. This script is designed to basically reset everything *except* your modpack or any other files you've taken out of these directories. After running this script, you can easily get started on a new project.

1_Extract_CIA: This script will extract any CIA in the root directory (with the scripts) and renames cxi/ncch files in 1_Clean_CIA_Dump with the name format "contents.XXX.YYYYY" to "XXX.YYYYY.ncch" for the other scripts to work.

1_Extract_NCCH: This extracts a single ncch file as specified in 0_Variables as outputCxi to the romfs and exefs folders.

1_Extract_NCCH_DLC: This script is intended for DLC, but can also be used to somewhat mass dump ncch files in 1_Clean_CIA_Dump. Because it's made for DLC, the build commands won't properly rebuild everything, you'll have to stitch together both this script and the above script to make it work in that way. However, you shouldn't need to mass dump often because most main games or updates rarely have more than a few ncch files. Each file from the ncch files will be named after their corresponding ncch file.

3_Clean_Build: This will build your CIA from scratch by moving files from 1_Clean_CIA_Dump into 3_Modded_Build followed by moving your modpack from inside 2_Modpack over the ones in 3_Modded_Build to end up with a modified build of the clean dump.

3_Quick_Build: This will ignore cleaning up your existing 3_Modded_Build directory and will just copy from 2_Modpack over to 3_Modded_Build, resulting in a faster build time but with possible lingering files from previous builds.

4_Install_CIA_to_SD: This uses custom_install to install any CIAs in 4_SD_Card_CIA_Install to your SD card. If this step fails, you likely have to install the dependencies onto your computer. Go into 0_Dependencies and run 0_Install_Dependencies with Python 3 installed as your default version of python. If this doesn't work, manually run windows-install-dependencies.py with "py -3 windows-install-dependencies.py".

5_Clear_SD: This will delete any romfs folder inside the titleID folder under luma/titles to remove any existing romfs Luma patch mods.

5_Copy_to_SD: This copies whatever your modpack's romfs is into luma/titles/titleID to give you a temporary patch for your modpack rather than building a CIA.

5_Clean_Copy_to_SD: This runs 5_Clear_SD followed by 5_Copy_to_SD.

# Example Run

1. Place .cia in root directory and set ciaName, buildCommand, and toolParams variables.
2. Run 1_Extract_CIA
3. Set outputCxi variable.
4. Run 1_Extract_NCCH
5. Place modified romfs files into titleID\romfs
6. Run 3_Clean_Build
7. Run 4_Install_CIA_to_SD

# Credits
  - https://github.com/VelouriasMoon/RomFS-Builder-CMD
  - https://github.com/dnasdw/3dstool
  - https://github.com/3DSGuy/Project_CTR
  - https://github.com/ihaveamac/custom-install
  - https://docs.microsoft.com/en-us/sysinternals/downloads/sync
