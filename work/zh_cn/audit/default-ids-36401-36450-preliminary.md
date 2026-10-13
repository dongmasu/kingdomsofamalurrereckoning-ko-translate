# Preliminary Language Scan: `default` IDs 36401-36450

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 36401-36450 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 36405 | Fahrlangi / Mad Harst / Heart of Sibun / Lord Besin | Carry forward the name, faction, and relationship questions; preserve that Harst served Besin while the thefts occurred. | English says mages who call themselves Fahrlangi worked under Harst, who in turn worked for Besin. Korean retains that chain and the stolen Heart of Sibun. Japanese/Chinese differ on whether Fahrlangi is a faction/religious group or simply the mages' self-name. | High |
| 36407 | `페어 고르타`; `고통에서 해방` | Confirm the faer gorta creature term and whether `put them out of their misery` explicitly means killing the transformed companions. | English uses a euphemism; Japanese says release them from suffering and Chinese says rescue them from pain. Korean preserves the euphemism without adding an explicit killing action. | High |
| 36414 | `성 오드윅의 숙소` for `St. Odwig's Bunks` | Confirm whether the named location is bunks/barracks rather than general lodging. | English specifies bunks; Chinese says barracks/simple quarters, Japanese lodging, and Korean uses general accommodations. | Medium |
| 36415 | `아래로 보내라` for `send them on down` | Retain the veiled order while checking whether it means killing, dispatching, or sending people to a lower area. | The line orders silence and says to send meddlers “on down.” Korean preserves the euphemism; the isolated text does not establish the destination or action. | Medium |
| 36417 | `규율` for `discipline` | Confirm whether this is the named virtue/choice and align the terminology. | English and Chinese say discipline; Japanese reads the option as self-reflection. Korean follows the English reading. | Medium |
| 36419 | `크루독 블러드베인`; `듄헤드 광산` | Standardize the Crudok/Bloodbane creature and Dunehead Mine names. | English identifies a Crudok named/described as Bloodbane; the other locales differ in whether Bloodbane is treated as a name or epithet. Korean preserves the creature's appetite for gnomish miners and the blocked mine work. | Medium |
| 36423 | `라시어` / stone-tree branches | Carry forward the likely English typo `bows` for `boughs`, and align Rathir spelling. | Japanese reads the image as bending branches and Korean places mages in the branches. English punctuation is compressed and uses `bows`; Chinese's ship-prow reading differs. Korean retains the broad stone-tree image and ships in its shade. | High |
| 36432 | Internal-looking `GOR` / `destroyed object art` note | Confirm whether this is a production/debug string intended for players and whether `GOR` is an opaque identifier. | English explicitly refers to deleting `GOR` until destroyed-object art is available; all locales translate the instruction while retaining the identifier. The text's production-facing status remains unverified. | High |
| 36435 | `다른 대장장이` for `other mastersmith` | Preserve the speaker's claim to be the only master smith; check whether `mastersmith` is a formal rank. | English, Japanese, and Chinese all specify a master smith. Korean says there is no other blacksmith and omits the mastery/rank distinction. | High |
| 36436 | `좋은 물건이군` for `Pleasant findings` | Verify whether this is a merchant's goods/selection line or a literal discovery remark. | English is ambiguous in isolation; Japanese refers to a good selection, Chinese to pleasant findings, and Korean to good goods. Dialogue context may settle the speaker's intent. | Low |
| 36438 | `{*1튜토리얼}`, `{*1옵션}` | Preserve both localized display labels and wrapper identity/order. | All four locales retain the two `{*1...}` wrappers in the same order. Korean localizes the visible labels; no wrapper or placement discrepancy was found. | Low |
| 36442 | `해제술` for `Dispelling` | Confirm the established skill name against the official glossary and prior usage. | English names Dispelling as a skill; Japanese reads curse-breaking and Chinese seal-dispelling. Korean uses `해제술`, a plausible game-skill term whose corpus consistency should be checked. | Medium |
| 36447 | `배를 찾아내는 사람` for `ship spotter` | Carry forward the role/location terminology question and preserve the speaker's praise of the scout. | English calls the person a ship spotter; Japanese says ship lookout and Chinese a ship watcher. Korean paraphrases the role as someone who finds ships. Cape Solace is also a recurring place-name candidate. | Medium |
| 36448 | Missives of Sable / Livrarium / Hierophant | Carry forward canonical names for the document, institution, and title, and retain the relation between the theft and Grim's revenge. | Korean preserves that Grim requested the book to use in revenge against the Hierophant and that it was stolen from the Livrarium. The three key names have differing localized forms across references and prior occurrences. | High |

IDs 36401-36404, 36406, 36408-36413, 36416, 36418, 36420-36422,
36424-36431, 36433-36434, 36437, 36439-36441, 36443-36446,
36449-36450 generally retain the English meaning on this first reading.
Names, lore, register, and production/UI terminology remain subject to
integrated review.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 36400-36599 was checked against
  this batch. Its questions at 36405, 36407, 36423, 36432, 36447, and 36448
  were compared directly with all four locale texts.
- No historical question was treated as approval to edit a translation.
  The production-note classification at 36432 remains unverified.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 36401-36450 once
  and in identical order.
- Embedded line-break counts match across all four locales.
- ID 36438 retains both localized `{*1...}` wrappers with matching
  identities/count/order. No other runtime-token mismatch was detected.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 36401-36450 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 36451.
