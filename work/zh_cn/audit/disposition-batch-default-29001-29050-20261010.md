# Disposition and Edit Batch: `default` IDs 29001-29050

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  29001-29050, checked against English, Japanese, Chinese, active Korean,
  and the historical audit.
- Decisions: one accepted, eight `not an issue`, and ten uncertain.

## Accepted Correction

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 29002 | `자물쇠를 따거나 열쇠를 훔쳐 감방 문을 열어.` | `자물쇠를 부수거나 열쇠를 훔쳐 감방 문을 열어.` | English says “bust the lock,” and Chinese says to pry it open; Japanese uses a general unlocking expression. `따다` specifically means picking the lock and narrows the available action without source support. |

## Other Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 29010 | Red's signed letter to Ugnar | Not an issue: sarcasm, repayment demand, invitation/threat, signature, and paragraph layout are retained. |
| 29012 | Handicap and bets against the player's success | Not an issue: Korean connects the advertised handicap with wagers against the solo fighter and the speaker's expected recovery of money. |
| 29016 | “Conceived in Chaos” / “born of stolen Magic” | Not an issue: the parallel conception/birth imagery and capitalization/context are retained. |
| 29020 | Source typo `cimes` / remembered wrongs | Not an issue: Korean's `죄` covers the likely intended crimes/sins; Akara's peace invocation, all listed names, and trailing layout are preserved. The source typo is not edited. |
| 29025 | Cranalt poisoning and Ronds/grain stakes | Not an issue: the three-part objective and the danger to both the Ronds and grain shipment are retained; group-name interpretation remains separately open. |
| 29031 | Court, Wencen, and the Maid narrative | Not an issue: the failure to rescue, waking from the curse, declaration of love, and stabbing are all retained, including any lore-level conflict. |
| 29041 | Bribe-value variable | Not an issue: `$TRSQ01.bribe_value$` is preserved exactly and the surrounding Gold label is localized. |
| IDs 29001-29050 structural and remaining ordinary text | Keys/order, breaks, runtime markers, unflagged wording | Not an issue: all four locales contain the IDs once in identical order; line-break counts and normalized runtime-token identities/order match, including ID 29020's list layout. |
| 29007 | Understyle / Felltown relation | Uncertain: English capitalizes Understyle, Chinese suggests an underworld garden, and Japanese parses the line differently; location status/context remains open. |
| 29014 | Warsworn / Hall of the Firstsworn | Uncertain: faction and religious/title terminology need corpus alignment; preserve current meaning pending glossary review. |
| 29017 | Font | Uncertain: English capitalizes it, while Japanese/Chinese associate it with Ysa's sacred spring; Korean keeps both a generic term and English form. |
| 29022 | Sparrows | Uncertain: English capitalizes the group; Japanese quotes it, while Chinese may read literal birds. |
| 29027 | `Neophyte` / greeting register | Uncertain: the institutional rank and appropriate Korean honorific level need speaker/context evidence. |
| 29034 | Pryderi | Uncertain: English/Japanese/Chinese differ on whether it is a place, company, or organization; Korean chooses a location reading. |
| 29037-29038 | Content Designers / Nature's Combat | Uncertain: these may be internal credits or player-facing labels; the category/skill term needs context. |
| 29042 | Vigor | Uncertain: the capitalized word may be a proper name or the generic quality; the line does not identify its role. |
| 29048 | Longevity / gratitude | Uncertain: English is awkward and Japanese says the addressee saved the speaker's life; preserve the gratitude without inferring the longevity mechanism. |
| Other named terms in IDs 29001-29050 | Felltown, Understyle, Hall of the Firstsworn, Font, Alabastra, Keep, Akara, Sparrows, Fate, Cranalt, Alrette, Ronds/Alfar, Neophyte, Besin, Fynwick/Ratofer, Court of Enchantments, Maid, Wyl/Pryderi, Content Designers, Nature's Combat, Warsworn, Vigor, Mel Senshir, Helyc Crosse, and Imposter | Uncertain: defer canonical spelling, faction, location, role, and skill terminology to integrated review. |

## Verification

- Only the approved `Texto` cell at ID 29002 changed. IDs, order, variants,
  and all other CSV fields were left untouched.
- The active default CSV retains its UTF-8 BOM, `72,046` CRLF endings, and
  `39` pre-existing bare-LF endings.
- Active default CSV SHA-256:
  `d2f7c2663de05fe10f82be74c0c8f7b6489e2dbcb34dac0b683c8c7672ac4cbe`.
- Register totals after this batch: 890 accepted, 3,067 `not an issue`, and
  5,129 uncertain (9,086 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 29051; 36,084 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
