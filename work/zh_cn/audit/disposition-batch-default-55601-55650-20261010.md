# Disposition Batch: `default` IDs 55601-55650

- Date: 2026-10-10. Compared all 50 active IDs with English, Japanese,
  Chinese, the preliminary scan, source-keyed historical notes, previous
  terminology decisions, lineation, runtime markers, and numeric values.
  These working dispositions are not independent final linguistic approval.
- Zero accepted corrections, 38 `not an issue` IDs, and 12 uncertain IDs.

## Uncertain Findings

| ID | Decision | Rationale |
| ---: | --- | --- |
| 55601 | Uncertain | The suggestion to kill Argine is clear, but the Japanese/Chinese phonetic forms differ from the retained English/Korean spelling; canonical Korean form remains open. |
| 55602 | Uncertain | Korean follows English/Chinese `25% Mana`; Japanese specifies 25% of maximum Mana. The intended gameplay denominator is not established by the row. |
| 55604 | Uncertain | Korean correctly reads `take on` as performing/imitating a Jottun, supported by Japanese and Chinese; the canonical Korean creature name remains unsettled. |
| 55605 | Uncertain | The isolated `Savant` label may be a formal rank or a generic learned person; Japanese and Chinese interpret it differently. |
| 55608 | Uncertain | `Luxembourg` may be a country/name or a standalone test string; the locale references do not settle its function. |
| 55614 | Uncertain | The paired Eldest, Alarane and Caelrod, and the return-to-open-path objective are preserved; canonical forms for Eldest and Great Scale remain open. |
| 55620 | Uncertain | Deirdre's offer and the Keep Library translation objective are preserved, and the Korean consistently corrects the English typo `Dierdre`; canonical Deirdre and Gallows End forms need corpus alignment. |
| 55627 | Uncertain | The item quality, Mitharan attribution, and Grip component are retained, but the specialized equipment meaning and canonical term for `Assailing Grip` are not established. |
| 55631 | Uncertain | The Craft Hall leader's importance is conveyed, but the institution's canonical Korean name and bilingual-name convention remain open. |
| 55632 | Uncertain | The five awakened Windstones, remaining locations, chime action, and gate-opening condition are retained; canonical Windstone and chime terminology remains unsettled. |
| 55636 | Uncertain | The Eye of Amman is identified as a magical token made by Fae Amman the Clever; official Korean forms for the artifact and creator remain open. |
| 55646 | Uncertain | The isolated `Echo of Fate` label is translated and preserves the source name, but whether it is an item, title, or UI label is unknown. |

## Not an Issue

The remaining 38 IDs preserve the apparent English meaning and structure.
This includes the generic `Power` restoration label at 55623, the surface-
guardianship metaphor at 55639 (supported by Japanese despite the literal
Chinese reading), and the Ljosalfar/Wolf Pack sharpshooter description at
55649. Unresolved terminology above is deferred without speculative edits.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 55601-55650 once
  in identical ascending order; each default CSV contains 65,135 records.
  The batch has one embedded newline, at ID 55602, in all four locales.
- Rechecked the source-keyed historical entry for IDs `55550-55649`.
  It raises the Mana denominator, Jottun/Savant, Luxembourg, Eldest/Great
  Scale, Deirdre/Gallows End, Power, Assailing Grip, Craft Hall,
  Windstones/chime, Eye of Amman, and shepherding-metaphor questions. These
  prompts are not accepted corrections.
- The preliminary scan records a `default` hash of
  `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`,
  which is stale relative to the current file. The pre-batch active CSV and
  byte-identical backup both hash to
  `b7f2d4e954b22835187090dafa6559abdd1de6e4dd97b99706d757b4d7733e84`.
- No translation CSV edit was made; the active CSV remains at SHA-256
  `b7f2d4e954b22835187090dafa6559abdd1de6e4dd97b99706d757b4d7733e84`.
  Its UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
  pre-existing bare-LF endings are preserved.
- Pre-batch backup:
  `/private/tmp/ko-translate-backups/20261010/locatexts_zh_cn.koalocatext_default.before-resume-55601.csv`
  (SHA-256 `b7f2d4e954b22835187090dafa6559abdd1de6e4dd97b99706d757b4d7733e84`).

Decisions D-16781 through D-16793. Direct register totals after this batch:
1,630 accepted, 10,959 `not an issue`, and 10,322 uncertain (22,911 total);
next D-16794.

Resume at `default` ID 55651; 9,484 IDs remain through ID 65134. The next
preliminary scan is
[`default-ids-55651-55700-preliminary.md`](default-ids-55651-55700-preliminary.md).
