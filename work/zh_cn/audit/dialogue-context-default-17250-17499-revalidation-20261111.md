# Sequential `default` Revalidation: IDs `17250`-`17499`

- Date: 2026-11-11.
- Scope: all 250 active Korean rows compared by ID with English, Japanese,
  and Chinese for meaning, Korean naturalness, register, terminology, and
  formatting.
- Sixty-five existing ledger fingerprints matched; 185 previously unrecorded
  IDs were reviewed and added.
- Five new correction-candidate findings and ten new evidence-limited holds
  are recorded. Two existing rows were reclassified as candidates and five
  as holds; five existing candidates and two existing holds were rechecked
  and retained.
- No translation CSV, source resource, extracted game asset, or localization
  binary was changed.

## New Correction Candidates

These proposals are not authorization to edit the active Korean CSV.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `17264` | Speech level / naturalness | The same utterance shifts from `반갑군`, `미안하네` to `생각하고 있었어`. Japanese is consistently informal. Use consistent informal endings, for example `아… 다시 보니… 반가워. 미안해. 그냥… 또 아내 메어(Maire)를 생각하고 있었어.` | High |
| `17303` | Meaning / nuance | English `folly` and Japanese `愚行` describe a foolish undertaking; `무모한 짓` can instead emphasize recklessness. Consider `그건 어리석은 짓이야.` | Medium |
| `17318` | Meaning / nuance | `miscreants` and Japanese `チンピラ` support a dismissive insult, but `범죄자` asserts criminal status. Consider the less specific `동료 불량배들`. | Medium |
| `17335` | Naturalness | `때 이르게 죽어` is a literal, stiff rendering of `untimely demise`. Consider `엘리 템스(Eli Tems)가 너무 일찍 세상을 떠나 퀘스트를 완료할 수 없게 됐다.` | High |
| `17377` | Name / consistency | The same Scaith people are rendered `스케이스(Scaith)` in related reviewed material; this row has `스카이스` and omits the source name. Consider `스케이스(Scaith)의 선조들`. Keep the identity/title of `the First` unresolved. | Medium-high |
| `17457` | Meaning / terminology | English `charms and spells`, Japanese `魔法も呪文も`, and Chinese `法术和咒语` describe magic/spells, not physical talismans. Reconsider `부적과 주문`, for example as `마법과 주문`. | Medium-high |
| `17474` | Name / terminology | In this quest, capitalized `Toothpicks` identifies the named pair of daggers called `Draug's Toothpicks` elsewhere, including the quest's own item records. `이쑤시개들(Toothpicks)` is awkward and loses that established item identity. Consider `드라우그의 이쑤시개(Draug's Toothpicks)`. | High |

## Retained Existing Candidates and Holds

- `17289`: retain the meaning candidate. The quest's Glass of Ambient is a
  magical mirror; the current generic `유리` loses that referent. Consider
  `거울` in this sentence.
- `17291`: retain the naturalness candidate. The double negative about
  farming without debasing Fae sorcery is cumbersome; recast it without
  weakening the speaker's contempt.
- `17361`: retain the objective-format candidate. Use the established
  action-form objective, `아풀레 비르(Apule Vire)와 대화하기`.
- `17403`: retain the naturalness candidate. Remove the contrastive force
  added by `그런데도`; `사람들은 나더러 이상하다고 하더라` is closer.
- `17451`: retain the terminology candidate. The same castle route is
  consistently called `오물 배출관` in the linked SQ66 references; this row
  currently says `오물 배수관`.
- `17267` and `17448`: retain their existing evidence-limited holds for
  Ollie's formal `master-at-arms` title and the unresolved personal rank
  `Templar`, respectively. Asset associations do not map these lines to a
  speaker or scene stage.

## Evidence-Limited Holds

These are not confirmed translation errors. The source rows or available
context do not settle the relevant distinction.

| ID(s) | Dimension | Reason |
| --- | --- | --- |
| `17250` | Meaning | English and Chinese use the “heart of Hadwyn” metaphor, while Japanese describes inheriting Hadwyn's aspirations; the intended force cannot be selected confidently. |
| `17260` | Meaning / reference | `it` and the exact roles meant by `Priestess` and `White Nil` are not established by the row. |
| `17274` | Meaning / reference | The referent of `their sniveling` is unavailable; retain the current contempt without assigning a group or speaker. |
| `17277` | Terminology | The sentence identifies joining the Warsworn as a `Hireling`, but the exact formal rank and its Korean title are not settled. |
| `17295` | Terminology | The capitalization marks `Dispelling` as an ability, but the canonical Korean ability name is not established by this row. |
| `17311` | Terminology | The reliquary and `Ordination Tome` are clear, but the institution and exact Korean name for the book/rite remain unsettled. |
| `17342` | Meaning / reference | `the Sorrows` may refer to the House/faction or its territory; do not resolve the referent from the asset association alone. |
| `17371` | Meaning | `readings` can mean prophecies or interpretations; Japanese and Chinese do not settle the English/Korean distinction. |
| `17391` | Terminology | The Offering ritual, Scion role, and Souldeep Fasting place name remain context-sensitive; the quest update itself is preserved. |
| `17434` | Meaning | `stageling gloryboat` is obscure slang, and the language references do not support one precise Korean insult. |
| `17444` | Meaning / reference | `the cipher` and the referent of `it` are not mapped to a specific mechanism by the row; retain the instruction without inventing one. |
| `17455` | Meaning / terminology | `The Orison` is treated as a title in English/Japanese but as prayer in Chinese; whether it is a rite, object, or prayer remains unsettled. |
| `17460` | Terminology | The Windstone Circle is clearly a ring/circle associated with the stones, but the canonical Korean site name is not established. |
| `17462` | Terminology | The action against Gnarsh is clear, but the preferred Korean forms for the name and `prismere taint` remain unresolved in this row. |
| `17477` | Meaning / terminology | `Mission` could denote a religious institution or mission; Japanese and Chinese differ on the institution type. |

## Rechecked Decisions and Structure

- Existing ledger rows `17335` and `17474` were reclassified as candidates;
  `17277`, `17311`, `17391`, `17444`, and `17462` were reclassified as
  evidence-limited holds. Their source fingerprints still match.
- The five previously flagged candidates (`17289`, `17291`, `17361`,
  `17403`, and `17451`) and two previously flagged holds (`17267` and
  `17448`) remain documented with their prior evidence.
- The accepted corrections already present at `17329`, `17343`, `17345`,
  `17408`, and `17436` remain aligned with the four sources.
- The earlier uncertainty at `17275` is resolved by the reviewed
  `Fateshift` terminology decision D-21746: `운명 전환(Fateshift)` is the
  established form, and the performed-count label is retained.
- At `17446`, Korean `홀수` agrees with Japanese and Chinese for the
  number-category sense of `Odd`; the earlier “strange” reading is no longer
  applicable to the active translation.
- All 250 IDs occur in identical order in the English, Japanese, Chinese,
  and active Korean tables. The range has three exact-English duplicate
  groups (`Quest Complete`, `Quest Failed`, and `Farewell.`); Korean matches
  within each group.
- Logical line-break counts match across all four languages. The only
  brace/markup signature difference is the localized title payload inside
  the preserved `{*1...}` wrapper at `17380`; its wrapper and position match.
- Of the 185 new ledger IDs, 137 have indexed quest-asset links and 48 do
  not. Asset links do not establish an individual speaker, addressee, or
  playback order; unsupported attributions remain unknown.

The ledger now contains 29,954 of 65,135 IDs (45.99%), leaving 35,181
unreviewed. The next sequential range is `17500`-`17749`. Per-ID decisions
and four-language fingerprints are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
