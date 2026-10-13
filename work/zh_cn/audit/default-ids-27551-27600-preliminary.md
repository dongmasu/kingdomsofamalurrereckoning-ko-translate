# Preliminary Language Scan: `default` IDs 27551-27600

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 27551-27600 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 27554 | `이 힘이 무엇인지` for “these forces” | Preserve the source's plural-to-singular shift or determine whether it is a source inconsistency. | English calls them “these forces” but later says “control it”; Chinese also preserves plural “forces” followed by singular “it,” while Japanese generalizes to power. Korean consistently uses singular “this power,” resolving rather than exposing the mismatch. | Medium |
| 27560 | `도브(Dove)` | Reconcile this vocative with the recurring lowercase `dove` / endearment question; avoid silently treating it as a proper name. | English directly addresses “Dove”; Japanese omits the address and Chinese renders it as “peace messenger.” Historical rows generally treat lower-case `dove` as a familiar or affectionate address, while the precise speaker relationship remains open. | Medium |
| 27565, 27573, 27578 | A Shoal Against the Tide / The Tower / fate-read / Fated / Fateweaver | Check the idiom and the recurring Fate/card-reading terminology together. | Korean's `밀물에 맞선 모래톱`, `탑 카드`, and `운세` are plausible readings. The historical inventory specifically leaves the shoal title, wager/fate-read wording, and Tower reading for terminology review. | Medium |
| 27574-27575 | Mystic Hammer / Firstsworn / named people / material quantities | Confirm names and crafting-material forms; retain all quantities. | Korean follows the English account and preserves two bundles of emberwood, two of sailcloth, and four of seasteel. Historical notes flag the named characters, Firstsworn, and seasteel as terminology questions. | Medium |
| 27576, 27586 | Localized `LINE_LEFT` and `*N` markers | Preserve marker identities, wrappers, order, and the faction-list structure. | The localized marker payloads differ as expected, but normalized marker identities/order match all four locales. Korean localizes the Faction Quests label and retains the named faction list. | High |
| 27577 | `상처투성이 생각을 횡설수설 늘어놓으며` | Keep the source's unusual “sputter and gloat with his scarred thoughts” image open for context review. | English and Chinese preserve “scarred thoughts”; Japanese instead calls the thoughts foolish. Korean follows the English/Chinese image, though its Korean phrasing is figurative and unusual. | Low |
| 27581, 27586, 27588, 27592-27593, 27597 | Shrine / factions / Fae Cairn and Echostone / Belen's Testament / Sorrows / House of Valor | Reconcile institutional, faction, lore, and religious terms across the corpus. | Existing questions include shrine mechanics, Faction Quests naming, Cairn/Echostone function, Belen's Testament, the sense of Sorrows, and House of Valor. The current Korean preserves the narrative and gameplay relationships; terminology remains open. | Medium |
| 27589 | `책장` for “page” | Make clear that the key aligns with a page in the book, not a bookshelf. | English repeats “page”; Korean `책장` can be read as a bookshelf or a page/leaf, making the later lightning effect's origin ambiguous. Japanese describes the open book and Chinese also says page. | Medium |
| 27592 | `동생 기란` for “his brother, Giran” | Avoid specifying that Giran is younger unless context confirms the relationship. | English says only “brother”; Japanese and Chinese likewise do not specify relative age. Korean adds the younger-sibling meaning in `동생`. | High |
| 27593 | `소로스 가문(House of Sorrows)` for “the Sorrows” | Confirm whether the source means the House/faction, a power, or another named entity. | The English sentence does not say “House,” while Japanese and Chinese use sorrow/Sorrows terminology. Korean makes the faction reading explicit. The historical audit flags the Sorrows sense as unresolved. | Medium |
| 27595 | `감정을 너무 가볍게 여기는 것 같아` | Recheck whether “some feelings count less ... than they should” is a general observation or a reference to compassion in this context. | Korean conveys emotional disregard. Japanese interprets the people as unusually cold-hearted; Chinese stays closer to the abstract “some feelings,” so the intended nuance is not settled by the row alone. | Low |
| 27598 | `SpawnVol4` | Confirm whether this is an internal/developer label that should remain unchanged. | The Korean preserves the source string. The historical inventory explicitly flags this label for player-facing versus developer-text disposition. | Medium |

## Historical Audit Reconciliation

- The source-keyed 27500-27599 inventory includes the shoal title, wager
  variable, Tower reading, Firstsworn/seasteel terms, faction-quest
  description, Fae Cairn/Echostone mechanics, page/key puzzle, Belen's
  Testament, roosters, “feelings,” House of Valor, and `SpawnVol4`.
- The recurring `dove` questions in earlier historical ranges treat it as a
  familiar or affectionate form of address in several contexts. They do not
  establish one universal Korean equivalent or settle this speaker's
  relationship.
- Historical notes remain issue inventory, not approval or a consolidated
  review disposition.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 27551-27600 once,
  in identical order.
- Actual embedded line-break counts and normalized runtime-token identities
  and order match across all four locales.
- IDs 27576 and 27586 localize the payload inside `*N` markers; marker
  wrappers, identities, and order match. ID 27571 retains
  `$Ayten_NQD.dice_wager$` in all four locales.
- No unexpected Unicode format character or structural exception was found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 27551-27600 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 27601.
