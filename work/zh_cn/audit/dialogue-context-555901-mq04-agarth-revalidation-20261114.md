# Dialogue Context Revalidation: `555901.quest_bxml`

- Date: 2026-11-14.
- Scope: all 135 exact-key asset matches and the eight linked IDs with prior
  candidate or uncertainty findings.
- The asset contains the NPC symbol `NPC_DAL_VAR_Agarth` and 56
  `MQ04`-prefixed dialog-line handlers, but no explicit `QUEST_ID`. These
  asset-level clues do not identify the speaker of an individual key or its
  playback order.
- The all-ID catalog links 135 IDs to this asset; existing ledger metadata
  links 133. IDs `47725` and `47983` are the missing asset associations.
  Their existing ledger rows were not rewritten.

## Rechecked Findings

- `945` and `2532`: the same English question is polite in Korean but plain
  in Japanese. Retain the register hold; the asset does not map either key to
  a speaker or relationship.
- `12035`: English and Korean leave the fate of the Tuatha broad; Japanese
  says they were repelled and Chinese says they were killed. No narrower
  result is supported.
- `27888`: the active Korean already conveys “Fae or not” without leaving
  the subject ambiguous and preserves the sobriety condition; no edit was
  needed.
- `35555`: English and Chinese say `scrying mirror`, while Japanese
  identifies `Tyrnoch's Eye`. The active generic `점술 거울` remains
  appropriately unresolved.
- `37115` and `40387`: the exact same English line now uses the same paired
  group name, `먼지의 자손(Children of Dust)`, in both Korean rows.
- `63703`: the English clause is malformed and the references do not settle
  the intended nuance. The active Korean was retained rather than inventing
  a more specific motivation.

Only ID `37115` was changed. Its existing ledger decision was preserved; only
its `source_fingerprint` was refreshed. No asset link was added for
`47725` or `47983`, and no speaker or order was inferred.
