# Preliminary Language Scan: `default` IDs 51601-51650

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 51601-51650 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 51603 | Gallows End / `교수대 끝` | Standardize this place-name against the translation map and corpus conventions. | English names Gallows End. The active Korean CSV says `교수대 끝`, while the Korean translation map says `갤로우스 엔드`; the historical audit explicitly says not to overwrite either without resolving the manual-edit discrepancy. | High |
| 51605 | “You can't walk ten paces without bumping into one” | Preserve the hyperbolic warning about liars/cheats and the abrupt “Whitestone. Hate this town.” fragment. | Korean retains the short distance, encounter, and emphatic dislike; the target of “one” is understood from the preceding sentence. | Medium |
| 51610 | Bonus Challenge placeholders | Preserve `{1}`, `{2}`, and `{3}` identities and confirm the localized argument order. | English, Japanese, and Korean use `{2}` enemies before `{3}` method. Chinese reorders them as `{3}` method before `{2}` enemies to fit the sentence; all placeholder identities and progress values remain present. Treat this as a localized order difference, not a missing-value finding. | High |
| 51611 | “more amenable later” / `더 마음을 써 줄지도` | Preserve the speaker's patience and hope that the listener may become more willing to help. | Korean renders amenability as showing more consideration; the underlying request is context-dependent. | Medium |
| 51617 | Crystal War / `수정 전쟁` | Confirm the official Korean event/title form. | Korean follows the crystal sense; the name remains a corpus-wide capitalization/terminology candidate. | Medium |
| 51618 | Witchknight Anira / `마녀기사 아니라` | Confirm whether Witchknight is one compound rank/title and standardize the name's spelling. | Korean retains both title and person name; historical notes list Witchknight Anira among recurring names. | Medium |
| 51622 | vengeance / `복수는 내 손으로 해냈어` | Preserve that vengeance has already been carried out, while retaining the speaker's surprise at not feeling satisfied. | Korean makes the completed revenge explicit; English/Japanese retain an emphatic “Vengeance is mine!” fragment. | Medium |
| 51625 | Varani father / bounty duels / Alfar peoples | Preserve the sequence from releasing defeated bounty captives to attracting challengers and the family's resulting poverty; standardize the two Alfar varieties. | Korean retains the full account and identifies Ljosalfar, Dokkalfar, and Almain. The contrast between armed and unarmed combat is preserved; names and “Champion” context remain lore-dependent. | High |
| 51626 | one-week loan / `일주일 뒤에 갚아야` | Preserve the due date and the implied threat of penalties if repayment is missed. | Korean retains the one-week repayment period and ellipsis before the threat. | High |
| 51628 | Majestics / Carver / Architect / Shaper | Confirm whether these capitalized roles are formal entities/titles and preserve the three-line mythic progression. | Korean retains all three line breaks and the emergence/response/creation sequence. It interprets Shaper as composing a story; the exact meaning of “composed” is lore-dependent. | Medium |
| 51629 | Castle Gastyr bard / `궁정 음유시인` | Preserve the bard's three parallel storyteller roles and the contrast between his former expertise and the Bolgan invasion. | Korean keeps all story-spinning imagery and the invasion turn. | Medium |
| 51631 | “I missed the Battle of Mel Senshir” / `전투는 놓쳤어` | Confirm whether `missed` means the speaker was absent from the battle or nostalgically misses it. | Korean says the speaker missed the battle, which can support either reading; Japanese sounds nostalgic, while English/Chinese can mean absence. | Medium |
| 51633 | Flame of Rhyderk / `라이더크의 불꽃` | Confirm the canonical name and whether this is a named item/relic. | Korean preserves the title and flame; the spelling is a consistency question. | Medium |
| 51638 | the families / `가문들` | Confirm whether “families” are formal factions/House groups and preserve the threat of a fight to the death with the mayor. | Korean keeps both sides and the lethal outcome; historical context may determine whether “families” should be capitalized. | Medium |
| 51641 | Icebrine Coast / brother's death | Preserve the speaker's intention to travel there after the war and tell the brother how the man died. | Korean retains the location, timing, recipient, and death information. The sentence is a journal objective/plan, not a completed action. | Medium |
| 51643 | apology for leaving Ironfast / `떠나던 방식` | Preserve that the speaker apologizes for how they left, and that the last sight of their mother was her departure to the ruins. | Korean retains both temporal details; the exact manner of leaving remains unstated. | Medium |
| 51644 | Cranalt artifact configurations / Rond Farm madness | Confirm the artifact's setting/configuration term and preserve that one configuration should cure the farm's madness. | Korean retains the missing parts, Jenniker's journal, multiple configurations, and tentative expected cure. | Medium |
| 51646 | “You return, box and all?” / `상자까지 통째로 가져왔구나?` | Preserve the teasing rebuke that the box should have been opened, followed by the grudging acceptance of the task as complete. | Korean retains the unopened-box implication and the decision to count the task complete. | Medium |
| 51648 | Dead Kel / threatened consequence | Preserve the warning not to have lied about the ship and the implied danger to the whole group. | Korean retains the arrival question, conditional lie, and threat from Dead Kel. | Medium |
| 51649 | “Gods be with you” / `신들의 가호` | Confirm the established blessing formula and divine terminology. | Korean retains the conventional farewell blessing; this remains a consistency candidate. | Low |

Other names and recurring terms in this range, including Galafor, Gallows
End, Akara, Anso Attwater, Whitestone, Alabastra, Quay, Cairns, Crystal
War, Witchknight Anira, Varani, Alfar, Dokkalfar, Almain, Gastyr, Bolgan,
Mel Senshir, Rhyderk, Sari Cemble, Kandrian, Icebrine Coast, Ironfast,
Cranalt, Jenniker, Rond Farm, Niskaru, Dead Kel, and the Majestics,
Carver, Architect, and Shaper remain subject to corpus-wide terminology
and bilingual-name consistency review. Existing Korean forms were
preserved.

IDs 51601-51602, 51604, 51606-51609, 51612-51616, 51619-51621,
51623-51624, 51627, 51630, 51632, 51634-51637, 51639-51640,
51642, 51645, 51647, and 51650 generally retain the English meaning
on this first reading. Names, idioms, UI labels, and lore terminology
remain subject to integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 51550-51849 and the
  existing map/CSV discrepancy log. This batch intersects the `Gallows End`
  translation-map mismatch at ID 51603. The map contains
  `갤로우스 엔드(Gallows End)` while the active work CSV contains
  `교수대 끝`; neither was changed. The bonus-challenge placeholder order
  at ID 51610 was also checked directly: only Chinese reorders `{3}` and
  `{2}`, preserving all four placeholders.
- Historical questions remain open, not review approvals.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 51601-51650 once
  and in identical ascending order.
- Line-break counts and hidden-format checks match. ID 51610 preserves
  `{1}`, `{2}`, and `{3}` in every locale, with a Chinese-only localized
  order difference. No other runtime-token, line-break, or
  literal-backslash exception was detected.
- No translation CSV edit was made. Active CSV SHA-256 values remain equal
  to the recorded immutable baseline.

## Batch Status

IDs 51601-51650 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 51651.
