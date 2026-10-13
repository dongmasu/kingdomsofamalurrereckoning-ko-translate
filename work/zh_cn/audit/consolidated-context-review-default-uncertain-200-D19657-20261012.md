# Consolidated Context Review: 200 Default Keys, D-19657

Scope: `uncertain-200-D6464-D7031-20261012.jsonl`. The English, Japanese,
Chinese, and pre-edit Korean `Texto` matched all 200 source keys exactly in
each locale. English determines meaning, Japanese voice/register, and Chinese
supports the reading. The official Korean manual's PDF page 7 names
`워스원`, `트래블러`, `스콜리아 아르카나`, and `셉터`; older accepted
decisions establish `탐구자`, `콜로사이`, and `프레토리안`. No PAK material
was used.

| ID | Approved `Texto` correction | Basis |
| ---: | --- | --- |
| 21047 | `용맹의 검투사들` -> `용맹의 집 검투사들` | Japanese identifies House of Valor, not an abstract virtue. |
| 21053, 21302, 21376 | `전쟁맹세단` -> `워스원` (including the address and two occurrences at 21376) | Official manual faction name; English capitalizes Warsworn. |
| 21055, 22322 | `발굴자` / `탐굴자` -> `탐구자` | House of Sorrows Delver role; accepted D-19632/D-19653/D-19655. |
| 21176, 21621, 21634, 21768 | `여행자` -> `트래블러` in the relevant inflections | Named faction, official manual p. 7; source explicitly uses Travelers/Traveler. |
| 21219, 21576 | `콜로세` -> `콜로사이` | Named Kollossae people, previously approved form. |
| 21458, 21609 | Weapon-class `홀` -> `셉터` | Official manual p. 7 distinguishes Sceptres from staves. |
| 21463 | `자비로우신` -> `너그러우신` | English `Generous`, Japanese `恵み深き`, and Chinese `慷慨` refer to generosity, not mercy. |
| 21652 | `아르카나 학술원` -> `스콜리아 아르카나` | Official manual faction name. |
| 21891 | `장부` -> `기록부` | English `logbook`, Chinese `日志`: recorded arbitrations, not an account ledger. |
| 22220 | `근위병` -> `프레토리안` | Formal Praetorian rank as accepted at D-19656/ID 18902. |

IDs 21316 and 21356 were already corrected at D-18314/D-18315; ID
22135's Adept rank was already corrected in the D-19504 cluster. These
three are linked without recounting. The other 179 keys in the exact
snapshot are `not an issue`: the current Korean retains the English-led
meaning or a source-supported name, even where references disagree on
nuance. No new hold was created. Some existing name or source ambiguities
do not justify changing source-faithful Korean.

Pre-edit SHA-256:
`f74359151fd8a7af569d3de96d80642898608d3c0e4006b95c362dbea19ebed6`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19657/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`bd60da4a965f02e5480932ee3d1dd5f4fad1a0b958f9cb7a63be5f051db2b748`.
All 200 keys matched each locale; inverse reconstruction, BOM, mixed line
endings, row order/keys, and bytes of all non-approved records passed.
Totals: **2,883 accepted / 28,539 not an issue / 7,102 uncertain**
(38,524). The 55 separate affix holds were closed by D-19565.
The default review remains incomplete.
