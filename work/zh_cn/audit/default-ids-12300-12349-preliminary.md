# Preliminary Language Scan: `default` IDs 12300-12349

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 12300-12349.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 12302 | `cultivation` → `교양` | Determine whether `cultivation` means personal refinement, education, or another form of cultural development; preserve the stage metaphor. | Korean uses `교양`; Japanese refers to education/refinement and Chinese to cultivation/education. The English list is literary and does not settle the exact sense. Historical notes already flag it. | Medium |
| 12304 | Anokatos / Hyperian / Arkes | Clarify whether the Hyperian was left in Anokatos's care or both Anokatos and the Hyperian were left behind; retain the urgency to follow Arkes' instruction. | English says `left Anokatos with the Hyperian`; Japanese explicitly reads this as entrusting the Hyperian to Anokatos, while Chinese says they were left together. Korean's `Anokatos와 Hyperian을 ... 두고 왔다` can also read as two coordinated objects. Historical notes already flag it. | High |
| 12306 | `I lack the sympathy to kill you personally.` | Preserve the speaker's dismissive threat while resolving the source's contradictory wording: does the speaker lack pity, or lack the willingness/compassion to kill personally? | Korean follows the literal English/Japanese construction, but its logic is unclear. Chinese also preserves the contradiction. Historical notes already flag it; no confident repair is established. | Medium |
| 12312 | `freedom and importance` → `자유와 지위` | Check whether `importance` denotes social status/prestige rather than personal significance. | Korean uses `지위`; Japanese and Chinese use the equivalent of status, supporting this reading. This appears consistent with the references, but the object represented is not named in the row. Historical notes already flag the referent. | Low |
| 12313 | City rose / Hyperian did not follow / city's heart remained | Identify what “the heart of the city” denotes and preserve the speaker's inability to accept the unmoved center. | Korean retains the distinction between the city's ascent and its unmoved center. English/Japanese/Chinese support the sequence but do not identify the “heart” object. Historical notes already flag it. | Medium |
| 12315 | Four vials / kobold, crudok, ettin, Jottun counts | Preserve the one-to-one order and exact kill counts: 10, 5, 3, and 3. | Korean assigns the counts in the English order. Japanese/Chinese confirm the same four creatures and quantities. Historical notes already flag this gameplay instruction. | High |
| 12320 | `Clear Spaces` → `빈 공간 비우기` | Determine whether this is an inventory-slot command, an area/map instruction, or another UI action before settling the Korean label. | The short capitalized label lacks context; Korean currently reads as clearing/freeing empty spaces. Historical notes already flag it. | Medium |
| 12321 | `Ranger` → `정찰병` | Align this standalone role/class label with the same source term at ID 10489, where Korean uses `레인저`; confirm whether the UI expects a class title or generic scout. | English has `Ranger` at both IDs; active Korean translates ID 12321 as `정찰병` but uses `레인저` at ID 10489. This is a corpus consistency issue, not proof that one form is canonical. | High |
| 12331 | `walk the shadow` → `그림자 속으로 걸어가자` | Determine whether this names a route/stealth method or is an ordinary metaphor for moving through darkness. | Korean follows the literal image. Japanese also says to walk through the shadows; Chinese calls it a shadow passageway. Historical notes already flag the phrase. | Medium |
| 12339 | `beat you here` → `우리가 먼저 도착하다니` | Retain the “arrived before you” sense, not a claim that the speaker defeated the listener. | Korean correctly interprets `beat you here` as arriving first; the English context about Cydan's shortcuts supports it. Historical notes already flag this idiom/name. | High |
| 12343 | `The mayor had me do that` / Steg | Identify the omitted antecedent for `that` and preserve the mixed criticism/praise of Steg. | Korean leaves the action implicit and retains the mayor's motive and Steg's characterization. The row alone does not identify what the speaker did. Historical notes already flag it. | Medium |
| 12347 | `your eminence` / Hallam the White | Verify the honorific's rank/register and the established Korean epithet for Hallam. | Korean uses formal `각하` and `백색의 할람`; Chinese supports an eminence-level honorific, while Japanese omits the address in this line. Historical notes already flag both forms. | Medium |

## Historical Audit Reconciliation

- Rechecked archived questions at IDs 12302, 12304, 12306, 12312, 12313,
  12315, 12320, 12331, 12339, 12343, and 12347 against the active Korean
  and all three source locales. They remain open.
- ID 12321's `Ranger`/`정찰병` versus `Ranger`/`레인저` difference was
  additionally verified against active ID 10489.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed CSV-record line-break counts match throughout this range.
- `$Sidhe_NQD.m_inn_cost$` at ID 12329 is identical and in the same position
  across all four locales. No runtime-token difference was found.
- Proper-name parenthetical use remains selective; this range does not set a
  global bilingual-display convention.
- Official Korean manual terminology could not be independently searched
  during this pass. Active Korean CSV hashes match the recorded baseline;
  no active CSV was edited.

## Batch Status

IDs 12300-12349 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 12350-12399.
