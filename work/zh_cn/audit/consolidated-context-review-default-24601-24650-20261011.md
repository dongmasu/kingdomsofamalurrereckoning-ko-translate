# Consolidated Context Review: `default` IDs 24601-24650

- Date: 2026-10-11.
- Re-reviewed the prior uncertain findings against English meaning, Japanese
  voice/register and draft, Chinese supporting text, active Korean, earlier
  decisions, and repeated corpus terminology.
- Resolved 11 prior uncertain keys: one accepted correction and ten
  `not an issue`. Six keys remain on specific context/name holds.

## Decisions D-18965-D-18975

| Decision | ID | Outcome | Evidence |
| --- | ---: | --- | --- |
| D-18965 | 24618 | not an issue | `Faer Gorta` is consistently represented as `페어 고르타` in related active entries; the named creature is preserved. |
| D-18966 | 24619 | not an issue | `태양 야영지` directly conveys Sun Camp and matches the Japanese-derived Korean draft; the route, low-profile instruction, work, and intended short duration remain. |
| D-18967 | 24620 | not an issue | `Magic Men` is a generic reference to magicians here; `마법사들` preserves the group without inventing a faction. |
| D-18968 | 24623 | not an issue | Bea, the sword/shovel comparison, failed attempt to cut, and lack of marks are all retained; auxiliary spellings support the names. |
| D-18969 | 24624 | not an issue | The Midden duel, Headsman's escape and challenge, Tinehil arena, and Betheli Jons's request and reason remain in sequence. |
| D-18970 | 24634 | not an issue | `안실라 성` matches the established Castle Ansilla form; the gardens, family residence, bolgan rumor, and sympathy are retained. |
| D-18971 | 24638 | not an issue | The sentence correctly states that only a confession could convict him; no legal threshold is added or lost. |
| D-18972 | 24639 | not an issue | `먼지의 자손` is the recurring Korean form for Child of Dust; the threat and vocative are preserved. |
| D-18973 | 24642 | not an issue | Ordo is consistently rendered `오르도`; the desired power and its limited remaining availability are retained. |
| D-18974 | 24648 | not an issue | `예언자의` correctly preserves the source's incomplete `of the Seer` fragment. |
| D-18975 | 24649 | accepted | English `All right, now.` and Chinese assent do not say “let's go.” Japanese is a farewell, but likewise does not support the added movement. Replace `좋아, 지금 가자.` with `좋아, 그럼.` |

## Holds Retained

- 24601: “the hollow” is not enough to establish a hollow tree, cave, or
  named location; preserve the current wording pending referent context.
- 24602-24603: Rathir and Franz Englehart have competing established Korean
  spellings; no reliable single normalization is established by this passage.
- 24608: `장막` is plausible, but this isolated line does not resolve whether
  the Veil is a generic barrier or a named object.
- 24641: Sandstone Villa has conflicting Korean renderings in the corpus;
  the proper-name/style choice remains open. Paragraph structure and
  signature are unchanged.
- 24643: the English route phrase “from the gates” is malformed or ambiguous;
  this row alone cannot establish a safe correction.

## Verification

- The 11 decisions refer only to prior uncertain keys; no previously closed
  key was recounted. The existing first-pass decisions D-8009-D-8030 remain
  in place and are not duplicated.
- Only active Korean `Texto` at ID 24649 changed, from `좋아, 지금 가자.` to
  `좋아, 그럼.` No source or other active CSV was edited.
- The edit is a byte-level replacement of that exact cell. UTF-8 BOM,
  72,011 CRLF endings, and 73 pre-existing bare LF endings are unchanged.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-24601-24650-D18965/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `9e64df4e20b3e1d51507663fbd6ba27829639c0753d1d8ff3d3de615346c6d11`.
- Post-edit SHA-256:
  `ff06e9b14b35691d640b1c643b83d4b6bdbd21cb0efd6f634e1c43bb3bb05eeb`.
- Totals: 2,127 accepted / 23,817 `not an issue` / 12,580 uncertain
  (38,524 counted keys). Resume at D-18976, ID 24651. Sequential IDs
  24651-65134 remain (40,484), along with earlier specific holds and the
  D-18422-D-18452 register backfill.
