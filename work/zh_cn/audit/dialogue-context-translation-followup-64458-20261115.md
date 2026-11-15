# Translation Follow-up: ID `64458`

- Date: 2026-11-15.
- Reopened the wording hold after comparing the full English, Japanese, and
  Chinese sentence rather than treating the final clause in isolation.

## Decision

| ID | Result | Evidence |
| ---: | --- | --- |
| `64458` | Corrected | English asks what the listener will take away when all is over, then answers “The stories.” Japanese says what remains is stories and that the Fae are real within them (`この中では本物`). Chinese instead says the Fae are right about this point. The sources differ in phrasing, but English and Japanese support the story-world reading; Korean `이야기 속에서는 진실해` incorrectly makes the Fae sound truthful. |

The full line now reads:

> 이 모든 일이 끝나면 네가 가져갈 건 이야기겠지. 페이(Fae)는 거친 광기에 휩싸인 존재일지 몰라도, 이야기 속에서는 실재해.

This keeps the plain conversational register and expresses the supported
meaning without assigning a speaker or adding dialogue order.

## Verification

- Only `default:64458`'s Korean `Texto` field changed, using the
  byte-preserving editor.
- Only ID `64458`'s four-language `source_fingerprint` changed; ledger
  disposition fields and row order were preserved.
- The earlier uncertain status is retained as historical ledger data; this
  follow-up records the supported text correction.
- No immutable source CSV, extracted game asset, or binary changed.
- No commit was made.

See the
[`decision manifest`](dialogue-context-final-edits-followup-64458-20261115.json)
and the earlier
[`evidence-hold follow-up`](dialogue-context-evidence-hold-followup-64252-64458-20261115.md).
