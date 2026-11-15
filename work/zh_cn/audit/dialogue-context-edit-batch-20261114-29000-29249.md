# Dialogue Context Translation Edit Batch: IDs `29000`-`29249`

- Date: 2026-11-14.
- Rechecked all 17 current candidates against English, Japanese, Chinese,
  active Korean, and existing linked reports.
- Applied one additional correction at `29220`; the other 16 candidates
  already reflected their supported findings and were retained.
- Preserved three evidence-limited holds: `29048`, `29081`, and `29216`.
- No speaker or playback order was inferred from asset membership.

## Applied Correction

| ID | Correction |
| ---: | --- |
| `29220` | Changed `문집` to `대형 서책` for `folios`. English, Japanese's `folio`, and Chinese `对开本` identify a large-format book, not a collection of works. The surrounding list of tomes, folios, and tracts remains parallel and retains its playful sales pitch. |

## Reconciled Candidate Findings

The following current rows already matched their supported directions; no
additional text edit was needed:

- `29027`: paired the Scholia rank `Neophyte` as `초심자(Neophyte)`.
- `29034`: aligned the local `Pryderi` spelling with the source and the
  repeated Wyl quest entry.
- `29040`: made the speaker's insincere good-luck wish read naturally.
- `29050`: retained the conversational expression of regret.
- `29063`: completed the playful aside `너무 많이는 말이야` while preserving
  the pause.
- `29121`: kept the journal entry in written narration.
- `29131`: restored the explicit instruction to know the speaker is close to
  freedom and preserved the polite register.
- `29148`: clarified the double-negative and retained the conversational
  warning about the Cradle of Summer.
- `29162`: aligned the arena journal's narration and tense across its clauses.
- `29169`: paired the formal rank as `사반트(Savant)`.
- `29173`: retained `성스러운 연못(Sacred Pools)` and the established
  `샘(The Font)` pairing.
- `29203`: removed the unsupported human-species implication from
  `You're a disgrace`.
- `29204`: corrected the object particle after `울프 팩(Wolf Pack)`.
- `29213`: retained the source-local spelling `Lupoku` rather than silently
  changing it to the more common `Lopoku`; the Korean reads it as an
  invocation about the speaker's bad luck.
- `29219`: replaced the analytical-sounding literal for `unreasonable` with
  the conversational `막무가내인`.
- `29224`: retained the written quest-completion ending.

The `29213` spelling is scoped to this English source row; it does not alter
the separate `Lopoku` source spellings or their existing decisions.

## Holds And Verification

- `29048` remains held because the relation implied by `stood apart` is
  unclear without the speaker's history.
- `29081` remains held pending a consistent Korean title for `Ancient of
  War`.
- `29216` remains held because the project has not resolved the scoped UI
  translation of the character statistic `health`.
- Only `default:29220`'s Korean `Texto` field changed. Its four-language
  fingerprint alone was refreshed; the ledger disposition and all other
  fields were preserved.
- The default CSV retains its BOM, row order, and line-ending inventory.
  The changed sentence has no runtime tokens or embedded line breaks.
- Full-ledger validation, index/catalog checks, the 20 preservation and
  context-index tests, and the CRLF-aware diff check pass.
- No commit was made.
