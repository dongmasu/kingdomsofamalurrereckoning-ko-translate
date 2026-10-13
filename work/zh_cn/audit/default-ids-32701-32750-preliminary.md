# Preliminary Language Scan: `default` IDs 32701-32750

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 32701-32750 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 32702 | `판돈을 ... 취소해야` for bets the Gambling Den has to `throw out` | Preserve that bets are voided because of the interruption; retain the speaker's exasperated register. | English says the den must throw out bets after the interruption. Korean's “cancel” is a reasonable rendering; Japanese says forfeit/abandon, while Chinese shifts toward gamblers losing money. | Medium |
| 32705 | `마법이 화려하게 깃든 물건` / Archaic Fae design | Keep the heavy enchantment distinct from the object's proposed origin/design, and retain the Age of Heroes reference. | English says extravagantly enchanted and believed to be of Archaic Fae design from the storied Age of Heroes. Korean preserves the ancient Fae and era but phrases it as an item made by them; Japanese/Chinese likewise suggest origin rather than a precise design attribution. | Medium |
| 32711 | `해협 건너 라시르의 자매도시` / `10년 전쟁` | Preserve the sister-city metaphor, strait crossing, and exact decade; note the English spelling `straight` appears to intend `strait`. | Korean renders the geographical sense as a strait and preserves ten years. English, Korean, and Chinese retain the broken-wall / burned-garden / broken-back sequence; Japanese omits some personification. | High |
| 32713 | Brownie firmly attached to Arhaus's ass | Preserve the creature joke and its crude register without changing attachment into a bite unless context supports that reading. | English says the brownie is firmly attached; Korean keeps it stuck to his backside, Chinese supports the attachment, and Japanese specifically says it bites him. | Medium |
| 32717 | `슬픔의 가문` for `House of Sorrows` | Standardize the faction name while retaining Cadoroc's threat and the objective to bring him to justice. | Korean preserves the confrontation and murder threat. Japanese transliterates the faction and Chinese calls it a family; the English capitalized name and prior audit leave its canonical Korean form open. | Medium |
| 32718 | `임시 방패` for `makeshift buckler` | Check whether to retain the specific small, round-shield type rather than generalizing to a shield. | English, Japanese, and Chinese identify a buckler/round shield made from a shipwreck porthole. Korean preserves the scrap, steel rim, glass, and viewing function but calls it only a makeshift shield. | High |
| 32720 | `수도원` for `mission` | Determine whether `mission` names a religious building, institution, or settlement; do not treat the Korean choice as settled from this row alone. | Japanese uses a monastery term, Chinese a preaching/mission station, and Korean “monastery.” English only says supplies around the mission. | Medium |
| 32721 | `프리모스의 숙소` for `Primos' quarters` | Keep the destination name and defer whether `quarters` means a residence, district, or lodging area. | Korean reads it as lodging. Japanese reads a Primos district, while Chinese says the chief's residence; the English possessive plural does not settle the referent. | High |
| 32722 | `CARTESIANCOORDWIN` | Preserve the opaque identifier exactly unless its UI/debug function is established. | Korean matches English and Japanese byte-for-byte; Chinese transliterates the string. No interpretation is supported by the row. | High |
| 32731 | `크로우` for `the Crows` | Check whether `Crows` is a named team/faction and preserve its plural/group sense. | English and Japanese name the Crows as a plural group; Chinese adds a team marker. Korean transliterates it without an explicit plural/team cue. The gladiator and gambling context suggests a competition, but the row alone does not establish the official name. | Medium |
| 32734 | `타리의 ... 감옥` / `시온` for `Tari's cage` / `the Scion` | The prison-cell sense is supported; separately standardize the lore title `Scion` and Tari Holstig's name. | All locales place Tari in confinement before execution. Korean's `감옥` correctly resolves `cage` as a prison, while the capitalized title `Scion` is rendered phonetically and remains a glossary question. | Medium |
| 32740 | `패스팅(fasting)` for the Dverga tunnel network called `fastings` | Preserve the named network and plural source form; verify whether the established Korean should transliterate the term or describe the passages. | English capitalizes/uses `fastings` as a Dverga-specific term; Chinese transliterates it and Japanese describes underground passages. Korean transliterates singular `fasting` in parentheses and elsewhere calls them tunnels. Both paragraphs and their single blank-line separator are preserved. | High |
| 32741 | `일손이 필요하겠어` for the camp needing `services` | Keep the uncertainty between facilities/services and labor or a service provider. | Korean reads as manpower. English and Chinese can mean camp services/facilities, while Japanese reads as the speaker's own skills being needed. The historical question remains unresolved. | High |
| 32746 | `미친 노파들, 마녀들` for `Mad Crones. Witches.` | Preserve the dismissive warning and determine whether `Mad Crones` is a creature/group label or ordinary insult. | Korean conveys the insulting sense; Japanese also reads it as an old-woman insult and Chinese as mad old women. English capitalization leaves the category uncertain. | Medium |
| 32747 | `보그스턴치(Bogstaunch)` | Carry forward the open question whether Bogstaunch is a named medicine/product and standardize its Korean form. | Korean transliterates it. Prior audits flag the item/reagent identity; Chinese has interpreted the word as a hemostatic agent, while English and Japanese preserve it as a name. | High |
| 32749 | `그녀를 없애려면 풀어 줘야 해` for needing to release a formidable captive in order to destroy her | Preserve the apparent paradox and sequence without “correcting” it absent quest context. | English, Japanese, Chinese, and Korean all say she is trapped, formidable, and must be released to be defeated/destroyed. Historical notes explicitly flag this context-dependent logic. | High |
| 32750 | `일병` for `Private Ilver` | Verify the armed-forces rank mapping and preserve the name independently of the rank decision. | Korean localizes `Private` as `일병`; Japanese and Chinese use generic private-soldier ranks. English does not specify a Korean-equivalent service grade. | Medium |

IDs 32701, 32703-32704, 32706-32710, 32712, 32714-32716, 32719, 32723-32730,
32732-32733, 32735-32739, 32742-32745, and 32748 generally retain the
English meaning on this first reading. Proper-name spellings, ranks, and
lore terminology remain integrated-pass candidates; no other distinct
high-confidence wording issue was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 32700-32799 flags Livrarium,
  the Castellan, House of Sorrows, `mission`, Primos' quarters, Cape Solace,
  Fahrlangi, Dverga `fastings`, camp `services`, and the paradox at ID 32749.
  These were checked against all four locale rows and active Korean.
- ID 32734's `cage` is translated as a prison and is supported by the
  execution context; the open item is the canonical Korean form of `Scion`.
- ID 32740's two-paragraph history preserves its source layout. Its
  `fastings` terminology remains unresolved rather than treated as a
  confirmed translation error.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for the integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 32701-32750 once
  and in identical order.
- Embedded line-break counts match across all four locales. ID 32740 has
  two paragraphs separated by one blank line in each locale.
- Detected runtime-marker signatures match across all four locale rows.
- No numeric-value discrepancy was found in the inspected rows.
- Active Korean CSV hashes remain at their recorded checkpoint values.
- No CSV text or source file was edited.

## Batch Status

IDs 32701-32750 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 32751.
