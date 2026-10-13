# Consolidated Context Review: `default` IDs 27901-27950

- Review date: 2026-10-12.
- Scope: open findings D-8802-D-8803 for IDs 27901-27950, checked against
  English, Japanese source and preserved Japanese-derived Korean draft,
  Chinese, active Korean, and related audit decisions.
- English controls meaning; Japanese informs voice/register; Chinese is
  supporting evidence.
- Result: one accepted `Texto` correction, nineteen `not an issue`
  resolutions, and one specific uncertainty at ID 27950.

## Decisions D-19411-D-19413

| Decision | Key | Disposition | Evidence and rationale |
| --- | --- | --- | --- |
| D-19411 | `default` 27917 | accepted | Replace the vocative `리리아여` with `리리아께` so the speaker thanks Lyria for the listener's arrival, rather than addressing Lyria as the person who arrived. English, Japanese, and Chinese support that relation. |
| D-19412 | `default` 27901, 27903-27905, 27907-27909, 27913, 27919, 27923, 27929, 27935-27938, 27943-27944, 27946-27947 | not an issue | The active text preserves the source meanings and relationships. The six-line Tirin poem retains its sequence and principal images; `<Unnamed Region>`, trigger number, armor value, and short fragment remain intact. Proper terms are source-traceable or translated literally without an unsupported lore claim. |
| D-19413 | `default` 27950 | uncertain | Korean preserves the contrast between winter's decay and Fae who do not normally take prisoners, but the canonical Korean forms of the named Seelie and Unseelie groups are not established consistently enough to normalize from this line alone. No meaning change is made. |

Previously dispositioned findings D-8798-D-8801 are linked without
recounting, including the wedding sarcasm, the complete crate-destination
letter, trigger/placeholder/value checks, and the remaining short dialogue.

## Accepted Text Edit

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 27917 | `리리아여, 와 줘서 고마워.` | `네가 와 줘서 리리아께 감사해.` | The English thanks Lyria that the addressee is present; the previous Korean could instead address Lyria as the person being thanked for arriving. |

## Structural and Context Notes

- English, Japanese source, Chinese, active Korean, and the preserved
  Japanese-derived Korean draft each contain IDs 27901-27950 once in
  identical ascending order. Default rows have `ID_Linha` and `Texto`; no
  variant column is present.
- Logical line-break counts agree across all five resources. The Tirin poem
  at 27909 retains six lines. No runtime-token order exception was found.
- At 27928, trigger number `1` is preserved; at 27931, total armor remains
  `50%`; at 27939, the literal `<Unnamed Region>` placeholder is unchanged.
- English, Japanese, and Chinese at 27917 all place the gratitude toward
  Lyria and the listener's arrival in the same relation; the correction
  retains the following curse warning.

## Verification

- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-context-27901-27950-D19411/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `5f35a63ff2fd8e5fcffd9a312afe4170178c49b623f91323233623e601815926`.
- Post-edit SHA-256:
  `b18de76b4bb0e564b0e68a2c4e0a22f002c2755bf89a4a432d6b313998200c6f`.
- Reversing the exact substitution reproduces the backup byte-for-byte.
  Only Korean `Texto` at ID 27917 changed. The UTF-8 BOM, all 65,135 rows,
  ascending unique ID order, 72,011 CRLF endings, and 73 pre-existing
  bare-LF endings are preserved. Source CSVs were not edited.

Totals: 2,257 accepted / 24,886 `not an issue` / 11,381 uncertain (38,524).
Resume D-19414 at ID 27951; sequentially unreviewed interval is 27951-65134
(37,184 IDs), besides older specific holds and register reconciliation.

These are working dispositions, not independent final linguistic approval.
