# Disposition Batch: `default` IDs 63501-63550

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, terminology, values, and structure.
- One accepted targeted correction, 38 `not an issue` IDs, and 11 uncertain
  IDs. These are working dispositions, not independent final linguistic
  approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Correction

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18073 | 63507 | `내레이터가 자기 배역을 맡으러 오지 않았어! 마지막 장면은 내가 아니라 네가 대신 연기해야 해! 전령의 출연 신호가 들리면 무대로 올라와!` | `내레이터가 자기 배역을 맡으러 오지 않았어! 마지막 장면은 그 여자 대신 나와 함께 연기해야 해! 전령의 출연 신호가 들리면 무대로 올라와!` | English says the player performs the final scene with the speaker in the absent woman's stead. The old Korean incorrectly said “not me, but you,” making the player replace the speaker. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18074 | 63503 | The blanket ban on collecting Chaos Essence to prevent market cornering is preserved; the canonical faction form and whether “collection” means gathering remain lore questions. |
| D-18074 | 63508 | The Paragon Barghest heart, Anker's amulet, and cold-protection purpose are retained; creature and proper-name forms need glossary alignment. |
| D-18074 | 63512 | The poem's death, corpse, vulture, self-justifying lie, moral-decay, and closing images are retained. Rhyme, compressed clauses, and the Japanese adaptation need dedicated literary review. |
| D-18074 | 63517 | Hyperian's identity as a vessel, entity, or structure is unknown; Korean preserves the English ascent and destination. |
| D-18074 | 63518 | English says a respected `order`, while Japanese and Chinese identify a university/academy. Korean stays generic pending setting context. |
| D-18074 | 63519 | Gnarsh's role and the troll clans' Prismere corruption are retained; canonical name and lore terminology remain open. |
| D-18074 | 63535 | Korean follows English “do not prolong this”; Japanese instead says there will be no draw/tie. The challenge context is unavailable. |
| D-18074 | 63543 | The insult and servant comparison are retained; confirm whether `Dark Empyrean` is a formal proper term and align its Korean form. |
| D-18074 | 63544 | Korean conveys unlocking a storage container; the exact UI action and whether `Cache` is a named container need in-game terminology review. |
| D-18074 | 63545 | The sixth consecutive kill, +100% Total Damage, 17-second duration/reset, and 30% Mana cost are preserved. Japanese alone specifies maximum Mana; the source basis remains unresolved. |
| D-18074 | 63549 | English says `Tester Barclay`, Japanese says `Kester Barclay`, and Chinese treats Tester as a role. Do not resolve the name/role conflict without context. |

## Not an Issue

Decision D-18075 records these 38 IDs: 63501-63502, 63504-63506,
63509-63511, 63513-63516, 63520-63534, 63536-63542, 63546-63548, and 63550.
They preserve the available meaning, voice, labels, values, and structure.
The Korean at 63525 retains the “nobler looter” contrast; 63528 normalizes
the English source's duplicated `more` without changing its apparent meaning;
63547 follows the English question about spies remaining.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 63501-63550 once,
  in identical ascending order.
- Embedded newline counts match across all four locales, including 14 at
  63512 and three at 63545. Runtime variable `$(0)` at 63522 remains once
  in the same position. The numeric values at 63545 remain `6`, `+100%`,
  `17` seconds, and `30%`.
- Rechecked historical questions for the Preordained ban, morality poem,
  Hyperian, `order`/university, Gnarsh, noble looter, Tala-Rane journal,
  “draw this out,” The Unbound, Dark Empyrean, Cache, Battle Frenzy, spies,
  and Tester/Kester Barclay. The existing 63500 translation-map/CSV conflict
  is outside this batch and remains untouched.
- Pre-edit CSV SHA-256:
  `3f740bae45ce2332ed842127147c97a1d4e73aac863c0fafc93271e8d8459daa`.
  Post-edit CSV SHA-256:
  `ad661f7654a15da4ecf11c58b7821c9576343dff8f4fb3313e064c90442d35e7`.
  Byte-level verification against the batch-start backup confirmed that only
  the `Texto` field at ID 63507 changed. The UTF-8 BOM, row/key order,
  embedded lineation, runtime variable, and outer CRLF record separators are
  preserved. Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-63501/locatexts_zh_cn.koalocatext_default.csv`.
- Corrected cumulative counts at D-18072 were 1,814 accepted, 16,034
  `not an issue`, and 12,457 uncertain. D-18073 adds one accepted correction,
  D-18074 adds 11 uncertain findings, and D-18075 adds 38 `not an issue`
  IDs. Totals at D-18075: 1,815 accepted, 16,072 `not an issue`, and 12,468
  uncertain (30,355 dispositions); next D-18076.

Resume at `default` ID 63551; 1,584 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
