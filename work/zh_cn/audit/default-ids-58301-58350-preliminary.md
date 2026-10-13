# Preliminary Language Scan: `default` IDs 58301-58350

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 58301-58350 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 58302 | High Roll / Range Roll / `하이 롤`, `레인지 롤` | Keep the two mechanics distinct and align their Korean game names with previous rule explanations. | English says the higher roll wins High Roll and Range Roll asks for a number interval. Korean preserves both mechanics; earlier rows separately suggest High Roll may compare a two-die sum. This sentence does not itself specify dice. | Medium |
| 58304 | Break Ward / `방호 파괴` | Confirm the canonical Korean name of this skill/ability. | English names a capitalized ability; Japanese describes breaking a protective spell and Chinese breaking a seal. Korean is a compact literal rendering, but its glossary status is unknown. | Medium |
| 58305 | FAIL LINE / unchanged | Retain as a likely debug/test string unless display context proves it is player-facing. | English, Japanese, and Korean preserve the all-caps label; Chinese translates it as failed dialogue. Earlier audit rows flag similar `FAIL LINE` entries as likely internal labels, but visibility is unverified. | Medium |
| 58309 | Dolve Arne / “my arms” / rotted staff / `옛 돌브 아른`, `내 무기` | Verify Dolve Arne and preserve that “arms” means the speaker's weapons, including a staff whose condition is queried. | English uses plural “arms” and then asks specifically whether the staff is rotted through. Japanese and Chinese both interpret “arms” as weapons; Korean does likewise and retains the staff question. | Medium |
| 58313 | Moon Camp / Hierophant / performers / `달빛 야영지`, `대사제` | Confirm Moon Camp's canonical Korean name, the Hierophant title, and whether “tumblers” should be more specifically rendered as acrobats. | English lists bards, jugglers, tumblers, and dancers performing for the Hierophant. Korean preserves the roles and purpose but uses a broad “performer/trickster” term for tumbler and a camp form that varies elsewhere. | Medium |
| 58314 | Crows / `까마귀단` | Preserve that the Crows were doomed before the addressee intervened and the speaker foresaw every member's death. | All sources retain both the counterfactual timing and death-vision. Korean renders Crows as a group and keeps the warning without weakening the outcome. | High |
| 58315 | Chaos Thrall VIII / `혼돈의 노예 VIII` | Preserve the Roman numeral exactly and verify the canonical enemy label. | English and Korean use `VIII`; Japanese uses Arabic 8 and Chinese also preserves the Roman numeral. The Korean label and identifier are intact. | High |
| 58319 | Weeping King / `울부짖는 왕` / “rotting to nothingness” | Preserve the speaker's despair and the image of bodies decaying into nothing; avoid an unintended “meaninglessly” reading. | English, Japanese, Chinese, and Korean agree that the people have lost former strength and are bodies decaying toward nothing. Korean's `무의미하게 썩어 가는` can mean “rotting meaninglessly,” adding a nuance not explicit in the source. | Medium |
| 58320 | Scholars / gnome class / `학자들` | Confirm whether Scholars is a formal gnome class/group and preserve the explanation of their education and intellectual role. | English capitalizes the group; all sources call them the most educated gnomes and thinkers of their society. Korean preserves both descriptions, while formal group status remains contextual. | Medium |
| 58321 | Belen's Testament / `벨렌의 테스타먼트` | Confirm the organization's canonical name and preserve the speaker's surprise. | English and Korean identify the Testament; Japanese and Chinese use equivalent organization/faith terms. Korean keeps the exclaimed realization. | Medium |
| 58325 | Houses of Sorrow, Pride, and Vengeance / `비탄의 집`, `긍지의 집`, `복수의 집` | Confirm the three House names and whether each refers to a faction/household rather than a building. | English capitalizes all three Houses, Japanese transliterates their names, and Chinese reads them as families. Korean translates the names and preserves their fall under Gadflow's sway; the faction naming convention remains open. | Medium |
| 58326 | `{3}% chance for{1} {2}` / `{3}% 확률로{1} {2}` | Preserve the exact marker identity and order `{3}`, `{1}`, `{2}` and confirm the localized label fragments around them. | All four locales contain the same three markers in the same sequence. Korean retains their order and percentage placement; marker payloads are not exposed in this row. | High |
| 58329 | Ambush of Gornak Ree / `고르낙 리의 매복` | Confirm the battle/name spelling and preserve the short sensory sequence from sunrise and fog to cries and silence. | All sources retain the rising sun, lingering fog, distant screams/battle, silence, and identification of the ambush site. Korean preserves the sequence and the site's importance. | Medium |
| 58331 | House of Ballads / `발라드의 집` | Confirm the canonical faction name and retain that its members preserve heroic legends through song. | English, Japanese, Chinese, and Korean preserve the role of song, reverence, and age of the House. Korean translates the name literally; broader House terminology remains unsettled. | Medium |
| 58332 | southern Tywili stronghold / `티윌리 남부의 요새` | Verify Tywili's spelling and preserve that the stronghold was mostly destroyed in the war. | All four sources agree on the southern location and extent of the wartime destruction. Korean retains both facts; the place name is provisional. | Medium |
| 58334 | Crux / Child of Autumn / malformed parenthetical | Preserve the source's incomplete parenthetical as a source defect and verify whether Crux names the concentration/core of Fae lifeforce. | English has an opening parenthesis for the Hidden Destiny implementation note but no closing parenthesis. Japanese and Korean also leave the note open; Chinese supplies a closing parenthesis. Korean preserves the abrupt note without resolving the lore meaning of Crux. | High |
| 58335 | fifteen glands / `분비샘 열다섯 개` | Preserve the approximate quantity and clarify whether these are specifically poison glands. | English spells out “fifteen” and says “or so”; Japanese specifies poison glands and uses digits, Chinese gives glands with digits, and Korean says approximately fifteen glands. Korean retains the approximate quantity but does not specify poison. | Medium |
| 58337 | Order / `질서`, foolishness and frippery / `허례` | Confirm whether “Order” means orderliness or a named organization; preserve the speaker's contempt for others' insistence. | English capitalization permits an organization reading, while Japanese and Korean read it as sequence/order; Chinese distinguishes a social order. Korean's `질서` and `허례` preserve the dismissive tone but resolve both ambiguities generically. | Medium |
| 58341 | Aara Lollyrs / Irion / separation from “it” / `이리온` | Preserve the longing for the place of color, dance, music, and freedom, and confirm whether `it` refers to that place or its life. | English, Japanese, Chinese, and Korean retain the speaker's nostalgia and frustration with Irion. Korean preserves the repeated place-reference and dismissive address; the exact reason for separation depends on context. | Medium |
| 58342 | Lykos' rat bait / `라이코스가 공들여 준비한 쥐 미끼` | Preserve that Lykos deliberately prepared the bait and confirm the name. | English, Chinese, and Korean say the rat bait was elaborately prepared; Japanese calls it conspicuously/ostentatiously prepared. Korean chooses careful preparation, a plausible reading. | Medium |
| 58343 | soldier returned from Klurikon / blessings / `축복을 내려 줄 순 없으니` | Preserve the speaker's discomfort with being treated as more than a soldier and the inability/refusal to give blessings. | All sources retain the plea not to kneel, the return from Klurikon, and the statement that the speaker does not give blessings. Korean preserves the humble refusal and admonition. | High |
| 58344 | Galafor poem / five source lines | Preserve all five lines and the English event order, while retaining the claim that Galafor will sing the speaker's dying song after the rest becomes dust. | English and Korean use five lines and four newline characters. Japanese moves the “long after” clause before Galafor's singing; Korean follows English's order and retains the country-drying/night-spark imagery and buried magic. | High |
| 58345 | place of enlightenment / loss of sympathy / `깨달음의 땅`, `연민` | Preserve the contrast that gnomes call it enlightenment at the cost of sympathy for people like the speaker. | All sources retain the name-like place description and the moral cost. Korean preserves both clauses without naming a particular group or doctrine. | High |
| 58348 | keeping “him” alive / entry into Alabastra / `그가 살아 있게 해` | Preserve the condition that he must survive long enough to get the group into Alabastra before the speaker offers help. | English, Japanese, Chinese, and Korean agree on the survival condition and the conditional offer of help. Korean keeps the duration threshold and group destination. | High |

Other reviewed rows generally preserve the first-read English meaning and
Japanese voice/register. Provisional names and terms include High Roll,
Range Roll, Break Ward, Tuatha, Boggart, Dolve Arne, Moon Camp, Hierophant,
the Crows, Chaos Thrall VIII, Fateweavers, the Weeping King, Scholars,
Belen's Testament, Houses of Sorrow/Pride/Vengeance, Gornak Ree, House of
Ballads, Tywili, the Crux, Child of Autumn, Aara Lollyrs, Irion, Lykos,
Klurikon, Galafor, and Alabastra.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `58250-58349`.
  Applicable prompts include High Roll/Range Roll (58302), Break Ward
  (58304), `FAIL LINE` (58305), Dolve Arne/arms/rotted staff (58309),
  Moon Camp performers (58313), the Crows' fate (58314), Chaos Thrall VIII
  (58315), the Weeping King (58319), Scholars (58320), the Houses (58325),
  marker order (58326), Gornak Ree (58329), Tywili (58332), the malformed
  Crux/Hidden Destiny note (58334), fifteen glands (58335), Belen's
  Testament, Aara/Irion, Lykos, the returning soldier, the Galafor poem,
  enlightenment/sympathy, and Alabastra (58321, 58340-58345, 58348).
  These remain open prompts, not accepted corrections.
- The history requires preserving the five-line Galafor poem and the
  `{3}%`, `{1}`, `{2}` sequence. Both were checked directly against all
  four locales.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 58301-58350 once
  and in identical ascending order. All four full `default` files contain
  65,135 records with matching key order.
- Newline counts match throughout the batch. ID 58344 has four embedded
  newline characters, yielding five poem lines in every locale.
- The `{3}`, `{1}`, `{2}` marker sequence at 58326 and
  `#NAMED_ICON_DIALOG_STANDARD#` at 58323 are preserved. The `VIII`
  identifier at 58315 and the fifteen-gland quantity at 58335 are intact.
- Active CSV SHA-256 values remain at the recorded checkpoint:
  - `base`: `c6adbf220bd66bab7ef61274886ea6a47427b58dc971f9e9703d4fd089b946a6`
  - `affix`: `7697d7d09933ca7f7f8f6e41fcd82bb5f29e4b092368b856a8c62f1dc21b9`
  - `default`: `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`
- No translation CSV edit was made.

## Batch Status

IDs 58301-58350 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 58351.
