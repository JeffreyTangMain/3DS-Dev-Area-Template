# 3DS-Dev-Area-Template
A template work area for modifying and recompiling 3DS CIAs. Feel free to delete the .placeholder files after downloading a copy of this repo. This template is designed to manipulate 1 romfs at a time. This *can* be worked to open up and modify DLC CIAs, but it'll be a bit of a hassle, so modify the existing batch commands to your liking.

Modify 0_Variables.txt to set paths, output names, and parameters for 3dstool.

Your *unmodified* dump of the CIA will be put into 1_Clean_CIA_Dump alongside the existing .exe files. This should be the dump you want to put your mods onto and it should have a romfs folder, an exefs folder, all the ncch files needed to build the CIA, exefsheader.bin, exheader.bin, ncchheader.bin, and plain.bin.

Your modpack goes into 2_Modpack, into the titleID folder (rename this to the titleID of your game), and all modifications should go into romfs. This template only supports romfs changes, but could probably be modified to handle any other changes.

You shouldn't need to touch any other folder, the batch files should be able to handle everything else for you.

# Scripts
0_Build_CIA: This builds the CIA after it's been modified from inside 3_Modded_Build, copying the CIA output to inside 4_SD_Card_CIA_Install.

1_Extract_CIA: This script will extract any CIA in the root directory (with the scripts) and renames cxi/ncch files in 1_Clean_CIA_Dump with the name format "contents.XXX.YYYYY" to "XXX.YYYYY.ncch" for the other scripts to work.

1_Extract_NCCH: This extracts a single ncch file as specified in 0_Variables as outputCxi to the romfs and exefs folders.

3_Clean_Build: This will build your CIA from scratch by moving files from 1_Clean_CIA_Dump into 3_Modded_Build followed by moving your modpack from inside 2_Modpack over the ones in 3_Modded_Build to end up with a modified build of the clean dump.

3_Quick_Build: This will ignore cleaning up your existing 3_Modded_Build directory and will just copy from 2_Modpack over to 3_Modded_Build, resulting in a faster build time but with possible lingering files from previous builds.

4_Install_CIA_to_SD: This uses custom_install to install any CIAs in 4_SD_Card_CIA_Install to your SD card.

5_Clear_SD: This will delete any romfs folder inside the titleID folder under luma/titles to remove any existing romfs Luma patch mods.

5_Copy_to_SD: This copies whatever your modpack's romfs is into luma/titles/titleID to give you a temporary patch for your modpack rather than building a CIA.

5_Clean_Copy_to_SD: This runs 5_Clear_SD followed by 5_Copy_to_SD.

# Example Run

1. Place .cia in root directory and set ciaName, outputCxi, buildCommand, and toolParams variables.
2. Run 1_Extract_CIA
3. Run 1_Extract_NCCH
4. Place modified romfs files into titleID\romfs
5. Run 3_Clean_Build
6. Run 4_Install_CIA_to_SD

# Credits
  - https://github.com/VelouriasMoon/RomFS-Builder-CMD
  - https://github.com/dnasdw/3dstool
  - https://github.com/3DSGuy/Project_CTR
  - https://github.com/ihaveamac/custom-install
