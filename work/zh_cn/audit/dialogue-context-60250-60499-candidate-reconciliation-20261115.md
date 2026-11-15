# Candidate Reconciliation: IDs `60250`-`60499`

- Date: 2026-11-15.
- Rechecked all nine new correction candidates against current Korean and
  English, Japanese, and Chinese source rows. Eight were corrected; the
  current wording at `60399` was already supported.
- Rechecked seven existing candidates: two were corrected and five already
  had supported wording.
- Rechecked the existing `60271` hold and the report-only item at `60442`.
  The latter's full plural pairing, `산악 트롤(Mountain Trolls)`, is already
  present. Existing ledger dispositions were preserved.

## New Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `60304` | Corrected | Recast the source as everyone fearing her foul moods: `그녀가 심술을 부릴까 봐 ... 두려워해.` |
| `60377` | Corrected | Paired the complete item label as `미타란 프리즘미어 보호대(Mitharan Prismere Brace)`. |
| `60394` | Corrected | Paired the standalone title as `독자 행동(Going Rogue)`. |
| `60396` | Corrected | Paired the named faction as `발라드의 집(House of Ballads)`. |
| `60399` | Already resolved | `거뭇한 피부에 난폭한 자들` preserves the contemptuous description without adding a size claim. |
| `60428` | Corrected | Recast the recognition idiom naturally as `브리건드 홀 동굴(Brigand Hall Caverns)이잖아`; retained the speaker's disgust at the creatures' origin. |
| `60455` | Corrected | Paired the full forge, Sagecrafting altar, Chaos Gems, and Chaos beasts terms, while preserving the source's claim and conversational journal perspective. |
| `60458` | Corrected | Paired the full item label as `완벽한 미타란 확대 지렛목(Flawless Mitharan Magnifying Fulcrum)`. |
| `60465` | Corrected | Paired the standalone ability label as `화염 지뢰(Fire Mine)`. |

## Existing Findings Rechecked

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `60271` | Held | The antecedent of `they` remains ambiguous; no speaker or group identity was inferred from asset association. |
| `60282` | Retained | `떠돌이` follows the scoped Nareen Farm decision for `vagrants` and remains distinct from `난민` (`refugees`). |
| `60290` | Retained | `이 시설들을 살펴보고 개선할 방법을 찾아야겠다` naturally conveys surveying and improving the mine and operations office. |
| `60384` | Corrected | Changed the potentially literal `네게서 뭔가 빛이 나는 것 같았거든` to the figurative, natural `너한테서 뭔가 빛이 느껴졌거든.` |
| `60389` | Retained | `개량` matches the established Sandstone Villa upgrade group (`10464`, `10866`, `11536`, `44143`, and `49479`). |
| `60393` | Retained | `성약단(The Testament)` is the established short faction form; the row does not need to repeat the full `Belen's Testament` form. |
| `60408` | Corrected | Replaced the stiff `받을 자격이 있는 만큼` with the natural `네가 받아 마땅한 만큼`. |
| `60477` | Retained | `천것` matches the context-specific reviewed rendering of the insulting address `dreg`; no global substitution was applied. |

## Report-Only Finding and Holds

- `60442`: The previously noted plural-type pairing is already correct as
  `산악 트롤(Mountain Trolls)`. Its append-only `not-issue` record was left
  unchanged.
- The seven new evidence-limited holds remain open: `60275`, `60280`, `60295`,
  `60298`, `60318`, `60335`, and `60337`. Their source ambiguities are
  described in the sequential range report.

No speaker or playback order was inferred from asset associations.

## Applied Changes

Updated ten IDs with `tools/replace_text_preserve_eol.py`:
`60304`, `60377`, `60384`, `60394`, `60396`, `60408`, `60428`, `60455`,
`60458`, and `60465`. Only these IDs' four-language
`source_fingerprint` fields were refreshed. No existing ledger disposition
was rewritten.

## Result and Verification

- All nine new candidates were reconciled: eight corrected and one already
  supported. The seven earlier candidates and the existing hold were also
  rechecked.
- Candidate reconciliation is `3,383 / 4,026` (`84.03%`), with `643`
  remaining.
- All 65,135 ledger fingerprints validate; the index and both catalogs
  reproduce; all 20 preservation/context-index tests pass.
- The CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,839 CRLF separators,
  242 LF-only separators, and no bare CR. The CRLF-aware diff check passes.
- No immutable source CSV, extracted game asset, or game binary was changed.
  No commit was made.
