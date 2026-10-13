# Consolidated Context Review: `default` IDs 23401-23450

- Review date: 2026-10-11.
- Scope: the eight keys previously marked uncertain in IDs 23401-23450,
  checked by exact ID across English, Japanese source, Japanese-derived
  Korean, Chinese, active Korean, and accepted terminology.
- Result: all eight resolved (two accepted edits, six `not an issue`); no
  uncertainty remains from this batch.

## Decisions

| Decision | ID | Finding | Disposition | Rationale |
| --- | ---: | --- | --- | --- |
| D-18625 | 23403 | Ventrinio / Alabastra route | not an issue | English's `may know` uncertainty, attribution to old notes, and route into Alabastra are retained. Both names are paired with their exact English spellings; unresolved corpus-wide phonetic choices do not impair identification here. |
| D-18626 | 23413 | Mask sacrifice / Prismere | not an issue | Korean preserves the mask's cost, the long absence of Prismere's warmth, and the absence of the god's love without inventing a mechanism for either. |
| D-18627 | 23414 | Master's restoration / pervasive curse | not an issue | The wish to restore the former master, the curse's pervasive reach, and the master's likely wish for death after falling are all retained without specifying the nature of the fall. |
| D-18628 | 23426 | Message under webbing | not an issue | English permits a web-like covering; Japanese places the find near a small nest. Korean's spiderweb reading is plausible in that setting, and the ambiguity does not establish a material mistranslation. |
| D-18629 | 23428 | Wrist spin / bolt | not an issue | English's `bolt` in an instruction to impart spin is a projectile; Korean's crossbow-bolt wording is a supported specification. The Chinese lightning reading is not followed because English is the semantic baseline. |
| D-18630 | 23434 | Scholia Arcana Grounds | not an issue | The line only locates the destination nearby. `구역` preserves the broad area sense without asserting whether the Grounds are a campus, district, or separate named region; the source name remains present. |
| D-18631 | 23441 | Foes' Hearth | accepted | Replace `포즈 하스(Foes' Hearth)` with `적들의 난롯가(Foes' Hearth)`, reusing the contextual place-name rendering accepted at ID 65110 / D-18216. |
| D-18632 | 23443 | Warsworn | accepted | Replace `전쟁맹세단` with `워스원(Warsworn)`, reusing the established faction rendering (including D-2857) and retaining the exact source spelling. This local correction does not settle every competing corpus spelling globally. |

## Edits and Verification

Only active Korean `Texto` values at IDs 23441 and 23443 changed:

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 23441 | `포즈 하스(Foes' Hearth)` | `적들의 난롯가(Foes' Hearth)` |
| 23443 | `전쟁맹세단` | `워스원(Warsworn)` |

Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-23441-23443-D18625-D18626/locatexts_zh_cn.koalocatext_default.csv`.

Pre-edit SHA-256:
`d873312499857a290c61337e7bf34dca6e6beb6e623647db417959cc2465d089`.
Post-edit SHA-256:
`9c4beea9aa24f2a77e102d19b82b2f1034500bff099277568c0494b6fe21dd5e`.
Byte comparison against the backup confirms that only the two listed cells
changed. The UTF-8 BOM, 65,135-row order, 72,011 CRLF endings, and 73
pre-existing bare-LF endings are unchanged. English, Japanese source,
Japanese-derived Korean, Chinese, and active Korean each contain IDs
23401-23450 once and in identical ascending order. No runtime marker or
embedded line-break discrepancy was found in the reviewed keys.

D-18625-D-18632 resolves eight keys: two accepted and six `not an issue`.
Totals are 2,059 accepted, 23,519 `not an issue`, and 12,946 uncertain
(38,524 counted). Next D-18633 at `default` ID 23451. The earlier working
dispositions are reconciled in
[`disposition-batch-default-23401-23450-20261010.md`](disposition-batch-default-23401-23450-20261010.md).

These are working dispositions, not independent final linguistic approval.
