# Disposition Batch: `default` IDs 58301-58350

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- Two accepted corrections, 33 `not an issue` IDs, and 15 uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not the
  Japanese-language reference.

## Accepted Corrections

Decisions D-17606 and D-17607 authorize these targeted `Texto` corrections:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 58313 | `음유시인, 곡예사, 재주꾼, 무용수` | `음유시인, 저글러, 곡예사, 무용수` | English distinguishes `jugglers` from `tumblers`; Chinese likewise distinguishes juggling/acrobatics from tumbling, while Japanese compresses the performers. The correction preserves both listed roles instead of making them overlap. |
| 58319 | `이제는 무의미하게 썩어 가는 육신일 뿐이야.` | `이제는 흔적도 없이 썩어 가는 육신일 뿐이야.` | English `rotting to nothingness`, Japanese `無へと腐りゆく`, and Chinese `腐化为乌有` describe bodies decaying into nothing, not decaying meaninglessly. |

The byte-identical pre-edit checkpoint backup is
`/private/tmp/ko-translate-backups/20261011/before-58301/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `b3df129cd0f225781f6337a2d643e90a67d7ab5f3ec9168c3cab0b8ea27ca1fb`).
Post-edit active default CSV SHA-256:
`60e4e69d0f0ac9d09bcd66480d8eaee68194b4acafbdfe5cf1963ba97c457c99`.
Only the `Texto` cells at IDs 58313 and 58319 differ from that backup.

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17608 | 58302 | High Roll and Range Roll remain distinguishable, but the canonical Korean game names and exact High Roll mechanic are not established by this row. |
| D-17609 | 58304 | English names the ability `Break Ward`; Japanese and Chinese describe breaking protective magic/seals, but its canonical Korean ability label is unknown. |
| D-17610 | 58305 | `FAIL LINE` is retained across English, Japanese, and Korean, while Chinese localizes it; whether the label is player-facing or internal remains unverified. |
| D-17611 | 58309 | The passage retains Dolve Arne, the speaker's weapons, and the staff condition. Proper-name spelling and exact location context remain open. |
| D-17612 | 58315 | `VIII` is preserved, but the canonical Korean enemy name for `Chaos Thrall` remains unresolved. |
| D-17613 | 58320 | The education and intellectual role of the Scholars are preserved; whether `Scholars` is a formal gnome class or group needs lore context. |
| D-17614 | 58321 | The surprised discovery of Belen's Testament is retained, but the entity's canonical Korean name and organization/faith status remain open. |
| D-17615 | 58325 | The fall of all three Houses under Gadflow is preserved; their faction identity and established Korean naming convention are unresolved. |
| D-17616 | 58329 | The sunrise, lingering fog, distant cries/battle, silence, and ambush site are preserved; Gornak Ree's canonical spelling remains provisional. |
| D-17617 | 58331 | The House of Ballads' role in preserving heroic legends through song is retained; the House/faction's canonical Korean name remains open. |
| D-17618 | 58332 | The southern location and wartime destruction are preserved; Tywili's canonical Korean spelling remains provisional. |
| D-17619 | 58334 | The English source has an unclosed parenthetical around the Hidden Destiny implementation note; Korean and Japanese preserve the source defect while Chinese closes it. The lore meaning of `Crux` is also unresolved. |
| D-17620 | 58335 | The approximate quantity of fifteen glands is retained. Japanese specifies poison glands, but English does not; the gland type cannot be confirmed from the English source alone. |
| D-17621 | 58337 | Korean reads `Order` as generic order/orderliness; English capitalization permits a named-organization reading, and the exact referent is unclear. |
| D-17622 | 58341 | The nostalgia for color, dance, music, and freedom is retained; the referent of `it`, Aara Lollyrs, and the relationship to Irion require context. |

## Not an Issue

Decision D-17623 records these 33 IDs: 58301, 58303, 58306-58308,
58310-58312, 58314, 58316-58318, 58322-58324, 58326-58328, 58330, 58333,
58336, 58338-58340, and 58342-58350. They preserve evident meaning,
voice/register, structure, markers, and values. Accepted and uncertain IDs
are not included in this list.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 58301-58350 once
  and in identical ascending order; each full default resource contains
  65,135 records.
- The `{3}%`, `{1}`, `{2}` sequence at 58326 and
  `#NAMED_ICON_DIALOG_STANDARD#` at 58323 are retained. `VIII` at 58315 and
  the approximate fifteen-gland quantity at 58335 are intact.
- ID 58334 has an incomplete English parenthetical; Chinese adds a closing
  parenthesis that is absent from English, Japanese, and Korean. ID 58344
  retains its four embedded newline characters (five poem lines) in all
  locales. Other line-break counts in the batch match.
- Reconciled the source-keyed historical prompts for IDs 58250-58349.
  Applicable open questions are recorded above; they remain uncertain
  rather than being treated as accepted corrections.
- The active CSV retains its UTF-8 BOM, 65,135 records, key order, 72,045
  CRLF endings, and 39 pre-existing bare-LF endings.

D-17606-D-17607 record two accepted corrections; D-17608-D-17622 record
15 uncertain findings; D-17623 records the remaining 33 `not an issue` IDs.
Direct register totals: 1,710 accepted, 12,380 `not an issue`, and 11,036
uncertain (25,126 total); next D-17624.

Resume at `default` ID 58351; 6,784 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
