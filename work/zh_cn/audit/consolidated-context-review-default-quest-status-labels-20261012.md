# Consolidated Context Review: Quest Completion and Failure Labels

- Date: 2026-10-12.
- Decision: D-19465.
- Scope: 29 open `Quest Complete` labels and 12 open `Quest Failed` labels,
  joined by `ID_Linha` across the English, Japanese source and preserved
  draft, Chinese, and active Korean CSVs.

## Findings

| English label | IDs | Disposition | Evidence |
| --- | --- | --- | --- |
| `Quest Complete` | 28225, 28264, 28500, 28810, 29021, 29070, 29078, 29233, 29249, 29298, 29629, 29788, 29935, 30154, 30185, 30437, 30441, 30896, 30975, 31079, 31150, 31517, 31693, 31787, 31830, 31923, 32004, 32139, 32195 | not an issue | Every locale identifies completion of a quest. Japanese `クエスト完了`, Chinese `任务完成`, and active Korean `퀘스트 완료` agree directly with English. |
| `Quest Failed` | 28210, 28259, 28635, 28807, 29515, 29552, 31142, 31147, 31530, 31561, 31731, 31926 | not an issue | Every locale identifies failure of a quest. Japanese `クエスト失敗`, Chinese `任务失败`, and active Korean `퀘스트 실패` agree directly with English. |

All 41 IDs were still marked `uncertain` in their latest explicit register
entries before this review. The repeated labels resolve the complete
English-led UI meanings; no row-specific context is needed to distinguish
completion from failure. The active Korean cells already match the
preserved Japanese-derived draft exactly.

No Korean CSV cells changed. No backup was needed. This review does not
reopen neighboring quest titles or dialogue.

## Verification

- All five resources were read by ID; the 41 targeted keys each occur once
  in each resource.
- English values are exactly `Quest Complete` or `Quest Failed`; Japanese,
  Chinese, draft Korean, and active Korean agree on the corresponding state.
- No runtime markers or embedded line breaks occur in these labels.
- Active default SHA-256 remains
  `f8e237e820c7c362683c3cdb237b750011d6d72116af6165fd66c744e2cc5b96`.
- Totals after D-19465: **2,349 accepted / 25,048 not an issue /
  11,127 uncertain** (38,524). Resume at **D-19466** from the deduplicated
  unresolved-source queue.
