# Consolidated Context Review: 200 Default Keys, D-19687

Reviewed all 200 exact English/Japanese/Chinese/Korean keys in
`uncertain-200-D17461-D17707-20261012.jsonl`. English anchored meaning;
Japanese informed voice/register; Chinese was a supporting cross-check.
The extracted official Korean manual and prior accepted decisions were used
for `패란즈`, `미타란`, `트래블러`, formal titles, and faction names. No
PAK or PAK-derived material was consulted.

## Accepted Corrections

| IDs | Approved correction | Basis |
| --- | --- | --- |
| 57932 | `페이랜드` -> `패란즈` | Reuse the official Korean manual's Faelands name; the English/Japanese/Chinese identify the same homeland. |
| 57933 | `버언` -> `번(The Burn)` | Reuse the accepted place form at D-1976/D-19309; the sentence distinguishes the warship port from the Quays. |
| 57937, 58269 | `여행자` -> `트래블러` | Capitalized Travelers names the faction; use the official-manual spelling. |
| 57947, 58032 | `까마귀단` -> `크로우즈(The Crows) 팀` | English identifies the recurring arena team; reuse the accepted tournament-team name. |
| 58002 | `후계자` -> `사이온(Scion)` | Capitalized Scion is the established office/title, not generic succession (D-19496). |
| 58177 | `베니스` -> `벤리스` | The source name is Venris; Japanese `ヴェンリス` supports the spelling, while the same name was misspelled twice in Korean. |
| 58186 | `앨린 쉬어` -> `앨린 시어` | Normalize Alyn Shir to the established active-corpus spelling. |
| 58209 | `서약방패 계급` -> `서약방패병 계급` | Reuse the formal Pledgeshield rank (D-18254/D-19523). |
| 58270 | `도칼파르` -> `도크알브` | Apply the official Korean manual's Dokkalfar name. |
| 58384, 58518 | `완벽한 미사루식` -> `흠 없는 미타란` | Correct Mitharan equipment modifiers and Flawless per accepted D-18158/D-19670-D-19671. |
| 58482 | `비탄의 가문` -> `비탄의 집` | Normalize the named House of Sorrows to its accepted proper-name form. |
| 58490 | `콜로새` -> `콜로사이족` | Normalize the Kollossae people-name (D-18878/D-18933/D-19573). |
| 58499 | `도슨트` -> `강사`; `크레아스나크 틴트리` -> `크리스나크 틴트리(Creathnach Thintri)` | Reuse the accepted instructional title and Adept rank. A focused follow-up reuses active ID 9506's spelling for the Fae name and the established `스카이크라운(Skycrown)` form; see the D-19688 corrigendum. |
| 58512 | `자유민` -> `프리맨(Freemen)` | English/Japanese identify the named faction; reuse D-18219 and the D-19686 correction. |
| 58546 | `트래블러스` -> `트래블러` | Normalize the capitalized faction name to the official-manual form. |
| 58555 | `베일렌 결사` -> `벨렌의 테스타먼트` | English names the organization; reuse the established Belen spelling and Testament faction form. |
| 58575 | `발러의 정수` -> `용맹의 정수` | The English, Japanese, and Chinese identify the valor quality; use the established Korean rendering of Valor rather than a deity/name transliteration. |
| 58579 | `교수대의 끝` -> `갤로우즈 엔드` | Normalize the named location to the accepted active-corpus form. |

The other 179 exact keys in the snapshot are `not an issue`: the Korean
preserves the English-led meaning and the Japanese/Chinese checks reveal no
supported correction. This includes source-supported ambiguity, names without
a stronger established Korean form, UI labels, and narrative fragments; no
hold was retained merely for lack of additional lore context.

**21 accepted / 179 not an issue / 0 uncertain** in this batch.

Pre-edit SHA-256:
`d473eca9ecfee850deeb8b512542467af7f5f8ad6b120f738d5c460267b6e63e`.
Byte-identical backup:
`/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19687/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`46fa12187700312a890abb123721cd72d6b07b9332373a6a7a2111c6dd381c69`.
The applicator verified all 200 exact four-locale keys, inverse byte
reconstruction, BOM, mixed record endings, ordered IDs, and preservation of
every non-approved byte.

Updated default totals: **3,351 accepted / 33,671 not an issue / 1,502
uncertain** (38,524). Default review remains incomplete; the separate
Chinese-only affix fallback review remains recorded as closed by D-19565.
