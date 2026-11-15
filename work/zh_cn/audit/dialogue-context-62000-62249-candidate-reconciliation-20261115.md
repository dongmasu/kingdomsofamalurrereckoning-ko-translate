# Candidate Reconciliation: IDs `62000`-`62249`

- Date: 2026-11-15.
- Rechecked nine new candidates against the active Korean text and English,
  Japanese, and Chinese sources.
- Corrected `62177`; the other eight already had supported wording.
- Rechecked 12 earlier candidates without changing their disposition or
  translation. Three source/context questions remain held.

## New Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `62038` | Retained | The current equipment effect consistently uses the established stat term `체력`; its existing embedded CRLF layout remains unchanged. |
| `62070` | Retained | The reflective letter already ends conversationally with `진정한 안식을 얻을 텐데`; its paragraph layout remains unchanged. |
| `62160` | Retained | `라즈의 아들(Son of Laz)` preserves the English kinship meaning and name pairing; the Japanese label differs and remains a source discrepancy. |
| `62169` | Retained | `옆방 노움은 이야기 나누고 싶어 하겠지만, 난 아니야` is consistently casual and avoids the earlier awkward `당신`/informal-ending mix. |
| `62177` | Corrected | English says Ommer's zest for life rivals that of a man half his age. The revised final clause explicitly identifies both the passion being compared and the younger man's age reference. |
| `62191` | Retained | `세 자루의 검(Three Swords)` preserves the established epithet and its English pairing. |
| `62194` | Retained | `안녕하세요.` matches the neutral/polite Japanese and Chinese greetings. |
| `62214` | Retained | The source's nautical `vessel` is correctly rendered as `배`, not a badge. |
| `62231` | Retained | The equipment component uses the established `결속구` term. |

## Earlier Candidates Rechecked

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `62000` | Retained | The title and `Argine` are both paired with English in the current Korean text. |
| `62029` | Retained | `애써 구해 왔어` already conveys the effort in `drudged up`. |
| `62054` | Held | `dreg` remains ambiguous across the available sources; no insult or name is inferred. |
| `62087`, `62181` | Retained | Both use the established collectible term `연도문`. |
| `62104` | Held | Japanese is casual, but the available evidence still does not identify the speaker reliably enough to impose a register change. |
| `62156` | Held | English's singular possessive `Hospitalis Quarter's` conflicts with the established plural place name; the source discrepancy is not silently normalized. |
| `62168` | Retained | The current polite address is supported by the Japanese source. |
| `62192` | Retained | The current greeting consistently uses polite Korean and preserves the welcome to Nyralim's guest. |
| `62230` | Retained | The quest-log sentence identifies Brun's two tales and the Bolgan camp location clearly enough; no unsupported speaker or event detail was added. |
| `62233` | Retained | The Korean correctly preserves the rescue from death and the speaker's belief that Lyra was gone. |
| `62249` | Retained | `계속 그를 압박해!` remains a plausible tactical reading of `Keep on him!`; no speaker identity is inferred. |

## Holds and Formatting

- Existing meaning/register holds `62041`, `62077`, `62122`, `62166`, and
  `62239` remain unresolved for the evidence limits documented in the
  sequential review.
- Embedded-line-ending holds remain unchanged. No paragraph or token layout
  was normalized.
- No speaker attribution or dialogue order was inferred from asset links.

## Result and Verification

- Nine new candidates were reconciled: one correction was applied and eight
  already matched supported wording.
- Twelve previously recorded candidates were rechecked; three source/context
  questions remain held.
- Cumulative reconciliation is `3,441 / 4,026` (`85.47%`), with `585`
  remaining.
- The only changed Korean row is `62177`; its ledger source fingerprint was
  refreshed. All 65,135 ledger fingerprints validate, and the regenerated
  index and both catalogs reproduce exactly.
- All 20 preservation/context-index tests pass. The Korean CSV retains its
  65,135 ordered IDs, UTF-8 BOM, 71,839 CRLF separators, 242 LF-only
  separators, and no bare CR. The CRLF-aware diff check passes.
- No immutable source CSV, extracted game asset, or game binary was changed.
  No commit was made.
