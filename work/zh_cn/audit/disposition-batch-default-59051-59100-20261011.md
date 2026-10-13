# Disposition Batch: `default` IDs 59051-59100

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- One accepted correction, 42 `not an issue` IDs, and seven uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- The active CSV matched the preceding checkpoint before the edit and was
  backed up byte-for-byte.

## Accepted Correction

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-17817 | 59051 | `에세네의 빛` | `에테네의 빛` | The same English name `Ethene` is rendered `에테네` in Korean lore at 58934. English, Japanese, and Chinese confirm this is the same deity/name; align the inconsistent Korean transliteration locally without making a global replacement. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17818 | 59055 | Fate and Reckoning Mode markers, hold instruction, buttons, and order are preserved; the Korean mode name varies elsewhere and needs a terminology decision. |
| D-17818 | 59057 | English/Japanese treat `Glass` as a name or title, while Chinese interprets it as a mirror; the isolated line has no context to disambiguate it. |
| D-17818 | 59059 | The request against the Testament is clear, but Korean `유언 결사` conflicts with `베일렌 결사` at 58994 and the wider Testament/Belen source-name conflict. |
| D-17818 | 59063 | The Summer Court rogue is characterized as `most treasured`; Korean says `most beloved`. Japanese supports an affectionate reading, but value versus affection remains a nuance. |
| D-17818 | 59068 | English says `Cliffbreak Fasting`, Japanese describes an underground passage, Chinese a passage, and Korean uses `패스`; place/objective identity and source spelling remain unsettled. |
| D-17818 | 59085 | `Gone` could mean dead or departed. The mother's following saying hints at death, but English, Japanese, and Chinese do not settle the referent. |
| D-17818 | 59100 | Preserve the 12 displayed lines and 11 newlines; the English has mismatched quotation marks and broken syntax. Korean follows the sequence without inventing repairs to the source. |

## Not an Issue

Decision D-17819 records these 42 IDs: 59052-59054, 59056, 59058,
59060-59062, 59064-59067, 59069-59084, and 59086-59099. This includes
59090: English and Japanese clearly mean vomiting/nausea, and Korean
`토할 것 같아` is accurate; the Chinese “I give up” reading is not followed.
At 59091, all three runtime variables remain present and ordered as
`{3}`, `{1}`, `{5}`.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 59051-59100 once
  in ascending order. Key-start scans found 50 rows in every locale.
- Reconciled the source-keyed historical prompts for IDs 59050-59149,
  including Ethene, House Anwon, Glass, Cliffbreak Fasting, Lyria's saying,
  Testament, the mana-steal variable, the Widow, and the Erathi quotation.
  Open terminology and context questions remain uncertain rather than being
  silently normalized.
- At 59051, `Ethene` now consistently uses the in-project `에테네` form
  already present at 58934. The markerized Reckoning Mode instruction at
  59055, variables at 59091, cost variable at 59074, and 12-line quotation
  at 59100 retain their source identities and structure.
- Embedded newline counts match throughout the batch. No key, variant,
  numeric, or row-order change was made.
- The system Ruby CSV parser stops at an existing unquoted multiline cell
  near physical line 11029. No parser workaround or newline normalization
  was applied; Korean targets were checked by ID-start rows and the
  translation map.
- Pre-edit CSV SHA-256:
  `f55e5d6ffbff7616d5879fc6b79513006e57b3a097201f46f691c757e4ee7b18`.
- Post-edit CSV SHA-256:
  `92d76ca676e4a4e945811a5f8ef71ddd961dfe6decbf2712f30ea2429981e35b`.
  Byte comparison against the backup confirms that only the approved 59051
  `Texto` cell changed. UTF-8 BOM, key/order baseline, 65,135 IDs, 72,045
  CRLF endings, and 39 pre-existing bare-LF endings are preserved.
- Byte-identical pre-batch backup:
  `/private/tmp/ko-translate-backups/20261011/before-59051/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `f55e5d6ffbff7616d5879fc6b79513006e57b3a097201f46f691c757e4ee7b18`).

D-17817 authorizes one correction; D-17818 records seven uncertain IDs;
D-17819 records the remaining 42 `not an issue` IDs. Direct register totals:
1,720 accepted, 12,907 `not an issue`, and 11,249 uncertain (25,876 total);
next D-17820.

Resume at `default` ID 59101; 6,034 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
