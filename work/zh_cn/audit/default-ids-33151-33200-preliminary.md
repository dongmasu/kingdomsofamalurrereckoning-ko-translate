# Preliminary Language Scan: `default` IDs 33151-33200

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 33151-33200 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 33158 | `현자 엥가르` for `Savant Engar` | Confirm whether Savant is a formal rank/title and standardize the display form rather than treating it as a generic “sage.” | English capitalizes Savant, and Japanese uses a rank-like mage title; Chinese describes a learned person. Korean uses a generic sage term. Earlier audits flag the same title. | Medium |
| 33161 | `전차를 모는 자` for `as the Chariot` | Determine whether Chariot is the Traveler's formal Destiny/card title or a literal chariot rider; preserve the permanent song/recognition claim. | English capitalizes `the Chariot`; Japanese paraphrases it as a chariot driver, while Chinese also takes a literal vehicle reading. Prior audit evidence elsewhere identifies Chariot as a Traveler hero alias/title, but this row alone does not settle its Korean form. | Medium |
| 33163 | `앨서스와 베르차의 시신` for `the bodies of Alsers and Bertsa` | Verify the two names and retain that finding both bodies is required to unlock the object. | Korean preserves both named bodies and the lock objective. The proper names recur in the historical audit and require spelling/context confirmation. | Medium |
| 33165 | `요툰들` / `파닥세스` / `라이샌더` | Preserve that the speaker's Jottun failed to carry out orders and asks whether Padaxes or Lysander sent the player; standardize the people and names. | Korean retains the accusation and both alternatives. The historical inventory flags these entities and spellings; no locale resolves the speaker's broader context. | Medium |
| 33166 | `미사란 신비 증폭 장식` for `Flawless Mitharan Mystic Grip` | Confirm whether Grip is a named equipment category/component and align Mitharan/Mitharu terminology before standardizing the item name. | Korean conveys the flawless quality and Mitharan association but interprets `Grip` as a “boosting ornament.” Japanese transliterates the compound, Chinese translates a grip/handle, and related audits flag Grip category questions. | Medium |
| 33169 | `떠도는 샘의 물을 한 모금 마신다` for `take a Draught of the Wandering Well` | Confirm whether Draught of the Wandering Well is a named item/ritual or simply a drink from the named Well; retain the Leechwood Bark cause and calm outcome. | Korean describes drinking a sip. Chinese also reads a drink, while Japanese says the water can now be drawn. Earlier audit rows flag the Well's proper-name status and this title. | Medium |
| 33177 | `이 도시의 쓰레기조차 사람을 죽일 수 있어` for `this city's trash can kill you` | Clarify whether `trash` is literal refuse or a contemptuous/gameplay term for low-level city enemies; preserve the danger and the threat to their way of life. | English leaves `trash` ambiguous. Korean and Chinese both use literal garbage, while Japanese recasts it as the city's garbage having fighting power. Context is needed before choosing a game-specific sense. | Medium |
| 33180 | `이제야 왔군` for `It's about damn time` | Preserve the speaker's impatience and coarse emphasis while keeping the nearly-week wait and Jory's death. | Korean conveys “finally/about time” but omits the profanity/emphasis in `damn`. The frustration remains evident in the following sentence; this is primarily a voice/register candidate. | Low |
| 33181 | `+4` and `+18%` longbow piercing-damage lines | Preserve both effects, values, weapon scope, and separate display lines. | Korean retains `+4` flat Piercing Damage and `+18%` Piercing Damage with Longbows. All four locales retain two lines. | High |
| 33190 | `복무 통지서` for `Notice of Duty` | Confirm whether this is a military/service notice, an assigned-duty notice, or a named document before standardizing the standalone label. | Korean selects a military-service notice. The isolated title and supporting locales do not establish the exact administrative context. | Low |

IDs 33151-33157, 33159-33160, 33162, 33164, 33167-33168, 33170-33176,
33178-33179, 33182-33189, 33191-33199, and 33200 generally retain the
English meaning on this first reading. Proper-name spellings, lore terms,
register, and item/UI labels remain integrated-pass candidates; no other
distinct wording issue was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 33100-33199 was checked against
  this range. Chariot (33161), the bodies of Alsers and Bertsa (33163),
  Jottun and the named figures (33165), the Wandering Well title (33169),
  city “trash” (33177), and the administrative role (33182) remain open as
  recorded.
- Earlier reports also flag Savant Engar as a rank/title and Mystic Grip as
  an equipment-term question; these references were checked against the
  active rows.
- The two-line combat effect at ID 33181 retains its values and layout in
  Korean.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 33151-33200 once
  and in identical order.
- Embedded line-break counts match across all four locales throughout the
  range. ID 33181 preserves two stat lines and both values.
- No runtime-marker mismatch was detected in the range.
- Active Korean CSV hashes remain at their recorded checkpoint values.
- No CSV text or source file was edited.

## Batch Status

IDs 33151-33200 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 33201.
