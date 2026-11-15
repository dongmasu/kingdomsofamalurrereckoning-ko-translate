# Sequential `default` Revalidation: IDs `15100`-`15249`

- Date: 2026-11-11.
- Scope: compare active Korean with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Forty-one existing ledger records were fingerprint-checked; all match the
  current four-language sources. The other 109 IDs were reviewed and added.
- Four correction candidates and three evidence-limited holds are recorded.
- No translation CSV, source resource, extracted game asset, or localization
  binary was changed.

## Correction Candidates

These findings are review proposals, not authorization to edit the active
translation CSV.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `15164` | Meaning / naturalness | The English and Japanese say to select an ability and press `{1}` to return to the slotting interface. Korean currently says selecting the ability returns there, then leaves pressing `{1}` as a separate instruction. Consider `아직 {*1슬롯에 등록}한 {*1능력}이 없습니다. 여기서 능력을 선택하고 {1}을 누르면 언제든 {*1슬롯 지정} 화면으로 돌아갈 수 있습니다.` Chinese places its `{1}` marker before the final slotting wrapper; Korean follows the English and Japanese marker sequence. | High |
| `15190` | Naturalness | `Trade the Book` is the action of handing the book over in exchange for Grim's freedom in the Travelers quest. `책과 거래하기` sounds as if the book were the other party to a transaction. Consider a direct action label such as `책을 넘겨주기`, preserving the exchange context. | Medium-high |
| `15226` | Meaning | `strangest heathen` describes an unusually strange or unorthodox nonbeliever; `낯선 이교도` can instead mean an unfamiliar or foreign nonbeliever. Chinese supports the unusual/strange reading, while Japanese broadens it to people of any faith. Consider retaining the “strange” sense, for example `아무리 별난 이교도라도`. | Medium |
| `15243` | English pairing | The capitalized `the Well` is Ventrinio's named research subject, rendered `영혼의 샘` without its English short name. The established short-reference form elsewhere is `샘(Well)` (for example, `61903`). Consider `영혼의 샘(Well)` here; do not expand this to a broader Well alias. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `15146` | Meaning | `appropriated` can imply misappropriation, as Korean `유용된` does, but Japanese describes an approved disbursement and Chinese a transfer into the player's name. The letter does not resolve whether the funds were illicitly diverted; retain the wording pending stronger evidence. |
| `15168` | Terminology / name | `Cthongeny` is translated as `크톤게니` without an English pairing, while other labels vary between `크톤게니` and `크통게니`. The separate question at `16311` remains open; do not set a canonical form from this isolated label. |
| `15244` | Meaning | `master anything` can mean gaining mastery or being able to act freely. Japanese supports the autonomy/control reading used by Korean, while Chinese supports the skill-mastery reading. Retain pending stronger source context. |

## Existing Findings Rechecked

- The existing candidates at `15148`, `15198`, `15221`, and `15222` remain
  recorded in their earlier asset-context reports; they were not recounted or
  overwritten in this sequential pass.
- `15190` already had a ledger row from the `TR01` asset review. Its
  four-language fingerprint was current; this pass reclassified that row as
  a naturalness candidate and linked it to this report rather than adding a
  duplicate.
- `15175` repeats the exact English `key to the Sorrows` sentence found at
  `12929`. Korean matches across both IDs as `비탄의 힘(Sorrows)`; language
  differences in the Japanese and Chinese versions were preserved.
- Thirty-four exact-English duplicate groups touch this range, covering 593
  rows across the corpus. Korean matches in every group. Thirteen groups
  contain Japanese or Chinese source-local differences; these were not
  mechanically unified.

## Source and Structural Checks

- All 150 IDs are present in the four language tables in matching ID order.
  Logical line-break counts match across all four languages.
- Runtime arguments, layout tokens, and display-wrapper identities and order
  match except for a Chinese marker-order difference at `15164`; Korean
  matches English and Japanese.
- The existing Korean poem line breaks at `15144` and document layout at
  `15146` were retained.
- Asset links remain candidate context only. No individual speaker or
  playback order was inferred from asset membership or row order.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
