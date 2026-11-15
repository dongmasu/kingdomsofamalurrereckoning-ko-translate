# Classification

`default-quest-asset-index.tsv` maps default localization IDs to candidate
quest assets. `dialogue-context-id-catalog.tsv` and
`dialogue-context-asset-catalog.tsv` summarize ID- and asset-level grouping.
Regenerate and check these files with
`python3 work/zh_cn/audit/build_dialogue_context_index.py` and its `--check`
mode.

Asset associations and handler names are grouping evidence, not proof of an
individual speaker, dialogue order, or branch flow. The per-ID review ledger
and chronological findings remain in `work/zh_cn/audit/`.
