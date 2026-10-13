# Disposition Batch: `default` IDs 64401-64450

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, terminology, values, and structure.
- No accepted corrections, 36 `not an issue` IDs, and 14 uncertain findings.
  No translation CSV cells changed. These are working dispositions, not
  independent linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18120 | 64404 | `Pledgeshield` may be a formal rank; Korean preserves the English-derived title, while Japanese gives a mercenary-rank reading. |
| D-18120 | 64407 | The blessing is clear, but the canonical Korean form of the Hierophant title and its register need consistency review. |
| D-18120 | 64410 | `Old Quay` may be an epithet/person-name or a description of an elderly Quay; Korean treats it as a proper name. |
| D-18120 | 64412 | `Scavengers` may refer to looters/raiders or creatures scavenging the collected webs; Korean chooses `약탈자들`, but context is missing. |
| D-18120 | 64413 | `Site` may be a mining/work site or workshop; Korean's `작업장` is more specific than English. |
| D-18120 | 64418 | The developer-facing `[DO NOT USE]` warning is retained; confirm the internal stat label's runtime/UI role, but do not drop it. |
| D-18120 | 64420 | The elliptical `at least he got his` is rendered as receiving deserved punishment; the exact consequence and antecedent remain unstated. |
| D-18120 | 64427 | The long sensual paragraph retains one paragraph and the English negation; review Helois and lore-specific imagery in the integrated literary pass. |
| D-18120 | 64436 | The `+2` value is exact; confirm `자물쇠 따기` against the official Korean skill/UI terminology. |
| D-18120 | 64438 | `Dustling` and capitalized `Telling` are setting-specific address/event terms; Korean retains them without resolving their canonical forms. |
| D-18120 | 64440 | `Dispelling` may be a formal ability name; Korean conveys the action, but standardize only after checking the skill glossary. |
| D-18120 | 64447 | `The Offering` and `Scion` may be formal event/rank terms; Korean preserves the absent recipient and failed blessing without settling their titles. |
| D-18120 | 64448 | The extra `Plagueshield` may be a person/rank or another resource; Korean assumes a person, pending context and terminology review. |
| D-18120 | 64449 | Capitalized `Maid` may refer to the Maid of Windemere rather than a generic maiden; keep the current wording provisional. |

## Not an Issue

Decision D-18121 records these 36 IDs: 64401-64403, 64405-64406,
64408-64409, 64411, 64414-64417, 64419, 64421-64426, 64428-64435,
64437, 64439, 64441-64446, and 64450. They preserve available meaning,
voice, values, and structure.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 64401-64450 once,
  in identical ascending order.
- Embedded newline counts and runtime-marker identity/order match for every
  row. The long Varani paragraph at 64427 remains one paragraph; the
  localized marker sequence at 64450 is preserved.
- Values `+2` at 64436 and level `1` at 64450 are retained.
- Rechecked source-keyed historical questions for Gadflow/Tirnoch, Old Quay,
  scavengers, the developer DoT label, the Varani passage, Teeth of Naros,
  Pacetor, Lockpicking, Telling, Scion, and Plagueshield.
- No translation CSV cells changed. Active default CSV SHA-256 remains
  `91991b444d52ac7e65a3bc606afc39fde32ed42b5b3371eec79026b9c6310952`,
  byte-identical to the batch-start backup:
  `/private/tmp/ko-translate-backups/20261011/before-64401/locatexts_zh_cn.koalocatext_default.csv`.
  UTF-8 BOM, 65,135 data rows, key order, embedded lineation, and outer
  CRLF record separators are unchanged.
- D-18120 records 14 uncertain findings and D-18121 records 36
  `not an issue` IDs. Totals at D-18121: 1,830 accepted, 16,714
  `not an issue`, and 12,711 uncertain (31,255 dispositions); next D-18122.

Resume at `default` ID 64451; 684 IDs remain through ID 65134. These are
working dispositions, not independent linguistic approval.
