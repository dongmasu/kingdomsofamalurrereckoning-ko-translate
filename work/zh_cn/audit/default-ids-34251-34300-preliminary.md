# Preliminary Language Scan: `default` IDs 34251-34300

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 34251-34300 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 34251 | `그레이브 쓰레시의 둥지를 약화하는 데 성공했다` | Preserve that the nest has been weakened, the beast remains to be defeated, and it waits in Gorguath's main chamber; standardize Grave Thresh and Gorguath. | Korean retains the quest sequence and location. Japanese describes harming the nest; Chinese says destroying it, while English says weakening it. Korean follows English. | Low |
| 34252 | `운명에 귀의한 자의 표식` / `개종자마다 생기는 흉터` | Verify the source phrase `sign of fateful` (possibly a source typo or clipped term) and preserve that a scar marks each convert; clarify the conversion/faction context. | Korean renders a sign of joining/following fate. Japanese calls it a mark of fate and Chinese a “fate mark”; none resolves the unusual English wording. Historical notes flag the scar/conversion sign. | Medium |
| 34255 | `네 에너지는 알라바스트라까지 거슬러 올라가` | Preserve the connection between the speaker and eastern power and the claim that the player's energy reaches back to Alabastra; standardize the name. | Korean keeps both claims. Japanese says the energy comes from Alabastra, while Chinese says it can be traced there; English's `reaches back` is ambiguous between origin and extent. | Medium |
| 34257 | `$TRSQ01.bribe_value$ 골드` | Preserve the exact bribe-value variable and its surrounding currency label; verify runtime rendering separately. | Korean, English, Japanese, and Chinese retain `$TRSQ01.bribe_value$` once. The historical audit explicitly calls for checking the variable's value/representation. | Low |
| 34262 | `대사제의 성소` for `Hierophant Shrine` | Standardize the named shrine and the title `Hierophant`; retain the instruction to pray and receive the shrine's blessed wisdom. | Korean translates the title as “high priest.” Japanese refers to the Hierophant's altar and Chinese to the high-priest temple. The English capitalization suggests a named location/title; historical notes flag the blessing. | Medium |
| 34268 | `필멸자처럼 성질이 급하다고 해 두지` for `a mortal's temper` | Preserve the speaker's warning to leave them to their task and the self-deprecating/ironic mortal-temper comparison. | Korean retains both; Japanese explicitly says short-tempered like a mortal. No independent meaning discrepancy is evident. | Low |
| 34272 | `그것 때문에 광부들이 반쯤 미쳐 버렸어` | Keep the cause of the miners' near-madness unidentified unless context supplies it; preserve that the speaker intended only to frighten them out of the region to reclaim their life. | Korean follows the source's unnamed “thing” and retains the motive. Japanese/Chinese likewise leave the creature/object implicit. | Medium |
| 34276 | `펄쩍 뛰어 달아나더니…… 아래로` for `ran ‒ Down` | Preserve the source's apparent `ran / Down` wordplay or split phrase without guessing whether `Down` is a name, direction, or separate beat. | Korean attempts a jump/fall pun, while Japanese says he jumped and then fell and Chinese preserves a broken `ran—Down` phrase. The historical audit explicitly marks this source fragment as unresolved. | High |
| 34279 | `이반` / `모든 속박 없는 자들` for Ivan / Unbound | Standardize Ivan and the faction/group `Unbound`; retain the three-part plea: for the speaker, for Ivan, and for all Unbound. | Korean preserves the repeated appeal and renders Unbound semantically. Japanese uses a term for the unbound and Chinese “free ones”; faction terminology needs corpus-wide review. | Medium |
| 34284 | `티린의 양 떼` for `Tirin's flock` | Determine whether `flock` is a religious/community metaphor, a political group, or both; preserve the speaker's rejection of comparison with refugees and Almain rural people. | Korean translates the flock metaphor literally. Japanese says a herd belonging to Tirin and Chinese calls the people Tirin's believers. The historical audit explicitly flags the political meaning. | High |
| 34291 | `비탄의 가문` for `Sorrows` / `비탄의 왕의 빈터` for `the Hollow of the Weeping King` | Verify whether Sorrows is the House/faction/place name and whether `Hollow` names a specific place; preserve that the key is in Sinsear and is needed to reach Sorrows. | Korean makes `Sorrows` a family and `Hollow` an open field/ruin-like place. Japanese uses a “power of lament” and a cave, while Chinese substitutes different lore wording. Historical notes explicitly leave both terms open. | High |
| 34295 | `갤로우스 엔드` for `Gallows End` | Standardize this recurring place name and retain the contrast between Alder's daughter identity and how most locals know the speaker. | Korean transliterates the place name. Its other active renderings vary substantially, and the historical audit identifies Gallows End as a recurring consistency issue. | Medium |
| 34296 | `교차의 장` for `the Crossing` | Confirm whether `Crossing` is a named realm/threshold rather than a generic crossing; retain that it is outside mortal affairs and the addressee is the first to reach it. | Korean treats it as a place but uses a literal “crossing field/space.” Japanese calls it an intersection of power and Chinese a pass/gateway. The historical audit flags Crossing terminology. | High |
| 34297 | `단명자` for `quicklings` | Determine whether Quicklings is a named Fae people/species rather than a generic label for short-lived beings; standardize Alyn Shir's name and preserve the contrast between mystery and simplicity. | Korean interprets quicklings as short-lived people. Japanese also uses “short-lived ones,” while Chinese transliterates Quickling. English capitalization is absent, so lore context is needed. The historical audit explicitly flags Quickling. | High |
| 34299 | `슈콜리아 아르카나 입문자` for `Scholia Arcana Initiate` | Standardize the faction and rank title, preserving that this is a named membership rank rather than generic initiation. | Korean transliterates the institution and translates the rank; capitalization supports a formal title. The historical audit flags Scholia Arcana terminology. | Medium |

IDs 34253-34254, 34256, 34258-34261, 34263-34267, 34269-34271,
34273-34275, 34277-34278, 34280-34283, 34285-34290, 34292-34294, and
34298, 34300 generally retain the English meaning on this first reading.
Proper names, lore, voice, and display conventions remain integrated-pass
candidates; no additional distinct wording issue was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry explicitly flags the conversion scar
  (34252), Alabastra energy (34255), the bribe variable (34257), Hierophant
  Shrine (34262), rescued man's strength (34271), miner madness (34272),
  `ran ‒ Down` (34276), Ivan/Unbound (34279), shared fire/mind (34281),
  Tirin's flock (34284), Sorrows/Sinsear (34291), Crossing (34296),
  Quickling/Alyn Shir (34297), and Scholia Arcana (34299). These were
  checked against active Korean and all locale references.
- `$TRSQ01.bribe_value$` at ID 34257 is preserved exactly. No other runtime
  marker occurs in this batch.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 34251-34300 once
  and in identical order.
- Embedded line-break counts match across all four locales; this range has
  no multiline text.
- Runtime marker identities/order match, including the bribe variable.
- Numeric gameplay values are preserved where present; no value discrepancy
  was detected.
- Active Korean CSV hashes remain at their recorded checkpoint values.
- No CSV text or source file was edited.

## Batch Status

IDs 34251-34300 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 34301.
