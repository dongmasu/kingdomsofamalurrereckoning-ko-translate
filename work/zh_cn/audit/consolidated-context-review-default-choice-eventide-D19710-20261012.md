# Consolidated Context Review: Choice, Gnome, Eventide (D-19710)

- Date: 2026-10-12.
- Scope: D-5160-D-5161, D-5163-D-5164, D-5166,
  D-5168-D-5172, D-5174, D-5176-D-5177, D-5179-D-5180:
  16396, 16399, 16401-16405, 16410-16414, 16421-16425,
  16428-16430, 16432, 16434, 16439-16444, 16448-16449,
  16459, 16474 (32 distinct keys).
- Checked English/Japanese/Chinese and the exact active Korean,
  including all paragraphs of the Varani trading guide at 16448.
  English anchors meaning; Japanese supports idioms/register;
  Chinese cross-checks titles and item labels. Consulted the
  official Korean manual extraction for general setting and
  Varani context. No PAKs.

## Decisions

- `accepted` (3): 16396 `내가 널 고르면 어쩔 건데?` ->
  `내가 널 선택한다면?` (English/Japanese/Chinese give a neutral
  choice question, not a hostile challenge); 16432
  `노움들의 타락` -> `그 노움의 타락` (English `the gnome's`,
  Japanese singular `あのノーム`); 16459
  `이브닝타이드(Eventide)` -> `이븐타이드(Eventide)`
  following D-3188 and the active name form at IDs 641/819/1200/1562.
- `not an issue` (29): 16399, 16401-16405, 16410-16414,
  16421-16425, 16428-16430, 16434, 16439-16444,
  16448-16449, 16474. The literal Pillars label, Gadflow's
  winter, familiar idiom, not-for-sale response, Hunt boast,
  Three Swords blades, role-playing disclosure, dialogue, named
  geography, Hierophant prayer, library and artifact labels,
  five-paragraph Varani trading advice, Seranon and neutral
  `Good luck` retain English meaning. `FAIL LINE` remains literal,
  matching English/Japanese internal-looking UI label; no
  invented user-facing text. D-5162/16400 was accepted in
  D-19654; D-5178/16453 was accepted originally. Not recounted.

## Integrity and Resume

- Pre-edit SHA-256
  `3d23f71fbb5935e465542e1529f72b0d86634aaa349c2a8035a4ca6b97de8411`.
- Byte-identical backup
  `/private/tmp/ko-translate-backups/20261012/before-choice-gnome-eventide-D19710/locatexts_zh_cn.koalocatext_default.csv`.
- Active SHA-256
  `52301ece556632221cf0a9cac2e9315c49233f4255bc45c72c7239d7d87f9a79`.
- Three exact inverses reconstruct backup; BOM, 72,011 CRLF,
  73 pre-existing bare LF, row order and all other bytes preserved.
- Totals **3,374 accepted / 33,845 not an issue / 1,305 uncertain**
  (38,524). Next unresolved D-5182 / ID 16478.
