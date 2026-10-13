# Preliminary Language Scan: `default` IDs 47051-47100

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 47051-47100 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 47051 | `FAIL LINE` | Preserve the literal test string until a separate decision determines whether this is intentional UI/debug text. | Korean matches English and Japanese verbatim; Chinese localizes it as failed dialogue. Historical notes explicitly identify this as a test string. | High |
| 47053 | my grace / `전하` | Confirm whether `my grace` is an honorific title for the addressee and whether `전하` is appropriate. | Korean treats it as a royal honorific. English/Japanese/Chinese do not establish the addressee's rank, and the historical log explicitly asks whether this is an honorific. | Medium |
| 47055 | ring as old as Nell / `늙은 넬만큼 오래됐어` | Preserve the comparison of the ring's age to Nell's age while keeping the tarnished green color; verify Nell's identity and the line's teasing tone. | Korean retains both visual and age details. The English phrasing is elliptical, while Japanese/Chinese likewise interpret it as a comparison to old Nell. | Medium |
| 47057 | Warsworn / Vault / `유물을 얼마나 많이` | Preserve the urgency to follow the trail and the uncertainty about how many artifacts were stolen after someone copied the key. | Korean retains the copied key, Vault, and unknown quantity; “who knows how many” remains rhetorical rather than a specific count. | Medium |
| 47058 | Persuasion skill | Preserve the alternate-quest-path/better-reward benefits and the lower guard-bribe cost after committing a crime. | Korean retains both effects and their condition. The term `Persuasion` should be checked against the established Korean skill/UI glossary. | Medium |
| 47061 | House of Sorrows / `비탄의 집` | Confirm the faction/house's canonical Korean name and keep the English form consistent with other occurrences. | Korean includes the English name parenthetically and uses a literal Korean rendering; the historical terminology inventory identifies the name as unresolved. | Medium |
| 47063 | `it` saves people from the wilds | Preserve the contrast between an unspecified thing protecting “us” and the speaker's weapons protecting the guard below, without guessing the referent. | Korean retains the contrast and deliberately leaves `그것` unresolved. The row alone does not identify the first subject. | Medium |
| 47065 | Master Makers / `명장들` | Determine whether this is a named guild/group or a generic description of master craftspeople. | Korean chooses a generic “masters” reading; Japanese reads legendary blacksmiths and Chinese master makers, so the entity type remains open. | Medium |
| 47066 | Adessan Praetorians / `아데사의 프라에토리안 병사들` | Verify the faction/rank name and retain that they are pursuing the speaker now that the news is out. | Korean preserves the expected pursuit and the speaker's plan to be gone; the proper title and transliteration remain provisional. | Medium |
| 47068 | Toothpicks / Sidhe / `이쑤시개들` | Confirm whether Toothpicks is a named cache/object with a humorous literal label, and verify Sidhe as the location. | Korean retains the name parenthetically and the map/strongbox/key chain. Japanese calls them knives while Chinese adds another item name, so the source referent remains unresolved. | Medium |
| 47071 | Honor Brands / `명예의 낙인` | Verify whether Honor Brands is the Faeblades' proper product name and preserve the claim that they are authentic and Fae-forged in Ysa. | Korean retains the weapon type, named brand, authenticity, makers, and location; the rendering of `Brands` as a mark/brand needs terminology review. | Medium |
| 47072 | Faer Gorta summon / `120초`; `{*1[활성]}` | Preserve the Active marker wrapper, localized marker payload, summoned creature, ally behavior, and 120-second duration. | All locales retain `{*1[...]}` with localized `Active` text and preserve one line break and 120 seconds. Korean keeps the creature name and construction metaphor. | High |
| 47075 | Cairns / `케언들` | Confirm whether this plural refers to named lorestones/cairns or generic stone piles. | Korean preserves the plural search objective; the source-keyed historical log records Cairns as a terminology question. | Medium |
| 47077 | Vraekor / Aodh | Preserve that Vraekor's priests have long barred entry to Aodh and that the speaker knows it is an ancient ruin; verify both names. | Korean keeps the entry restriction and the ruin identification; phonetic forms vary across locale references. | Medium |
| 47080 | Enconeg / mermaid / Ettin Shaman | Preserve the tentative identification of the pool, the absence of the expected mermaid, and the need to report the Ettin Shaman sighting. | Korean retains all three steps and the uncertainty marker; proper spellings remain provisional. | Medium |
| 47090 | Red Marches / `붉은 행군지` | Verify the realm's canonical form and distinguish the named Red Marches from a generic “red march.” | Korean preserves the caves, Detyre dust, and westward escape, but the literal place-name rendering may not match the established setting terminology. | Medium |
| 47092 | nine warding principles / ten words | Preserve both counts and the frustrated question, then assess whether the word-count joke works in Korean. | Korean retains nine and ten as written numbers/words and the contrast between practical spellcasting and theory. Word segmentation differs across languages, so the joke may need integrated localization review. | High |
| 47094 | Odwald Bynothas / Ysa / Ohn / Forsaken Plain / Emaire | Preserve the four note sets, the research subject, and the return destination; verify the cluster of proper names. | Korean retains four sets, the Fae war between Ysa and Ohn, and Odwald in Emaire village on the Forsaken Plain. The names follow current draft spellings, not a final glossary decision. | High |
| 47095 | Paragon Barghest / `질긴 생물` | Retain the creature's exceptional toughness and the speaker's request for a moment; verify the creature name. | Korean conveys “incredibly tough” as `질긴`, which can also suggest chewy texture; Japanese/Chinese support the resilient/hardy sense. | Medium |
| 47096 | “no one was fated to defeat me” | Keep the speaker's fear that no destined opponent might exist, rather than suggesting they fear being defeated. | Korean's `내 운명에 ... 없을까 두려웠어` can be read as wondering whether anyone was fated to defeat the speaker; the English, Japanese, and Chinese all establish that paradoxical expectation. Consider clarifying Korean syntax in the integrated pass. | Medium |
| 47100 | Brother Wulf / put him out of his misery | Preserve both the decision to kill Wulf and its protective rationale before he harms the narrator or anyone else. | Korean uses the euphemistic `고통에서 해방시켜야 한다` rather than an explicit “kill,” but the preceding threat and source idiom support the intended lethal decision. Japanese is more explicit. | Medium |

IDs 47052, 47054, 47056, 47059-47060, 47062, 47064,
47067, 47069-47070, 47073-47074, 47076, 47078-47079,
47081-47089, 47091, 47093, 47097-47099 generally retain the English
meaning on this first reading. Proper names, gameplay/UI wording, and
character voice remain subject to integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 47050-47149. It
  flags House of Sorrows, Toothpicks, Honor Brands, Cairns, Vraekor/Aodh,
  the Red Marches, the honorific at 47053, the Nell/ring comparison at
  47055, and the 10/5/3/3, nine/ten, and four-record quantities.
- The literal `FAIL LINE` at 47051 is preserved. The localized `{*1[Active]}`
  marker at 47072 retains its wrapper and translated payload; its duration
  remains 120 seconds.
- ID 47094 retains four record sets. No historical candidate was treated
  as an approved correction.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 47051-47100 once
  and in identical ascending order.
- All four locales preserve matching line-break counts. ID 47072 retains
  one break, the `{*1[...]}` wrapper, and 120 seconds.
- The Chinese source at ID 47067 contains an embedded U+FEFF between parts
  of the name; the other checked locales, including active Korean, do not.
  This source-side hidden-character exception is recorded without changing
  any file.
- The creature counts at 47025 are outside this batch; the four record sets,
  nine/ten word/principle counts, and marker duration described above match.
- Bilingual-name and proper-term conventions remain inconsistent across
  occurrences; this batch authorizes no global normalization.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 47051-47100 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 47101.
