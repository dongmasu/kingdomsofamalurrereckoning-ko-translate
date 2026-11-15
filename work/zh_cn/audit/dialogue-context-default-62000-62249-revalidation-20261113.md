# Sequential `default` Revalidation: IDs `62000`-`62249`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 79 pre-existing ledger rows and preserved them. Appended the
  remaining 171 IDs in ascending order.
- Nine new correction candidates and five new evidence-limited meaning or
  register holds are recorded. Seven rows also have a separate embedded-line
  ending hold; two overlap with correction candidates.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `62038` | Terminology | In an equipment effect, `Health` is the game stat and the project's established Korean is `체력`; the current text uses `생명력` in both the threshold and restoration lines. Consider `체력` in both places. Its embedded line-ending difference is separately held. | High |
| `62070` | Naturalness / register | Avery's reflective letter is otherwise in conversational plain style, but `그곳에서 너를 만날 수 있다면 진정한 안식을 얻으리` shifts abruptly to an archaic literary ending. Consider a wistful conversational close such as `그곳에서 너를 만날 수 있다면 진정한 위안을 얻을 텐데.` Preserve the existing paragraphs. Its embedded line-ending difference is separately held. | Medium-high |
| `62160` | Meaning | English `Son of Laz` explicitly says `son`; `라즈의 자손` broadens this to a descendant of any gender. Consider `라즈의 아들(Son of Laz)`. The Japanese differs (`ラズ・ソルジャー`), so retain that source discrepancy as supporting context. | Medium-high |
| `62169` | Speech level / address | The line uses `당신` with an informal ending (`난 아니야`), an awkward mix for this dismissive conversational voice; Japanese is plainly casual. Consider a consistent casual address, e.g. `옆방 노움은 네 얘길 반기겠지만, 난 아니야.` | Medium |
| `62177` | Naturalness | The comparison in `그 열정은 자기 나이의 절반밖에 안 되는 남자 못지않지` is difficult to parse. English compares Ommer's zest for life with that of a man half his age. Consider recasting the sentence so the comparison clearly modifies Ommer's zest for life. | Medium |
| `62191` | Name format | `Three Swords` is the established epithet of a Varani blademaster, not a generic phrase; related English rows identify the fallen blademaster and his legendary weapons. The Korean `세 자루의 검` omits the English pairing. Consider `세 자루의 검(Three Swords)의 시신 찾기`. | High |
| `62194` | Speech level | The standalone greeting is `안녕`, while Japanese `こんにちは` and Chinese `你好` are neutral/polite greetings. With no evidence for an intimate speaker relationship, consider `안녕하세요.` | Medium |
| `62214` | Meaning | English and Japanese use `vessel`/`船` for a ship, but Korean says `배지`, a badge. Correct the noun to `배` or `선박`; the gull comparison confirms the nautical sense. | High |
| `62231` | Terminology | For the equipment component `Bindings`, reuse the established `base` term `결속구`; the current `속박` reads as restraint/binding rather than the named component. | High |

## Evidence-Limited Holds

| ID | Dimension | Question and disposition |
| ---: | --- | --- |
| `62041` | Meaning | `Trigger Kobolds` is an isolated UI-like fragment. Japanese transliterates `Trigger` while Chinese renders it as an action; the available row does not establish whether this names a group, a trigger, or an instruction. Do not guess. |
| `62077` | Meaning | English `my Imelda` and the other language rows establish that Imelda died before the speaker, but do not explicitly define their relationship. Korean adds `아내`; retain provisionally until the relationship is supported by direct context. |
| `62122` | Source integrity / meaning | English ends mid-sentence at `the source of the Tuatha`, while Japanese and Chinese supply a completed thought. Korean completes the source from those versions. Keep the added completion on hold rather than treating the English fragment as complete evidence. |
| `62166` | Proper name / meaning | `Sanguine` may be a name or a temperament label. Japanese preserves it phonetically, Chinese translates the temperament, and Korean follows Chinese as `다혈질`. The intended selectable entity is not established. |
| `62239` | Speech level | Korean ends informally (`보자`) while Japanese uses a polite form (`会いましょう`). Without reliable per-key speaker evidence or surrounding turns, do not impose a register change. |

## Rechecked Existing Findings

These IDs already have append-only ledger rows; their rows and prior
dispositions remain unchanged.

| ID | Recheck |
| ---: | --- |
| `62000` | The title still translates `Queen of Staves` while pairing only the name `Argine`; preserve the existing title-format candidate. |
| `62029` | `drudged up` carries effort in finding cloth; the current `찾아왔어` is understandable but leaves that nuance understated. Preserve the existing candidate without forcing a rewrite. |
| `62054` | English's `dreg` is malformed/ambiguous in this sentence, Japanese omits it, and Chinese treats it as a direct address. Preserve the existing meaning/naturalness candidate rather than infer a name or insult. |
| `62087`, `62181` | The approved collectible term is `연도문`; both current rows use it. The prior candidate is already reflected in the text. Preserve the append-only rows and do not change these translations. |
| `62104` | The Korean polite ending remains in tension with Japanese casual speech; available context does not identify the line's speaker. Preserve the existing register hold. |
| `62156` | The English possessive says `Hospitalis Quarter's`, while the established location name is plural `Hospitalis Quarters`. The Korean follows the local source form; retain the existing terminology question rather than silently normalize the source. |
| `62168` | The Korean combines `당신` with casual `이야`, while Japanese is polite. Preserve the existing register/address candidate; no speaker-specific edit is inferred here. |
| `62192` | The line still mixes `-군` and `-군요`; the Japanese polite phrasing supports the existing speech-level candidate. |
| `62230` | The quest-log wording about the camp of Bolgan remains a naturalness candidate; preserve the prior row and its quest context. |
| `62233` | The present wording for being brought back from the dead and thinking Lyra was gone is supported by English and Japanese. Preserve the existing row without treating it as a newly found error. |
| `62249` | `계속 그를 압박해` remains a plausible tactical reading of `Keep on him!`; preserve the prior candidate without inferring speaker identity. |

## Additional Cross-Checks

- Sixty-three exact-English duplicate groups touch this range, comprising 67
  range IDs and 1,746 corpus rows. Korean wording matches within every group.
- Seven rows contain embedded line breaks, totaling 30 breaks in each
  language. Per-row logical break counts match; all 30 embedded Korean
  separators are CRLF while English, Japanese, and Chinese use LF. Preserve
  the CSV bytes; do not normalize these separators during review.
- Marker identities and counts match at `62165`, but the product-title and
  `Special Deliveries` display markers occur in a different sequence in
  English than in Japanese, Chinese, and Korean because the localized
  sentence moves the product mention. The Korean follows the Japanese
  sentence order; no marker is missing or duplicated.
- Of 250 IDs, 197 have indexed asset associations (198 links across 136
  assets), and 53 have none. Of the 171 newly recorded IDs, 118 are linked
  (119 links across 67 assets), and 53 are unlinked. Asset associations do
  not establish per-key speakers or playback order.

## Range Result

- All 79 pre-existing ledger rows remain unchanged; 171 new IDs are appended
  in ascending order. Nine new correction candidates and five new
  evidence-limited meaning/register holds are recorded. Seven embedded
  line-ending holds are recorded separately, with two overlapping
  candidates.
- The ledger covers 63,027 of 65,135 unique `default` IDs (96.77%), leaving
  2,108 unrecorded. Sequential coverage reaches `62249`; next is
  `62250`-`62499`.
- Candidate findings are proposals, not approval to edit translation CSVs.
  No translation CSV was changed.

## Verification

- English, Japanese, Chinese, and Korean each contain IDs `62000`-`62249`
  once and in identical ascending order; each full `default` file contains
  65,135 records with matching key order.
- All ledger fingerprints validate, including the 79 rechecked and 171
  newly appended rows.
- The regenerated quest-asset index and catalogs reproduce exactly; related
  tests and the CRLF-aware audit diff check pass.
