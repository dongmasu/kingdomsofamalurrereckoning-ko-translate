# Preliminary Language Scan: `default` IDs 35801-35850

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 35801-35850 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, and source-keyed historical questions.
- Read-only preliminary findings, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 35802 | `곡괭이 각도` | Check the lock-picking tutorial context; `pick` here likely means a lockpick, not a mining pickaxe. | English instructs using the right-stick icon to adjust the pick's angle; Japanese says pick and Chinese explicitly says lock-opening tool. Korean `곡괭이` names a mining implement. The `#NAMED_ICON_360_RS#` token itself is preserved. | High |
| 35804 | `그들에게 대신 감사 인사를 전하네` | Reassess who thanks whom: English speaker thanks the addressee *on behalf of* the speaker's people. | Korean can instead be read as conveying thanks *to* the people (`그들에게 ... 전하네`). English/Chinese clearly position the people as beneficiaries represented by the speaker. | High |
| 35810, 35820 | Shadow Flare 10%, Madding Wind key | Confirm named ability/location forms while retaining Bleeding/Poison +20% and the key's upper-right control-room destination. | Korean has the damage percentages and direction; names require a corpus-wide glossary pass. | Medium |
| 35818, 35821 | `과부` for `The Widow`; `후원자` for `Den Patron` | Confirm whether the Widow is a formal title and `Den Patron` means a regular customer, sponsor or spiritual protector. | Japanese reads `Den Patron` as regular customer, Chinese as den's guardian deity, Korean as sponsor. The standalone label cannot resolve the role. | Medium |
| 35824-35826 | friendly Cliff Barghest, `우물` for Well | Verify whether the named Well here is the same spring/structure referred to elsewhere; retain that the friendly Barghest helped repel attackers. | Japanese interprets Well as spring, Chinese as well; Korean uses well here after using spring for other Wells. | Medium |
| 35830-35832 | Executioner/Last Breath, Beast, Requiem | Standardize names of armor, Fateweaver card and ship; retain that the Beast signals change rather than death. | Korean preserves the historical armor claim as hearsay, the card reading distinction, and the pirate's ship theft. | Medium |
| 35836 | `형기 집행` for `Serve Sentence` | Determine whether this is a command for a prisoner to *serve* a sentence rather than for authorities to execute it. | Japanese reads execution of punishment, Chinese reads serving time. Korean may imply carrying out a sentence by the state. The UI context is absent. | Medium |
| 35840 | `실패 속에서 제정신을 잃었다` for `in my failure, I forgot myself` | Check whether the speaker forgot their identity/history rather than lost sanity. | English `forgot myself` is ambiguous; Chinese reads memory loss, Japanese self-forgetting. Korean specifically asserts loss of sanity, despite the immediate Denric/king identity contrast. | Medium |
| 35843 | `긍지의 잭`, `볼간의 거장들` | Confirm Knave of Pride as a formal rank/card and Bolgan Masters as enemy class, not necessarily literal masters of Bolgans. | Japanese calls Knave a House attendant and Chinese transliterates; Korean chooses a playing-card Jack. These proper-name interpretations need context. | Medium |
| 35849 | `울음의 왕` | Standardize Weeping King title against other appearances. | English proper title and Japanese/Chinese interpretations differ in tone; Korean literally emphasizes crying. | Medium |

IDs 35801, 35803, 35805-35809, 35811-35817, 35819,
35822-35823, 35825, 35827-35829, 35833-35835, 35837-35839,
35841-35842, 35844-35848, and 35850 generally retain the English
meaning on this first reading. Character register and named terms
remain integrated-pass questions.

## Historical Audit Reconciliation

- The preserved source-keyed historical log was compared with the
  active text and the three references for recurring Beckoned, ability,
  item, location, Fateweaver, and character-name patterns. The log
  contains no source-keyed row for IDs 35801-35850 in its recorded
  35800-35999 entry; no historical approval is inferred from that gap.
- Pickaxe/lockpick and agent-of-thanks questions above are newly
  recorded preliminary findings, not authorization to edit CSV text.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 35801-35850
  once and in identical order. No embedded line-break or runtime-token
  sequence mismatch was found.
- The `#NAMED_ICON_360_RS#` token is byte-identical in all four
  texts at ID 35802; 20%/10% at 35810 is preserved.
- Active Korean `default` CSV SHA-256 remains
  `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 35801-35850 received one preliminary reading. Findings remain
open candidates. Continue at `default` ID 35851.
