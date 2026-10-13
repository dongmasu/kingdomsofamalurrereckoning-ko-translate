# Preliminary Language Scan: `default` IDs 46701-46750

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 46701-46750 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 46704 | Korrinna request / `그, 그녀를` | Preserve the speaker's hesitation without making the Korean self-correction sound like a gender correction. | English stutters before “I would like”; Korean preserves hesitation but `그, 그녀를` may read as correcting a pronoun rather than faltering. | Medium |
| 46706 | Great Cycle, Bareth, Nel | Confirm the canonical forms and preserve the smoke-like image of the clan's screams entering the Great Cycle. | Korean keeps the deaths, image, master/apprentice relationship, and survival belief; the lore terms remain provisional. | Medium |
| 46709 | leather armor and enemy's throat | Preserve the tactical claim that light armor enables speed to reach an enemy's throat. | Korean retains both the thin armor and speed/target relation; the phrase is combat flavor rather than an instruction to perform a specific move. | Medium |
| 46711 | Waterhall / `워터홀` | Verify the proper location spelling and standardize its Korean display form. | Korean transliterates the named destination; other locales use differing phonetic or literal forms. | Medium |
| 46719 | “jaw a bit” / `수다는 좀 떨 수 있지` | Preserve the informal invitation to chat despite having no task to assign. | Korean naturally renders the idiom and retains the speaker's casual tone. | High |
| 46721 | each slain Tuatha feeds Tirnoch | Preserve the causal claim that every killed Tuatha strengthens the survivors and feeds Tirnoch. | Korean retains both linked effects and the kitten insult; no target/count is lost. | High |
| 46726 | Vraekor, Varani Lawgiver, Northern Islands | Verify the formal office/title and the compressed item-description syntax without inventing a missing noun. | Korean preserves the blessing, protective function, and wind/icy spray; `Lawgiver` and the source's fragment remain lore questions. | Medium |
| 46730 | Ohn's Stand / `온스 스탠드` | Verify and standardize the place-name spelling against other occurrences. | The Korean transliteration is provisional; the historical audit already lists Ohn's Stand as a name needing confirmation. | Medium |
| 46731-46732 | Pit; Gorguath | Confirm whether Pit is a named Arena location and standardize Gorguath. | Korean uses `피트` and `고르구아스`; the Pit's function and both canonical forms remain unresolved. | Medium |
| 46735 | curios, clasps, staves, robes | Verify the exact merchandise categories, especially `curios` and `clasps`. | Korean renders these as curiosities/rarities and decorative metal fittings, retaining all four goods and the quality claim. | Medium |
| 46737 | debug string with `*1`, `*3`, `*6`, `*4`, `*2` and layout markers | Preserve every style ID and layout marker; document the locale-specific `*1`/`*3` ordering rather than normalizing it. | All locales retain the same six style IDs and five layout tokens, but English/Korean order the first two as `*3,*1`, while Japanese/Chinese use `*1,*3`. The remaining style/layout order matches. | High |
| 46739 | two-legs / pack | Preserve the animal-speaker's rejection by its siblings and loss of pack membership. | Korean retains both the “two-legs” label and exclusion from the pack without adding a species. | Medium |
| 46740 | books that “steal your thoughts from” | Preserve the sarcastic accusation of borrowing/plagiarizing ideas from books. | Korean makes the thought-stealing implication explicit and retains the taunting question. | Medium |
| 46741 | Close Order / `폐쇄 명령` | Determine whether this is a military formation/command, a formal group, or an instruction to close something. | The isolated title does not resolve the sense; the historical audit explicitly leaves it open. | Medium |
| 46743 | put the Jottun “to the spear” | Preserve the idiom's lethal outcome and the speaker's military agency. | Korean retains the spear image and the remaining Jottun as the target; confirm the intended force with context. | Medium |
| 46748 | aid not as “forthcoming” | Preserve the understated contrast between mutual trust and unreliable help. | Korean conveys that assistance cannot readily be expected, matching the English implication rather than treating “forthcoming” as merely delayed. | Medium |
| 46750 | Windstones, Erathell, Ayten Circle | Preserve that the expected song and Erathell have not appeared, then retain the invitation to visit the stones at Ayten Circle. | Korean keeps all three setting references and the question; their relationship and canonical names remain open in historical notes. | Medium |

IDs 46701-46703, 46705, 46707-46708, 46710, 46712-46718,
46720, 46722-46725, 46727-46729, 46733-46734, 46736, 46738,
46742, 46744-46747, and 46749 generally retain the English meaning on
this first reading. Names and game terminology remain subject to integrated
review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 46650-46749. It
  flags the Vraekor blessing/Lawgiver fragment at 46726, Ohn's Stand,
  Windstones/Erathell/Ayten Circle, the Pit, Gorguath, curios/clasps,
  Close Order, and the style-marker debug string at 46737.
- ID 46737 preserves all style IDs (`*3`, `*1`, `*6`, `*4`, `*4`, `*2`)
  and layout-token identities. Its `*1`/`*3` order differs by locale:
  English and Korean use `*3` before `*1`; Japanese and Chinese use `*1`
  before `*3`. Remaining style IDs and layout markers retain their order.
- No historical candidate was treated as an approved correction.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 46701-46750 once
  and in identical ascending order.
- All four locales preserve matching line-break counts; ID 46737 has no
  line breaks in any locale.
- ID 46737 retains five layout markers in the same order:
  `{LINE_SPACE}`, `{LINE_CENTER}`, two `{LINE_BULLET_INDENT}` markers, and
  `{LINE_LEFT}`. The six style-marker IDs are retained with the localized
  order exception described above.
- No material numeric-value or special-whitespace discrepancy was found.
- No translation CSV or immutable source file was edited.

## Batch Status

This read-only preliminary scan for IDs 46701-46750 is now dispositioned in
[`disposition-batch-default-46701-46750-20261010.md`](disposition-batch-default-46701-46750-20261010.md).
The dispositions are working review decisions, not independent final
linguistic approval. The next range begins at ID 46751.
