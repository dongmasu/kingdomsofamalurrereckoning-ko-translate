# Preliminary Language Scan: `default` IDs 58901-58950

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 58901-58950 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 58901 | Lore / Experience / collectible lore | Preserve the distinction between collected lore, world knowledge, and the additional area-completion Experience reward; align UI terminology. | All four texts retain the three-part help description and both `{LINE_SPACE}`/`{LINE_LEFT}` pairs. Korean conveys the collectible-completion bonus, while the official UI term for Lore/Experience remains a terminology check. | Medium |
| 58903 | `{*1equipment}`, `{*1socket}`, `{*1gem}` | Keep the three localized marker payloads attached to equipment, socket, and gem respectively. | English, Chinese, and Korean order the payloads equipment → socket → gem. Japanese orders socket → weapon/armor → gem. Each locale retains all three `{*1...}` markers; the Japanese label order is a structural/localization exception to record, not grounds to reorder Korean. | High |
| 58906 | Longinous / world-piercing spear / `롱기누스` | Verify the proper-name spelling and whether the spear is described as modeled after Longinous or as having pierced the world. | English says the spear was created in Longinous's image and appositively calls it “the spear to have pierced the world.” Korean preserves both elements but reverses their order; Japanese and Chinese also differ in how they attach the world-piercing phrase. Historical identity/spelling question remains open. | Medium |
| 58914 | Detect Hidden recipe | Preserve the four-line recipe layout and quantities: Scarab Salts (2), Sky Blossom (2), Bloodroot (1). | All locales retain the temporary skill effect, Alchemy Workbench, three ingredients, quantities, and four embedded line breaks. Korean ingredient forms remain provisional terminology. | High |
| 58917 | refugee criticism / `내 아버지를 위한 마을` | Candidate meaning: the town is characterized as full of fools and hypocrites, including the speaker's father; do not make the town something “for” the father. Preserve the hesitation before the final accusation. | English lists “fools and hypocrites and ‒ my father”; Japanese and Chinese likewise attach the father to the accusation/list. Korean's `내 아버지를 위한 마을` changes the relation to “a town for my father,” a likely meaning shift. This remains a preliminary candidate, not an applied correction. | High |
| 58919 | “flesh and blood folks” / Fae joke | Preserve the idiom meaning ordinary embodied people and the contrast with Fae, while retaining the lightly teasing tone. | All references make the ambassadors' request about facilities for people to rest. Korean expresses the idiom literally as “people with flesh and blood,” which remains understandable but may sound less idiomatic than the source. | Medium |
| 58929 | 13-line seduction poem | Keep the 13 displayed lines and review the archaic, deliberately obscure bodily and burial imagery without over-interpreting it. | English, Japanese, Chinese, and Korean have matching 12 newline characters. Korean retains the speaker's pride, failed resistance, sensual imagery, and final sense of being lost; several metaphors are intentionally difficult and remain open. | Medium |
| 58931 | Chaos Armor / conventional attacks / `{LINE_SPACE}` and `{1}` | Check established combat terminology and preserve the tutorial's two paragraphs and continue prompt. | All four retain two newline characters and the ordered `{LINE_SPACE}`, `{1}` markers. Korean preserves the condition that ordinary attacks become effective after Chaos Armor is gone. | High |
| 58933 | Wolf Pack threat / paragraph break | Preserve the speaker's repeated first-person threats and the separate final paragraph about the Wolf Pack. | English, Chinese, and Korean contain one newline separating the direct threat from the Wolf Pack sentence; Japanese has no newline. Korean retains both threats and the revenge statement. The Japanese line-break omission is recorded as a source-locale structure exception. | High |
| 58934 | Ethene handmaiden lore / source fragments | Preserve the source's opening and internal ellipses; do not reconstruct missing antecedents or clauses. | The English begins mid-sentence and contains ellipses/gaps. All locales retain four newline characters and the narrative sequence involving Ethene, the dispute, a blessing, and Lykeios, but some references smooth or supply grammatical links differently. Identity and omitted text remain unresolved. | High |
| 58943 | “rag-pickers and dust-grubbers” / `넝마주이와 먼지 청소부` | Preserve the speaker's contemptuous, appearance-and-odor-based dismissal; check whether `먼지 청소부` sounds too neutral or occupational. | The English is an insulting social description, while Japanese and Chinese also retain a dismissive characterization. Korean preserves the explicit refusal and odor insult, but the second role may read as a neutral cleaner. | Medium |
| 58949 | Apotyre vein | Preserve that the research hypothesizes a vein running beneath all Apotyre and assigns confirmation to the player. | All four retain the hypothesis, mine-search suggestion, and verification task. Korean accurately preserves the scope and uncertainty. The spelling and display form of Apotyre remain provisional. | Medium |

Other reviewed rows generally preserve the first-read English meaning and
Japanese voice/register. Provisional names and terms include Nareens,
Whitestone, Longinous, Finna, Arbos, Detect Hidden, Scarab Salts, Sky
Blossom, Bloodroot, Banshaen, Gravehal Library, Altar of Regression,
Ethene, Lykeios, the Quays, Lekka, Agarth, and Apotyre. Bilingual
parenthetical name marking remains inconsistent and is not normalized here.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `58850-58949`.
  Applicable prompts include Longinous and the spear lore (58906), the
  Detect Hidden reagent names (58914), the punctuation/referent of “and ‒
  my father” (58917), the idiom and Fae joke (58919), Gravehal Library
  (58923), the fencing-class register (58927), the 13-line poem (58929),
  Chaos Armor terminology (58931), the Wolf Pack threat (58933), the
  interrupted Ethene history (58934), the world-tree speaker (58935),
  Quays/Captain Rast Brattigan (58942), the city scavengers (58943), and
  Lekka, Agarth, and the Apotyre vein (58945-58949). These remain open
  prompts, not accepted corrections.
- The historical audit separately lists the marker order at 58903. All
  three markers are present in every locale; only the Japanese localized
  payload sequence differs from English, Chinese, and Korean.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 58901-58950 once
  and in identical ascending order. All four full `default` files contain
  65,135 records with matching key order.
- Newline counts match throughout the batch except ID 58933: Japanese has
  zero embedded newlines while English, Chinese, and Korean each have one.
  The recipe at 58914, poem at 58929, tutorial at 58931, and interrupted
  lore text at 58934 retain their line/paragraph structure in Korean.
- All three localized markers at 58903 and both tutorial markers at 58931
  are present. At 58903 Japanese alone orders its localized payloads as
  socket → weapon/armor → gem rather than equipment → socket → gem.
- Active Korean CSV SHA-256 values remain at the recorded checkpoint:
  - `base`: `c6adbf220bd66bab7ef61274886ea6a47427b58dc971f9e9703d4fd089b946a6`
  - `affix`: `7697d7d09933ca7f7f8f6e41cd82bb5f29e4b092368a8c62f1dc21b9`
  - `default`: `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`
- No translation CSV edit was made.

## Batch Status

IDs 58901-58950 received a subsequent working disposition pass documented
in [`disposition-batch-default-58901-58950-20261011.md`](disposition-batch-default-58901-58950-20261011.md):
one supported correction was accepted, 11 items remain uncertain, and 38
were dispositioned as not an issue. The preliminary findings above remain
evidence notes, not independent final linguistic approval. Continue at
`default` ID 58951.
