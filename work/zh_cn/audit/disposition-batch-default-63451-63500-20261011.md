# Disposition Batch: `default` IDs 63451-63500

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, terminology, and structure.
- One accepted targeted correction, 32 `not an issue` IDs, and 18 uncertain
  IDs. ID 63456 retains a separate title/attribution question. These are
  working dispositions, not independent final linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Correction

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18070 | 63456 | `라즈(Laz)와 라즈(Raz)` | `라즈(Laz)와 라스(Raz)` | Keep the brothers' distinct names distinguishable in Korean; Japanese and Chinese also differentiate Laz and Raz. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18071 | 63452 | Carver's dry touch/power and first whisper are retained; whether Carver is a title and “touch” a magical/creative power needs lore context. |
| D-18071 | 63456 | Grumble epithet and Phinneas Callidus attribution are retained; whether Grumble is a formal title and how the transcription credit attaches remain open after distinguishing the brothers' names. |
| D-18071 | 63457 | `Imperator` is retained in all locales; its role/rank meaning is unknown. |
| D-18071 | 63461 | Edgar's use of the stone, lure of Bloodbane, location of Aurenda/her lantern, and Motus withdrawal condition are retained; `in thrall` may mean magical enslavement rather than generic control. |
| D-18071 | 63463 | Night route, windmill, small cave, and easy-to-find reassurance are preserved; no scene context identifies the cave. |
| D-18071 | 63464 | Exhaustion and years wasted on a dead man are retained; the person and relationship are unknown. |
| D-18071 | 63466 | Colm's death and resulting inability to finish his task are retained; Red Marches and name forms remain provisional, and English is ungrammatical. |
| D-18071 | 63468 | Price refusal, agreed floor, difficult-to-find Skald's place, Gemstone, and drink are retained; voice and final sentence's meeting implication need context. |
| D-18071 | 63469 | Dead Kel, Hanged Men, island claim, and threat are retained; group name and relationship to Dead Kel need glossary/lore review. |
| D-18071 | 63470 | Rithen, amulet, curse-negating gem, and male recipient are retained; English does not identify the recipient, while Chinese supplies unsupported Fasmar. |
| D-18071 | 63475 | The Hierophant's anonymity and shrine communication are retained; preserve the formal title and avoid inferring an individual gender. |
| D-18071 | 63479 | `quickling` is retained phonetically; it may name a species or refer to a short-lived person. |
| D-18071 | 63483 | Ancient arrow shaft, Jemshee shard, docile beast, and possible retrieval are retained; attachment point and beast identity need context. |
| D-18071 | 63485 | Warsworn plan, one-month prediction, and Den wager are retained; Den may be a named venue or generic gambling den. |
| D-18071 | 63487 | Exceptional blades and lost-to-another-time image are retained; item category and singular/plural scope are unclear. |
| D-18071 | 63489 | Four-part Tuatha/Mathon's Court lore sequence and paragraphing are retained; `un-natured` is rendered interpretively and needs lore review. |
| D-18071 | 63494 | Ansilla's strategic role and disastrous mission end are retained; Caeled Coast geography and source clause relations need review. |
| D-18071 | 63500 | The poem's cloak, Summer's End, feigned love, and castle sequence are retained. Names/action differ across locales, and historical notes identify a separate Korean CSV versus translation-map text conflict; preserve the active CSV pending integrated review. |

## Not an Issue

Decision D-18072 records these 32 IDs: 63451, 63453-63455, 63458-63460,
63462, 63465, 63467, 63471-63474, 63476-63478, 63480-63482, 63484,
63486, 63488, 63490-63493, and 63495-63499. These rows preserve available
meaning, voice, labels, values, and structure.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 63451-63500 once,
  in identical ascending order.
- Embedded newline counts match for every row, including the Carver
  fragment, bargaining dialogue, Tuatha chronicle, and Amman poem. No runtime
  markers occur in the batch.
- Rechecked historical questions for Carver, Laz/Raz, Imperator, miners held
  in thrall, Hanged Men, Rithen/recipient, Hierophant, quickling, Jemshee's
  shard, Den, Tuatha Deohn, Caeled Coast, and the Amman poem/map conflict.
- Pre-edit CSV SHA-256:
  `0d2da2cde13f6aa311f83def4fae255020fc121d5138ac3b9fa5bfac9b70e688`.
  Post-edit SHA-256:
  `3f740bae45ce2332ed842127147c97a1d4e73aac863c0fafc93271e8d8459daa`.
  Byte-level verification against the batch-start backup confirmed that only
  the `Texto` field at ID 63456 changed. The UTF-8 BOM, record count,
  key order, lineation, and outer record separators are preserved.
  Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-63451/locatexts_zh_cn.koalocatext_default.csv`.
- D-18070 records one accepted correction, D-18071 records 18 uncertain
  findings (one overlaps the accepted ID), and D-18072 records 32
  `not an issue` IDs. Corrected direct register totals: 1,814 accepted,
  16,034 `not an issue`, and 12,457 uncertain (30,305 dispositions total); next
  D-18073.

Resume at `default` ID 63501; 1,634 IDs remain through ID 65134. These are
working dispositions, not independent linguistic approval.
