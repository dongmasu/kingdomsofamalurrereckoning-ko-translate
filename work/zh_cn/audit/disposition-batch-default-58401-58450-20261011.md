# Disposition Batch: `default` IDs 58401-58450

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- One accepted correction, 35 `not an issue` IDs, and 14 uncertain IDs in
  13 findings.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not the
  Japanese-language reference.

## Accepted Correction

Decision D-17652 authorizes this targeted `Texto` correction:

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 58437 | `바라니에게서 빼앗은 뒤` | `바라니에게서 따낸 뒤` | English says the item was `won from a Varani`; Japanese and Chinese also describe winning it. `빼앗다` can imply forcible seizure, so `따내다` restores the tournament-win meaning without asserting the Varani was the direct opponent. |

The byte-identical pre-batch backup is
`/private/tmp/ko-translate-backups/20261011/before-58351/locatexts_zh_cn.koalocatext_default.csv`
(SHA-256 `60e4e69d0f0ac9d09bcd66480d8eaee68194b4acafbdfe5cf1963ba97c457c99`).
Post-edit active default CSV SHA-256:
`b2d5ab3cf5c926b254ada54d7444f60ce14f1953ae023bc0e024b54b0ab3cc9d`.
Only the `Texto` cell at ID 58437 differs from the backup.

## Uncertain Findings

| Decision | ID(s) | Rationale |
| --- | ---: | --- |
| D-17639 | 58401 | Standalone Thaddeus Holn grave label; locale phonetics differ and the canonical Korean name form is not established. |
| D-17640 | 58403 | The eight-line poem is retained in English/Chinese/Korean order, but the `high-spear`, blood-pall, and fasting imagery remains unclear. Japanese has seven lines and rearranges the hunt lines. |
| D-17641 | 58411 | The completed work and deferential address are preserved; exact speaker rank/voice context for `my liege` is unavailable. |
| D-17642 | 58415 | Star Camp is identified consistently, but translated versus source-name display conventions vary across the corpus. |
| D-17643 | 58419 | English's five-line verse is difficult to parse; locales differ on the relation between choosing sides, their evils, death, and being used. Korean's five lines are preserved pending context. |
| D-17644 | 58423 | English `Dead Kel, is he gone?` can ask whether Kel left or died; Japanese and Chinese explicitly ask whether he died. Quest context is needed. |
| D-17645 | 58429 | English `updated by notes` is malformed; Japanese and Chinese point to organizing/updating notes, while Korean uses the broader “update records.” The intended source wording is not certain. |
| D-17646 | 58430-58431 | Technical-looking `Trigger Sprites 2` and `Spider (3 Bugs)` labels are preserved, but whether they are internal/debug or player-facing is unknown. |
| D-17647 | 58434 | The agreement and blank signatures are retained; `final figures` may mean monetary totals, but the source does not confirm that narrower reading. |
| D-17648 | 58436 | Standalone Efyr name; locale phonetics do not establish the canonical Korean spelling. |
| D-17649 | 58439 | Renewed hope and the “second youth” metaphor are retained; the party meant by reconciliation is not identified in the row. |
| D-17650 | 58447 | The collection handoff is clear, but English `fee`, Japanese contribution/donation, and Chinese tax do not establish the payment type. |
| D-17651 | 58448 | Standalone `Remnant Plate`; item category (armor, material, slot, or other label) is not established by the row. |

## Not an Issue

Decision D-17653 records these 35 IDs: 58402, 58404-58408, 58410-58411,
58412-58414, 58416-58418, 58420-58422, 58424-58428, 58432-58433, 58435,
58438, 58440-58446, and 58449-58450. They preserve evident meaning,
voice/register, structure, markers, and values. Accepted and uncertain IDs
are not included.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 58401-58450 once
  and in identical ascending order; each full default resource contains
  65,135 records.
- ID 58403 retains seven embedded newline characters (eight lines) in
  English, Chinese, and Korean; Japanese has six embedded newlines (seven
  lines) and rearranges the hunt lines. Korean follows the English/Chinese
  structure. ID 58419 retains four embedded newlines (five lines) in all
  locales.
- The `$VMC_NQD.cost_mine$` marker at 58374 is outside this batch; within
  this batch, the `2`/`3` identifiers at 58430-58431 and `+1 Fate` trigger at
  58443 are preserved. No runtime-marker discrepancy was found.
- Reconciled the source-keyed historical prompts for IDs 58350-58449.
  Applicable open questions are recorded above; later prompts remain for
  their own batches.
- The UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
  pre-existing bare-LF endings are preserved.

D-17639-D-17651 record 13 uncertain findings covering 14 IDs; D-17652
records the accepted correction; D-17653 records the remaining 35
`not an issue` IDs. Direct register totals: 1,711 accepted, 12,450
`not an issue`, and 11,065 uncertain (25,226 total); next D-17654.

Resume at `default` ID 58451; 6,684 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
