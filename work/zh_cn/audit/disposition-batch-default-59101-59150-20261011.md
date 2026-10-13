# Disposition Batch: `default` IDs 59101-59150

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- One accepted correction, 38 `not an issue` IDs, and 11 uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- The active CSV matched the preceding checkpoint before the edit and was
  backed up byte-for-byte.

## Accepted Correction

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-17820 | 59144 | `에스윈 시장의 계획` | `시장의 계획` | English, Japanese, and Chinese distinguish the mayor's agenda from the instruction to return to Eswin. The Korean had added the unsupported identity `Eswin = mayor`; remove only that apposition. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17821 | 59101 | The salvation objective and Cradle of Summer are retained, but `Amman's hollow of Syl` has a compact, unclear name/place relation across references and the Korean stacks genitives awkwardly. |
| D-17821 | 59107 | Osduin's death and the lost retelling are clear; whether “The Flowering” is a formal ceremony title needs setting context. |
| D-17821 | 59114 | Korean follows English and Chinese (`western woods`); Japanese says eastern woods. Preserve the primary-source reading and record the cross-locale direction conflict. |
| D-17821 | 59115 | The “newspaper, not yet implemented” status is translated accurately; whether this developer/UI-like line is intended for player display remains unknown. |
| D-17821 | 59118 | `Bull in a China Shop` is idiomatic and likely implies clumsiness/lack of tact. Korean `난폭한 자` retains roughness but may lose the idiom's central image; its title/label function needs context before retitling. |
| D-17821 | 59129 | Both localized Lorestone markers, `{LINE_SPACE}`, and the permanent set bonus are preserved; canonical Korean UI terminology remains unsettled. |
| D-17821 | 59131 | The relation between the beggars and the name Beggar's Bluff is preserved, but Korean `허세` may lose the cliff/location sense supported by Japanese and Chinese. A Korean form that preserves the place name and wordplay needs context. |
| D-17821 | 59132 | Captain Koch's greeting and wine/pleasure-hall image are retained; whether the halls are a formal venue/name remains unresolved. |
| D-17821 | 59143 | The Great Cycle, permanent-rest curse, and surviving names are retained. `All gone` may mean dead or absent; Korean preserves the ambiguity as `사라졌어`. |
| D-17821 | 59147 | The kill objective is clear; `Scavs` appears capitalized as a creature/group name, but its canonical Korean form is unverified. |
| D-17821 | 59150 | Mitharu's eventual liberation and great plan are preserved. The Korean honorific is plausible; canonical name spelling and deity-reference convention remain open. |

## Not an Issue

Decision D-17822 records these 38 IDs: 59102-59106, 59108-59113,
59116-59117, 59119-59128, 59130, 59133-59142, 59145-59146, and 59148-59149.
At 59140, `두 다리로 걷는 자들` preserves the “two-leg” naming joke and the
strength-eating wood description. At 59129 the marker identities/order and
permanent-bonus meaning are intact; only canonical term selection remains
uncertain.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 59101-59150 once
  in ascending order. Key-start scans found 50 rows in every locale.
- Reconciled historical prompts for IDs 59050-59149, including Amman/Syl,
  the Flowering, grove guardians, the west/east direction conflict, Bull in
  a China Shop, Lorestone markers, Beggar's Bluff, Crownhold halls, Leechwood,
  Beyond the Veil/Great Cycle, and the mayor's agenda. Unresolved questions
  remain uncertain; the source-supported mayor/Eswin relation is corrected.
- Embedded newline counts match throughout this batch. The two localized
  Lorestone markers and `{LINE_SPACE}` at 59129 preserve identity and order;
  no numeric-value discrepancy was found.
- The system Ruby CSV parser stops at an existing unquoted multiline cell
  near physical line 11029. No parser workaround or newline normalization
  was applied; Korean targets were checked by ID-start rows and the
  translation map.
- Pre-edit CSV SHA-256:
  `92d76ca676e4a4e945811a5f8ef71ddd961dfe6decbf2712f30ea2429981e35b`.
- Post-edit CSV SHA-256:
  `5701579c2802da8dc27fa21a36bd279e22a4c990b7735dbf40ce15301e3bbae3`.
  Byte comparison against the backup confirms that only the approved 59144
  `Texto` cell changed. UTF-8 BOM, key/order baseline, 65,135 IDs, 72,045
  CRLF endings, and 39 pre-existing bare-LF endings are preserved.
- Byte-identical pre-batch backup:
  `/private/tmp/ko-translate-backups/20261011/before-59101/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `92d76ca676e4a4e945811a5f8ef71ddd961dfe6decbf2712f30ea2429981e35b`).

D-17820 authorizes one correction; D-17821 records 11 uncertain IDs;
D-17822 records the remaining 38 `not an issue` IDs. Direct register totals:
1,721 accepted, 12,945 `not an issue`, and 11,260 uncertain (25,926 total);
next D-17823.

Resume at `default` ID 59151; 5,984 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
