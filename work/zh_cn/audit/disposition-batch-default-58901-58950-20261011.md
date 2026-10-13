# Disposition Batch: `default` IDs 58901-58950

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- One accepted correction, 38 `not an issue` IDs, and 11 uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- The stale hash in the preliminary scan was not used. The active CSV matched
  the preceding checkpoint before editing and was backed up byte-for-byte.

## Accepted Correction

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-17810 | 58917 | `이 사람들은 전쟁에 금화를 대면서 난민에게 침을 뱉어. 바보와 위선자들, 그리고... 내 아버지를 위한 마을이야.` | `이 사람들은 전쟁에 금화를 대면서 난민에게 침을 뱉어. 바보와 위선자들로 가득한 마을이야. 그리고... 내 아버지도 그중 하나지.` | English's `a town for fools and hypocrites and ‒ my father`, Japanese's list of people in the town, and Chinese's `town full of` fools and hypocrites all include the father in the accusation. The old Korean instead made the town something intended for the father. The correction restores the accusation and preserves the speaker's hesitation. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17811 | 58901 | The three-part Lore help, collectible-area Experience bonus, and markers are preserved; canonical Korean UI terms and the exact reward distinction need terminology verification. |
| D-17811 | 58903 | All localized equipment/socket/gem markers are present in Korean source order. Japanese alone orders socket before equipment; record this locale exception without reordering Korean. |
| D-17811 | 58906 | The Longinous name and Korean spelling remain unverified; the spear's image/modeling and world-piercing apposition attach differently across references. |
| D-17811 | 58914 | The recipe effect, Alchemy Workbench, three ingredients, quantities, and four-line layout are retained; Korean ingredient names remain provisional. |
| D-17811 | 58919 | The human/Fae contrast and request for resting facilities are clear, but the literal Korean rendering of `flesh and blood folks` may not convey the idiom naturally. |
| D-17811 | 58929 | All 13 displayed poem lines and the speaker's seduction/lost-state arc remain; several archaic bodily, burial, and sexual metaphors are deliberately obscure. |
| D-17811 | 58931 | The Chaos Armor condition and regular-attack strategy are preserved with both tutorial markers and paragraph layout; canonical Korean combat terms remain to be checked. |
| D-17811 | 58933 | Korean preserves the threat and separate Wolf Pack paragraph, matching English and Chinese. Japanese omits the paragraph break; retain this as a source-locale structure exception. |
| D-17811 | 58934 | The English starts mid-sentence and has internal gaps. Korean preserves the fragments, ellipses, and paragraph sequence; antecedents, identities, and omitted text remain unresolved. |
| D-17811 | 58943 | The contemptuous refusal and odor insult remain, but `먼지 청소부` may sound like a neutral occupation rather than the source's derogatory description. |
| D-17811 | 58949 | The hypothesis, mine-search suggestion, and player verification task are retained; Apotyre's canonical spelling and display form remain open. |

## Not an Issue

Decision D-17812 records these 38 IDs: 58902, 58904-58905, 58907-58913,
58915-58916, 58918, 58920-58928, 58930, 58932, 58935-58942, 58944-58948,
and 58950. These rows preserve the evident first-read meaning, voice/register,
and applicable formatting.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean contain IDs 58901-58950 once in
  ascending order. Key-start scans found 50 rows in each locale; the English,
  Japanese, and Chinese CSV parsers also returned all 50 source rows.
- Rechecked historical prompts for IDs 58850-58949, including Lore UI,
  marker order, Longinous, recipe names, the refugee/father accusation,
  idiom/Fae contrast, poem, Chaos Armor, Wolf Pack threat, interrupted
  Ethene history, scavengers, and Apotyre. Open terminology/context questions
  remain uncertain rather than being silently normalized.
- At 58903 the Japanese localized marker payload order differs from English,
  Chinese, and Korean. At 58933 Japanese omits the paragraph break present in
  English, Chinese, and Korean. Korean preserves the markers at 58901,
  58903, 58931, and 58936; quantities and layout at 58914; poem lineation at
  58929; tutorial markers at 58931; and source fragments/paragraphs at 58934.
- The system Ruby CSV parser stops at an existing unquoted multiline cell
  near physical line 11029, well before this batch. No parser workaround or
  newline normalization was applied; target Korean rows were checked by
  their ID-start lines, and the translation map was cross-checked for
  multiline targets.
- Pre-edit CSV SHA-256:
  `ff2bbb1c0f40ddc1ff78cc5834f4d479416ec3cbdc9a8b7e65325d295ff1a01e`.
- Post-edit CSV SHA-256:
  `f55e5d6ffbff7616d5879fc6b79513006e57b3a097201f46f691c757e4ee7b18`.
  Byte comparison against the backup confirms that only the approved 58917
  `Texto` cell changed. UTF-8 BOM, key/order baseline, 65,135 IDs, 72,045
  CRLF endings, and 39 pre-existing bare-LF endings are preserved.
- Byte-identical pre-batch backup:
  `/private/tmp/ko-translate-backups/20261011/before-58901/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `ff2bbb1c0f40ddc1ff78cc5834f4d479416ec3cbdc9a8b7e65325d295ff1a01e`).

D-17810 authorizes one correction; D-17811 records 11 uncertain findings;
D-17812 records the remaining 38 `not an issue` IDs. Direct register totals:
1,719 accepted, 12,791 `not an issue`, and 11,216 uncertain (25,726 total);
next D-17813.

Resume at `default` ID 58951; 6,184 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
