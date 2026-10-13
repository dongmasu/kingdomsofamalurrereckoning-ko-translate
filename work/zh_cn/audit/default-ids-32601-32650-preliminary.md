# Preliminary Language Scan: `default` IDs 32601-32650

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 32601-32650 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  variables, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 32602 | `대현자님` for the punning `your sageishness` | Preserve the deferential register and consider whether the source's playful “your highness”-like coinage can be reflected in Korean without inventing an official title. | Korean retains the stammer and repeated honorific respect but normalizes “sageishness” to `대현자님`, losing the source's wordplay. Japanese also smooths the phrase; Chinese uses a formal sage title. | Medium |
| 32604 | `필멸자의 몸을 한 운명의 신` for `a fateless god among mortals` | Check a likely polarity/meaning reversal: `fateless` means without fate, whereas `운명의 신` denotes a god of fate. | English calls the addressee a “fateless god among mortals.” Korean describes a “god of fate in mortal form,” which can invert the adjective. Japanese and Chinese read the phrase differently, so keep the source's compressed joke/context open while flagging this high-confidence lexical concern. | High |
| 32608 | `눈길을 주네` for `giving me the eye` | Preserve the idiomatic suggestion of flirtatious interest if context confirms it, rather than only a repeated glance. | English uses an idiom commonly suggesting flirtatious attention. Chinese explicitly reads it as a flirtatious look; Japanese describes the officer repeatedly looking over, and Korean says the officer keeps giving the speaker attention. The isolated Korean can be neutral. | Medium |
| 32611 | Four-line twin-birth poem | Preserve the twin/brother conflict, weapon-forging imagery, wounded land, and loss of sanity, while checking poetic force and cadence. | Korean retains the four source lines and the causal sequence. All locales have three newline characters; the English `reave`/war wording and rhyme are compressed or recast across references. | Medium |
| 32615 | `마지막 텔링(Telling)` | Standardize the capitalized lore term and preserve the claim that Fae history enters its final Telling before old songs and heroes perish. | Korean retains Hallam's vision, the speaker's recurring dream, the final Telling, and the new era. The historical audit flags the formal meaning of Telling; translations diverge between story, prophecy, and tradition. | Medium |
| 32621 | Rapid Health Regeneration potion recipe | Preserve the effect, reagent order, and exact quantities. | All four locales list Black Cohosh (3), Scarlet Flowstone (2), and Bloodroot (1). Korean preserves the three items and quantities and matches the four newline characters of the recipe layout. | High |
| 32626 | `바실리카` / `에어랑쿠르 학자님` | Determine which Basilica is meant and standardize Scholar Airancourt's name/title without adding an institution identity absent from the row. | Korean preserves that the speaker is a scribe and received a request to draft a letter from Scholar Airancourt. English only says “the Basilica”; Chinese names a Gnostic Basilica, while Japanese uses a church-hall term. The source-keyed historical log explicitly leaves the institution unresolved. | Medium |
| 32628 | `미친개` for `Mad Dog` | Check whether this is a named epithet/title or a generic insult before choosing a literal Korean display. | English capitalization and the historical inventory raise the possibility of a formal name or epithet; Japanese transliterates it and Chinese uses the literal “mad dog.” Korean selects the literal reading. | Medium |
| 32632 | `마나 흡수 방어구 [사용 금지]` for `Mana Steal Armor [DO NOT USE]` | Confirm whether this is an internal/test label and whether its warning should be localized; do not remove or suppress it based on the label alone. | All locales retain the armor/stat label and a do-not-use warning, with localized forms in Korean and Chinese/Japanese. Historical notes explicitly say its player-facing/test status is unknown. | Medium |
| 32635 | `용맹의 투사님` for `Champion of Valor` | Standardize the formal title against the recurring Korean `용맹의 챔피언` form, while retaining the speaker's respectful exclamation. | Korean conveys an honored Champion of Valor but uses `투사` where other active rows use `챔피언`; the corpus has a previously documented title inconsistency. | Medium |
| 32641 | `조류 살인 사건` for the punning title `Murder Most Fowl` | Preserve the bird pun and the “Murder Most Foul” allusion if feasible; check whether this is a quest/title rather than a generic crime label. | English deliberately substitutes `Fowl` for `Foul`. Korean keeps the bird/crime components but loses “most” and the explicit wordplay. Japanese also shortens it to “bird killing”; Chinese reads it literally as killing poultry. The historical audit flags the title pun. | High |
| 32643 | `여름의 요람` for `Cradle of Summer` | Keep the established Korean place-name form distinct from generic cradle imagery. | Korean uses the same semantic rendering recorded in earlier reports. The historical terminology inventory repeatedly flags this named place; no new meaning shift was identified here. | Medium |
| 32644 | `미든` / `시련의 전당` / `하트스톤` | Standardize Midden, Proving Halls, and Heartstone; preserve that the Heartstone grants access before the speaker's questions are answered inside. | Korean retains the destination, access item, and result. English names the plural Proving Halls, while the Korean rendering is singular-form `전당`; locale translations differ on the place type. | Medium |

Rows 32601, 32603, 32605-32607, 32609-32610, 32612-32614, 32616-32620,
32622-32625, 32627, 32629-32631, 32633-32634, 32636-32640, 32642, and
32645-32650 generally retain the English meaning on this first reading.
Proper names, poetic cadence, and dialogue register remain candidates for
the integrated pass; no other distinct high-confidence wording issue was
identified.

## Historical Audit Reconciliation

- The source-keyed historical log for IDs 32600-32699 flags Archsage,
  Colet, the “giving me the eye” idiom, the twin-birth poem, Telling, Culn,
  Basilica/Airancourt, the Mana Steal Armor test label, Murder Most Fowl,
  and Cradle of Summer. These were checked against all four locale rows and
  active Korean.
- The Korean at ID 32604 may reverse `fateless` into `운명의 신`; retain as
  a high-confidence candidate for integrated review, not an accepted
  correction.
- The history's notes about the internal label at 32632 and pun at 32641
  remain open; neither was treated as authorization to edit the CSV.

## Other Checks

- English, Japanese, Chinese, and Korean each contain all 50 IDs
  32601-32650 once and in identical order.
- Embedded line-break counts match throughout the range. ID 32611 has four
  poem lines and three newline characters in every locale.
- ID 32610 preserves `$HP02.bribe_value$` exactly in every locale.
- ID 32621 preserves reagent quantities `3`, `2`, and `1`; all four locales
  have four newline characters in that recipe.
- No other runtime-marker, value, or line-break discrepancy was detected.
- No CSV text or source file was edited.

## Batch Status

IDs 32601-32650 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 32651.
