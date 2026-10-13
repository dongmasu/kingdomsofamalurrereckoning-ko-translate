# Postposed English `of ...` Affix Formatting

- Date: 2026-10-11
- Decision: D-18201
- Scope: every active Korean `affix` key whose English source `Texto` starts
  with `of `, selected by English ID rather than by the Korean ending.
- This is a postposed-fragment display convention, not Markdown italics or a
  runtime rich-text tag. Literal `*` characters delimit the translated
  postposed segment.

## Applied Rule

Render the Korean equivalent of the English `of ...` fragment as
`*translated segment*` after the item/base name. Remove only the final Korean
possessive particle `의` where present; retain internal relations such as the
`의` in `폭풍의 분노` and `폭풍의 이빨`.

Examples:

| ID | English | Before | After |
| ---: | --- | --- | --- |
| 3 | `of Fire Warding` | `화염 방호의` | `*화염 방호*` |
| 50 | `of Storm's Rage` | `폭풍의 분노의` | `*폭풍의 분노*` |
| 128 | `of Ice Shield` | `얼음 방패의` | `*얼음 방패*` |
| 287 | `of Storm's Bite` | `폭풍의 이빨의` | `*폭풍의 이빨*` |
| 411 | `of Storm's Cry` | `폭풍의 울부짖음의` | `*폭풍의 울부짖음*` |

The source filter selects 175 English IDs and 1,045 active target keys. ID
311 has one target variant; the other selected IDs have six each. There are
171 IDs whose Korean value ended in `의` (1,021 keys); the four other IDs
125, 147, 192, and 471 contribute 24 keys and were wrapped without changing
their inner wording. Japanese uses `オブ` for 166 of the 175 source IDs; the
English `of ` prefix remains the selection authority for all 175.

This formatting correction does not settle uncertain lexical senses recorded
for other affixes. The six keys at ID 128 previously held as D-004 are now
resolved for the postposed Korean rendering and reclassified from uncertain
to accepted. Related `default` ID 11412 (D-3327) is unchanged because it is a
different resource string without confirmed affix-slot behavior. Other prior
semantic dispositions remain in force and are not recounted.

## Verification

- Exactly 1,045 `Texto` cells across 175 English-selected IDs changed.
- All other bytes match the pre-edit backup, including IDs, variant codes,
  row order, UTF-8 BOM, and all 3,452 CRLF record endings.
- No source files, Japanese draft files, build files, or distribution files
  were modified. No build or in-game rendering test was performed.

| File | SHA-256 |
| --- | --- |
| Active Korean `affix`, before | `937a8da098291eb9e6f277a49e1cf0a3ef81cb59977df59d03c8dcdc742ddea3` |
| Active Korean `affix`, after | `c31f35a98a4b2875cc6d44c46c4404c2249f4ec6f758dae3543a07c917def676` |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-of-affix-format-20261011/locatexts_zh_cn.koalocatext_affix.csv`.

The six D-004 keys were reclassified, so cross-resource totals through
D-18201 are 1,902 accepted, 22,913 `not an issue`, and 13,707 uncertain
(38,522 total); next D-18202. The other 1,039 affected keys retain their
existing semantic disposition and are not counted a second time.
