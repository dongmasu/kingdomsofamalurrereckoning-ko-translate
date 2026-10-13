# Preliminary Language Scan: `default` IDs 35501-35550

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 35501-35550 inclusive.
- Compared English meaning, Japanese register, Chinese supporting
  evidence, active Korean, and source-keyed historical questions.
- Read-only preliminary candidates, not independent review decisions.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 35501 | `고대인 델프릭` for `Ancient Delfric` | Check whether Ancient is a Warsworn rank and not a claim that Delfric is an ancient being. | Japanese interprets it as a general/officer and Chinese as an elder. English capitalizes Ancient before a name. The Korean literal `고대인` suggests a species/age; prior Warsworn rank discussions also flag Ancient. | High |
| 35503 | `웨일런의 보조인`, `그림자 장미` | Confirm `second` as a duel role and Rose-of-Shadows as a named item/coating rather than a generic flower. | English requires putting Rose-of-Shadows on Daltan's sword-point after informing him. Japanese reads a dueling attendant and a shadow-rose coating; Korean preserves the action. Chinese mistakenly implies that Walen does not understand the purpose. | Medium |
| 35506-35507 | `리리아여, 그가 무슨 짓을 한 거야?`, Oleander's fame joke | Keep English question and Oleander's self-correction while verifying prayer/register. | Japanese 35506 asks Lyria to forgive him rather than asking what he did; Korean/Chinese follow English. The repeated self-naming at 35507 supports an intentionally erratic voice. | Low |
| 35508, 35512 | gnome `대의`, `하우스 오브 프라이드` | Confirm the political `greater good` and named House of Pride while retaining the speaker's personal risk. | English says any one gnome might ruin the greater good of `my people`; Korean includes both the risk and the collective interest. Dren is called a freak by the source. | Medium |
| 35513 | `{*1기술 점수}`, `{*1기술}`, `{LINE_SPACE}`, `{1}`, `{2}` | Record the localized emphasis/placeholder ordering difference; confirm UI skill-point terms without changing the markup. | All four locales have two `{*1...}` spans and the same control variables. English places the second emphasized `skills` before `{1}`; Korean, Japanese and Chinese place it after `{1}`. The marker identity/count is preserved but the cross-locale token order is not identical. | Medium |
| 35515-35516 | `헨지`, `나로스의 송곳니`, `예비 무기고` | Standardize Henge/Teeth of Naros and confirm Reserve Armory as a restricted named location. | English promises access, while Korean `보여 주고 싶군` could sound like a tour rather than access; Japanese/Chinese also emphasize entry/viewing. | Medium |
| 35523, 35530-35533 | Witch Knights, Crown of the Sun, Keepers, Summer Faelands, Warsworn | Check formal titles/places; retain two officers plus Gask, and the three existing Summer Faelands keeps. | Korean preserves the objective sequencing and counts. The source-keyed historical question specifically flags the ranks and local geography. | Medium |
| 35525 | `전투 격노`, stacking damage | Preserve 10% for first kill, 20% for second consecutive kill, ten-second reset on each kill, and 30% Mana sustained cost; check whether `+첫 번째` is intended UI punctuation. | All four locales retain two line breaks and the key values. Japanese specifies *maximum* Mana for 30%; English and Korean do not, so the exact UI cost basis is a later mechanics check. | Medium |
| 35536, 35540 | `마나: {1}/{*2{2}}`; stealth, Daggers and Faeblades | Preserve the nested numeric/ability wrappers and standardize gameplay labels. | All four files retain the nested `{*2{2}}` and three `{*1...}` wrappers at 35540; Korean keeps the visible labels localized. | Low |
| 35537-35538 | `머드홀드 파스팅`, `위스퍼링 위치` | Check Mudhold Fasting and Whispering Witch as named places/persons and `quarry` as the survey's target. | English `quarry` denotes the pirate being sought, not a stone quarry; Korean `사냥감` follows that reading. | Medium |
| 35543, 35545 | `닉사로스`, `아메테어` | Verify names, antecedents, and the speaker's horror at the fate of the person at Nyxaros; leave trailing fragment unfinished. | Korean preserves the unfinished ending at 35543; English/Chinese indicate a fate he did not deserve, while Japanese questions his qualification. | Medium |
| 35549-35550 | card `로우`/`하이`; `예언자` | Check the card higher/lower mechanic and Prophet as a title/group, retaining the four-card losing outcome and Telogrus's recruitment aim. | English calls the four higher than the guessed lower card; Korean explicitly says the player lost. Chinese reads `into the fold` as faction recruitment; Korean conveys the same. | Medium |

IDs 35502, 35504-35505, 35509-35511, 35514, 35517-35522,
35524, 35526-35529, 35534-35535, 35539, 35541-35542, 35544,
35546-35548 generally retain English meaning on this first reading.
The translation joke, proper names, and lore remain integrated-pass
questions.

## Historical Audit Reconciliation

- The source-keyed historical 35400-35599 entry flags Ancient Delfric,
  Alarane, dueling `second`, Rose-of-Shadows, the Lyria address,
  Oleander's self-reference, greater good, Dren, skill markers, Henge,
  Reserve Armory, Ost, Dead Kel, Witch Knight, sustained damage, Tyr
  Magnus, Crown of the Sun, Wild Fae, Mudhold Fasting, Whispering Witch,
  stealth labels, Nyxaros, Ametair and higher/lower. These were checked
  against the active Korean and three reference locales.
- Historical notes remain issue inventory, not permission to edit the CSV.

## Other Checks

- All four locales have IDs 35501-35550 once, in identical order.
  ID 35525 retains its two line breaks in every locale.
- The runtime values and identifiers `$NUM0`, `{1}`, `{2}`, `{LINE_SPACE}`,
  `{*1...}`, and nested `{*2{2}}` retain their identities and counts.
  Structural exception: at 35513 English orders `{*1skills}` before
  `{1}`, but Korean/Japanese/Chinese put `{1}` before `{*1skills}`.
  No assertion of exact marker-sequence identity is made for that row.
- Active Korean `default` CSV SHA-256 remains
  `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 35501-35550 received one preliminary reading. Findings remain
open candidates. Continue at `default` ID 35551.
