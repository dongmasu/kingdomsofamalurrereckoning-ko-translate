# Disposition Batch: `default` IDs 59751-59800

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, preliminary
  findings, source-keyed historical questions, terminology, line breaks,
  markers, and numeric values. These are working dispositions, not
  independent final linguistic approval.
- Zero accepted corrections, 33 `not an issue` IDs, and 17 uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- The active CSV was backed up byte-for-byte before disposition; no CSV
  cells were changed in this batch.

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17867 | 59753 | English has the typo “This books”; Korean preserves expert binding and flawless handwriting, but the source's agreement error and the most natural Korean subject construction need a language-edit pass. |
| D-17867 | 59757 | `Braces` may mean structural supports or straps; Korean's `지지대` follows Japanese while Chinese suggests a strap. |
| D-17867 | 59758 | `Fighter 01 Reckoning` may be an internal/test label; do not localize or normalize until its player-facing status is known. |
| D-17867 | 59760 | The six-line doom poem retains its sequence and speaker/listener relation; final poetic voice and line-level imagery need a dedicated pass. |
| D-17867 | 59763 | English `solf leather` may be a source typo or a material name; Japanese suggests wolf skin, Chinese generic leather, and Korean conservatively transliterates the source. |
| D-17867 | 59764 | Setter's epithet is preserved, but the exact named location meant by Hall of Appointments remains unclear. |
| D-17867 | 59765 | The source shifts from one artifact to plural `These`; Korean preserves that shift rather than silently regularizing it. |
| D-17867 | 59769 | Korean preserves the prison key and return/unlock sequence, but whether the target is the prison facility, cell, or cage is unresolved. |
| D-17867 | 59782 | Lowercase `mission` may refer to religious work or an institution; Korean's `선교 사업` is plausible, but Japanese and Chinese differ. |
| D-17867 | 59783 | `straight` may be a typo for `strait` or an idiom; the geographic reading and Tarrick's boast need context. |
| D-17867 | 59785 | English says breaking free of Mel Senshir, Japanese says the siege was lifted, and Chinese says leaving the city; resolve the historical event before changing the verb. |
| D-17867 | 59786 | The glyph resealing timing/order warning and all-glyph condition are retained; validate against the puzzle mechanic. |
| D-17867 | 59787 | Klurikon's campaign-state wording and the proper-name treatment of House of Pride remain unclear; Korean retains the source's broad acquisition/victory sense. |
| D-17867 | 59788 | Colet and the Echoes is explicitly an ensemble name in English/Chinese; whether Korean should preserve or translate that name is a naming-policy question. |
| D-17867 | 59793 | The canonical rendering and proper-name status of Crofter's Falls are unverified. |
| D-17867 | 59795 | The quantity-based reward condition is preserved; the twins/competition context remains a terminology and scene-context question. |
| D-17867 | 59799 | The Maid's song riddle is retained; Japanese's repeated Maiden of Windemere form raises an unresolved title/song interpretation. |

## Not an Issue

Decision D-17868 records these 33 IDs: 59751-59752, 59754-59756,
59759, 59761-59762, 59766-59768, 59770-59781, 59784, 59789-59792,
59794, 59796-59798, and 59800. These rows preserve evident meaning,
register, values, and structure; no supported targeted correction was
established.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain the 50 target IDs
  exactly once and in ascending order. All four full resources contain
  65,135 records with matching key order.
- Rechecked historical prompts for the concert, book description,
  Japanese-only numeral at 59754, Fighter 01 label, six-line poem, solf
  leather/Ariel Perien, Setter/Hall of Appointments, artifact number shift,
  Whitestone prison/cage, Father Dynwel's mission, Tarrick/straight,
  Mel Senshir, glyph resealing, House of Pride, Colet and the Echoes,
  Crofter's Falls, antelope race, and the Maid's song riddle.
- Embedded newline counts match. ID 59760 retains five embedded newlines
  (six lines). No runtime markers occur in this batch. The `01` label at
  59758 and recipe quantity `2` at 59777 are preserved; Japanese alone
  adds a semantically redundant numeral at 59754.
- Pre-edit and post-disposition CSV SHA-256:
  `6c99e14cd030efea39ef70b94e6ac00cb1893beee359113bbbc1d4b0eb9e2292`.
  No bytes changed. UTF-8 BOM, 65,135 records, key order, 72,045 CRLF
  endings, and 39 pre-existing bare-LF endings remain preserved.
- Byte-identical pre-batch backup:
  `/private/tmp/ko-translate-backups/20261011/before-59751/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `6c99e14cd030efea39ef70b94e6ac00cb1893beee359113bbbc1d4b0eb9e2292`).

D-17867 records 17 uncertain findings and D-17868 records the remaining
33 `not an issue` IDs. Direct register totals: 1,740 accepted, 13,448
`not an issue`, and 11,392 uncertain (26,580 dispositions total); next
D-17869.

Resume at `default` ID 59801; 5,334 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
