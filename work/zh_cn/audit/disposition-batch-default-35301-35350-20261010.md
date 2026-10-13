# Disposition Batch: `default` IDs 35301-35350

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling preliminary findings with active Korean,
  immutable English/Japanese/Chinese rows, prior decisions, terminology,
  line breaks, values, and structure.
- Evidence caution: Japanese wording refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- Decisions: three accepted, five `not an issue`, and five uncertain.
- CSV changes: IDs 35303, 35305, 35334, and 35348.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 35303, 35348 | Scholia Arcana / Archsage's home | Accepted: change the generic `아르카나 학회` to `스콜리아 아르카나(Scholia Arcana)`, matching accepted D-6297/D-6368 and recent accepted forms; retain the Archsage and Rathir relationships. |
| 35305 | `introductory chapter` / `회고록의 서문` | Accepted: change `서문` to `첫 장`. English says an introductory chapter, and Japanese/Chinese identify the first/opening chapter; Korean's `서문` narrows this to a preface. Retain the margin note. |
| 35308 | `Forever Fallowed` | Uncertain: capitalization may indicate a formal name, but the isolated label and divergent locale renderings do not establish its referent or canonical term. |
| 35312 | `Theis cowl` / floating heavy plates | Not an issue: Korean correctly reads the apparent English typo as “this cowl,” consistent with Japanese/Chinese, and retains that the magic levitates the plates rather than the whole wearer. |
| 35315 | Dalentarth shop advertisement | Not an issue: both paragraphs, the goods, makers, and Odarath-to-Emaire sales claim are retained; no additional supported wording defect was found. |
| 35319 | His Lordship could “live with” his people dying | Not an issue: the tentative, sarcastic implication that he may accept their deaths is conveyed; the differing Japanese interpretation does not override the English meaning. |
| 35322 | `Qualla sera Tirnoch!` | Not an issue: the opaque invocation is preserved exactly rather than guessed or translated inconsistently with the source. |
| 35325-35326 | `un-adept races` / `his worship, the Muse of Fate` | Uncertain: Korean's magic-familiarity reading is plausible, but “un-adept” is setting-specific; the ceremonial title's exact meaning and Korean honorific remain unresolved across locales. |
| 35330, 35333 | Tirin's Rest / keep the peace / doing harm | Uncertain: the command and rebuke are retained, but the named location's Korean form and the intended law/order nuance need context. |
| 35334 | God Storm poem / warm bodies | Accepted: replace `겨울처럼 차갑고 살아 있는 몸처럼 따뜻한 시신의 비` with `겨울처럼 차가운 시신과 온기가 남은 시신이 우박처럼 쏟아지던 걸`. This removes the unsupported living-body simile while retaining the cold/warm bodies, hail image, and poem lineation supported by the surrounding seasonal conflict and Japanese. |
| 35335, 35337 | Concourse market / Ballad of Bloody Bones / Sagrell | Uncertain: market, unexpected turn, and named ballad are conveyed, but place/title forms and Sagrell's canonical spelling need cross-entry alignment. |
| 35345 | Book of Varani Rhymes | Uncertain: the reported title is retained, but the canonical book-title form and Varani reference remain open. |
| Remaining ordinary text in IDs 35301-35350 | Dialogue, labels, names, values, markers, and structure | Not an issue: the other 34 IDs were checked in all four locales; no additional supported row-local defect was identified. |

## Historical Audit Reconciliation

- Accepted Scholia Arcana decisions D-6297/D-6368 and the later application
  at IDs 34877/34908 support the institution-name form at IDs 35303/35348.
- The `Theis` spelling is treated as a source typo, not an approved item name;
  the Korean “this cowl” reading is supported by both reference locales.
- The Tirin's Rest, Forever Fallowed, `un-adept`, Muse of Fate, Concourse,
  and Varani title questions remain open; no corpus-wide forms are invented.

## Verification

- All four locale files contain IDs 35301-35350 exactly once and in the same
  order. IDs 35315 and 35334 retain two and three embedded line breaks.
- Literal `16`, the three initiates, and the `{1} {2} {3}` sequence are
  preserved; no marker or value edit was made.
- Only the four authorized Korean `Texto` values changed. Keys, row order,
  BOM, and original physical line-ending distribution are preserved.
- These working dispositions are not independent final linguistic approval.
- Resume disposition at ID 35351; 29,784 IDs remain through ID 65134.
