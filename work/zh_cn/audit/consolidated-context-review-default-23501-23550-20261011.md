# Consolidated Context Review: `default` IDs 23501-23550

- Review date: 2026-10-11.
- Scope: the thirteen uncertainties in IDs 23501-23550 after the previous
  disposition pass.
- Result: all thirteen resolved (six accepted edits, seven `not an issue`).

## Decisions

| Decision | ID | Finding | Disposition | Rationale |
| --- | ---: | --- | --- | --- |
| D-18646 | 23506 | Forge Rhyderk | accepted | Change `제련` to `단조`: English says `Forge`, Japanese uses `鍛造する`, and Chinese uses `锻造`. Retain the established `라이더크(Rhyderk)` name form. |
| D-18647 | 23508 | Oracle / trust in her | accepted | Replace `그 여자` with neutral `그 사람`; the English referent is the Oracle, and Korean need not introduce a potentially dismissive gendered noun. Sacrifice, reward, reliability, and trust remain. |
| D-18648 | 23513 | Reddle Mane / Bruten / observers | not an issue | The completed tasks, speaker's plan to ask Reddle Mane, and contact objective are preserved. All three proper names are source-traceable in Korean. |
| D-18649 | 23515 | Detyre heat / skin exposure | accepted | Replace sunlight exposure with `이런 열기`: English leaves exposure broad in a heat-focused paragraph, and Japanese explicitly says the sensitive skin cannot endure heat. |
| D-18650 | 23516 | strongbox map / pocket key / coin | not an issue | The map, strongbox, pocketed key, payment, and return condition remain. Under English, `until you do` naturally refers to finding the map; Japanese and Chinese differ on the coin instruction, so English controls. |
| D-18651 | 23520 | Skorias / family to Whitestone | accepted | Remove the unsupported category word `사람들` from the Skorias name. The revised collective phrasing preserves English `are family` without deciding whether Skorias are a clan, people, or family. |
| D-18652 | 23525 | Rathir / brave souls / Tuatha invasion | accepted | Repair the awkward `침공 때 이후로` to `침공 이후로`; the comparison, rescue, and source-paired Rathir name remain. |
| D-18653 | 23530 | Fateweavers / initiation / reward | not an issue | Joining the group and the speaker's mistaken belief that it rewarded prior deeds are intact. `페이트위버` follows the established term and `입단` is supported by Japanese and D-1495. |
| D-18654 | 23533 | The Cradle of Winter / mad king | accepted | Render `a mad king` directly as `미친 왕`, and remove the Korean final period absent from English and Japanese. The title/subtitle relation and arrival of the endless winter remain. |
| D-18655 | 23535 | Tirin's Rest | not an issue | `티린의 안식처(Tirin's Rest)` is a source-traceable place-name rendering; Japanese identifies a lodging town and Chinese supports a resting-place sense. D-5385 accepts this same form in context. Corpus-wide place-name normalization remains a separate terminology task. |
| D-18656 | 23537 | curious creature / enter Ysa | not an issue | The return, curious address, and question about entering source-named Ysa are retained. Japanese's person reading and Chinese/English creature reading do not reveal a material Korean error. |
| D-18657 | 23539 | Mission is quiet | not an issue | Korean preserves the quietness and preference. Japanese identifies a monastery and Chinese a preaching group, supporting the religious-institution sense in `선교회`. |
| D-18658 | 23550 | Almain | not an issue | The active `알마인` matches the official Korean term established by D-093; untranslated English in the other source locales does not contradict it. |

The preliminary and initial disposition reports are retained as historical
records. These context decisions supersede their uncertain classifications
for the thirteen keys above. The broader Tirin's Rest spelling/place-type
question remains separate and is not silently generalized from this row.

## Edits and Verification

Only active Korean `Texto` at IDs 23506, 23508, 23515, 23520, 23525, and
23533 changed:

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 23506 | `라이더크(Rhyderk) 제련` | `라이더크(Rhyderk) 단조` |
| 23508 | `...예언자는 늘 믿을 만했고, 그 여자를 믿어도 된다는 걸 알아.` | `...예언자는 늘 믿을 만했고, 그 사람을 믿어도 된다는 걸 알아.` |
| 23515 | `...연약한 내 피부는 햇볕에 노출되는 걸 견디지 못하거든.` | `...연약한 내 피부는 이런 열기를 견디지 못하거든.` |
| 23520 | `...스코리아 사람들(Skorias)은 휘트스톤(Whitestone) 모두에게 가족 같은 존재거든.` | `...스코리아(Skorias)는 휘트스톤(Whitestone) 사람들 모두에게 가족 같은 존재거든.` |
| 23525 | `투아사 침공 때 이후로...` | `투아사 침공 이후로...` |
| 23533 | `...끝없는 겨울과 광기의 왕의 도래.` | `...끝없는 겨울과 미친 왕의 도래` |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-23501-23550-D18646-D18658/locatexts_zh_cn.koalocatext_default.csv`.

Pre-edit SHA-256:
`948c47834e4f0bd68b03a25b09e6947ad850d488cb265b84e121840a26fb0d90`.
Post-edit SHA-256:
`c8abbd0b753ab0fed0af39016c71bff89d51121e84d523073537fd78d0c98c38`.
Byte comparison against the backup confirms only the six listed physical
rows changed. The UTF-8 BOM, 65,135 data rows, row order, 72,011 CRLF
endings, and 73 pre-existing bare-LF endings remain unchanged.

English, Japanese source, Japanese-derived Korean, Chinese, and active Korean
each contain the thirteen reviewed IDs exactly once and in the same ascending
order. No runtime marker or intentional line-break discrepancy was found in
these thirteen entries. No source, Japanese archive, build, or distribution
file was modified.

D-18646-D-18658 resolves all thirteen uncertainties: six accepted and seven
`not an issue`. Totals are 2,082 accepted, 23,541 `not an issue`, and 12,901
uncertain (38,524 counted). Active default SHA-256:
`c8abbd0b753ab0fed0af39016c71bff89d51121e84d523073537fd78d0c98c38`.
Next D-18659 at ID 23551.
