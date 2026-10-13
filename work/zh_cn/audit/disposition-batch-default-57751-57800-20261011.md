# Disposition Batch: `default` IDs 57751-57800

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- No accepted corrections, 29 `not an issue` IDs, and 16 uncertain findings
  covering 21 IDs.
- Language references are the immutable sources in `src/csv/en_us/`,
  `src/csv/ja_jp/`, and `src/csv/zh_cn/`. `work/ja_jp/` is a Korean
  migration draft, not the Japanese-language reference.

## Accepted Corrections

No translation CSV cells were changed. Uncertain readings and terminology
were retained for later review.

## Uncertain Findings

| Decision | ID(s) | Rationale |
| --- | ---: | --- |
| D-17391 | 57751 | Gorhart is clearly the destination, but its canonical Korean spelling has not been established; retain `고어하트`. |
| D-17392 | 57752 | Korean's `공격 모드` matches ID 57708 and preserves the toggle behavior; the canonical Korean UI term for aggressive/hostile mode remains open. |
| D-17393 | 57753 | English and Chinese say Khamazandu's crown; Japanese specifically says a tree canopy. Korean retains the literal crown reading pending scene context. |
| D-17394 | 57755-57758 | Kollossae, Adath Skoria, Enion, and Scholia Arcana are identifiable, but transliterations and whether Scholia Arcana is an academy/title need terminology alignment. |
| D-17395 | 57762 | English says “their confirmation,” Japanese says divine approval, and Chinese says divine affirmation. Korean's `응답` may shift this to a response rather than confirmation/approval. |
| D-17396 | 57764 | English names the Hierophant, Japanese uses a “guide” term, and Chinese identifies a high priest; the entity/title and Korean term remain unresolved. |
| D-17397 | 57765 | English and Chinese identify the first Victory Games arena; the Japanese source has a malformed ordinal phrase. Korean preserves the clear event meaning, but the canonical event name and arena-title rendering remain open. |
| D-17398 | 57766-57767 | Evenroots, Firstsworn, Cempestre Lyana, and Desert Runner are lore/item terms; current Korean preserves the propositions but canonical forms need alignment. |
| D-17399 | 57771 | Storyteller and capitalized Telling appear to be formal Court of Summer roles/traditions; Korean distinguishes them but uses a generic story term for Telling. |
| D-17400 | 57773 | English's “the man he longed to be” is ambiguous between a human and an aspired-to identity. Chinese supports the human reading, while Japanese omits that distinction; Korean retains `인간처럼` provisionally. Creth, Airmer, and Nix spellings also need alignment. |
| D-17401 | 57783 | The item/index label `Century Flower 1` and numeral are preserved, but the canonical Korean plant/item name is not established. |
| D-17402 | 57787 | `Clarity` may mean spiritual insight or understanding; Korean `깨달음` is plausible, but the exact devotional sense needs context. |
| D-17403 | 57789 | Gwastl Brad's name is retained phonetically; the canonical Korean spelling is unconfirmed. |
| D-17404 | 57792 | The Crows are the same capitalized team as at 57726; retain `까마귀단`, with the unresolved team-name issue linked to D-17383. |
| D-17405 | 57795 | Caeled Coast's defense and the speaker's uncertainty are preserved; the Korean place-name spelling needs consistency review. |
| D-17406 | 57798-57799 | Truesworn and the Withering War appear to be formal group/event names. Korean retains the tale and enchantment-versus-curse contrast, but canonical forms remain unresolved. |

## Not an Issue

The 29 IDs are 57754, 57759-57761, 57763, 57768-57770, 57772,
57774-57782, 57784-57786, 57788, 57790-57791, 57793-57794, 57796-57797,
and 57800. They preserve the evident meaning and voice. This includes the
Vagabonds' threat, the prison-key offer, the switch/door instruction, the
pledge ultimatum, the full-team arena challenge, and the warning about Dren.
The source typo `magnificant` at 57760 is not reproduced in Korean.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 57751-57800 once
  and in identical ascending order; each full default file has 65,135 data
  records.
- Newline counts match across all four locales throughout this range.
- At 57752 all locales preserve `{1}`, localized `{*1...}`, one
  `{LINE_SPACE}`, and `{2}` in the same order. Korean retains the same
  `공격 모드` wording as 57708.
- The numeral `1` in `Century Flower 1` is preserved in all four locales.
  The malformed Japanese ordinal at 57765 is not converted into a different
  event count; English and Chinese support the Korean “first arena” reading.
- Rechecked applicable historical prompts for IDs 57750-57849, including
  the aggressive-mode toggle, Khamazandu's crown/canopy, Scholia Arcana,
  divine confirmation, Hierophant, Victory Games, Evenroots, Firstsworn,
  Nix, Telling, Caeled Coast, and Truesworn/Withering War.
- The byte-identical pre-batch backup is
  `/private/tmp/ko-translate-backups/20261011/before-57751/locatexts_zh_cn.koalocatext_default.csv`.
  No translation CSV cell changed. The active CSV retains its UTF-8 BOM,
  65,135 records, key order, 72,045 CRLF endings, and 39 pre-existing bare
  LF endings.
- Active default CSV SHA-256 remains
  `e853b47160e5cd3670a35d213563388eb41c0ee27e20ec047f733db4ded304f7`.

D-17391 through D-17406 record the 16 uncertain findings; D-17407 records
the remaining 29 `not an issue` IDs. Direct register totals: 1,702 accepted,
12,087 `not an issue`, and 10,821 uncertain (24,610 decisions total); next
D-17408.

Resume at `default` ID 57801; 7,334 IDs remain through ID 65134. Findings
are working dispositions, not independent final linguistic approval.
