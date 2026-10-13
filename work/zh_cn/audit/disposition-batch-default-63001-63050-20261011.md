# Disposition Batch: `default` IDs 63001-63050

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, terminology, and structure.
- Two accepted targeted corrections, 30 `not an issue` IDs, and 20 uncertain
  IDs. IDs 63038 and 63043 each have an accepted wording correction plus a
  separate unresolved interpretation/context finding. These are working
  dispositions, not independent final linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18045 | 63038 | `아주 어릴 때부터 다른 이들에겐 보이지 않는 것들을 이해했어.` | `아주 어릴 때부터 다른 이들이 알지 못하는 것들을 이해했어.` | English says the speaker understood things “not clear to others”; Japanese and Chinese say others could not understand them. “Invisible” adds a literal visual ability. |
| D-18046 | 63043 | `... 아르진이 우리가 온 걸 눈치챌 거야.` | `... 아르진이 우리가 온 걸 눈치챌 가능성이 커.` | English says Argine will “likely” know; restore probability instead of a definite prediction. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18047 | 63004 | The Hall, sealed holdfast, rebels, and likely Saturnyn presence are retained; map relation and `Hall`/`holdfast` terms need lore context. |
| D-18047 | 63005 | The Niskaru-mouth danger and survival condition are retained; the deliberately darkly humorous request remains context-dependent. |
| D-18047 | 63008 | The Ansilla greeting and three ominous possibilities are retained; whether this is a greeting, threat, or test depends on scene context. |
| D-18047 | 63011 | The waiting celebrants and Beckoned address are retained; the occasion is unspecified. |
| D-18047 | 63015 | `Collections box` is rendered as a donation box; its relation to the earlier collections line is not established. |
| D-18047 | 63016 | The leader's duty and the people's reliance on their strength are retained; the crisis and referents remain unspecified. |
| D-18047 | 63018 | `FAIL LINE` is preserved verbatim because it may be a test/developer placeholder rather than player-facing text. |
| D-18047 | 63020 | The geographic name is translated literally; whether this is intentional game text or a test string is unresolved. |
| D-18047 | 63022 | The three Kobold names and Niahm objective are retained; name spellings and the source's masculine pronoun remain unverified. |
| D-18047 | 63024 | House of Ballads membership and the desire for a meaningful new Telling are retained; canonical Telling terminology remains provisional. |
| D-18047 | 63025 | The Dvergan map, Alfar inscription, Ring of the Watcher, and two-fragment requirement are retained; canonical script/name styling remains open. |
| D-18047 | 63029 | The amulet's enchantment and uncommon magic are retained; the forgotten `order` may be a named religious or magical institution. |
| D-18047 | 63032 | The speaker's preference for salvaging items while they are fresh is retained; the precise salvage sense of `fresh` remains context-dependent. |
| D-18047 | 63038 | The visual implication is corrected under D-18045; the exact sense of what the speaker understood remains broad and lore-dependent. |
| D-18047 | 63040 | Death's weight on the Scale and progress toward the Eldest are retained; both capitalized terms may be formal cosmological concepts. |
| D-18047 | 63043 | The probability is corrected under D-18046; what makes the enchantment “particular and thorough” and how Argine detects it remain unclear. |
| D-18047 | 63046 | Frost Trap, critical-hit chance, and +5% per Combo Point are preserved; official UI terminology remains to be verified. |
| D-18047 | 63047 | Akara's sparing of the addressee is retained; whether this means mercy or literal rescue depends on context. |
| D-18047 | 63049 | Urgency and the Hierophant threat are retained; the affectionate address `dove` is omitted, and Japanese also omits it. |
| D-18047 | 63050 | The South Georgia/South Sandwich Islands reference is retained; the canonical Korean geographic name and display convention remain open. |

## Not an Issue

Decision D-18048 records these 30 IDs: 63001-63003, 63006-63007, 63009-63010,
63012-63014, 63017, 63019, 63021, 63023, 63026-63028, 63030-63031,
63033-63037, 63039, 63041-63042, 63044-63045, and 63048. These rows
preserve available meaning, voice, labels, and structure.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 63001-63050 once,
  in identical ascending order.
- ID 63033's blank-line-separated recipe is preserved in all four locales;
  Cripplespore Caps (2) and Ysa's Breath (1) remain unchanged. The +5%
  critical-hit chance per Combo Point at ID 63046 is retained. Runtime-marker
  identities/order match.
- Rechecked source-keyed historical questions for Hall/holdfast/Saturnyn,
  Niskaru fangs, Ansilla, celebrants/Beckoned, the collections box, the
  leader's strength, `FAIL LINE`, French Southern Territories,
  Kobolds/Niahm, House of Ballads/Telling, the Dvergan/Alfar map, forgotten
  order, Cape Solace salvage, poison recipe, Scale/Eldest, Argine's trigger,
  Frost Trap, Akara's mercy, Burren Cove, and `dove`.
- Pre-edit CSV SHA-256:
  `cb7e48cbd2e1d2a1772b9051201b895db27670a596e6df087d58b33c92bea8b9`.
  Post-edit SHA-256:
  `7e913decad932afb88469dc92a77740dfb4535f06108bc95e99aec80063ed783`.
  Only `Texto` at IDs 63038 and 63043 changed. Byte-level verification
  against the batch-start backup confirmed all non-target bytes are
  unchanged. UTF-8 BOM, 65,135 records, key order, recipe lineation, and
  outer record separators are preserved. Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-63001/locatexts_zh_cn.koalocatext_default.csv`.
- D-18045-D-18046 record two accepted corrections, D-18047 records 20
  uncertain findings (two overlap accepted IDs), and D-18048 records 30
  `not an issue` IDs. Direct register totals: 1,802 accepted, 15,780
  `not an issue`, and 12,261 uncertain (29,843 dispositions total); next
  D-18049.

Resume at `default` ID 63051; 2,084 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
