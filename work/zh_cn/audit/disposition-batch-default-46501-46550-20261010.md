# Disposition Batch: `default` IDs 46501-46550

- Date: 2026-10-10. Compared active Korean against English meaning, Japanese
  voice/register, Chinese supporting evidence, source-keyed historical
  questions, and accepted terminology. This is a working disposition pass,
  not independent final linguistic approval.
- Decisions: one accepted, six uncertain, and one grouped `not an issue`
  disposition covering the other 39 IDs.
- CSV edit: ID 46520.

| ID | Decision | Rationale |
| ---: | --- | --- |
| 46509 | Uncertain | English leaves `they` unspecified; Japanese identifies the Tuatha, while Chinese and Korean retain the unspecified plural. Preserve the English ambiguity until scene context establishes the referent. |
| 46511 | Uncertain | `The Ariad` is retained phonetically, but Japanese calls it a unit/group and the other locale labels do not settle whether it is a faction, vessel, or another entity. |
| 46516 | Uncertain | The altar's final-step purpose and relinquishing gained wisdom are preserved, but `Regression` appears to be a lore/rite term whose canonical Korean rendering is not established. |
| 46518 | Uncertain | The separate `Domus Politica` sign-off and discreet transaction-record instruction are preserved. Japanese and Chinese render the signature as generic civic/institutional terms, so its exact identity and Korean form remain unresolved. |
| 46520 | Accepted | Change `이사에서는` to `이사(Ysa)에서는`, following accepted decision D-14182, which identifies Ysa as the proper-name destination rather than common-noun `이사`. |
| 46527 | Uncertain | Both paragraphs, the attraction/embrace sequence, and the source's sensual adult tone remain. The passage is highly literary, and exact voice/image choices need contextual review before further editing. |
| 46537, 46541, 46544, 46548, 46550 | Uncertain | Fennwrac, Pledgeshield Bolton, Kollossae Might, Mitharan Rallying Rivets, Hugues, Saltwell Mines, and Allestar Tower are traceable, but their canonical Korean spellings/technical forms remain unsettled across the corpus. |
| 46501-46550 excluding the IDs above | Not an issue | The remaining meanings and structures are preserved. `Tragedians` is supported as performers by the English reference to performing for audiences and the Chinese translation; the burning-up line, travel extortion, faction dialogue, UI labels, gameplay effects, and source chronology remain intact. No further supported row-local correction was identified. |

Decision IDs D-14215 through D-14222. Direct register totals after this
batch: 1,434 accepted, 4,630 `not an issue`, and 8,192 uncertain (14,256
categorized dispositions). The next decision ID is D-14223.

CSV SHA-256 before editing:
`77255f46d3f028a68fa321b30cd078aaa76560831664065d0868723b0472902c`.
CSV SHA-256 after editing:
`36b266ace78072a362a86423f2f2d5cb1552f9d1965cc517787d60555e3513d5`.
The UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings
are preserved. English, Japanese, Chinese, and Korean each contain IDs
46501-46550 once in ascending order; line-break counts and runtime-token
identities match. ID 46518's separate signature paragraph and both
paragraphs of ID 46527 are retained.

## Accepted Correction

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 46520 | `이리 와. 이사에서는 낯선 이를 받아들이지 않아. 이 도시에서는 모두가 한 가족이지. 평화 칙령을 피해 가려면 목소리를 낮춰야 할 거야.` | `이리 와. 이사(Ysa)에서는 낯선 이를 받아들이지 않아. 이 도시에서는 모두가 한 가족이지. 평화 칙령을 피해 가려면 목소리를 낮춰야 할 거야.` | Reuse the previously accepted proper-name form at D-14182 and distinguish the city name from the common noun `이사`. |
