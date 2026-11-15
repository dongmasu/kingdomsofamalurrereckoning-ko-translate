# Sequential `default` Revalidation: IDs `23250`-`23499`

- Date: 2026-11-12.
- Compared all 250 active Korean entries with same-ID English, Japanese, and
  Chinese, including existing findings, prior context decisions, terminology,
  register, and layout.
- Rechecked 74 existing ledger records and added 176 previously unrecorded
  IDs. Ten new candidate IDs and four evidence-limited holds were recorded.
  Nine prior candidates remain open, one obsolete candidate was cleared, and
  one prior hold remains unresolved.
- No translation CSV, immutable source, extracted asset, or localization
  binary changed.

## Correction Candidates

These are review findings, not approval to edit the translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `23252` | Terminology / name pairing | The faction `The Testament` remains in the prior corpus-wide terminology finding. This row uses `테스타먼트(The Testament)`; consider the previously proposed `성약단(The Testament)` if that terminology is approved. Preserve the victims' anger and revenge. | High |
| `23320` | Naturalness / meaning | `우리 백성을 그들의 결함에서 구해 냈어` is awkward and can make the people's flaws sound like a place. Consider a natural rendering such as `네가 우리 백성이 지닌 결점을 극복하도록 도와줬어`, preserving the claim that the Hyperian was raised and the speaker's thanks. | Medium-high |
| `23326` | Meaning / naturalness | `treated him like the man he longed to be` is rendered as treating Nix like a human (`인간처럼`), which changes the English. Avoid a gendered pronoun; consider `기사 크레스(Creth)와 에어머(Airmer)가 도착하자, 닉스(Nix)를 그토록 되고 싶어 하던 사람처럼 대해 줬다.` Preserve the gentlemanly duel and fair-combat outcome. | High |
| `23346` | Format / title pairing | The location label `Ballads Library` is rendered `발라드의 집(House of Ballads) 도서관`, pairing only the organization name. Consider adding the complete label, e.g. `발라드의 집 도서관(Ballads Library)`, while retaining the established House of Ballads pairing if needed for clarity. | Medium-high |
| `23381` | Terminology / name pairing | `Seelie Summoner` is rendered `시리 페이 소환사(Seelie Summoner)`. The established term is `시일리`; the English says `Seelie`, not `Seelie Fae`. Consider `시일리 소환사(Seelie Summoner)`. | High |
| `23405` | Objective form | `Visit Daltyn Eame` is an action objective, but Korean uses the imperative `찾아가라`. Consider the established neutral action form `달틴 이임(Daltyn Eame) 찾아가기`. | High |
| `23413` | Speech level | Japanese uses plain male speech (`...付きまとっていてな`, `...のだ`), while Korean uses formal `-오` endings. Consider plain speech if the line is spoken; no individual speaker is inferred from the asset association. | Medium |
| `23430` | Format / creature title | `Tuatha Raider` is rendered `투아사(Tuatha) 약탈자`, pairing only the faction name. Consider the full type label `투아사 약탈자(Tuatha Raider)`. | High |
| `23468` | Format / material names | The list pairs `Emberwood` and `seasteel`, but leaves `Beachstone` unpaired. Consider `해변석(Beachstone)` while preserving the source's lowercase `seasteel` pairing and generic `돛천` / `곰가죽` without unnecessary annotations. | Medium |
| `23499` | Naturalness | `다크바리 가문의 아버지에게서 아들에게` is syntactically awkward. Consider `이 낡고 때 묻은 지도는 다크바리 가문에서 대대로 아버지로부터 아들에게 전해 내려왔어`, preserving the inheritance from father to son and the hidden family treasure locations. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `23266` | Meaning | English and Chinese say the weapon blades are made from `foam`, but Japanese says `casting molds`. Korean `폼` follows English/Chinese but is ambiguous. Retain it provisionally; do not decide whether this is a material joke or a source/reference discrepancy from this row alone. |
| `23298` | Meaning / entity identity | The label `Cynric Outlaw` is rendered `신릭 가문(Cynric) 무법자`, adding a family relationship not explicit in this key. English, Japanese, and Chinese do not establish whether `Cynric` is a family label or part of an individual's title/name. |
| `23349` | Meaning | `he, too, is gone` could mean absent, dead, or departed. Japanese and Chinese indicate absence, while Korean `떠났어` can imply voluntary departure; the short passage does not resolve his fate. |
| `23393` | Meaning | The fragment `the darkness is great` can describe power, extent, or depth. Japanese emphasizes power, Chinese vastness, and Korean depth. Preserve the current line pending context rather than choosing a more specific sense. |

## Rechecked Findings And Structure

- Existing candidates at `23251`, `23301`, `23342`, `23402`, `23431`,
  `23446`, `23452`, `23465`, and `23469` remain open. Existing directions and
  scope remain as recorded in their prior reports.
- The previous candidate at `23436` is cleared: its `Where can I find them?`
  context identifies `them` as reagents, so the current `어디서 찾으면 돼?`
  is supported and may differ from other exact-English duplicates.
- The prior uncertainty at `23486` remains. The Japanese/Korean register
  difference is unresolved without a per-key speaker or interaction mapping.
- The range touches 58 exact-English duplicate groups (1,100 corpus rows).
  Korean matches within all but the context-supported group containing
  `23436`. Other Japanese variants among repeated greetings, questions,
  titles, and court names do not require Korean divergence by themselves.
- Per-row logical line breaks and normalized runtime/control-token sequences
  match across all four languages throughout the range.
- Asset links, NPC symbols, handler counts, row adjacency, and numeric ID
  sequence were not treated as proof of an individual speaker or playback
  order.

After recording this range, the ledger contains 34,378 of 65,135 IDs
(52.78%), leaving 30,757. Sequential coverage reaches ID `23499`; the next
range is `23500`-`23749`.
