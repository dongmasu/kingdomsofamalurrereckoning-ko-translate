# Candidate Reconciliation: IDs `63500`-`63749`

- Date: 2026-11-15.
- Rechecked eight earlier candidates against the active Korean text and
  English, Japanese, and Chinese sources.
- Corrected `63576`, `63585`, and `63672`; the other five already reflected
  supported wording or terminology.
- `63566` and `63612` had already been reconciled in earlier linked reviews;
  the other six earlier candidates are newly counted here.
- The five corrections previously accepted at `63507`, `63562`, `63600`,
  `63603`, and `63708` remain present and were not rewritten.
- The sequential review found no new correction candidates. Existing
  evidence-limited holds remain unresolved.
- English anchors meaning, Japanese is the primary reference for voice,
  register, and phrasing, and Chinese is supporting evidence.

## Earlier Candidates Rechecked

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `63517` | Retained | `하늘 위의 도시` already renders “the city on high” naturally. |
| `63566` | Retained | The journal-style entry already uses the supported quest-log register and preserves the harvest objective and spider condition. |
| `63576` | Corrected | Recast the incomplete title `투아사(Tuatha) 저주` as `투아사의 저주(Tuatha Curse)`, consistent with the Japanese possessive and established creature name. |
| `63578` | Retained | The active text already uses the standardized `연도문`; whether this means a particular book or ritual remains unresolved. |
| `63585` | Corrected | The first clause is present tense in English and Japanese, followed by a self-correction to the past. Changed `총애를 받았어` to `총애를 받고 있어`, preserving the subsequent `아니, 한때는 그랬지`. |
| `63612` | Retained | This line uses `처형인(Headsman)`. Cross-checking all 23 English references confirms the same paired Korean form throughout. |
| `63620` | Retained | `성스러운 연못(Sacred Pools)` and the count of two locations are already clear; all seven English references use the same paired term. |
| `63672` | Corrected | Rephrased the objective as `그월흐마이(Gwalchmai)가 계약서에 서명하게 하기`, making the requested signer explicit and retaining the established `-하기` objective form. |

## Related Consistency Checks

- The proposed `처형인(Headsman)` form is already present in all 23
  references, including quest objectives and narrative rows.
- All seven `Sacred Pools` references use `성스러운 연못(Sacred Pools)`;
  source-specific counts of four or five remain unchanged.
- `Tuatha Curse` has one active source row, now paired in full.
- No speaker attribution or dialogue order was inferred from asset links.

## Holds And Formatting

- The 39 new evidence-limited holds and the 12 report-only rechecks in the
  sequential range report remain held; no unsupported name, lore, or source
  conflict was resolved.
- Embedded CRLF line breaks and runtime-marker order, including the two
  localized display markers at `63708`, were preserved.
- No immutable source CSV, extracted game asset, or game binary was changed.

## Result And Verification

- Three Korean rows changed: `63576`, `63585`, and `63672`. Only their
  `Texto` fields changed, and only their ledger `source_fingerprint` fields
  were refreshed.
- No new sequential-review candidates were added. Six earlier linked
  candidates were newly counted, while `63566` and `63612` were not counted
  twice. Cumulative reconciliation is `3,494 / 4,026` (`86.79%`), with
  `532` remaining.
- All 65,135 ledger fingerprints validate. The index and both catalogs
  reproduce; all 11 CSV-preservation tests and nine context-index tests pass.
- The Korean CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,839 CRLF
  separators, 242 LF-only separators, and no bare CR. The CRLF-aware diff
  check passes.
- No commit was made.
