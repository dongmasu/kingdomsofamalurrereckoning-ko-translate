# Preliminary Language Scan: `default` IDs 63851-63900

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 63851-63900 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, source-keyed historical
  questions, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 63851 | Sandstone Villa deed / `서비스` | Resolve the malformed clause “and service a portion thereof”: does it grant a portion of city services, or impose service/civic obligations? | English is grammatically incomplete; Chinese reads as access to some services, while Japanese says the owner becomes part of Adessa. Korean provisionally follows the services reading. | High |
| 63852 | `{*3Power}` / `힘` | Confirm the localized markup uses the official Korean stat label and retain the additional-Power meaning. | Korean renders the value marker as `{*3힘}`; English, Japanese, and Chinese preserve the same marked stat concept. | Medium |
| 63854 | Keepers of the Crossing | Verify whether this is a formal group name and preserve the two speakers' introductions. | English capitalizes the group name; Korean uses the descriptive `건널목의 수호자들`, while Japanese also describes the keepers and Chinese describes guardians of a pass. | Medium |
| 63855 | Odwald Bynothas / Emaire | Verify the scholar's and city's canonical spellings; the English “The Odwald Bynothas” is awkward. | Korean interprets Odwald Bynothas as the scholar's name, consistent with Japanese and Chinese. | Medium |
| 63856 | `Adept` / `숙련자` | Determine whether `Adept` is a formal rank/class or a generic proficiency label. | English capitalizes the isolated label; Japanese transliterates it and Chinese uses an attendant-like term. Korean uses a general skill label. | High |
| 63858 | `silkfarmer` / `비단 농부` | Verify the occupation (silk cultivation, silkworm raising, or silk collection) and retain the gender-neutral reference to the remains. | Japanese says silk-gathering worker; Chinese says a silk worker. Korean keeps the unidentified person ungendered but its occupation wording may imply crop farming. | Medium |
| 63864 | `Missives` / `서한들` | Confirm whether `Missives` is a named document set and retain the plural-object reading. | The English capitalized plural and Japanese “documents” suggest a specific set; Korean uses a generic plural letter term. | Medium |
| 63868 | stash / inventory / player housing markup | Verify the order and exact localized labels inside all three `{*1...}` spans. | All locales preserve the three spans and `{LINE_SPACE}`. Korean orders them stash → player housing → inventory, while English/Japanese/Chinese present stash → inventory → player housing. This may affect label correspondence. | High |
| 63869 | `devlish boggart` / `악마 같은 보가트` | Record `devlish` as a likely English typo for `devilish`; verify the creature-name rendering. | Korean conveys the apparent meaning and transliterates `boggart`; Chinese likewise describes the mask as frightening. | Medium |
| 63871 | Hall of the Firstsworn | Verify the canonical Korean name and maintain consistency with other `Firstsworn` references. | Korean transliterates the hall name; other locales translate or transliterate it differently. | Medium |
| 63873 | Ina Sawerth death notice | Preserve its formal notice voice, named addressee, military attribution, and zero embedded line breaks. | Korean retains the single-line notice and the relationship “your ward”; the names and `Varlaine`/`Klurikon` forms remain glossary candidates. | Medium |
| 63877 | `blight of winter` / `겨울의 역병` | Clarify the intended threat: winter's blight, a blight associated with winter, or the Winter Fae/tyrant. | English says `blight of winter`; Japanese describes a tyrant of winter and Chinese a destructive winter force. Korean's “winter plague” is a plausible but not settled reading. | High |
| 63880 | House's “untainted survival” | Preserve the conditional willingness to proceed if it is the only way for the House to survive without corruption. | Korean retains the House/family and the untainted-survival condition; the precise political or moral sense of `House` remains contextual. | Medium |
| 63884 | Eldric Orhelm / Alserund / walking staff | Verify proper-name forms and preserve the timeline, death discovery, proof item, and return destination. | Korean retains the twelve-day interval and walking staff as proof; locale spellings vary, and Chinese calls the object a staff. | Medium |
| 63886 | Cillian Keen / Barghest pet training | Preserve the training objective and the prerequisite of collecting meat to lure the beast. | Korean retains the trainer, keep, pet, and bait sequence; canonical proper-name forms remain provisional. | Medium |
| 63887 | Private Sterling | Verify whether `Private` is a military rank and preserve the reward-report objective. | Korean renders it as the rank `일병`; Japanese and Chinese support the military-rank reading. | Low |
| 63892 | Godstorm / `고드스톰` | Confirm whether `Godstorm` is a proper entity/name and retain the impatient-personification voice. | English capitalizes it; Japanese and Chinese translate it as a divine storm, while Korean keeps the English name parenthetically. | Medium |
| 63895 | Testament / Belen Covenant | Preserve the English `Testament` reading as provisional and investigate the cross-locale source conflict before changing the draft. | English says `Testament`; Japanese and Chinese identify Belen. Korean follows English and the prior audit's provisional decision. | High |
| 63897 | Beggar's Bluff / vagrants | Verify the place-name form and keep the paid request to make the vagrants leave, without strengthening it to killing them. | Korean says to drive them out and preserves the reward; Japanese/Chinese also use removal/departure wording. | Medium |

Other reviewed rows generally preserve first-read meaning and voice/register,
including the stolen Permit condition, the village's recovery, Tuatha Guard,
the stash explanation, the border permit reward, Godstorm, the House's
survival, the Beggar's Bluff request, and short UI/dialogue labels. Findings
remain provisional and are not confirmed corrections.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 63850-63949 against
  this batch, including the deed, Power marker, Keepers, Adept, silkfarmer,
  Missives, three localized markup labels, Firstsworn Hall, death notice,
  Cradle of Summer, Godstorm, Evenroot, Testament/Belen, Beggar's Bluff,
  Eldric Orhelm, Barghest training, and Private Sterling.
- The previous historical group for IDs 63750-63849 was consulted only for
  boundary/context where relevant; rows outside this batch were not counted.
- Findings remain preliminary open questions, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 63851-63900 once
  and in identical ascending order.
- Embedded newline counts match for every row. ID 63851 retains two
  paragraph breaks, and the notice at 63873 has zero breaks in all locales.
- ID 63852 preserves the `{*3...}` marker; ID 63868 preserves three
  `{*1...}` spans and `{LINE_SPACE}`, with the localized-label order
  difference recorded above.
- No translation CSV edit was made.

## Batch Status

IDs 63851-63900 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 63901.
