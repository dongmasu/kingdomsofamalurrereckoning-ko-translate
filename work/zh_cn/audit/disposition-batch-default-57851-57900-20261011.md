# Disposition Batch: `default` IDs 57851-57900

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- No accepted corrections, 27 `not an issue` IDs, and 23 uncertain IDs
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
| D-17424 | 57851 | The four-line poem preserves its images and progression, but `pyhril` may be a named tree or material; retain the current form pending terminology context. |
| D-17425 | 57854 | The volunteer messenger role and delivery of Death Notices to bereaved families are preserved; the formal name and established Korean term remain open. |
| D-17426 | 57855 | Damage range 40-66 and 16 Mana are preserved; the canonical Korean skill and Physical Damage terms need terminology alignment. |
| D-17427 | 57856 | `{LINE_CENTER}` and the FMOD label are intact; whether this technical/company string is intended player-facing text is unknown. |
| D-17428 | 57857 | The warning about madness and the beautiful, empty place is preserved; the scene referent of “standing up there” is unavailable. |
| D-17429 | 57858 | The speaker's claim of competence despite recently drinking and the self-conscious preface are preserved; scene context could refine the nuance. |
| D-17430 | 57859 | The three-part philosophical question about breath, a cold body, and changed identity is retained without resolving what constitutes true death. |
| D-17431 | 57860 | The jail and direct address are preserved; canonical Korean spellings for Mel Senshir and the location remain provisional. |
| D-17432 | 57861 | The humorous rooster prophecy and all 15 embedded line breaks are retained; Artal, Lystrom, “the Oracular,” Fateweaver, and joke nuances need context/term alignment. |
| D-17433 | 57863 | The promise not to risk the group's lives, guarded Armor of Ohn, and aspiration beyond humans or Alf are retained; artifact and people-name forms remain provisional. |
| D-17434 | 57864 | “A lot,” `$DLC1_Diplomacy.trade_cost_large$`, and `#NAMED_ICON_GOLD#` are preserved; the best Korean quantity-label form remains contextual. |
| D-17435 | 57868 | The wolf-necklace and discharge-paper clues and follow-up are preserved; names and Alfar Military terminology need alignment. English/Japanese gender the captain, while Korean's neutral `대위` avoids adding a gender. |
| D-17436 | 57869-57870 | Both capitalized labels are preserved as a wounded maiden and Victor's Brew; whether these are canonical quest/item names and their Korean forms remain open. |
| D-17437 | 57872 | The experiment, unconsciousness, reward, report request, and guardian warning are preserved; Bristletongue, Summer Court, and Font need canonical term review. The English source typo is not reproduced. |
| D-17438 | 57875 | The return/rediscovery sequence is retained; `Unbound path` may be a formal ideology or named route, so the current descriptive form remains provisional. |
| D-17439 | 57881 | The severed close ties, joining, and Black Odeon are preserved; canonical faction and place-name forms need alignment. |
| D-17440 | 57883 | The Hierophant's authority over Travelers after Grim's rebellion is preserved without gendering singular `their`; the title's canonical form remains open. |
| D-17441 | 57884 | The relative ability to manipulate local magic is retained; Bisarane's spelling and the precise “if not as easily” comparison remain provisional. |
| D-17442 | 57888 | The coin and commendation offer is preserved; English “the order” does not identify a knightly order, so Korean `기사단` may be too specific. Retain pending faction context. |
| D-17443 | 57890 | The blunt contrast is retained; “the fallen” may mean the defeated or the dead, while Korean `패자` follows the loser reading also present in Japanese/Chinese. |
| D-17444 | 57895 | The 25% chance is preserved; English/Japanese capitalize Reflection while Korean uses a generic reflection-trigger label, and the named-effect status is unconfirmed. |
| D-17445 | 57896 | The question about the landing party is retained; whether this means a ship's landing party or another deployed group is not established by the row. |

## Not an Issue

The 27 IDs are 57852-57853, 57862, 57865-57867, 57871, 57873-57874,
57876-57880, 57882, 57885-57887, 57889, 57891-57894, and 57897-57900.
They preserve the evident meaning, voice, and item/UI function.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 57851-57900 once
  and in identical ascending key order; each full default file has 65,135
  data records.
- Embedded newline counts match across all four locales: ID 57851 has three,
  ID 57855 has one, and ID 57861 has 15. The poem and prophecy lineation is
  preserved.
- `{LINE_CENTER}` at 57856 and both `$DLC1_Diplomacy.trade_cost_large$`
  and `#NAMED_ICON_GOLD#` at 57864 match across locales. Quake damage
  (40-66), Mana cost (16), and Reflection chance (25%) are preserved.
- Reconciled the historical source-keyed entry for IDs 57850-57949. The
  prompts applicable to this range remain represented as uncertainties
  above; prompts for IDs outside this batch remain for their own reports.
- The preliminary scan's `fd5c...` CSV hash is a historical scan-time value.
  Decision D-17408 later changed only ID 57811; the active CSV hash is
  `8420482cfd46245e38bfe93c546f346ba2e45ad0ce39c1ef2054d8aeda000336`.
- The byte-identical pre-batch backup is
  `/private/tmp/ko-translate-backups/20261011/before-57851/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `8420482cfd46245e38bfe93c546f346ba2e45ad0ce39c1ef2054d8aeda000336`).
  No translation CSV cell changed. The active CSV retains its UTF-8 BOM,
  65,135 records, key order, 72,045 CRLF endings, and 39 pre-existing
  bare-LF endings.

D-17424 through D-17445 record the 22 uncertain findings covering 23 IDs;
D-17446 records the remaining 27 `not an issue` IDs. Direct register totals:
1,703 accepted, 12,115 `not an issue`, and 10,858 uncertain (24,676 total);
next D-17447.

Resume at `default` ID 57901; 7,234 IDs remain through ID 65134. Findings
are working dispositions, not independent final linguistic approval.
