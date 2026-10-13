# Preliminary Language Scan: `default` IDs 33201-33250

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 33201-33250 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 33209 | `수도원` for `the mission` | Determine whether Mission names a monastery, mission institution/building, or task location; do not treat “monastery” as settled from this row alone. | Korean follows Japanese's monastery reading. Chinese says mission station, while English leaves the institutional/place sense open. Earlier audits flag the same term. | Medium |
| 33211 | `네 부분이 더 남았어` / `바람돌` for four remaining gate parts / Windstones | Preserve the one-part-open/four-remaining count and standardize the named Windstones without implying a different number. | Korean retains one plus four and the instruction to find and activate Windstones. All locale references support four remaining stones/parts; proper-name terminology remains open. | Medium |
| 33212 | `서문` / `학자` for `Foreward` / `Savant` | Keep the apparent source typo `Foreward` documented, and verify whether Savant is a formal rank rather than a generic scholar. Preserve the full alchemy preface and recipe-book transition. | Korean sensibly renders the misspelled heading as “preface” and identifies Oleander Sinclair, Scholia Arcana, and alchemy. It translates the capitalized rank as `학자`; Japanese uses a formal mage rank and Chinese a generic scholar. All four locales retain seven newline characters. | Medium |
| 33215 | `히에로판트` for `The Hierophant` | Standardize the office/title according to the eventual glossary and name-display convention. | Korean transliterates the English title, while Chinese translates it as a chief priest and Japanese uses a guide/leader term. The isolated label does not settle the canonical Korean form. | Medium |
| 33219 | Five-line Cathrus/Widow/Esharra verse | Preserve the five verse lines and the chronology: journey to the Widow, her children already dead, entrusting her to Esharra, then the call of Winter and the watch. Verify the Esharra relation and literary register in context. | Korean retains all five lines and four breaks, including the final transition from the Winter call to some sleeping while the speaker keeps watch. The English relationship to Esharra remains lore-dependent. | Medium |
| 33228 | `찜질약` for `poultices` | Confirm whether this means a medicinal poultice/dressing rather than a generic ointment or medicine; retain the boast and small-gold payment request. | Korean uses a topical-treatment term. Japanese and Chinese also use compress/ointment-like terms, but the exact remedy and natural Korean item term remain open. | Medium |
| 33229 | `동굴 머건` for `Cave Murghan` | Confirm whether Cave Murghan is a named creature, species, or location label; standardize Murghan and preserve the compound's entity type. | Korean transliterates Murghan and translates Cave. Chinese interprets the phrase as a cave-dwelling lizard-person, while Japanese transliterates the entire name. Historical notes flag Murghan terminology. | Medium |
| 33231 | One continuous child monologue, with no punctuation or line breaks | Preserve the child's run-on voice, accidental fire, father's violence, separation, and repeated apology; do not add paragraph breaks or adult-sounding punctuation. | Korean retains the full sequence in one uninterrupted string with zero newline characters, matching all locales. Its wording remains eligible for a later integrated voice/meaning pass. | High |
| 33234 | `텔로그러스가 ... 찾아 데려갔다` for `found him there and took him` | Keep “took him” broad unless context establishes possession or another specific action. | Korean says Telogrus found and took Wulf; it does not add possession. Japanese specifies possession, while the English and Chinese allow a broader reading, matching the historical caution. | High |
| 33239 | `니 스카루 군주의 왕관` for `Niskaru Lord's Crown` | Determine whether Crown is a wearable item, creature anatomy, or another named object before fixing the item-name form. | Korean selects a literal king's crown. English and Chinese support that reading, while Japanese uses a tree-crown/canopy term. Historical notes leave the object context open. | Medium |
| 33243 | `영국령 버진아일랜드` for `British Virgin Islands` | Confirm whether this is a localizable destination, debug label, or unrelated metadata before applying a user-facing geographic convention. | Korean translates the geographic name directly. The standalone row supplies no UI or gameplay context; the historical inventory flags the label as possibly debug-related. | Low |
| 33247 | `조금 손볼 필요` for `stand a little polish` | Preserve the mild, qualified appraisal and determine whether the items need literal polishing or broader repair. | Korean broadens “a little polish” to “a little work/attention.” English and the supporting locales leave the objects and appraisal context unclear; the historical audit flags the condition/polish wording. | Medium |

IDs 33201-33208, 33210, 33213-33214, 33216-33218, 33220-33227,
33230, 33232-33238, 33240-33242, 33244-33246, 33248-33250 generally retain
the English meaning on this first reading. Proper-name spellings, faction
terms, voice, and context-dependent object labels remain integrated-pass
candidates; no other distinct wording issue was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 33200-33299 was checked against
  the active rows. It flags the `Foreward` source typo and Savant/rank at
  33212, Esharra and the five-line verse at 33219, the uninterrupted child's
  account at 33231, the broad `took him` reading at 33234, possible object
  context at 33239/33243, and the condition/polish question at 33247.
- The Mission/Windstones terminology at IDs 33209/33211 and the
  Hierophant/Murghan terms recur elsewhere in the historical inventory.
- ID 33234's Korean follows the English without importing the Japanese
  possession reading.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 33201-33250 once
  and in identical order.
- Embedded line-break counts match across all four locales. ID 33212 has
  seven breaks, ID 33219 has four, and ID 33231 has none.
- ID 33224 retains the five-minute pet duration in Korean.
- No runtime-marker mismatch was detected in the range.
- Active Korean CSV hashes remain at their recorded checkpoint values.
- No CSV text or source file was edited.

## Batch Status

IDs 33201-33250 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 33251.
