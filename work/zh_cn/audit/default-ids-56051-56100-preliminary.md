# Preliminary Language Scan: `default` IDs 56051-56100

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 56051-56100 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 56051 | `클루리콘에 잠복해 있었어` | Confirm whether “embedded” means stationed/posted in Klurikon or infiltrating covertly. | Korean chooses “lying low/infiltrated”; English/Japanese/Chinese indicate a command-deployed unit stationed there, surviving for months on scavenged supplies. | Medium |
| 56058 | Mitharan Bloodseeker's Handle | Verify the complete item-part name and established `Handle` translation. | Korean retains Flawless, Mitharan, Bloodseeker, and handle; the source string is a specialized equipment component. | Medium |
| 56060 | `최상급 품질` for pristine | Confirm the Shard quality-tier name and whether it is the top tier. | Korean preserves the rule that Shards cannot be strengthened beyond the stated quality; Chinese explicitly treats pristine as a tier. | Medium |
| 56061 | Peaches' current `굴` | Determine whether Peaches is a person/creature name and whether “den” means lair/nest. | Korean preserves the possessive name and the need for an experienced tracker; the other locales also translate the den as a lair/nest. | Medium |
| 56067 | ring brings `깊은 평온` to a target | Confirm whether “profound peace” is literal calm, pacification, or a combat/status effect. | Korean retains the ring, target, and comfortable range; the effect's gameplay context is needed to disambiguate the euphemism. | Medium |
| 56068 | Hallam the White / Maid / great ballads | Confirm Hallam's title and the Maid's role in changing the great ballads. | Korean preserves the return objective, testing of the strange crystals, and their role in enabling the Maid's change; Japanese uses a more specific Maid epithet. | Medium |
| 56074 | crafting systems and Forge/Workbench/Altar | Align UI terms for Alchemy, Blacksmithing, Sagecraft, and their corresponding crafting stations. | Korean preserves the three systems, skill-proficiency benefit, and station mapping. `{LINE_LEFT}`, `{*1...}`, and their order match all references. | High |
| 56083 | `비탄의 집(The Sorrows)` | Confirm whether `the Sorrows` is a place/faction distinct from the House of Sorrows and preserve the Tuatha objective. | Korean treats it as House of Sorrows; the English omits “House,” while Japanese/Chinese use localized terms that do not settle the distinction. | Medium |
| 56084 | Midden / `그 집 아래` den | Confirm the capitalized House's antecedent and how the Midden route leads to the den. | Korean retains the fallback plan to lure her back to the den below the house; the source leaves the House's identity implicit. | Medium |
| 56086 | Erathi smiths / tools | Confirm the people-name and preserve that their craft methods are famous while most tools are lost. | Korean retains both the distinctive crafting/shaping and lost-tool claims. | Medium |
| 56087 | Wyvyrn-Gifre's permission | Confirm the authority/restriction implied by the teacher being limited to what Wyvyrn-Gifre allows. | Korean preserves the eager-pupil praise, limit on instruction, and wish to teach more. | Medium |
| 56088 | `나린 일가(Nareens)` | Determine whether Nareens is a family/group name or a plural individual name. | Korean interprets the plural as a family and retains the ominous “shouldn't have come back.” Japanese specifies a couple; Chinese says family. | Medium |
| 56091 | Caeled Coast / Castle Ansilla | Standardize both names and preserve the speaker's promise in their capacity as lord. | Korean retains the welcome and pledge of the castle's lord; localized spellings vary. | Medium |
| 56094 | `{*1recipes}`, `{*1reagents}`, `{1}` | Align crafting UI terminology and confirm the selected recipe is activated with the supplied control. | All marker identities/order, `{LINE_SPACE}`, and `{1}` match. Korean retains the known-recipes list, reagent condition, and button action. | High |
| 56095 | `동생` for `brother` | Preserve the male sibling reference without guessing whether he is older or younger. | English specifies a brother but not relative age; Korean's `동생` implies younger and is gender-neutral. Japanese only says sibling, while Chinese specifies older brother. | Medium |
| 56096 | `거의 인간이나 다름없군` | Identify which beings are “practically human” and confirm the interjection “Why.” | Korean preserves the near-human comparison but uses literal `왜`, which may read as a question rather than an exclamation. Context and referent are missing. | Medium |
| 56098 | going to war / never left Rathir | Confirm whether the speaker is being sent to war and preserve the surprise at leaving Rathir for the first time. | Korean retains both the assignment question and the lifelong homebound context. | High |
| 56099 | Savant Engar | Align Savant's title/rank rendering with the project terminology. | Korean transliterates Savant and preserves the instruction not to keep Engar waiting; Japanese calls the role a first-class mage and Chinese a learned person. | Medium |
| 56100 | Azo Raemund | Confirm the canonical spelling of the character's name. | English is the primary spelling; Japanese/Chinese/Korean phonetic forms differ. | Low |

Other reviewed rows generally preserve the English meaning on this first
reading. Names and terms remain provisional, including Klurikon, Mitharan
Bloodseeker, Peaches, Teeth of Naros, Hallam the White, House of Ballads,
the Maid, Anru Besin, Cann-Rane, Sagecraft, Sprite's Well, Heliodorus,
Caelrod, the Sorrows, Midden, Wyvyrn-Gifre, Nareens, Caeled Coast, Castle
Ansilla, Reddle Mane, Hospitalis Quarters, Taibreah, Ferrin Shaw, Thelgood
Skoria, Lucent Prinn, Odarath, Shardfall, Rathir, and Savant Engar.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `56050-56149`.
  Relevant prompts include the Summer's End crystals (56050), Klurikon
  deployment (56051), Mitharan Bloodseeker's Handle (56058), pristine Shard
  quality (56060), Peaches' den (56061), the ring's peace effect (56067),
  Hallam/Maid/great ballads (56068), the crafting tutorial (56074), Sprite's
  Well (56054), Heliodorus (56082), the Sorrows (56083), Midden/House den
  route (56084), Erathi tools (56086), Wyvyrn-Gifre (56087), Nareens (56088),
  Caeled Coast/Castle Ansilla (56091), recipes (56094), brother (56095),
  “practically human” (56096), war/Rathir (56098), and Savant Engar (56099).
- Historical boundary ID 56050 was included in the preceding active batch.
  ID 56100 remains in this report; the next active range begins at 56101.
- Historical questions are prompts, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 56051-56100 once
  and in identical ascending order.
- All four files contain 65,135 default records. Newline counts and
  recognized runtime-token identities/order match. At 56074, both
  `{LINE_LEFT}` markers and the crafting marker are preserved; at 56094,
  recipe/reagent markers, `{LINE_SPACE}`, and `{1}` are preserved.
- Active CSV SHA-256 values match the recorded checkpoint:
  - `base`: `c6adbf220bd66bab7ef61274886ea6a47427b58dc971f9e9703d4fd089b946a6`
  - `affix`: `7697d7d09933ca7f7f8f6e41fcd82bb5f29e4b092368b856489a8c62f1dc21b9`
  - `default`: `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`
- No translation CSV edit was made.

## Batch Status

This 2026-10-09 preliminary scan is superseded by the working disposition
report
[`disposition-batch-default-56051-56100-20261011.md`](disposition-batch-default-56051-56100-20261011.md).
The historical full-file hash above predates later accepted corrections
outside this range; all 50 active rows were re-read against the current
pre-edit CSV before disposition. The report records three accepted
corrections, seven uncertain findings, and 40 `not an issue` IDs. These are
working dispositions, not independent final approval. Resume at `default`
ID 56101.
