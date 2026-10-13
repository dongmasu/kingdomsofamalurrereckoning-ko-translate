# Combined `base` + `affix` Review: Round 1

- Review date: 2026-10-09
- Scope: `base` IDs 0-99 (100 rows) and `affix` IDs 0-9 (60 target
  variants).
- Compared active Korean with English meaning and Japanese source wording;
  Chinese remains supporting evidence. Existing preliminary reports were
  rechecked, not treated as approved findings.
- Read-only. No translation CSV was edited.
- This is an expanded preliminary pass, not independent Reviewer approval.

## Combined Review Standard

`base` and `affix` are reviewed as parts of one displayed item name, not as
isolated glosses. For each relevant affix, identify whether the source form
acts before or after the base name, then check the Korean fragment in that
slot. Compare the resulting Korean name for meaning, word order, register,
proper-name identity, and English-parenthetical consistency. Japanese is
especially useful for identifying the source's modifier/`オブ` structure and
variant shape; its transliteration alone does not decide Korean wording.

Do not add English parentheses mechanically to every item. Where an item is
a unique title or proper name, consider traceability while checking that a
parenthetical still reads cleanly when an affix is attached. Do not change
runtime order or CSV text in this review.

## `affix` IDs 0-9

All ten IDs and their six target variants were included. The active Korean
text repeats across the six variants for these IDs.

| ID | English | Japanese source | Korean | Combined-name question |
| ---: | --- | --- | --- | --- |
| 0 | `Rallying` | `ラリーイング` | `집결의` | Check as a preposed modifier with a base name. The current genitive may create a different relation or an awkward item title; choose only after reviewing a complete name. |
| 3 | `of Fire Warding` | `オブ ファイアワーディング` | `화염 방호의` | Source marks a postposed `of` phrase. Check how this attaches after the base noun; preserve the effect meaning without leaving a stranded Korean genitive. |
| 4 | `of Justice` | `オブ ジャスティス` | `정의의` | Same postposed-slot concern; distinguish a natural modifier from a literal fragment ending in `의`. |
| 8 | `of Ice Attenuation` | `オブ アイスアッテネーション` | `얼음 감쇄의` | Check both the Korean effect term and its postposed composition. Japanese confirms the modifier boundary but transliterates the technical term. |
| 5, 9 | `Linen`; `Studded Leather` | `リネン`; `スタッドレザー` | `리넨`; `징 박힌 가죽` | Confirm the Korean material/armor phrases work in the modifier slot before a base item name. |
| 1, 2, 6, 7 | Loot/action fragments | Japanese uses action labels, several with `:` | Korean uses action labels, several with `:` | These appear to be UI/action fragments rather than equipment-name modifiers; keep them in a separate composition class and verify the following UI text. |

The earlier batch findings at IDs 1, 2, 7, and 8 remain open. This round
reframes them around their actual slot instead of treating the fragment as a
standalone phrase.

## `base` IDs 0-99

All 100 Korean rows and their source-keyed first-pass notes were included.
The following points need item/title-aware treatment alongside the affix
review:

| ID | English | Korean | Japanese evidence | Combined naming question |
| ---: | --- | --- | --- | --- |
| 32 | `Ballads Oratory` | `발라드 기도실` | `バラードの祈祷場` | Preserve the relation to the named Ballads group; the Korean can sound like an oratory for musical ballads. |
| 35 | `The Titan Spear` | `타이탄의 창` | `タイタンの槍` | Meaning is retained, but assess whether this is a named weapon and whether its title identity should remain traceable when modified. |
| 62 | `Victory Games Star` | `승리 게임의 별` | `ビクトリーゲームズスター` | The Korean reads like a literal phrase; verify the proper tournament/name boundary before choosing the item-title form. |
| 99 | `Eagonn's Greaves` | `이건(Eagonn)의 정강이받이` | `イーゴンのグリーブ` | Existing English parenthetical helps identify the proper name; check consistency with nearby item names and any attached modifier. |

Other title-shaped names in this range (`The Possession Begins`, `The Night`,
`The Master's Key`, and `The Hunter's Friend`) were checked as context
questions, not automatically marked wrong because Korean omits an English
article. The previously flagged `Greater Robust Grip` at ID 23 also needs a
more natural modifier order in Korean.

## Cross-Range Issues Reopened

- `affix` ID 128 (`of Ice Shield` → `얼음 방패의`) is a reported postposed
  fragment that reads unnaturally after an item noun. Its earlier “no
  additional concern” statement is superseded; see
  [`affix-ids-00120-00129-preliminary.md`](affix-ids-00120-00129-preliminary.md).
- `affix` IDs 50 (`폭풍의 분노의`), 287 (`폭풍의 이빨의), and 411
  (`폭풍의 울부짖음의`) contain stacked genitives already flagged in their
  first-pass reports. Review each in its full item-name slot, not as a
  standalone string.
- `affix` ID 443 (`of the Hardy` → `강인한 자의`) may turn a resilience
  modifier into a person-denoting possessive; resolve meaning and slot
  together.
- `base` ID 1741 (`The Beast` → `야수`) is identified by the user as a
  weapon item. Preserve its distinct title/name identity; consider
  `야수(The Beast)` only as a candidate, subject to consistent full-name
  presentation.
- `base` ID 4674 (`Band` → `반지`) remains a likely item-sense error per the
  user. Japanese `バンド` does not confirm a ring; verify the item before
  selecting its Korean category.

The `of ...` structural filter found 175 English affix IDs, 171 of whose
active Korean forms end in `의`. This is a review queue, not a claim that all
171 are wrong. Separately, 195 `base` names begin with English `The`; 155 of
those Korean rows have no English parenthetical. This is only a candidate
screen: neither the article nor absent parentheses alone proves an error.

## Status and Resume

Round 1 rechecked 100 `base` rows and 60 `affix` variants under the expanded
combined-name standard. Findings remain open and preliminary. Continue with
`base` IDs 100-199 and `affix` IDs 10-19, using the same slot-aware,
Japanese-informed comparison. Then continue through all 4,844 base rows and
3,451 affix variants before carrying the literary-voice criteria through
`default`.
