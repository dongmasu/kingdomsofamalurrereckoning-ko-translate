# Consolidated Context Review: `Your Grace` at ID 64972

- Date: 2026-10-11
- Decision: D-18259
- Scope: `default` ID 64972, compared by ID across English, Japanese source,
  Japanese-derived Korean draft, Chinese source, and active Korean; repeated
  House of Ballads ruler context and accepted honorific decisions checked.
- Result: change `전하` to `각하`; reclassify ID 64972 from uncertain to
  accepted.

## Evidence and Decision

English reads `Be well, your grace.` The Japanese source is less formal
(`頑張ってくれよ`), while Chinese uses the more royal-specific `陛下`.
Both Korean drafts currently say `몸조심하세요, 전하.` The English
expression establishes a respectful form of address but does not by itself
establish that the addressee is a monarch.

Repeated English context identifies the player as the ruler of the House of
Ballads (IDs 24093, 5774, and 30786). ID 30786 describes that ruler as a
legendary knight and explicitly says he does not even own a crown. This
supports elevated status, but not the specifically royal Korean `전하`.
Accepted decisions D-10950, D-13407, and D-13459 use `각하` for this English
address when royalty is not established. Apply that existing decision rather
than leaving a now-resolvable rank question open.

## Applied Text

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 64972 | `몸조심하세요, 전하.` | `몸조심하세요, 각하.` | Preserve the respectful address without asserting unestablished royal rank; reuse the accepted `Your Grace` form. |

## Verification

- Only the active Korean `Texto` bytes for ID 64972 changed.
- The UTF-8 BOM, 65,135 data rows, ID order, and record separators are
  preserved: 72,011 CRLF and 73 bare-LF endings.
- Reversing only the approved substitution reproduces the pre-edit file
  byte-for-byte.
- Pre-edit SHA-256:
  `005887b958934afaa962fe88cfc2994cc0fcdfbe1215b4f3e87a068a6daa59c1`.
- Post-edit SHA-256:
  `651c4d78ec4a888cff19e1e6cb765391ec7fb50ac2a979ef2a58fab1723a70c4`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-grace-64972-D18259/locatexts_zh_cn.koalocatext_default.csv`.
- Cross-resource totals through D-18259: 1,934 accepted, 23,088 `not an
  issue`, and 13,500 uncertain (38,522 unique dispositions); next decision:
  D-18260.

These are working dispositions, not independent final linguistic approval.
