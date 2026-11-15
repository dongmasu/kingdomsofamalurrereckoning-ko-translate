# Dialogue Context Translation Edit Batch: IDs `29750`-`29999`

- Date: 2026-11-14.
- Rechecked all 26 current ledger candidates against English, Japanese,
  Chinese, active Korean, and linked review reports.
- Applied three further corrections at `29774`, `29808`, and `29809`.
  The other 23 candidates already reflected their supported findings.
- Preserved the evidence-limited terminology hold at `29826`.

## Applied Corrections

| ID | Correction |
| ---: | --- |
| `29774` | Restored the player as the person who helped Grim end the Hierophant's tyranny, and clarified that Grim called the player a new Travelers hero and gave them the `Chariot` alias. English and Chinese make the subject explicit; Japanese's omitted subject does not contradict it. |
| `29808` | Corrected the English pairing to the exact source form `Wyvyrn-Gifres` (plural), retaining the established Korean family spelling `와이번-기프르`. |
| `29809` | Replaced the archaic vocative ending with the unmarked conversational farewell `부름받은 자(Beckoned), 여행 잘 다녀와.` |

## Retained Candidate Findings

The following 23 candidate findings already matched the current Korean text:

- `29758`, `29770`, `29779`, `29791`, `29799`, `29801`, `29805`,
  `29811`, `29824`, `29842`, `29852`, `29867`, `29878`, `29888`,
  `29900`, `29911`, `29917`, `29939`, `29953`, `29959`, `29962`,
  `29990`, and `29998`.
- The established local `장다리(Longlegs)` form at `29791` was retained.
  The row-specific `Lupoku` spelling at `29852` follows that English source;
  it does not alter separate `Lopoku` source rows.
- `29917`'s `날마다` is supported by English `spent her days`, Japanese
  `日々`, and Chinese `整日`; it was not removed as an addition.

## Hold And Verification

- `29826` remains held because the repeated phrase's relationship to the
  Warsworn order and its status as a title versus description are unresolved.
- Only the Korean `Texto` fields for `29774`, `29808`, and `29809` changed.
  Only these three ledger fingerprints were refreshed; dispositions and all
  other ledger fields were preserved.
- The edited rows have no runtime tokens or embedded line breaks. The full
  ledger, index/catalog checks, 20 preservation and context-index tests, and
  CRLF-aware diff check pass.
- No commit was made.
