# Disposition Batch: `default` IDs 56901-56950

- Date: 2026-10-11. Rechecked all 50 active Korean rows against the
  English, Japanese, and Chinese source CSVs under `src/csv/`, the active
  Korean CSV, historical audit prompts, line breaks, runtime markers,
  values, and terminology. English was the semantic anchor; Japanese
  informed voice/register and Chinese was supporting evidence. These
  working dispositions are not independent final linguistic approval.
- One accepted correction, 36 `not an issue` IDs, and 13 uncertain findings.

## Accepted Correction

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56919 | `이 야영지는 음유시인과 가수, 곡예사와 저글러, 그리고 막이 내린 뒤에도 함께하는 이들의 터전이야.` | `이 야영지는 음유시인과 가수, 곡예사와 저글러, 커튼콜을 하는 이들의 터전이야.` | English/Japanese use `curtain-calls`/curtain call in a list of performers, and Chinese describes performers taking a bow. The old Korean recast the stage term as people remaining together after the curtain falls. `커튼콜` restores the performance image without changing the list's casual poetic tone. |

## Uncertain Findings

| ID | Decision | Rationale |
| ---: | --- | --- |
| 56903 | Uncertain | `half-felt apology` may mean partly sincere or half-hearted; Japanese and Chinese lean toward insincere/apparently perfunctory, while English remains ambiguous. |
| 56904 | Uncertain | `Font of the Crossing` may be a named spring, sacred font, or place; English says Narca's affliction, Japanese a baptismal font/power, and Chinese a sacred spring/effect. Korean's “curse” is plausible but narrows the source. |
| 56913 | Uncertain | Henge/Kollossae forms differ across locales; Korean preserves the transport device and city-to-surface direction. |
| 56914 | Uncertain | `Prismere` is consistent as the material/entity, but the Korean corpus contains competing spellings. |
| 56915 | Uncertain | `Playing Crownhold` may be a performance/appearance or a game/match; Japanese and Chinese favor performance while English is ambiguous without activity context. |
| 56916 | Uncertain | The magical object/trap's reliance on sight and the stealth result are preserved, but the referent of “it” is implicit and the mechanic needs context. |
| 56920 | Uncertain | The notice's route, timing, destination, walking-stick clue, and reward are preserved; canonical proper-name forms and exact notice phrasing remain open. |
| 56926 | Uncertain | English compresses whether the stone was already hewn/quarried or the warriors quarried it; Japanese and Chinese differ on that sequence. Korean combines the readings. |
| 56933 | Uncertain | `Hoarders in the Sewer` may be a faction, quest, or descriptive title; Korean uses a descriptive plural. |
| 56938 | Uncertain | English capitalizes `Cradle`; Japanese supplies “Cradle of Summer,” while Korean treats it as a generic place name. |
| 56941 | Uncertain | Korean's `글공부에 소질` conveys the “head for letters” idiom; formal institution/name treatment for `Scholia` remains to be aligned. |
| 56943 | Uncertain | The wasteland route is preserved, but Tala-Rane's canonical Korean spelling remains open. |
| 56945 | Uncertain | The intellectual contest with Xeno is preserved; canonical Korean name spelling remains open. |

## Not an Issue

The remaining 36 IDs are 56901-56902, 56905-56912, 56917-56918,
56921-56925, 56927-56932, 56934-56937, 56939-56940, 56942, 56944, and
56946-56950. They preserve evident meaning, register, values, and structure.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and active Korean each contain IDs
  56901-56950 once in ascending order. Each default file has 65,135 records
  with identical full key order.
- Line-break counts match throughout. `{1}` at 56910 is retained in the
  same position. `+6%` fire damage at 56902 and `+20%` stun duration at
  56918 are preserved; no numeric discrepancy was identified.
- Reconciled historical prompts in `56850-56949`, including the Font/Narca,
  Prismere, Playing Crownhold, sight-dependent trap, curtain-calls, Eldric's
  notice, quarrying sequence, Hoarders in the Sewer, Cradle, Scholia,
  Tala-Rane, and Xeno.
- ID 56950 is the first row of the next historical range `56950-57049`.
  It was reviewed once here as this batch's final row and dispositioned
  `not an issue`; do not count or disposition it again in the following
  `56951-57000` batch.
- Only the approved `Texto` cell at 56919 changed. The active CSV retains
  its UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
  pre-existing bare-LF endings. Post-edit SHA-256:
  `333016dfb93c55119c1093c64e26fd8e9885ee6ed575f4eca994383a102ffe3a`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-56901/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `41e22e7989b15ea6f2e8e459f30c566fa4e9c1c6272d6eba6796c4223f9e6b48`).

Decision D-17152 records the accepted correction; D-17153 through D-17165
record the 13 uncertain findings; D-17166 records the remaining 36
`not an issue` IDs. Direct register totals: 1,674 accepted, 11,922
`not an issue`, and 10,624 uncertain (24,220 total); next D-17167.

Resume at `default` ID 56951; 8,184 IDs remain through ID 65134. The next
preliminary scan is
[`default-ids-56951-57000-preliminary.md`](default-ids-56951-57000-preliminary.md).
These are working dispositions, not independent final linguistic approval.
