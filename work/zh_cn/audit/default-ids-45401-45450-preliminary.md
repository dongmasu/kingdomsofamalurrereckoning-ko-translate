# Preliminary Language Scan: `default` IDs 45401-45450

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 45401-45450 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 45408 | Tirin / Jottun / Keloren / Bayala poem | Verify names and imagery, especially `the fleshy weight of steps`, and retain the poem's internal line divisions. | Korean preserves the source's five line breaks and its sequence of Jottun, trampling, fallen warriors, Keloren's dispersed legion, Bayala's unanswered prayers, and approaching death. Proper-name forms and one source's extra space before punctuation remain open. | Medium |
| 45416 | escape / guards / jail markers | Preserve all three localized `*1` marker identities and note the locale-specific sequence difference. | English, Korean, and Chinese order payloads as escape, guards, jail; Japanese orders them guards, jail, escape. All three marker occurrences remain present. | High |
| 45421 | White Palm / scavenger hunt / Summer Court letter | Confirm the White Palm group name and what “scavenger hunting” entails; standardize Ysa, Summer Court, and High King Titarion. | Korean preserves the eight line breaks, false-trail explanation, scavenger-hunt continuation, recalled meeting, and `A. S.` sign-off. The source leaves the exact search task implicit. | Medium |
| 45424 | `Fine day` / `Ynadon is just` | Preserve or otherwise account for the English weather/justice wordplay without changing the deity claim. | Korean says the weather is good and that Ynadon is just/fair, retaining both propositions but not the shared English word `fine`. Japanese also separates the ideas. | Medium |
| 45429 | `Russian Federation` | Determine whether this is intentional player-facing text, a test string, or metadata. | The isolated real-world country name is unusual in the fantasy setting; Japanese shortens it to Russia, while Korean and Chinese give the full federation name. | Medium |
| 45438 | `Quartenion hand` / `쿠아르테니온 서체` | Confirm whether `Quartenion` names a script/handwriting style and standardize Erathi/Mitharan terms. | Korean interprets `hand` as a writing style, consistent with the context of an original scroll; Japanese/Chinese render it more literally as a hand/script. | Medium |
| 45443 | Octienne `indisposed` | Keep the reason for Octienne's unavailability unspecified; check whether the Korean wording implies more than the source. | Korean says he became unable to perform his duties. English `indisposed` does not establish whether he is ill, absent, or otherwise unavailable; Japanese suggests unwillingness, Chinese says he withdrew. | Medium |
| 45444 | mason's “signatures” / `서명` | Confirm whether `signatures` means literal signatures or identifying marks/work left in the city by a mason. | Korean preserves the claim that the marks could fill a book, but the literal `서명` (“signatures”) may obscure the craftsman's-work metaphor. Japanese and Chinese choose signatures/marks. | Medium |
| 45445 | Bayala's Spring / `바야라의 봄` | Determine whether `Spring` names a season, a water source, or a location; standardize Bayala. | Korean and Chinese read it as spring, while Japanese explicitly says early spring. The isolated label cannot establish whether it is a proper place name. | Medium |
| 45447 | the Champion / `용사` | Confirm whether Champion is a formal title/name and align it with established Korean terminology. | The capitalized title is rendered as a generic hero/champion; English, Japanese, and Chinese preserve a formal Champion reference. | Medium |

IDs 45401-45407, 45409-45415, 45417-45420, 45422-45423, 45425-45428,
45430-45437, 45439-45442, 45446, and 45448-45450 generally retain the
English meaning on this first reading. Names, setting terms, and UI labels
remain subject to integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 45350-45449. It flags
  Cartery Jayck, Lykeios, Faitir/Scaith, Nyralim, Mad Men, Circle of Strife,
  thresh/Ingress, Bloody, Crossfire/Talon Strikes, High Fulgen, the White
  Palm letter, Ynadon's line, Russian Federation, Quartenion hand, Lapidus
  Root, Octienne, signatures, Bayala's Spring, and the blood-in-boots poem.
- The letter at 45421 retains all source paragraph/line divisions and the
  separate `A. S.` signature. The source's use of `scavenger hunting` remains
  context-dependent.
- The historical notes said runtime marker identities/order were retained
  at 45416. Direct comparison finds all identities/counts retained but a
  Japanese-only localized payload reorder; Korean matches English and
  Chinese.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 45401-45450 once
  and in identical ascending order.
- All four locales preserve matching line-break counts. ID 45408 preserves
  five line breaks; the multi-paragraph letter at 45421 preserves its
  paragraph structure.
- ID 45402 expresses that the player is not alone; Japanese writes `1`.
  ID 45444's Japanese `1` book is equivalent to the other locales' singular
  “a book.” ID 45427 retains +35%.
- At 45416, the three `*1` markers retain their identities and count; only
  Japanese changes payload order. No other runtime-token, numeric-value, or
  hidden-formatting discrepancy was found.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 45401-45450 received one preliminary reading. The working dispositions
are recorded in
[`disposition-batch-default-45401-45450-20261010.md`](disposition-batch-default-45401-45450-20261010.md);
they are not independent final linguistic approval. Continue at `default`
ID 45451.
