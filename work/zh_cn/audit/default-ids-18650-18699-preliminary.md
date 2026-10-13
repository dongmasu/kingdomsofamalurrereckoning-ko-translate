# Preliminary Language Scan: `default` IDs 18650-18699

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 18650-18699.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 18650 | trade ledger / Fieriol wine / 905 yards | Preserve the English quantity and unit pending source/context verification; clarify the wine list and exchange syntax. | Korean retains the English 905 yards while Japanese converts this to 827 meters. The English phrase “55 casks Fieriol wines, pale and mulberry” is itself ambiguous; Chinese also differs in its reading of the wine types and transaction. | High |
| 18653, 18655-57, 18659-60, 18668, 18677, 18684-85, 18689, 18695-96, 18699 | Adessa, Ironfast Keep, Castle Gastyr, Sephedra Wyll, Tilera, Crilgarin, Jeibir, Canwen, Ost, Tuatha, Banshaen/Murghan, Uduath, Fellfire Pit, Enser | Track Korean name forms against established occurrences and the project glossary. | These rows contain recurring proper names, factions, or places. Several Chinese/Japanese forms diverge; Korean generally supplies the source spelling parenthetically. Candidates require corpus-wide consistency review, not row-level correction here. | Medium |
| 18661, 18671 | “So long”; “Hello again” | Check compact greeting/parting forms and preserve the source speech act. | Korean `이만` at 18661 is a natural leave-taking. At 18671 Korean `또 보자` reads as “see you again”/a farewell, while English “Hello again,” Chinese `你好啊`, and Japanese `また会ったな` are greetings or recognition on meeting; possible speech-act shift. | High |
| 18666 | `Sr. QA Manager` | Confirm whether the untranslated internal staff-credit title is intentional. | English and Japanese retain the English label, Korean does too, while Chinese translates it. No in-game context is available in this row. | Low |
| 18668 | Traveler / captain / war | Preserve the sequence of Jeibir's roles and check the reference translation of `Traveler`. | Korean preserves the boastful list. Chinese appears to read the first role as “thief” and then omits the conjunction between “young” and “captain”; Japanese keeps Traveler as a named group. Historical question remains relevant. | Medium |
| 18678 | map in strongbox / key in speaker's pocket / “don't return until you do” | Resolve the object of “do” and retain the intended condition for returning. | Korean says not to come back until the map/object is found; the source is elliptical and the Chinese version instead says never return. Historical log also identifies the implied object as context-dependent. | Medium |
| 18680 | “if you can believe it” | Recheck the ironic/skeptical force; avoid wording that can be read as “you can believe it.” | English reports the floating-city claim with an incredulous aside; Japanese says it is hard to believe and Chinese says “believe it or not.” Korean `믿을 수 있겠지만` may instead sound concessive/affirmative. | High |
| 18681-82 | `Hope of the Fatesworn`; “walking dead” | Review doubled quotation marks and formal title/term consistency. | Korean has doubled straight quotes around each quoted phrase (`""...""`), unlike the source's single quotation marks. These may display as malformed punctuation. The Fatesworn title and Crows name are also terminology candidates. | High |
| 18686 | “Great, another death?” | Preserve the dark/sarcastic question without settling its omitted referent. | Korean follows the source's ambiguity; Japanese asks about another way to die, while Chinese renders the line as pleased that someone died. Historical note identifies the referent as omitted. | Medium |
| 18694 | Ethene hymn / Apotharni / Teeth | Verify mythic terms and retain the verse's lineation. | Korean follows the English imagery and its line divisions. Japanese compresses/reshapes several clauses; Chinese interprets “Teeth” as Naros's Teeth. The correct lore referents remain uncertain. | Medium |
| 18698 | “My people ... even they” | Check the shift from first-person group reference to third-person pronoun. | Korean begins `우리 민족은` (“our people”) but continues `그들조차도` (“even they”); this is understandable but may be an unnecessary referent shift. English/Japanese/Chinese keep the same group as subject. | Low |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 18650, 18656, 18662, 18666, 18668-69,
  18674, 18678, 18681, 18686, 18688, 18690, and 18694-95 against the active
  four-locale rows. They remain preliminary questions; no historical note
  authorizes a translation edit.
- Added the possible Korean speech-act shift at 18671, ironic-force question
  at 18680, doubled quotation marks at 18681-82, and pronoun-cohesion question
  at 18698 after direct source comparison.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain IDs 18650-18699
  in identical order.
- No key, row-count, line-break, or detected brace/bracket/angle-token
  difference was found. The 18694 hymn's line structure is preserved in
  Korean.
- The 18650 unit conflict is a source/reference discrepancy, not a structural
  mismatch: Korean follows English's 905 yards; Japanese gives 827 meters.

## Batch Status

IDs 18650-18699 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 18700-18749.
