# Dialogue Context Translation Edit Batch: IDs `21250`-`21499`

- Date: 2026-11-14.
- Rechecked candidate rows against current English, Japanese, Chinese, and
  Korean. English established meaning, Japanese was primary for
  voice/register, and Chinese was supporting evidence.
- Applied supported corrections to 18 IDs in this range and 10 linked IDs
  outside it. No speaker or playback order was inferred.
- Preserved existing ledger dispositions and refreshed only the 28 edited
  IDs' source fingerprints.

## Applied Corrections

| ID(s) | Correction |
| --- | --- |
| `21252`, `39557` | Paired the Aster clan and the Ratofer, Kents, and Scaiths names in both identical multiline entries; preserved paragraph breaks. |
| `21279` | Recast the whole line in consistent conversational plain speech. |
| `21283` | Added `(Jamaica)` to the standalone name without assigning an entity type. |
| `21299`, `28229` | Paired both identical labels as `하수도 경주(The Sewer Run)`. |
| `21321` | Corrected the object particle in `유골함을`; retained the existing urn translation rather than reopening its separate terminology question. |
| `21353` | Added the source name `Marches` to the regional reference. |
| `21356`, `59843` | Standardized the SQ60 petition-board location to `병원 구역`, matching nearby references and `Hospitalis Quarters`. |
| `21359` | Added the complete source label `Valor Guard` after its existing House of Valor pairing. |
| `21360` | Added the standalone document title `Concert Shopping List`. |
| `21367` | Added the standalone title `Lord of Beasts`. |
| `21388` | Paired the named tavern-keeper `Gordon Lot`. |
| `21389` | Paired the elders' explicitly named spring, `The Well that Wanders`. |
| `21406`, `42577` | Aligned both duplicate objectives as `크라스트 형제(Krast brothers) 처치하기`. |
| `21438` | Added the missing English pairing for Shalarein. |
| `21439` | Added the standalone title `Death of Solsvard`. |
| `21458` | Paired the ability name `Sceptre Ground Wave`, retaining the established `셉터` term. |
| `21465`, `36835` | Paired the shared journal heading `Cycle, the Third: The Pirate`; retained all paragraph breaks and body text. |
| `5940`, `21492`, `23508`, `33176`, `34181` | Standardized the five Oracle references in the Hallidite quest asset to `신탁자(Oracle)`, matching the other entries in that same context. |
| `32511` | Corrected the particle after the bilingual item name `빅터의 양조주(Victor's Brew)`; the other checked Victor's Brew references already use the established name. |

## Retained Or Held

- `21338` already uses `빅터의 양조주(Victor's Brew)`. The remaining
  Victor's Brew references were checked; no broad replacement was needed.
- `21348` already pairs Marga; `21385` was cleared by its prior source
  comparison; `21396` already has the complete
  `허바르의 문턱(Hurvar's Doorsill)` label.
- All 26 exact `Argine, Queen of Staves` labels already use
  `지팡이 여왕(Queen of Staves) 아르진(Argine)`; no rows were changed.
- `21366` remains held for the game's exact health-siphon terminology.
- `21417` remains held because the runtime meaning of `Socketed Items` is
  unresolved.
- `21436` retains the source-local `Hughes` spelling; the English source
  conflict with `Hugues` at `21434` is not silently normalized.
- `21409` remains held because `the Order` is not identified in this row.
- `21384` and `21425` remain held rather than applying an isolated
  `Archsage` pairing without a project-wide title decision.

## Verification

- The review ledger validates all 65,135 IDs against the four current
  language tables.
- The CSV retains its UTF-8 BOM, 65,135 ordered records, 71,845 CRLFs, and
  244 LF-only newlines. The duplicated Aster entries and pirate journal retain
  matching text and paragraph breaks.
- Exact duplicate groups for the Aster verse, Sewer Run label, Krast
  objective, and pirate journal match. All 26 Argine labels and all five
  Hallidite-quest Oracle references were checked for consistency.
- The 11 CSV-preservation tests and nine context-index tests passed (20 total).
- `git -c core.whitespace=cr-at-eol diff --check` passed.
- Current CSV SHA-256:
  `64cb6dae22258fbd7f90b131d7980479d730f1aaf7621de92ac50c6900112df9`.

The next sequential candidate range is `21500`-`21749`.
