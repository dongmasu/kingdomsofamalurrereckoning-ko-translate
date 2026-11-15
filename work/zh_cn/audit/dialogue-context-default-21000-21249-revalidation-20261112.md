# Sequential `default` Revalidation: IDs `21000`-`21249`

- Date: 2026-11-12.
- Compared all 250 active Korean rows with same-ID English, Japanese, and
  Chinese for meaning, naturalness, register, terminology, names, and format.
- Rechecked 58 existing ledger records and added 192 previously unrecorded
  IDs. Three existing correction candidates and one evidence-limited hold were
  retained; one existing row was reclassified as a candidate.
- Recorded 17 new correction findings affecting 18 IDs and three new
  evidence-limited holds, one overlapping a correction candidate.
- No translation CSV, immutable source, extracted asset, or localization
  binary changed.

## Correction Candidates

These are proposals for separate review, not approval to edit the translation
CSV.

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `21007` | Naturalness | `remain legendary among my people` is rendered `우리 민족 사이에서 영원히 전설로 남을 거야`, an awkward collocation. Consider `우리 민족에게 영원한 전설로 남을 거야`. | High |
| `21011` | Naturalness / meaning | `Magic's mistress` is translated literally as `마법의 여주인`, which is awkward in Korean. Consider a more natural rendering such as `마법을 다스리는 여신이자 운명의 여신이지`; retain the explanation that fate is magic's deepest weave. | Medium |
| `21013` | Name / title pairing | `Maid of Windemere` is paired as `(Maid of Windemere)`, omitting the exact article in the source title `The Maid of Windemere`. Consider `윈더미어의 시녀(The Maid of Windemere)`, consistent with the established `시녀(The Maid)` form. | High |
| `21022` | Format | The particle in `탈라레인(Tala-Rane)를` does not match the final consonant of the Korean name. Change `를` to `을` while preserving the sentence. | High |
| `21023` | Name / title pairing | `Maire, Queen of Cups` is rendered `컵의 여왕 메어(Maire)`, so the English pairing identifies only the person and omits the title. Consider `컵의 여왕 메어(Maire, Queen of Cups)`. | High |
| `21027` | Terminology / format | The weapon names are `장검, 대검, 망치`, unlike the official-manual and established forms `롱소드, 그레이트소드, 해머`; `막기 후` is also less natural than a completed action. Consider `롱소드, 그레이트소드, 해머로 막은 뒤 특수 공격을 할 수 있게 됩니다.` Preserve the localized `{*1[...]}` wrapper and line break. | High |
| `21041` | Naturalness / tense | The scenario shifts from present (`나타납니다`, `짓누릅니다`, `말합니다`) to past (`바위였고`). Consider keeping the scenario in present tense: `광활한 사막을 건너던 당신과 동료 앞에 바위 하나가 나타납니다. 그 바위는 공중에 떠 있고, 동료를 짓누릅니다. 동료가 당신에게 이렇게 말합니다:` | Medium-high |
| `21061` | Meaning | `Your Captain needs you` says the captain needs the addressee, not that the captain is looking for them. Consider `대장님이 자네를 필요로 하셔.` | High |
| `21108` | Name / item-label format | The full label `Mitharan Platinum Lightning Guard` is represented only by the partial pairing `미타란(Mitharan)`; the rest of the named item lacks its English label. Consider pairing the complete label atomically as `미타란 백금 번개 방어구(Mitharan Platinum Lightning Guard)`. | Medium |
| `21114` | Title pairing | The standalone title `Hunter's Thoughts` is translated without its English title. If this is the displayed work/title, consider `사냥꾼의 생각(Hunter's Thoughts)`. | Medium |
| `21129` | Organization / name pairing | Capitalized `The Watch` is the organization that held the key; Korean `감시대` does not identify the source name. Consider `감시대(The Watch)` if the established organization name is intended. | Medium |
| `21131` | Item-label format | The named label `Ratofer's Kerchief` currently pairs only its owner as `라토퍼(Ratofer)의 손수건`. Consider pairing the complete item label as `라토퍼의 손수건(Ratofer's Kerchief)`. Its Korean item noun remains on hold below. | Medium-high |
| `21152` | Terminology | In `There is only one true pattern... It is the Authority's`, `권능자의 것` reads as “belonging to an authority-holder.” The established deity/name form is `권능(Authority)`. Consider `그건 권능(Authority)의 것이지`, retaining the following reverent reference. | Medium-high |
| `21153` | Name pairing | The named unit `Keloren's Legion` is rendered `켈로렌 군단` without the English name, while the adjacent `Alfar Army` is paired. Consider `켈로렌 군단(Keloren's Legion)`. | High |
| `21167` | Faction-name pairing | The established factions `Summer Court` and `Winter Court` appear as `여름 궁정` and `겨울 궁정` without English, although nearby proper names are paired. Consider `여름 궁정(Summer Court)과 겨울 궁정(Winter Court)`. | Medium-high |
| `21173`, `21175` | Title pairing | Both lines use capitalized `Champion` as the Valor Arena winner's title, but Korean `챔피언` is unpaired. Consider `챔피언(Champion)` in both lines; do not expand it to the distinct title `Champion of Valor` without source evidence. | Medium |
| `21185` | Naturalness | `싸움이 나도 들키지 않고 빠져나오는 것 역시 그렇지` is difficult to parse as the second of two specialties. Consider `자물쇠 따기랑 싸움에서 들키지 않고 빠져나오는 게 특기야.` | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `21065` | Meaning / terminology | Capitalized `the Sorrows` is described as a collection of magical energy. Japanese says `嘆きの力`, while Chinese uses `悲灵`; the sources do not establish whether this is a named force or a generic concept. Retain `비탄의 힘` provisionally rather than guessing a replacement. |
| `21075` | Meaning / wordplay | `What cost the lot by sea?` / `Five-and-nine by night` is rendered `바닷길로 화물을 보내는 값` / `밤에는 다섯에 아홉`. Japanese reads the answer as 59, while Chinese instead gives a number of bushels. The riddle's intended unit or wordplay is unresolved; do not normalize it from one reference alone. |
| `21131` | Meaning / item identity | The English `Kerchief` is rendered `손수건` in `default`, but the matching `base:3783` label uses `스카프`; Japanese uses `スカーフ`, and Chinese varies between `方巾` and `头巾`. The text does not establish how the item is worn, so retain the lexical choice pending item/context evidence. This overlaps the complete-label pairing candidate above. |

## Rechecked Existing Findings

- `21039` remains a naturalness candidate: the English deliberately calls the
  addressee a `specimen`, while that literal Korean wording can sound like a
  laboratory sample. The prior TRSQ02 finding is retained.
- `21085` remains a naturalness candidate: `실수로 입을 흘렸다` is an
  unnatural rendering of `accidentally let slip`. The prior SQ41 finding is
  retained.
- `21103` remains on hold because `the mortal maid` may be an ordinary
  servant or a story-role reference; the asset does not map this key to a
  speaker or scene stage.
- `21147` remains a shared-source consistency candidate with IDs `2732` and
  `18639`. The English sentence is identical, but its Korean differs at
  `21147`; the prior SQ126 comparison and proposed alignment are retained.

## Duplicate And Structural Checks

- All four language tables contain the 250 IDs in the same order. The range
  touches 59 exact-English duplicate groups (1,088 corpus rows); Korean
  wording is identical within every group.
- Logical line-break counts match across all four languages. This includes
  the wrapped weapon ability at `21027`, structured component text at
  `21170`, and two-paragraph statue description at `21235`.
- Runtime-variable and localized-wrapper structure is preserved. At
  `21211`, Japanese places the button token before the “hold” label, while
  English, Chinese, and Korean place the label first; Korean matches English
  and Chinese. Localized text inside `{*1[...]}` at `21027` is expected to
  differ by language.
- Asset associations and serialized handler order were not used to assign
  speakers, dialogue branches, or playback order.

The ledger now contains 32,724 of 65,135 IDs (50.24%), leaving 32,411.
Sequential review reaches ID `21249`; the next range is `21250`-`21499`.
