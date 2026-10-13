# Disposition: Chinese-Only `affix` Fallback Variants

- Current status after D-19546 (2026-10-12): **10 accepted, 95
  `NOT_AN_ISSUE`, and 35 `UNCERTAIN`** across the 140 fallback keys.
  D-19545 resolved IDs 55, 202, and 527; D-19546 resolved ID 444 using
  repeated English/ja/zh context. See
  [`D-19546`](consolidated-affix-willful-followup-D19546-20261012.md) and
  [`D-19545`](consolidated-affix-fallback-review-D19545-20261012.md).

- Date: 2026-10-11
- Scope: all 140 zh_cn-only `(ID_Linha, Tipo_Variante)` keys in
  `affix-extra-variant-review.tsv`: 28 IDs × variants 12, 14, 21, 22, and 24.
- Compared each ID's English `FF` meaning, exact Chinese source variants,
  available Japanese-derived Korean sibling, and cross-locale evidence
  recorded in the preliminary report. English governs meaning; Japanese
  informs form/register; Chinese is supporting evidence.
- These are working dispositions, not independent final linguistic
  approval. The TSV status applies to each of the five listed variant keys.

## `not an issue`

| ID | Korean fallback | Basis |
| ---: | --- | --- |
| 28 | `원소의` | Preserves the elemental sense across the available references. |
| 45 | `군주의` | Preserves the possessive relation for `Lord's`; the entity type is unresolved, but no supported replacement is established. |
| 78 | `엔트로피의` | Retains the established scientific meaning of `Entropic`. |
| 85 | `근본적인` | Conveys `Fundamental`; a possible modifier-style refinement is not evidence of a meaning error. |
| 196 | `부패의` | Conveys intended putrefaction despite the English misspelling `Putrefication`. |
| 223 | `원시의` | Preserves the primitive sense supported across the references. |
| 231 | `부패한` | Follows English `Putrified` and the consistent sibling evidence despite Chinese `纯净` (“pure”). |
| 240 | `태고의` | Preserves the primordial/original sense supported by the references. |
| 263 | `업보의` | Preserves the karma sense across the available references. |
| 289 | `멍하게 만드는` | Conveys the stupefying/dazing effect despite the English misspelling `Stupifying`. |
| 299 | `가연성의` | Preserves the flammability sense across the available references. |
| 337 | `태고의` | Conveys the ancient/primordial modifier supported by the source set. |
| 368 | `배아의` | Exact cross-locale evidence supports `Embryonic`; all five keys retain that sense. |
| 369 | `운명지어진 자의` | Exact cross-locale evidence supports `of the Destined`; the person-denoting relation is retained. |
| 466 | `굴하지 않는 자의` | Preserves the person-denoting “unyielding” sense. |
| 510 | `결연한 자의` | Preserves the determined/resolute person sense. |
| 574 | `파괴 불가능한` | Conveys intended `Indestructible` despite the English misspelling `Indestructable`. |

Decision D-18178 applies to all five target variants for these 17 IDs,
85 keys total.

## `uncertain`

| ID | Korean fallback | Unresolved issue |
| ---: | --- | --- |
| 55 | `운명의` | English `the Fated` may denote people rather than abstract fate; item context is absent. |
| 101 | `호의의` | English `Favors's` is malformed and locale evidence diverges among favor, fortune, gifts, and patronage. |
| 115 | `심판받은 자의` | The judgment/recompense sense and exact referent of `the Reckoned` are not settled. |
| 117 | `행운의` | `Fortune's` may mean luck, fate, or the named Fortune. |
| 124 | `폐허의` | `Ruin's` may mean a physical ruin, named force, or destructive fate. |
| 202 | `처치자` | The slayer meaning is supported, but the adequacy of this game-style Korean agent noun is not established in the item name. |
| 255 | `키스멧의` | The relation between the transliterated Kismet and divergent fate/destiny readings needs item context. |
| 341 | `클레어리의` | `Clairy` may be a proper name or a clarity-related term; locale evidence conflicts. |
| 444 | `의지가 굳은 자의` | The Korean resolve sense may not capture the stubborn/obstinate sense of `Willful`. |
| 496 | `최상급` | Locale evidence diverges among primeval, fundamental, first, and elite senses. |
| 527 | `오로라` | The source may name a character/entity or the natural phenomenon; Chinese favors the latter. |

For IDs 115 and 117, the same five zh_cn-only keys are included in the
six-variant affix-composition dispositions D-18173 and D-18175 respectively.
They are linked, not counted a second time. Decision D-18179 applies to the
other nine IDs above, 45 keys total. Together the two status groups account
for all 140 unique target keys.

## Inventory Integrity

- Before disposition: 140 rows, 28 unique IDs, five unique target variants
  per ID; every row was `PRELIMINARY_CROSSCHECKED_OPEN`.
- After disposition: 85 `NOT_AN_ISSUE` and 55 `UNCERTAIN`; every ID retains
  exactly its five keys and all 140 keys remain unique and ordered.
- TSV line endings remain LF; no Korean candidate, source evidence, key, or
  row order was changed.
- Pre-edit SHA-256:
  `7959a3169bf35ffaa8396466a6e9d49003ac057693db5fd7d1534a5c3e3e9cfc`.
- Post-edit SHA-256:
  `88e0e3aadf635e3664c15fe7a6296313d722d02f8d35e7a49ff3a1d0cc48657b`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-base-affix-review-1100-1199/affix-extra-variant-review.tsv`.

See
[`combined-name-disposition-01100-01199-round12.md`](combined-name-disposition-01100-01199-round12.md)
for the linked `base`/`affix` decisions and the round resume point.
