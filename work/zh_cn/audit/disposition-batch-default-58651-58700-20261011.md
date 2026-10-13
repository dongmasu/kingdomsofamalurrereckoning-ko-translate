# Disposition Batch: `default` IDs 58651-58700

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- Three accepted corrections, 32 `not an issue` IDs, and 15 uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- The pre-batch CSV matched the preceding checkpoint and was backed up
  byte-for-byte before editing.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-17743 | 58690 | `... 악명 높은 해적왕을 죽이려는 내 여정을 계속할 수 있도록 ...` | `... 위험한 해적왕을 죽이려는 내 여정을 계속할 수 있도록 ...` | English `deadly` and Chinese `致命的` describe danger/lethality; Japanese says fearsome. `악명 높은` instead means notorious, as the separate English `notorious` at 60797 confirms. |
| D-17744 | 58698 | `#NAMED_ICON_360_LB# 운명의 시간 모드 #NAMED_ICON_360_RB#` | `#NAMED_ICON_360_LB# 레코닝 모드 #NAMED_ICON_360_RB#` | Apply established game terminology from accepted decision D-079; both controller markers and their order remain unchanged. |
| D-17745 | 58699 | `무운다운 야영지에서 널 찾고 있어.` | `무운다운 야영지에서 네가 필요해.` | Restore English `They need you at Camp Moondown` and Japanese/Chinese readings; remove the unsupported search action. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17728 | 58651 | `Tenders` and `Delvers` are capitalized and may be formal House of Sorrows roles; active Korean alternatives vary. |
| D-17729 | 58652 | `Code` may mean a rulebook, code of conduct, or organizational system; the label lacks its referenced document context. |
| D-17730 | 58654 | English's `surrounded ettin` is awkward; Japanese/Chinese read the ettin as nearby, leaving the charm's agent/status unresolved. |
| D-17731 | 58655 | The unfinished `Dishonesty` quotation is preserved without completion; whether the fragment and ellipsis are intentional needs context. |
| D-17732 | 58657 | `Casts you down` can mean defeat, destroy, or physically knock down; locales differ and the Korean chooses ruin. |
| D-17733 | 58658 | The identity and canonical Korean spelling of Halcyor are not established by the question alone. |
| D-17734 | 58659 | The Siege of Moondown is clear, but the event/place-name forms vary across the corpus and locales. |
| D-17735 | 58664 | All six displayed fable lines and the threat to the young are retained; the Rattlesnake/Desert Runner predator-prey relation remains open. |
| D-17736 | 58667 | `Votive of Stone` may name an item or describe a generic offering; locales categorize it differently and no UI context is available. |
| D-17737 | 58669 | All runtime markers are retained; Korean follows English/Chinese marker order while Japanese places `{1}` after the salvage label. The marker wording/UI behavior remains a terminology question. |
| D-17738 | 58671 | The prospecting joke and forceful Jottun charge are retained; whether `full bull rush` names an attack is unknown. |
| D-17739 | 58672 | Unusual lodging and the welcome to Adessa are retained; the isolated line does not identify the referent of `there`. |
| D-17740 | 58678 | `Twilight Pass` is translated as `황혼 고개`; other active Korean forms vary, and no canonical place-name form is established here. |
| D-17741 | 58682 | The sailing sendoff is preserved per English/Chinese; Japanese shifts to Rathir's heart, and whether Rathir means the city, people, or a ship is unknown. |
| D-17742 | 58684 | Korean preserves the teasing observation of the competition; whether the gladiator is scouting a rival rather than watching the event needs context. |

## Not an Issue

Decision D-17746 records these 32 IDs: 58653, 58656, 58660-58663, 58665-58666,
58668, 58670, 58673-58677, 58679-58681, 58683, 58685-58689, 58691-58697,
and 58700. These rows preserve the English-led meaning, voice/register, and
structure. At 58686, Korean follows the explicit English permission condition;
the differing Japanese/Chinese readings do not establish a Korean error.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 58651-58700 once
  and in ascending order; the full resources contain 65,135 records with
  matching key order.
- The fable at 58664 retains its six displayed lines and stanza spacing.
  At 58669 the `{LINE_SPACE}`, `{1}`, `{*1salvage}`, and `{*1components}`
  marker identities are retained. Japanese alone moves `{1}` after the
  salvage label; Korean follows English and Chinese.
- The `#NAMED_ICON_GRAY_PS3_CIRCLE#` marker at 58693 and both 360 controller
  markers at 58698 are preserved in their source positions. The +5%
  Physical Damage at 58691 is unchanged.
- Reconciled the source-keyed historical prompts for IDs 58650-58749.
  Open prompts are recorded above; accepted corrections are limited to the
  three supported cells.
- The preliminary scan's stored active-default hash differs from the actual
  pre-batch checkpoint. The checkpoint and byte-identical backup both
  verified as `a16f77dba0bb6c5795ce71e9c258537368aa09653b668e8cde86fd599ab98f53`;
  the scan hash was not used as the edit baseline.
- Pre-edit CSV SHA-256:
  `a16f77dba0bb6c5795ce71e9c258537368aa09653b668e8cde86fd599ab98f53`.
  Post-edit CSV SHA-256:
  `21a1c477f5770af596fac3cd799849a49bac61dd68828c1bb0b20306c6392eed`.
  Diff verification found only the three accepted `Texto` cells changed.
  UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
  pre-existing bare-LF endings are preserved.
- The byte-identical pre-batch backup is
  `/private/tmp/ko-translate-backups/20261011/before-58651/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `a16f77dba0bb6c5795ce71e9c258537368aa09653b668e8cde86fd599ab98f53`).

D-17728-D-17742 record 15 uncertain findings; D-17743-D-17745 authorize
three edits; D-17746 records the remaining 32 `not an issue` IDs. Direct
register totals: 1,716 accepted, 12,612 `not an issue`, and 11,148 uncertain
(25,476 total); next D-17747.

Resume at `default` ID 58701; 6,434 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
