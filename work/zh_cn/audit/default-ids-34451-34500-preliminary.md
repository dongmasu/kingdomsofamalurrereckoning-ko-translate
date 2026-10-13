# Preliminary Language Scan: `default` IDs 34451-34500

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 34451-34500 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 34451 | `#NAMED_ICON_GRAY_PS3_CROSS#` | Preserve this exact named button/icon marker; confirm platform-specific display in the later UI pass. | The token is byte-for-byte identical in all four locales. No surrounding text or token-order issue is present. | Low |
| 34452 | five-line war poem | Preserve all five lines and the causal sequence: war machines roar, battle is waged in Gadflow's name, old peace is abandoned, and neighbors are murdered in anger; review cadence without converting it to prose. | Korean keeps five lines and each source event. The English has end-rhyme/line enjambment; Korean prioritizes meaning and does not reproduce the rhyme. All four locales have four newline characters. The historical log explicitly flags the war poem. | High |
| 34455 | Ratofer / Ayten children taken to war | Preserve that Ratofer took the town's children to war, returned alone, and neither Ayten nor Ratofer recovered; standardize Ratofer/Ayten. | Korean retains all three consequences. Japanese compresses the aftermath to “both became strange,” and Chinese says Ayten never recovered; Korean follows English. Historical notes flag the children's fate. | Medium |
| 34456 | `도망칠 시간은 다섯 초뿐이야` for `You have five seconds to flee` | Preserve the five-second countdown and urgency; retain it as words or numerals according to the UI convention. | Korean spells out five seconds; Japanese uses `5秒`, Chinese spells out five. The value is exact and the preceding regret is retained. | Low |
| 34457 | `정말 다행이야. 아카라께 감사드려` for `truly blessed ... Akara be praised` | Preserve the religious/blessing register and the fact that the man cannot approach the village; clarify his identity only from context. | Korean renders “blessed” as “fortunate,” then retains praise to Akara. Japanese/Chinese also state the village's safety and thank/praise Akara. The referent of `he` remains unresolved. | Medium |
| 34461 | `프라이드 가문의 ... 예배당` for `House of Pride` / `chantry` | Standardize House of Pride and Chantry; preserve the objective sequence: Witch Knight defeated, central chantry exposed, destroy it to free the House from Tuatha influence. | Korean retains all three steps but calls House a family and Chantry a chapel. Japanese/Chinese also use chapel/temple readings. The historical log flags the House of Pride chantry. | Medium |
| 34462 | `주군` / `발라드 가문의 정상에 오르셨으니` | Preserve the courteous address, the omen aside, and the idea that the addressee has ascended the House of Ballads; standardize the institution and Gardens of Ysa. | Korean follows the source's liege and omen, and interprets “ascended the House” as reaching its summit/status. Japanese says took the throne and Chinese says reached a high position, leaving the exact advancement unclear. | Medium |
| 34463 | `시분의 심장` for `Heart of Sibun` | Confirm Sibun's identity and whether this is a named place/relic; standardize the term without translating “heart” into a generic organ if it is a title. | Korean transliterates Sibun and translates Heart. Japanese/Chinese use different phonetic forms; the historical audit flags Crossing/Sibun vocabulary. | Medium |
| 34464 | `기도와 헌신, 믿음` as the most valuable offerings | Preserve the list and the claim that the speaker offers everything in their heart; determine whether “offerings” is a named religious practice here. | Korean retains all three items and the value claim. English uses capitalized `Prayers. Devotion. Faith.`; Japanese/Chinese similarly treat these as spiritual gifts. | Low |
| 34469 | `운명에서 자유로운 그대` / `태피스트리를 무너뜨리고` | Preserve the archaic prophetic address, the fateless addressee, and the command to cast down the Tapestry to complete the speaker's works; standardize the Fate/Tapestry lore terms. | Korean keeps the elevated second-person form and both actions. Japanese/Chinese likewise preserve the prophecy. The source's `cast down` is rendered as bringing down/collapsing the tapestry. | Medium |
| 34471 | `장궁 공격을 길게 눌렀다가 놓으면` | Preserve the hold-then-release input sequence, Longbow identity, increased damage, and application of status effects; standardize Longbow/UI wording. | Korean retains both input steps and the benefit. Japanese specifies the attack button; Chinese also says hold and release. No mechanics value is supplied in this row. | Low |
| 34473 | four-paragraph Adessa / Arcadium / Basilica Gnostra account | Preserve the four paragraphs, the contrast with tawdry/dirty/bustling markets, the gnome crafts, Arcadium's purpose, and the transition to Basilica Gnostra; standardize institutional names. | Korean retains the four-paragraph progression and named places. English has source grammar errors (“these building were”), which Korean does not reproduce as errors. Japanese/Chinese diverge on Basilica Gnostra as a proper name versus church. All locales contain six newline characters and four paragraphs. | High |
| 34474 | `Hospitalis Quarters` residents “know nothing but trouble” | Preserve the speaker's dismissive prejudice and immediate “no offense” retreat without strengthening it; standardize Hospitalis Quarters. | Korean retains the insult and backtracking. The historical log flags Hospitalis prejudice; it is a character voice, not a neutral description. | Medium |
| 34477 | donated `물약 제조대` / no further house work | Confirm potion bench as an in-game crafting station and preserve that the donation is for private use but no more house upgrades/work are available. | Korean follows English. Japanese says the bench can be used freely and upgrades stop there; Chinese likewise limits further modification. Historical notes call out the potion bench. | Medium |
| 34480 | `대금 전액을 선불로` / daggers' recovery location | Preserve the revised deal: full upfront payment first, then the seller will reveal where the daggers can be recovered; standardize daggers/knife. | Korean retains the payment condition and order. Japanese uses “knives,” English uses “daggers,” and Chinese “daggers”; Korean's `단검` is supported. | Low |
| 34488 | `에이스야 ... 꽝` for card `ace` | Preserve the card-game ace and the speaker's no-luck response; keep the interrupted sentence/dash if the dialogue timing requires it. | Korean names the ace but paraphrases “no luck” as `꽝`. Japanese/Chinese also identify the ace and disappointment. The historical log explicitly notes a card-game ace. | Medium |
| 34489 | account privilege / `master account` | Preserve the access-denied reason and sign-in instruction; determine whether `master account` is a named account tier or generic administrator account. | Korean translates it as `마스터 계정`. Japanese says master account and Chinese says main account; the exact product/UI meaning is context-dependent. | Medium |
| 34490 | `봉헌식` / `계승자(Scion)` | Standardize `Offering` as a named rite and Scion as the resulting title/role; preserve the sequence that Akara blesses the chosen one, who then becomes Scion. | Korean preserves the sequence and adds the English term for traceability. English capitalization, Japanese's ritual reading, and Chinese's priest reading show the Scion role remains a material terminology question. | High |
| 34491 | Tuatha `landfall` on the Plains of Erathell | Preserve that this place is where the Tuatha landed, not where they won a battle; retain the present ruin/ghost description and standardize the location. | Korean explicitly says `상륙`, matching English. Japanese incorrectly describes a decisive victory, while Chinese also says they landed. The historical log calls out this distinction. | High |
| 34493 | `킨은 케이프 솔라스에서 재능을 썩히고 있어` for `Keen is going to waste` | Preserve the idiom that Keen's talent/potential is wasted in Cape Solace, and retain “more than anyone except perhaps me” as the comparison. | Korean makes the implied talent explicit and keeps the speaker as the possible exception. Japanese/Chinese likewise interpret Keen as being wasted; the proper status of Keen/Cape Solace needs consistency review. | Medium |
| 34495 | `그 서책` for `that Codex` | Confirm whether `Codex` is a named lore book and use its established Korean title; preserve the scholars' belief it was lost and the speaker's surprise. | Korean generalizes Codex to “book.” English capitalization and the historical log's Codex terminology suggest a named text; Japanese/Chinese also use generic book/codex readings. | Medium |
| 34498 | `전령관` for title `Herald` | Determine whether Herald is a formal office/title and standardize it with other herald/announcer terms. | Korean translates it as a herald officer; Japanese/Chinese translate as messenger/herald. The isolated label gives no additional role context. | Medium |

IDs 34453-34454, 34458-34460, 34463-34470, 34472, 34475-34476,
34478-34479, 34481-34487, 34490-34492, 34494, 34496-34497, and 34499-34500
generally retain the English meaning on this first reading. Proper names,
lore, voice, and display conventions remain integrated-pass candidates; no
additional distinct wording issue was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry explicitly flags the icon at 34451,
  five-line war poem at 34452, Ratofer's children at 34455, five-second
  value at 34456, House of Pride chantry at 34461, Sibun at 34463,
  Frostbreak Sea at 34467, Longbow control at 34471, the four-paragraph
  Adessa account at 34473, Hospitalis prejudice at 34474, the potion bench
  at 34477, dagger deal at 34480, the card ace at 34488, master-account
  prompt at 34489, Offering/Scion at 34490, Tuatha landfall at 34491, Keen
  at 34493, Codex at 34495, and Herald at 34498. These were checked against
  active Korean and all locale references.
- ID 34451's `#NAMED_ICON_GRAY_PS3_CROSS#` is preserved exactly. ID 34452
  retains five lines/four newline characters; ID 34473 retains four
  paragraphs/six newline characters.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 34451-34500 once
  and in identical order.
- Embedded line-break counts match across all four locales. The war poem at
  34452 has five lines; the Adessa account at 34473 has four paragraphs.
- Runtime marker identities/order match, including the ID 34451 icon.
- ID 34456's five-second value is preserved; Korean spells it out.
- Active Korean CSV hashes remain at their recorded checkpoint values.
- No CSV text or source file was edited.

## Batch Status

IDs 34451-34500 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 34501.
