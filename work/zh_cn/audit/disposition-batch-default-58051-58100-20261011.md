# Disposition Batch: `default` IDs 58051-58100

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- No accepted corrections, 32 `not an issue` IDs, and 18 uncertain IDs
  recorded in 17 findings.
- Language references are the immutable sources in `src/csv/en_us/`,
  `src/csv/ja_jp/`, and `src/csv/zh_cn/`. `work/ja_jp/` is a Korean
  migration draft, not the Japanese-language reference.

## Accepted Corrections

No translation CSV cells were changed. Open terminology and context
questions remain explicitly uncertain.

## Uncertain Findings

| Decision | ID(s) | Rationale |
| --- | ---: | --- |
| D-17514 | 58055 | `Eastern Sewers Henge` is retained; whether Henge is a named structure/place and the established Korean sewer-region term need context. |
| D-17515 | 58063 | Shrine conduit and partial divine power are preserved; the activation function and trailing conditional need scene context. |
| D-17516 | 58064 | Conqueror's battlefield presence, stagger strike, and strong defenses are retained; canonical class-description terminology needs alignment. |
| D-17517 | 58067 | Rebuilding the Well with more prismere and owing a debt for rescue are retained; the named-Well status and established term remain open. |
| D-17518 | 58071 | The standalone `First Scaith` label is preserved; its canonical name form and relation to other Scaith references need alignment. |
| D-17519 | 58072 | Magic critical-hit potion, Alchemy Workbench, and quantities 3/2/2/1 are preserved; reagent names need canonical glossary alignment. |
| D-17520 | 58073 | Mithros/Crownhold contrast between savagery and elegance/history is retained; proper-name spellings remain provisional. |
| D-17521 | 58077 | Adessa's funding and open mines are retained; English “keeps Ironfast Keep in mail” is ambiguous, and Korean interprets it as arming the keep. |
| D-17522 | 58085 | Faith disillusionment and wish for the farce to end are preserved; Arkes and Anokatos spellings and the force of “delusions” need alignment. |
| D-17523 | 58086 | The quest instruction is clear; Grim Onwig's canonical spelling remains provisional. |
| D-17524 | 58087 | The speaker's contrast with another's comfort in plants/people is retained; Korean follows English on the absence of perceived order/structure, while Japanese is less explicit. |
| D-17525 | 58090 | Three initiates, chapter departure, named suspects, and suspicion are preserved; whether `chapter` is a branch or formal institution remains open. |
| D-17526 | 58091 | The Praetorian Garrison label is retained descriptively; official military-unit/location terminology varies by locale. |
| D-17527 | 58093 | Scholia Arcana honors respected, accomplished spellcasters with relics; canonical organization and award terminology need alignment. |
| D-17528 | 58095 | Safe river crossing and a hill keep suitable as a fortress are preserved; the conditional geography remains contextual. |
| D-17529 | 58096-58097 | Resolve to see the Tuatha burn and the later belief about not becoming a great sorcerer are retained; names and Fateweaver context remain provisional. |
| D-17530 | 58098 | The last-hero/first-sellsword contrast and rescue of the Order are preserved; `Order` may be more specific than the English warrants when rendered `기사단`. |

## Not an Issue

The 32 IDs are 58051-58054, 58056-58062, 58065-58066, 58068-58070,
58074-58076, 58078-58084, 58088-58089, 58092, 58094, and 58099-58100.
They preserve the evident meaning, voice, mechanics, or UI function.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 58051-58100 once
  and in identical ascending key order; each full default file has 65,135
  data records.
- The recipe at 58072 retains five embedded newline characters in all
  locales; the equipment values at 58084 retain one embedded line break.
- Recipe quantities at 58072 (3, 2, 2, 1), equipment values at 58084
  (+8 Physical Damage, +20% Longsword Damage), and source/runtime identities
  are preserved. No runtime markers occur in this range.
- Reconciled the historical source-keyed entry for IDs 58050-58149.
  Applicable prompts for this batch remain represented as uncertainties
  above; prompts outside this batch remain for their own reports.
- The preliminary scan's `fd5c...` CSV hash is a historical scan-time value.
  Decision D-17408 later changed only ID 57811; the active CSV hash is
  `8420482cfd46245e38bfe93c546f346ba2e45ad0ce39c1ef2054d8aeda000336`.
- The byte-identical pre-batch backup is
  `/private/tmp/ko-translate-backups/20261011/before-58051/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `8420482cfd46245e38bfe93c546f346ba2e45ad0ce39c1ef2054d8aeda000336`).
  No translation CSV cell changed. The active CSV retains its UTF-8 BOM,
  65,135 records, key order, 72,045 CRLF endings, and 39 pre-existing
  bare-LF endings.

D-17514 through D-17530 record 17 uncertain findings covering 18 IDs;
D-17531 records the remaining 32 `not an issue` IDs. Direct register totals:
1,703 accepted, 12,218 `not an issue`, and 10,955 uncertain (24,876 total);
next D-17532.

Resume at `default` ID 58101; 7,034 IDs remain through ID 65134. Findings
are working dispositions, not independent final linguistic approval.
