KO_KR LOCALE EXPERIMENT - NOT THE OFFICIAL KOREAN PATCH

This ZIP tests whether the game recognizes a newly added ko_kr locale.
It does not replace the existing zh_cn localization. The payload adds three
ko_kr localization files and fontlist_ko_kr.koafontlist, and replaces the
29 Noto font resources needed to display Hangul.

The original game's assetinfos.bin lists eight locale resource sets but no
ko_kr entries. It may be an asset catalog rather than the language selection
menu. The game might ignore the new files or fail to offer a Korean language
option. Building and installing the PAK does not prove that ko_kr works.

1. Back up your game and extract this entire ZIP to a folder on Windows.
2. Double-click RunKoreanPatch.bat, not KoreanPatch.ps1.
3. Enter the game installation folder if it differs from the default.
4. The installer makes and verifies a new PAK before replacing patch_0.pak.
   It also saves a timestamped backup of your previous patch_0.pak.
5. Check whether the game actually offers Korean and renders Korean text.
   If it does not, restore the backup shown by the installer. Do not assume
   that choosing Chinese (Simplified) will select these ko_kr files.

This is an experimental package. The official zh_cn Release ZIP is unchanged.
