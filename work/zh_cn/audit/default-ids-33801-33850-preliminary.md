# Preliminary Language Scan: `default` IDs 33801-33850

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 33801-33850 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 33802 | `비탄의 가문`, `미든`, `표식` for House of Sorrows, Midden, `beacon` | Confirm the House, Midden burial practice, and Hallowed Tree as named lore concepts; preserve that the tree is a beacon/landmark rather than merely a mark, and retain the five-paragraph account's corpse-care and cultural claims. | Korean preserves the five paragraphs and describes the Fae tending the dead, but renders `beacon` as `표식`, which can mean a generic mark and understate its guiding-signal/landmark function. Historical notes explicitly flag the faction, Midden, Hallowed Tree, and burial rites. | High |
| 33804 | `네게서는 운명 마법 냄새가 나` for `You stink of Fate magic` | Preserve the hostile, sensory metaphor and clarify whether `Fate magic` is a named magical discipline; retain the implication that the Fateless One should not exist. | Korean follows the smell metaphor literally. Japanese and Chinese also express an emanating smell/aura, so this is not clearly an error; capitalization and lore terminology remain open. | Medium |
| 33805 | `네 장례식이니 네 뜻대로 해` for `It's your funeral` | Preserve the idiomatic warning/taunt rather than interpreting an actual funeral; standardize Bloodbane and Aron Excavations. | English uses the idiom after asking whether the listener is sure. Korean's “your funeral, so your choice” captures the warning; the named target and excavation company need consistency review. | Medium |
| 33807 | localized location/fast-travel/world-map wrappers and `{1}` | Preserve every wrapper and argument; review localized marker payloads and whether `{1}` should remain at the English/Korean position or follow the Japanese/Chinese instructional order. | All tokens occur once and Korean follows English order. Japanese and Chinese place `{1}` before the map/location/fast-travel labels, whereas Korean places it last; marker payload labels are localized in Japanese/Chinese but remain English in Korean, matching English. Historical notes explicitly identify this marker sequence. | Medium |
| 33812 | `사티바 섬유` for `Sativa Fiber` | Confirm the named plant/material and whether `fresh, and unpicked` is a required item condition; standardize the material name. | Korean preserves the fresh/unpicked request and follows the source name by transliteration. Japanese calls it a leaf and Chinese interprets it as flax fiber, so its exact game item identity remains open. | Medium |
| 33817 | `날개와 꼬리와 발톱이 눈부시게 나부꼈으리라` | Preserve the conditional contrast that the creatures would have spread across vale and hill had they lived; verify what kinds of creatures the wings/tails/claws describe. | Korean retains the hypothetical and body-part imagery. The English is poetic and context-dependent; Japanese and Chinese also leave the specific creature unclear. | Low |
| 33820 | `대화 전에` for title `Before The Talk` | Confirm whether this is a named quest/title or a literal temporal heading and standardize title capitalization/form. | Korean gives a literal title reading. The locale references also differ in capitalization/register; the row alone does not resolve whether it is a proper title. | Low |
| 33826 | `세 번째 무작위 범죄` for `the third random crime this week` | Verify whether `random` means unrelated/opportunistic incidents or is a gameplay/system qualifier; retain the third-crime count, sabotage, theft, and camp/city comparison. | Korean is literal, but `무작위 범죄` can sound like crimes chosen by randomization. Japanese omits the modifier and Chinese says third crime without explaining “random”; the source may itself be colloquial. | Medium |
| 33827 | `형 하리트와 누이 구엔페어` for `my brother Harit and my sister, Guenfear` | Avoid adding the speaker's gender or sibling age unless context establishes it; preserve that both siblings were children when they fled the war. | English specifies brother and sister but gives no ages or speaker gender. Korean `형` encodes a male speaker and older brother; Chinese also assigns ages, while Japanese says “twin brother” and sister, so the locale references conflict. | Medium |
| 33829 | `용맹의 군주들` for `Lords of Valor` | Confirm whether this is a named title/faction and standardize it; preserve that the listener now holds the position and challengers are expected. | Korean conveys the victory and title challenge. The English capitalization and recurring Valor terminology make this a corpus-wide name/title consistency candidate. | Medium |
| 33833 | omission of `my lovely` in `어머, 당신이네` | Preserve the speaker's flirtatious endearment/innuendo and offer of gold for a small favor, without intensifying beyond the source. | English directly addresses the listener as “my lovely” and follows with flirtatious praise. Korean retains the appearance compliment and offer but omits the endearment; Japanese also reduces the address. The historical log identifies this passage as innuendo. | Medium |
| 33836 | `계절의 가문 추종자` for `House of Seasons Adherent` | Verify whether House of Seasons is a named faction and standardize the role/title. | Korean translates the group and role components. English capitalization suggests a faction/status label; the historical audit explicitly lists this term. | Medium |
| 33839 | `델마 오무니` for `Delma O‘Mooney` | Confirm the apostrophized family-name spelling and established Korean transliteration without normalizing the source punctuation silently. | Korean transliterates the name but drops the source's curly apostrophe. The row is a proper-name label; the English spelling should remain the lookup reference. | Low |
| 33840 | Valor Arena business account / `영업장` | Preserve the single-paragraph journal, the beast-tamer exhibition, bribery, relocation of vendors/families, road-building, and revenue; standardize Alserund, Valor Arena, and Detyre. | Korean retains the account in one paragraph and its main sequence. Japanese and Chinese also preserve the narrative; proper-name and business terminology remain integrated-pass questions. | Medium |
| 33844 | `+30%` critical damage / `+60%` Dagger and Faeblade sneak-attack damage | Preserve the two separate modifiers and their conditions; verify UI phrasing for attacking unaware enemies from Stealth. | Korean keeps both values and the blank line, but the first line's attachment of “while in Stealth” and “unaware enemies” is syntactically compressed. Locale references agree on the mechanics. | Medium |
| 33849 | `부활` for standalone label `Revival` | Determine whether this is a named ability, action, status, or location label before choosing a noun/verb form. | English is a one-word capitalized label; Japanese transliterates it, Chinese expands it to “Revival Camp,” and Korean selects the abstract noun “resurrection.” Context is absent. | Low |

IDs 33801, 33803, 33806, 33808-33811, 33813-33816, 33818-33819,
33821-33825, 33828, 33830-33832, 33834-33835, 33837-33838, 33841-33843,
33845-33848, and 33850 generally retain the English meaning on this first
reading. Proper names, lore, voice, and display conventions remain
integrated-pass candidates; no additional distinct wording issue was
identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 33800-33899 explicitly flags
  House of Sorrows/Midden/Hallowed Tree and burial rites (33802), Fate magic
  and Bloodbane (33804-33805), runtime location markers (33807), Galette
  Tunnel (33810), Sativa Fiber (33812), context at 33817, `Before The Talk`
  (33820), crime rules (33826), family/context at 33827, House of Seasons
  Adherent (33836), the Valor Arena account (33839-33840), combat values
  (33844), and combat-based innocence judgment (33848). These questions were
  compared with active Korean and all locale references.
- At ID 33807, token identities and multiplicities match; `{1}` order differs
  in Japanese/Chinese but Korean follows English. The translated marker
  payloads are recorded separately from token-wrapper integrity.
- ID 33840 remains one paragraph in all locales. No historical question was
  treated as authorization to edit the CSV; findings remain candidates.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 33801-33850 once
  and in identical order.
- Embedded line-break counts match across all four locales. ID 33802 retains
  four newline characters (five paragraphs), and ID 33840 remains a single
  paragraph.
- ID 33807 preserves the six runtime wrappers/arguments exactly once each:
  `{*1location}`, `{LINE_SPACE}`, `{*1fast travel}`, `{*1location}`,
  `{*1world map}`, and `{1}`. Korean follows English order; JA/ZH reorder
  the argument and localize payload text.
- ID 33808 preserves `+15% Elemental Resistance`; ID 33844 preserves
  `+30%` and `+60%`. Japanese is the only locale that renders ID 33826's
  third-crime count with digit `3`; the quantity agrees.
- Active Korean CSV hashes remain at their recorded checkpoint values.
- No CSV text or source file was edited.

## Batch Status

IDs 33801-33850 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 33851.
