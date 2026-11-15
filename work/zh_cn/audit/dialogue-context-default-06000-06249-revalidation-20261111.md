# Sequential `default` Revalidation: IDs `6000`-`6249`

- Date: 2026-11-11.
- Scope: compare active English, Japanese, Chinese, and Korean rows for IDs
  `6000`-`6249`; add only IDs without an existing review-ledger record.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- 186 new IDs were reviewed and recorded. The other 64 IDs already had
  review-ledger records and were left unchanged.
- Five IDs have correction candidates. Four IDs have evidence-limited holds.
- No translation CSV or extracted game asset was changed. Candidates are
  proposals, not approval to edit.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `6044` | Name / format | The label translates `Queen of Staves` as `지팡이의 여왕` but the parenthetical includes only `(Argine)`. Consider pairing the complete displayed title, e.g. `아르진(Argine), 지팡이 여왕(Queen of Staves)` or the established title-first form with the full English source label. All exact-English duplicates currently have the same Korean text, so any approved change must be applied consistently to that duplicate group. | Medium |
| `6117` | Meaning / terminology | `the Den` is the capitalized shorthand for the Gambling Den; Japanese renders it as a gambling house. Korean `덴` is an unexplained transliteration. Consider `도박장` or another established Korean rendering, checking the named location and other Den references before applying. | High |
| `6144` | Naturalness | `필요한 걸 찾지 못한 사람처럼 보이는군` is understandable but closely follows English syntax. Consider a more conversational line such as `필요한 걸 찾지 못한 모양이군. 내가 도와줄 수 있을지도 모르지.` while preserving the speaker's restrained offer. Speaker attribution is not established by the asset links. | Medium |
| `6243` | Naturalness | `그래, 공포도 있고 전쟁도 있지` carries the source's rhetorical repetition, but sounds unusually conversational beside `영광` and `진정한 용기`. Consider recasting the full parallel structure without assigning an unsupported speaker voice. | Medium |
| `6245` | Terminology / naturalness | `넝마 수집꾼들` differs from the established, more natural `넝마주이` used for the same source term elsewhere. Consider `넝마주이` as the concise group label; retain the English `Rag Pickers` if the display-label policy requires it. | High |

## Evidence-Limited Holds

| ID | Reason and disposition |
| ---: | --- |
| `6032` | The English, Chinese, and Korean poem have seven line breaks; Japanese has six and rearranges/compresses a line. Korean follows the English/Chinese segmentation. Preserve the existing Korean breaks pending a source-layout decision. |
| `6056` | The English source says `Echos`, while Korean uses the apparent ensemble name `the Echoes`; Japanese and Chinese do not settle whether the English spelling is a typo or a deliberate name form. Do not normalize without a naming decision. |
| `6122` | `Forum` is a named Adessa landmark, but the Korean says `광장`; Japanese and Chinese render it as a council/assembly institution. The term remains a corpus-wide naming/meaning question, so no local replacement is proposed. |
| `6123` | `shards` may refer to the game's magical crystal fragments or more generally to shards; Japanese says `宝石`, Chinese says `碎晶`, and Korean says `수정 조각`. Retain pending item/lore context. |

## Duplicate and Structural Checks

- Fifty-six exact-English duplicate groups touching the newly reviewed IDs
  (933 rows across the full corpus) were checked; Korean text matched within
  every group.
- Runtime-variable and layout-control signatures match across all four
  languages for the 186 new IDs. Localized visible text inside formatting
  wrappers was excluded from the signature comparison.
- ID `6032` is the only logical line-break-count difference among the new
  IDs. Its Korean layout matches English and Chinese; Japanese differs as
  described in the hold above.
- Five Korean strings (`6002`, `6032`, `6081`, `6085`, and `6094`) contain
  22 embedded CRLF breaks while the corresponding other-language breaks use
  LF. These are existing byte-level differences and were preserved.
- Of the 186 new IDs, 131 have indexed asset links and 55 do not. Asset
  membership does not establish an individual speaker, handler mapping,
  branch, or dialogue order; unsupported values remain unknown.
- Two lines explicitly identify their speaker in first person: `6107`
  identifies Queen Belmaid and `6235` identifies Jeanne Jorielle. Those
  textual identifications are recorded; no playback order is inferred.

Four-language source fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
