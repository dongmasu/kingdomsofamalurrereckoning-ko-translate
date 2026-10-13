# Preliminary Language Scan: `default` IDs 27951-28000

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 27951-28000 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 27951, 27953, 27955-27957, 27960-27963, 27965-27966, 27968, 27970-27972, 27974, 27976-27983, 27987-27989, 27991-27992, 27994-27998 | Objectives, names, brief dialogue, and item/UI text | Recheck terminology, register, and proper-name display during the integrated pass. | Korean generally preserves the source meaning. Quest names, item/effect terms, and proper names remain subject to cross-corpus consistency review. | Medium |
| 27952, 27959, 27962, 27969, 27973, 27984, 27999-28000 | the First / House of Sorrows / Beckoned / Basilica Gnostra / natural-order insult / Maire, Queen of Cups / Narca / Murghan | Reconcile setting-specific title, faction, institution, and creature terms. | Korean preserves the narrative relationships, but `the First` and the House/Narca terminology have unresolved corpus-wide forms. ID 27952's `초대자` can mean someone who invites, which may not convey a title/name `the First`; retain for terminology review rather than normalize in isolation. | Medium |
| 27954 | `페이 궁수` for `Fae bowyer` | Correct the role meaning in the later approved review: a bowyer makes bows; an archer uses them. | English says the Fae bowyer shaped the bow; Japanese says `弓師` and Chinese says `制弓匠` (bow maker). Korean `궁수` means archer and changes the person's craft. Candidate meaning: `페이의 활 제작자`. | High |
| 27958 | Freezing duration `200%`; Ice Barrage damage `55%` | Preserve both distinct modifiers and exact values. | All locales agree on the 200% duration increase and 55% Ice Barrage damage increase. Korean keeps both values and identifies the affected effects. | High |
| 27961 | `Motus Mining Interests` as `모투스 광업 회사` | Confirm the corporate name and whether `Interests` is part of its formal organization name. | English and Chinese identify a gnome concern/company; Japanese shortens the name. Korean conveys the company sense while retaining the full English name. | Medium |
| 27964 | Witness saw the crime but did not identify its perpetrator | Preserve the source's unspecified perpetrator; avoid importing gender or an attack method. | English, Chinese, and Korean leave the perpetrator unspecified. Japanese adds a female victim and an attack, neither explicit in English. Korean follows the English evidence. | Medium |
| 27967 | `로건이 벽돌 한 무더기처럼 쓰러졌어` | Preserve the idiomatic force of “dropped like a ton of bricks” without making the image sound literal if the intended sense is a sudden/heavy fall. | The English/Chinese use the brick image; Japanese likewise describes collapsing like a pile of bricks. Korean retains the image and conveys a heavy fall, but the idiom may sound literal. | Medium |
| 27975 | `까칠한 독신남` for “crusty bachelor” | Retain the teasing toast and distinguish “crusty” as gruff/curmudgeonly rather than physically crusted. | Japanese treats the line as a toast to a difficult bachelor; Chinese emphasizes stubbornness. Korean's `까칠한` is a plausible personality reading. | Medium |
| 27985, 27990 | `Coveted Drink for Tester` / fragment `from Stealth` | Determine whether the tester label is internal text, and preserve the incomplete source fragment without inventing its missing clause. | Korean translates the tester label. `from Stealth` remains a concise state/source fragment as `은신 상태에서`; Japanese supplies a parenthetical “while in stealth.” | Medium |
| 27986 | Stealth skill increase `3` | Preserve the exact amount and temporary effect. | All locales specify a temporary +3 Stealth skill increase. Korean retains the value; whether the UI should display “points” or “levels” depends on the project's stat-label convention. | High |

## Historical Audit Reconciliation

- The 27900-27999 source-keyed inventory groups Flashing Blade, Southern
  Alfar, Laboratories, the Hierophant threat, Master Byrnes, the Tirin poem,
  the unnamed pronoun, Lyria, Murghan, Crossing Keepers, the Hagni letter,
  Crudok trigger, Caledus/stones, Windstones, Arcadium, speech potion,
  `<Unnamed Region>`, the First, and Seelie/Unseelie.
- It also flags the Fae bowyer, Log Manager, pack, Dannestar, Motus Mining
  Interests, brick idiom, Basilica Gnostra, natural-order insult, bachelor
  toast, Lord's Livery, Queen of Cups, stealth stat/fragment, sword maxim,
  Straton's musings, and Narca affliction. These questions remain open.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 27951-28000 once,
  in identical order.
- Actual embedded line-break counts and normalized runtime-token identities
  and order match across all four locales.
- The 200% and 55% modifiers at 27958 and the +3 value at 27986 are
  preserved. No unexpected Unicode format character was found.
- No key/order or structural exception was found. Korean wording and all
  CSVs were not edited.

## Batch Status

IDs 27951-28000 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 28001.
