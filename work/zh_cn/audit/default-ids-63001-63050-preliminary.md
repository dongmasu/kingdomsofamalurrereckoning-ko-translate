# Preliminary Language Scan: `default` IDs 63001-63050

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 63001-63050 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, source-keyed historical
  questions, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 63004 | Hall / holdfast / Saturnyn | Verify whether `Hall` is a named building/location and what the sealed `holdfast` denotes; preserve the expected rebel/Saturnyn location. | Korean renders the holdfast as a fortress behind the great cavern and retains the likely rebel/Saturnyn presence. The exact map relation and proper names need context. | Medium |
| 63005 | Niskaru fangs / survival condition | Preserve the conditional request: collect the fangs only if the player is near the mouth and survives. | Korean retains both the proximity danger and the survival condition. The request is intentionally darkly humorous. | Medium |
| 63008 | Ansilla / torture, imprisonment, madness | Preserve the three ominous possibilities and determine whether this is a greeting, threat, or deliberate test. | Korean retains the terse list and formal address. Japanese/Chinese align; tone depends on scene context. | Medium |
| 63011 | Celebrants / Beckoned | Preserve that celebrants are waiting in the upper city and that the speaker advises not wasting time here. | Korean retains the crowd, title, and gentle redirection. The exact occasion is not stated. | Medium |
| 63015 | Collections box / `모금함` | Confirm whether this is a donation/fundraising box and whether it relates to the “stealing collections” line at 62844. | Korean explicitly translates it as a fundraising box, supporting a donations sense for “collections” in context. The two rows may be related, but that connection is not established by these isolated strings. | Medium |
| 63016 | “My strength is all they have” / `내 힘뿐` | Preserve the leader's duty and the claim that the people have lost hope and rely only on the speaker's strength. | Korean retains both clauses and makes the dependence explicit. The historical note flags this unusual leadership/despair line; the people and threat are unspecified. | Medium |
| 63018 | `FAIL LINE` | Determine whether this uppercase string is an intentional player-facing message or a test/developer placeholder. | Korean leaves the English text unchanged. It resembles a debug marker; do not treat it as ordinary translatable dialogue without context. | High |
| 63020 | `French Southern Territories` / `프랑스령 남방 및 남극 지역` | Verify whether this geographic name is intentional game text or a test/debug string. | Korean translates the territory name literally. The source-keyed audit explicitly flags it as a possible debug/test entry; no locale establishes intended in-world usage. | High |
| 63022 | Rotclaw / Blackshriek / King Fang / Niahm | Verify the three Kobold names and preserve the follow-up conversation with Niahm. | Korean retains all three names as transliterations and the objective. English uses `he` for Niahm; Korean is gender-neutral and adds no unsupported pronoun. | Medium |
| 63024 | House of Ballads seat / new Telling | Preserve the speaker's membership, lost state, and desire for a meaningful new Telling/purpose. | Korean retains the formal House, membership, and “new story/Telling” distinction. English says “many seasons ago”; Korean uses “several seasons ago.” | Medium |
| 63025 | Dvergan map / Alfar inscription / Ring of the Watcher | Preserve the parchment fragment, language distinction, exact inscription, and two-fragment requirement. | Korean keeps Dvergan script, Alfar language, the Ring of the Watcher name, and the need for two more fragments. Japanese uses a different inscription meaning; English is the primary source. | High |
| 63029 | Forgotten order / stone amulet | Determine whether the unnamed order is religious, magical, or another formal group and retain the uncommon-for-its-era magic. | Korean calls it a forgotten association and preserves the enchantment. English's `order` may be a proper institution; the group is not identified. | Medium |
| 63033 | Poison-resistance recipe / ingredient quantities | Preserve the Alchemy Workbench, both reagents, and quantities 2 and 1, including the blank-line recipe layout. | Korean retains the recipe and both quantities. The names correspond to Cripplespore Caps and Ysa's Breath; all four locales preserve the paragraph separation. | High |
| 63038 | “things not clear to others” / `보이지 않는 것들` | Preserve that the speaker understood what others did not understand or perceive; determine whether the source implies insight or literal vision. | Korean says the speaker understood things invisible to others. English/Japanese/Chinese use “not clear/not understood,” so Korean may introduce a literal visual ability not present in the source. | High |
| 63040 | Scale / Eldest / `저울`, `맏이` | Confirm whether capitalized `Scale` and `Eldest` are formal cosmological entities/terms, and preserve the one-step progression. | Korean renders the Scale generically and `Eldest` as “eldest child,” which may lose a proper-title meaning. English/Japanese/Chinese capitalize or quote the conceptual terms; lore context is needed. | High |
| 63043 | Argine warning / `발동시키면 ... 눈치챌 거야` | Preserve the enchantment's special/thorough nature and that setting it off would likely reveal the party's arrival to Argine. | Korean retains the warning but states Argine will notice, stronger than English `likely`. The trigger and detection mechanism remain contextual. | Medium |
| 63046 | Frost Trap / +5% Critical Hit per Combo Point | Verify official UI terms and preserve the linear per-point bonus. | Korean retains Frost Trap, critical chance, and +5% per Combo Point. Japanese/Chinese use equivalent terms; exact gameplay label remains open. | High |
| 63047 | Akara spared you / `살려 줬어` | Determine whether this means mercy, literal rescue, or sparing from death. | Korean says Akara saved the addressee's life, while English uses `spared`; the surrounding event should settle the nuance. | Medium |
| 63049 | `dove` / `그대` | Verify the affectionate address and preserve the warning that delay gives the Hierophant more opportunity to learn about the group. | Korean uses the neutral/formal `그대` and omits `dove`, continuing the possible endearment omission noted at 62783 and 62969. It retains the movement urgency and Hierophant threat. | Medium |

Other reviewed rows generally preserve first-read meaning and voice/register,
including Old Lord Kandrian, Leave It Alone, sea-god blessing, celebrants,
the Debug Log label, battle against the Tuatha, Ratofer, Cape Solace salvage,
Jottun, Marauders, the scholar greeting, Main Menu, Tree of Time, Flowers
and Sprites, Warsworn pickpocketing, Quality (Mediocre), parents and the
forest, the Tome, Argine, Burren Cove, and the South Georgia/South Sandwich
Islands location label. Proper-name spellings and bilingual parenthetical
formatting remain provisional; this pass does not impose a global display
convention.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical row for IDs 63000-63099, including
  Hall/holdfast/Saturnyn, Niskaru fangs, the leader's strength, French
  Southern Territories, Kobolds/Niahm, House of Ballads/new Telling,
  Dvergan/Alfar map text, forgotten order, Cape Solace salvage, the poison
  recipe, Scale/Eldest, Argine's trigger, Frost Trap, Burren Cove, and
  affectionate `dove`.
- The historical note spans IDs 63000-63099; entries outside this batch
  were not counted as reviewed here.
- Findings remain preliminary open questions, not accepted corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 63001-63050 once
  and in identical ascending order.
- Embedded newline counts match for every row. ID 63033 retains the
  blank-line-separated recipe in all four locales.
- Runtime-marker identities/order match; no runtime markers occur in this
  batch.
- Ingredient quantities at 63033 (2 and 1) and the +5% per Combo Point at
  63046 are preserved.
- No translation CSV edit was made.

## Batch Status

IDs 63001-63050 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 63051.
