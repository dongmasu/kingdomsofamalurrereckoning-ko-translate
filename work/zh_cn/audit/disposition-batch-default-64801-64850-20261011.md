# Disposition Batch: `default` IDs 64801-64850

- Date: 2026-10-11. Rechecked all 50 Korean rows by aligning the English,
  Japanese source, Chinese source, Japanese draft, and Korean working CSVs
  on `ID_Linha`; checked historical findings and established terminology.
- Two accepted targeted corrections, 35 `not an issue` IDs, and 13
  uncertain findings. These are working dispositions, not independent
  linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18143 | 64834 | `문이 열렸어.` | `문이 잠겨 있지 않아.` | English `The door's unlocked` and Japanese `鍵はかかっていない` state that the door is unlocked, not that it has been opened. |
| D-18143 | 64841 | `여전히 미타루의 인도를 구하는군. 우리 중 가장 강한 자도 때로는 도움이 필요하지.` | `여전히 미사루의 인도를 구하는군. 우리 중 가장 강한 자도 때로는 도움이 필요하지.` | `Mitharu = 미사루` is established by the official Korean manual and accepted decision D-152; this row names the deity, not Mitharan people/material. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18144 | 64801 | `Eldest` is preserved as a name/title, but the group or role meant by this capitalized term is not established. |
| D-18144 | 64805 | The English capitalized `Testament` conflicts with Japanese and Chinese readings as the Belen covenant; the intended name/referent remains unresolved. |
| D-18144 | 64811 | `Guyana,Republic of` is malformed and appears legacy/test-like; retain the translated source wording pending UI/context confirmation. |
| D-18144 | 64813 | `Libyan Arab Jamahiriya` is a legacy state name and the Japanese locale shortens it to Libya; retain the English-led wording pending source/UI context. |
| D-18144 | 64816 | `School of Hard Knocks` may be an idiom for learning through hardship rather than a literal school; context is insufficient to choose an idiomatic Korean form. |
| D-18144 | 64818 | `Pulled a bad job` may mean botched a task or took an undesirable job; Korean follows the failure reading supported by Japanese, but the exact sense is not settled. |
| D-18144 | 64820 | `Scavs` may be a named creature type rather than generic scavengers; preserve the source-like term pending game/lore context. |
| D-18144 | 64831 | `Henge` is retained phonetically; the artifact's canonical Korean term is not established by the row. |
| D-18144 | 64833 | The sequence is preserved, but canonical Korean spellings for Faitir and Codex Scaith remain open for corpus-wide name review. |
| D-18144 | 64837 | `Cells` may mean prison cells or compartments in a vault; the Korean room reading is plausible but not settled by this isolated entry. |
| D-18144 | 64844 | Lowercase `a telling` may be a generic narrative or a lore concept related to capitalized `The Telling`; retain the current ordinary-story wording pending terminology context. |
| D-18144 | 64846 | `Rank` and the tease about standing in the speaker's shoes may refer to promotion or succession to an office; `계급` is retained pending role context. |
| D-18144 | 64847 | `Hex` may be a named dice face/value; locales disagree between preserving the term and interpreting it as six. |

## Not an Issue

Decision D-18145 records these 35 IDs: 64802-64804, 64806-64810, 64812,
64814-64815, 64817, 64819, 64821-64830, 64832, 64835-64836, 64838-64840,
64842-64843, 64845, and 64848-64850. Their current translations preserve
available meaning and register. English governs the conflicting role-
disclosure reading at 64835 and the two save-data choices at 64838.

## Structural and Historical Reconciliation

- The direct ID-aligned comparison found 65,135 rows in each of the five
  locale/draft CSVs and all 50 reviewed IDs in ascending order.
- ID 64830 retains its three-paragraph layout, fourth consecutive kill,
  +60% Total Damage, 12-second duration reset per kill, and 30% Mana cost.
  No runtime markers or numeric values were changed.
- Rechecked source-keyed questions for Testament, scavs, Battle Frenzy,
  Henge, Codex Scaith, role disclosure, vault cells, Telling, and dice terms.
- Only the `Texto` cells at IDs 64834 and 64841 changed. UTF-8 BOM, 65,135
  data rows, key order, and existing 72,012 CRLF/72 bare-LF endings remain
  intact. Byte-identical batch-start backup:
  `/private/tmp/ko-translate-backups/20261011/before-64801/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `613fedf52fc2faa70afe234c3487102823c69aabca465af26a22b5c1c6f24cbc`.
  Post-edit SHA-256:
  `320843d3272835813e15512503ba4ac6a41a91ab6a06825161c461337eef6d7e`.

- D-18143 records two accepted corrections, D-18144 records 13 uncertain
  findings, and D-18145 records 35 `not an issue` IDs. Cumulative register
  counts through D-18145: 1,851 accepted, 17,010 `not an issue`, and 12,794
  uncertain (31,655 dispositions); next D-18146.

Resume at `default` ID 64851; 284 IDs remain through ID 65134. These are
working dispositions, not independent linguistic approval.
