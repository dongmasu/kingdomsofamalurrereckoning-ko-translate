# Consolidated Context Review: Scholia and Passive Ability (D-19626)

- Date: 2026-10-12.
- Scope: six open findings D-1071, D-1072, D-1074, D-1076-D-1078;
  default IDs 4506, 4511, 4518, 4521, 4523, and 4524.
- English was the meaning anchor; Japanese was checked for voice/register
  and Chinese as supporting evidence. Accepted rank/UI precedents and the
  relevant official-manual equipment section were checked. No PAK material
  was used.

## Decisions

| Decision / ID | Disposition | Evidence |
| --- | --- | --- |
| D-1071 / 4506 | not an issue | English's brief `Come again` is an invitation to return; Japanese uses a familiar imperative and Chinese a neutral invitation. Korean `또 오세요` is a natural polite invitation and does not change the speech act. |
| D-1072 / 4511 | not an issue | English `Yes?`, Japanese `何だ?`, and Chinese `怎么了?` are brief response prompts. Korean `네?` is a natural response; no source context establishes a conflicting register. |
| D-1074 / 4518 | not an issue | The line explicitly identifies two living Truesworn, one being the addressee and one the speaker. English ID 43058 later directly defines Truesworn as a rare rank; the Korean transliteration preserves the title without altering the relation. |
| D-1076 / 4521 | accepted | `Savant Engar` is a formal Scholia Arcana rank. D-18268 establishes `Savant = 사반트`; Japanese's first-rank mage description and the exact English title support replacing generic `현자` with `사반트`, while retaining Engar's name. |
| D-1077 / 4523 | not an issue | English and Chinese direct the player toward a mission site through Glendara Wood. Korean `선교원 쪽` preserves the destination direction; Japanese gives a less specific route but no conflicting destination. |
| D-1078 / 4524 | accepted | All four locales identify the same passive ability, Chakram weapon, and exceptional damage. Reuse the approved UI label `[패시브]` from D-19612/ID 3205 and D-19617/ID 3731; the official Korean manual's weapon list on PDF page 7 confirms `차크람`. Preserve `{*1}` and the paragraph break. |

## Applied Text

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 4521 | `현자 엔가르(Savant Engar)` | `사반트 엔가르(Savant Engar)` |
| 4524 | `{*1[지속 효과]}` | `{*1[패시브]}` |

## Verification and Resume

- Pre-edit SHA-256:
  `50dd636f3b88ce718820a0a00b9d8e94b66699d782c75a48726880564a1cce67`.
- Byte-identical backup:
  `/private/tmp/ko-translate-backups/20261012/before-savant-passive-D19626/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit active default SHA-256:
  `b1d8cab07738c366608d0d471df93e472afc0f8ccbb98a0800aa680ce886c3c5`.
- Reversing both exact substitutions reproduces the backup byte-for-byte.
  UTF-8 BOM, row order, all unrelated bytes, 72,011 CRLF endings, and 73
  pre-existing bare-LF endings are preserved.
- Six uncertain keys closed: two accepted and four `not an issue`.
- Totals: **2,559 accepted / 25,917 not an issue / 10,048 uncertain**
  (38,524). Separate provisional affix holds: 0.
- Resume at **D-1080 / default ID 4536**. Default review remains incomplete.
