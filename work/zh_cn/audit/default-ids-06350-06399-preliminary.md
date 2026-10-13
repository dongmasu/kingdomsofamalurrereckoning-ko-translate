# Preliminary Language Scan: `default` IDs 6350-6399

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 6350-6399.
- Compared English, Japanese, and Chinese rows with active Korean and
  reconciled applicable historical questions.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 6351 | `Farrara` → `파라라` | Confirm the character spelling and whether `ballad` here means a specific House of Ballads narrative cycle. | English/Japanese/Chinese agree that another story must not continue endlessly; the name's Korean form and formal story terminology remain unresolved. | Medium |
| 6365 | `Templars` → `성전 기사단` | Verify whether this is a named faction/order and use its established Korean title. | All sources identify a group; Japanese and Chinese use religious-knight wording, but the game affiliation is not evident from this isolated label. | Medium |
| 6366 | `Chaos Thrall XIX` → `혼돈의 노예 XIX` | Keep the Roman numeral and confirm whether this numbered enemy/test label should be localized. | English/Chinese/Korean use `XIX`; Japanese renders the same value as `19`. This is a formatting difference, not a quantity mismatch. | Medium |
| 6370 | `junked item` → `잡동사니 아이템` | Preserve `{1}` exactly and confirm the inventory term for a junked item. | The placeholder identity and value are retained. English spells out one item; Japanese/Chinese/Korean also express the item count, with Japanese/Korean including an additional localized “one item” phrase. | Medium |
| 6371 | `Test lore 1` → `전승 테스트 1` | Retain as a likely developer/test string unless context establishes that it is player-facing. | English, Japanese, and Chinese all explicitly identify test lore/knowledge; localizing it as `전승` may suggest actual setting lore. | High |
| 6372 | `fastings` → `지하 통로` | Resolve the source term before standardizing; it may be a typo or a named location, not a generic passage. | English says `fastings`; Japanese interprets this as underground passages; Chinese transliterates a similar-sounding term. Korean follows Japanese. Historical notes connect it with the Dverga tunnel terminology at ID 5728. | High |
| 6383 | `Travelers` → `트래블러` | Confirm this is the capitalized Travelers faction and align singular/plural and bilingual presentation with other faction references. | English and Japanese identify the named group; Chinese uses the generic “travelers.” The Korean label omits the source form and differs from occurrences using `트래블러스(Travelers)`. | Medium |
| 6386 | `Consider yourself stripped` → `이제 네 직함은 박탈이야` | Keep the object open until context identifies whether the speaker removes a title, rank, status, or equipment. | English omits what is stripped. Japanese and Chinese imply status/rank; Korean supplies the more specific `직함`. | Medium |
| 6390 | `SpellAmmo` → `주문 탄약` | Confirm whether this camel-cased term is a player-facing ammunition type or an internal identifier. | All locales present the same technical-looking label; translating it may be appropriate only if it appears in the UI. | Medium |
| 6395 | `Telogrus is gone` → `텔로그루스는 사라졌지만` | Retain the intentionally noncommittal “gone”; do not infer death without context. | English/Japanese support absence/departure; Chinese says he died. Korean correctly avoids the added death claim. | High |
| 6399 | timed `Parry` / `Daggers` → `쳐내고` / `단검` | Check the official Korean combat/UI terms for Parry and Daggers during the consolidated terminology pass. | The instruction's timed parry followed by rapid dagger strikes is retained; only the established action label remains to be confirmed. | Medium |

## Historical Audit Reconciliation

- Rechecked applicable historical questions for IDs 6351, 6359, 6362,
  6365-6366, 6370-6372, 6380, 6383, 6385-6386, 6390, 6393, 6395, and 6399
  against active Korean and matching source rows.
- ID 6372 remains unresolved because English, Japanese, and Chinese differ
  on `fastings`; ID 6395 remains aligned to English rather than the Chinese
  death interpretation.
- Historical candidate wording remains evidence only and does not authorize
  edits.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean.
- Explicit line-break counts and brace-delimited runtime-marker identities
  match across all four locales in this range.
- Numeric values are equivalent: `XIX`/`19` at ID 6366 and the written/
  digit item counts at IDs 6370 and 6377 represent the same quantities.
- The `{1}` placeholder at ID 6370 is retained.
- No active CSV structure or text was changed.

## Batch Status

IDs 6350-6399 received one preliminary reading. Findings remain
candidates/questions only and do not authorize edits.
