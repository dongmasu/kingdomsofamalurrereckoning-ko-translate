# Task 1 Input Checkpoint

Snapshot SHA-256: `2729ecb37d2870dfc73192a18e9c2f55981ee7687ada5ce15477cf692c023ad1`

The snapshot records 13,300 immutable files and a separate inventory of
13,268 occurrences: 5,362 standalone BXML, 4,240 batch-nested BXML, and
3,666 batch scripts. There are 6,361 distinct payload hashes, 606
payload-containing files, and 12,337 scanned files.

The 13 pilot keys cover all occurrence kinds, all four container extensions,
the single observed 14-byte header group, the minimum and maximum payload
sizes per kind, and the three pinned FFQ35 hashes. Selection is the
lexicographically first occurrence per stratum with ties resolved by key.
Detailed counts, ranges, hashes, and selected records are in
`pilot-inventory.json`.

```text
1164038.quest_bxml|bxml|1323
1164038.quest_bxml|bxml|699
1259900.quest_bxml|bxml|107
1322617.interaction_bxml|bxml|135
134225858_ksmt.batch|batch_bxml|10056074:1408290
134225858_ksmt.batch|batch_bxml|30744203:2117289
134230570_klua.batch|batch_script|10005549:1594688
134230570_klua.batch|batch_script|11166655:1793029
134230570_klua.batch|batch_script|7544685:1164041
134230570_klua.batch|batch_script|930574:13535
134415964_inac.batch|batch_bxml|125903:1516722
1609154.loottable_bxml|bxml|2331
561141.quest_bxml|bxml|113031
```

## Initial Dirty Worktree

Recorded before Task 1 changes; `M` denotes modified tracked files and `??`
denotes untracked files. Ignored files are not included.

```text
 M .gitignore
 M TRANSLATION-ROLE.md
 M references/README.md
 M work/zh_cn/audit/build_dialogue_context_index.py
 M work/zh_cn/audit/dialogue-context-review-ledger.tsv
 M work/zh_cn/audit/test_build_dialogue_context_index.py
 M work/zh_cn/locatexts_zh_cn.koalocatext_default.csv
 M work/zh_cn/translation-reference/README.md
 M work/zh_cn/translation-reference/classification/README.md
 M work/zh_cn/translation-reference/classification/default-quest-asset-index.tsv
 M work/zh_cn/translation-reference/classification/dialogue-context-asset-catalog.tsv
 M work/zh_cn/translation-reference/classification/dialogue-context-id-catalog.tsv
 M work/zh_cn/translation-reference/duplicates/exact-english-default-groups.jsonl
 M work/zh_cn/translation-reference/exceptions/translation-exceptions.md
?? docs/superpowers/plans/2026-11-15-lua-corpus-translation-review.md
?? docs/superpowers/plans/2026-11-15-lua-resource-codec.md
?? docs/superpowers/specs/2026-11-15-lua-corpus-translation-review-design.md
?? tools/extract_lua_scripts.py
?? tools/index_lua_localization_literals.py
?? tools/lua_resource_codec.py
?? tools/reencode_lua_scripts.py
?? tools/test_lua_localization_literals.py
?? tools/test_lua_resource_codec.py
?? work/zh_cn/audit/analyze_resource_containers.py
?? work/zh_cn/audit/bxml-lua-and-classification-gap-20261115.md
?? work/zh_cn/audit/dialogue-naturalness-hold-rereview-20261115.md
?? work/zh_cn/audit/dialogue-naturalness-hold-rereview-corrections-20261115.tsv
?? work/zh_cn/audit/ffq35-lua-sample-20261115.disassembly.txt
?? work/zh_cn/audit/ffq35-lua-sample-20261115.md
?? work/zh_cn/audit/ffq35-lua-sample-20261115.reconstructed.lua
?? work/zh_cn/audit/lua-script-extraction-and-reencoding-20261115.md
?? work/zh_cn/audit/probe_ffq35_lua.py
?? work/zh_cn/audit/test_analyze_resource_containers.py
?? work/zh_cn/audit/test_probe_ffq35_lua.py
?? work/zh_cn/audit/unpacked-bin-resource-analysis-20261115.md
?? work/zh_cn/audit/unpacked-resource-container-analysis-20261115.md
?? work/zh_cn/audit/unpacked-resource-inventory-and-relationships-20261115.md
?? work/zh_cn/translation-reference/classification/bxml-lua-payload-index.tsv
?? work/zh_cn/translation-reference/classification/bxml-resource-catalog.tsv
?? work/zh_cn/translation-reference/classification/lua-script-localization-literal-index.tsv
?? work/zh_cn/translation-reference/classification/lua-script-registry-index.tsv
?? work/zh_cn/translation-reference/classification/quest-script-asset-links.tsv
?? work/zh_cn/translation-reference/classification/resource-batch-catalog.tsv
?? work/zh_cn/translation-reference/classification/resource-container-summary.json
?? work/zh_cn/translation-reference/classification/resource-corpus-map.md
```
