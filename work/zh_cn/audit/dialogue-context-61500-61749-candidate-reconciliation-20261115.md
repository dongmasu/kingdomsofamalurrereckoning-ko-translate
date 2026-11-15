# Candidate Reconciliation: IDs `61500`-`61749`

- Date: 2026-11-15.
- Rechecked seven new and five earlier candidates against active Korean and
  English, Japanese, and Chinese sources.
- Two earlier findings were corrected (`61586`, `61731`); the other ten
  candidates already had supported wording.
- Preserved the uncertain speech-level finding at `61731` and all other
  evidence-limited holds.

## New Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `61524` | Retained | The objective already reads `스텔란 레이탄(Stellan Reitan)과 대화하기`. |
| `61589` | Retained | The established collectible is already called `로어스톤(Lorestone)` throughout the text. |
| `61619` | Retained | The complete item name is paired as `흠 없는 미타란 증폭 결속구(Flawless Mitharan Amplified Bindings)`. |
| `61658` | Retained | The named figure is fully paired as `조각가(The Carver)`. |
| `61677` | Retained | The complete item name is paired as `흠 없는 미타란 충전 자루(Flawless Mitharan Charged Shaft)`. |
| `61721` | Retained | `화이트스톤 시장의 별장(Whitestone Mayor's Cottage)` already resolves the awkward noun sequence. |
| `61748` | Retained | The complete item name is paired as `흠 없는 미타란 서리 깃든 손잡이(Flawless Mitharan Frosted Hilt)`. |

## Earlier Candidates Rechecked

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `61570` | Retained | The title is fully paired as `컵의 왕 이리온(Irion, King of Cups)`. |
| `61586` | Corrected | Changed `교도관` to `감시관`, matching the same Crownhold Warden at `54727` and `18395`; Japanese also identifies the role as a guard. |
| `61603` | Retained | `이븐타이드(Eventide) 씨족` correctly scopes `clan` to Eventide; `our people` remains the distinct `우리 민족`. |
| `61724` | Retained | The standalone `High Priestess` already uses `대여사제`. |
| `61731` | Corrected | Changed `산적` to `도적` for the Julia rescue quest, matching related rows `33489` and `56611` and Japanese `盗賊`. |

## Holds

- `61731`'s polite request remains a possible register difference because the
  linked quest asset does not identify the individual speaker.
- Holds `61532`, `61578`, `61728`, and the listed embedded-line-ending cases
  remain unresolved; no embedded line endings were normalized.
- No speaker attribution or dialogue order was inferred from asset links.

## Applied Changes

Updated `61586` and `61731` with
`tools/replace_text_preserve_eol.py`. Only these IDs' `source_fingerprint`
fields were refreshed. Existing ledger dispositions and unrelated fields
were preserved.

## Result and Verification

- Seven new candidates were reconciled; five earlier candidates were
  rechecked separately. Two earlier findings were corrected and three were
  already supported.
- Cumulative reconciliation is `3,424 / 4,026` (`85.05%`), with `602`
  remaining.
- All 65,135 ledger fingerprints validate; the index and both catalogs
  reproduce; all 20 preservation/context-index tests pass.
- The CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,839 CRLF separators,
  242 LF-only separators, and no bare CR. The CRLF-aware diff check passes.
- No immutable source CSV, extracted game asset, or game binary was changed.
  No commit was made.
