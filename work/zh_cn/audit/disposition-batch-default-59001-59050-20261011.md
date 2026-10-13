# Disposition Batch: `default` IDs 59001-59050

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- No accepted corrections, 38 `not an issue` IDs, and 12 uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- No CSV cell changed in this batch. The active file and byte-identical
  pre-batch backup both match the prior checkpoint.

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17815 | 59005 | The tale title and capture synopsis are retained, but `Maid` may be a named/formal title. Korean `처녀` differs from `시녀` for the same Maid of Windemere at 59334; do not normalize either form without resolving the title. |
| D-17815 | 59008 | The agreed killing, treasure, and location are preserved. Korean specifies betrayal as Delf's crime; Japanese supports betrayal, while English and Chinese use broader wrongdoing against his bandit kin. |
| D-17815 | 59010 | English deliberately leaves open whether the dangerous person's mind, knowledge, or thoughts contain the secret to entering Alabastra. Korean preserves a literal mind reading; the referent remains unresolved. |
| D-17815 | 59011 | The lightning/Aodh/fire/Sedeas/ice analogy is retained; Korean makes the implied symbolic relationship explicit, while names and elemental status remain unverified. |
| D-17815 | 59012 | English/Chinese `books` is broad, while Japanese and Korean interpret Agni's records as ledgers. The match/troll context does not conclusively establish the document type. |
| D-17815 | 59014 | `Cann-Rane` is rendered with English in parentheses; spelling and inconsistent bilingual name annotation remain open. |
| D-17815 | 59015 | `Anru Besin` is rendered without English in parentheses, unlike adjacent names; no individual form is wrong, but the display convention remains unresolved. |
| D-17815 | 59021 | The title-like `Death's Cryptic Hand` is preserved component-wise, but `죽음의 수수께끼 손` may read awkwardly; item/ability context is needed before retitling. |
| D-17815 | 59022 | The vault, stolen Heart, advance party, and southern pass are preserved; Castellan/Oathblade title forms and exact Wolds geography need terminology/context review. |
| D-17815 | 59044 | `Pedeoras` is traceable with an English parenthetical; canonical spelling and bilingual annotation consistency remain open. |
| D-17815 | 59047 | `Potential, Realized` is rendered naturally as `실현된 잠재력`, but its status as a skill, achievement, or other UI title is unknown. |
| D-17815 | 59050 | The entry, search, and release objective for Agarth are preserved; Korean spellings for Madding Wind and Agarth remain provisional. |

## Not an Issue

Decision D-17816 records these 38 IDs: 59001-59004, 59006-59007, 59009,
59013, 59016-59020, 59023-59043, 59045-59046, and 59048-59049. The
Rathir verse at 59024 preserves its sea, stone, gold/magic, and whisper/door
images. At 59032 all three localized Balor/claws/dodging markers are present
in order. At 59038, `결속력` naturally conveys the warriors' lack of shared
cohesion; neither row warrants a correction.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 59001-59050 once
  in ascending order. Key-start scans found 50 rows in every locale.
- Reconciled historical prompts for IDs 58950-59049, including the Hero and
  Maid, Brother Delf, the Alabastra secret, Aodh/Sedeas, Agni's records,
  Death's Cryptic Hand, Castellan/Oathblade and the Rathir poem, Balor
  markers, group cohesion, and `Potential, Realized`. Unresolved meaning,
  titles, and proper-name display remain uncertain, not accepted edits.
- Embedded newline counts match throughout the range. At 59032 all three
  `{*1...}` marker identities and localized payloads remain in the same
  order. The 10% melee value at 59033 is unchanged; no other numeric or
  structural discrepancy was found.
- The system Ruby CSV parser stops at an existing unquoted multiline cell
  near physical line 11029. No parser workaround or newline normalization
  was applied; Korean targets were checked by ID-start rows and the
  translation map.
- Pre-edit and post-edit active CSV SHA-256:
  `f55e5d6ffbff7616d5879fc6b79513006e57b3a097201f46f691c757e4ee7b18`.
  No translation cell changed. The UTF-8 BOM, key/order baseline, record
  count, and established line-ending distribution remain unchanged.
- Byte-identical pre-batch backup:
  `/private/tmp/ko-translate-backups/20261011/before-59001/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `f55e5d6ffbff7616d5879fc6b79513006e57b3a097201f46f691c757e4ee7b18`).

D-17815 records 12 uncertain IDs; D-17816 records the remaining 38
`not an issue` IDs. Direct register totals: 1,719 accepted, 12,865
`not an issue`, and 11,242 uncertain (25,826 total); next D-17817.

Resume at `default` ID 59051; 6,084 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
