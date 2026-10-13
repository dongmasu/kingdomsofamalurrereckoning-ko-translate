# Preliminary Language Scan: `default` IDs 38051-38100

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 38051-38100 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, available historical terminology notes, line
  breaks, runtime markers, values, and recurring terms.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 38052 | Aewin Rathgar / `에윈 래스가` | Standardize the personal name against the game's established Korean spelling and bilingual-name practice. | Korean includes the source spelling in parentheses; Japanese and Chinese use other phonetic forms. No canonical form is established by this row alone. | Medium |
| 38066 | `getting more farmers up into those webs` | Treat the unusual image as a source/context question; verify whether farmers are being sent into the webs or whether the line refers to harvesting spider silk. | Korean and Chinese follow the English farmer/web image. Japanese instead says to have people gather spider silk, indicating an unresolved source/context interpretation. | Medium |
| 38073 | Domus Politica / `정치회관` | Reconcile this repeated institution name with the provisional naming choice at ID 38018 and the project's proper-name convention. | Korean uses a translated name and adds `Domus Politica` in parentheses. Japanese renders a records-office concept and Chinese a government concept. | Medium |
| 38077, 38087 | Theater of Fate / `운명의 극장` | Preserve the English venue reading and note the Japanese-only altar interpretation; keep the duplicate Korean rows consistent. | Both English rows and the Korean translations say Theater. Japanese uses `運命の祭壇` (“altar of Fate”), while Chinese agrees with the theater reading. | Medium |
| 38081 | Testament's influence / `유언장(The Testament)의 영향` | Determine whether Testament is the named Belen faction/institution rather than a document or will; standardize the faction reference. | The capitalized English term names an influence. Korean's `유언장` suggests a legal document, while Japanese and Chinese identify a Belen covenant/order. Historical audit notes already leave the Testament/Belen referent open. | High |
| 38082 | Fae Cairn / Lorestone / `페이의 무덤돌` | Keep the distinction between the Fae Cairn and Lorestone, but carry forward the unresolved Korean object name rather than treating it as a confirmed burial site. | Korean preserves the stated relation and Echo Stone use. Earlier audits document competing `케언`, `돌무덤`, and `고분` forms and uncertainty about the structure's function. | Medium |
| 38093 | `SpellAmmoInstant` / `즉시 발동 주문 탄약` | Determine whether this is player-facing UI or an internal/debug identifier before deciding whether to localize it. | English uses a concatenated implementation-style label; Korean translates it, while Japanese adds a localized gloss. The row alone does not show where it appears. | Medium |
| 38098 | Warden / `감시관` | Standardize the formal office/title and preserve the instruction to report suspicious activity to Herc Adwold. | Korean retains the report target and identifies him as Warden, but uses `감시관` twice in one short line. Earlier audits repeatedly leave Warden's institutional meaning and Korean form open. | Medium |
| 38107 | “We did nothing to deserve this fate” | Record a Chinese source-locale meaning divergence; Korean follows English and should not be changed on the basis of the Chinese line. | English, Japanese, and Korean say the group did nothing to deserve its fate. Chinese instead says the group owes everything to the listener. This reverses the meaning. | High |
| 38108 | `{3}`, `{1}`, `{2}` | Preserve all three positional values and retain the English order in Korean. | English, Chinese, and Korean use `{3}`, `{1}`, `{2}`. Japanese places `{2}` before `{1}` for localized syntax; no marker is missing. | High |
| 38121 | House of Ballads / `발라드 가문` | Align the named faction/institution with the established corpus term without deciding its canonical Korean form here. | Korean uses a translated House/family form; Japanese transliterates the English name, and Chinese also uses a family term. Existing audits track recurring House of Ballads variants. | Medium |
| 38128 | Gallows End / `갤로우스 엔드` | Carry forward the documented place-name consistency issue; do not normalize this occurrence in the preliminary pass. | Korean uses one phonetic rendering. The consolidated audit records numerous competing literal and phonetic forms for Gallows End. | Medium |
| 38132 | Silken Seat / `실크 좌석` | Verify whether this capitalized name is a venue/inn rather than a generic seat, and preserve the proper-name reading if context confirms it. | English capitalizes the phrase; Korean reads literally as a silk seat, Japanese uses an inn-like name, and Chinese uses a generic soft seat. | Medium |
| 38133 | `TestTest` / `테스트` | Determine whether the repeated text is a test/debug label or intended visible content; Korean does not preserve the repetition. | The source repeats “Test” twice, Japanese also repeats it, and Korean contains it once. UI context is unavailable in the row. | Medium |
| 38139 | Pyrderi / `피르데리` | Verify the place name and possible source spelling against the established Pryderi references. | English spells this occurrence `Pyrderi`; nearby corpus terminology includes `Pryderi`. Korean follows the current source pronunciation, so the discrepancy should be resolved against game context rather than silently normalized. | Medium |
| 38150 | Aron Excavations / Motus competition | Preserve that Aron Excavations is Motus' only competitor and that the competition is not strong. | Korean retains both claims and the dismissive tone. The site/company distinction and recurring Motus/Aron names remain terminology/context questions. | Low |

IDs 38051, 38053-38065, 38067-38072, 38074-38076, 38078-38080,
38083-38086, 38088-38092, 38094-38097, 38099-38106, 38109-38120,
38122-38127, 38129-38131, 38134-38138, and 38140-38149 generally retain
the English meaning on this first reading. Proper names, lore, register,
and UI context remain subject to integrated review.

## Historical Audit Reconciliation

- The historical source-keyed open-question log does not cover this range;
  its documented gap includes IDs 37700-40349. No historical disposition
  is inferred for IDs 38051-38100.
- Existing consolidated audit notes were applied to the recurring
  Testament/Belen, Fae Cairn/Lorestone, Warden, House of Ballads,
  Gallows End, and Pryderi terms. These remain open candidates.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 38051-38100 once
  and in identical order.
- Embedded line-break counts match across all four locales.
- Detected runtime markers match except for the documented Japanese order
  difference at ID 38108. All three markers are present in every locale.
- The +1% experience value at ID 38101 is preserved. No translation CSV or
  immutable source file was edited.

## Batch Status

IDs 38051-38100 received one preliminary reading. Their working dispositions
are recorded in
[`disposition-batch-default-38051-38100-20261010.md`](disposition-batch-default-38051-38100-20261010.md);
this preliminary report itself is not independent linguistic approval.
