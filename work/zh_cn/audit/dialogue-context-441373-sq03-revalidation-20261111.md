# Udo Marsh / `441373.quest_bxml` Revalidation

- Date: 2026-11-11.
- Scope: all 82 `default` IDs linked to `441373.quest_bxml`.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Four correction candidates and three evidence-limited holds are recorded.
  No translation CSV or extracted game asset was changed.

## Grouping Evidence and Limits

The asset has the NPC symbol `NPC_DAL_ALM_UdoMarsh` and 29 serialized
`dialog_line_*` handlers with an `SQ03` prefix. It has no explicit `QUEST_ID`.
These are asset-level clues only: they do not map any localization key to
Udo Marsh, a specific handler, branch, addressee, or playback position. The
content concerns Brother Fallon's disappearance, his prayer beads, and
Mitharu's creed, but the asset association does not establish that every key
is spoken by Udo.

All 82 rows were compared in English, Japanese, Chinese, and active Korean.
No embedded line breaks, runtime placeholders, or markup occur in this set.
Exact-English repeats were checked by ID; the matching Korean renderings at
`8562` / `15198`, `6166` / `20909`, `7704` / `22484`, `26291` / `28704`,
`33395` / `35652`, `41656` / `43280`, `46671` / `64869`, `14274` / `16004`,
and `57692` / `63292` are consistent.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `4867`, `8562`, `10609`, `15198` | Terminology | English explicitly uses `prayer beads` at these IDs. Korean varies among `기도 구슬`, `기도용 염주`, and `기도 묵주`, while the same quest's item and other references use `염주`. Standardize these references to `염주`, preserving sentence grammar. | High |
| `14818` | Meaning / naturalness | The quotation says humility is “given”; Korean `남이 베푸는 것이다` adds an explicit giver not present in English or Japanese. Consider `겸손은 노력으로 이루거나 얻는 것이 아니라, 주어지는 것이다.` | High |
| `18371` | Meaning / naturalness | `Why ‒ yes, they are!` is an affirmative recognition, but Korean starts `아니, 맞아!`, creating a direct contradiction. Consider `아, 맞아! 그럼 그가 죽었다는 건가? 그렇다면 미사루(Mitharu) 곁으로 갔겠군.` | High |
| `53793` | Meaning / structure | The line names three prayer locations: St. Eadric's shrine, St. Odwig's shrine, and the place before this Mission. Make the list's parallel structure explicit and retain the following “at each one” instruction; do not imply that the Mission itself is one of the named saints' shrines. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `37543` | Meaning / name reference | English says `Father Marsh`, while Japanese says Brother Udo; Chinese also says Father Marsh. The active Korean follows English as `마시 신부(Father Marsh)`. The asset-level Udo symbol cannot resolve this source conflict, so retain the translation pending stronger evidence. |
| `45674` | Address / naturalness | English addresses someone as `Brother`; Japanese omits the vocative and Chinese retains it. Korean `형제, 지금은 시간이 없어` is stiff, but the key is not mapped to a speaker or addressee and the appropriate Korean religious title is unconfirmed. Hold rather than guess a replacement. |
| `59165` | Meaning | English and Chinese say `I hope he returns`; Japanese says `見返りはいらない` (“I don't need anything in return”). Korean follows English and Chinese. Preserve the current meaning while recording the unresolved source-language conflict. |

## Retained Text

The other rows were retained after the four-language comparison. This
includes objective, journal, item, and dialogue-like text; their occurrence
in the same asset does not prove shared speaker or conversational stage.
Japanese voice and honorific differences were assessed per row, not
normalized across the asset without per-key speaker evidence.

## Complete Asset ID Set

`2145`, `2347`, `4867`, `5506`, `6166`, `6261`, `7704`, `8007`, `8562`,
`8910`, `9590`, `9885`, `10288`, `10609`, `11854`, `12530`, `14274`,
`14818`, `15128`, `15198`, `16004`, `18188`, `18300`, `18371`, `18595`,
`19178`, `20147`, `20461`, `20909`, `21637`, `22116`, `22484`, `26291`,
`26472`, `27297`, `28593`, `28704`, `28741`, `29734`, `30025`, `32399`,
`33395`, `34040`, `34084`, `34811`, `35574`, `35652`, `35732`, `35893`,
`36512`, `37479`, `37543`, `37544`, `41656`, `43280`, `43417`, `44481`,
`44517`, `45674`, `46671`, `49704`, `51274`, `51952`, `53133`, `53589`,
`53697`, `53793`, `56062`, `56266`, `57277`, `57692`, `57804`, `59165`,
`59678`, `60192`, `61559`, `61599`, `63292`, `63988`, `64251`, `64717`,
`64869`.

All 82 IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
