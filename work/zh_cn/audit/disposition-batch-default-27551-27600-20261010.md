# Disposition and Edit Batch: `default` IDs 27551-27600

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  27551-27600, checked against English, Japanese, Chinese, active Korean,
  and the historical audit.
- Decisions: two accepted, four `not an issue`, and nine uncertain.
- Accepted corrections at IDs 27589 and 27592 are applied.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 27589 | `책장` for the page in Marus Torix's book | Accepted: change `책장` to `책 속 한 페이지` and identify the same page as the source of the lightning. English repeats “page”; Japanese describes the open book and its page, and Chinese also says page. The current wording can mean a bookshelf, obscuring the puzzle action. |
| 27592 | `동생 기란` / omitted following of Colm | Accepted: change to `그를 따라 그의 형제인 기란을 찾아야 한다. 기란이 ... 떠나도록 설득해야 한다.` English says to follow Colm to his brother, Giran; Japanese and Chinese support finding Giran with Colm. None specifies relative age, so `동생` adds an unsupported detail. |
| 27554 | Plural “these forces” followed by singular “it” | Not an issue: English and Chinese share the number shift, while Japanese generalizes to power. Korean's consistent singular `이 힘` preserves the intended subject and avoids reproducing a likely source inconsistency. |
| 27571 | `$Ayten_NQD.dice_wager$` wager amount | Not an issue: the variable identity and position are preserved, with the Korean currency label following it as in the source structure. |
| 27576, 27586 | Localized `LINE_LEFT` / `*N` markers | Not an issue: marker identities, wrappers, order, and placement match the four-locale check. This structural disposition does not settle the faction-name terminology at 27586. |
| 27560 | `Dove` / `도브(Dove)` | Uncertain: English capitalizes and directly addresses Dove; Japanese omits the vocative and Chinese uses “peace messenger.” Historical uses suggest an affectionate address but do not settle this speaker's relationship or the Korean display form. |
| 27565, 27573, 27578 | Shoal title / Tower card / fate-read / Fated / Fateweaver | Uncertain: the current readings are plausible, but the title idiom and Fate/card-reading terminology remain open across the corpus. |
| 27574-27575 | Mystic Hammer / Firstsworn / names / crafting materials | Uncertain: the narrative and the two/two/four material quantities are preserved, but several names and the canonical material terms need alignment. |
| 27577 | “sputter and gloat with his scarred thoughts” | Uncertain: English and Chinese retain the scarred-thought image while Japanese calls the thoughts foolish. Korean follows English/Chinese but remains figurative and unusual; do not rewrite without scene context. |
| 27581, 27586, 27588, 27597, 27600 | Shrine / faction names / Fae Cairn and Echostone / House of Valor / Coriana Anwon | Uncertain: institutional and lore terminology, the Cairn/Echostone mechanism, and Coriana Anwon's canonical spelling remain open. ID 27600 is carried from the historical name inventory even though it was not a direct candidate in this preliminary report. |
| 27593 | `the Sorrows` / `소로스 가문` | Uncertain: English does not say “House,” and Japanese/Chinese frame the term differently. The faction, power, or other named-entity reading is unresolved. |
| 27594 | “That's roosters” | Uncertain: the English fragment is itself unusual; Japanese and Chinese differ on the rooster reference and the intended action. Preserve pending list/context evidence. |
| 27595 | “some feelings count less ... than they should” | Uncertain: Korean conveys emotional disregard, but Japanese characterizes people as cold-hearted while Chinese stays abstract. The intended nuance is not settled. |
| 27598 | `SpawnVol4` | Uncertain: preserve the source string until it is known whether this is player-facing content or an internal/developer label. |
| 27551-27553, 27555-27559, 27561-27564, 27566-27570, 27572, 27579-27580, 27582-27585, 27587, 27590-27591, 27596, 27599 | Dialogue, lore, quest, and concise UI wording | Not an issue: reviewed wording generally retains the English meaning and Japanese-supported voice. No additional clear correction is supported in these rows. |

## Verification

- The four-locale key/order, embedded line-break, and normalized runtime-token
  checks recorded in the preliminary report remain valid. The wager variable
  at 27571 and marker structures at 27576/27586 are preserved.
- Only Korean `Texto` values at IDs 27589 and 27592 changed; IDs, variants,
  row order, and all source CSVs remain unchanged.
- Active default CSV SHA-256 is recorded in the synchronized progress and
  handoff checkpoints.
- Register totals after this batch: 855 accepted, 2,960 `not an issue`, and
  4,928 uncertain (8,743 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 27601; 37,534 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
