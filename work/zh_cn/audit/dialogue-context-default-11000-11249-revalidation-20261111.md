# Sequential `default` Revalidation: IDs `11000`-`11249`

- Date: 2026-11-11.
- Scope: compare active Korean with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Sixty-five existing ledger records were retained after all four-language
  fingerprints were verified. The remaining 185 IDs were compared and added.
- Five newly recorded IDs have correction candidates. Thirty-seven newly
  recorded IDs retain evidence-limited findings; three IDs appear in both
  groups because a candidate does not resolve a separate open question.
- Of the 185 new records, 130 have indexed quest-asset links and 55 do not.
  Asset association does not establish an individual speaker or playback
  order.
- No translation CSV, source resource, or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `11069` | Terminology | English `reagents` is rendered `재료`. The official Korean manual uses `시약` for alchemical reagents; Chinese also says `试剂`. Consider `시약` while preserving each ingredient, quantity, and paragraph break. The separate Sativa ingredient-name discrepancy remains unresolved. | High |
| `11102` | Name pairing | The speaker explicitly says the Scaith is now called “First.” Korean `첫째` conveys the sense but omits the source label. Consider `첫째(First)`; keep the compressed final fragment provisional rather than resolving its meaning by guess. | High |
| `11125` | Terminology | English says `epic gems`, while Korean uses `영웅급 보석`. The official Korean manual calls the corresponding item `에픽 보석`; consider using that established term. The separate `pristine quality` tier remains unresolved. | High |
| `11136` | Meaning / tone | `그 일당` adds a disparaging gang connotation to `his people`; Japanese `仲間たち` and Chinese `他的人` are more neutral. Consider `예언자(Augur)와 그 일행에게 책임을 물어야 해` or similarly neutral wording. | Medium-high |
| `11194` | Meaning | `true voice` is rendered `내 목소리`, omitting the contrast expressed by English and Chinese. Japanese also supports speaking in one's own voice. Consider `내 본래 목소리로` while retaining the accusation that the plan has been exposed. | Medium-high |

These are review proposals, not authorization to edit the translation CSV.

## Retained Evidence-Limited Findings

The following newly recorded IDs retain unresolved questions from the earlier
ID-scoped dispositions. They are not newly confirmed translation errors:

| IDs | Unresolved dimension |
| --- | --- |
| `11016`, `11048`, `11054` | Whether `Revival` is a name, whether “agent of change” is an idiom/title, and whether `A Love of Summer` is a title or description. |
| `11033`, `11034`, `11077` | The referent of `the Sorrows`, whether `House` is an institution or place, and the force of `ordained` / the title `Hierophant`. |
| `11040`, `11041`, `11050` | Canonical equipment/name forms, the category of `Truesworn`, and whether `Warden` is Blackwood's formal office. |
| `11056`, `11062`, `11069` | The exact resource/category of `Canneroc Gossamer`, the rank or order meant by `Justicar`, and the Sativa ingredient reading. `11069` also has the terminology candidate above. |
| `11083` | The meaning of the isolated `Waves` label. |
| `11102`, `11110`, `11120`, `11122` | The compressed phrase about the speaker's life, the Korean spelling of Gallows End, the rules of the knuckles game, and whether `House` means a Fae institution or physical place. `11102` also has the name-pairing candidate above. |
| `11125`, `11128`, `11132`, `11134`, `11138` | The `pristine` gem tier, the sense of `Scion`, the category of Concourse, the Hierophant's status as “in chains,” and a Japanese-only reference to boots' magic. `11125` also has the terminology candidate above. |
| `11145`, `11154`, `11155`, `11161` | The institutional terms `Scripture Master` / `Perpetual Mission`, whether `The Crows` is a group name, whether `The Adventure` is a book/series title, and the canonical spelling of Janya. |
| `11177`, `11179`, `11191`, `11199` | The referent of `brood`, the institutional sense of `Mission`, the possession mechanic, and unresolved mythic imagery/source differences. |
| `11202`, `11204`, `11205`, `11208` | The Korean pronunciation of Montainel, the Maid/title and House terms, the arrangement at Sandstone Villa, and the feeding/bed implication. |
| `11229`, `11231`, `11236` | Whether `Surprise` is a product category, whether Trellis is a named location, and the competing active Korean forms for the named Withering War. For `11236`, the current `쇠락 전쟁` follows later active usage, but an earlier accepted disposition recorded `쇠퇴 전쟁`; retain for corpus-wide resolution. |

Other prior holds in this numeric range were already present in the ledger
and were retained without being recounted, including `11042`, `11072`,
`11090`, `11097`, `11147`, `11178`, `11221`, `11246`, and `11248`.

Prior findings resolved by established evidence were not reopened: `11003`
uses the approved `콜로사이(Kollossae)` form; `11113` follows the official
manual's `오샨(Ohnshan)`; `11183` follows the approved `샘(The Font)` term;
and `11187` follows the established `미든(The Midden)` name. Earlier
`not an issue` dispositions for `11024`, `11109`, `11123`, `11165`, `11169`,
`11172`, `11189`, `11195`, `11209`, `11213`, `11214`, `11217`, and `11241`
were retained. At `11169`, Chinese says the opposite state from English,
Japanese, and Korean; this is a source-locale discrepancy, not a Korean
error.

## Duplicate and Structural Checks

- Thirty-seven exact-English duplicate groups touch the 185 new IDs,
  comprising 712 rows across the corpus. Korean text matches in every group.
- Runtime placeholder, named-variable, layout-token, display-wrapper, brace
  balance, and logical line-break counts match across all four languages for
  all 185 new IDs.
- Five Korean strings contain 13 existing embedded CRLF breaks:
  `11069` (4), `11163` (1), `11174` (1), `11189` (3), and `11199` (4).
  Their logical line-break counts match the language references; all existing
  bytes were preserved.
- No individual speaker or playback order was inferred from asset membership.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
