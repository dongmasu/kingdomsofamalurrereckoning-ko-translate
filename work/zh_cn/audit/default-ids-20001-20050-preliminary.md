# Preliminary Language Scan: `default` IDs 20001-20050

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 20001-20050 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 20002, 20007, 20018, 20022, 20035, 20041-43, 20046, 20050 | Chicken Overlord, Delvers/Midden, Emaire, Phasmer, Alyn Shir, Schneggar, Ettin, Wencen, Kandrian, Mel Senshir | Confirm entity/title status and align established names and item terms. | ID 20022 uses `파스머` without the English name; corpus spellings for Phasmer vary (`파스머`, `패즈머`, `페즈머`, `패스머`). The three spellings of Shadow Flare also vary elsewhere in the active draft. | Medium |
| 20003 | Bleeding/Poison +40%; Shadow Flare damage +30% | Preserve both distinct values and align the skill name. | Values match English; Korean uses `그림자 섬광`, while other occurrences commonly use `섀도 플레어` and one uses `암흑 섬광`. | High |
| 20004, 20015 | `though` / `Gether` source spellings | Treat as likely English source typos (`thought`, `Gather`) without editing source data; confirm whether the Korean UI phrasing is suitable. | Korean conveys the surrounding card interpretation and item-collection objective without reproducing either typo. | Medium |
| 20028 | Hierophant's gaze / “king of ants” | Retain the English/Chinese image pending context; keep the cross-language conflict visible. | English and Chinese say “king of ants”; Japanese reads “king of cups.” Korean follows English and Chinese. | Medium |
| 20036 | “Maybe I was someone once before” | Check whether `이름난 사람` adds more status than the source warrants. | English is ambiguous; Japanese says the speaker was someone of some standing, Chinese suggests an ordinary person, and Korean chooses “someone renowned.” | Medium |
| 20038 | Master's Pick / “dove” / own hen's eggs | Preserve the self-reliance implication while reviewing whether the source's image and form of address should remain. | Korean renders the proverb as making do with what one has and `dove` as `여보`; Japanese substitutes a game-piece image and Chinese uses a literal but unusual address. | Medium |
| 20012 | `Praise Lyria!` | Check whether `리리아 만세!` shifts praise/worship into a rallying cheer. | English and Japanese directly call for praise; Korean uses a celebratory acclamation. | Low |

## Historical Audit Reconciliation

- Rechecked the historical questions for IDs 20002-04, 20006-07, 20018,
  20022-23, 20028, 20030-32, 20035, 20038-39, 20042, and 20046 against the
  active rows. They remain preliminary; no historical note authorizes a
  translation edit.
- Confirmed ID 20028's ant/cup reference conflict and ID 20039's likely
  `abandoned`/`abandon` source error. The source text remains untouched.
- ID 20023's localized ability marker and two paragraph breaks were checked
  against all locale rows.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 20001-20050 exactly
  once and in identical order.
- Physical line-break counts and normalized runtime-token class/order
  signatures match across all four locales. ID 20023's marker is preserved.
- The distinct +40% and +30% values at ID 20003 match the English source.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 20001-20050 received one preliminary reading. Findings are candidates and
open questions only, not confirmed review dispositions. Continue with
`default` ID 20051.
