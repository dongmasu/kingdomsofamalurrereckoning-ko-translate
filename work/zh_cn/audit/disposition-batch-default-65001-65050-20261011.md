# Disposition Batch: `default` IDs 65001-65050

- Date: 2026-10-11. Rechecked all 50 Korean rows against English, Japanese
  source, Japanese draft, and Chinese source by `ID_Linha`; reconciled the
  source-keyed historical questions and project terminology.
- One accepted structural correction, 41 `not an issue` IDs, and eight
  uncertain findings. These are working dispositions, not independent
  linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Structural Correction

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18155 | 65015 | Internal separator: CRLF | Internal separator: LF | English, Japanese source, Japanese draft, and Chinese all use LF between the passive marker and the sentence; normalize only this embedded separator. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18156 | 65005 | English `kerchief` and Japanese `scarf` can indicate a worn cloth, while Chinese says handkerchief; the reagent-handling material does not settle the exact garment. |
| D-18156 | 65021 | Level 3 and Familiar Mastery are preserved, but the canonical Korean game-skill name is not established by the locale variants. |
| D-18156 | 65024 | The lock/order argument is clear; the canonical Korean form of Crinneus differs across locale readings. |
| D-18156 | 65028 | The route and Ventrinio's knowledge are retained, but proper-name forms vary and the Chinese sentence is structurally confused. |
| D-18156 | 65032 | `N,` may be an incomplete letter salutation; Japanese explicitly formats it as “To N,” but the fragment's display context is absent. |
| D-18156 | 65039 | The hero reference is clear, but `siege-breaker` may be a descriptive epithet or formal title; retain the current rendering pending terminology context. |
| D-18156 | 65045 | Winter Fae and House of Sorrows remain subject to Tuatha malice; the Korean faction/house terms need global terminology alignment. |
| D-18156 | 65048 | `master-at-arms` is role-specific, while Japanese says security chief and Chinese uses a different office term; the Gravehal appointment context is insufficient to choose a precise Korean title. |

## Not an Issue

Decision D-18157 records these 41 IDs: 65001-65004, 65006-65014,
65016-65020, 65022-65023, 65025-65027, 65029-65031, 65033-65038,
65040-65044, 65046-65047, and 65049-65050. The current translations
preserve the available meaning, voice, names, values, and structure.

## Structural and Historical Reconciliation

- English source, Japanese source, Japanese draft, Chinese source, and active
  Korean each contain 65,135 records with identical unique ascending IDs
  0-65134. All 50 target IDs occur once in each file and in identical order.
- The `default` schema has no `Tipo_Variante` field; no variant sequence
  applies. The CSV separator is semicolon, and `Texto` may contain embedded
  line breaks.
- At ID 65015, all runtime-marker identities and order are preserved,
  including `{*1[Passive]}` / its localized payload and the following text.
  Only the Korean embedded CRLF was changed to LF. The
  `#NAMED_ICON_360_LS#` marker at 65023 remains intact. No numeric-value
  discrepancy was found.
- Only the active Korean `Texto` cell at ID 65015 changed. UTF-8 BOM,
  65,135 data rows, ID order, and outer record separators are preserved.
- Byte-identical batch-start backup:
  `/private/tmp/ko-translate-backups/20261011/before-65001/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `0df634ae50365ff1f01d9b952e339ab4f62662482b65d8e3c21bd789902caf5b`.
  Post-edit SHA-256:
  `2e952f22ba847a023aeeaf70c05c2ff3181549296109f9a3a8ecb63da0e1e46c`.
- D-18155 records one accepted structural correction, D-18156 records eight
  uncertain findings, and D-18157 records 41 `not an issue` IDs. Cumulative
  register counts through D-18157: 1,860 accepted, 17,167 `not an issue`,
  and 12,828 uncertain (31,855 dispositions); next D-18158.

Resume at `default` ID 65051; 84 IDs remain through ID 65134. These are
working dispositions, not independent linguistic approval.
