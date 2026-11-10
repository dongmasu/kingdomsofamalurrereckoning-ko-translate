# FFQ116 / Kreger the Devout Dialogue and Quest-Text Revalidation

- Date: 2026-11-10.
- Scope: all 28 `default` keys found in `1388542.quest_bxml` (`FFQ116`).
- Translation CSVs and extracted resources were not modified.
- English anchors meaning; Japanese is the primary style/register check;
  Chinese is supporting evidence.

## Grouping Evidence

The asset contains `QUEST_ID FFQ116`, the asset-level symbol
`NPC_KLU_ALM_KregerCoil`, two quest-target handlers, and 12 serialized
`dialog_line_*` handlers. All 28 exact-key matches were compared across the
active Korean, English, Japanese, and Chinese `default` tables. The quest
concerns collecting Alfar soldiers' earrings from the Midden, counting the
dead, and returning the keepsakes to civilians in Erathell. ID `47022`
explicitly identifies the first-person speaker as Kreger, a cleric of
Mitharu; the asset symbol independently associates this quest resource with
Kreger.

Content separates 22 dialogue-like or player-choice strings from six
objective, item/UI, quest-journal, or title strings. The self-introduction
supports identifying the speaker at `47022`; the asset-level NPC symbol does
not map the other keys to that character or to individual handlers. Callback,
branch, addressee, and playback order remain unverified.

## Revalidation Findings

This is a read-only reviewer finding, not approval to edit the active
translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `10918` | Naturalness / objective wording | `Collect Alfar Earrings` is an objective label, but the Korean `알파르(Alfar) 귀걸이를 모아라` is an imperative. The Japanese `アルファーの耳飾りを集める` and the project's established Korean objective style support a noun-form action label. | High |

Consider `알파르(Alfar) 귀걸이 모으기` at `10918`. The other 27 rows showed
no clearly supported meaning, naturalness, register, address, honorific, or
format defect in this pass. In particular, the source references support the
Korean distinction between dialogue about the earrings, the journal account
of Kreger's request, and the separate objective label. The repeated humble
religious phrasing in `47022` is present in English and Japanese and was
retained.

No embedded line breaks, runtime brace tokens, or markup were found in the
28 active Korean rows.

## Coverage and Limits

All 28 asset-linked IDs were reviewed for content type, meaning, Korean
naturalness, speech level, address, honorifics, and format as applicable.
The finding and four-language fingerprints are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).

The mapping from localization keys to callbacks, branches, individual
speakers, and playback sequence remains unresolved; callback serialization
order is not treated as playback order.
