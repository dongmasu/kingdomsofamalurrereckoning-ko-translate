# Preliminary Language Scan: `default` IDs 56651-56700

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 56651-56700 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 56654 | `fasting` / `단식 장소` | Do not settle the location/rite until the English source is clarified. | English calls the place “this fasting,” while Japanese says an underground passage and Chinese says a passage. Korean follows English literally; the active row alone cannot determine whether English is a typo or a named rite/place. | High |
| 56656 | Anira / `아니라(Anira)` | Confirm the canonical Korean name and avoid confusion with the ordinary Korean negation `아니라`. | The person is named Anira in all sources. The current parenthetical spelling disambiguates the Korean transliteration; historical reports already flag this name. | Medium |
| 56657 | House of Seasons Guide / Great Cycle | Check established corpus forms for both the guide role and the named cosmological cycle. | English, Japanese, and Chinese identify a House of Seasons guide and the Great Cycle. Korean uses `계절의 전당 안내자` and `위대한 순환`; historical reports note varying Korean Cycle terminology. | Medium |
| 56659 | `뮤즈` | Confirm whether “my muse” is a literal summoned entity or personified inspiration, and preserve the causal sense of keeping the speaker's painting hand supple. | Japanese and Chinese explicitly render a goddess; Korean retains “muse” as a loanword. English capitalization is not decisive in this isolated line. | Medium |
| 56660 | Farrara / `파라라`; “lovable rogue” | Verify the canonical name and whether the closing “Timeless” is a title/theme rather than simply immortality. | All sources praise Farrara's ballad and selflessness, but Japanese shifts “his ballad” to “this story.” Korean's `불멸` makes the final fragment more explicit than English's “Timeless.” | Medium |
| 56661 | Great Library / `대도서관`; curator Wynn Ashman | Preserve the objective and distinguish the lab modification from the potion-making goal; retain the source's apparent `libary` typo only as evidence, not as Korean content. | English has a misspelling in the final location reference and repeats the Crownhold library location. Japanese and Chinese clarify the Great Library and curator, while Korean calls the Alchemy Lab a workbench. | Medium |
| 56668 | Firstsworn / `퍼스트스원` | Confirm the established Korean form for this likely proper name/title. | All four sources retain the English name, while the Korean draft transliterates it. Historical records show both semantic and transliterated forms elsewhere. | Medium |
| 56669 | steward in Ysa / `이사가 맡은 관리인` | Confirm that `steward` means an administrative/caretaker role and is not the roster clerk suggested by Japanese. | English and Chinese describe a steward's role; Japanese reads the role as a roster clerk. Korean follows the English/Chinese sense. | Medium |
| 56672 | `his spine leaked out of him` / `줏대 하나 없는 놈` | Preserve the insult about cowardice/lack of resolve without taking it literally. | English and Chinese use the spine image; Japanese paraphrases the person as an empty shell. Korean's “no backbone/conviction” reading is plausible; the historical audit explicitly leaves the idiom open. | Medium |
| 56677 | Unbound / `언바운드` | Decide whether the faction name should be transliterated consistently or translated descriptively. | The speaker belongs to the Unbound and calls it a cult. Korean uses a transliteration; prior active-corpus reports record descriptive renderings elsewhere. | Medium |
| 56684 | timed Parry / `정확한 타이밍에 쳐낸 뒤` | Confirm the tutorial's timing/input convention and official Korean combat term for Parry. | English specifies a timed Parry followed by a Longsword attack. Japanese describes parrying the enemy attack at the right timing; Chinese says blocking after a period of time. Korean conveys a timed deflection, but the exact game mechanic remains contextual. | Medium |
| 56685 | Arcadium / `아르카디움` | Confirm the canonical name and whether it denotes an institution, location, or arena. | English and Japanese retain a proper name; Chinese interprets it as an arena. The Korean draft preserves the name, consistent with earlier open questions. | Medium |
| 56687 | quest-category tutorial markers | Preserve all three marker identities and the five category meanings; confirm official localized category labels. | English/Japanese/Chinese/Korean retain both `{LINE_LEFT}` markers and the localized `{*1...}` title marker in the same positions. Korean's `세력 퀘스트` and `과제` are plausible for `Faction Quests` and `Tasks`, but terminology consistency remains open. | Medium |
| 56695 | `hollow` / `굴` | Confirm whether this means the named Hollow or a generic hollow/cavern. | All sources describe beasts encountered before returning to the surface. Japanese/Chinese make the underground den/cave sense explicit; English capitalization and surrounding context are insufficient to settle a proper-name reading. | Medium |
| 56700 | fee / `요금` | Check whether this is a toll, service charge, or other in-world fee if context becomes available. | All four versions preserve inability to afford the fee and the instruction to return later; the isolated row does not identify what is being charged. | Low |

Other reviewed rows generally preserve the first-read English meaning and
Japanese conversational register. Names and terms remain provisional,
including The Great Road, Skald, Octienne, Carasta, Dren, Idylla, Klurikon,
Crilgarin, Ysa, Nyralim, Sun Camp, and Castaway's Cove.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `56650-56749`.
  The active range intersects its prompts at 56654 (fasting), 56656
  (Anira), 56657 (House of Seasons Guide/Great Cycle), 56659 (muse),
  56660 (Farrara), 56661 (Great Library/Wynn Ashman), 56668-56669
  (Firstsworn/steward), 56672 (spine idiom), 56677 (Unbound), 56684
  (timed Parry), and 56687 (quest categories). These remain prompts, not
  accepted corrections.
- All active IDs 56651-56700 fall within the historical range
  `56650-56749`; the adjacent historical range `56550-56649` was not used
  to assign any row in this batch. Each active row is reviewed once.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 56651-56700 once
  and in identical ascending order. All four default files contain 65,135
  records with identical full key order.
- Newline counts match throughout the batch.
- At 56687, both `{LINE_LEFT}` markers and the localized `{*1...}` marker
  are retained in the same positions; only localized marker text differs.
- No cross-locale numeric-value discrepancy was identified.
- Active CSV SHA-256 values remain at the recorded checkpoint:
  - `base`: `c6adbf220bd66bab7ef61274886ea6a47427b58dc971f9e9703d4fd089b946a6`
  - `affix`: `7697d7d09933ca7f7f8f6e41fcd82bb5f29e4b092368b856489a8c62f1dc21b9`
  - `default`: `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`
- No translation CSV edit was made.

## Batch Status

IDs 56651-56700 received one preliminary reading and were dispositioned in
[`disposition-batch-default-56651-56700-20261011.md`](disposition-batch-default-56651-56700-20261011.md):
four accepted corrections, 13 uncertain findings (one overlaps an accepted
ID), and 34 `not an issue` IDs. These are working dispositions, not
independent final linguistic approval. Continue at `default` ID 56701.
