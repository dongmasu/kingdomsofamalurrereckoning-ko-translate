# Consolidated Residual Review and Closure (D-19565)

- Date: 2026-10-12.
- Scope: four default residual holds (62755, 62792, 62796, 62867) and 35
  Chinese-only `affix` fallback keys (IDs 101, 115, 117, 124, 255, 341,
  496; variants 12, 14, 21, 22, 24).
- Evidence order: English is the meaning anchor; Japanese informs voice and
  register; Chinese and German, Spanish, French, Italian, and Russian are
  supporting cross-checks. The official Korean manual is used for broad
  setting and terminology context. No PAK or PAK-derived material was used.

## Default Decisions

| ID | Disposition | Decision |
| ---: | --- | --- |
| 62755 | accepted | Changed the epithet from phonetic `텐핑거스` to the supported meaning `열 손가락`. English `Ten-Fingers` and Japanese, Chinese, German, Spanish, French, Italian, and Russian all render the epithet semantically. The official manual's page 1 identifies Varani as merchants, supporting the setting phrase; it does not supply this character's epithet. The English, German, and other source rows also identify gambling as Kezar's notorious vice. |
| 62792 | accepted | Recast the opening as `그런 일도 있지. 특히 전선에서 막 돌아온 너 같은 부류에게서 말이야.` English `We see that ... from your sort` and German, Spanish, French, Italian, and Russian describe an observed/common occurrence among people just returned from the front. Japanese says such a reaction is understandable. The old Korean incorrectly inferred that the listener would know better because of their return. The pass and drinking admonition remain unchanged. |
| 62796 | not an issue | `신비롭구나` is a reasonable Korean rendering of English `enchanted`; German and Chinese retain a magical quality, while Spanish and Russian support a charming/enchanting quality. The Japanese recasts the image as beauty. Korean preserves the praise, forgiveness, and comparison with her race without introducing a narrower claim. |
| 62867 | not an issue | The source poem is duplicated at ID 19963 in English, Japanese, and Chinese. The remaining Korean `넘어진 어리석은 자들` follows the literal fallen/fell image also present in the source translations. The preceding supported wording already matches the reviewed duplicate poem. No additional lore interpretation is needed. |

## `affix` Decisions

All seven term groups are closed as `NOT_AN_ISSUE`; no Korean affix `Texto`
cell changed.

| ID / variants | Active Korean | Disposition | Cross-language basis |
| --- | --- | --- | --- |
| 101 / 12, 14, 21, 22, 24 | `호의의` | not an issue | English is malformed as `Favors's`; Chinese `恩典`, Spanish `del Favor`, French/Italian benefit or gift readings, and German/Russian fortune or patronage readings share a beneficial-favor sense. The Korean remains within that supported semantic range. |
| 115 / 12, 14, 21, 22, 24 | `*심판받은 자*` | not an issue; linked to D-18173 | English `of the Reckoned`, Chinese `天罚者`, German recompense, and Spanish/French condemned-person readings support a person subjected to judgment or consequence. The Korean preserves that person-denoting sense. |
| 117 / 12, 14, 21, 22, 24 | `행운의` | not an issue; linked to D-18175 | English `Fortune's`, Chinese/German fate readings, Spanish `Fortuna`, and French/Italian/Russian fortunate or luck readings permit the Korean luck/fortune sense. |
| 124 / 12, 14, 21, 22, 24 | `폐허의` | not an issue | English `Ruin's`, Chinese `废墟`, Spanish `Ruina`, and Italian `rovina` directly support ruins/ruin; German, French, and Russian use broader destruction or fatality senses that remain compatible with ruin. |
| 255 / 12, 14, 21, 22, 24 | `키스멧의` | not an issue | English, German, and Italian retain Kismet; Chinese, Spanish, and Russian interpret it through fate or destiny. The Korean preserves the source lexeme rather than choosing an unsupported narrower interpretation. |
| 341 / 12, 14, 21, 22, 24 | `*클레어리*` | not an issue | English `of Clairy`, Japanese, German, French, and Chinese support a proper name. Spanish, Italian, and Russian interpret it as clarity. English syntax and capitalization favor the proper-name reading, which Korean preserves. |
| 496 / 12, 14, 21, 22, 24 | `최상급` | not an issue | English `Prime`, Chinese `至尊`, and Russian elite readings support a highest-rank/quality sense. German, Spanish, French, and Italian choose other possible senses of `Prime`; English remains authoritative, and `최상급` is a defensible direct reading. |

IDs 115 and 117 update their parent decisions D-18173 and D-18175. Their
five fallback variants each are linked and are not added a second time to
the cross-resource decision count. The fallback inventory records the
disposition of each of its 35 exact keys.

## Edits and Integrity

| ID | Previous Korean | Applied Korean | Disposition |
| ---: | --- | --- | --- |
| 62755 | `이 우아하고 화려한 칼날들은 바라니 상인 공주 케자르 텐핑거스의 소유였어. 도박에 빠져 잃기 전까지는 말이지.` | `이 우아하고 화려한 칼날들은 바라니 상인 공주 ‘열 손가락’ 케자르의 소유였어. 도박이라는 가장 악명 높은 악덕에 배신당하기 전까지는 말이지.` | accepted |
| 62792 | `그렇지. 특히 너 같은 사람은 전선에서 막 돌아왔으니 더 잘 알겠지. 자, 방문 고위 인사들에게 주는 통행증을 받아. 그리고 술은 좀 적당히 마셔.` | `그런 일도 있지. 특히 전선에서 막 돌아온 너 같은 부류에게서 말이야. 자, 방문 고위 인사들에게 주는 통행증을 받아. 그리고 술은 좀 적당히 마셔.` | accepted |

- Pre-edit default SHA-256:
  `8eb5623adb48bd86ed5cc48bc61ddf92ec8ff2b808e3a9bb7c6fddab1aa48027`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-residual-closure-D19565/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit default SHA-256:
  `a9f2e8b3b242df709ac7150ef0b9abc39c0b8cd5580be980ee164930fe89507a`.
- Reversing the two exact row substitutions reconstructs the backup
  byte-for-byte. The BOM is present; 72,011 CRLF and 73 bare-LF endings
  remain unchanged. Row order and every non-target byte are preserved.
- Active affix SHA-256 remains
  `516b827b70d6a1262fd95ab7de46a1d5a9494d3b70a9a64dad89ad1d0a1b2f8e`.
- Fallback inventory SHA-256 after disposition update:
  `ad1ad94b1fa3e4a6fe5dbe4ced2d121387ed71733de2ec9e5f587c4e367ae101`.
- Default totals: **2,460 accepted / 25,354 not an issue / 10,710
  uncertain** (38,524). The four residual candidates from D-19564 are
  closed. The remaining 10,710 are other previously dispositioned default
  uncertainties, outside this residual batch.
- Chinese-only fallback subtotal (55 keys): **10 accepted / 45 not an
  issue / 0 uncertain**. All 140 fallback keys: **10 accepted / 130 not an
  issue / 0 uncertain**. There are no remaining holds in this fallback
  review scope.

## Resume

D-19565 closes the four default residual candidates and all 35 remaining
Chinese-only affix fallback keys. This does not declare the wider
translation audit complete: the default audit still records 10,710
uncertain dispositions outside this residual candidate set. Continue only
from a separately enumerated open default review queue; do not reopen these
closed rows or repeat their completed cross-language comparisons.
