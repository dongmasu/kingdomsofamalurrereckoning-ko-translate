# Preliminary Language Scan: `default` IDs 16200-16249

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 16200-16249.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 16200 | Jawbone / Gallows End / Dvergan script / relic | Verify landform, name forms, and whether the map text is a collectible description or quest clue. | Korean preserves the reassembled map, its location west of Gallows End, unreadable Dvergan writing, and valuable relic location; source locales vary on name forms. | Medium |
| 16202-16204 | Destinies Pack Mage Armor Buff / island / Battle Frenzy | Determine whether the first string is an internal effect label; preserve the island's personification and the +15% attack-speed trigger. | Korean retains the island bringing the addressee and the exact buff/condition; the concatenated asset-style label lacks UI context. | Medium |
| 16205-16206 | Sagecraft altar / socketable Gems / Mercantile | Align crafting and skill terminology and preserve the permanent bonus and paragraph break. | Korean calls the Sagecraft altar a magic-item crafting altar and renders Mercantile as `상업 기술`; the book's permanent skill bonus and blank paragraph break are retained. | Medium |
| 16207 | “perfect love nest” -> `사랑을 나누기 딱 좋은 곳` | Preserve the flirtatious implication without making the innuendo more explicit than intended. | English, Japanese, and Chinese all retain the love-nest implication; Korean makes the sexual use more direct. | Medium |
| 16208-16211 | Coilsbain Cavern / Didenhil / Hyperian / magical shrine and Fae songs | Verify names and whether the shrine is an object/place that preserves songs, lore, or poetry. | Korean preserves the Jottun displacement of boggarts and threat to Didenhil, sealed temple, and shrine's song-preservation purpose; name spellings and “song” terminology vary. | Medium |
| 16212-16216 | Grildas / Osduin / Lykeios / Ragnarr / Delvers / Gallows Tree | Standardize names and Delvers terminology; clarify the phrase about others' sorrows being silent. | Korean retains the encroaching Tuatha, desecrated tree, and inability to hear others' sorrows; “sorrows” may be a lore concept rather than ordinary sadness. | Medium |
| 16217 | killed a potential helper / stolen item from mayor's house | Preserve the speaker's guilt and clarify the item/house relationship. | Korean retains that the speaker killed someone who could have helped recover an item stolen from the mayor's house in Apotyre. | Medium |
| 16218-16220 | Maybryn Wine / Lady Ansilla / dolls | Verify names and preserve that the account is legend and the dolls were last seen in Ansilla's hands when her family was murdered. | Korean retains the attributed legend and the plan to search the ruins; locale renderings differ on some names and the family reference. | Medium |
| 16224 | Revival -> `리바이벌` | Determine whether Revival is a named place/camp or a generic state. | English and Japanese leave it as a place-like name, while Chinese explicitly calls it a Revival Camp; Korean transliterates it. | Medium |
| 16226-16228 | Brutal Weaponry IV / Wild Fae / melee damage | Align skill title and combat terminology, preserve +17%, and retain the speaker's admiration. | Korean keeps the skill level, charm-to-kill account, sigh/admiration, and exact melee bonus. | Medium |
| 16231-16234 | Tala-Rane / Aster army / Firstsworn | Verify region, army, and title forms; preserve the boast about ancestry and command. | Korean retains the family's former importance, an ancestor's army command, and Firstsworn as a bilingual title. | Medium |
| 16239 | Chaos Rifts / Chaos Sight / Chaos Portals | Preserve every localized marker and line marker; verify mechanic terminology and the level-1/defeat requirements. | Korean retains all four instruction sections, requires Chaos Sight level 1+, and says every spawned monster must be defeated. Chinese omits that defeat condition, while the Japanese and English include it. The localized marker sequence and requirement are intact in Korean. | High |
| 16241 | Wolds / smoke / frailty / “a wearying of magic” | Verify Wolds as a place and preserve the unusual image of magical decline. | Korean says magic itself is growing tired; Japanese also describes weariness, while Chinese says magic lingers. The source's metaphor is unresolved. | High |
| 16242 | Flawless Mitharan Arcane Bindings | Determine the item's category and align Mitharan/Arcane terminology. | Korean transliterates the item compound as `비전 구속구`; other locales also leave the item category opaque. | Medium |
| 16247 | Service / Orison / Temple of Lyria / Nuer Bedlym | Determine whether Service and Orison are rites, quest stages, or named organizations; preserve the final-task sequence. | Korean translates Service as `의식`, transliterates Orison, and correctly sends the player back for the final task; references differ on both capitalized terms. | High |
| 16249 | Dokkalfar ruling the lands | Preserve the conditional warning that the Dokkalfar will seize control if no one pays attention. | Korean retains both readiness to rule and the condition of being unobserved. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 16200, 16202-16203, 16205-16206,
  16208-16216, 16217-16220, 16224, 16226-16228, 16231-16232, 16239,
  16241-16242, 16247, and 16249 against all four active locale rows.
- Terminology, name, source-context, and metaphor questions remain open.
  English/Japanese versus Chinese at ID 16239 and the possible explicitness
  of “love nest” at 16207 are recorded as preliminary observations only.
- Cross-batch consistency candidates include Gallows End, Dvergan, Sagecraft,
  Mercantile, Hyperian, Fae, Delvers, Gallows Tree, Lykeios, Ragnarr,
  Firstsworn, Chaos Rifts/Chaos Sight/Chaos Portals, Mitharan, Dokkalfar,
  and Fate terminology.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order.
- Embedded line-break counts and normalized runtime-token identities/order
  match across all four locales. ID 16205 keeps its blank paragraph break;
  ID 16239 preserves the `{LINE_LEFT}`, `{LINE_SPACE}`, and `{*1}` sequence.
- The official Korean manual could not be text-searched in this environment;
  terminology candidates remain unverified against it.

## Batch Status

IDs 16200-16249 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` IDs 16250-16299.
