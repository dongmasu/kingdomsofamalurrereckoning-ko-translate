# Consolidated Context Review: `default` IDs 22901-22950

- Review date: 2026-10-11.
- Scope: the eight rows left uncertain in the earlier disposition of
  `default` IDs 22901-22950; compared English, Japanese, Chinese,
  Japanese-derived Korean, active Korean, and repeated corpus terms by ID.
- Decisions: six `not an issue`; two remain uncertain. No CSV edit.

## Decisions

| Decision | ID | Finding | Disposition | Rationale |
| --- | ---: | --- | --- | --- |
| D-18507 | 22907 | Fontmaster | not an issue | ID 51753 identifies Fontmaster Nomeron as the manager responsible for the Font's flow. Korean `샘 관리자` preserves that office's meaning; the row does not require the character's name or a new title form. |
| D-18508 | 22913 | Gnomes `carved the place to pieces` | not an issue | English, Japanese, and Chinese all describe extensive destruction/excavation before the gnomes leave with everything. Korean's `갈기갈기 파헤치고` preserves that action and the dust/looting sequence. |
| D-18509 | 22914 | Hallidite / Oracle / Teeth of Naros | not an issue | Repeated ID 5940 confirms Hallidite as the Oracle who divines a divine reward's location; ID 62515 confirms the divining function of Oracles. This row preserves the promise, trust, search, and source-paired proper names. |
| D-18510 | 22917 | Decanus Bruten | not an issue | Japanese `十人長` and Chinese `十夫长` identify Decanus as a rank before Bruten; the same Korean source-paired form appears at ID 46043. Korean preserves the title/name string without a demonstrated meaning error. Canonical Korean rank wording remains a separate glossary question. |
| D-18511 | 22923 | Ametair / hunting boast | not an issue | Repeated quest and lore entries identify Ametair as the Fae Lord of the Hunt (including ID 21718). The boast's comparison and prey-count meaning are intact, and the English name remains explicit in parentheses despite variable Korean transliteration elsewhere. |
| D-18512 | 22925 | House of Pride / collective `Our` / surrender | not an issue | English and Chinese support the House's collective first-person voice. Korean retains the renunciation of the Tuatha and the demand to accept immediate surrender; the unusual underlying demand is not a Korean meaning shift. |
| D-18513 | 22942 | armor potion / Seaflax / Ysa's Breath / Bloodroot | uncertain | The effect, 2/2/1 quantities, and four embedded line breaks are preserved. Repeated recipes use divergent Korean reagent forms, and no approved canonical mapping resolves `시 플랙스`, `이사의 숨결`, and `혈근` together; no normalization is guessed. |
| D-18514 | 22947 | interrupted `You don't ‒ I mean` | uncertain | The self-correction and surprise are present in every locale, but the cut-off first clause and scene-specific register cannot be settled from this isolated line. |

## Verification

The English, Japanese, Chinese, Japanese-derived Korean, and active Korean
default CSVs each contain 65,135 rows in the same full ID order. Their text
for the reviewed keys matches between the Japanese-derived and active Korean
draft after normalizing only embedded newline encoding. ID 22942 has four
embedded line breaks in every locale, retaining the blank recipe line, three
ingredients, and quantities 2, 2, and 1. No key, row, runtime-marker, or
line-break discrepancy was found.

No Korean `Texto` cell changed; no backup was required. Active default
SHA-256 remains
`a0bc31f53559fce97a3c25fe9cf1bb1176e5c2c8de97eb4340983bdd6de1031f`.

D-18507-D-18514 resolves six prior uncertainties as `not an issue`; two
remain uncertain. Totals are 2,035 accepted, 23,433 `not an issue`, and
13,056 uncertain (38,524 counted). Resume at D-18515, `default` ID 22951.
