# Preliminary Language Scan: `default` IDs 41051-41100

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 41051-41100 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 41054 | `Detyre` / `데타이어` | Confirm and standardize the region-name spelling. | The English is an isolated proper name; Japanese/Chinese use other phonetic forms. | Medium |
| 41055 | `Baronett` / `바론넷` | Verify whether Baronett is an epithet/title or a personal name, and align it with Dead Kel/Hanged Men terminology. | Korean preserves the claim that this is the cruelest of Dead Kel's Hanged Men and that the addressee defeated him. | Medium |
| 41056 | malformed English `if you I can` / `할 수 있는 한` | Preserve the apparent intended offer to help as much as possible, while recording that English has a source typo. | Korean naturally renders the likely intended meaning. Japanese and Chinese also read it as an offer of help; no change to the source or CSV is authorized. | High |
| 41057 | `impact has loosed him of his senses` / `충격으로 이성을 잃었다` | Confirm whether the impact caused temporary unconsciousness, loss of senses, or loss of sanity. | Korean interprets it as losing one's reason. English is awkward and Japanese/Chinese differ on whether senses or intent were lost; the possibility that he may regret his initial intent is retained. | High |
| 41060 | Sidhe / `시드헤` | Confirm whether Sidhe is a named place/realm and standardize the proper-name form. | Korean treats it as a place traversed and preserves the speaker's wish to avoid the malevolent Fae. | Medium |
| 41063 | Sparrows / Orwin Dunn / Rathir Quays | Confirm whether Sparrows is a named faction/group and standardize the associated names and harbor location. | Korean interprets Sparrows as a group that was killed, and retains the old enemy's sighting at Rathir's docks. Locale forms differ. | Medium |
| 41067 | `scavs` / `스캐브` | Confirm the creature name and preserve the condition that ordinary harvesting cannot resume until the infestation is addressed. | Korean retains the infestation and harvest consequence. Chinese has a location/meaning mismatch; the creature term remains provisional. | Medium |
| 41068 | Champion / Tyr Magnus | Confirm the formal Champion title and name spelling; retain that his underlings wager in his name. | Korean preserves the claim as hearsay and the agent/wager relationship. | Medium |
| 41070 | `Praetorian Watch` / `프라이토리아 감시대` | Standardize the Watch and Praetorian organization terms. | Korean combines a transliteration of Praetorian with a translated Watch; historical notes group it with Praetorian ranks and Watch terminology. | Medium |
| 41072 | Bloodbane / brownies | Confirm canonical creature/name forms and preserve that Bloodbane is drawn by the brownies' death cries. | Korean retains the cause and the speaker's intention to kill it first. Locale references translate or transliterate Bloodbane differently. | Medium |
| 41073 | `young races` / `어린 종족` | Confirm whether “young races” is an in-world category of newer peoples rather than literally young individuals, and standardize it. | Korean retains the protected-district rationale. Japanese calls it young races/peoples; the exact setting category needs lore context. | Medium |
| 41074 | `Headhunters` / `현상금 사냥꾼들` | Determine whether this is a group/title or the generic occupation of bounty hunting. | Korean selects bounty hunters; Japanese transliterates the term and Chinese translates it as headhunters. The isolated label does not settle the category. | Medium |
| 41075 | `martyr to our cause` / `대의를 위해 ... 순교` | Preserve the coerced-sacrifice meaning and check whether “martyr” is religious or figurative. | Korean keeps the apology, the cause, and the necessity claim. The addressee's Beckoned title remains provisional. | Medium |
| 41076 | `Cliffbreak Fasting` / `클리프브레이크 패스팅` | Determine whether `Fasting` is a proper site/setting term, a source error, or intended to mean a passage; do not silently normalize the location. | Korean transliterates `Fasting`. Japanese calls it an underground passage and Chinese a cliffside passage. Historical notes explicitly leave this term unresolved. | High |
| 41078 | `crypts beneath the city's sewers` / `하수도 아래 ... 지하 묘실` | Preserve the location beneath the sewer system and confirm whether “crypts” is a proper site or generic burial chambers. | Korean retains both the sewers and crypts; the object being sought remains implicit as in English. | Low |
| 41083 | reagent/crafting UI markers | Preserve `{*1...}` display-marker identity and `{LINE_SPACE}` placement; confirm the Korean labels and their grammatical order. | All expected marker classes appear in the Korean line, with the line-space marker after the first reagent label. The localized wording explains crafting potions at alchemy workbenches; label order differs stylistically across references. | Medium |
| 41084 | Paling Wand / Lyria / Galafor | Confirm the item and proper-name forms, and preserve the reported disagreement about why Lyria expelled the farmers. | Korean retains that the wand enables farm governance/rebuilding and that Aurela believes Lyria drove farmers from Galafor. Chinese instead says Lyria does not want farmers to appear there, a reference/intent divergence. | Medium |
| 41085 | Crows / Arena tournament | Confirm whether Crows is the named team/group and preserve that the tournament is stalled pending a new member. | Korean keeps the dependency and group membership. The Crows name remains an open term in nearby source-keyed notes. | Medium |
| 41087 | `When we have reached them` / `그들에게 도착하면` | Identify the antecedent of `them` if available; preserve that more information comes after reaching them. | Korean correctly leaves the referent unresolved rather than inventing a place or people. | Medium |
| 41090 | fragmentary Court of Winter item description | Preserve the fragment and standardize the Court/item terms without adding a missing subject or verb. | Korean retains the damp-air/frost effect and the engraved blade/classic Fae-style grip; English is a sentence fragment and the item type is unstated. | Medium |
| 41093 | `[DO NOT USE]` / preserved verbatim | Retain the warning exactly and determine whether the label is intended to appear in-game. | English, Chinese, and Korean contain a warning marker; Japanese omits it and instead says unusable. Korean preserves `[DO NOT USE]` exactly, matching English. | High |
| 41094 | Dverga / storm-sea talisman | Confirm the people-name form and preserve the protective barrier effect. | Korean retains the belief about stormy seas and the talisman's protection from all harm; terminology remains provisional. | Medium |
| 41095 | incomplete `{*1` | Preserve the malformed token exactly and flag it for source/runtime investigation; do not complete or remove it in this pass. | English, Japanese, Chinese, and Korean all contain the same incomplete marker fragment. | High |
| 41099 | `Envenomed Edge` / `맹독 칼날` | Confirm whether this is a named ability/item and standardize the title form. | Korean translates the compound; Japanese transliterates it and Chinese describes a poisoned edge. The isolated row lacks category context. | Medium |

IDs 41051-41053, 41058-41059, 41061-41062, 41064-41066, 41069, 41071,
41077, 41079-41082, 41086, 41088-41089, 41091-41092, 41096-41098, and
41100 generally retain the English meaning on this first reading. Proper
names, established terms, register, and plot references remain subject to
integrated review.

## Historical Audit Reconciliation

- The source-keyed historical log has checked questions overlapping IDs
  41050-41149, including the `if you I can` typo, the unclear impact/senses
  phrase, Cliffbreak Fasting, Sparrows/Orwin Dunn, scavs, Tyr Magnus,
  Bloodbane, young races, and the Paling Wand/Crows/Warden terminology.
- It also flags the crypts, Hallam, reagent/crafting markers, Court of Winter
  item, Alyn Shir, Dverga talisman, exact `[DO NOT USE]` warning, and
  malformed `{*1` marker. These were checked against the active rows.
- The official Korean manual could not be text-searched in this environment;
  no new manual-based terminology claim is made here.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 41051-41100 once
  and in identical order.
- Embedded line-break counts match across the four locales. At ID 41093,
  Japanese alone omits the warning marker; Korean retains the exact English
  `[DO NOT USE]`. ID 41095's incomplete `{*1` is present verbatim in every
  locale. The expected line-space/reagent marker classes at 41083 are present.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 41051-41100 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 41101.
