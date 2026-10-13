# Disposition Batch: `default` IDs 62451-62500

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, official-manual terms, and structure.
- Four accepted corrections, 33 `not an issue` IDs, and 16 uncertain findings.
  Three uncertain findings overlap accepted structure corrections. These are
  working dispositions, not independent final linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Corrections

Decision D-18003 authorizes these targeted `Texto` corrections:

| ID | Previous Korean / structure | Applied Korean / structure | Rationale |
| ---: | --- | --- | --- |
| 62472 | Two internal separators were CRLF. | Two internal separators are LF. | Match all reference locales while preserving the three-line damage/duration/cost layout and every value. |
| 62491 | Eight poem separators were CRLF. | Eight poem separators are LF. | Match the source lineation while preserving all eight verse lines and the blank stanza break. |
| 62496 | `이제 내게 남은 건 여동생 아라(Aara)뿐이야.` | `이제 내게 남은 건 자매인 아라(Aara)뿐이야.` | English does not specify the sister's relative age; Japanese says older and Chinese younger. Reuse the age-neutral `자매` form accepted at D-8787 and D-14068. |
| 62500 | Nine internal section/paragraph separators were CRLF. | Nine internal separators are LF. | Match English, Japanese, and Chinese while retaining the three sections, headings, paragraph gaps, and all content. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18004 | 62451 | The conditional promise and group reference are preserved; Morkans may be a people, family, or faction, and locale number/name forms differ. |
| D-18004 | 62454 | The disabled-use warning is retained; `Scourge Damage` may be a formal gameplay label, and locales differ on its meaning. |
| D-18004 | 62456-62457 | The Mountain Prison route/facilities and threat sequence are preserved; Tine's role, floor-plan details, and the king/god identities need setting context. |
| D-18004 | 62460-62461 | The fate fragment is context-dependent; `Window Repeater` may be an internal/debug identifier or a player-facing label. |
| D-18004 | 62467 | Ardra's skill and favor are preserved; whether she is specifically a gladiator and the formal Championship name remain contextual. |
| D-18004 | 62469 | The ruin and deep-Sidhe location are retained; the canonical ruin name/location remains a lore question. |
| D-18004 | 62471-62472 | `Mad Dog` may be a title/name; the Ice/Piercing damage values are exact, but canonical DoT labels remain unverified. ID 62472's newline correction is separately accepted. |
| D-18004 | 62474 | The theft, concealment, and jail consequence are retained; `the rest of Dolve Arne` could mean people, estate, remains, or possessions. |
| D-18004 | 62480 | Korean preserves the infestation and kill-all objective; `scavs` may be a named creature or generic scavengers. |
| D-18004 | 62486 | All three castes are distinguished; canonical Korean forms for Scholars, Templars, and Praetorians need terminology review. |
| D-18004 | 62489 | Korean interprets capitalized `Counsel` as a council; Japanese instead uses an individual adviser, and the rescue-choice line lacks context. |
| D-18004 | 62491 | The poem's plot and verse layout are preserved; meter, Maid/Belmaid/Wencen references, and the Maid's role need literary/context review. ID 62491's newline correction is separately accepted. |
| D-18004 | 62500 | Manual-supported forms `알마인`, `바라니`, `도크알브`, `료스알브`, and `미사루` are retained; Voice of Three, chronology, names, and lore relations remain open. The lineation correction is separately accepted. |

## Not an Issue

Decision D-18005 records these 33 IDs: 62452-62453, 62455, 62458-62459,
62462-62466, 62468, 62470, 62473, 62475-62479, 62481-62485, 62487-62488,
62490, 62492-62495, and 62497-62499. These rows preserve available meaning,
voice, values, and structure.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean contain IDs 62451-62500 once and in
  identical ascending order.
- IDs 62472, 62491, and 62500 had matching embedded break counts, but Korean
  used CRLF for 19 internal separators where all three reference locales use
  LF. Normalize only those separators; retain all line counts, paragraph
  spacing, verse lines, and outer CSV record separators.
- All damage values at 62472 (10 Ice, 5 Piercing per second, 15 seconds,
  180 Mana) and recipe quantities at 62500 (3/2/1) are preserved.
- Rechecked source-keyed questions for Morkans (62451), Scourge Damage
  (62454), Mountain Prison/Tine (62455-62456), Tuatha king/god (62457), fate
  fragment (62460), Window Repeater (62461), Ardra (62467), Erathi ruin
  (62469), Mad Dog (62471), damage values (62472), Clyeth/Dolve heirlooms
  (62474), scavs (62480), gnome castes (62486), Counsel/slaves (62489), the
  Maid poem (62491), Aara's age (62496), invoices (62498), and the Almain
  record (62500). The official Korean manual's established terms were checked.
- Only the `Texto` cells at IDs 62472, 62491, 62496, and 62500 changed.
  Pre-edit SHA-256:
  `6c5a72c1eb52f824320eb4ab0a20025ce2350196c4f5d922a297176d665474d6`.
  Post-edit SHA-256:
  `8e7373bcd130c6bf662834d3f978be3e1c6d6f0ef93e01a630a1928eac8a4605`.
  Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-62451/locatexts_zh_cn.koalocatext_default.csv`.
- The UTF-8 BOM, 65,135 records, key order, and total 72,084 LF characters
  are preserved. Nineteen internal-break normalizations change aggregate
  counts from 72,040 CRLF/44 bare LF to 72,021 CRLF/63 bare LF; no outer CSV
  record separator changed.

D-18003 records four accepted corrections, D-18004 records 16 uncertain
findings (three overlap accepted IDs), and D-18005 records 33 `not an issue`
IDs. Direct register totals: 1,781 accepted, 15,417 `not an issue`, and
12,089 uncertain (29,287 dispositions total); next D-18006.

Resume at `default` ID 62501; 2,634 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
