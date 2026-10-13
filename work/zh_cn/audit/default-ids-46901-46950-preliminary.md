# Preliminary Language Scan: `default` IDs 46901-46950

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 46901-46950 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 46903 | Hexes / `헥스 게임` | Confirm whether Hexes is the named game and preserve the casual invitation asking who wants to play. | Korean retains the game name and invitation; Japanese omits the explicit “who's game?” construction and Chinese identifies it as a game of Hexes. | Medium |
| 46904 | them / compassion / `배려` | Preserve the speaker's realization that the other person genuinely cares, agreement to do their part, and thanks for compassion. | Korean retains all three beats. `배려` is a natural but slightly softer rendering of compassion; scene tone remains relevant. | Medium |
| 46906 | sealed door / `봉인된 것 같다` | Check the added uncertainty and keep the explicit blocked-passage result. | English states that Anokatos's magic has sealed the temple doors; Korean says they “seem” sealed. Japanese also states they are sealed and no one appears able to pass, while the Korean's next sentence does retain that the door denies passage. | High |
| 46907 | Loan Amount / Current Gold | Preserve `{1}` for the loan amount and `{2}` for current gold, including their order and adjacency. | English, Japanese, Chinese, and Korean all retain `{1}` then `{2}` with the two labels; no variable identity or order difference was found. | High |
| 46909 | Tyr Magnus / `티르 매그너스` | Verify the named journal owner and retain that this is a thin, leatherbound volume identified as one volume of the journal. | Korean preserves the physical description and journal-volume relation; the name's Korean spelling remains provisional. | Medium |
| 46910 | Luca Soren / Thresh / Arhaus Vorm / Searstalk / Sidhe | Preserve that Luca's injuries are serious, her rare venom reaction requires a rare Searstalk found only within the Sidhe, and the narrator agreed to find one; verify all lore forms. | Korean retains the injury, unusual reaction, cure requirement, location restriction, and undertaking. Historical notes already flag the creature, plant, and Sidhe terminology. | High |
| 46913 | The Humbled / `굴복한 자들` | Determine whether this is a named troupe, work, or title, and preserve the actor's claim to a broad range and need for a chance. | Korean retains the tragic-actor context and opportunity claim; English capitalization and locale differences leave the referent unresolved. | Medium |
| 46915 | The Knave / `건달` | Resolve whether Knave is a proper title/name or an ordinary “rogue/rascal” before choosing a generic Korean noun. | Korean reads it as a common noun; the source-keyed historical log explicitly asks for the intended referent. | Medium |
| 46916 | Hierophant / `대사제` | Verify the title while preserving the camp's rigid military order and the speaker's affectionate blessing. | Korean retains both the army comparison and march-to-the-tune image. The female referent is clear from `her`, but the title's canonical form remains open. | Medium |
| 46918 | Muse address / song-and-dance praise | Preserve the poetic praise and the speaker's wish to chronicle the Muse's movements. | Korean retains the song, dance, dream of recording, and rhetorical praise; cadence and the vocative remain candidates for integrated voice review. | Medium |
| 46920 | D2C Digital Portfolio Manager | Confirm whether this development/credit label should remain English or be translated, and what D2C denotes here. | Korean translates the role and preserves the acronym; no locale or historical evidence establishes the project's preferred treatment. | Medium |
| 46922 | dustlings / `더스트링` | Verify whether dustlings is a race/name or a descriptive term for mortals, and keep the speaker's dismissive certainty that they fear the garden's inhabitants. | Korean transliterates the group name and preserves the causal comparison to the elements; Japanese calls them “dust-born” and Chinese interprets them as mortals. | Medium |
| 46930 | food / chickens / `닭 사료` | Confirm from quest context whether the carried food is specifically chicken feed rather than generic food. | Korean makes the implied recipient explicit. English only says the player has “the food” and then mentions chickens; Chinese also spells out chicken feed, but the English row alone does not. | Medium |
| 46934 | `FAIL LINE` | Retain the literal test string unless a separate UI/localization decision authorizes changing it. | Korean matches the English and Japanese literal string; Chinese instead localizes it as failed dialogue. Historical notes identify it as a test string. | High |
| 46936 | Beckoned / `초대받은 자` | Preserve that many reasons brought the addressee here and that Anokatos's death is only one part of the whole. | Korean keeps the direct address, multiple reasons, and subordinate role of the death; the title's canonical Korean form remains open. | Medium |
| 46938 | Faelands / `패란즈` | Confirm whether to retain this phonetic form or use an established Korean rendering of the realm name. | Korean transliterates the term, while Chinese uses a literal realm/continent form and Japanese a phonetic form; historical terminology review remains necessary. | Medium |
| 46939 | Titles here. / `여기에 칭호가 표시됩니다.` | Confirm whether the expanded Korean UI instruction is intended for this placeholder-like test string. | Korean makes the implied display action explicit; Japanese similarly uses a locative fragment, while the historical log marks this as a test string. | Medium |
| 46941 | Courdan / Templars / `코르단`, `성전기사단` | Verify the two proper terms and preserve the speaker's denial, concession, and claimed institutional necessity for Courdan's punishment. | Korean keeps the parenthetical reversal (“it is not true”) and the Templars' continued function; spellings and faction title are recurring glossary candidates. | Medium |
| 46944 | The Ariad / `아리아드` | Determine whether this is a group, order, or place and standardize bilingual-name treatment accordingly. | Korean retains the English name parenthetically; Japanese adds a group marker, while Chinese transliterates the name without resolving its entity type. | Medium |
| 46948 | Nomeron / Master of the Font / `폰트의 주인` | Verify the title and preserve the Font as the source of all Summer Court magic and the observed contrast between peak flow and current dryness. | Korean retains both claims and renders the Font's drying condition through the spring-water image; the official term and title construction remain open. | Medium |

IDs 46901-46902, 46905, 46908, 46911-46912, 46914,
46917, 46919, 46921, 46923-46929, 46931-46933, 46935,
46937, 46940, 46942-46943, 46945-46947, and 46949 generally
retain the English meaning on this first reading. Proper names, faction
terms, and test/UI labels remain subject to integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 46850-46949. It flags
  Pteryx Vanes, Wreath of Absolution, House of Pride, Concourse,
  Fateweaver/Warsworn, The Hanged Men, Oratory/Summer Court canon,
  The Humbled, The Knave, dustlings, and other names in this range.
- The test strings at 46934 and 46939 were explicitly checked. Korean
  preserves `FAIL LINE` at 46934 and expands the “Titles here” placeholder
  at 46939; the latter remains a candidate for context review.
- ID 46907's `{1}`/`{2}` variable sequence is intact. The adjacent
  historical gameplay-value checks concern later IDs and were not
  attributed to this batch.
- No historical candidate was treated as an approved correction.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 46901-46950 once
  and in identical ascending order.
- All four locales preserve matching line-break counts. ID 46907 retains
  `{1}` before `{2}`; no other runtime marker was found.
- No material numeric-value discrepancy was found in this batch.
- Bilingual-name and transliteration conventions remain inconsistent across
  occurrences; no global normalization is authorized by this batch.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 46901-46950 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 46951.
