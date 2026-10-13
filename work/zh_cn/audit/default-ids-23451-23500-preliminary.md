# Preliminary Language Scan: `default` IDs 23451-23500

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 23451-23500 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 23455 | Blocks 35 Magic / 26 Melee / 26 Ranged damage | Determine whether `Blocks` is the established stat verb and preserve all three damage classes and values. | Korean retains all classes and values; the source uses the same repeated verb across three literal `\\n`-separated lines. | Medium |
| 23459 | “form a peace” / `화친을 맺고 싶어` | Preserve the speaker's admission of attempted murder, underestimated opponent, and transactional need for their skill. | Korean retains all three points and the insincere/pragmatic reconciliation tone. | Medium |
| 23460 | Crilgarin / Knave of Coins | Clarify whether Knave is a card/title or insult and standardize the coin/gold term. | Korean translates Knave as `건달`; historical title/wordplay question remains open. | Medium |
| 23461 | Tuatha Deohn / Amethyn / quotation escapes | Verify the faction and fortress names and inspect the active text's escaping. | Korean includes literal backslashes before both double quotes around `투아사 데온(Tuatha Deohn)`; the other locales do not have those backslashes. Record as a source-format/serialization candidate, not an applied correction. | High |
| 23463 | Hierophant's blessing / riches | Confirm the religious title and preserve that the speaker offers training in finding riches if the player wishes. | Korean retains the offer and blessing; title form remains provisional. | Medium |
| 23465 | Cynric family / Whitestone / Apotyre | Verify whether Cynric is a family name and standardize the region and family terms. | Korean retains the threat's elimination and regional scope; historical questions remain open. | Medium |
| 23466 | Rogue 01 Reckoning | Determine whether this is an internal/test label or intended in-world item text. | Korean follows the label literally; historical question remains unresolved. | Low |
| 23468 | Emberwood / seasteel / beachstone | Verify which compounds are named crafting materials and standardize their Korean forms. | Korean retains Emberwood transliterated and translates the other materials; historical glossary questions remain open. | Medium |
| 23469 | Testament / poison and cistern | Preserve the English faction name and the explicit plan to poison members and put their bodies in the cistern. | Korean follows the English's repeated `Testament` term and retains the actions. Japanese instead names Belen's group; source/lore conflict remains open. | High |
| 23472 | The Crows / tournament survival | Align the group name with ID 23377 and preserve the taunt that they will not last to the end. | Korean uses `까마귀단`, distinguishing the group from the birds label; English implies an organized team. | Medium |
| 23474 | Moon Camp | Standardize the camp's name and whether Moon is literal or a proper-place modifier. | Korean uses `달빛 야영지`; Japanese/Chinese use “Moon Camp” literally. | Medium |
| 23477 | Meathgra / fresh corpses | Preserve the bait strategy and sequence: destroy the corpses so Meathgra returns to its den. | Korean retains the likely outcome and waiting for more corpses. Historical creature-name question remains open. | Medium |
| 23478 | Motus Mining Interest | Determine whether Interest is part of an organization's name or denotes a consortium. | Korean selects `광업 조합`; English/Japanese/Chinese do not settle the institutional sense. | Medium |
| 23481 | stalwart Jottun / great Hero | Verify Jottun as a people/species and choose a consistent natural adjective. | Korean says `굳센`; Japanese calls the Jottun a servant and Chinese a loyal person, creating a descriptor/source-context question. | Medium |
| 23484 | 20% / 150 Bleeding Damage / 5 seconds | Preserve the chance, damage, and duration and verify the UI's preferred value order. | All locales retain 20%, 150 damage, and 5 seconds; Korean/Chinese place duration before damage, while English/Japanese place damage before duration. | High |
| 23485 | “This translation was a fun read” | Determine whether the meta-reference is intentional game content or a test string; retain it pending context. | Korean preserves the reference to reading a translation and its positive tone. | Medium |
| 23487 | quoted faltering speech / escaped quotes | Preserve the speaker's hesitation and dry punchline, and determine whether the literal backslashes are intended. | Korean includes literal backslashes before opening and closing double quotes; no other locale does. Historical question about the stammer and `that` remains open. | High |
| 23488 | Gridge epitaph / “Death to the Tuatha” | Preserve the epitaph's two-part cause of death and the final anti-Tuatha curse. | Korean retains the sword wound, plains' role, and curse. | Medium |
| 23494 | Emaire / “keep to ourselves” | Preserve the community's wish for privacy without intensifying it into total social withdrawal. | Korean says they want to live at a distance from the world, slightly stronger than the English idiom. | Medium |
| 23496 | “delved into ... aspirations” | Preserve the speaker's claim to have probed the man's ambitions, not merely observed thoughts. | Korean uses `야망을 속속들이 파헤쳤어`, preserving the ambition sense. | Low |
| 23499 | Darkvari father-to-son map | Verify Darkvari's family/people status and retain the generational map provenance and hidden treasure stashes. | Korean preserves the father-to-son chain and secret locations; historical question remains open. | Medium |
| 23500 | Dverga / second-floor art gallery | Preserve the speaker's uncertainty about Dverga artistic interests and the dream's second-floor gallery. | Korean retains both contrast and dream; it uses digit `2` where English spells `second` and Japanese also uses a digit. | Low |

## Historical Audit Reconciliation

- Rechecked archived questions for IDs 23455, 23460, 23466, 23468-23469,
  23472, 23477-23478, 23481, 23484-23485, 23487, 23499, and 23500 against
  the active rows. Stat, name, lore, meta-text, source-format, and context
  questions remain preliminary.
- Cross-checked recurring forms for Nil Kern, Crilgarin, Knave of Coins,
  Gadflow, Tuatha Deohn, Amethyn, Rathir, Ivan, Whitestone, Apotyre,
  Cynric, Arkes, Emberwood, Testament, Crows, Moon Camp, Meathgra,
  Motus Mining, Jottun, Ansilla, Fort Olghorn, Telogrus, Emaire,
  Zefwyn, and Darkvari.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 23451-23500 exactly
  once and in identical order.
- ID 23455 preserves three line-separated stat values in every locale.
- ID 23461 has literal backslash-quote sequences in Korean around the
  localized faction name; ID 23487 has them around the quoted speech. This is
  recorded for later technical review only; the translation CSV was not
  changed.
- ID 23484 preserves all three numeric values, but Korean/Chinese reorder the
  damage and duration positions.
- ID 23500 uses `2` in Japanese/Korean where English spells out the floor;
  the meaning is unchanged.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 23451-23500 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
23501.
