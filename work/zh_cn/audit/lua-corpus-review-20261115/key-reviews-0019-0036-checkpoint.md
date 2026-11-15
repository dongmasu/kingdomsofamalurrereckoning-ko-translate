# Task6 Key Review Completion Checkpoint

Date: 2026-11-15

## Scope And Decisions

- Completed packets `0019`-`0036`: 18 packets, 900 unique `(resource, id,
  variant)` keys.
- Packet `0036` manual decisions: 50 keys (49 retain, 1 unresolved). `default:41648`
  remains unresolved because the locale labels do not establish whether
  “Recipes” is limited to cooking or covers other crafting. `default:41811`
  retains the broad art meaning; its classification and Lua evidence do not
  establish a UI or credit display role.
- Merged the prior 850 manual decisions with packet `0036` by exact key.
  Applied the two exact-key overrides for `default:19597` and `default:25934`,
  preserving their conflict rationales. No duplicate, missing, or extra keys
  remained.
- Expanded metadata uses each packet row's exact four locale fingerprints and
  its available `packet_ref`. No decisions were generated heuristically or
  propagated across variants.
- Final dispositions: **864 retain, 35 unresolved, 1 proposed correction**.
  The proposal remains provisional and does not authorize a translation edit.

## Output And Validation

- Manual packet decisions: `review-decisions-0036.jsonl` (50 rows).
- Expanded canonical output: `key-reviews-0019-0036.jsonl` (900 rows, full
  11-field schema).
- Validation passed: 900 packet keys and 900 reviewed keys; no duplicate,
  missing, extra, stale-fingerprint, or unavailable-reference errors.
- Command:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 tools/lua_translation_candidates.py validate-key-reviews \
  --packets \
  work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0019.jsonl \
  work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0020.jsonl \
  work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0021.jsonl \
  work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0022.jsonl \
  work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0023.jsonl \
  work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0024.jsonl \
  work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0025.jsonl \
  work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0026.jsonl \
  work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0027.jsonl \
  work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0028.jsonl \
  work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0029.jsonl \
  work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0030.jsonl \
  work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0031.jsonl \
  work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0032.jsonl \
  work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0033.jsonl \
  work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0034.jsonl \
  work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0035.jsonl \
  work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0036.jsonl \
  --reviews work/zh_cn/audit/lua-corpus-review-20261115/key-reviews-0019-0036.jsonl
```

No translation CSV, source, reference, existing draft, or override files were
edited for this completion.
