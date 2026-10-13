# Disposition Batch: `default` IDs 63401-63450

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, terminology, and structure.
- One accepted targeted correction, 27 `not an issue` IDs, and 23 uncertain
  IDs. ID 63420 retains a separate lore/title terminology question. These are
  working dispositions, not independent final linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Correction

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18067 | 63420 | `아만의 공허에 서서` | `아만의 동굴에 서서` | English's `hollow` is a physical place here; Japanese and Chinese both identify a cave/hollow, not abstract emptiness. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18068 | 63401 | Deod Dungaras and Almain are retained; canonical Korean person/people spellings need alignment. |
| D-18068 | 63402 | The reassurance is retained; Korean explicitly says “we'll protect you,” while English leaves the capable hands unspecified. |
| D-18068 | 63403 | The shipbuilder hammer's conditional effectiveness is retained; Dark Harbor and item-flavor context need review. |
| D-18068 | 63408 | The Eye of Lyria, late Middle Kingdoms, Rathir's early Arcana, and Year of Waking Knives are retained; exact historical relation and names need lore review. |
| D-18068 | 63410 | The exhibition-match board and betting rationale are retained; no material issue beyond voice/context. |
| D-18068 | 63411 | The darkly comic “Only one head” line is retained; whether one head was lost or the speaker narrowly survived requires scene context. |
| D-18068 | 63413 | House of Ballads service and `your grace` are retained; Sagecrafting term/register needs glossary review. |
| D-18068 | 63414 | `Lords of Valor` is an isolated title/category; its formal function and Korean form are unsettled. |
| D-18068 | 63417 | The quick-fall reasoning is retained; the referent of `it` and affected group are unstated. |
| D-18068 | 63419 | `Sidhe` may refer to the people or Faelands; locales differ. |
| D-18068 | 63420 | Amman and Hour of the Setting Sun remain named-lore candidates; exact canonical Korean forms and elevated address need integrated review after the cave correction. |
| D-18068 | 63421 | The inability to meet transaction requirements is retained; the requirements are not specified. |
| D-18068 | 63422 | The permanent Blacksmithing bonus and reader condition are retained; item terminology and “lost lore/dozens of techniques” phrasing need review. |
| D-18068 | 63425 | Family duty taking precedence over seeing Hillared is retained; the name may be a person/place and spellings vary. |
| D-18068 | 63428 | Captivity and inability to leave are retained; the precise settlement/enclave sense is unknown. |
| D-18068 | 63429 | The journal's content is retained. English/Chinese append a separate period after a newline; Japanese/Korean omit it. This source-format difference remains unresolved. |
| D-18068 | 63430 | The shop label is retained; “Alfar titles” could mean ranks, labels, or another purchasable category. |
| D-18068 | 63431 | Gossamer End upgrade action is retained; whether the target is a location/property and whether to say upgrade or renovate need context. |
| D-18068 | 63435 | The infiltration assignment and magic-perception rationale are retained; `retreat` may be a sanctuary or hideout, not necessarily an ordinary hideout. |
| D-18068 | 63439 | House of Ballads and Hallam's location are retained; Court of Enchantments is a proper location needing canonical Korean form. |
| D-18068 | 63443 | Four localized markers and the continuation controls remain ordered; Chaos crafting terminology needs glossary alignment. |
| D-18068 | 63448 | Cape Solace worship and its safety/sustenance/purpose triad are retained; Akara's pronoun follows English. |
| D-18068 | 63449 | The one/ten/twenty boggart escalation and town-wide infection risk are retained; creature spelling remains a corpus term. |

## Not an Issue

Decision D-18069 records these 27 IDs: 63404-63407, 63409, 63412,
63415-63416, 63418, 63423-63424, 63426-63427, 63432-63434,
63436-63438, 63440-63442, 63444-63447, and 63450. These rows preserve
available meaning, voice, labels, values, and structure.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 63401-63450 once,
  in identical ascending order.
- Embedded newline counts match except ID 63429: English and Chinese have
  one trailing newline before a standalone period; Japanese and Korean have
  no embedded break.
- ID 63443 preserves four localized `{*1...}` spans followed by
  `{LINE_SPACE}` and `{1}` in source order.
- Rechecked historical questions for Dark Harbor hammer, Eye of Lyria/Year
  of Waking Knives, Sagecrafting, Amman/Hour of the Setting Sun,
  violet-cage journal, Hierophant's retreat, and Chaos-core tutorial.
- Pre-edit CSV SHA-256:
  `b2169931722da4058acb1b2c94f54d4e7bd87ba59e6fdb41d786f5555ffa381c`.
  Post-edit SHA-256:
  `0d2da2cde13f6aa311f83def4fae255020fc121d5138ac3b9fa5bfac9b70e688`.
  Byte-level verification against the batch-start backup confirmed that only
  the `Texto` field at ID 63420 changed. The UTF-8 BOM, record count,
  key order, lineation, markers, and outer record separators are preserved.
  Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-63401/locatexts_zh_cn.koalocatext_default.csv`.
- D-18067 records one accepted correction, D-18068 records 23 uncertain
  findings (one overlaps the accepted ID), and D-18069 records 27
  `not an issue` IDs. Corrected direct register totals: 1,813 accepted,
  16,002 `not an issue`, and 12,439 uncertain (30,254 dispositions total); next
  D-18070.

Resume at `default` ID 63451; 1,684 IDs remain through ID 65134. These are
working dispositions, not independent linguistic approval.
