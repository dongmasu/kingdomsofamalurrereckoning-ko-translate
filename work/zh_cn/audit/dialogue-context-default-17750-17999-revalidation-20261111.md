# Sequential `default` Revalidation: IDs `17750`-`17999`

- Date: 2026-11-11.
- Scope: all 250 active Korean rows compared with English, Japanese,
  Chinese, and the current four-language fingerprints for meaning,
  naturalness, register, terminology, and format.
- Sixty-seven existing ledger records had matching four-language
  fingerprints; 183 previously unrecorded IDs were reviewed and added.
- One new correction candidate and six evidence-limited holds are recorded.
  Two existing correction candidates were rechecked and retained.
- No translation CSV, source resource, extracted game asset, or localization
  binary was changed.

## Correction Candidates

These proposals are not authorization to edit the active Korean CSV.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `17901` | Meaning / naturalness | `홀로(Hollow) 더 깊숙이 들어가야` reads as “go deeper into alone.” English capitalizes `the Hollow`, and Japanese `洞穴` and Chinese `洞穴` identify a hollow/cave. Consider a natural place noun such as `동굴(Hollow)`, subject to the established place-name glossary. | High |
| `17936` | Naturalness | `Thanks for nothing` is rendered `도움도 안 되는군`, which sounds stiff for the dismissive complaint; Japanese `役に立たないわね` supports a more conversational line such as `영 도움이 안 되네.` | Medium-high |
| `17937` | Terminology / format | `Return to Master Kiftal` is `마스터 키프탈(Master Kiftal)에게 돌아가기`, while the related quest occurrences alternate between `키프탈(Kiftal) 사부` and `마스터 키프탈`. Align the title/name pairing across those occurrences; the related SQ139 review proposes `키프탈 사부(Master Kiftal)`. | High |

## Evidence-Limited Holds

These are not confirmed translation errors. Available row-level evidence does
not settle the relevant distinction.

| ID | Dimension | Reason |
| ---: | --- | --- |
| `17772` | Format / context | `to spawn "Hunter-Gatherer"` appears diagnostic or internal, but the row does not establish whether players see it. Do not normalize its label or quotation style without display-context evidence. |
| `17775` | Meaning / terminology | `Hospitalis Quarters` may be a named institution or a descriptive hospital ward. Korean `병원 구역` is understandable, but the exact place/institution category is unresolved. |
| `17840` | Format / context | `invisible ammo slow` is rendered as a compact label, but the row does not establish whether it is player-facing or what `slow` modifies. |
| `17847` | Meaning / terminology | `Oathblade` is clearly a form of address, but Japanese reads it as a first-rank mercenary while English and Chinese support the literal title. The formal rank and canonical Korean title cannot be settled here. |
| `17928` | Meaning | `Lost to the Forsaken Plain` may mean disappeared, was defeated, or was otherwise lost. English and the other references do not establish which reading is intended; retain the current wording provisionally. |
| `17950` | Meaning / reference | The isolated label `Cynrics` is unchanged in English, Japanese, and Chinese, while Korean identifies it as `신릭 가문(Cynrics)`. This row alone does not establish whether it names a family, people, or another entity. |

## Rechecked and Cleared Earlier Findings

- `17797` now identifies the `House of Pride` as `긍지의 집(House of Pride)`;
  the earlier uncertainty about “Defender of Pride” no longer applies.
- `17799`, `17827`, and `17832` now use a single quote pair around the
  remembered warning, the Headhunter pun, and the ballad title, respectively.
- `17812` now pairs `샘` with `The Font`, and `17849` pairs `디스펠` with
  `Dispelling`; the older `근원` and `마법 해제` observations describe stale
  Korean text.
- `17902` uses the established `갤로우스 엔드(Gallows End)` spelling.
- `17981` now directs the thanks to the listener, consistent with English,
  Japanese, and Chinese.
- Existing candidate records at `17936` and `17937` retain their current
  fingerprints and dispositions.

## Duplicate and Structural Checks

- All 250 IDs are present in identical order in the English, Japanese,
  Chinese, and active Korean tables.
- Fifty-six exact-English duplicate groups touch this range (818 corpus
  rows). Every group has identical Korean text.
- Logical line-break counts match: 14 in each language, at IDs `17781` (6),
  `17835` (2), `17900` (3), `17917` (1), and `17999` (2).
- Raw marker signatures differ at `17783`, `17809`, `17956`, and `17967`
  because localized marker payloads differ. The marker wrappers and payload
  positions are retained; `17967` has the previously documented
  Japanese-only numeric marker reorder, while Korean matches English and
  Chinese.
- Of the 183 new IDs, 112 have indexed quest-asset links and 71 do not; three
  link to multiple assets. Asset links do not establish individual speakers,
  addressees, or playback order; unsupported attributions remain unassigned.

The ledger now contains 30,322 of 65,135 IDs (46.54%), leaving 34,813
unreviewed. The next sequential range is `18000`-`18249`. Per-ID decisions
and four-language fingerprints are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
