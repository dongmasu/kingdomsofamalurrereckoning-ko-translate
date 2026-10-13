# Preliminary Language Scan: `default` IDs 29001-29050

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 29001-29050 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 29001-29006, 29008-29009, 29011-29013, 29015, 29018-29019, 29021, 29023-29030, 29032-29033, 29035-29036, 29040, 29043-29047, 29049-29050 | Dialogue, lore, names, item/UI labels, and objectives | Recheck register, established names, and terminology in the integrated pass. | Korean generally conveys the English. Felltown, Understyle, gems, Mitharu, Hall of the Firstsworn, Font, Alabastra, the Keep, Akara, Sparrows, Fate, Cranalt, Alrette, Ronds/Alfar, Neophyte, Besin, Fynwick/Ratofer, Court of Enchantments, the Maid, Wyl/Pryderi, Content Designers, Nature's Combat, Warsworn, Vigor, Mel Senshir, Helyc Crosse, Imposter, and related terms remain candidates. | Medium |
| 29002 | `자물쇠를 따거나 열쇠를 훔쳐 감방 문을 열어` | Preserve the requirement to retrieve the tools and the two alternatives for opening the cell; confirm whether “Bust the lock” specifically means lockpicking or forcing it. | English offers busting the lock or stealing the key. Korean renders busting as picking the lock, a narrower action; Japanese says unlock, Chinese says pry/break. | Medium |
| 29007 | `언더스타일(Understyle)` | Confirm whether Understyle is a proper location/region and preserve the contrast with Felltown. | English capitalizes the name; Korean retains both transliteration and source spelling. Chinese localizes Understyle as an underworld garden and Japanese parses the line differently, making the place relationship context-sensitive. Historical audit flags this location. | Medium |
| 29010 | Red's signed letter and Ugnar | Preserve the speaker's sarcastic gratitude for being easy to find, the debt/insistence on repayment, and the invitation/threat to meet; retain the signature and paragraph layout. | English, Japanese, Chinese, and Korean keep the ironic contrast (“not for leaving” but for being findable), Ugnar's proximity, and the final ultimatum. Korean preserves the signature as a separate final line. | Medium |
| 29012 | Handicap advertising and bets against the player's success | Preserve that people will wager against the solo fighter and that the speaker expects a win to recover their money. | English and Korean clearly connect the advertised handicap to wagers against the player's success. Chinese instead suggests the odds rise; Japanese retains bets on losing. | High |
| 29014 | `워스워른(Warsworn)` / `선서자들의 전당(Hall of the Firstsworn)` | Standardize the faction name and determine whether `Firstsworn` has an established title or a literal “first sworn” translation. | English capitalizes both terms; Korean preserves Warsworn parenthetically and translates Hall of the Firstsworn literally. Japanese omits the Warsworn address; Chinese uses “Hall of the Firstsworn.” Historical audit flags religious/faction terms. | Medium |
| 29016 | `혼돈 속에서 잉태되어, 훔친 마법으로 태어났다` | Preserve the deliberate conception/birth parallel and the ominous creation lore; verify capitalization/context before treating the phrase as a standalone motto. | English, Japanese, Chinese, and Korean preserve the contrast between conception in Chaos and birth through stolen Magic. Historical audit explicitly flags this creation line. | High |
| 29017 | `샘(Font)` | Determine whether `Font` is a named place/lore mechanism or a generic spring/fountain; preserve the move into its light and the speaker's request for a closer look. | English capitalizes Font; Japanese/Chinese identify it with Ysa's sacred spring, while Korean translates it generically and retains the English in parentheses. Historical audit flags Font. | Medium |
| 29020 | `Their cimes will not be forgotten` rendered as “그들의 죄” | Treat `cimes` as the historical audit's source typo for `crimes`; retain Akara's peace invocation, all 12 names, and the trailing blank/list layout without editing the source. | The intended “crimes” reading is supported by the sentence and Japanese/Chinese. Korean renders sins/crimes and preserves all listed names plus the trailing blank lines. The historical inventory explicitly records this source typo and name spellings. | High |
| 29022 | `참새들(Sparrows)` | Confirm whether Sparrows is the Travelers faction/group rather than literal birds; retain the fear that members will be murdered one by one. | English capitalizes Sparrows, while Japanese puts the name in quotation marks and Chinese reads literal sparrows. Korean translates the noun and appends the English group name. Historical audit flags Sparrows. | Medium |
| 29025 | `론드 가족` / Alfar troop shipment | Preserve the three-part objective: enter Cranalt, find the wizard who poisoned the river with madness, and reverse the effect to save the Ronds and the grain shipment. | Korean preserves both stakes and the relation between the poisoning and madness. Chinese says the grain should remain unpoisoned; Japanese emphasizes stopping contaminated grain from reaching the Alfar. `Ronds` plural/group identity remains open. | Medium |
| 29027 | `안녕하십니까, 수련생이여` for `Greetings, Neophyte` | Confirm the institutional rank and whether the formal Korean honorific is appropriate for the speaker. | English is a brief greeting without an explicit polite marker; Japanese is casual, Chinese polite, and Korean uses formal polite speech plus a vocative. Neophyte is a recurring rank/title candidate. | Medium |
| 29031 | Court of Enchantments, Wencen, the Maid | Preserve the stated sequence and the disturbing action: the Court failed to rescue its liege; after waking from the curse, Wencen proclaimed love and stabbed the Maid. | All source locales state this sequence, though it may conflict with broader story context. Korean preserves the timing, love declaration, and stabbing without softening the act. Historical audit asks to check this narrative against surrounding lore. | High |
| 29034 | `프리데리(Pryderi)` as a destination/company | Determine whether Pryderi is a place, organization, or business and preserve that Wyl needs the ledger from the Custom House storeroom and must receive it. | English says return to Wyl “in the Pryderi”; Japanese calls it Pryderi company, while Chinese says return to Pryderi. Korean treats it as a location. Historical audit flags Pryderi. | Medium |
| 29037-29038 | `콘텐츠 디자이너` / `자연의 전투` | Confirm whether these are developer-facing credits or in-game labels and standardize the Nature's Combat skill/category name. | English uses a capitalized job label and skill-like title. Chinese localizes both, Japanese leaves the credit in English; Korean localizes both. Historical audit flags these labels. | Medium |
| 29041 | `($TRSQ01.bribe_value$ 골드)` | Preserve the exact bribe-value variable identity and order; confirm the display label for Gold. | All four locales retain `$TRSQ01.bribe_value$` exactly. Korean translates Gold and retains the parenthesized value. | High |
| 29042 | `비거(Vigor)` | Determine whether Vigor is a character/proper name or the generic quality “vigor”; retain the separate drunkard mage. | English capitalizes Vigor, and Korean keeps it as a named entity. Historical audit specifically flags Vigor's role/context; the dialogue alone does not identify the person. | Medium |
| 29048 | `당신 덕분에 제가 오래 살게 되었다고 들었습니다` for “you are to thank for my longevity” | Preserve gratitude for the addressee's role in the speaker's longevity and the later invitation to bridge the people's separation. | English is awkwardly phrased but means the addressee is responsible for the speaker's long life. Korean frames this as something the speaker heard; Japanese says the addressee saved their life, while Chinese is also awkward. The cause of longevity remains unspecified. | Medium |

## Historical Audit Reconciliation

- The source-keyed inventory for IDs 29002-29020 and 29022-29031 flags
  Felltown, Understyle, Font, Alabastra, Hall of the Firstsworn,
  “Conceived in Chaos,” Red's letter, name spellings, Sparrows, Fate,
  Cranalt, Ratofer, Court of Enchantments, and the Maid. It specifically
  identifies `cimes` at 29020 as a likely typo for `crimes`.
- The inventory for IDs 29034 and 29037-29043 flags Pryderi,
  Content Designers, Nature's Combat, and Vigor, and asks for name/rank/
  skill terminology and preservation of variables and numeric sequences.
- All noted questions remain preliminary; source CSVs and Korean translations
  were not modified.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 29001-29050 once,
  in identical order.
- Embedded line-break counts and extracted runtime-token identities/order
  match across all four locales. The named `$TRSQ01.bribe_value$` variable
  at ID 29041 is preserved identically. ID 29020's full name list and trailing
  blank lines have matching layout.
- No unexpected Unicode format character or structural exception was found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 29001-29050 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 29051.
