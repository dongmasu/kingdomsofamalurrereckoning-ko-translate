# Preliminary Language Scan: `default` IDs 23201-23250

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 23201-23250 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 23203 | troll / “city has lost an institution... in a way” | Clarify whether “institution” is intentionally metaphorical, a joke, or an unresolved referent; preserve the speaker's hesitation. | Korean retains the source's institution wording and hesitation, but the intended comparison is not recoverable from this line alone. | Medium |
| 23207 | masonry company / Stowaway / Primos / city board | Verify the formal city-board request context and preserve the contrast between retaliation and engineering work. | Korean retains the escort request, routine sewer maintenance, attacks, one-unit estimate, and permanent-removal request. `city board` is rendered `시 게시판`; the source may mean an official board or quest board. | Medium |
| 23209 | Eyeshadow Darkness | Determine whether this is a test/debug label, UI property, or intended item/effect name. | Korean follows the literal components as `아이섀도 어둠`; the row has no context to resolve its function. | Low |
| 23210 | Akara hymn / Scion / `후계자` | Align the Scion title and preserve the hymn's devotional voice, theology, and stanza layout. | Korean retains the father/guide/service motifs and all source stanzas. It uses `후계자(Scion)`, a provisional rendering of the in-world office; terminology remains open. | Medium |
| 23211 | Mallion / “in his bed” | Identify what `it` refers to without removing the source's urgency or the deliberately blunt aside. | Korean retains the unspecified object, urgency, bed, and direction; context is needed to identify the object. | Medium |
| 23215 | woven with blood and toil / Kollossae / nature | Preserve the weaving metaphor and determine whether `trappings` means decoration or equipment; standardize Kollossae. | Korean retains blood, labor, foundation, and decoration, but `짜내야` may suggest squeezing/extraction rather than weaving. The English antecedent `it` is unresolved. | High |
| 23217 | Fomorians / Pombero / Mabinogi | Verify the mythic names and titles and retain the boastful shift to calling the addressee “brother.” | Korean preserves the three claims and familiar final address; historical name questions remain open. | Medium |
| 23218 | `{*1smashable}` / `LINE_SPACE` | Translate the displayed gameplay label consistently while preserving both control markers and their order. | Korean retains `{LINE_SPACE}` and `{*1smashable}` in source order; the English marker label is still untranslated. | Medium |
| 23220 | The Hero and the Maid / ballads | Verify the named work and preserve the urgency and the possibility of changing the ballads' outcomes. | Korean preserves the title and threat; the source has a duplicated article in `'The Hero and the Maid'`, which is not repeated in Korean. | Medium |
| 23222-23223 | unnamed city / ruins | Preserve the claim of superiority and the contrast between unfinished grandeur and present ruin without inventing the city's identity. | Korean retains both statements and the half-complete status; the referent remains implicit. | Medium |
| 23224 | Haxhi / Mountain Trolls / Declan | Standardize the place and character names and preserve that the promised reward is for dealing with the Mountain Trolls. | Korean retains the hunt, report, and reward sequence. `산 트롤` is a descriptive rendering whose formal creature-name status remains open. | Medium |
| 23230 | “... .” | Treat the unusual source punctuation as an anomaly and preserve the speaker's cautious tone. | English ends with an ellipsis followed by a period; Korean uses a conventional ellipsis. The line's meaning and invitation to explore remain intact. | Low |
| 23232 | Ambassadors Keen and Brenner / Alfar and Varani | Verify the mapping of each ambassador to the people and preserve the reciprocal plotting. | Korean explicitly associates Keen with the Alfar and Brenner with the Varani and retains the deception complaint. | Medium |
| 23233 | Archsage / “whatever it is that Archsage's do” | Preserve the speaker's dry aside without silently correcting the malformed English possessive/plural. | Korean renders the last clause as what “Archsages” do, a plausible reading of the source typo. | Medium |
| 23237 | Johann Lionbeard / Jackal-Tooth / Kollassae / Ethene | Review the long tale's proper names, species, humor, and source-quote anomalies; do not silently normalize source inconsistencies. | Korean preserves the full plot, lion-beard reveal, and dialogue; `Kollassae` is rendered `콜로세`, and the source's malformed quote marks remain an audit issue. Historical questions remain open. | High |
| 23240 | forcing very easy locks | Confirm the mechanic's UI difficulty term and preserve the guaranteed-success condition. | Korean retains the “very easy” tier and guaranteed success while expressing forcing as forcibly picking the lock. | Medium |
| 23244 | Freezing / Ice Barrage | Align both effect names and preserve the exact modifiers. | Korean retains +250% duration and +60% Ice Barrage damage. | High |
| 23247 | Resist Arrest | Determine whether this is a quest objective, status, or interaction label and align the verb/noun form. | Korean says `체포 저항`; English/Japanese specify resisting arrest, while Chinese is less explicit. | Medium |
| 23249 | Freemen / facility ownership | Verify the faction name and preserve the warning to leave. | Korean retains the group's ownership claim and imperative; historical faction question remains open. | Medium |

## Historical Audit Reconciliation

- Rechecked archived questions for IDs 23203, 23207, 23209-23211, 23215,
  23217-23218, 23220, 23222-23224, 23227, and 23232-23233 against the active
  rows. Meaning, test-label, lore/name, title, and context questions remain
  preliminary; no prior note was treated as approval.
- Cross-checked recurring forms for Primos, Stowaway, Fae, Akara, Scion,
  Kollossae, Halcyor, Fomorians, Pombero, Mabinogi, Ethene, Haxhi, Declan,
  Keen, Brenner, Alfar, Varani, Archsage, and Freemen.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 23201-23250 exactly
  once and in identical order.
- ID 23210 preserves the hymn's stanza/line-break structure across all four
  locales, including the final Scion attribution.
- ID 23218 preserves `{LINE_SPACE}` followed by `{*1...}` in every locale;
  wrapper classes/order match, while displayed labels are localized by
  Japanese and Chinese and remain English in Korean.
- ID 23237 preserves its 26 embedded line breaks across locales.
- ID 23244 retains 250% and 60% in every locale.
- No other line-break or runtime-marker discrepancy was found.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 23201-23250 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
23251.
