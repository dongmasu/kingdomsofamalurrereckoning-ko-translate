# Consolidated Context Review: `default` IDs 25201-25250

- Date: 2026-10-11.
- Re-reviewed all 28 previously uncertain ID keys against English meaning,
  Japanese voice/register and draft, Chinese supporting evidence, active
  Korean, recurring corpus forms, and earlier decisions.
- Resolved 25: two accepted corrections and 23 `not an issue`. Three
  specific holds remain at IDs 25208, 25241, and 25248.
- No other text, numeric, sequence, or runtime-marker defect was established.

## Decisions D-19102-D-19118

| Decision | ID | Outcome | Evidence |
| --- | ---: | --- | --- |
| D-19102 | 25201 | not an issue | Gifre's “purchase” of House Wyvyrn and the incongruous sea-water/fine-wine image remain; the Korean preserves the sarcastic metaphor. |
| D-19103 | 25202 | accepted | Replace `선택받은 자` with the established Beckoned title `부름받은 자` per accepted D-3443; retain the ritual, atonement, and Wreath reference. |
| D-19104 | 25205 | not an issue | The item quality, Mitharan modifier, Illuminator, and shaft/handle are represented. `미사란` follows accepted item-adjective usage D-1189; D-1096 and later entries disagree on corpus-wide spelling, so no unsupported global normalization is made. |
| D-19105 | 25208 | uncertain | The catalog's claims, five section boundaries, and blank-line structure are retained, but EN/KO contain 14 embedded line breaks versus 11 in JA/ZH; three additional internal wraps occur at different positions. Display/runtime intent cannot be determined from the row alone. Preserve current text and lineation. |
| D-19106 | 25210 | accepted | Correct the deity name from `미타루` to the established `미사루` per accepted D-152; the Border Permit and its return to the right hands remain. |
| D-19107 | 25213-25215 | not an issue | Spear mastery and damage/unlocked attacks, the nearly 500-year Master of the Keep claim, and Cursewood are retained. |
| D-19108 | 25216, 25218 | not an issue | Rithen amulet recovery, Phasmer's curse and inability to release it, return to Irion, and Ventrinio search objective remain in sequence. No locale establishes a canonical Korean spelling correction. |
| D-19109 | 25220 | not an issue | The lords and ladies' greatness, the speaker's lack of expected glory among them, and resigned realization are preserved; Japanese and Chinese support the status-group reading. |
| D-19110 | 25226 | not an issue | The call to wise and influential warriors, Gravehal Keep appointment, and legacy claim remain; Japanese also supports the inheritance wording. |
| D-19111 | 25230 | not an issue | `Effect placeholder` is translated literally as `효과 자리표시자`; whether it is test or player-facing text does not establish a Korean meaning error. |
| D-19112 | 25232-25235 | not an issue | Telogrus's deposition/occupation, displaced residents, Lord Ansilla's prolonged absence, and the search/identification of possible group corpses remain. The uncertain antecedent is not over-resolved. |
| D-19113 | 25239-25240 | not an issue | Arkes's imprisonment and final message about unsealing the Hyperian, stopping Anokatos, and changing Kollossae fate remain; the Winter Fae's mistreatment and ending the rulers' reign are preserved. |
| D-19114 | 25241 | uncertain | English says `Forward`, while Japanese suggests progress/research and Korean interprets a foreword; Chinese is literal. The source may contain a `Foreword` typo, but available row context cannot confirm it. |
| D-19115 | 25242 | not an issue | Primos's sanctum, respectful conduct, and punishment under Kollossae Law are retained. |
| D-19116 | 25244 | not an issue | The speaker acting as Wencen, the absent true king, fifth Fae to hold the title, and regret are preserved; Japanese supports the role-playing sense. |
| D-19117 | 25245-25249 | mixed | Keep the relic/miner rescue objective, `+6` and `+24%` longbow values and line break, apology, and Fate label. ID 25248 remains uncertain because Vigor's Korean name variants are unresolved elsewhere (D-17687); its crew/pay relation is clear. |
| D-19118 | 25250 | not an issue | The Varani people-name and refugee role are directly represented by the established `바라니 난민` form. |

## Edits

| ID | Before | After | Rationale |
| ---: | --- | --- | --- |
| 25202 | `이제 선택받은 자께서 오셨으니...` | `이제 부름받은 자께서 오셨으니...` | Apply accepted Korean terminology for Beckoned. |
| 25210 | `미타루의 축복이 있기를.` | `미사루의 축복이 있기를.` | Apply the established Korean deity name for Mitharu. |

## Verification

- English, Japanese, Chinese, Japanese-derived Korean draft, and active
  Korean each contain IDs 25201-25250 exactly once and in identical order:
  50 keys in each file.
- ID 25208 has 14 embedded line breaks in English, the active Korean, and
  Japanese-derived Korean draft; source Japanese and Chinese each have 11.
  The three excess internal wraps and differing positions are documented,
  not edited. The five section boundaries and blank-line structure align.
- ID 25237's blank line and ID 25246's two numeric values/line break remain.
  No runtime markers occur in this interval.
- Only the approved active Korean `Texto` cells at IDs 25202 and 25210
  differ from the byte-identical pre-edit backup. The UTF-8 BOM, row order,
  72,011 CRLF endings, and 73 existing bare LF endings are preserved.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-25201-25250-D19102/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `4b54b657dfa9c9cdee9d15d301161925e6c469ae429614b6448016d26fb8c495`.
- Post-edit SHA-256:
  `d211ed35eafdfe5bd5ce5cad084f6974e037238e552c2ed21be1b28e48eb049c`.
- Totals: 2,152 accepted / 24,003 `not an issue` / 12,369 uncertain
  (38,524 counted keys). Resume D-19119 at ID 25251. Sequential IDs
  25251-65134 remain (38,884), along with earlier specific holds and the
  D-18422-D-18452 register backfill.
