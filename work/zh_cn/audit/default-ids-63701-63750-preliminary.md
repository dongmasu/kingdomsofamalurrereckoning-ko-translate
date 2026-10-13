# Preliminary Language Scan: `default` IDs 63701-63750

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 63701-63750 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, source-keyed historical
  questions, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 63703 | Gadflow's troops / `가드플로` | Retain as a source-ambiguity candidate; clarify the malformed English clause “what about you made Gadflow send his troops.” | Korean interprets it as asking what the addressee did to provoke the deployment, consistent with Japanese context; Chinese changes the subject and says “why you wanted Gadflow to send.” | High |
| 63704 | Rast / cove | Verify `Rast` and whether `cove` denotes a bay or cave in the surrounding quest context. | English and Chinese say cove/bay, while Japanese says cave; Korean uses `만` and preserves Rast as the survivor. | Medium |
| 63708 | `{*1...}` special-attack labels | Check whether the backslash-escaped quotes inside both Korean markup spans are intentional runtime-label escaping. | All four locales retain two `{*1...}` spans in the same order. Korean stores `\"징벌\"` and `\"야만의 날개\"`; English and Chinese use unquoted labels, while Japanese uses ordinary quotation marks. | High |
| 63709 | `Dramatis Personnae` / `등장인물` | Verify whether the English heading's `Personnae` is a source typo for Latin `Personae`. | Korean translates the heading as “characters”; Chinese transliterates the apparent Latin wording. | Medium |
| 63715 | `Cycle, the First: The Alfar` / `첫 번째 순환기` | Reconcile the title with Japanese, which reads “Second discovery - Alfar.” | English and Chinese support the first-cycle reading used in Korean; the Japanese title conflicts materially and should not silently override the English source. | High |
| 63720 | House of Valor chronicle | Retain the long narrative's sequence and verify canonical spellings for Hroth Magnus and Engard during glossary review. | Korean preserves the father's entry into the tournament, Engard's defeat, his decades of rule, and the narrator's intended succession. The first-mortal request and Fae experience contrast are retained. | Medium |
| 63723 | Dolve Arne / `돌브 아른` | Verify whether `Dolve Arne` names a house, territory, or seat and keep the possessive/heir reading open. | English and Japanese transliterate the name; Chinese interprets it as a castle/city. Korean preserves the source name without resolving the entity type. | Medium |
| 63727 | Ratofer's returned money | Record the duplicated “return to return” as an English source defect; the Korean's single “돌려주고” is coherent. | Japanese has one return action; Chinese also repeats the source construction. Korean does not duplicate the verb and preserves both the money-return and further-work objectives. | High |
| 63731 | Merchant's pack | Keep the physical scene open: determine whether the pack was violently thrown away from its owner or merely lies as though it had been. | The English is awkward (“thrown violently from the owner”); Korean conveys a violently discarded-looking bag, in line with Japanese and Chinese. | Medium |
| 63735 | Captain / `대장` | Verify whether “Captain” is a formal rank or a situational command role. | English and Japanese describe her as serving as captain by necessity and inexperienced; Korean preserves that qualification with a general “대장.” | Medium |
| 63737 | Mad Harst / “him and his” / Rathiri | Verify the referent of “his” and the established form/number of `Rathiri`; retain the current “그와 그 일당” as provisional. | Japanese supports Harst and his followers, while Chinese gives a divergent “his god” reading. Korean follows the follower/group interpretation; `Damned Rathiri` is rendered as a plural group insult. | High |
| 63743 | Ysa pass / “waterfalls and walks by the river” | Clarify whether the final phrase is literal leisure, ironic understatement, or an idiom for an easy life after obtaining entry to Ysa. | English and Chinese retain the waterfall/riverwalk image; Japanese paraphrases the outcome as safety. Korean keeps the image and its contrast with the speaker's mercenary outlook. | High |
| 63748 | Authority's order | Verify whether capitalized `Authority` is a divine entity/title, an official, or generic authority before standardizing the Korean title. | English is underspecified; Japanese says “ruler” and Chinese reads it as theocracy. Korean currently uses `권위자(Authority)` and leaves the mission's owner masculine, as in the source. | High |
| 63749 | “our order” / Travelers | Confirm whether this refers specifically to the Travelers and preserve the respectful treatment of the blessed Hierophant. | English is generic, while Japanese explicitly identifies the Travelers; Korean's “우리 조직” stays generic and the remaining instructions match the source. | Medium |
| 63750 | Whenery / Lord Setter | Clarify whether the narrator must stand in front of both men or lead Lord Setter to Warlord Whenery. | English says “in front of” Whenery but “lead” Setter; Japanese says the narrator must be in front of both. Korean follows the English staging/escort reading. | High |

Other reviewed rows generally preserve first-read meaning and voice/register,
including the Didenhil/Camden recollection, Neophyte address, Ametair
objective, Corgan Hold key, Mana Steal label, the short dialogue, the
Kandir journal, the persuasion tutorial, and the save-game/UI labels.
Proper names and recurring lore terms remain provisional. Findings are not
confirmed corrections.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical row for IDs 63650-63749, including
  the Gadflow clause, Rast/cove, localized attack labels, the Alfar cycle
  title, House of Valor chronicle, Dolve Arne, Ratofer's duplicated verb,
  merchant's pack, Captain role, Mad Harst/Rathiri, the Ysa-pass phrase,
  Authority, and “our order.”
- Also checked the source-keyed note for ID 63750 in the following
  historical range; the Whenery/Setter staging difference is recorded above.
- Findings remain preliminary open questions, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 63701-63750 once
  and in identical ascending order.
- Embedded newline counts match for every row.
- ID 63708 preserves both `{*1...}` markers in the same order in all locales;
  the Korean escaped-quote payload is recorded above for follow-up.
- No numeric-value differences were detected in the reviewed range.
- No translation CSV edit was made.

## Batch Status

IDs 63701-63750 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 63751.
