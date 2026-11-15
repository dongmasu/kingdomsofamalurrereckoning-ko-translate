# Sequential `default` Revalidation: IDs `26100`-`26199`

- Date: 2026-11-12.
- Compared all 100 active Korean entries with same-ID English, Japanese,
  and Chinese for meaning, naturalness, register, terminology, and format.
- Rechecked 28 existing ledger entries and added 72 unrecorded IDs. Ten new
  correction candidates and two evidence-limited holds were recorded.
- One existing candidate, `26167`, remains pending. The translation CSV and
  extracted assets were not changed.

## Correction Candidates

These findings are not approval to edit the translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `26101` | Naturalness / register | `부탁이네` is stiff in this otherwise informal request. Japanese seeks understanding; consider `이해해 줘, 부름받은 자(Beckoned)여. 무례하게 굴려는 건 아니지만, 여긴 들어갈 수 없어.` | Medium-high |
| `26110` | Name / format | The standalone label `Muse of Fate` is translated without an English pairing. Consider `운명의 뮤즈(Muse of Fate)` after confirming the label's role. | Medium |
| `26116` | Naturalness / register | `환영하네`, `자네`, `과분한 호의였어`, and `고맙네` mix stiff and informal styles. Japanese is cordial; consider a consistent conversational form while retaining thanks and the unusual kindness in a barbarous age. | Medium-high |
| `26135` | Name / format | `War of Parries` and `Orieator's Lance` are named conflicts, but Korean does not pair the whole English event names. Consider pairing each complete title and retain the injury and honorable service. | Medium |
| `26143` | Name / format | The objective names `Ainmhi`, but `아인미` lacks the English pairing. Consider `아인미(Ainmhi)에게 돌아가기`. | High |
| `26150` | Name / terminology | The long history omits English pairings for `Icenwreth`, `Fierol`, `Tolyndrae`, and `The Justicars`. `Fierol` already appears as `피에롤(Fierol)` in `base`; check the other established names and distinguish the city of `Tolyndrae` from any similarly named person before proposing exact spellings. Preserve paragraph breaks. | High |
| `26157` | Name / format | `Deinir` is `데이니르` without English; other entries use `데이니르(Deinir)`. Pair the term without altering the leggings description. | High |
| `26172` | Name / format | `Woolstring` is unpaired in `울스트링`; the name is paired as part of `토라 울스트링(Thora Woolstring)` elsewhere. Pair the surname without assuming more than this line names, e.g. `울스트링(Woolstring)`. | High |
| `26174` | Name / format | `Carth` is unpaired in `카스`. Consider `카스(Carth)`; do not infer a full name from the surname alone. | High |
| `26184` | Name consistency | `Almere the Bold` appears here as `대담한 알메레`, but IDs `11614` and `19046` use `대담한 알메르(Almere the Bold)`. Align after checking the full-name family across the corpus; ID `39876` and a longer history use yet other forms. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `26180` | Format | Both English and Korean end in a comma, while Japanese and Chinese end the sentence. It may be a source fragment; establish how the line is displayed or continued before changing punctuation. |
| `26193` | Meaning / code phrase | The English answer is `Five-and-nine by night`, Japanese writes `59`, and Chinese reads a sum. Korean `다섯에 아홉` retains the components but not a clear interpretation. Preserve the phrase until the intended in-game password is established. |

## Rechecked Existing Finding

- `26167`: retain the prior candidate concerning the reconnaissance report
  and naturalness, documented in the SQ118 report.

## Duplicate And Structural Checks

- The range touches 21 exact-English duplicate groups comprising 360 corpus
  rows. The `What do you require?` group differs in Korean: `26144` has
  `무엇을 원하지?`, while `49957` and `56834` have `뭐가 필요하지?`.
  Japanese also distinguishes `求めている` from `必要`; do not unify
  mechanically.
- The four languages have matching embedded line-break counts throughout
  the range. ID `26106` has one `{*1...}` localized display wrapper in each
  language; its payload is translated, and no wrapper is missing.
- Asset links and ID sequence are not evidence of a particular speaker or
  playback order. Unproven attribution and order remain unassigned/unknown.

After recording this range, the ledger contains 36,391 of 65,135 IDs
(55.87%), leaving 28,744. Sequential coverage reaches ID `26199`; the next
range is `26200`-`26249`.
