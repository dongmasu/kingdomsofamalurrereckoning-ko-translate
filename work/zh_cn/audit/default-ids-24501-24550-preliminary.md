# Preliminary Language Scan: `default` IDs 24501-24550

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 24501-24550 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 24501 | “Another?” | Confirm whether the short line has an omitted object and whether the draft may infer it. | Korean says `또 한 병?`, specifying a bottle absent from the English, Japanese, and Chinese short strings; surrounding dialogue may justify it. | Medium |
| 24503 | Will 'O Wisp | Determine whether this is a named creature/item, a source typo, or the common phenomenon; align recurring forms. | Korean uses `도깨비불`, while Japanese transliterates the creature-like form. Another corpus entry renders Will-o'-the-Wisp phonetically. | High |
| 24506 | pilgrims / missionaries / God | Preserve the speaker's self-description, religious service, and reverent tone. | Korean retains the progression and uses respectful `그분`; confirm consistent treatment of the unnamed deity's pronouns. | Low |
| 24507 | “the key to my archives is the lowest blow” | Confirm the intended wordplay and preserve the complaint about the excessive retaliation. | Korean interprets the event as stealing the archive key and calls it underhanded; Japanese treats the key as painful, while Chinese explicitly says stealing it was a low provocation. | High |
| 24508 | silkfarmer / Webwood / “forest of the silk” | Verify the occupation and whether the forest phrase is a named place; preserve the diary's sequence and punchline. | Korean retains the spiders, poison, absent harvesters, triple pay, escape plan, final “secret,” and one paragraph break. | Medium |
| 24509 | Guard / Mel Aglir | Preserve that orders prohibited deployment beyond Mel Aglir and that the speaker disobeyed. | Korean retains the order, boundary, and disobedience; the military sense of `deploy` is rendered as marching. | Medium |
| 24512 | Dokkalfar battlewraps | Confirm the item category and retain that the professional enchanted version is modeled on improvised fighting wraps. | Korean calls them improvised fighting bandages; Chinese calls them improvised gloves. Equipment context would resolve the precise item type. | Medium |
| 24514 | Quake / damage / final-hit Stun chance / Mana cost | Preserve whether the final hit adds a 40% Stun chance or increases an existing chance by 40%; retain all values and duration. | All locales retain 50%, 40%, 5 seconds, and 18 Mana. Korean's `확률이 40% 증가` may read as a relative increase; Japanese and Korean list 5 seconds before 40%, unlike English/Chinese, though the values are present. | High |
| 24515 | Weconai | Standardize the place name and preserve its role as a ruin containing a deep prison. | Korean uses `웨코나이`; Japanese/Chinese use other transliterations. Whether the name denotes a ruin, prison, or both remains contextual. | Medium |
| 24522 | Afe Bolstid | Apply the eventual bilingual proper-name display convention consistently. | Korean alone adds `(Afe Bolstid)` after the transliteration. Record as a consistency observation, not an automatic deletion request. | Low |
| 24523-24525 | Castle Ansilla / General Fynn / Ard Manan / “Destroyer” | Standardize names and preserve the lost squad report, ironic epithet, inability to swim, and starvation on an island within sight of land. | Korean retains the plot and ironic circumstance. `파괴자` is not marked as a title/name; decide display convention during terminology review. | Medium |
| 24530 | Cillian Keen / Gravehal Keep / Root Golem | Standardize proper names and preserve the pet-training objective and bug-bait sequence. | Korean retains the full sequence; character and Keep spellings vary from other corpus renderings. | Medium |
| 24531 | Ayten / Wolds / Fynwick Iver | Verify proper-name forms and preserve the link between wartime damage, bandit attacks, and bounty. | Korean retains the bounty objective and places the attacks after Ayten was devastated by war; spellings need corpus-wide consistency review. | Medium |
| 24535 | “ordained savagery” | Preserve the contrast between fate, piety, grace, and the people's savagery without resolving the source's ambiguity prematurely. | Korean says `타고난 야만성`, emphasizing innate nature; English `ordained` can imply something imposed or decreed, while Japanese/Chinese also differ in framing. | High |
| 24537 | Kollossae Noble F | Preserve that this is a female noble/category label and standardize Kollossae. | Korean explicitly uses `귀족 여성`, consistent with Japanese and Chinese; the label's runtime/category context is unknown. | Low |
| 24538 | weapons and arms / “I let him” | Preserve the reason the speaker delegated weapon sales after badly cutting themself. | Korean retains delegation and injury; the English source is grammatically malformed and does not explicitly repeat “handle” in its second clause. | Medium |
| 24542 | Alfar Navy / quarry | Standardize the naval group and choose a suitable term for its designated target. | Korean uses `알파르 해군` and `사냥감`; English's `quarry` can be literal prey or a target designation. | Medium |
| 24546 | Fahrlang / Niskaru Lord / mountain prison | Verify both names and preserve that Fahrlang tried to free the imprisoned Niskaru Lord. | Korean retains the attempted release and mountain prison; transliterations remain candidates. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 24503, 24507-24508, 24514-24515,
  24523-24525, 24530-24531, 24535, 24537, 24542, and 24546 against active
  rows. The creature/name forms, key wordplay, diary layout, Quake values,
  proper names, ordained-savagery wording, gendered UI label, Alfar Navy,
  and Fahrlang/Niskaru reference remain preliminary candidates.
- Cross-checked recurring forms for Will-o'-the-Wisp, Talibor, Webwood,
  Dokkalfar, Mel Aglir, Gravehal, Weconai, Fahrlang, Niskaru, Ayten, Wolds,
  Kollossae, Alfar, and named characters.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 24501-24550 exactly
  once and in identical order.
- Embedded line-break counts match across all four locales; ID 24508 retains
  its single paragraph break.
- Runtime-token signatures match; no runtime marker was found in this range.
- All detected numeric values are retained. At ID 24514, Japanese and Korean
  reorder `5 seconds` and `40%` relative to English/Chinese; the Korean
  probability wording remains a semantic candidate.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 24501-24550 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
24551.
