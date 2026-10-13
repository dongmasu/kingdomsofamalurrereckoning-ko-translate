# Preliminary Language Scan: `default` IDs 40351-40400

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 40351-40400 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 40352 | `맹세의 칼날` for `Oathblade` | Confirm whether Oathblade is a formal order/rank or a literal blade reference and standardize its Korean form. | English capitalizes the standalone term. Korean translates it literally; Japanese reads it as a mercenary rank and Chinese retains an oath-blade form. Prior reports leave its institutional meaning open. | Medium |
| 40355, 40361 | `하이페리안`; Eamonn/Eagonn; Warsworn arms | Standardize Hyperian, Eamonn/Eagonn, Niskaru, and Warsworn forms while preserving the false prophet's acquisition of the Hyperian and the father-to-son knowledge transfer. | Korean retains the plot claims. The lore names and faction spelling vary across the active corpus; historical notes identify these terms for review. | Medium |
| 40359 | `{*1투구 숨기기}` | Preserve the control-marker identity while checking the official localized label and the distinction between hiding a helmet and retaining its bonuses. | Korean localizes the visible payload and explicitly preserves the armor-stat benefit. Japanese/Chinese also localize the label; no marker-identity change is indicated. | Medium |
| 40367, 40369 | `배신의 제단`; `성서` for Altar of Betrayal/Sacred Text | Confirm the named altar and whether Sacred Text should be a neutral sacred writing rather than a Bible-like book. | Korean retains the question and the demand to surrender the text. English duplicates “the” at 40369; the Korean naturally omits this source typo. | Medium |
| 40370 | `완벽한 미사란 수선 안감` for Flawless Mitharan Mending Lining | Standardize Mitharan separately from Mitharu and confirm the crafting-component terms for Mending Lining. | Korean preserves the modifier and item-part sense; the active corpus has differing Mitharan/Mitharu spellings and the source-keyed log flags this item. | Medium |
| 40371-40372 | `대장 챔피언`; `남은 것들` | Confirm the arena title Grand Champion and whether What Remains refers to survivors, remnants, or other remaining things. | Korean retains the Grand Champion's praise followed by the money-making aside. The standalone `What Remains` label is context-light; Japanese reads “survivors,” while Korean/Chinese are more general. | Medium |
| 40378, 40387 | `먼지의 아이`; `먼지의 자식들` for Dustling/Children of Dust | Standardize the named people/taunt while preserving the speaker's demand that they know their place and have come to face their hunters. | Korean retains the challenge and uses related semantic forms. Earlier audits flag Dustling/Children of Dust as named-group terminology. | Medium |
| 40383 | `전투 만능가` for `dilettante of combat` | Preserve the source's unusual class description without silently treating `dilettante` as an approved game class or as an unequivocal compliment. | English's phrase is unusual and calls for context. Korean interprets it positively as a combat all-rounder; Japanese similarly describes a capable fighter, while Chinese also praises combat breadth. | Medium |
| 40384 | Mystic Hammer / Hall of the Firstsworn / Sacred Passage | Standardize the named hammer, Firstsworn institution, and route name while preserving the forge/reforging requirement. | Korean retains the complete sequence. The locale references differ on whether the Firstsworn site is a hall or shrine and how to render Sacred Passage; prior terminology questions remain open. | Medium |
| 40386 | `계급의 지혜가 결정을 좌우` | Preserve that decisions follow rank-based authority/wisdom without making “wisdom of rank” more concrete than the source supports. | Korean closely follows the unusual English metaphor. Japanese converts it to orders from above, while Chinese also retains wisdom of rank; institutional context is needed. | Medium |
| 40388-40389 | Quickling; `방문` for `The Visitation` | Confirm whether Quickling is a formal species/name and whether Visitation is a named event or a generic visit. | Korean preserves the learned-to-change novelty claim and translates the standalone label literally. English capitalizes Visitation; prior notes leave its category open. | Medium |
| 40395-40396 | Whispering Witch; title/tapestry metaphor | Preserve that the Witch possessed Bridget Malloi and the contrast between others' lack of control over the tapestry and the addressee's power. | Korean retains possession and the bitter-lie metaphor. The exact scope of the title and tapestry reference remains lore-dependent. | Medium |
| 40400 | `치명타 피해 증가` | Preserve the generic critical-hit damage effect as a UI label; confirm whether the game supplies its numeric magnitude elsewhere. | English and Korean provide no numeric value in this row. The Korean label is a concise equivalent; no value should be invented. | Low |

IDs 40351, 40353-40354, 40356-40358, 40360, 40362-40366, 40368,
40373-40374, 40376-40377, 40379-40382, 40385, 40387, 40390-40394,
40397-40399 generally retain the English meaning on this first reading.
Proper names, lore, and UI categories remain subject to integrated review.

## Historical Audit Reconciliation

- `work/zh_cn/audit/from-ja_jp/open-questions.md` has a source-keyed entry
  for IDs 40350-40449. Its overlapping questions include Oathblade,
  Hyperian, Private Ilver, Helmet Hiding, Assassin's Art, Warsworn,
  Sacred Text, Grand Champion, Master Makers/city-state terms, Dustling,
  combat dilettante, Mystic Hammer/Sacred Passage, rank wisdom, Quickling,
  Visitation, Whispering Witch, the tapestry, and related lore.
- These questions were checked against the active rows. No global
  terminology change is authorized.
- The official Korean manual could not be text-searched in this environment;
  no manual-based terminology claim is made here.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 40351-40400 once
  and in identical order.
- Embedded line-break counts match. ID 40359 preserves the `{*1}` marker
  identity while localizing its visible label. No gameplay numeric
  discrepancy was detected.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 40351-40400 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 40401.
