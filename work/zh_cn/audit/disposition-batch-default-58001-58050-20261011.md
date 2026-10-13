# Disposition Batch: `default` IDs 58001-58050

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- No accepted corrections, 21 `not an issue` IDs, and 29 uncertain IDs
  recorded in 22 findings.
- Language references are the immutable sources in `src/csv/en_us/`,
  `src/csv/ja_jp/`, and `src/csv/zh_cn/`. `work/ja_jp/` is a Korean
  migration draft, not the Japanese-language reference.

## Accepted Corrections

No translation CSV cells were changed. Open terminology and context
questions remain explicitly uncertain.

## Uncertain Findings

| Decision | ID(s) | Rationale |
| --- | ---: | --- |
| D-17491 | 58001 | The standalone character name is preserved, but Japanese and Chinese provide different phonetic forms; canonical Korean spelling remains provisional. |
| D-17492 | 58002 | Scion, destructor, blessing, and corrective power are retained; whether `destructor` is a title and what “our mistake” refers to need lore context. |
| D-17493 | 58003 | The failed adjustment to Cape Solace and weak imitation of former life are retained; the precise force of `pantomime` remains contextual. |
| D-17494 | 58005 | The compact Mass Effect Armor Buff label is retained; debug/test versus player-facing purpose is unknown. |
| D-17495 | 58006 | The charm delivery, thanks, and coin for trouble are retained; the charm's canonical item name remains open. |
| D-17496 | 58009 | The insult is directed at Han in all references; name spelling and vocative punctuation remain context-dependent. |
| D-17497 | 58012 | The boast and price qualification are preserved, but Korean shifts “at my prices” toward whether the buyer accepts them, softening the pricing punchline. |
| D-17498 | 58015-58016 | Teithi's fear of the Testament and First Scaith are retained; proper-name, organization, and place forms differ across locales. |
| D-17499 | 58020 | The expected return and shared-goal caveat are preserved; “if only in this case” may limit cooperation more specifically than the Korean phrasing. |
| D-17500 | 58021 | Kandrian Keep's inherited political-center role is retained; canonical place-name form remains open. |
| D-17501 | 58022 | The book-series description and Black Arick's adventures are preserved; “the Spritely One” may be a title/wordplay beyond the literal `요정 같은 자`. |
| D-17502 | 58023-58024 | Household crest, medallion, survey, company, and Adessa relations are preserved; Grilricas, Motus Mining Interests, and Gallows End forms need alignment. |
| D-17503 | 58026 | Winter's rot, learned magic, and the first-Delver relation are retained; whether the narrator became the first Delver or followed another in that role is ambiguous across locales. |
| D-17504 | 58027 | Half-eaten bread, haste, and the non-animal clue are retained; Eathe's canonical Korean name remains provisional. |
| D-17505 | 58029 | The skeptical question is retained; the short `scav` reference may identify a particular creature group or species. |
| D-17506 | 58032 | The Crows' repeated escape from fate is retained; capitalized `Fate` may be personified, and team-name form needs consistency. |
| D-17507 | 58033-58034 | Lobby failure and cancellation are clear; the project-manager label may be internal/test-only and its localization purpose is unknown. |
| D-17508 | 58036 | The standalone Great Scale label is translated literally; canonical setting terminology and capitalization need alignment. |
| D-17509 | 58038-58039 | Sewer caretaking and Alfar Army are preserved; official army/faction naming remains provisional. |
| D-17510 | 58041-58043 | The ruler's historical judgment, Comoros, and study of Chaos-creature weaknesses are preserved; names and historical context need alignment. |
| D-17511 | 58046 | The Casual difficulty prompt and achievement warning are preserved; Japanese says Easy while English/Chinese say Casual, requiring game/UI context. |
| D-17512 | 58049-58050 | Both standalone names are preserved phonetically; canonical Ayten and Stylidi forms remain open. |

## Not an Issue

The 21 IDs are 58004, 58007-58008, 58010-58011, 58013-58014, 58017-58019,
58025, 58028, 58030-58031, 58035, 58037, 58040, 58044-58045, and
58047-58048. They preserve the evident meaning, voice, and UI/item function.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 58001-58050 once
  and in identical ascending key order; each full default file has 65,135
  data records.
- The Burn potion at 58010 has three embedded newlines in all locales.
  Trigger, temporary duration, 50% chance, Tindertwig (2), and Edelweiss
  (1) are preserved. `XXII` at 58011 is unchanged; no runtime markers occur
  in this range.
- Reconciled the historical source-keyed entry for IDs 57950-58049.
  Applicable prompts for this batch remain represented as uncertainties
  above; prompts outside this batch remain for their own reports.
- The preliminary scan's `fd5c...` CSV hash is a historical scan-time value.
  Decision D-17408 later changed only ID 57811; the active CSV hash is
  `8420482cfd46245e38bfe93c546f346ba2e45ad0ce39c1ef2054d8aeda000336`.
- The byte-identical pre-batch backup is
  `/private/tmp/ko-translate-backups/20261011/before-58001/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `8420482cfd46245e38bfe93c546f346ba2e45ad0ce39c1ef2054d8aeda000336`).
  No translation CSV cell changed. The active CSV retains its UTF-8 BOM,
  65,135 records, key order, 72,045 CRLF endings, and 39 pre-existing
  bare-LF endings.

D-17491 through D-17512 record 22 uncertain findings covering 29 IDs;
D-17513 records the remaining 21 `not an issue` IDs. Direct register totals:
1,703 accepted, 12,186 `not an issue`, and 10,937 uncertain (24,826 total);
next D-17514.

Resume at `default` ID 58051; 7,084 IDs remain through ID 65134. Findings
are working dispositions, not independent final linguistic approval.
