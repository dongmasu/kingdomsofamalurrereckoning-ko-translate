# Consolidated Context Review: `Yes?` Response Labels

- Date: 2026-10-12.
- Decision: D-19469.
- Scope: `default` IDs 4511, 29232, 30532, 31303, 31564, 31783, and 31937.

## Finding

English `Yes?` is a natural acknowledgment when someone addresses the
speaker. Japanese uses `何だ？` or `何？`, and Chinese uses `怎么了？`,
both supporting a responsive “what is it?” function. Korean `네?`, `응?`,
and `예?` preserve that function. English does not specify the speaker's
honorific level; Japanese is a register reference, not grounds to replace
an otherwise valid Korean response. The adjacent IDs are separate strings
and do not identify a common speaker.

| ID | English | Japanese | Chinese | Active Korean | Disposition |
| ---: | --- | --- | --- | --- | --- |
| 4511 | `Yes?` | `何だ？` | `怎么了？` | `네?` | not an issue |
| 29232 | `Yes?` | `何だ？` | `怎么了？` | `네?` | not an issue |
| 30532 | `Yes?` | `何だ？` | `怎么了？` | `응?` | not an issue |
| 31303 | `Yes?` | `何だ？` | `怎么了？` | `예?` | not an issue |
| 31564 | `Yes?` | `何だ？` | `怎么了？` | `예?` | not an issue |
| 31783 | `Yes?` | `何だ？` | `怎么了？` | `예?` | not an issue |
| 31937 | `Yes?` | `何？` | `怎么了？` | `예?` | not an issue |

The original uncertain entries deferred broad name/glossary concerns that do
not affect these one-word response strings. Seven uncertainties were
resolved as `not an issue`. No Korean CSV cells changed.

## Verification

- Compared English, Japanese source and preserved draft, Chinese, and active
  Korean by `ID_Linha`.
- Reviewed two adjacent IDs on each side where available; they are separate
  strings and do not justify normalizing the seven responses to one voice.
- No runtime markers or embedded line breaks occur in these labels.
- Active default SHA-256 remains
  `f8e237e820c7c362683c3cdb237b750011d6d72116af6165fd66c744e2cc5b96`.
- Totals after D-19469: **2,349 accepted / 25,091 not an issue /
  11,084 uncertain** (38,524). Resume at **D-19470**.
