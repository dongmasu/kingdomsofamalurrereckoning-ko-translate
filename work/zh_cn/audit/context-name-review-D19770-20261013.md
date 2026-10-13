# Context and Name Review D-19770

Date: 2026-10-13. Reviewed the remaining genuinely open findings in
`default` IDs 29451-29550 against English, Japanese, Chinese, active Korean,
the official Korean manual, and accepted terminology decisions. English
anchored meaning; Japanese informed voice/register; Chinese supported
cross-checks. No PAK or PAK-derived material was consulted.

For the English phrase `fell person`, the supplemental Oxford Advanced
Learner's Dictionary entry confirms a literary negative sense; Chinese also
preserves a negative reading.

## Accepted Corrections

| ID | Before | After | Basis |
| ---: | --- | --- | --- |
| 29452 | `‘전승’` | `전승(The Telling)` | Reuse the accepted in-world lore term from D-13443/D-19689. The categorical exclusion of mortals, now and in the future, remains intact. |
| 29458 | `스콜리아 아르카나` | `스콜리아 아르카나(Scholia Arcana)` | The official Korean manual, printed page 7, establishes this institution name. Restore its English source spelling for this standalone label, consistent with accepted bilingual forms. |
| 29481 | `필멸자여` | `사악한 자여` | English's literary `fell` means very evil or violent; Chinese also renders a negative epithet. `필멸자` changes the description to mortality, so use the supported pejorative while retaining Whenery's imperious address. |
| 29517 | `내 단검을` | `내 단검들을` | English explicitly warns against stealing multiple daggers. Add Korean plural marking while preserving the Traveler-trickery accusation. |
| 29525 | `난 세상을 떠났어` | `난 세상을 등졌어` | English and Japanese describe leaving/abandoning the world because of people like the addressee. `세상을 떠나다` can imply death; `세상을 등지다` preserves withdrawal without adding that implication. |
| 29529 | `스콜리아 아르카나 수석관` | `스콜리아 아르카나(Scholia Arcana) 수석관` | The Korean institution spelling was already correct in the active CSV; add its English source form to the standalone label, consistent with accepted bilingual forms. The Korean rank wording is preserved. |
| 29532 | `이건 장작을` | `이건(Egan) 장작을` | English and Japanese identify Egan as a person. Add the source spelling to disambiguate Korean `이건`, which is also a common demonstrative-plus-copula sequence. |

## Findings Closed Without Further Edits

| Finding | Disposition |
| --- | --- |
| D-9288 / 29460 | `not an issue`. The poem preserves the jewel, winter taking Dara, the line that she is no longer Dara, the speaker's failed love, and commitment to Esharra. The English and Chinese support the identity-change reading; Japanese's “never see Dara again” is a locale divergence, not proof of a Korean error. D-9268's previously accepted object-pronoun correction is not recounted. |
| D-9289 / 29476, 29494 | `not an issue`. The English spellings are Anela and Anella Saff. Similarity does not establish identity; Korean retains the distinct source forms and does not assert that they are the same person. |
| D-9291 / 29492 | `not an issue`. `메아리석` and `페이의 고분` convey Echostone and Fae Cairns as the latest experiments; the search to preserve the Fae's songs remains intact. No accepted row-specific term requires replacing these transparent forms. |
| D-9292 / 29500 | `not an issue`. `언더스타일` is already established, and `알현실` conveys the Hall of Appointments' permission function before greeting the king. The awkwardness and inconvenience remain. D-9269's Understyle correction is not recounted. |
| D-9310 / 29501 | `not an issue`. `보석 술집` conveys Gemstone Tavern; the English and other locales preserve the joke that the woman is likely passed out under a table. |
| D-9311 / 29503 | `not an issue`. Gale Crossing's quaint appearance, poor offerings, and the rumor that treasures are locked in Madding Wind remain distinct. Existing transliterations are traceable and no stronger established Korean forms apply. |
| D-9312 / 29507 | `not an issue`. The opaque Banshaen/DongleBolt/Ammo label retains all three parts and their order; no unsupported meaning is invented. |
| D-9313 / 29510 | `not an issue`. `{1}` remains in place and the Korean quantity question accepts an inserted honorific action without choosing an unsupported operation. |
| D-9314 / 29514 | `not an issue`. `화산 쇄설물 가루` is a defensible rendering of volcanic clinker dust; Japanese and Chinese also describe volcanic debris/slag. The alchemical alloying and cuirass steel remain explicit. |
| D-9319 / 29533 | `not an issue`. The note's position, timing after Tirnoch's defeat, and use of one Alyn Shir dagger to pin it to the wall are preserved. No single competing corpus spelling has stronger accepted authority. |
| D-9320 / 29538 | `not an issue`. `감전된` follows English `Shocked` and Japanese's lightning reading; the item label retains Evenroot. Chinese's startled reading does not prove a Korean error. |
| D-9322 / 29545 | `not an issue`. The accusation, required defeat, and land-healing action with Fellfire Bloom remain in sequence. Locale phonetic/name differences do not establish a row-specific correction. |
| D-9323 / 29546 | `not an issue`. Korean preserves the fragmented Dark/Empyrean recollection and repeated inability to remember; the competing locale interpretations do not support replacing the source-linked name. |
| D-9324 / 29550 | `not an issue`. `사암 저택` translates Sandstone Villa transparently, consistent with Chinese; Japanese's transliteration does not establish a Korean meaning defect. |
| D-9325 / other named terms in 29501-29550 | `not an issue`. Exact row checks preserve the named people, places, factions, and labels. In particular, Warsworn uses the official-manual `워스원`; no unsupported identity merges or global spelling changes were made. |

D-9321 / 29540 was already accepted by D-19659; the active cell already
reads `친구` for the nongendered address `dove`. It is not edited or
recounted here. D-9268, D-9269, and D-9293-D-9309 were also already terminal
and are not recounted.

## Validation and Resume

The seven accepted changes affect only `Texto`. Pre-edit SHA-256:
`ea309e9f1008afa0d3fa100b5df4aca529a443ed9e5df1f37c3b08542abe8ffd`.
Byte-identical backup:
`/private/tmp/ko-translate-backups/20261013/before-context-D19770/locatexts_zh_cn.koalocatext_default.csv`.
Active SHA-256:
`9c034d182f94fe4a100287c2cf37245d793c6bd6522555271456aefd13156161`.
Applying the exact inverse reconstructs the backup byte-for-byte. UTF-8 BOM,
65,135 row IDs and their order, 72,011 CRLF endings, 73 bare LF endings, and
all non-target bytes are preserved.

All 22 genuinely open findings in this range now have terminal dispositions:
seven accepted and fifteen `not an issue`. D-9321/29540 and earlier closures
were linked without recount. Historical operational totals
**3,419 accepted / 34,118 not an issue / 987 uncertain** remain unreconciled;
they are not adjusted without exact historical membership. The separate 55
Chinese-only affix holds were already closed by D-19565.

Next: D-19771, IDs 29551-29650; first open finding D-9339 / ID 29551.
