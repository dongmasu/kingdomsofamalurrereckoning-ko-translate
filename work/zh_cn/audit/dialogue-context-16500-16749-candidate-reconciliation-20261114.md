# Candidate Reconciliation: IDs `16500`-`16749`

- Date: 2026-11-14.
- Scope: all nine current ledger candidates in the range, compared across
  English, Japanese, Chinese, and active Korean.
- All nine existing corrections were confirmed. The exact-English duplicate
  candidate at `33194` was also rechecked and confirmed.
- The active Korean CSV required no further edit in this range.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `16518` | Previously applied, confirmed | English `resting place` and Japanese `眠る場所` describe where the amulet was kept. `안치된 곳` preserves the sacred context without the vague `제자리`. |
| `16561` | Previously applied, confirmed | English and Chinese thank the player for bringing the bad news. Japanese phrases this as an apology, but the current Korean follows the English meaning and retains the acknowledgment of good intent and the offered reward. |
| `16582` | Previously applied, confirmed | English and Japanese use `Father Dynwel` without a Korean honorific. `딘웰 신부` also fits the following contemptuous insult; no specific speaker was inferred. |
| `16584` | Previously applied, confirmed | English and Chinese make clear that the speaker has items for sale. `필요한 물건이 있으면 팔고 있어` conveys the vendor's offer rather than the player's ability to buy. |
| `16617` | Previously applied, confirmed | The conversational explanation now ends with `보상을 줄게`, avoiding the isolated archaic `주마`. Its exact-English duplicate at `33194` has the same English, Japanese, Chinese, and Korean text and was checked alongside it. |
| `16665` | Previously applied, confirmed | English names `Cliffbreak Fasting`; Japanese and Chinese describe the passage. The established source-specific name `클리프브레이크 패스팅(Cliffbreak Fasting)` is used consistently in all six corpus occurrences: `16665`, `32938`, `41076`, `53501`, `59068`, and `61813`. |
| `16681` | Previously applied, confirmed | English, Japanese, and Chinese describe the owner being startled/chased away and leaving the bestiary. `주인이 놀라 달아나면서` states the supported flight naturally without inventing who chased the owner. |
| `16687` | Previously applied, confirmed | Japanese identifies five litany books (`連祷書`); the Lost Litanies context and established terminology support `연도문 다섯 권`, not generic `기도문`. |
| `16719` | Previously applied, confirmed | The poem's own name pattern pairs Ohn and Mihari; `이사(Ysa)가` now pairs the remaining proper name. Its four verse lines and three embedded line breaks remain intact. |
| `33194` | Linked candidate, previously applied and confirmed | This is an exact-English duplicate of `16617`. All four language rows match their counterpart, including the natural conversational ending `보상을 줄게`. |

## Related Findings

- `16675`, `16655`, and other evidence-limited findings in the range remain
  holds under their existing reports; this reconciliation does not guess at
  ambiguous meanings or force unrelated terminology.
- The earlier `16000`-`16999` edit batch records the original source-based
  corrections and the aligned duplicate/location groups. This pass confirms
  those edits against the current language rows and candidate ledger.
- Asset associations do not establish a particular speaker or playback
  order.

## Verification

- All nine in-range candidates and linked candidate `33194` are reconciled.
  Cumulative reconciliation is 924 / 4,015 (23.01%), with 3,091 remaining.
- No translation CSV or ledger fingerprint changed in this range; the
  current four-language fingerprints validate.
- The `16719` poem retains all four lines and its three embedded line breaks.
  No other candidate row contains embedded line breaks or runtime/layout
  markers.
- The full ledger, generated index/catalog checks, relevant regression
  suites, CSV structure/newline inventory, and CRLF-aware diff check are
  recorded as verified.
- Source CSVs and extracted game assets were not changed.
