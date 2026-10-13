# Consolidated Context Review: `Agent of Change`

- Date: 2026-10-11
- Scope: `default` ID 65118 compared with repeated English term `agent of
  change` at ID 29528 and its accepted decision D-9294.
- Result: D-18215 accepts a targeted correction at ID 65118, reclassifying
  the key from uncertain to accepted.

## Evidence and Correction

English ID 65118 reads: “You are the agent of change, but it is destruction
that you bring.” The current Korean `넌 변화의 사자지만, 가져오는 것은 파괴야.` renders `agent` as `사자`, which can mean messenger and adds an
emissary role not required by English.

ID 29528 contains the same exact English phrase, `an agent of change`.
Japanese uses a messenger-like `使者` in both rows, but Chinese ID 29528
describes a “carrier of change” and Chinese ID 65118 says that the addressee
brought change and destruction. Prior accepted decision D-9294 at ID 29528
already resolved this distinction by replacing `변화를 이끌 사자` with
`변화를 가져올 존재`; its rationale rejects an unsupported messenger
reading while preserving the unspecified agent/catalyst sense.

Apply that established semantic distinction to ID 65118:

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 65118 | `넌 변화의 사자지만, 가져오는 것은 파괴야.` | `넌 변화를 가져오는 존재지만, 네가 가져오는 건 파괴야.` |

This retains the direct address and contrast while expressing the English
agent/catalyst meaning without importing a messenger role.

## Verification

- English, Japanese source, Japanese-derived Korean draft, Chinese source,
  and active Korean were joined by `ID_Linha` for IDs 29528 and 65118.
- Only the active Korean `Texto` cell at ID 65118 changed. `diff` confirms
  no other row or byte region changed; the UTF-8 BOM, record order,
  embedded line breaks, and CRLF record separators are preserved.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-agent-change-context-20261011/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `4ea2a72df4b226d555ad672473b0417754b847dcd699a77f80a5c90b6b0a94da`.
- Post-edit SHA-256:
  `b498cb4f2b4980a510cac168a01bbfa9bbd2246efcdef70a0686a6c39d8b8969`.
- Cross-resource totals through D-18215: 1,918 accepted, 22,971
  `not an issue`, and 13,633 uncertain (38,522 unique dispositions);
  next decision: D-18216.

These are working dispositions, not independent final linguistic approval.
