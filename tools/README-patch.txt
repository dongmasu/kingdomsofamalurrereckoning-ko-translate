Kingdoms of Amalur: Re-Reckoning Korean zh_cn Patch and Installation Guide
===============================================================================

한국어 설치 안내
----------------

이 패키지는 GitHub 정식 Release로 공개된 한글 패치입니다. 게임의
`zh_cn` 로케일을 사용하며 영어(`en_us`) 리소스는 덮어쓰지 않습니다.
대사 ID 65134까지의 순차 검토와 zh_cn 전용 affix variant 140개의 판정이
기록되어 있습니다.

지원 기준 버전은 메인 메뉴 우측 하단에 `Version: cs:15032`로 표시되는
게임입니다. Steam BuildID가 아니라 게임에 표시되는 버전을 확인하세요.

패키지 구성:
- zh_cn 한국어 현지화 바이너리 3개
- 폰트 포함 빌드: Noto 폰트 리소스 29개 (폰트 파일 1개와 글리프 페이지 28개)
- 폰트 제외 실험 빌드는 한글 대신 하이픈을 표시했으므로 사용하지 마세요.
- `fontlist_common.koafontlist`는 포함하지 않음
- Windows 더블클릭 실행기, 적용 스크립트와 체크섬
- `locatexts_en_us.characterset`은 포함하지 않음

설치 방법:
1. ZIP 전체를 Windows PC의 한 폴더에 압축 해제합니다. `README.txt`,
   `RunKoreanPatch.bat`, `KoreanPatch.ps1`, `SHA256SUMS.txt`, `payload` 폴더가 함께 있어야 합니다.
2. `RunKoreanPatch.bat`을 더블클릭합니다. `.ps1` 파일을 직접 더블클릭하지 마세요.
   관리자 권한 요청이 표시되면 먼저 승인합니다. 승인 후 게임 폴더를 한 번 묻습니다.
3. 기본 게임 폴더를 사용하려면 경로 입력을 묻는 화면에서 Enter를 누릅니다.
   기본 경로는 `C:\Program Files (x86)\Steam\steamapps\common\Kingdoms of Amalur Re-Reckoning`입니다.
   다른 위치에 설치했다면 게임 폴더 경로를 입력합니다.
4. 게임 폴더를 확인하면 나머지 절차는 자동으로 진행됩니다. 원본 PAK을 검증하고
   임시 폴더에서 새 PAK을 만든 뒤 백업 및 교체합니다.
5. 적용 완료 후 Steam 게임 속성에서 게임 언어를 중국어(간체)로 설정합니다.
6. 완료 메시지가 표시되면 아무 키나 눌러 PowerShell 창을 닫습니다. 오류가 난 경우에도
   오류 메시지를 확인할 수 있도록 키 입력 전까지 창이 유지됩니다.

적용 스크립트는 기존 `data\patch_0.pak`을 임시 폴더에 풀고 패키지 파일을 덮어쓴
후 별도 PAK을 생성합니다. 언팩 대상 파일명, 명령, 출력 폴더와 빌드 목록은
스크립트가 도구에 전달하므로 도구에 직접 입력할 필요가 없습니다. 새 PAK을 다시
풀어 패키지 파일을 검증하고, 원본 PAK
백업의 SHA-256이 원본과 일치하는지 확인한 다음에만 교체합니다. 백업은 기존
`data\patch_0.pak` 옆에 시간표시가 붙은 `.backup-` 파일명으로 보관됩니다.

한글이 표시되지 않거나 화면에 문제가 생기면 게임을 종료하고 안내된 백업본을
복원하세요. 문자셋 파일과 공용 글꼴 목록은 패키지에 포함하지 않습니다. 사용자는
이 파일들 없이 한글 출력이 정상인 것을 확인했습니다. 이 확인은 시험한 설정에만
해당하며 모든 게임 버전이나 전체 플레이 호환성을 보증하지 않습니다.

English
-------

This is the official Korean patch release. It uses the game's `zh_cn` locale
and leaves the original English (`en_us`) resources intact.

Supported baseline: the main menu must show Version: cs:15032.
The Steam BuildID is not used as the compatibility check.
The release package includes the Noto font and 28 glyph pages. A font-free
experimental build displayed hyphens instead of Korean and is not suitable
for use. The package does not override `fontlist_common.koafontlist` or
include `locatexts_en_us.characterset`.

Install:
1. Extract the entire ZIP to a folder.
2. Double-click `RunKoreanPatch.bat`. Do not double-click the `.ps1` file.
   Approve the administrator prompt first if shown;
   the elevated script then asks for the game folder once.
3. Press Enter to use the default Steam game folder, or enter another folder.
   Default: `C:\Program Files (x86)\Steam\steamapps\common\Kingdoms of Amalur Re-Reckoning`
4. Once the game folder is confirmed, the script automatically verifies the
   package and game files, rebuilds and verifies the PAK, backs up the original,
   and installs the replacement.
5. After installation, set the Steam language to Chinese (Simplified).
6. When the completion message appears, press any key to close the PowerShell
   window. On failure, the error remains visible until a key is pressed.

The installer unpacks the existing patch_0.pak, overlays the payload, builds
a separate candidate archive, and unpacks it again to verify the payload. It
passes the archive name, operation, output folder, and build list to the tools;
no manual filename entry is needed. It backs
up the original PAK, verifies the backup hash, and only then replaces it.
The backup is stored beside data\patch_0.pak with a timestamped .backup-
suffix.

If Hangul glyphs are missing or text is not displayed correctly, restore the
backup and report the result. The characterset file and common font list are
omitted; Korean was confirmed in the user's tested setup without them. This
does not establish compatibility with every game version or configuration.
