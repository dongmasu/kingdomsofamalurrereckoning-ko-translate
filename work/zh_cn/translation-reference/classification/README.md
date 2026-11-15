# Classification

`default-quest-asset-index.tsv` maps default localization IDs to candidate
quest assets. `dialogue-context-id-catalog.tsv` and
`dialogue-context-asset-catalog.tsv` summarize ID- and asset-level grouping.
Regenerate and check these files with
`python3 work/zh_cn/audit/build_dialogue_context_index.py` and its `--check`
mode.

A successful check means the files match the current generator, not that
every verified resource relationship has been incorporated. The quest
indexes include registry names as separate asset-level evidence; these names
do not replace embedded `QUEST_ID` values or map dialogue lines to speakers.
Regenerate them after source changes; never hand-edit generated TSVs.

[`resource-corpus-map.md`](resource-corpus-map.md) records the confirmed
resource families, filename patterns, and relationship evidence found in the
read-only extracted corpus. Use it to choose which assets to inspect before
translating; it describes this game's corpus and is not a universal schema.

Asset associations and handler names are grouping evidence, not proof of an
individual speaker, dialogue order, or branch flow. The per-ID review ledger
and chronological findings remain in `work/zh_cn/audit/`.

The supplemental resource indexes in this directory inventory `.batch`
records and validated BXML Lua-family envelopes. The
[`lua-script-localization-literal-index.tsv`](lua-script-localization-literal-index.tsv)
records exact printable-string matches to English `default` text; a match does
not prove runtime execution or display. See
[`resource-container-summary.json`](resource-container-summary.json) and the
[dated extraction/re-encoding audit](../../audit/lua-script-extraction-and-reencoding-20261115.md)
for scope, exact round-trip checks, and parser limits.
