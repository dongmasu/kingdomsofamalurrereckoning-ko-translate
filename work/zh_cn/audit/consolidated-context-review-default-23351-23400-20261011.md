# Consolidated Context Review: `default` IDs 23351-23400

- Review date: 2026-10-11.
- Scope: all nine keys previously marked uncertain in IDs 23351-23400,
  checked by exact ID across English, Japanese source, Japanese-derived
  Korean, Chinese, active Korean, and accepted terminology.
- Result: all nine resolved (four accepted edits, five `not an issue`); no
  uncertainty remains from this batch.

## Decisions

| Decision | ID | Finding | Disposition | Rationale |
| --- | ---: | --- | --- | --- |
| D-18616 | 23351 | Lord Indre Kandrian | not an issue | The full English title and name are already retained in parentheses after the Korean honorific/name; the source entry is fully traceable. |
| D-18617 | 23360 | Arkes / burial and reversal | not an issue | The malformed English describes placing Arkes into what rest remained for him, then says that state is undone. Korean preserves the rest/burial metaphor and its reversal, while retaining `Arkes`; locale differences do not establish a Korean error. |
| D-18618 | 23365 | `my weapons` | not an issue | Korean's `내 무기를 맞고` preserves the English meaning that opponents do not last against the speaker's weapons. It does not assert who made them; the Chinese maker reading is a source-locale addition. |
| D-18619 | 23367 | Alserund / Narca recovery | not an issue | Korean preserves the possibility that Alserund will recover from Narca's harm without deciding whether Narca is a disease, event, or wider threat. |
| D-18620 | 23369 | Draug's Toothpicks | not an issue | Korean retains Draug's name and the deliberately incongruous toothpick item name; the short line does not require a different item category. |
| D-18621 | 23370 | Hospitalis Quarters | accepted | Add exact source text as `병원 구역(Hospitalis Quarters)`. This preserves the current medical-area meaning while keeping the potentially proper institution/place name identifiable. |
| D-18622 | 23377 | The Crows | accepted | Change literal `까마귀들` to `크로우들(The Crows)`. The capitalized plural is the tournament team/group, supported by the existing team-context disposition at ID 21694 / D-18325; it is not a literal flock of birds. |
| D-18623 | 23381 | Seelie Summoner | accepted | Add exact English label in parentheses to `시리 페이 소환사`, retaining the source term while avoiding an unsupported global Seelie/Fae canon choice. Chinese supports the Summer-Fae reading. |
| D-18624 | 23400 | second draw / the hex | accepted | Add `(Hex)` to `헥스`; the explicit second-card draw establishes the game/card context, and Japanese also transliterates the term. Korean preserves the win announcement without importing Chinese's “six points” reading. |

## Edits and Verification

Only active Korean `Texto` values at IDs 23370, 23377, 23381, and 23400
changed:

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 23370 | `병원 구역` | `병원 구역(Hospitalis Quarters)` |
| 23377 | `까마귀들` | `크로우들(The Crows)` |
| 23381 | `시리 페이 소환사` | `시리 페이 소환사(Seelie Summoner)` |
| 23400 | `두 번째 패는… 헥스! 네가 이겼어!` | `두 번째 패는… 헥스(Hex)! 네가 이겼어!` |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-23370-23377-23381-23400-D18621-D18624/locatexts_zh_cn.koalocatext_default.csv`.

Pre-edit SHA-256:
`cc899e2958feb37c44a2c45fb550a83f95b7ea303bee11307b2a1d54b53a9a4f`.
Post-edit SHA-256:
`d873312499857a290c61337e7bf34dca6e6beb6e623647db417959cc2465d089`.
Physical-line comparison confirms only the four listed IDs changed. The
UTF-8 BOM, 65,135 rows, ID order, 72,011 CRLF endings, and 73 pre-existing
bare-LF endings are preserved. All five source/draft/active files retain
their full matching ID order; placeholder/layout checks at IDs 23357, 23390,
and 23397 remain unaffected.

D-18616-D-18624 resolves nine keys: four accepted and five `not an issue`.
Totals are 2,057 accepted, 23,513 `not an issue`, and 12,954 uncertain
(38,524 counted). Next D-18625 at `default` ID 23401. The earlier working
dispositions are reconciled in
[`disposition-batch-default-23351-23400-20261010.md`](disposition-batch-default-23351-23400-20261010.md).
