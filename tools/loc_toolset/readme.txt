============================================================
AMALUR RE-RECKONING: LOC TOOLSET (v1.0)
============================================================

READ THIS BEFORE DOING ANYTHING STUPID

DISCLAIMER: 
These scripts are raw and were developed with AI assistance (80% AI / 20% Brute Force). 
They are functional but "no-frills". 
I AM NOT RESPONSIBLE FOR CORRUPTED SAVES, BROKEN GAMES, OR NUCLEAR WARS caused by misuse.

REQUIREMENTS:
1. Python 3.x installed.
2. Official Amalur Modding Tools (pakfileunpacker.exe / pakfilebuilder.exe).
3. A brain (optional, but recommended).
4. BACKUPS! Always backup your original 'patch_0.pak' and text files before editing.

------------------------------------------------------------
PHASE 1: UNPACKING THE GAME DATA (Cmd Line)
------------------------------------------------------------
You MUST unpack the 'patch_0.pak' file first. The scripts work on the extracted files, not the .pak itself.

Command (Run in terminal):
.\modding\pakfileunpacker.exe .\data\patch_0.pak unpack .\modding\patch_0_unpacked
(e.g \Steam\steamapps\common\Kingdoms of Amalur Re-Reckoning> .\modding\pakfileunpacker.exe .\data\patch_0.pak unpack .\modding\patch_0_unpacked)

*NOTE: You MUST create the folder 'patch_0_unpacked' manually before running the command, or it will fail.

------------------------------------------------------------
PHASE 2: USING THE PYTHON SCRIPTS
------------------------------------------------------------
There are 3 types of text files in Amalur (look for "locatexts"):
1. _affix   (Prefixes/Suffixes - Complex pointers for gender/plural)
2. _base    (UI/System text - Mixed pointers)
3. _default (Lore/Dialogues - Global pointers only)

STEP 1: UNPACKING (Generating CSV)
You can drag the .koalocatext file onto the corresponding UNPACK_script.py OR run it via terminal (CMD/PowerShell).

Example Command (Terminal):
py C:\Users\user\Amalur\Extract\unpacker_default.py C:\Users\user\Amalur\Extract\locatexts_es_es.koalocatext_default

   -> It creates a CSV file in the same folder.
   -> It saves a temporary HASH file in your User folder (C:\Users\You\.koalo_hash...). 
   -> WARNING: DO NOT DELETE TEMP FILES. The repacker needs them!

STEP 2: EDITING
   -> Open the CSV.
   -> Encoding: MUST BE UTF-8 (Vital for accents!).
   -> Do not touch IDs or Relative IDs columns. Just edit the Text column.

STEP 3: REPACKING (Generating Binary)
Run the corresponding REPACK_script.py targeting your edited CSV file.

Example Command (Terminal):
py C:\Users\user\Amalur\Extract\repacker_default.py C:\Users\user\Amalur\Extract\locatexts_es_es.koalocatext_default.csv

   -> It uses the hidden Hash file to reconstruct the header.
   -> Output: A new binary file (e.g., NEW_locatexts_es_es.bin).

------------------------------------------------------------
PHASE 3: TRANSLATION RULES (IMPORTANT!)
------------------------------------------------------------
1. TAGS & VARIABLES ($STR0, $STR1, {*1Text}):
   - VARIABLES like $STR0, $STR1: DO NOT TRANSLATE.
   - RICH TEXT tags like {*1SkillName}: THESE CAN BE TRANSLATED!
   
   HOW TO KNOW? -> TRIANGULATION STRATEGY:
   Check the French or Spanish files. 
   If they translated the text inside the brackets, you should too.
   
   Example:
   [EN] {*1Punishment}
   [ES] {*1castigo}
   [PT] {*1Punição}  <-- Translate the text, keep the symbol/number (*1).

   - Be careful with order! "$STR0 $STR1" is different from "$STR1 $STR0".

2. GENDER SYSTEM (Encapsulation):
   - Format: [[TM]MasculineText][[TF]FeminineText]
   - Example: [[TM]O Guerreiro][[TF]A Guerreira]
   - If neutral, just write text normally.

3. THE "DEFAULT" FILE & UI CRITICAL ZONES (Lines 0-1400):
   - The first ~1400 lines are memory allocations and system strings.
   - TRANSLATE THESE MANUALLY. Do not batch-edit blindly.
   - WARNING: If you break a tag here, the game won't crash to desktop, 
     BUT the UI will vanish (invisible text, broken HUD), making it unplayable.

4. PRO-TIP: SPEED UP WITH EXCEL (A-Z SORTING):
   - Open the CSV in Excel/LibreOffice.
   - Sort by the 'TEXT' column (A to Z).
   - *CRITICAL:* Make sure to "Expand Selection" so the IDs stay linked to their text.
   - Why do this? There are thousands of duplicate lines ("Goodbye", "Quest Failed").
   - Group duplicate lines to translate faster, then resort by ID if needed.

------------------------------------------------------------
PHASE 4: REPACKING THE PAK (The Finish Line)
------------------------------------------------------------
1. Rename your new file (removing the "_NOVO.bin" part) to match the original name.
   Example: 
   locatexts_es_es.koalocatext_default_NOVO.bin  ->  locatexts_es_es.koalocatext_default

2. Overwrite the file in your 'patch_0_unpacked' folder.

3. PREPARE THE BUILD LIST ('patch_0_build.txt'):
   *** CRITICAL STEP - READ THIS ***
   The provided 'patch_0_build.txt' contains full paths to the files.
   Example inside: "C:\Program Files (x86)\Steam\...\patch_0_unpacked\file..."
   
   IF YOUR GAME IS INSTALLED SOMEWHERE ELSE (e.g., D:\Games\Amalur...):
   A) Open 'patch_0_build.txt' in Notepad/Notepad++.
   B) Press Ctrl+H (Find and Replace).
   C) Find the old path (e.g., "C:\Program Files (x86)\Steam\...") and Replace All 
      with YOUR actual path to the 'patch_0_unpacked' in modding folder.
   D) Save the file.

4. Run the builder command:
   .\pakfilebuilder.exe -c patch_0_build.txt patch_0.pak
   (e.g \Kingdoms of Amalur Re-Reckoning\modding>.\pakfilebuilder.exe -c patch_0_build.txt patch_0.pak)

5. Place the new 'patch_0.pak' in your game folder. Play and enjoy!

------------------------------------------------------------
CREDITS & LICENSE
------------------------------------------------------------
Scripts by [SeuNome/Nick].
Logic: 80% AI / 20% Brute Force.
Feel free to improve the code, build a UI, or fix my mess.
Be happy and succeed!

------------------------------------------------------------
LOCAL WORKING-COPY CHANGES (2026-10-05)
------------------------------------------------------------
The reference scripts in references/unpacker repacker scripts/
are kept unchanged. In tools/loc_toolset/, the three unpacker scripts were modified:
their byte-by-byte chr() conversion was replaced with strict UTF-8 decoding for
null-terminated strings. The three repacker scripts are unchanged.

No-edit CSV -> binary -> CSV round-trip checks passed for the English and Korean
en_us resources in base, default, and affix. A Korean replacement string also
survived a base round trip. Full PAK building and in-game testing are pending.
