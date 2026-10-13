# Disposition Batch: `default` IDs 60051-60100

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary
  report, source-keyed historical audit, recurring terminology, runtime
  markers, values, and multiline structure.
- Zero accepted corrections, 35 `not an issue` IDs, and 15 uncertain
  findings. These are working dispositions, not independent final linguistic
  approval.
- No Korean CSV text changed. English governs meaning; Japanese informs
  voice/register; Chinese is a supporting cross-check.

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17884 | 60054 | Caeled Coast spelling is provisional; the lock-pick trainer's boast and self-deprecating punchline are preserved. |
| D-17884 | 60056 | `Range Roll` mechanic is not fully settled: Japanese specifies a target total within a chosen range, while English and Chinese phrase the bet differently. |
| D-17884 | 60058 | The Maid's canonical title varies across the corpus and Japanese calls her the Maiden of Windemere; retain the moral judgment and return warning. |
| D-17884 | 60064 | Korean's `파병` is more specifically a military deployment than the broader English/Japanese/Chinese “serve in Klurikon”; keep pending posting context. |
| D-17884 | 60065 | War Captain Vogard's canonical Korean name and whether the title is a formal rank remain provisional. |
| D-17884 | 60068 | `Adessa's sphere` and the “mysterious benefactors” are read as influence and sponsors in Korean/English/Chinese, but Japanese says mysterious observers. |
| D-17884 | 60070 | The Sanctuary and its box are retained, but Japanese calls the site a church while English/Chinese use sanctuary; exact institution and collection context are unknown. |
| D-17884 | 60075 | “Key to the Sorrows” may refer to the House, its power, or another entity; Korean's explicit House destination is plausible but unresolved. |
| D-17884 | 60084 | Testament's status as a faction/faith and the canonical Belen title differ across locales; preserve the path metaphor. |
| D-17884 | 60089 | Duel `second` is likely an attendant/witness, but Chinese suggests another person and the exact role has not been established. |
| D-17884 | 60090 | Bone Wall may be a formal place, quest, or structure; retain the name and work offer. |
| D-17884 | 60093 | Delvers' formal identity and Taibreah's canonical spelling vary; the instruction to investigate together is retained. |
| D-17884 | 60095 | The “little dove” endearment may be affectionate or patronizing; Korean preserves the wording and the contrast with the grown-up thief. |
| D-17884 | 60098 | White Nil is rendered phonetically across locales, but its canonical Korean spelling and item/name status remain open. |
| D-17884 | 60100 | The six-line migration poem is preserved; whether it is explicitly an origin account for Rathir's Houses remains a lore question. |

## Not an Issue

Decision D-17885 records these 35 IDs: 60051-60053, 60055, 60057,
60059-60063, 60066-60067, 60069, 60071-60074, 60076-60083, 60085-60088,
60091-60092, 60094, 60096-60097, and 60099. They preserve evident meaning,
register, values, names as currently established, and structure.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 60051-60100 once
  and in identical ascending order; all four resources contain 65,135 rows.
- ID 60073 retains all three attack descriptions, blank-line grouping, and
  damage/cost values (`120/65`, `170/65`, `125/70`). ID 60100 retains the
  six-line poem in all locales.
- Runtime token `#NAMED_ICON_GRAY_360_X#` at 60067 is identical in all four
  locales. ID 60066 retains one tenth of the treasure, 60074 retains the
  deuce/low outcome, and 60096 retains the temporary blacksmith increase of
  one.
- Source-keyed questions were rechecked in
  `work/zh_cn/audit/from-ja_jp/open-questions.md` and the preliminary report.
  No uncertain finding was silently converted into a translation edit.
- Active Korean default CSV SHA-256:
  `09c2194038314e7842351349607b05a62266816b7d8e85beca79e0471509a5c6`.
  No CSV edit was made in this batch.

D-17884 records 15 uncertain findings and D-17885 records 35 `not an issue`
IDs. Direct register totals: 1,745 accepted, 13,658 `not an issue`, and
11,479 uncertain (26,882 dispositions total); next D-17886.

Resume at `default` ID 60101; 5,034 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
