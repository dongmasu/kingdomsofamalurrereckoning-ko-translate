# Preliminary Language Scan: `default` IDs 56401-56450

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 56401-56450 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 56402 | `Fae Champion of Valor` / `용맹의 전당 페이 챔피언` | Clarify the relation between Fae, Champion, and Valor and align the House/Champion terminology. | Korean treats Valor as a hall and reorders the title; the English may refer to a Fae champion belonging to the House of Valor. Japanese omits the Valor relation, while Chinese retains it. | Medium |
| 56405 | `I ran the sewer` / `하수도를 질주했어` | Resolve whether this is simply running through a sewer or completing the named sewer race/quest. | Korean follows the English literally. Japanese says the speaker participated in and finished a sewer race; Chinese says they ran into the sewer. Later row 56518 names `Sewer Run`, with Japanese and Chinese also identifying a race; this supports the race/quest reading but does not settle the journal phrasing. | Medium |
| 56409 | Hospitalis Quarters / `병원 구역` | Check the established name and institutional meaning of Hospitalis Quarters. | Korean uses a literal “hospital district”; Japanese says a relief area and Chinese a medical barracks. Prior audit notes already flag this place term and its resident population. | Medium |
| 56414 | `physical description` / `물리적 묘사` | Confirm whether “physical” describes observable geography/features and prefer natural Korean wording. | Korean is a literal rendering that can sound like a person's physical description; English, Japanese, and Chinese refer to a description that points to Crow Peak. | Medium |
| 56418 | `Sustained Cost: 25% Mana` / `마나의 25%` | Preserve the exact resource basis for sustained cost and resolve the English/Japanese maximum-Mana discrepancy. | English, Chinese, and Korean say 25% Mana; Japanese specifies 25% of maximum Mana. The 15% chance, 10 Poison Damage, 5 seconds, and 25% value are otherwise preserved. | High |
| 56420 | `flute` / `피리` | Confirm the instrument and avoid substituting a Korean traditional instrument if a Western flute is intended. | English and Japanese explicitly say flute; Chinese says a long flute. Korean `피리` can denote a different traditional instrument. | Medium |
| 56423 | First of the Warsworn / `전쟁맹세단의 첫 일원` | Align Warsworn with the established `워스워른` faction name and confirm “the First” is an office/first member. | Korean translates the faction phrase descriptively, while the corpus predominantly retains `워스워른(Warsworn)`. English, Japanese, and Chinese all identify Eamonn as the first Warsworn. | Medium |
| 56426 | progress / enlightenment metaphor | Preserve the personified chisel-and-hammer image without implying the tools are lying in wait. | Korean retains the image but uses `도사리며`, which can suggest lurking; English presents progress as keen on dragging the speaker's people toward enlightenment. Japanese and Chinese also interpret the metaphor differently. | Medium |
| 56428 | `House of Valor` / `용맹의 전당` | Reconcile `용맹의 전당` with the many `용맹의 집` occurrences after a canonical House term is decided. | The active Korean corpus uses both forms for the same named House; prior audit findings already identify the inconsistency. | Medium |
| 56433 | Argine, Queen of Staves | Verify the tarot/faction sense of Queen of Staves and standardize its Korean title. | Korean uses `지팡이의 여왕`; Japanese and Chinese also describe a staff/wand queen. The historical question notes that the tarot/faction context is not established by this row alone. | Medium |
| 56450 | Savant Engar / `학자 엔가르`; Shardfall journal | Confirm whether Savant is Engar's formal title and preserve the five paragraphs, research hypotheses, and uncertainty about Shardfall's origins. | Korean translates Savant generically as scholar. The long entry retains all five source paragraphs and presents the three origin hypotheses without choosing among them. Japanese treats Savant as a higher mage rank and Chinese as a learned scholar. | Medium |

Other reviewed rows generally preserve the first-read English meaning. Names
and terms remain provisional, including Mitharan Sunlight Grip, Kandrian
Guard, Beckoned, Reddle Mane, Hospitalis Quarters, Phasmer Humm, Red Legion,
Belmaid, Crow Peak, Varani, Eamonn, Warsworn, Bysgon, Idylla, Ommer,
Argine, Telogrus, Cartery, Ametair, Gallows End, Nal Gorwin, Revival,
Zanvil, and Shardfall.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `56350-56449`.
  Relevant prompts include the Sorrows and “I ran the sewer” at 56400/56405,
  Master Belne at 56416, the progress/enlightenment metaphor at 56426, and
  Queen of Staves at 56433. ID 56449's Brice/Jokull ownership relation was
  compared directly; the Korean preserves the source sequence.
- ID 56450 begins the next historical range (`56450-56549`) and is included
  once as this active batch's final row. It is not duplicated as an active
  row in the preceding range. Historical questions are prompts, not
  accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 56401-56450 once
  and in identical ascending order. All four default files contain 65,135
  records with identical full key order.
- Newline counts and normalized runtime-marker frame/order match throughout
  the batch. ID 56450 has eight newline characters in every locale,
  preserving its five paragraphs and blank-line separation.
- ID 56418's 15% chance, 10 Poison Damage, 5-second duration, and 25% cost
  are present in all locales; only the Japanese maximum-Mana qualifier
  differs.
- Active CSV SHA-256 values remain at the recorded checkpoint:
  - `base`: `c6adbf220bd66bab7ef61274886ea6a47427b58dc971f9e9703d4fd089b946a6`
  - `affix`: `7697d7d09933ca7f7f8f6e41fcd82bb5f29e4b092368b856489a8c62f1dc21b9`
  - `default`: `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`
- No translation CSV edit was made.

## Batch Status

IDs 56401-56450 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 56451.
