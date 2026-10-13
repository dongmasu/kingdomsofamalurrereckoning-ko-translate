# Disposition Batch: `default` IDs 65051-65100

- Date: 2026-10-11. Rechecked all 50 Korean rows against English, Japanese
  source, Japanese draft, and Chinese source by `ID_Linha`; reconciled
  historical questions and already accepted project terminology.
- Four accepted targeted corrections, 42 `not an issue` IDs, and six
  uncertain findings. Two uncertain findings overlap accepted rows because
  the correction addresses only a separate term in that row. These are
  working dispositions, not independent linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18158 | 65051 | `... 나랑 무슨 수다를 떨겠다고? ...` | `... 나랑 무슨 흥정을 하겠다고? ...` | Japanese explicitly says negotiate, and the following “I'm no merchant” supports a transactional reading over casual chatter. |
| D-18158 | 65068 | `... 우리 콜로사이를 이끌고 ...` | `... 우리 콜로세를 이끌고 ...` | Reuse the accepted Korean ethnonym `Kollossae = 콜로세` (including prior accepted corpus forms); no other wording changes. |
| D-18158 | 65089 | `완벽한 미타루 도살자의 받침대` | `완벽한 미타란 도살자의 받침대` | Reuse the accepted distinction `Mitharan = 미타란` versus the deity `Mitharu = 미사루` from D-18134; leave the item-type wording untouched. |
| D-18158 | 65100 | `... 타이스라는 콜로사이다.` | `... 타이스라는 콜로세인이다.` | Reuse the accepted person/ethnonym form `콜로세인` for an individual Kollossae; leave the uncertain personal-name spellings unchanged. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18159 | 65058 | The three additional votives and passage condition are retained, but `the Sorrows` may identify a place, force, or people and `votive` object terminology differs across locales. |
| D-18159 | 65066 | Pledgeshield and Oathblade are clearly service ranks, but their canonical Korean forms and progression labels remain unresolved. |
| D-18159 | 65069 | `Litanies` may mean prayer texts or prayers/recitations; the exact object being placed is not established. |
| D-18159 | 65089 | The Mitharan modifier is corrected, but the canonical item/category sense of `Butcher's Fulcrum` remains unclear. This is separate from the accepted term edit. |
| D-18159 | 65093 | The invitation and temple relationship are preserved; canonical Korean spellings for the people and named place vary across locales. |
| D-18159 | 65100 | The Kollossae ethnonym is corrected; transliterations of Onesimos and Thais still vary by locale. This is separate from the accepted ethnonym edit. |

## Not an Issue

Decision D-18160 records these 42 IDs: 65052-65057, 65059-65065, 65067,
65070-65088, 65090-65092, and 65094-65099. Current meanings, voice,
values, and structure are preserved.

## Structural and Historical Reconciliation

- English source, Japanese source, Japanese draft, Chinese source, and active
  Korean each contain 65,135 records with identical unique ascending IDs
  0-65134. All 50 target IDs occur once in each file and in identical order.
- The `default` schema has no `Tipo_Variante` field; no variant sequence
  applies. The CSV separator is semicolon; no embedded line breaks or
  runtime markers occur in this range.
- The +9% Chaos damage resistance value at ID 65060 and rank-service
  durations at ID 65066 are retained. No structural or numeric-value
  discrepancy was found.
- Only the active Korean `Texto` cells at IDs 65051, 65068, 65089, and 65100
  changed. UTF-8 BOM, 65,135 data rows, ID order, and record separators are
  preserved.
- Byte-identical batch-start backup:
  `/private/tmp/ko-translate-backups/20261011/before-65051/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `2e952f22ba847a023aeeaf70c05c2ff3181549296109f9a3a8ecb63da0e1e46c`.
  Post-edit SHA-256:
  `7e4578a43ddb86b9e9a3e5a128ae4e56732b3be53c2f1c82afab50a28066f5cf`.
- D-18158 records four accepted corrections, D-18159 records six uncertain
  findings (two overlap accepted rows), and D-18160 records 42 `not an
  issue` IDs. Cumulative register counts through D-18160: 1,864 accepted,
  17,209 `not an issue`, and 12,834 uncertain (31,907 dispositions); next
  D-18161.

Resume at `default` ID 65101; 34 IDs remain through ID 65134. These are
working dispositions, not independent linguistic approval.
