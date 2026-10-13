# Preliminary Language Scan: `default` IDs 43501-43550

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 43501-43550 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 43501 | The Primos cannot succeed / `프리모스는 성공할 수 없어` | Preserve the English subject and inability; do not shift this into a speaker-side prohibition. | Korean follows English. Chinese says “cannot let the leader succeed,” adding an agent and changing the sentence's force. | Medium |
| 43502, 43538 | Gallows End / Gallows Tree / `갤로우스 엔드`, `교수대 나무` | Keep the place and tree distinct while aligning the established Korean spelling of Gallows End across the corpus. | English names Gallows End at 43502 and a House-associated Gallows Tree at 43538. Korean translates the tree and transliterates the location; global Gallows End forms remain inconsistent. | Medium |
| 43507, 43511, 43545 | `FAIL LINE`; `Temp Lore`; unused placeholder | Confirm these are internal/test or metadata strings rather than player-facing text; preserve exact source labels until their status is known. | Historical audit flags these rows. Korean leaves `FAIL LINE` and the unused placeholder unchanged, while translating `Temp Lore` as `임시 로어`. | Medium |
| 43508 | Rare Might Armor Surprise / `희귀한 힘 방어구 깜짝 상자` | Confirm whether this is a named reward/container; avoid adding “box” unless the UI object is known to be a chest. | English and Japanese do not explicitly say “box”; Chinese also describes a surprise/rare armor reward without clearly naming a container. Korean adds `상자`. | Medium |
| 43509 | Circle of Engard / `엔가드의 모임` | Confirm the organization name and use a consistent term for `Circle`. | English identifies an entity called the Circle of Engard. Korean's `모임` may sound informal; Japanese uses a transliteration and Chinese uses a religious-group term. | Medium |
| 43506 | Greeting to a hero / `안녕하시오... 그대와... 영광이오` | Check whether the archaic, masculine-coded Korean register is intended for this speaker. | Japanese and Chinese are courteous but comparatively neutral; Korean uses strongly archaic endings and `그대`. | Medium |
| 43512 | Nesta / `네스타`; historical note says Nestar | Retain the active English spelling `Nesta` unless other source/context evidence establishes a correction. | English and Japanese spell `Nesta`; the historical grouped question mentions `Nestar`, which appears inconsistent with the source-keyed row. | High |
| 43516 | “valued customer, to all the Janicks”; “spider slayer” | Preserve that the Janicks collectively regard the player as a customer and that “Spider Slayer” is the player's name/title. | Korean renders the family collectively and reads the second phrase as a nickname. Japanese/Chinese similarly treat it as a name or title. | Medium |
| 43517 | Master Makers / `거장 제작자`; “relinquish us from Anira's grasp” | Standardize Master Makers as a possible formal group title and preserve the intended release-from-captivity meaning without copying the English's awkward verb. | English uses the unusual `relinquish us from`; Korean expresses release from Anira. Japanese calls them “Legendary blacksmiths,” adding a trade not explicit in English. The count is three in all locales; Japanese uses digit `3`, equivalent to the words in the other versions. | Medium |
| 43520 | Former Contract Holder / `이전 계약자` | Clarify whether the target is the former holder/owner of a contract or a previous contractor. | Korean `계약자` can suggest a contractor, while English says the contract holder. Chinese explicitly says the previous contract holder. | Medium |
| 43525 | Scholia Arcana / `아르카나 학술원` | Align the institution name with established project terminology. | All locales retain the founding-history meaning; the Korean institutional form should follow the glossary used elsewhere. | Medium |
| 43532 | Corporate Controller / `기업 관리 회계사` | Confirm the intended corporate job function and whether this untranslated/translated credit is player-facing. | English/Japanese retain the English title, Chinese uses an internal-control title, and Korean interprets it as a corporate accounting role. Historical audit flags corporate titles as possible metadata. | Medium |
| 43541 | Quarters / `쿼터` | Confirm this refers to the named Quarters location and use its established Korean form. | The English capitalizes `Quarters` and describes a place where beleaguered residents request help. Korean transliterates it; Chinese gives a generic “residential area” reading. | Medium |
| 43548 | Slumber / `잠` | Confirm whether capitalized `Slumber` names a ritual/event; retain the challenge's reference to it. | Japanese explicitly calls it a “slumber ritual,” while Korean says simply “sleep” and Chinese refers to sleeping people. | Medium |

IDs 43503-43505, 43510, 43513-43515, 43518-43519, 43521-43531,
43533-43537, 43539-43540, 43542-43544, 43546-43547, and 43549 generally
retain the English meaning on this first reading. Names, setting terms,
register, and recurring terminology remain subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical ranges 43484-43506 and 43507-43511 were
  checked for Janick, Anira, Nanne, Nestar/Nesta, Tirin's Rest, Gallow's End,
  `FAIL LINE`, and temporary-lore references. The grouped note's `Nestar`
  spelling differs from English/Japanese `Nesta` at 43512.
- Historical rows for 43532 and 43545 flag the corporate title and unused
  placeholder. The marker review entry also covers `{1}` and the named icon.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 43501-43550 once
  and in identical ascending order; each default CSV has 65,135 records.
- Embedded line-break counts match across all four locales.
- Runtime markers match: ID 43531 retains `{1}`, ID 43543 retains
  `#NAMED_ICON_GRAY_360_LT#`, and ID 43545 retains the exact unused
  placeholder. The localized numeral `3` in Japanese at 43517 equals the
  written count in English/Chinese/Korean; no value discrepancy was found.
- No hidden formatting characters were found in this range.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 43501-43550 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 43551.
