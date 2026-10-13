# Preliminary Language Scan: `default` IDs 47251-47300

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 47251-47300 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 47254 | captors / urgency / `그를 처리하기로 할` | Preserve the urgent need to reach the captive and the threat that the captors will soon decide to deal with him, without inventing what “Once crossed” means. | The English opening is syntactically unclear; Korean omits that fragment but keeps the urgency and threat, consistent with the likely reading in the historical note and supporting references. | Medium |
| 47256 | Font / `샘`; Dustling / Bristletongue | Determine whether Font is the named sacred spring/location and verify the terms for Dustling and Bristletongue. | Korean preserves the message, thanks, and garden location but translates Font generically as `샘`; the historical log asks whether it denotes the named Font. | Medium |
| 47260 | Burn chance / `확률이 50% 증가` | Preserve a temporary fixed 50% chance to burn attackers, rather than increasing an unspecified existing chance by 50%. | English says the effect “gives a 50% chance”; Korean says the chance “increases by 50%.” All references retain the 50 value, but the current Korean can imply a different mechanic. | High |
| 47262 | Ratofer item / plural `them` | Retain that one item was destroyed and therefore cannot be sold, while noting the English source's singular/plural mismatch. | Korean resolves the source's “one ... them” as a single item; Japanese and Chinese likewise clarify that the damaged/destroyed item cannot be sold. | Medium |
| 47265 | Ashmoor / Glowlode Cavern / Esha | Preserve the request to help Esha lead the Ashmoor survivors out of Glowlode Cavern and verify the names. | Korean retains the helper, survivor group, destination, and rescue action; the proper forms remain open. | Medium |
| 47268 | Tywili coast / `티윌리 해안` | Verify the coast's Korean spelling and preserve that the group includes farmers, merchants, veterans, and scholars from along the coast. | Korean retains all four occupations and the contrast with Culn villagers; transliterations vary across the locale references. | Medium |
| 47271 | Alyn Shir / Codex of Destiny / `에린 시어`, `운명의 서` | Verify the character and book forms and preserve the reluctant recommendation to accept her help because the Codex may contain answers. | Korean retains the reluctance, offer, and expected answers; the name and artifact rendering are corpus-wide terminology candidates. | Medium |
| 47273 | Waterhall Down / `워터홀 다운` | Confirm the named location and preserve the repeated “dank” wordplay and speaker's escalating disgust. | Korean keeps the place-name and repetition/contrast of degrees of dampness; historical notes ask for the place's canonical form. | Medium |
| 47275 | Plagueshield / Kaharine / `잘 받아들이고 있대` | Clarify what it means for Kaharine to be “taking well to it” and distinguish Plagueshield from similar-sounding faction/place terms. | Korean preserves the replenishment report and that Kaharine is responding well, but the object/adaptation is not specified. The historical log explicitly leaves the phrase open. | Medium |
| 47277 | selected active ability / `{1}` / `{*1...}` | Preserve the button variable and active-ability marker identities; document the localized order difference. | English, Japanese, and Chinese place `{1}` before the localized `*1` ability marker; Korean puts the marker phrase first and `{1}` after it. Both identities/wrappers are intact, and the order plausibly follows Korean sentence structure. | High |
| 47280 | brother Niahm / `동생 니암` | Preserve that the speaker and Niahm are the only ones remaining in Tala-Rane; verify the younger-sibling detail. | Korean says younger brother, supported by Japanese `弟`, while English only says brother and Chinese uses a general sibling term. Age/relative seniority is not established by English alone. | Medium |
| 47285 | Gameplay Placeholder / `게임플레이 자리표시자` | Confirm whether this is intentional player-facing placeholder text or an internal/test string before any later localization decision. | Korean translates the placeholder literally, matching the English/Japanese treatment; the isolated label does not establish whether it should ship. | Medium |
| 47287 | Critical damage / Sustained Cost / `+20%`, `15% Mana` | Preserve the two-line bonus and values; determine whether the sustained cost is a percentage of maximum Mana. | All four locales retain +20% Critical Hit Damage and 15% Mana on separate lines. Japanese explicitly says maximum Mana; English/Korean do not, and the historical note flags this mechanic question. | High |
| 47293 | `it` / `them` / sacrifice to God Under the Mountain | Preserve both unresolved pronouns and that the item/act is a sacrifice to the named deity. | Korean keeps “it” and “them” unresolved rather than guessing their referents; the capitalized deity title remains a terminology candidate. | Medium |
| 47300 | my lady / `아가씨` | Check the speaker's address and register; determine whether “my lady” denotes a noble, a polite “lady,” or a younger woman. | Korean uses `아가씨`; Chinese says `夫人`, while English/Japanese do not settle the addressee's rank or age. | Medium |

IDs 47251-47253, 47255, 47257-47259, 47261,
47263-47264, 47266-47270, 47272, 47274, 47276,
47278-47279, 47281-47286, 47288-47292, 47294-47299
generally retain the English meaning on this first reading. Names, gameplay
terms, and uncertain referents remain subject to integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 47250-47349. It flags
  Red Idward, Dustling, Font, Bristletongue, Culn/Anela, Waterhall Down,
  Plagueshield/Kaharine, and other recurring names in this range.
- ID 47254's English opening is syntactically unclear; the Korean follows
  the likely urgency/threat reading without supplying a cause for “Once
  crossed.” ID 47287 retains the source lineation and both numeric values;
  maximum Mana remains an open mechanic question.
- IDs 47277's variable order difference and 47285's placeholder label were
  checked directly against all four locales. No historical candidate was
  treated as an approved correction.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 47251-47300 once
  and in identical ascending order.
- All four locales preserve matching line-break counts. ID 47277 retains
  `{1}` and the localized `*1` ability marker, with a Korean order
  difference; ID 47287 retains its one embedded line break.
- The 50% burn chance, +20% critical damage, and 15% Mana values are
  preserved. No hidden whitespace discrepancy was found.
- Name and bilingual-parenthetical conventions remain inconsistent across
  occurrences; this batch authorizes no global normalization.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 47251-47300 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 47301.
