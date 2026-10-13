# Preliminary Language Scan: `default` IDs 28201-28250

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 28201-28250 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 28201-28217, 28219-28236, 28238-28250 | Dialogue, lore, names, item/UI labels, and objectives | Recheck voice, established names, and terminology in the integrated pass. | Korean generally conveys the English and retains the visible game values. Gravehal, Adessa, Hospitalis Quarters, Plagueshield, Mitharu, King's Thimble, Scion, and Idylla remain part of the historical terminology inventory. | Medium |
| 28207 | `병원 구역(Hospitalis Quarters)` | Confirm the canonical Korean for this named location and whether the objective specifically means soliciting donations from Adessa's human merchants. | English names the Hospitalis Quarters; Japanese generalizes it as a relief area, while Chinese describes medical barracks. Korean retains the English name in parentheses but translates the term literally. The task relation is otherwise preserved. | Medium |
| 28214 | Desert Runner / bird / Rattlesnake in the quoted tale | Resolve the speakers and ownership of the voice, gilding, and wings from the full story context; preserve the existing paragraph and line structure meanwhile. | The English first calls the departing figure a bird, but the reply attributed to Desert Runner says its voice and wings were taken. Japanese and Chinese retain a similar attribution tension. The Korean follows the source sequence and should not silently decide which creature is which. | Low |
| 28218 | `이 거짓말쟁이!` for “You're a lying dog!” | Check whether the insult's force should retain the source's animal-based abuse rather than only its accusation of lying. | English explicitly includes “dog”; Japanese also uses a stronger insult. Korean preserves the accusation but omits the insult component; Chinese uses a different idiom. | Medium |
| 28222 | Save-data capacity prompt | Preserve the prompt's two alternatives and verify the target UI layout independently of the Japanese line break. | English, Chinese, and Korean are one line; Japanese alone inserts a line break before the delete-or-disable-saving question. The wording and alternatives remain present in Korean. | Medium |
| 28226 | Hammer damage lines | Preserve the two distinct hammer modifiers and their signs, units, and line split. | Korean retains `+20` physical damage and `+35%` damage on separate lines; Japanese and Chinese likewise retain the two values. | High |
| 28237 | `시체 확인하기` for “Identify the Corpses” | Determine whether this objective asks the player to identify the corpses or merely inspect/check them. | English uses “identify”; Korean's `확인하기` can mean inspect or verify and may weaken the specific objective. Japanese similarly says to check the corpses, while Chinese uses a term closer to identification. | Medium |
| 28241 | `왕의 골무(King's Thimble)` | Check the established Korean display form for this named venue while retaining English traceability under the project's unresolved bilingual-name convention. | The Korean translates the figurative venue name literally and includes the source spelling; Japanese also renders it literally. Whether this is a title or a wordplay-based venue name remains a terminology question. | Medium |
| 28242 | `사이온(Scion)` / `아카라(Akara)` | Align the formal Scion role and Akara's blessing with the recurring glossary; preserve the speaker's decision to assume the role. | The current Korean retains the sequence of events and the role, and English/Japanese/Chinese support the same basic account. Canonical rendering remains an open corpus-wide question. | Medium |

## Historical Audit Reconciliation

- The source-keyed historical inventory for IDs 28200-28299 flags Gravehal,
  Adessa, Hospitalis Quarters, Apule, Plagueshield, Lyria, Tychon, Draug's
  Toothpicks, Hanged Men, Mitharu, King's Thimble, Dead Kel, Scion, Akara,
  Blades and the Seal, Idylla, and Rathir.
- It specifically asks about the named location/objective at 28207 and the
  speaker, line breaks, and bird/Rattlesnake imagery in the tale at 28214.
  These remain open inputs, not approved interpretations.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 28201-28250 once,
  in identical order.
- Normalized runtime-token identities and order match across the four locales.
  English, Chinese, and Korean line-break counts match; Japanese alone adds
  one line break at ID 28222. Both hammer modifiers at ID 28226 retain their
  values and line separation.
- No unexpected Unicode format character or structural exception was found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 28201-28250 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 28251.
