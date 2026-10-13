# Preliminary Language Scan: `default` IDs 38801-38850

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 38801-38850 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, available historical terminology notes, line
  breaks, runtime markers, values, and recurring terms.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 38810 | knuckles player / `주먹패 게임의 고수` | Verify the named knuckles game and avoid reading “knuckles” as a gang or group of people. | English means a player of the knuckles game; Japanese describes a fist/knuckles game and Chinese identifies a knuckle-bones game. Korean `주먹패` can suggest a gang, not the game. | High |
| 38815 | scavs / `약탈자들` | Determine whether Scavs is the named enemy species/type, then standardize it instead of using a generic “raiders” label. | The line refers to the last Scavs in a game location. Japanese preserves the enemy name, while Chinese localizes it as a specific creature; Korean uses generic raiders. | Medium |
| 38823 | Cur / `그 개` | Confirm whether `Cur` is a named character/title or a generic insult and translate the intended force. | English capitalizes the one-word label and asks who the Cur is. Japanese transliterates it, Chinese gives a different descriptive reading, and Korean calls the referent “that dog.” | Medium |
| 38826 | Master Makers / `장인회 우두머리들` | Verify the formal group/title and whether this means the Master Makers themselves or leaders of a separate guild. | English capitalizes Master Makers as a collective; Korean's `장인회 우두머리들` can shift the reference to the group's chiefs. Japanese and Chinese also render the term differently. | Medium |
| 38839 | codex / `암호문` | Correctly distinguish a lore book/codex from an encoded message; confirm the named book reference. | English calls it a codex, Japanese identifies a book of fate, and Chinese says a codex/law book. Korean `암호문` means ciphertext and appears to change the object type. | High |
| 38845 | Travelers / `여행자들` | Check whether the capitalized Travelers is the named faction and use the established group form. | English describes a group harmed by this person's actions; Korean uses the generic plural “travelers.” Prior audits repeatedly track the Travelers as a faction/name. | Medium |

IDs 38801-38809, 38811-38814, 38816-38822, 38824-38825, 38827-38838,
38840-38844, and 38846-38850 generally retain the English meaning on this
first reading. The English uses singular “he” in the Kobold instruction at
38840; Korean preserves the implicit referent. Proper names, lore, register,
and UI context remain subject to integrated review.

## Historical Audit Reconciliation

- The historical source-keyed open-question log has a documented gap covering
  IDs 37700-40349. Earlier notes on the knuckles game, Codex naming, Master
  Makers, Scavs, and Travelers were considered; no prior candidate is
  treated as an approved disposition.
- The Codex-versus-cipher distinction is retained as a specific open
  terminology/meaning candidate.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 38801-38850 once
  and in identical order.
- Embedded line-break counts match. At ID 38837, the `{*1[...]}` runtime
  wrapper and marker order are preserved; the label payload is localized as
  expected.
- IDs 38811 and 38814 retain their challenge conditions (five consecutive
  hits; enemy four levels higher). House-upgrade price variable and named
  icon markers at 38801 and 38824 are preserved.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 38801-38850 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 38851.

## Subsequent Working Disposition

The separate disposition pass is recorded in
`disposition-batch-default-38801-38850-20261010.md`: two accepted, one
`not an issue`, and four uncertain findings. Accepted corrections at IDs
38810 and 38839 fix the game-name mistranslation and the ciphertext/object
type confusion. The preliminary scan is not independent final review.
