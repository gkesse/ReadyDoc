#=================================================
# Keil �Vision
#=================================================

# Cr�er un nouveau projet
Project
New �Vision Project
Name -> MY_PROJECT
Save
CPU -> Atmel -> AT89C52
No
Ok

# Cr�er un nouveau fichier source
File
New
File
Save As
Name -> MY_FILE.c
Save

# Cr�er un nouveau fichier ent�te
File
New
File
Save As
Name -> MY_FILE.h
Save

# Ajouter un fichier source au projet
Target1
Source Group1 -> Right Click
Add File To Source Source Group1
MY_FILE.c
Add
Ok

# Ajouter un r�pertoire de fichier ent�te au projet
Target1 -> Right Click
Options for Target Target1
C51
Include Paths -> MY_INCLUDE_PATH
Ok

# Modifier la cible
Target1 -> Right Click
Device
Atmel -> AT89C52
Ok

# Cr�er un fichier executable hex
Target1 -> Right Click
Options for Target Target1
Output
Check -> Create Hex File
Ok

# Compiler un projet
Target1 -> Right Click
Rebuild All Target Files

