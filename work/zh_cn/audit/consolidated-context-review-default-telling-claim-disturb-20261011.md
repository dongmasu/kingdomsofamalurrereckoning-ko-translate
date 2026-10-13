# Consolidated Context Review: Claiming and Disturbing the Telling

- Date: 2026-10-11
- Decision: D-18263
- Scope: `default` IDs 12861 and 19972; compare English, Japanese source,
  Japanese-derived Korean draft, Chinese source, active Korean, and accepted
  `The Telling` terminology.
- Result: ID 12861 is `not an issue`; correct ID 19972 and reclassify it as
  accepted. Other uncertainties in ID 19972's former grouped disposition
  remain separate.

## Evidence and Decision

At ID 12861, the speaker says they are about to claim one of the Telling's
greatest songs. Japanese `手に入れよう` and Chinese `赢取` support acquiring
or winning it; active Korean `차지하려는 참` preserves that action and the
speaker's impatience. Reuse the accepted `전승(The Telling)` term; no change
is needed.

At ID 19972, English says “You will disturb the Telling.” Japanese says the
addressee will disrupt `伝承`, and Chinese says they will impede `天谕`.
Active Korean had added `의식` (“ritual”), which none of the references
specifies. Remove that unsupported narrowing while retaining the warning.

## Applied Text

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 19972 | `저리 가. 전승 의식을 방해하게 될 거야.` | `저리 가. 전승을 방해하게 될 거야.` | Remove the unsupported “ritual”; preserve the source's warning that the addressee will disturb the Telling. |

ID 12861 remains unchanged:
`무슨 일이야? 난 지금 전승(The Telling)의 가장 위대한 노래 중 하나를 차지하려는 참이야. 여기 서서 그 얘길 하고 있을 시간 없어.`

## Verification

- Only the active Korean `Texto` cell at ID 19972 changed.
- The UTF-8 BOM, 65,135 data rows, ascending ID order, and record separators
  are preserved: 72,011 CRLF and 73 bare-LF endings.
- Reversing only the approved substitution reproduces the pre-edit CSV
  byte-for-byte.
- Pre-edit SHA-256:
  `9ad0c54788bacf1adb14f875bac12bc40c4219e3d514969a14b647318d5e56b8`.
- Post-edit SHA-256:
  `4bd4f2877865a19ed1f2b072bb3a8bfa779e45b2675dd454ba8c3e10fa8c009b`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-telling-context-19972-D18263/locatexts_zh_cn.koalocatext_default.csv`.
- Cross-resource totals through D-18263: 1,953 accepted, 23,099 `not an
  issue`, and 13,470 uncertain (38,522 unique dispositions); next decision:
  D-18264.

These are working dispositions, not independent final linguistic approval.
