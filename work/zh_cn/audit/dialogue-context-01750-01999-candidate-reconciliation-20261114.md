# Candidate Reconciliation: IDs `1750`-`1999`

- Date: 2026-11-14.
- Rechecked all 18 current `overall=candidate` ledger IDs in this interval
  against English, Japanese, Chinese, the active Korean CSV, and linked
  evidence reports.
- Seven candidates received source-supported corrections; 11 were retained
  because the current text already reflected the evidence.
- Six related rows outside the interval were also corrected: five Lyra
  spelling/pairing rows and the exact duplicate objective at `18005`.
- The earlier evidence-limited register hold at `1941` remains unresolved.
- Asset association was not used to infer individual speakers or playback
  order.

## Applied Decisions

The SQ144 Lyra Vogard references were checked as a name group. Japanese uses
`ライラ` consistently, supporting `라이라`; six rows were corrected or had
their English pairing restored at `1835`, `5388`, `9190`, `10033`, `33255`,
and `62233`. The five other reviewed group rows already used the accepted
spelling and pairing. Distinct `Lyra Turrelm` labels were not conflated with
Lyra Vogard.

At `1869`, “wise to obvious attacks” was clarified as noticing them, following
Japanese and Chinese. At `1882`, the marked `-는군` ending was changed to
conversational plain speech consistent with the sentence and Japanese; no
speaker was assigned. At `1901`, `그와` was removed because all three source
languages describe the speaker and addressee crossing paths. At `1905`, the
malformed prohibition was corrected to express not taking the speaker below
the tower.

The `Find the other remains` objective at `1961` and its exact-source copy at
`18005` were aligned as `다른 유해 찾기`, preserving the concise objective
form. The long lore passage at `1993` was reread in full; two mismatched
particles after `타인(Tine)` were corrected without changing its paragraphs
or historical claims.

## Retained

IDs `1784`, `1791`, `1806`, `1860`, `1865`, `1866`, `1893`, `1909`, `1936`,
`1969`, and `1988` already preserve the supported meaning, terminology, or
complete English pairing. All 19 exact-English `Maire, Queen of Cups` rows
were confirmed to use the same complete Korean title.

## Verification

- Thirteen changed rows were applied sequentially by ID with
  `tools/replace_text_preserve_eol.py`; only their ledger
  `source_fingerprint` fields were refreshed.
- All 18 current candidates in the interval have dispositions in the
  machine-readable
  [`decision manifest`](dialogue-context-final-edits-followup-01750-01999-20261114.json).
- Candidate reconciliation now covers 114 of 4,015 current candidates
  (2.84%). This is not full candidate-review completion.
- No commit was made.
