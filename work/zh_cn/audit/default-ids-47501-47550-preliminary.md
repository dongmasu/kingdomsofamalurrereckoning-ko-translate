# Preliminary Language Scan: `default` IDs 47501-47550

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 47501-47550 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 47503 | The White Dove / `하얀 비둘기` | Confirm whether this is a proper title/name or a descriptive phrase. | English capitalizes the label and the historical notes flag it as a possible proper title; Korean renders it literally without resolving that status. | Medium |
| 47511 | “she herself has fallen” / `본인이 타락했다는 소문` | Clarify whether the Priestess has morally/spiritually fallen, lost her healing power, or both. | English and Chinese allow a “fallen” reading; Japanese says she herself has lost power. Korean retains the English/Chinese moral-fall sense without resolving the source ambiguity. | Medium |
| 47514 | Hanged Men / `교수형 당한 자들` | Verify whether `the Hanged Men` names a group/faction or refers generically to executed men. | English capitalizes the term; Japanese calls them a pirate group, Chinese suggests hanged ghosts, and Korean follows a literal plural-person reading. | Medium |
| 47532 | Zosime / `조시메` | Confirm the canonical spelling and note the Chinese-source formatting anomaly. | Korean transliterates the name; the Chinese source text has a trailing U+FEFF after its name, absent from English, Japanese, and Korean. | Medium |
| 47536 | Aurela / `아우렐라`; Japanese `コレロン` | Resolve the named follower's identity from the English/Chinese versus Japanese references. | English and Chinese say Aurela; Japanese instead says Corelon. Korean follows English and Chinese. This is a source/reference conflict, not a confirmed Korean error. | High |
| 47537 | Counsel / `조언자` | Determine whether capitalized `Counsel` denotes a named adviser, an institution, or generic counsel. | Korean chooses a generic singular adviser; English capitalization and the historical note leave the referent open. The rest of the sentence about finding a flaw and learning about the Cipher/Hyperian is retained. | Medium |
| 47542 | Seven shipwreck accounts; Almain Sojourner I | Preserve all ship categories/ranks and clarify the survivor count and settlers' fate. | All locales describe seven wrecks. English says “a dozen survivors”; Korean follows that, while Japanese says about ten and Chinese says more than ten. English “can't say the same for the settlers” is interpreted in Korean as their not surviving, a plausible but explicit resolution. | Medium |
| 47549 | Block / `막기` | Confirm the official combat/UI term for this isolated label. | The one-word English label does not establish whether this is a stat, action, or menu category; Korean uses the action noun. The historical notes specifically flag the term. | Medium |

The historical spellings `Rhiad` (47556, outside this batch), `Faitir`
(47567, outside this batch), `Dverga`, `Ayten`, `Peta Raesdic`, `Nina
Malloi`, `Sinon Carrag`, `Mallion`, `Bridgette Malloi`, and ship names/
classes remain corpus-wide terminology questions; only in-range occurrences
were assessed here.

IDs 47501-47502, 47504-47510, 47512-47513, 47516-47535,
47537-47541, 47543-47548, and 47550 generally retain the English meaning
on this first reading. Names, gameplay terminology, and source ambiguities
remain subject to integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 47450-47549. It flags
  `Hanged Men`, `The White Dove`, `Counsel`, ship categories and ranks,
  `with Daggers`, `First Scaith`, `Revival`, `Block`, and the source's
  implied fate of the Almain settlers.
- The same history identifies the name and ship terminology questions in
  this range. The adjacent entry for IDs 47550-47649 flags ID 47550's
  singular `crypt` shifting to plural `They`/`halls`; Korean preserves the
  likely reading of one complex of old halls.
- ID 47536's Aurela/Corelon divergence was checked in the four active
  locale sources; no reference was silently treated as overriding English.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 47501-47550 once
  and in identical ascending order.
- All four locales preserve 26 embedded line breaks in ID 47542 and retain
  the seven ship entries and their Roman-numeral ranks.
- ID 47515 retains the identical `#NAMED_ICON_360_RT#` marker in all
  locales. No brace-style runtime tokens occur in this batch.
- The Chinese source alone has a trailing U+FEFF in ID 47532. No other
  special hidden whitespace was found; the Korean working CSV was not
  changed.
- Explicit values `150 Poison Damage`, `5 Seconds`, and `100 locations` are
  retained. No structural exception was found.

## Batch Status

IDs 47501-47550 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 47551.
