# Preliminary Language Scan: `default` IDs 59051-59100

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 59051-59100 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 59051 | Ethene / `에세네` | Align the spelling with the established Korean rendering of Ethene; preserve the speaker's relief and emphatic satisfaction. | The English, Japanese, and Chinese identify Ethene; Korean writes `에세네`, while nearby lore text at 58934 uses `에테네`. This is a direct within-corpus proper-name inconsistency, not an approved normalization. | High |
| 59055 | fate / Reckoning Mode / `{*1...}`, `{LINE_SPACE}`, `{1}`, `{2}` | Preserve the marker sequence, hold instruction, and established Korean name for Reckoning Mode. | All four retain localized fate and mode markers, `{LINE_SPACE}`, and buttons `{1}`/`{2}` in the same order. Korean preserves the action; the mode's Korean terminology varies elsewhere and remains unresolved. | High |
| 59057 | Glass / `글래스` | Determine whether “Glass” is a named item/person or ordinary glass; Chinese alone interprets it as a mirror. | English and Japanese say “Glass,” Korean transliterates it, and Chinese says mirror. The row provides no context to choose between a proper name and a common noun. | High |
| 59059 | Testament / `유언 결사` | Align this faction name with the other active form `베일렌 결사` and the source-keyed Testament/Belen's Testament terminology. | All locales ask for help against the Testament. Korean renders the same faction differently from `베일렌 결사` at 58994; the intended canonical Korean form needs a terminology decision. | High |
| 59063 | Summer Court's “most treasured rogue” / `가장 사랑받는 도적` | Check whether “treasured” means most valued or most cherished, while retaining the fond, story-introduction tone. | English says “most treasured”; Japanese and Chinese use valued/treasured senses, while Korean chooses “most beloved.” The rendering is plausible but shifts from value to affection. | Medium |
| 59068 | Cliffbreak Fasting / `클리프브레이크 패스` | Verify the source spelling and whether this is a place, passage, or objective; preserve the command to enter it. | English says “Cliffbreak Fasting,” while Japanese describes an underground passage and Chinese a passage. Korean renders `패스` (pass), suggesting a place name; the discrepancy is unresolved. | High |
| 59085 | “Gone, Lyria bless her” / `떠났어` | Determine whether “gone” means dead or departed; preserve the mother's fatalistic saying without deciding the antecedent prematurely. | The follow-up says all things end up dead, while the Japanese and Korean read “gone” as absent/departed and Chinese also says gone. Context hints at death but does not settle it. | Medium |
| 59090 | “I throw up.” / `토할 것 같아` | Preserve the literal nausea/vomiting meaning rather than the Chinese “I give up” reading. | English, Japanese, and Korean express vomiting or feeling sick; Chinese alone says “I give up.” Korean follows the primary source and Japanese voice. | High |
| 59091 | Mana-steal stat / `{3}`, `{1}`, `{5}` | Preserve the percentage, per-hit trigger, mana amount variable, and trailing variable in source order. | All four locales retain `{3}`, `{1}`, `{5}` in order and describe a chance to steal mana per hit. The trailing `{5}` is unexplained in this string and remains a structural/context question. | High |
| 59097 | The Widow / Webwood | Confirm whether “The Widow” is a formal play/title and retain that the tale concerns her love for Webwood. | English, Japanese, Chinese, and Korean retain the title-like name and relationship to Webwood. Korean uses a dash rather than a colon; the title convention remains open. | Medium |
| 59100 | Erathi quotation / 12 displayed lines | Preserve all 12 displayed lines and 11 newline characters, including blank-line separations, while flagging the source's mismatched quotes and apparent fragment/question. | All four locales retain 11 newline characters. English has mismatched quotation marks and awkward/incomplete syntax; Korean follows the source's sequence without repairing unsupported text. Historical notes flag the same source defects. | High |

Other reviewed rows generally preserve the first-read English meaning and
Japanese voice/register. Provisional names and terms include Ethene, Bardan
Tam, Julia, House Anwon, Rathir, Saturnyn, Glass, Freedom Beckons,
Cliffbreak Fasting, Ametair, House of Valor, Shadow Walk, Freemen,
Ticnerani, Eventide, Lyria, Motus, Missives of Sable, Fateweavers, Hugues,
the Widow, Webwood, and the Erathi. The Testament rendering and Ethene
spelling are consistency candidates only; no translations were edited.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `59050-59149`.
  Applicable prompts include Ethene and related names (59051), House
  Anwon, Glass, Sagrell, Freedom Beckons, Cliffbreak Fasting, Ametair,
  Saturnyn, Lyria's blessing, Motus headquarters, Missives of Sable, the
  Mana-steal variable, Fateweavers/Hugues, the Widow, and the Erathi
  quotation at 59100. These remain open prompts, not accepted corrections.
- The Korean Ethene form at 59051 (`에세네`) differs from the form at
  58934 (`에테네`); the English spelling is the same. This has been logged
  as a consistency candidate without choosing a canonical form.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 59051-59100 once
  and in identical ascending order. All four full `default` files contain
  65,135 records with matching key order.
- Embedded newline counts match throughout the batch. The 12-line Erathi
  quotation at 59100 contains 11 newlines in every locale. Marker identities
  and order at 59055, variable order at 59091, and the `$M0_SQ06.dagger_cost$`
  variable at 59074 are preserved.
- Active Korean CSV SHA-256 values remain at the recorded checkpoint:
  - `base`: `c6adbf220bd66bab7ef61274886ea6a47427b58dc971f9e9703d4fd089b946a6`
  - `affix`: `7697d7d09933ca7f7f8f6e41cd82bb5f29e4b092368a8c62f1dc21b9`
  - `default`: `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`
- No translation CSV edit was made.

## Batch Status

IDs 59051-59100 received a subsequent working disposition pass documented
in [`disposition-batch-default-59051-59100-20261011.md`](disposition-batch-default-59051-59100-20261011.md):
one supported correction was accepted at 59051, seven items remain
uncertain, and 42 were dispositioned as not an issue. The preliminary
findings above remain evidence notes, not independent final linguistic
approval. Continue at `default` ID 59101.
