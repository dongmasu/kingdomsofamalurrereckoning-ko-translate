# Preliminary Language Scan: `default` IDs 43701-43750

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 43701-43750 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 43701 | Lunala, Goddess of the Moon / `루날라`, `달의 여신` | Standardize the goddess's name and retain the source's account that traces of her tears fell from heaven to Amalur. | Korean follows English/Japanese closely; Chinese changes the tears' direction to spreading from heaven to Amalur. Localized spellings vary. | Medium |
| 43702 | Bareth; Cryamor; Alabastra; enchantment / `바레스`; `크리아모어`; `알라바스트라`; `마법부여` | Standardize the character/place names and retain that Cryamor coveted Bareth's knowledge of enchanting beasts. | Korean preserves the target, leader, and knowledge; Japanese/Chinese use differing phonetic forms. | Medium |
| 43704 | murghan / `머르간` | Confirm the creature's official Korean term and preserve the cause of the officer's return home. | English/Japanese/Chinese refer to a murghan's trident injury; Korean keeps the creature name and injury. | Medium |
| 43705 | Walen offered as a voluntary recruit / `자원병으로 입대` | Resolve whether this is truly voluntary recruitment or an imposed/limited military service; retain the mother's concern about the gold allowance. | English phrasing is awkward, Chinese says he enlisted voluntarily, and Japanese implies he was made to serve. Historical notes leave enlistment circumstances open. | High |
| 43706 | `Equip as {1} 1` / `{1}(으)로 장착: 1` | Keep as a fragmentary UI/value label until its screen context clarifies what the variable and trailing `1` denote. | All locales preserve a short incomplete label; historical notes explicitly flag it as fragmentary. Korean retains `{1}`. | High |
| 43710 | harpy / `하피` | Confirm whether “harpy” is a literal creature reference or an insult for the woman being pointed out. | English/Chinese name a harpy; Japanese calls her a noisy woman. Korean follows the literal English creature term. | Medium |
| 43716 | Winter Kingdom / `겨울 왕국` | Standardize the realm/faction name and preserve the speaker's contrast between their people's death and mortals' death. | Korean retains the contrast and the retrospective correction. Japanese expands this to the Winter Fae Kingdom; Chinese uses Winter Kingdom. | Medium |
| 43725 | the Watch; Orbocant / `감시대`; `오르보칸트` | Confirm the Watch's official Korean faction name and preserve its two stated duties: prison security and public peace. | English capitalizes Watch as a group; Korean uses a generic-sounding “watch/security unit.” The historical glossary question covers the faction. | Medium |
| 43727 | health/mana potion tutorial / `{1}`, `{2}`, `{*1}` | Preserve both button variables and correctly associate each with its respective health or mana potion. | All four locales retain the two button variables and two potion style markers in order. Korean preserves the health/mana distinction. | High |
| 43729 | Castellan; Gnomish convoy / `성주`; `노움 수송대` | Standardize the office/title and Gnomish convoy terminology. | English describes the Castellan personally slaying a Barghest while protecting a convoy; Korean preserves the event, though `성주` is a contextual title choice. | Medium |
| 43733 | new arena; construction “should be finished by now” / `새로 짓는 경기장`; `공사가 끝났을 거야` | Align the arena phrase's aspect with the expected completed construction. | The Korean first describes the arena as currently being built, then says construction should already be finished. The source expects completion by now. | Medium |
| 43735 | second-floor Gallery / `2층 회랑` | Confirm whether Gallery is an art gallery/named venue rather than a corridor and standardize the place term. | English capitalizes `Gallery`; Japanese says museum and Chinese says art gallery, while Korean says corridor. Historical notes explicitly flag the term. | High |
| 43738 | Augur / `오거`; “a prophet in his own mind” | Preserve the proper name while considering whether its English wordplay with “prophet” can be reflected in Korean. | English names the leader Augur, then calls him a self-proclaimed prophet. Korean retains the skeptical meaning but loses the name/prophet wordplay. | Medium |
| 43739 | “dove” / `여보`; Hierophant / `대사제` | Preserve `dove` as an affectionate address and standardize Hierophant's title. | Korean naturally uses an endearment; Chinese instead reads `dove` as “peace envoy,” a likely mistranslation. The English says the Hierophant sees/knows all except the addressee. | Medium |
| 43741 | Mitharan survivors / `미사루인 생존자` | Confirm the canonical people-name and preserve the speaker's tentative inference that none were found in the library. | Korean retains the inference and disappointment; historical notes leave the identity of Mitharan survivors open. | Medium |
| 43743 | The Forum / `포럼` | Determine whether this is a civic council, a public square, or a named institution; choose the canonical Korean form. | Japanese says council, Chinese says square, and Korean transliterates the name. Historical notes explicitly request context. | High |
| 43747 | Cipher; Beckoned / `사이퍼`; `부름받은 자` | Standardize the formal/lore address for Beckoned and retain the intentionally archaic register of the centuries-old speaker. | Korean uses elevated archaic endings, but renders Beckoned differently from earlier “chosen one” forms. Japanese and Chinese also vary in their title wording. | Medium |

IDs 43703, 43707-43709, 43711-43715, 43717-43724, 43726, 43728,
43730-43732, 43734, 43736-43737, 43740, 43742, 43744-43746,
43748-43750 generally retain the English meaning on this first reading.
Names, faction/UI terminology, register, and recurring lore terms remain
subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical sections covering 43701-43708 and 43725-43747
  were checked. They flag Lunala/Bareth/Cryamor/Alabastra, murghan, Walen's
  recruitment, the fragmentary UI label, Augur, the Hierophant's “dove”
  address, Mitharan survivors, the Forum, Cipher/Beckoned, and the
  second-floor Gallery.
- The historical notes do not resolve the Gallery type, Forum referent, or
  nature of Walen's recruitment; these remain open questions.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 43701-43750 once
  and in identical ascending order; each default CSV has 65,135 records.
- Embedded line-break counts match across all four locales. No hidden
  formatting characters were found in this range.
- Runtime variable/style-marker IDs and counts match. ID 43706 retains
  `{1}`; ID 43727 retains `{1}`, `{2}`, and both `{*1}` potion labels in
  source order.
- No numeric value discrepancy was found. No translation CSV or immutable
  source file was edited.

## Batch Status

IDs 43701-43750 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 43751.
