# Preliminary Language Scan: `default` IDs 31651-31700

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 31651-31700 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 31653 | `장물을 처분하려면` for `fence items` | Preserve the intended sense of selling stolen goods; confirm the register of the colloquial instruction. | English uses `fence` as a verb. Korean correctly interprets it as disposing of stolen goods rather than building a fence. | High |
| 31659 | `이해관계가 있는 몇몇 세력` / `상시 의뢰` | Clarify which local parties are being alluded to and whether `standing offer` is an ongoing contract/request. | The speaker deliberately trails off before “concerned parties” and says they have a standing offer. Japanese likewise leaves the group unidentified; Korean retains the hesitation. | Medium |
| 31662 | `콜로사이` for `Kollossae` | Verify the canonical race/name spelling and align it with the project glossary. | English presents the name as an isolated label. Japanese and Chinese use differing transliterations; Korean follows its current corpus form. | Medium |
| 31664-31665 | `긍지의 마녀 기사들` / `오스블레이드` | Confirm Witch Knights of Pride and Oathblades as formal group/rank names and standardize both. | English capitalizes both terms. Japanese renders Witch Knights semantically and Oathblades as a mercenary rank; Chinese transliterates Oathblades. Korean retains proper-name forms. | Medium |
| 31667 | `납골당` / `웹우드` for `Ossuary` / `Webwood` | Determine whether Ossuary is a generic ossuary or a named location, and standardize Webwood. | English capitalizes both; Japanese and Chinese render Ossuary generically but Webwood as a place name. Korean translates the former and transliterates the latter. | Medium |
| 31671 | `역병 방지제` for `Plagueshield` | Confirm whether Plagueshield is a named medicine/item or a descriptive supply; standardize Didenhil and boggart terms. | English capitalizes Plagueshield and says a supply must be maintained to survive the malady. Japanese also transliterates the medicine name, while Chinese translates it semantically. Korean currently uses a generic “plague preventative.” | Medium |
| 31672 | `그 사람에게 그렇게 전해` | Keep the identity of “him” unresolved; preserve the speaker's defiant statement about protecting one's land. | The final instruction has no antecedent in the row. Japanese and Chinese also leave the recipient unidentified. | Medium |
| 31674 | Five-line Farrara/Famor and Bloody Bones poem | Preserve all five lines and verify the names, imagery, and literary voice in integrated review. | The English poem contrasts Farrara's blooming life with Bloody Bones' rot and scorn, then describes their grapple and mutual end. Korean retains five lines, both names, and the contrast. | Medium |
| 31677 | `사략선원` leggings / `해상 용병` | Confirm the canonical equipment term for `leggings` and the privateer faction/role. | English describes part of a privateer's uniform and skills in sabotage, assassination, and sea/land survival. Korean preserves the item and skill list; the exact clothing category remains terminology-dependent. | Medium |
| 31678 | `미타루의 도` | Confirm the established religious/doctrinal rendering of `Mitharu's way`. | English links Mitharu's way with truth and right; Japanese calls it the true path and Chinese uses a literal road metaphor. Korean chooses a doctrinal `도` reading. | Medium |
| 31685 | `석학들` / `스콜리아` for `Savants` / `Scholia` | Determine whether Savants is a formal rank/group and standardize Scholia Arcana terminology. | English capitalizes both; Japanese interprets Savants as high-ranking mages and Scholia as a university, while Chinese uses generic scholars/academy. Korean transliterates Scholia but translates Savants semantically. | Medium |
| 31690 | `그들` / `그들조차` | Preserve the unresolved antecedent for “them/even they” until surrounding dialogue is available. | The fragment begins with an ellipsis and names no group or people. Korean retains the fragment and pronoun. | Medium |
| 31691 | `제작에 성공했습니다:` for truncated `You have forged a` | Preserve the incomplete source continuation; verify concatenation/layout in UI context rather than completing the object. | English stops after the article `a`. Japanese provides a complete generic success notice, Chinese stops mid-thought, and Korean retains an incomplete lead-in with a colon. | Medium |
| 31697 | `실크 시트` for `Silken Seat` | Verify whether this is a place/business name and standardize the Korean proper-name form. | English and Chinese treat it as a named place to be restored. Japanese renders it as a silk inn/establishment. Korean transliterates it, leaving the entity type open. | Medium |

Rows 31651-31652, 31654-31658, 31660-31661, 31663, 31666, 31668-31670,
31673, 31675-31676, 31679-31684, 31686-31689, 31692-31696, and 31698-31700
generally retain the English meaning on this first reading. Names, register,
faction terminology, and context-dependent references remain for the
integrated pass; no separate high-confidence wording correction was
identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 31600-31699 was checked. Its
  source-term inventory includes the card-game `Lower`, but its detailed
  question incorrectly assigns that item to ID 31662. The active English
  row at 31662 is `Kollossae`; `Lower` is at ID 31562 and was reviewed in
  the 31551-31600 batch.
- The same historical question assigns `consecrate themselves` to ID 31671,
  but the active English row at 31671 is about Plagueshield. The
  consecration sentence is at ID 31571 and was reviewed in the
  31551-31600 batch. The historical archive was left unchanged; this
  mismatch is recorded so it is not propagated.
- Other checked historical items include the named icon at 31631,
  five-line Farrara/Famor poem at 31674, privateer leggings, Wild Evenroot,
  Savants/Scholia, the fall of all magic, the unidentified pronouns, and
  the incomplete forge UI string.
- The poem's five line breaks and the unfinished ID 31691 fragment are
  retained. No missing continuation was invented.

## Other Checks

- English, Japanese, Chinese, and Korean each contain all 50 IDs
  31651-31700 once and in identical order.
- Embedded line-break counts match throughout this range, including all
  five lines of the poem at ID 31674.
- Runtime-variable identities and order match; no runtime-marker
  discrepancy was detected in this range.
- No inspected row contains a locale-specific BOM, NBSP, zero-width space,
  or directional formatting character.
- No CSV text or source file was edited.

## Batch Status

IDs 31651-31700 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 31701.
