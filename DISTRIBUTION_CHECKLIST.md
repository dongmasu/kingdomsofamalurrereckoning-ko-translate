# Distribution Readiness Checklist

Status as of 2026-10-14: the sequential default review is complete through
ID 65134, and `bash tools/build.sh` produced a fresh unreviewed test ZIP after
all three localization binaries passed CSV round-trip checks. The user
confirmed in-game Korean rendering in the `zh_cn` setup without
`locatexts_en_us.characterset` or `fontlist_common.koafontlist`. The full
Windows installer and broader locale/font/PAK validation remain incomplete;
this is not a release-ready translation.

The active Korean working CSV folder is `work/zh_cn/`, and the user selected
the existing `zh_cn` slot to avoid overwriting the English resources used by
the earlier Korean patches. This preserves the English text for troubleshooting
and comparison. Its CSV structure matches the original `zh_cn` resources.
The original `fontlist_zh_cn.koafontlist` references Noto, so the current
package keeps the Noto resources but does not override the common font list.
The test confirms the user's tested setup; broader font coverage, Windows
installer behavior, and in-game functionality remain unverified.

## Candidate Package

The byte comparison in `references/data/PAK_DIFF.md` found 34 changes in the
blog-downloaded Korean PAK compared with the inspected original: three
localization binaries, 30 font resources, and one characterset file. The
current test ZIP omits the characterset and the common font list and contains:

- Three Korean `zh_cn` localization binaries:
  `locatexts_zh_cn.koalocatext_affix`,
  `locatexts_zh_cn.koalocatext_base`, and
  `locatexts_zh_cn.koalocatext_default`.
- Twenty-nine Noto font resources: `notosanscjksc_regular.font` and its 28
  `.ntx` pages.
- `KoreanPatch.ps1`, bilingual `README.txt`, and `SHA256SUMS.txt`.

The latest local ZIP is
`dist/20261014022153/KingdomsOfAmalur_Korean_zh_cn_TEST.zip`. It contains 32
payload files (three localization binaries and 29 Noto font resources), with
no common font list or characterset. Generated `dist/` packages are ignored
by Git and are not included in the source repository. Its ASCII-only English Windows script
prompts once for the game directory (default:
`C:\Program Files (x86)\Steam\steamapps\common\Kingdoms of Amalur Re-Reckoning`),
documents `cs:15032` as the supported baseline, then automatically proceeds
after the game folder is confirmed. It rebuilds the user's full PAK, verifies
the candidate, backs up the original, and then installs it. After installation,
the game language should be Chinese (Simplified).

The refreshed ZIP passed build-time localization round-trip and archive
integrity checks. Its included PowerShell script is byte-identical to the
ASCII-only source script. It has not yet been installed through the Windows
script or retested in-game.

This is a delta for the inspected game version, not a standalone PAK. Each
user needs their own complete original `data/patch_0.pak` to build a complete
replacement archive.

The inspected original PAK came from the user's Steam installation. The user
confirmed that the game's main menu displays `Version: cs:15032`; this is the
source game-version baseline for the comparison. Steam AppID `1041720`,
BuildID `10619381` in that installation's `appmanifest_1041720.acf` is
secondary provenance information. The archive has not been independently
matched against a depot manifest; the Korean test package has only the brief
five-minute in-game check noted above.

## Blocking Decisions and Risks

- The user selected `zh_cn` as the destination candidate to preserve English.
  The original locale font list references Noto. The user confirmed Korean
  rendered in-game without overriding `fontlist_common`; the test package
  therefore keeps the Noto font and glyph pages but omits the common list.
  Broader Hangul glyph coverage and other locale/font-role behavior remain
  unverified.
- The migrated work files now match `zh_cn` exactly: `base` 4,844 rows,
  `default` 65,135 IDs, and `affix` 3,451 rows, including key order. The 140
  additional `affix` rows use provisional same-ID Korean sibling fallbacks;
  review `work/zh_cn/audit/affix-extra-variant-review.tsv` and disposition
  each before treating them as final.
- Treat in-game `Version: cs:15032` as the source PAK baseline. Build and test
  the candidate against that same game version. Compatibility with later game
  versions is unverified; the file comparison does not establish it.
- The test ZIP intentionally omits `locatexts_en_us.characterset`. The user
  reported normal Korean output for about five minutes without it, so keep it
  excluded unless a later test reveals a character-display problem. Its
  purpose remains unknown.
- Do not treat the current files in `src/lang/` as release-ready: the three
  `en_us` localization binaries are byte-identical to the original English
  resources. `src/` remains immutable.

## Build and Validation Gates

- The README introduction, bilingual resource links, renamed reference paths,
  role-document links, `en_us`/`affix` compatibility note, and secondary
  Namu Wiki context reference were updated on 2026-10-07. Before publication,
  check Korean/English parity and verify every public link.
  `references/data/PAK_DIFF.md` is local-only because `references/data/` is
  Git-ignored; only `references/manual/` is included in the public repository.
- The sequential default-ID review is complete through ID 65134. The
  historical D-19725 global tally remains unreconciled because its 987-key
  membership is unknown; per user direction, accept this as a closed
  accounting limitation and do not repeat the review to reconstruct it.
- The user's sequence places package preparation before the consolidated
  review. Any package built at that stage is an unreviewed candidate, not an
  approved translation release. Later accepted review findings may require
  rebuilding it.
- [x] Generate the three `zh_cn` localization binaries from `work/zh_cn/`
  using the matching repackers.
- [x] Re-unpack the generated binaries and compare their CSV content with the
  working files: `affix` 3,451 rows, `base` 4,844, `default` 65,135.
- [x] Build a timestamped ZIP with 32 payload files, installer, instructions,
  and SHA-256 manifest; omit `fontlist_common.koafontlist` and
  `locatexts_en_us.characterset`.
- [x] User-reported initial in-game smoke test: Korean text displayed normally
  in the `zh_cn` setup without the common font list or
  `locatexts_en_us.characterset`.
- [ ] Run the PowerShell installer on Windows against game version
  `cs:15032`; confirm candidate creation, round-trip payload hashes, timestamped
  original backup, and safe replacement.
- [ ] Launch the game with Chinese (Simplified) selected and verify menu/UI,
  Hangul font rendering, dialogue, item descriptions, multiline strings, and
  locale-variant behavior.
- Test the built PAK in the matching game version with the selected
  replacement locale active. Check that English remains selectable if the
  package is intended to preserve it, and verify menu/system text, Hangul
  font rendering, dialogue, item descriptions, multiline strings, and
  locale-variant behavior.
- Record the tested game version, platform/store, tool versions, package
  manifest, validation results, and known limitations before calling the
  package release-ready.
- Do not claim successful in-game validation until it has actually been
  performed.
- [x] Public source repository created and pushed on 2026-10-14:
  `https://github.com/dongmasu/kingdomsofamalurrereckoning-ko-translate`.
  The intended exception is `references/manual/`; all other `references/`
  material, including original and comparison PAKs, remains ignored.
- `.gitignore` excludes `.DS_Store`, Python bytecode/caches, and generated
  `dist/` packages. The fresh test ZIP remains a local candidate, not a
  release asset; Windows installer and broader in-game validation remain
  incomplete.

## User-Directed Order

1. Project instructions and role boundaries (documented).
2. Bilingual README introduction, context, and source links (updated
  2026-10-07; user may review).
3. Prepare an unreviewed test ZIP before consolidated translation review
  (complete; rebuilt and round-trip validated 2026-10-14).
4. Initialize and publish the project to GitHub after the file allowlist and
  ignore rules are reviewed (in progress by explicit user request).
5. Complete final consolidated linguistic approval. Sequential default-ID
  review through 65134 is complete; if accepted findings change packaged
  text, rebuild and revalidate before calling it an approved release.
