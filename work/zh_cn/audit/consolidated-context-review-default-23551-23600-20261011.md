# Consolidated Context Review: `default` IDs 23551-23600

- Review date: 2026-10-11.
- Scope: the ten uncertainties in IDs 23551-23600 after the previous
  disposition pass.
- Result: all ten resolved (three accepted edits, seven `not an issue`).

## Decisions

| Decision | ID | Finding | Disposition | Rationale |
| --- | ---: | --- | --- | --- |
| D-18659 | 23556 | Savage Wing | not an issue | `야만의 날개` directly preserves both English words. Japanese transliterates the label and Chinese translates it literally; the unresolved item/creature/ability category does not establish a Korean text error. |
| D-18660 | 23558 | Winter Fae / Bitter Frost | not an issue | Korean preserves the Winter Fae, the inferred formation of Bitter Frost, and the exact English faction name in parentheses. The global faction-name form remains a separate terminology question. |
| D-18661 | 23561 | god / disciples / people listening | not an issue | Korean retains both conditional clauses and the unusual god/disciple relationship without inventing a theological explanation. English and Chinese support the heard/listen structure. |
| D-18662 | 23574 | House of Valor | accepted | Change `용맹의 전당` to the established proper-name form `용맹의 집(House of Valor)`, following D-148 and D-650. |
| D-18663 | 23588 | Jemshee shard / oddly ageless tongue | not an issue | English and Chinese attach the odd ageless quality to the tongue; Korean follows that reading. Japanese's “fresh” wording is a source variation, not proof of Korean mistranslation. |
| D-18664 | 23589 | Ballegar / honorable work / mercenaries | accepted | Change the phrasing from a promise made “with us” to a promise to give the group honorable work. This preserves English's commitment of the group and is directly supported by Japanese and Chinese; the next sentence confirms Ballegar made them mercenaries. |
| D-18665 | 23590 | five litanies / shrine magic | accepted | Change the counter from `편` to `권`. Japanese calls them `連祷書`; ID 49766 says five lost litanies were found and placed on the Litany Altar, and its Japanese/Korean drafts explicitly count them as volumes. |
| D-18666 | 23596 | great powers / speaker's voice / persuasion | not an issue | Korean preserves the speaker's role in discussions, the use of their own voice, eliciting true requests, and acceptance of the offer without asserting literal voice imitation. |
| D-18667 | 23599 | Rathiri demonym | not an issue | `라시르 사람` conveys a person of Rathir; Japanese explicitly says Rathir citizens, while the English demonym's exact Korean form remains a corpus-wide terminology matter. |
| D-18668 | 23600 | Saltwell | not an issue | The standalone Korean transliteration is paired with exact `Saltwell`; uncertainty about the referent type does not establish a lexical error. |

The preliminary and initial disposition reports remain historical records.
These decisions supersede the ten uncertain classifications above.

## Edits and Verification

Only active Korean `Texto` at IDs 23574, 23589, and 23590 changed:

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 23574 | `용맹의 전당(House of Valor)` | `용맹의 집(House of Valor)` |
| 23589 | `...명예로운 일을 하겠다고 우리와 약속했지.` | `...우리에게 명예로운 일을 맡기겠다고 약속했지.` |
| 23590 | `...이 연도문 다섯 편만 있으면...` | `...이 연도문 다섯 권만 있으면...` |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-23551-23600-D18659-D18668/locatexts_zh_cn.koalocatext_default.csv`.

Pre-edit SHA-256:
`c8abbd0b753ab0fed0af39016c71bff89d51121e84d523073537fd78d0c98c38`.
Post-edit SHA-256:
`cb4114c46edbba074be2850b4387f396ea2d0870aec71ac81dbf7e5e4ec29893`.
Byte comparison confirms only the three listed physical rows changed. The
UTF-8 BOM, 65,135 data rows, row order, 72,011 CRLF endings, and 73
pre-existing bare-LF endings remain unchanged.

English, Japanese source, Japanese-derived Korean, Chinese, and active Korean
each contain the ten reviewed IDs exactly once and in the same ascending
order. Recipe/effect layout and values at IDs 23567-23568 and the 750 Fire /
100 Burning / 290 Mana values at ID 23578 were retained. No runtime-marker
or intentional line-break discrepancy was introduced.

D-18659-D-18668 resolves all ten uncertainties: three accepted and seven
`not an issue`. Totals are 2,085 accepted, 23,548 `not an issue`, and 12,891
uncertain (38,524 counted). Active default SHA-256:
`cb4114c46edbba074be2850b4387f396ea2d0870aec71ac81dbf7e5e4ec29893`.
Next D-18669 at ID 23601.
