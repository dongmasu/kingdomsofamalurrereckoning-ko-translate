# Sequential `default` Revalidation: IDs `32750`-`32999`

- Date: 2026-11-12.
- Compared all 250 entries in English, Japanese, Chinese, and active Korean.
- Rechecked 77 existing ledger entries and added the other 173 IDs. Findings
  are review proposals, not approved translation edits.
- Nine new correction-candidate IDs and four new evidence-limited holds were
  recorded; `32891` appears in both groups. Five existing candidates and
  three existing holds were rechecked and retained.
- No translation CSV, source asset, or game binary was modified.

## Correction Candidates

| ID | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `32825` | Name / format | The artifact is the `circlet of Arkes`; Korean `아르케스의 서클릿` omits the English pairing for the named artifact and Arkes. Consider pairing the name/title while preserving the sentence. | Medium |
| `32860` | Naturalness / name | `new Crow` means a newcomer to the Crows team; Japanese explicitly says a new recruit. `새 크로우(Crow)` is understandable but can read as a newly appearing crow. Consider `새로 들어온 크로우(Crow)` or equivalent. | Medium |
| `32886` | Name / format | `Raptor Land` is a standalone named location label. Korean `랩터 랜드` omits the English pairing. Add `(Raptor Land)` if retaining this established Korean rendering. | High |
| `32891` | Name / format | The roster renders Sverri Kura's office and location as `아말도르(멜 센시르)`; neither `Amaldor` nor `Mel Senshir` is paired. Consider `아말도르(Amaldor)` and `멜 센시르(Mel Senshir)` without changing the roster layout. | High |
| `32898` | Naturalness / register | `영광을 얻으리라` is markedly declamatory for the direct boast `I will earn glory`; Japanese is conversational and emphatic (`栄光をつかんでやる`). Consider a more immediate spoken form such as `영광을 거머쥐겠어!`. Asset membership does not identify the individual speaker. | Medium |
| `32944` | Meaning / naturalness | English opens with `Yes`; Korean `그래서` means “so/therefore” and creates a causal transition absent from the source. Replace only that opening with `그래` or another affirmative. | High |
| `32947` | Grammar / naturalness | The sentence ends `...완성되지 않을 거라고 고집하지`, which is incomplete as a standalone assertion. English says Straton insists the work will not be ready until inspiration comes; close the clause with an assertive ending such as `고집해`. | High |
| `32951` | Name / format | `Templar Octienne` is rendered `템플러 옥티엔(Octienne)`, pairing the personal name but not the title. Consider `템플러(Templar) 옥티엔(Octienne)`. | High |
| `32980` | Naturalness / voice | English and Chinese retain the speaker's `I'm ‒ I'm not` hesitation, while Korean removes it; Japanese also smooths it. Consider preserving the stammer (for example, `난... 난 여기 남아서...`) if the intended hesitant delivery is to be retained. | Medium |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `32771` | Meaning / format | English `Day XX` conflicts with Japanese and Chinese rendering it as day 20. The row does not establish whether `XX` is literal, a placeholder, or a value meant to be localized. Keep `XX일째` pending stronger evidence. |
| `32878` | Name / meaning | English spells the grove `Lycium Grove`, while the Japanese source and established location name indicate `Lyceum Grove`. The English spelling may be a source typo; do not silently rewrite the name without resolving that conflict. |
| `32891` | Meaning / title | English's malformed `Ancient-of -War` conflicts with Japanese `大将軍` and Chinese's literal “ancient of war.” Korean `전쟁의 고대인` follows one possible literal reading, but the intended office/title is unresolved. |
| `32960` | Meaning / terminology | English/Chinese use `vision`, while Japanese/Korean use “thought/idea.” The line does not establish whether this means worldview, plan, or opinion; retain `생각` provisionally. |

Existing candidates `32759`, `32802`, `32881`, `32955`, and `32976` remain
supported by their linked reports. Existing holds `32816`, `32853`, and
`32868` remain unresolved. Existing row `32825`, previously `not-issue`, is
promoted to a format candidate for its missing item/name pairing. The other
68 existing ledger entries were rechecked and remain not flagged.

## Repeated Sources And Structure

- Forty-seven exact-English duplicate groups touch this range (1,309 corpus
  rows). Korean matches within every group; no wording was unified by
  frequency.
- Per-row embedded line-break counts match across English, Japanese, and
  Korean except for the existing Chinese-only difference at `32891`: counts
  are 18, 18, 17, and 18 respectively. Korean preserves the English and
  Japanese layout. The poem at `32776` retains its 16 embedded breaks.
- Runtime/layout token and markup signatures match after normalizing
  localized `{*1...}` payloads. At `32999`, the three wrappers and Korean
  order are intact; localized payload wording/order differs by locale.
- Variables, numeric values, punctuation, and localized markers were
  checked. No Korean token or value loss was found.
- A preliminary note had proposed an agency inversion at `32930`; rechecking
  the English imperative confirms the Korean instruction to demand admission
  from St. Odwig's is correctly directed. No candidate was recorded there.
- No speaker identity or playback order was inferred from asset membership,
  NPC symbols, handler serialization, or ID order.

After this range, the ledger contains 41,400 of 65,135 unique IDs (63.55%),
leaving 23,735. Sequential coverage reaches ID `32999`; next:
`33000`-`33249`.
