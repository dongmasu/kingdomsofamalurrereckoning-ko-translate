# SQ50 / Nareen Farm and the Paling Wand Revalidation

- Date: 2026-11-11.
- Scope: all 101 `default` IDs linked to `1251244.quest_bxml`.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Sixteen correction-candidate IDs and one evidence-limited hold are recorded.
  The active Korean translation CSV was not changed.

## Grouping Evidence and Limits

The asset has explicit quest ID `SQ50`, two NPC symbols
(`NPC_POE_DOK_GraemHaille` and `NPC_POE_LJO_SerabelNareen`), 40 serialized
dialogue handlers, and 101 matched localization IDs. Its content concerns
the Nareen farm, the refugees/vagrants on Beggar's Bluff, and the Paling
Wand. The two NPC symbols and handlers are asset-level evidence only; they do
not map any key to a speaker, callback, dialogue branch, or playback order.
Per-key speaker attribution remains unassigned and playback order unknown.

All 101 rows were compared across English, Japanese, Chinese, and active
Korean. Repeated English/Japanese/Chinese source groups already have matching
Korean text. No row contains an embedded line break, runtime variable, or
markup token. None of these IDs is already recorded through another asset in
the review ledger.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `17291`, `19214` | Naturalness | `cannot even farm without debasing Fae sorcery` is rendered with the cumbersome double-negative `마법을 하찮은 일에 쓰지 않고는 농사조차 지을 수 없어서`. Recast it naturally while preserving the speaker's contempt, for example `페이(Fae) 마법을 농사짓는 데까지 써야 하니`. | Medium |
| `19905`, `36231`, `48443`, `57408`, `60282` | Terminology | The same group of people called `vagrants` is variously `부랑자`, `방랑자`, and `떠돌이`. Consider one form such as `떠돌이` throughout these rows, while keeping the distinct source term `refugees` as `난민` and preserving contempt expressed elsewhere in the sentence. | Medium-high |
| `3187`, `8323`, `23199`, `25385` | Meaning / terminology | `hollow` / `the Hollow` is rendered as `움푹 팬 곳`, `골짜기(Hollow)`, `할로`, and `할로우`. The Japanese and Chinese support a cave/hollow location, and `The Hollow` is capitalized in related English rows. Use a consistent location form where it is clearly the same place; do not assume it is identical to `Adarus Hollow` without map evidence. | Medium |
| `24788`, `31085`, `44294`, `45386`, `57408`, `57901` | Meaning / name / format | These rows refer to Adarus or Adarus Hollow but use inconsistent forms (`아다루스에게`, `아다루스 동굴`, `아다루스 굴`, and `페이의 골짜기/굴 아다루스`) and omit English pairings in several occurrences. `아다루스 동굴(Adarus Hollow)` is already used at `15846`; use that form when the full place name is intended. At `24788`, render `To Adarus` as travel to a place, not `아다루스에게`. | Medium-high |

The full term `Paling Wand` is consistently `페일링 완드(Paling Wand)` when
named. Generic references to a wand were retained as generic wording.
`refugees` (`난민`) and `vagrants` are also kept distinct; the candidate
above concerns only the inconsistent Korean rendering of `vagrants`.

## Evidence-Limited Hold

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `13176` | Meaning / antecedent | English says the guards were turned away and then “they refuse to go back,” which can refer to the guards. Japanese instead explicitly says the vagrants refuse to leave; Chinese and Korean leave the pronoun ambiguous. Retain pending stronger quest or scene context. |

## Complete Reviewed ID Set

`1130`, `1432`, `3187`, `3767`, `3995`, `5555`, `5647`, `6307`, `6744`,
`7812`, `7888`, `8095`, `8323`, `8619`, `8894`, `9130`, `9428`, `10034`,
`11278`, `11419`, `11847`, `12738`, `13085`, `13176`, `13320`, `13867`,
`14328`, `15846`, `15866`, `16223`, `16728`, `17140`, `17291`, `17644`,
`17924`, `19214`, `19267`, `19297`, `19794`, `19905`, `20700`, `20780`,
`20869`, `21341`, `21500`, `21835`, `22006`, `23199`, `23580`, `24764`,
`24788`, `25385`, `27156`, `28243`, `28624`, `29021`, `29839`, `30412`,
`30742`, `31085`, `31110`, `31233`, `31610`, `33787`, `36231`, `37589`,
`37892`, `38349`, `40720`, `41084`, `41494`, `41970`, `42601`, `43080`,
`43713`, `43848`, `43925`, `44294`, `45386`, `46175`, `47817`, `48443`,
`48568`, `49881`, `49913`, `50456`, `50816`, `51985`, `53143`, `54614`,
`57408`, `57727`, `57901`, `60282`, `60391`, `60672`, `63641`, `63897`,
`64355`, `64484`, `64945`.

All 101 IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
