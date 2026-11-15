# Candidate Reconciliation: IDs `60000`-`60249`

- Date: 2026-11-15.
- Rechecked all 12 new correction candidates against current Korean and the
  English, Japanese, and Chinese source rows. Eight required correction;
  four already had supported wording.
- Rechecked the three existing candidates; all three are already supported
  by the active Korean text.
- Rechecked five prior report-only findings. The corrections at `60108` and
  `60134` are already present; `60104`, `60105`, and `60185` remain
  evidence-limited. Preserved the append-only ledger dispositions.

## New Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `60013` | Corrected | Paired the full standalone location name as `대장간 전당(Forge Hall)`. |
| `60016` | Corrected | Added `Might` and `Finesse` to the existing `Sorcery` pairing, preserving all display wrappers, control tokens, and marker order. |
| `60018` | Already resolved | The current `둘로 나뉘어 있어. 예전에는 하나였지만, 아주 오래전 일이지.` is conversational and does not invent the groups' identity. |
| `60025` | Already resolved | `부디 할인 혜택을 받아 줘.` naturally conveys the discount offer in the existing conversational register. |
| `60061` | Corrected | Paired the complete label as `마녀 기사 아니라(Witchknight Anira)`. |
| `60089` | Corrected | Replaced the calque `결투 보조인` with `내 곁에서 결투를 거들어 줄 사람`, retaining the need for a second in the duel. |
| `60101` | Already resolved | The current wording clearly makes the Counsel the person who may die: `조언자(Counsel)가 죽기 전에 그를 찾을 것인가`. |
| `60112` | Corrected | Paired the standalone ability title as `충격과 공포(Shock and Awe)`. |
| `60138` | Corrected | Replaced the stiff `시설` with `유적`, supported by Japanese `遺跡` and the underground context. |
| `60152` | Already resolved | `아이텐 여관(Ayten's Inn)` pairs the full inn name once without a duplicate parenthetical. |
| `60232` | Corrected | Paired the standalone ability title as `능숙한 방어(Skillful Defense)`. |
| `60237` | Corrected | Paired the standalone title as `왕의 명령(A King's Mandate)`. |

## Existing Findings Rechecked

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `60012` | Retained | `이드리스 테오넨(Idris Theonen)` follows Japanese and Chinese and the NPC reference; the English key's `Idiris` is a typo. |
| `60037` | Retained | The established `이드리스(Idris)` spelling is present. |
| `60188` | Retained | `라토퍼(Ratofer)의 칙허장 찾기` uses the established `칙허장` rendering and pairs the name. |
| `60108` | Already corrected | Current `산악 트롤(Mountain Trolls) 처치` pairs the complete plural type. |
| `60134` | Already corrected | Current `서둘러, 서둘러!` conveys `Move, move!` as a command to hurry. |
| `60104` | Held | The creature rendering for `Pteryx` conflicts across locales. |
| `60105` | Held | `raised Travelers` does not establish whether this means upbringing in the faction or a life among its members. |
| `60185` | Held | Uppercase `Prompt` may be an input/UI label or encouragement; the source locales disagree. |
| `60229` | No new finding | The Korean metaphor remains consistent with the English and Japanese source; no change is supported. |

## Preserved Holds

The 15 new evidence-limited holds remain unresolved: `60056`, `60058`,
`60075`, `60084`, `60106`, `60132`, `60136`, `60158`, `60169`, `60174`,
`60177`, `60182`, `60184`, `60189`, and `60198`. Their source or context
ambiguities are documented in the sequential range report. No speaker or
playback order was inferred from asset associations.

## Applied Changes

Updated eight IDs with `tools/replace_text_preserve_eol.py`:
`60013`, `60016`, `60061`, `60089`, `60112`, `60138`, `60232`, and `60237`.
Only these IDs' four-language `source_fingerprint` fields were refreshed.
The already-present wording at `60018`, `60025`, `60101`, `60152`, `60108`,
and `60134` was retained.

## Result and Verification

- All 12 new candidates were reconciled: eight corrected and four already
  supported. The three existing candidates and five report-only findings
  were also rechecked.
- Candidate reconciliation is `3,374 / 4,026` (`83.81%`), with `652`
  remaining.
- All 65,135 ledger fingerprints validate; the index and both catalogs
  reproduce; all 20 preservation/context-index tests pass.
- The CSV retains 65,135 ordered IDs, its UTF-8 BOM, 71,839 CRLF separators,
  242 LF-only separators, and no bare CR. The CRLF-aware diff check passes.
- No immutable source CSV, extracted game asset, or game binary was changed.
  No commit was made.
