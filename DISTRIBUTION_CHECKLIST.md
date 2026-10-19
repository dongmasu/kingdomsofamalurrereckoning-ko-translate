# Distribution Readiness Checklist

Release snapshot as of 2026-10-19: the official ZIP includes accepted
translation edits through D-21851. Build, round-trip, installer regression,
audit regression, and ZIP integrity checks passed. The asset link is updated
in `README.md`; see `work/zh_cn/audit/release-20261019.md` for the exact tag,
hashes, and validation scope. Exhaustive proper-name discovery remains
incomplete but is closed as an active workstream at the user's direction.
The sequential default review is complete through ID 65134; all 140
zh_cn-specific affix variants also have recorded dispositions. The user
confirmed Korean rendering in the zh_cn setup without
`locatexts_en_us.characterset` or `fontlist_common.koafontlist`.

This is an official-release snapshot, not a prerelease candidate. The Windows installer
has not been independently exercised on Windows, and broad UI, long-play,
other-locale, and cross-version checks were not part of the recorded smoke
test. These are documented limitations, not a reason to relabel the
user-approved release as a prerelease.

The active Korean working CSV folder is `work/zh_cn/`, and the user selected
the existing `zh_cn` slot to avoid overwriting the English resources used by
the earlier Korean patches. This preserves the English text for troubleshooting
and comparison. Its CSV structure matches the original `zh_cn` resources.
The original `fontlist_zh_cn.koafontlist` references Noto, so the current
package keeps the Noto resources but does not override the common font list.
The smoke test confirms only the user's tested setup; broader font coverage,
Windows installer behavior, and in-game functionality remain unverified.
Keep `default` ID 45204 displayed as `중국어(간체)`, not `한국어`: the
internal slot remains `zh_cn`, and consistently relabeling it would require
changes across the game's language files, contrary to the minimal-change goal.

## Released Package

The official ZIP omits the characterset and common font list and contains:

- Three Korean `zh_cn` localization binaries:
  `locatexts_zh_cn.koalocatext_affix`,
  `locatexts_zh_cn.koalocatext_base`, and
  `locatexts_zh_cn.koalocatext_default`.
- Twenty-nine Noto font resources: `notosanscjksc_regular.font` and its 28
  `.ntx` pages.
- `RunKoreanPatch.bat`, `KoreanPatch.ps1`, bilingual `README.txt`, and
  `SHA256SUMS.txt`.

The released ZIP is
`dist/20261019233647/KingdomsOfAmalur_Korean_zh_cn_20261019233647.zip`. It
contains 32 payload files (three localization binaries and 29 Noto font
resources), with no common font list or characterset. Generated `dist/`
packages are ignored by Git and are attached to GitHub Releases instead of
being committed to the source repository. Its ASCII-only English Windows script
prompts once for the game directory (default:
`C:\Program Files (x86)\Steam\steamapps\common\Kingdoms of Amalur Re-Reckoning`),
documents `cs:15032` as the supported baseline, then automatically proceeds
after the game folder is confirmed. It rebuilds the user's full PAK, verifies
the candidate, backs up the original, and then installs it. After installation,
the game language should be `Chinese Simplified`.

The ZIP passed build-time localization round-trip and archive integrity
checks. Its included PowerShell script is byte-identical to the ASCII-only
source script. Users should launch it by double-clicking
`RunKoreanPatch.bat`; directly double-clicking `.ps1` may open it in an editor.
The user requested this updated package as an official release. This ZIP was
not separately retested in-game after packaging; the recorded 2026-10-14 user test
confirmed Korean output in the zh_cn setup without the characterset or common
font list. Do not describe that brief test as comprehensive coverage.

This is a delta for the inspected game version, not a standalone PAK. Each
user needs their own complete original `data/patch_0.pak` to build a complete
replacement archive.

The inspected original PAK came from the user's Steam installation. The user
confirmed that the game's main menu displays `Version: cs:15032`; this is the
source game-version baseline for the comparison. Steam AppID `1041720`,
BuildID `10619381` in that installation's `appmanifest_1041720.acf` is
secondary provenance information. The archive has not been independently
matched against a depot manifest; the in-game test was a brief smoke test.

## Known Scope and Follow-Up

- The user selected `zh_cn` as the destination to preserve English.
  The original locale font list references Noto. The user confirmed Korean
  rendered in-game without overriding `fontlist_common`; the release package
  therefore keeps the Noto font and glyph pages but omits the common list.
  Broader Hangul glyph coverage and other locale/font-role behavior remain
  unverified.
- The work files match `zh_cn` exactly: `base` 4,844 rows, `default` 65,135
  IDs, and `affix` 3,451 rows, including key order. All 140 additional
  `affix` variants have been reviewed and dispositioned in
  `work/zh_cn/audit/affix-extra-variant-review.tsv`.
- Treat in-game `Version: cs:15032` as the source PAK baseline. Build and test
  the candidate against that same game version. Compatibility with later game
  versions is unverified; the file comparison does not establish it.
- The release ZIP intentionally omits `locatexts_en_us.characterset`. The user
  reported normal Korean output for about five minutes without it, so keep it
  excluded unless a later test reveals a character-display problem. Its
  purpose remains unknown.
- Do not treat the current files in `src/lang/` as the release payload: the
  three `en_us` localization binaries are byte-identical to the original
  English resources. The release binaries are generated from `work/zh_cn/`;
  `src/` remains immutable.

- The 2026-10-19 snapshot supersedes the 2026-10-17 package with accepted
  translation edits through D-21851. Subsequent accepted edits require a new
  build and validation before another release; do not silently reuse this ZIP.

## Build Record and Optional Validation

- The README introduction, bilingual resource links, renamed reference paths,
  role-document links, `en_us`/`affix` compatibility note, and secondary
  Namu Wiki context reference were updated on 2026-10-07. Before publication,
  check Korean/English parity and verify every public link.
- The sequential default-ID review is complete through ID 65134. The
  historical global tally's unidentified 987-key membership was closed at
  the user's direction as an unrecoverable accounting limitation. It does not
  represent an open review scope and must not trigger duplicate reviews or
  recounting.
- [x] Generate the three `zh_cn` localization binaries from `work/zh_cn/`
  using the matching repackers.
- [x] Re-unpack the generated binaries and compare their CSV content with the
  working files: `affix` 3,451 rows, `base` 4,844, `default` 65,135.
- [x] Build a timestamped ZIP with 32 payload files, batch launcher, installer,
  instructions, and SHA-256 manifest; omit `fontlist_common.koafontlist` and
  `locatexts_en_us.characterset`.
- [x] User-reported initial in-game smoke test: Korean text displayed normally
  in the `zh_cn` setup without the common font list or
  `locatexts_en_us.characterset`.
- [ ] Run the PowerShell installer on Windows against game version
  `cs:15032`; confirm candidate creation, round-trip payload hashes, timestamped
  original backup, and safe replacement.
- [ ] Launch the game with `Chinese Simplified` selected and verify menu/UI,
  Hangul font rendering, dialogue, item descriptions, multiline strings, and
  locale-variant behavior.
- Test the built PAK in the matching game version with the selected
  replacement locale active. Check that English remains selectable if the
  package is intended to preserve it, and verify menu/system text, Hangul
  font rendering, dialogue, item descriptions, multiline strings, and
  locale-variant behavior.
- Keep the brief in-game smoke-test scope distinct from comprehensive
  installer, UI, and compatibility testing.
- Record any future installer, locale, or game-version tests in the audit
  notes before changing the documented compatibility claims.
- [x] Public source repository created and pushed on 2026-10-14:
  `https://github.com/dongmasu/kingdomsofamalurrereckoning-ko-translate`.
  Only `references/manual/` is included; other reference material remains
  excluded from the public repository.
- `.gitignore` excludes `.DS_Store`, Python bytecode/caches, and generated
  `dist/` packages. The ZIP is published as an official, non-prerelease
  release asset. Windows installer and comprehensive compatibility checks
  remain unperformed.

## User-Directed Order

1. Project instructions and role boundaries (documented).
2. Bilingual README introduction, context, and source links (updated
  2026-10-07; user may review).
3. Prepare the distribution ZIP (completed and round-trip validated
   2026-10-14; rebuilt and validated 2026-10-17 and 2026-10-19).
4. Publish the repository and release asset (initial release 2026-10-14;
   updated official-release snapshots requested 2026-10-17 and 2026-10-19).
5. Complete linguistic review (sequential default-ID review through 65134
  and all 140 extra affix dispositions are recorded). The historical
  unidentified 987-key tally discrepancy was closed at the user's direction
  as an unrecoverable accounting limitation; it is not unreviewed work.
