# Consolidated Context Review: Template and Unavailable-Use Labels

- Date: 2026-10-12.
- Decision: D-19448.
- Scope: remaining open IDs 46626 and 46650 from the earlier composite hold
  D-14238. ID 46628 was already resolved separately under D-19446 and is
  not recounted.

## Decision

| ID | English | Japanese | Chinese | Active Korean | Disposition |
| ---: | --- | --- | --- | --- | --- |
| 46626 | `Don't Use Template` | `テンプレートを使わない` | `请勿使用模板` | `템플릿 사용 금지` | not an issue |
| 46650 | `Charm Armor [DO NOT USE]` | `魅了防御力(使用不可)` | `符咒护甲 [不可用]` | `Charm Armor [DO NOT USE]` | not an issue |

At 46626, Korean accurately conveys the source instruction; uncertainty
about whether the string is internal or displayed does not show a
translation error. At 46650, Korean preserves the exact English item label
and explicit warning. The item's intended display/runtime path is separate
from linguistic fidelity, and no evidence supports removing or altering the
warning.

D-19446 had already cleared ID 46628's numbered `FAIL LINE 2` label. With
46626 and 46650 now resolved, all three unique IDs from D-14238 have been
reviewed; no ID is counted twice.

## Verification

- Compared each exact ID in English, Japanese source, Chinese, and active
  Korean; Japanese-derived draft rows were also checked.
- No active Korean cell changed. No backup was needed.
- Active default SHA-256 remains
  `cc8c2706805482a13a2bd44a8d58687b1804a8f06bea3c6632b47639f20073f4`.
- Two previously uncertain unique IDs move to `not an issue`. Totals:
  **2,284 accepted / 24,985 not an issue / 11,255 uncertain** (38,524).
- Resume at **D-19449** from the unresolved-source queue.
