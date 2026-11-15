# Sequential `default` Revalidation: IDs `24500`-`24749`

- Date: 2026-11-12.
- Compared all 250 active Korean entries with same-ID English, Japanese, and
  Chinese for meaning, naturalness, register, terminology, names, and format.
- Rechecked 66 existing ledger records and added 184 previously unrecorded
  IDs. Ten new correction-candidate IDs were recorded; eight existing
  candidates were retained.
- No translation CSV, immutable source, extracted asset, or localization
  binary changed.

## Correction Candidates

These are review findings, not approval to edit the translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `24506` | Speech level / naturalness | Korean uses polite endings throughout (`있죠`, `정확하겠군요`, `섬깁니다`), while Japanese uses plain conversational forms. Consider a consistent plain rendering, such as `그래, 어떤 의미에서는 순례자라고 할 수 있어. 선교사라고 하는 게 더 적절하겠군. 우린 신을 섬기고 그분의 뜻을 따라.` No individual speaker is inferred. | Medium-high |
| `24546` | Terminology / name pairing | `Niskaru Lord` is rendered `니스카루(Niskaru) 군주`, pairing only the species name. Use the complete creature/rank form `니스카루 군주(Niskaru Lord)`, consistent with the same term elsewhere, while retaining the mountain-prison detail. | High |
| `24578` | Name / format | The letter says the gnome mage came from `the Scolia Arcana`, but Korean has only `아르카나 학술회`, omitting the first part of the organization name. Consider `스콜리아 아르카나(Scolia Arcana)`; preserve the source's spelling `Scolia` rather than silently changing it to the separately attested `Scholia`. | High |
| `24600` | Format / item-name pairing | The complete item label `Flawless Mitharan Infected Rivets` is paired only at `Mitharan`. Consider pairing the full label, e.g. `완벽한 미타란 감염 리벳(Flawless Mitharan Infected Rivets)`. | High |
| `24639` | Format / title pairing | The capitalized epithet `Child of Dust` is rendered `먼지의 자손` without its English pairing. Add the exact source form, e.g. `먼지의 자손(Child of Dust)`, without conflating it with the distinct `Child of the Dust` wording. | High |
| `24648` | Terminology | The suffix `of the Seer` is rendered `예언자의`, but the established Fate role `Seer` is `선견자(Seer)`. Use `선견자의` in this item-name fragment; preserve its fragment structure. | High |
| `24660` | Duplicate-source consistency / objective form | English, Japanese, and Chinese match `Defeat the First Sword` exactly with ID `35478`, but Korean differs: `퍼스트 소드 처치` versus `제일검(First Sword) 물리치기`. Align the translation to the established paired name and action-form objective, e.g. `제일검(First Sword) 처치하기`. | High |
| `24718` | Meaning / naturalness | `cast some down` contrasts with lifting others up; `내친다` can instead mean rejecting or driving someone away. Consider `리리아(Lyria)는 실제로 어떤 이들은 끌어올리고, 어떤 이들은 아래로 떨어뜨려`, preserving the parallel contrast. | Medium-high |
| `24722` | Naturalness / imagery | `술을 마셔도 눈에서 씻어 낼 수 없는 것들` is a literal and awkward rendering of the memories/images that remain. Japanese explicitly conveys being unable to forget. Consider `아무리 술을 마셔도 눈앞에서 지워지지 않을 것들`, preserving the visual image. | Medium-high |
| `24730` | Format / item-name pairing | The complete label `Master Mitharan Immunity Lining` is paired only at `Mitharan`. Consider `장인의 미타란 면역 안감(Master Mitharan Immunity Lining)`, without inferring an equipment slot. | High |

## Rechecked Existing Findings

- Existing candidates `24589`, `24590`, `24624`, `24661`, `24666`, `24693`,
  `24716`, and `24729` were rechecked against all four languages and retained.
- The 60 exact-English duplicate groups touching this range (1,212 corpus
  rows) have matching Korean except `Defeat the First Sword` (`24660`,
  `35478`), whose Japanese and Chinese sources are identical; the mismatch is
  recorded above.
- Logical line-break counts and normalized runtime/control-token signatures
  match across all four languages for every ID in this range.
- Asset links, NPC symbols, handler counts, row adjacency, and numeric ID
  sequence were not treated as proof of an individual speaker or playback
  order.

After recording this range, the ledger contains 35,311 of 65,135 IDs
(54.21%), leaving 29,824. Sequential coverage reaches ID `24749`; the next
range is `24750`-`24999`.
