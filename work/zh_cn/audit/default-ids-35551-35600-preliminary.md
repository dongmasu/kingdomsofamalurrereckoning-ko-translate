# Preliminary Language Scan: `default` IDs 35551-35600

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 35551-35600 inclusive.
- Compared English meaning, Japanese register, Chinese supporting
  evidence, active Korean, and source-keyed historical questions.
- Read-only first reading, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 35553 | `허공에 ... 떠서`, `존재하지 않는 돌` | Review the four-paragraph floating-city travelogue's final image and Mitharu speculation; standardize Kollossae/Jottun-related imagery without assuming impossible stone is literal. | English describes a city floating over unseen/nonexistent support and giant inhabitants; Korean retains both and all four paragraphs. Japanese describes a stone not present in that land, whereas English's `stones that are not there` may instead describe the city's unsupported height. | Medium |
| 35555 | `점술 거울` | Check whether the scrying mirror is a named object distinct from Japanese `Eye of Tirnoch`. | English/Chinese and Korean specify a mirror; Japanese names a different Eye. The front-door versus stealth distinction is preserved. | Medium |
| 35560 | Cach Cranwyn, Sveri Brond, Teeth of Naros, Ettinmere | Verify names, narratorial voice and the stranger/savior's female reference; preserve all four paragraphs and the three-plus-one explorers. | English's narrator describes three initial explorers and a later fourth, the savior `herself`. Korean keeps their roles, the four sections, and the southward passage. | Medium |
| 35562, 35565 | `브라더 팰런`, `흐린 눈물`, `불쌍한 사람들? 그들에게 보상이라도 해.` | Check Brother Fallon as a religious title, the idiom in Mitharu's prayer, and who is instructed to make amends. | English 35565 is a clipped `Poor folk? Make amends.` Japanese makes its function a question; Chinese reads modification. Korean makes it a command to compensate the poor, requiring dialogue context. | Medium |
| 35567 | six inventory categories and rarity colors | Confirm the established localized category names, including `Infrequent` and `Set Item`, without reordering markup. | All six categories and the white/green/blue/purple/gold order are present; Korean retains every `{LINE_LEFT}`, `{LINE_SPACE}`, `{LINE_INDENT}` and `{*1}`-`{*6}` marker in order. | Medium |
| 35572, 35577 | `사이클론 탄약`, `내 검은 언제나 네 뒤를 지킬 거야` | Check the Sorcerer/Cyclone Ammo label; treat the blade line as a potential reversal of a threat into protective support. | English `my blades will always be at your back` can be ambiguous in isolation, but Japanese explicitly says the blades aim at your back and Chinese places them against it. Korean instead promises to guard the player. Context should decide the final tone before editing. | High |
| 35580-35583 | `클라우드크레스트`, `용맹의 의식`, `더 많은 걸`, `DOWN` | Standardize place/rite names; check whether `something more` means a different aspiration, not just more business/respect; verify whether DOWN is a literal button/state label. | English contrasts previous goals with `something more`; Korean `더 많은 걸` may imply greater quantity. Japanese/Chinese distinguish another kind of desire. All locales but Chinese leave DOWN in English. | Medium |
| 35585, 35589 | reagent list `3/3/1`; `타격당 체력 흡수 +20` | Verify reagent names; retain numeric amounts, recipe line breaks, and non-percent health-steal value. | English specifies Sativa Fibers 3, Scarwood Bark 3, Bloodroot 1, and `+20 Health Stolen per Hit`. Japanese adds an unsupported percent sign at 35589; Korean/Chinese do not. | Medium |
| 35591, 35594 | unnamed imprisoned woman; `살과 피를 지닌 몸으로` | Resolve the unnamed `she`, and whether `flesh and blood` modifies Anokatos or the speaker. | English places `flesh and blood` after Anokatos. Japanese reads Anokatos as a flesh-and-blood being; Korean attaches embodiment to `I`. Chinese omits this phrase. The divine-will versus Anokatos-will contrast remains; the antecedent needs context. | High |
| 35593, 35596 | Ayten's lawkeeper; `그들은` versus Kollossae | Identify who `they` are and standardize Ayten/Kollossae spellings; retain the group's comparative fighting strength. | English's `they` is unbound in the standalone 35596 line; Korean preserves the unresolved reference. | Medium |

IDs 35551-35552, 35554, 35556-35559, 35561, 35563-35564,
35566, 35568-35571, 35573-35576, 35578-35579, 35584,
35586-35588, 35590, 35592, 35595, and 35597-35600 generally
preserve English meaning on this first reading. Tone and lore names
remain open to the integrated pass.

## Historical Audit Reconciliation

- The source-keyed historical IDs 35400-35599 entry flags the floating
  city, scrying mirror, long Teeth of Naros passage, Brother Fallon,
  poor folk, inventory categories/rarity, Cyclone Ammo, blade idiom,
  Cloudcrest, DOWN, reagent amounts, `+20` health steal, prison
  referent, Ayten, flesh-and-blood and Kollossae comparison. All were
  checked against the active Korean and English/Japanese/Chinese.
- The high-confidence blade-tone concern at 35577 remains a
  preliminary candidate, not an authorized CSV correction.

## Other Checks

- Four locale files each contain IDs 35551-35600 once and in the same
  order. Embedded breaks match: six at 35553, six at 35560, four
  at 35585 and two at 35589.
- ID 35567's six-category/color tutorial retains its complete marker
  sequence and order. The item-cost amounts 3/3/1 and `+20` without
  percent are preserved in Korean; Japanese alone adds `%` at 35589.
- Active Korean `default` CSV SHA-256 remains
  `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 35551-35600 received one preliminary reading. Findings remain
open candidates. Continue at `default` ID 35601.
