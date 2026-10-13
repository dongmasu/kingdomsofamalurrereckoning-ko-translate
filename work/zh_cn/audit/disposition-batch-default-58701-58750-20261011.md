# Disposition Batch: `default` IDs 58701-58750

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- No accepted corrections, 38 `not an issue` IDs, and 12 uncertain IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- The pre-batch CSV matched the preceding checkpoint and was backed up
  byte-for-byte before disposition. No translation CSV cells changed.

## Accepted Corrections

No translation CSV cells were changed. Open terminology and context questions
remain uncertain; the English-led readings with no demonstrated defect are
recorded as `not an issue`.

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17747 | 58712 | The instruction to contact the Eldest is clear, but Korean says to meet them; Damalroc and the title/name form also need context. |
| D-17748 | 58713 | Second-floor location and research are preserved; whether `mission` denotes a religious mission or another organization, and the bunkhouse term, remain open. |
| D-17749 | 58716 | All five lines and the creation sequence are retained; the final growth image, capitalization, and lore names need context before literary normalization. |
| D-17750 | 58720 | `Travelers` is capitalized as a group name; the Korean transliteration is plausible, but formal faction treatment is not globally settled. |
| D-17751 | 58722 | The Tuatha Deohn/Lord Ohn name-derivation claim is preserved; canonical faction, person, and title forms remain provisional. |
| D-17752 | 58726 | The farewell is formal and Beckoned is retained as `부름받은 자`; the player-title rendering remains provisional. |
| D-17753 | 58736 | The terse `First leg` label is rendered as `첫 번째 구간`; race-stage, round, and generic-segment readings cannot be distinguished without UI context. |
| D-17754 | 58737 | The theft objective, item, temple, and blessing are retained per English; Japanese adds a camp recipient absent from English, and item/place forms remain provisional. |
| D-17755 | 58738 | The next-chapter claim and extended memoir description are retained; the Praetorian Garrison title and exact `waxing on` nuance need context. |
| D-17756 | 58742 | English/Chinese support a blade reading while Japanese reads a mercenary rank; Oathblade's item/title sense remains unresolved. |
| D-17757 | 58749 | The lower-tier alchemy potion and purpose are retained; capitalization suggests a named item, but its canonical Korean item name is not established. |
| D-17758 | 58750 | `전하` is a plausible formal address, but English `your grace` and Japanese/Chinese honorifics differ; speaker/addressee rank is unavailable. |

## Not an Issue

Decision D-17759 records these 38 IDs: 58701-58711, 58714-58715,
58717-58719, 58721, 58723-58725, 58727-58735, 58739-58741, and
58743-58748. These rows
preserve the evident English meaning and Korean register without unsupported
additions. At 58704 Korean correctly reads the second question as an idiom
about baffling Fae behavior, not as doing “only half” of their actions.
The timer and progress values at 58710, second-floor value at 58713, and
controller token at 58744 are retained.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 58701-58750 once
  and in ascending order; the full resources contain 65,135 records with
  matching key order.
- The creation verse at 58716 retains four embedded line breaks in all
  locales. `{2}` and `{1}/{2}` at 58710 retain identity and order; the
  `#NAMED_ICON_360_SELECT#` token at 58744 is present.
- The value `2층` at 58713 preserves the English second-floor location.
  No mismatched marker sequence or numeric modifier was found.
- Reconciled the source-keyed historical prompts for IDs 58650-58749.
  Unresolved applicable prompts are recorded above; no preliminary candidate
  was promoted to an accepted correction without a demonstrated Korean
  defect and supported replacement.
- The preliminary scan's stored active-default hash differs from the actual
  pre-batch checkpoint. The checkpoint and byte-identical backup both
  verified as `21a1c477f5770af596fac3cd799849a49bac61dd68828c1bb0b20306c6392eed`;
  the scan hash was not used as the review baseline.
- The active default CSV remains at SHA-256
  `21a1c477f5770af596fac3cd799849a49bac61dd68828c1bb0b20306c6392eed`.
  UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
  pre-existing bare-LF endings are preserved.
- The byte-identical pre-batch backup is
  `/private/tmp/ko-translate-backups/20261011/before-58701/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `21a1c477f5770af596fac3cd799849a49bac61dd68828c1bb0b20306c6392eed`).

D-17747-D-17758 record 12 uncertain findings; D-17759 records the remaining
38 `not an issue` IDs. Direct register totals: 1,716 accepted, 12,650
`not an issue`, and 11,160 uncertain (25,526 total); next D-17760.

Resume at `default` ID 58751; 6,384 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
