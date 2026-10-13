# Preliminary Language Scan: `default` IDs 44801-44850

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 44801-44850 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 44801 | character choices / `캐릭터 설정` | Confirm whether the UI asks about character choices/build or overall character setup; retain the question's friendly tone. | English asks whether the player is happy with their character choices. Korean says “character setup,” which may be broader; Japanese and Chinese also use a generic character-choice/setup reading. | Medium |
| 44807 | Wolds meditation | Preserve the contrast between mortal life as joyless work and the speaker's concern about magic fading. | Korean retains the source's four-line paragraph structure and all rhetorical questions. Japanese and Chinese also retain three embedded line breaks. | Low |
| 44809 | jagged hooks / `금속 갈고리` | Keep the hooks' relation to the haft and the bearer’s delight in causing pain; verify the item term from context. | Korean retains the hooked metal, bearer, victim, pain, suffering, and delight. The metaphor is unusual but follows the English. | Low |
| 44812 | Lockpicking Skill / `{*1{1}}` | Preserve the exact nested runtime marker and confirm the localized label. | Korean retains the lockpicking label and nested marker identity/order; the marker and numeric field match all four locales. | Low |
| 44816 | Quay / `키웨이` | Confirm whether Quay is a character's name, title, or place and standardize its Korean spelling. | The journal entry says to locate Quay and tell him the discovery. Korean preserves the masculine referent and objective; Japanese/Chinese use similar phonetic forms. Historical notes leave the identity open. | Medium |
| 44818 | Brad and Cergren, Traders, of Tirin's Rest / `상인 브래드와 세르그렌` | Retain that both are traders associated with Tirin's Rest; confirm whether the record is a ledger/tally and whether the location/title belongs in Korean. | English identifies both as Traders of Tirin's Rest. Korean calls them merchants but omits Tirin's Rest; Chinese includes the location and merchant-ledger sense. | Medium |
| 44820 | “peaked early” / `일찍 정점에 오른 뒤` | Preserve the idiom of early success followed by decline into drink, without adding a literal peak or an unsupported cause of death. | Korean retains early success and retreat into a bottle while the person waits to die. The neighboring locales paraphrase the idiom differently. | Low |
| 44822 | Anker Edmure / Donnel / Gwar Gwydern | Confirm spellings and make the killed assistant and later recipient of the handwraps/gloves unambiguous. | Korean says Donnel was killed by Gwar Gwydern and Edmure gave the item to another person. The English makes the same sequence clear; names remain provisional. | Medium |
| 44827 | Kollossae/Mairu history passage | Preserve the English historical claims and paragraph layout; review the source's “principle” wording as a likely typo without silently changing its count. | Korean preserves four differences, the combat/motivation contrast, giant-alliance history, and oral/written-literature account. English, Korean, and Chinese have two embedded paragraph breaks; Japanese has one, omitting one separator. | Medium |
| 44828 | IT Tech / `IT 기술자` | Confirm whether this is an intended UI label or internal/test text, and use the project's UI terminology consistently. | Korean preserves the abbreviated English role as an IT technician; the exact in-game label context is not established. | Low |
| 44835 | Wolds / Great Cycle / `월즈` / `대원환` | Confirm established place/cycle terminology and retain the poem's five-line imagery and causal relationship. | Korean preserves all five lines and the progression from mortal cultivation to fading Fae magic, Great Cycle, and aging fields/people. The English/Japanese/Chinese lines have four embedded breaks each. | Medium |
| 44842 | `FAIL LINE` | Preserve the literal internal-looking label pending confirmation whether it is intentional runtime text. | Korean leaves the English test-like label unchanged; Chinese renders it as “failed dialogue.” The source-keyed historical log identifies it as likely internal/test text. | High |
| 44844 | Gallows End / `교수대 끝` | Confirm and standardize the proper place-name rather than translating it literally. | English uses a capitalized location name; Korean renders it as “end of the gallows.” This joins the already documented corpus-wide Gallows End inconsistency. | High |
| 44845 | Wreath / `화관` | Confirm whether `Wreath` is a ceremonial crown/headpiece or a floral wreath and use the established item term. | English says Arkes had a Wreath crafted and was buried with it. Korean chooses `화관`; Chinese says feathered crown and Japanese says flower crown, so the item type is not settled. | Medium |

IDs 44802-44806, 44808, 44810-44815, 44817, 44819, 44821, 44823-44826,
44829-44834, 44836-44841, 44843, and 44846-44850 generally retain the
English meaning on this first reading. Names, setting terms, and UI labels
remain subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical sections for IDs 44800-44849 were checked for
  character choices, Idwa Widfrond, Ciara Sydanus/Archsage, Jottun, Wolds,
  tidal pools, Niskaru, Cape Solace/Quay, Brad/Cergren, handwraps/Sagecraft,
  Gwyn, Tuatha Deohn, Eagonn, Kollossae/Mairu history, Idylla, IT Tech,
  Great Cycle/Wolds, `FAIL LINE`, Arkes/Wreath, and Lyria's blessing.
- The historical log specifically leaves name/lore spellings, Brad/Cergren's
  merchant/title/location punctuation, Quay's identity, the `FAIL LINE`
  status, Wreath type, and the blessing's feminine referent open.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 44801-44850 once
  and in identical ascending order.
- ID 44807 has three embedded line breaks in every locale. ID 44827 has two
  embedded breaks in English, Korean, and Chinese but one in Japanese. ID
  44835 has four breaks in every locale.
- ID 44812 retains the nested `{*1{1}}` marker identity/order and its numeric
  field in all locales. No other numeric-value discrepancy or hidden
  formatting character was found.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 44801-44850 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 44851.
