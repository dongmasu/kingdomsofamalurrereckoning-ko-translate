# Dialogue Context Revalidation: `570082.quest_bxml`

- Date: 2026-11-14.
- Scope: all 111 `default` IDs linked to this asset by exact 8-byte key match.
- The asset contains one NPC symbol (`NPC_MQ_SEE_Erawn`) and 40 conditional
  dialog-line handlers. Every handler is named with the `MQ06` prefix, which
  supports a probable `MQ06` quest association even though the asset has no
  explicit `QUEST_ID`.
- These are asset- and handler-level clues only. No handler was mapped to an
  individual localization ID, so speaker attribution remains `unassigned` and
  playback order remains `unknown`.
- The current asset catalog counts 109 of the 111 IDs as ledger-linked.
  Existing ledger rows for `47808` and `47884` refer to `570082` without the
  `.quest_bxml` suffix. The canonical index links both IDs to this asset, but
  the append-only ledger rows were left unchanged; this discrepancy is
  documented rather than silently rewriting prior evidence.

## Translation Review

All 111 linked rows were compared across English, Japanese, Chinese, and the
active Korean CSV for meaning, Korean naturalness, register, names, and
formatting. Individual speakers and playback positions were not inferred.

- No cross-language line-break or runtime-token mismatches were found.
- No exact-English duplicate group within the asset had divergent Korean
  translations.
- ID `49575` remains held: the sources shift between collective and singular
  wording around `our help` / `my knowledge`. Korean preserves that contrast;
  the asset does not resolve the intended speaker or number.
- IDs `1113` and `63061` share the exact source sentence “They come, they act,
  and they pass on as written.” Japanese and Chinese also use the same
  sentence. Their Korean endings differed, so both now use
  `그들은 정해진 대로 나타나 행동하고 사라져 갔다.`

Only IDs `1113` and `63061` were edited. Their ledger review dispositions and
all fields other than `source_fingerprint` were preserved. The active Korean
CSV was edited with `tools/replace_text_preserve_eol.py`; no reference CSV or
extracted asset was modified.
