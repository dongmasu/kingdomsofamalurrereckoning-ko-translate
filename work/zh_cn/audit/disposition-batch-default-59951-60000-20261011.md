# Disposition Batch: `default` IDs 59951-60000

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, preliminary
  findings, source-keyed historical questions, terminology, structure,
  runtime markers, and numeric values. These are working dispositions,
  not independent final linguistic approval.
- Two accepted corrections, 36 `not an issue` IDs, and 14 uncertain
  findings. IDs 59959 and 59963 have accepted quotation-mark corrections
  and separate open linguistic findings, so the register contains 52
  dispositions for these 50 unique IDs.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. `work/ja_jp/` is a Korean migration archive, not
  the Japanese-language reference.
- The active CSV was backed up byte-for-byte before editing.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-17877 | 59959 | Three source-quoted passages had no quotation delimiters in Korean. | Added `‘…’` around each of the three corresponding Korean passages; no wording changed. | English, Japanese, and Chinese mark three distinct quoted passages. Restore the source's speech/quotation boundaries without resolving the uncertain pronouns or referents. |
| D-17878 | 59963 | Three lines spoken by Lord Airmer were unmarked in the Korean poem. | Added `“…”` around the three spoken lines; no wording or line order changed. | English and Chinese explicitly quote the three lines, and the context says Lord Airmer approached and spoke. Restore dialogue boundaries while retaining the rest of the poem. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17879 | 59951 | The Kollossae heirloom may be an idol, figurine, or another statue-like item; its exact object type is not settled across locales. |
| D-17879 | 59956 | Cape Solace, Gallows End, and Captain Brattigan are retained; canonical Korean spellings and the named-island form remain provisional. |
| D-17879 | 59959 | The first quoted passage shifts from “one of them” to “it”; the antecedent and exact divine-spirit referent remain unclear. This is separate from the accepted punctuation restoration. |
| D-17879 | 59963 | The ten-line troll poem retains its event sequence, but final poetic voice, name/title spellings, and quoted-speaker styling need a dedicated literary pass. The dialogue delimiters themselves were restored. |
| D-17879 | 59964 | Alfar `arts` may mean artistic practice or specialized skills; Korean `기예` is plausible but the cultural contrast needs lore context. |
| D-17879 | 59974 | `I'm already dead` may be literal or fatalistic; retain the current line pending scene context. |
| D-17879 | 59975 | Rathir Chapter House's canonical institution name/type differs across locales; the destination and Archsage sequence are retained. |
| D-17879 | 59985 | The sentence leaves ambiguous whether the Well's success or Hugues's success occurs on his death day; Korean preserves that ambiguity. |
| D-17879 | 59986 | The anonymous Rathir council and Spire palace are retained; its relation to the Hierophant is unresolved. |
| D-17879 | 59987 | English contains a false start from `it` to `they`; Korean follows the plural correction and preserves the danger to farm and lives, but the hesitation/tone differs. |
| D-17879 | 59988 | `Martial equipment` may mean weapons only or broader combat gear; Korean keeps the broad category. |
| D-17879 | 59993 | Understyle's canonical named-place meaning is unresolved; retain the access contrast and rarity of mortal visitors. |
| D-17879 | 59997 | House of Sorrows remains a corpus-wide naming question; preserve the conditional offer of alliance against Tuatha Deohn. |
| D-17879 | 60000 | Korean uses a natural “know it like the palm of my hand” idiom but drops the source's calloused-hand characterization; whether that detail is meaningful remains open. |

## Not an Issue

Decision D-17880 records these 36 IDs: 59952-59955, 59957-59958,
59960-59962, 59965-59973, 59976-59984, 59989-59992, 59994-59996, and
59998-59999. These preserve evident meaning, line structure, register,
placeholders, and values. At 59961 Korean/Japanese reorder `{2}` and `{3}`
to preserve the “less than” syntax while keeping each placeholder identity.
Frost Trap values `35`, `40%`, and `5` at 59970 are unchanged.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 59951-60000
  exactly once and in ascending order. All four full resources contain
  65,135 records with matching key order.
- Rechecked source-keyed questions for the Kollossae heirloom, Maid's
  diary, Hermit Smith, Flanagan/Brattigan/Cape Solace, spirit antecedent,
  Fate control, placeholder ordering, Airmer poem, Alfar arts, Ethene,
  Frost Trap, Cydan's shortcut, Snaketail confession, already-dead line,
  Chapter House, malformed English source, Ethene patron, Well of Souls,
  Rathir council, the `it/they` correction, martial equipment, Understyle,
  House of Sorrows alliance, Warsworn, Nyralim, and the calloused-hand
  idiom.
- Numeric-only ID-field checks confirm 50 keys in each locale. Raw
  physical-line counts exceed 50 because multiline locale values span
  multiple lines; this is not a duplicate-key or missing-key exception.
- Embedded newline counts match. The diary at 59952 retains its section
  breaks, the spirit passage at 59959 retains three quoted blocks, and the
  pollution confession at 59973 remains one paragraph. Runtime markers at
  59961 retain `{1}`, `{2}`, and `{3}` with the established localized order.
- Pre-edit CSV SHA-256:
  `f58f8637f8b0a3969fd095cff62216dc2b168011f8eabbad6748e6fc6827e92b`.
- Post-edit CSV SHA-256:
  `f46a326c9e4eb82f21fc637cf2b7a6a0a3685227ae7f6e1a9fbbec520a3ed2ef`.
  Byte comparison against the backup confirms only quotation marks at
  IDs 59959 and 59963 changed. UTF-8 BOM, 65,135 records, key order,
  72,045 CRLF endings, and 39 pre-existing bare-LF endings are preserved.
- Byte-identical pre-batch backup:
  `/private/tmp/ko-translate-backups/20261011/before-59951/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `f58f8637f8b0a3969fd095cff62216dc2b168011f8eabbad6748e6fc6827e92b`).

D-17877 and D-17878 record two accepted punctuation corrections, D-17879
records 14 uncertain findings, and D-17880 records 36 `not an issue` IDs.
Direct register totals: 1,744 accepted, 13,587 `not an issue`, and 11,451
uncertain (26,782 dispositions total); next D-17881.

Resume at `default` ID 60001; 5,134 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
