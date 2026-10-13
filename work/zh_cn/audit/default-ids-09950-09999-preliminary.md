# Preliminary Language Scan: `default` IDs 9950-9999

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 9950-9999.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, the historical open-question log, and recurring
  terms in the active Korean corpus.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 9954 | `your results` / gift found on the beach | Retain the unspecified type of result, but check whether the Korean sentence clearly separates the gift from the results. | English does not identify the results. Korean preserves that uncertainty, though `결과와 함께 해변에서 네게 줄 걸 하나 주웠어` can momentarily attach the results to the found object. | Medium |
| 9956 | `Kollossae - ACT Test - Male` | Determine whether this is internal actor/animation metadata or player-facing text before deciding whether to localize it. | English and Korean retain the label; Japanese localizes only part and Chinese translates the components. The row alone does not establish where it appears. | Medium |
| 9957 | Tirin's Rest / refugee exclusion | Preserve the speaker's hostility toward Fae and refugees, while checking the Korean final clause. | The Korean ends `티린의 안식처에서는.` with a locative particle and no predicate. The fragment is less complete than the source's emphatic exclusion; Japanese also identifies the location as the boundary of the rejection. | High |
| 9958 | `scarecrow` as a nickname | Preserve the callback and grateful tone; verify only that this is the previously established player nickname. | Korean keeps the nickname and the speaker's gratitude without adding a new implication. | Medium |
| 9959 | `Amulet of the Sun` / `the Crossing` | Confirm established artifact spelling and whether the Crossing is a place/realm; retain the access consequence. | Korean preserves that the amulet grants the right to descend to the Crossing. Japanese and Chinese also treat it as a destination, though they differ in wording. | Medium |
| 9964 | `Stealth` tutorial | Align the skill label with the project's established UI term and retain the unseen-attack and theft benefits. | Korean preserves both effects and their conditions; its `은신` wording agrees with the earlier eye-meter tutorial. | Medium |
| 9966 | `Hope of the Fatesworn` / final test | Confirm the artifact title and align its spelling with `Fatesworn`; retain all three completed prerequisites before confronting Telogrus. | Korean preserves crafting Chaos Weapons, obtaining protection from Chaos magic, defeating Skald's minions, and readiness to fight Telogrus. The title and transliteration remain provisional. | Medium |
| 9968 | `hidden man` → `은둔자` | Check whether the source means a recluse or simply an elusive/hidden person. | English and Japanese emphasize concealment/disappearance; `은둔자` can imply a settled life of isolation not stated by the source. The uncertainty is local to the description, not Grim Onwig's identity. | Medium |
| 9970 | Nyralim / Dalentarth | Align the recurring name spelling. | This row has `니라림`; earlier active rows including IDs 390, 1499, and 6501 use `니랄림(Nyralim)`. The Korean name is missing the `ㄹ` found in the repeated form. | High |
| 9974 | Warsworn / Jory / broken sword hilt | Align the faction rendering and retain that the hilt is the reward for killing the Haxhi trolls. | The Korean meaning is intact, but `전쟁서약단` differs from the recurring `워스원(Warsworn)`; ID 61894 refers to the same Declan/Jory/Haxhi context and uses `워스원`. | High |
| 9976 | `Freemen` → `자유민들` | Check faction-name treatment against the corpus convention. | The meaning is clear, but active rows use `프리맨(Freemen)`, `자유민(Freemen)`, and `자유민들`. This row is understandable but the proper-name/display policy remains unsettled. | Medium |
| 9982 | Thais / debate | Confirm the character's Korean spelling and whether `debate` is a formal challenge. | Korean preserves the instruction and readiness condition. The name is transliterated without English, while the corresponding names in other locales vary phonetically. | Medium |
| 9985 | Requiem / harbor | Confirm the ship's canonical Korean display name; preserve the speaker's surprise at its arrival. | Korean's `레퀴엠 호` clearly reads as a vessel and retains the sense that this was a sight the speaker never expected to see. | Medium |
| 9993 | `Localization Production` | Classify as internal metadata or player-visible text; do not translate speculatively. | All English/Korean text remains identical; Japanese also leaves the label in English, while Chinese translates it. No context in this row proves visibility. | Medium |
| 9994 | `Ordination Tome` | Confirm whether this is a named ritual text and whether `서품의 서` matches established Korean terminology. | The dialogue fragment is preserved. English, Japanese, and Chinese all connect the book to ordination, but the exact rite/title remains context-dependent. | Medium |
| 9996 | `The Hierophant` → `대사제` | Keep the English-source title as the semantic basis and confirm canonical terminology. | Korean matches Chinese and the active corpus's recurring `대사제`; Japanese uses `Guide`, so that difference remains a source-reference conflict rather than proof of an error. | Medium |
| 9997 | Preordained / Freehold | Keep faction and place/territory senses distinct and align their display forms with recurring entries. | Korean retains both as `예정된 자들` and `자유 영지`, forms used elsewhere in the active corpus. Whether `Freehold` should carry an English parenthetical is part of the unresolved name-display convention. | Medium |
| 9988 | `Summer brethren` / `progression of nature` / Summer Realms | Check the kinship wording and render `progression` naturally in the nature context. | Korean `여름 형제들` can imply literal brothers, while the corpus commonly uses `여름 페이`; `자연의 ... 진보` is also unusually abstract/technological. Japanese and Chinese likewise emphasize nature's growth/development. | Medium |

## Historical Audit Reconciliation

- Rechecked the historical questions for IDs 9954, 9956-9959, 9964,
  9966, 9970, 9974, 9982, 9985, and 9993-9997 against the active
  English, Japanese, Chinese, and Korean rows.
- Added active-row and cross-corpus checks for IDs 9957, 9968, 9970,
  9974, 9976, and 9988.
- Historical candidates remain evidence only; none authorizes a translation
  edit.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys and order.
- Actual CSV record line-break counts, brace-token sequences, and runtime
  markers match across all four locales throughout this range.
- No active CSV structure or text was changed. The active CSV hashes remain
  the checkpoint values in `preliminary-work-20261007.md`.
- Official Korean manual terminology was not independently searchable in
  this environment; do not treat name and term questions above as settled.

## Batch Status

IDs 9950-9999 received one preliminary reading. Findings are candidates and
open questions only; they are not confirmed review dispositions and do not
authorize edits.
