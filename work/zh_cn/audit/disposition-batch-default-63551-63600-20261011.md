# Disposition Batch: `default` IDs 63551-63600

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, terminology, values, and structure.
- Two accepted targeted corrections, 37 `not an issue` IDs, and 11 uncertain
  IDs. These are working dispositions, not independent linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18076 | 63562 | `시녀(The Maid of Windemere)의 새 마법을 이해하지 못하면 그녀와 싸워 봤자 소용없어. 우리가 모르는 걸 밝혀 줄 수 있는 사람은 한 명뿐인데, 내가 아는 사람 중엔 그 사람밖에 없어.` | `시녀(The Maid of Windemere)의 새 마법을 이해하지 못하면 그녀와 싸워 봤자 소용없어. 우리가 모르는 것을 밝혀 줄지도 모를 사람은 내가 아는 한 그 사람뿐이야.` | English says there is only one man the speaker knows who might shed light on their ignorance. Remove the repeated “only one” clause while preserving uncertainty. |
| D-18076 | 63600 | `크릴가린(Crilgarin)이 해결책을 생각해 냈어. 생략의 장막(Shroud of Omission)이지. 책을 이 장막으로 덮으면 노움들은 그 책이 있다는 사실을 잊을 거야.` | `크릴가린(Crilgarin)이 해결책을 생각해 냈어. 망각의 장막(Shroud of Omission)이지. 책을 이 장막으로 덮으면 노움들은 그 책이 있다는 사실을 잊을 거야.` | The shroud makes covered objects be forgotten. `망각의 장막` is supported by the English effect and established Korean occurrences; `생략` does not convey the memory effect. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18077 | 63552 | The search for work and rejection by the Preordained are retained; Erathell, Mithros, and the faction need glossary alignment. |
| D-18077 | 63558 | The plan to fight at Moondown and refusal of further unpaid favors are retained; the place-name form and “charity” nuance remain open. |
| D-18077 | 63572 | The bond with the rescued young beast is retained; English `pup` does not establish that it is specifically a dog, unlike Korean `강아지`. |
| D-18077 | 63577 | Korean uses a generic hired-soldier term for `Hireling`; Japanese instead specifies a third-rank mercenary. The label's role/rank context is unknown. |
| D-18077 | 63578 | The shrine blessing's remote use is retained; `special litanies` may be ritual texts/books rather than prayers in general. |
| D-18077 | 63580 | The quest sequence is retained; Deirdre's inconsistent English spelling, Dverga, and Lorestone forms need context/glossary alignment. |
| D-18077 | 63581 | The broken English phrase `next to the Archsage, once, up spire-top` is retained as a former high position at the spire; exact status versus location is unresolved. |
| D-18077 | 63584 | The spiritual/corporeal division is retained; Alarane's `order` and the formal roles of Delvers and Tenders need lore alignment. |
| D-18077 | 63585 | The speaker's self-correction from present to former favor is retained; canonical Korean form for Ethene remains open. |
| D-18077 | 63587 | Korean preserves the literal bloody stone-feather image; English syntax, Japanese omission of blood, and Chinese “blood-red” leave the exact image unsettled. |
| D-18077 | 63593 | Hallam's concern and the method of changing the ballads are retained; `Court of Summer`/Summer Court needs canonical term alignment. |

## Not an Issue

Decision D-18078 records these 37 IDs: 63551, 63553-63557, 63559-63561,
63563-63571, 63573-63576, 63579, 63582-63583, 63586, 63588-63592,
63594-63599. They preserve the available English meaning, voice, labels,
values, and structure. At 63563 Korean follows the English metaphor of
spiritual teachings being monopolized rather than importing Japanese's
church-instruction reading. At 63566 `사티바 섬유` matches the established
Korean resource term despite locale wording differences; 63598's `치명타
확률` preserves the ordinary probability reading.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 63551-63600 once,
  in identical ascending order.
- Embedded newline counts match for every row. No runtime markers occur.
  The `+13%` melee-damage value at 63574 is preserved.
- Rechecked historical questions for Erathell/Mithros, Moondown, Aesa
  Alfarinn, the Maid's magic, Mitharu's sermon, Sativa Fiber, Hireling,
  shrine litanies, Deirdre/Dverga Lorestones, spire-top, Alarane/Delvers/
  Tenders, Ethene, the stone feather, and Summer Court ballads.
- Pre-edit CSV SHA-256:
  `ad661f7654a15da4ecf11c58b7821c9576343dff8f4fb3313e064c90442d35e7`.
  Post-edit CSV SHA-256:
  `9379f24bcb2691d7916d93732286ad2f063a824cce050378fb65704220517ae1`.
  Byte-level verification against the batch-start backup confirmed that only
  the `Texto` fields at IDs 63562 and 63600 changed. The UTF-8 BOM, row/key
  order, embedded lineation, and outer CRLF record separators are preserved.
  Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-63551/locatexts_zh_cn.koalocatext_default.csv`.
- D-18076 records two accepted corrections, D-18077 records 11 uncertain
  findings, and D-18078 records 37 `not an issue` IDs. Totals at D-18078:
  1,817 accepted, 16,109 `not an issue`, and 12,479 uncertain (30,405
  dispositions); next D-18079.

Resume at `default` ID 63601; 1,534 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
