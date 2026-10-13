# Preliminary Language Scan: `default` IDs 30551-30600

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 30551-30600 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 30552 | `두둑한 돈주머니` for `a heavy purse` | Preserve the hush-money offer while checking whether the image should be rendered as a large sum of money rather than a literal heavy purse. | English and Japanese use the purse image; Chinese makes the amount explicit. Korean retains the image and the exchange for silence. | Low |
| 30558 | `타리보르의 흔적이 곳곳에` for `had Talibor's name all over it` | Keep the idiomatic implication of evidence/association rather than suggesting the boat literally bore repeated writing. | Korean renders the phrase as Talibor's traces being found throughout the boat; Chinese likewise says his marks were all over it. Historical notes flag this idiom. | Medium |
| 30564 | `문안드립니다` for `Salutations` | Confirm a natural Korean greeting and intended formality for this isolated label. | English is a formal greeting, Japanese uses a conventional greeting, and the Chinese source appears malformed. Korean is formal but may sound like the act of paying respects rather than a standalone greeting. | Low |
| 30572 | `서약방패병 페난` for `Pledgeshield Fenan` | Standardize Fenan's name and confirm whether Pledgeshield is a formal rank/title attached to the locksmith. | Korean treats Pledgeshield as a rank; Japanese and Chinese also render it as a rank/title. The historical audit flags this named rank and character. | Medium |
| 30576 | `시녀에게 챔피언은 한 명뿐` for `The Maid can only have one champion` | Confirm the Maid's named role and preserve that the addressee has already made a choice, not merely been selected. | Korean follows English's “You have chosen”; Japanese says the addressee was chosen. Korean retains the one-champion limit. | Medium |
| 30578 | `섬광의 칼날 3` for `Flashing Blade 3` | Confirm the canonical Korean ability name and consistent treatment of its numbered ranks. | The row is an isolated ability label. Other levels are also localized, but the historical audit explicitly asks whether this is the official ability term. | Medium |
| 30580 | `하나 생길 테니` for `I should have one here tomorrow` | Identify whether “one” means an animal, item, or other stock before choosing a Korean noun/classifier. | Korean uses a generic counter and implies one will become available; Japanese says the speaker will bring one. The historical question notes the unresolved referent. | Medium |
| 30586 | `료스알브` for `Ljosalfar` | Standardize the people-name against the active corpus forms `료스알브` and `로살파르`. | The current row uses `료스알브`, while other active rows include both spellings. Historical notes call out the captain and group-name consistency. | Medium |
| 30587 | `폐허 밖으로` for `Out the Ruins` | Determine whether this is an objective title meaning “out of the ruins” or a fragment with another intended direction. | English is elliptical; Korean and Chinese indicate movement outside, while Japanese can read as emerging from within the ruins. Historical notes explicitly flag whether this is a title or fragment. | Medium |
| 30588 | `꽃잎` for capitalized `the Petal` | Confirm whether Petal is the named cure/item and use its established Korean name rather than a generic flower petal. | English capitalizes Petal; Japanese identifies “Kora's petal,” while Chinese and Korean use a generic petal. Historical notes ask how Petal should be localized. | Medium |
| 30594 | `위협 대부분을 물리칠 수 있다` for `spells suffice to terrify ... threats` | Preserve “frighten/terrify” rather than changing the claim to defeating the threats; confirm the formal Destiny title `Initiate`. | English and Chinese say the spells terrify/scare away most threats. Korean says the spells can defeat them, which changes the stated effect. `Initiate` is also lower-case/common-noun-like in Korean despite being a capitalized Destiny title. | High |
| 30597 | `쇠퇴 전쟁` for `the Withering War` | Standardize the named historical event against the active corpus variants `쇠락 전쟁`, `쇠퇴 전쟁`, and `위더링 전쟁`. | Korean uses `쇠퇴 전쟁` here, while other rows render the same English event in multiple ways. Historical notes flag the event and its lore context. | High |

Rows 30551, 30553-30557, 30559-30563, 30565-30571, 30573-30575,
30577, 30579, 30581-30585, 30589-30593, 30595-30596, 30598-30600
generally retain the English meaning on this first reading. Their names,
register, fragments, titles, and surrounding quest context remain for the
integrated pass; no separate high-confidence wording candidate was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 30500-30599 was checked against
  this batch, including the hush-money offer, shipwreck and Talibor evidence,
  Quays, Pledgeshield Fenan, Maid's champion, Flashing Blade, Petal, Ljosalfar
  captain, Initiate's Destiny, Withering War, and Pryderi market.
- The narrower historical questions at 30550-30552, 30558, 30561,
  30565, 30572-30573, 30576, 30580-30581, 30586, 30588-30589, 30592,
  30594, and 30597-30599 were reconciled against the active rows. The
  ambiguity at 30580 and the evidence/association idiom at 30558 remain
  open; prior notes are not approvals.
- ID 30594's Destiny description was checked against English meaning,
  Japanese rendering, and the Chinese supporting text. Korean changes
  “terrify” to “defeat”; this remains a preliminary candidate.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 30551-30600 once,
  in identical order.
- Embedded line-break counts and normalized runtime-token identities/order
  match. The `{1}` and `{2}` placeholders at 30551 are preserved.
- Numeric meaning is retained. ID 30558 renders “one” as Korean `한` rather
  than a digit; ID 30576 likewise expresses “one champion” with a Korean
  counter. Other locales use different written number forms, not a quantity
  discrepancy.
- No unexpected Unicode format-character or structural exception was found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 30551-30600 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 30601.
