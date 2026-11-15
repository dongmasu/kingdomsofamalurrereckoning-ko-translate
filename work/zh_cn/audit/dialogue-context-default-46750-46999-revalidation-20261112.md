# Sequential `default` Revalidation: IDs `46750`-`46999`

- Date: 2026-11-12.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 73 previously recorded four-language fingerprints; all match.
  Added the other 177 IDs to the review ledger.
- Six current correction candidates and 11 evidence-limited holds remain.
  `46789` has a separate unresolved measure-word question; 234 IDs have no
  current finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Existing ledger rows remain unchanged as historical records; this
report records the current revalidation.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `46789` | Meaning / terminology | `Asker's Draught` is the established family drink/ale, but this row calls it `애스커의 영약`. Related rows `32354` and `53785` use `아스커의 약주(Asker's Draught)`. Align the named drink to that form; keep the separate measure-word issue below unresolved. | High |
| `46830` | Meaning | English says the armor is named for a mysterious knight who guarded a river crossing until slain by a *questing* House of Ballads hero. Korean retains the guard, crossing, and hero but omits the questing qualifier. Consider preserving that the hero was carrying out a quest or mission; do not add an unsupported event. | Medium |
| `46868` | Format | The standalone, capitalized activity label `Antelope Racing` has no English pairing. Consider `영양 경주(Antelope Racing)`, scoped to this label rather than generic mentions of antelope racing. | Medium |
| `46948` | Meaning / naturalness | `Master of the Font` is rendered `샘(The Font)의 주인`, which can suggest ownership. Japanese `泉の管理者` supports a keeper/manager reading. Consider `샘(The Font)을 관리하는 노메론(Nomeron)이니까 알지`, preserving the rest of the line. | Medium-high |
| `46978` | Name format | `Cadsymyr` is a named person/entity and already has the established form `카드시미르(Cadsymyr)` elsewhere. Add the English pairing without changing the sentence's meaning or casual register. | High |
| `46979` | Objective format / name format | The objective `Kill Ticneri` is rendered `틱네리 처치`, without the established `-하기` action form or the source name. Consider `틱네리(Ticneri) 처치하기`. This is an objective label, not a speaker turn. | High |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `46781` | Terminology | `His Testament` may mean Belen's teaching, doctrine, or institution. Japanese and Chinese construe the term differently, while Korean leaves `테스타먼트` untranslated. Retain pending a setting-wide term decision. |
| `46789` | Naturalness / measure word | `한 묶음 만들겠어` is awkward for `a batch of` a brewed drink, but the sources do not establish whether to count a batch, brewing, or vessel. A possible direction is `한 번 빚어 놓겠어`; do not treat that wording as settled. |
| `46844` | Meaning / title | `honored ones` may denote people who have been honored or a formal class/title. `영예로운 이들` preserves the broad reading; the sign alone does not resolve the referent. |
| `46913` | Proper name / text type | `The Humbled` may be a troupe, a work/title, or another named opportunity for the tragedian. The isolated line does not establish which; retain `굴복한 자들` pending context. |
| `46915` | Proper name / meaning | `the Knave` may be a generic rogue or a named character/title. English capitalization and the differing locale renderings do not settle its referent. |
| `46930` | Meaning | English says only `the food`, while Chinese specifies chicken feed and the next clause mentions chickens; Japanese remains generic. Korean `닭 사료` may be right in context, but this row alone does not establish that specificity. |
| `46951` | UI terminology | `Status` could mean a general status or a status effect. Korean `상태 효과 필요` selects the latter; retain pending stronger UI context. |
| `46952` | Meaning / referent | The antecedent of `them` is not present in this row or resolved by the locale references. Korean preserves the plural pronoun without inventing an antecedent. |
| `46969` | Source conflict / meaning | English says Gavroche had a broken sword he could mend, but Japanese and Chinese say he could not; related quest records also say he could not. Current Korean follows English. Keep the translation unchanged until this material source conflict is adjudicated. |
| `46991` | Meaning | `collections` may mean donations or collected objects. Japanese supports donations, Chinese supports objects, and Korean selects donations. The row and asset association do not settle the referent. |
| `46992` | Lore terminology | Capitalized `the Cycle` may be the setting's named cycle, but the source does not say `Great Cycle`; Japanese and Chinese also differ in nuance. Korean `대순환` may over-specify the title. Retain pending term-context review. |

## Rechecked Findings and Structure

- Fifty-nine exact-English duplicate groups touch the range and cover 1,183
  corpus rows. Korean differs in two groups. At `27231`/`34708`/`45178`/
  `46780`/`56073` (`Later, then.`), Japanese distinguishes `後で` at `27231`
  from `後でな` at the others. At `44710`/`46798` (`Keep going.`), Japanese
  distinguishes plain `進もう` from polite `進みましょう`. The Korean
  differences follow those source distinctions; no forced unification is
  proposed.
- Six entries contain line breaks: `46813` (2), `46846` (28), `46865` (4),
  `46883` (8), `46950` (1), and `46958` (1). All four languages have matching
  per-row counts and 44 total breaks; Korean embedded separators are CRLF.
- Runtime/control tokens, markup, and their order match across the four
  languages, including `{1}`/`{2}` at `46907` and `$KV05.bribe_cost$` at
  `46974`. The values at `46805`, `46873`, `46950`, and `46958` were retained.
- Of 250 IDs, 190 have indexed asset associations, including 117 of the 177
  newly recorded IDs. Three IDs link to multiple assets. Asset associations
  do not establish per-key speakers, addressees, branches, or playback order;
  unsupported attribution and order remain unknown.

## Prior-Record Reconciliation

- The accepted correction at `46799` is present: `do not flinch from the
  Winter` is rendered as not fearing winter.
- The former finding at `46850` is not confirmed by the current four-language
  row: `함께 일해서 좋았어. 자질이 있군.` is natural and preserves the
  meaning/register. Its ledger reference points to
  `dialogue-context-five-small-assets-revalidation-20261111.md`, which does
  not include ID `46850`; the historical ledger row is left unchanged.
- A former candidate at `46998` cites a Belen's Testament term, but the
  current English row is about water from a nearby cistern and contains no
  Testament reference. Do not apply that candidate to this ID. The historical
  ledger row and report are left unchanged.
- The earlier `46948` keeper/ownership candidate remains supported by the
  current Japanese and English. Findings for `46789`, `46844`, `46868`,
  `46969`, `46978`, and `46979` were also rechecked against the current text.

## Range Result

- The range has six correction-candidate IDs and 11 evidence-limited holds;
  `46789` has both a correction candidate and a separate measure-word hold.
  The other 234 IDs have no current finding.
- After appending 177 new IDs, the ledger covers 51,773 of 65,135 unique
  `default` IDs (79.49%), leaving 13,362. Sequential coverage reaches
  `46999`; next is `47000`-`47249`. Of reviewed IDs, 41,568 have indexed
  asset links and 10,205 do not.
- No translation CSV was changed. Candidates remain proposals requiring
  separate approval.
