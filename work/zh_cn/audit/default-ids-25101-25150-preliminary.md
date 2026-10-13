# Preliminary Language Scan: `default` IDs 25101-25150

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 25101-25150 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 25102, 25108 | Reddle / Blackshriek | Confirm whether these names identify people, creatures, places, or items; standardize spelling and transliteration. | English/Japanese/Chinese leave both in Latin script, while Korean transliterates them. The rows alone do not identify the referents. | Medium |
| 25103 | “list like drunkards at a wake” | Confirm the intended wake/funeral image and preserve the sailors' drunken stagger on dry land. | Korean specifies a funeral after-gathering; Chinese also says wake, while Japanese uses a generic banquet. | High |
| 25106, 25118 | Anela Cergren / Boots of Last Breath / the Executioner / Ferrin Shaw | Verify the character-name spelling, item title, vigilante epithet, and mapmaker's name. | Korean retains the legendary costume's last surviving piece and its map location; transliterations differ by locale. | Medium |
| 25110-25111 | beast-killing plea / Ruined Diary | Preserve the speaker's acknowledgement of error and desire to resume life; distinguish a damaged diary from a destroyed one. | Korean retains the plea and uses `손상된 일기`; locale wording for the diary's condition differs. | Medium |
| 25112, 25116 | civilian “interactions” / initiation | Verify whether the heading denotes social interactions or negotiations, and preserve that the player's initiation freed the speaker. | Korean uses `상호작용` and `입문 의식`; Japanese reads the heading as negotiations and English omits a comma in “Do you not understand child?”. | Medium |
| 25115 | `{1} {2} over {3} seconds` | Preserve all three placeholders and their order; determine the stat/effect context before interpreting “over.” | All four locales retain `{1}`, `{2}`, `{3}` in the same order; the row's isolated fragment is context-dependent. | High |
| 25118-25120 | Executioner / Nerotelos explorer journal | Preserve the retrieval objective and verify the title/name forms and journal-part numbering. | Korean retains the secret mapped location and the sixth-part label. | Medium |
| 25121 | Travelers / “silver tongue is tarnished” / ring-and-money agreement | Preserve the idiom's accusation of deceptive persuasion and the agreed exchange. | Korean renders hidden intent behind sweet words rather than a literal tarnished silver tongue; the agreement's terms remain intact. | Medium |
| 25126-25127 | Font / Notices of Duty / selected Rathir residents | Verify whether Font is a named place/concept and whether the notices are military conscription; preserve the intentionally vague requirement to “look the part.” | Korean writes `샘(Font)` and describes selected residents as called up for service. Japanese explicitly says military service; the English leaves the institution broader. | High |
| 25130-25132 | Whitestone joke / Castellan of Helmgard / Gastyr “as red as they come” | Preserve the awkward joke and verify the title, location, and meaning of the red-place phrase. | Korean retains the joke, seniority, and one-eyed Bolgan warning; Japanese interprets Gastyr as blood-covered, while English/Chinese leave “red” less explicit. | High |
| 25134-25135 | King Wencen / the Telling / Zefwyn / Gallows End | Verify whether the Telling is a named Fae tradition and standardize the king, investigator, and place forms. | Korean renders Telling as `전승` and retains the shipwreck-report wait; locale readings and name spellings vary. | High |
| 25137 | Helmgard Keep marriage-ring contract / “be proffered to another” | Clarify whether the ring is to be offered, delivered, or presented; preserve that it is retrieved from a Forsaken Plains grave. | Korean renders the instruction as “find and hand to another,” while the English fragment is deliberately awkward and the Japanese adds reward language. | High |
| 25139-25140 | Clyeth Arne / Dolve Arne / Staff and Talisman / cousin / Ysa | Verify family/place names and kinship; clarify “the rest of Dolve Arne” and whether Ysa is personified or a place. | Korean reads Staff and Talisman as family heirlooms and Dolve Arne's remaining estate; the “cousin” address is retained. | High |
| 25141 | Castle Yolvan / Summer Fae / Webwood / Canneroc | Standardize names and preserve the conditional reasoning from more Lorestones to a possible way to save Canneroc. | Korean keeps the clue-seeking sequence and does not state that the method is already known. | Medium |
| 25142 | “Three Quater Theams” | Treat the source as misspelled or corrupted; identify its intended title before normalizing. | The English spelling is malformed, Japanese approximates it as `3/4セアムス`, Chinese repeats the source, and Korean transliterates it. | High |
| 25143 | Detect Hidden / recipe reagents | Verify the skill and reagent names; preserve all quantities and the full recipe layout. | Korean retains Scarab Salts (2), Sky Blossom (2), Bloodroot (2), and Essence of Fate (1), with English names in parentheses. | High |
| 25146 | Idylla / Primos / Kollossae / Wreath of Absolution / Hyperian synopsis | Standardize canonical names and terms; preserve the four-paragraph plot sequence, humility rationale, betrayal, escape, and search for Nyxaros. | Korean retains all four paragraphs and the core event order. Locale forms vary for several names; Korean uses “왕관” where the English source says “circlet,” a candidate for item terminology review. | High |
| 25147-25149 | Scholia Arcana / Chaos Magic / Chaos Thrall XII | Standardize the organization name and title; preserve the source's Roman numeral XII. | Korean uses `스콜리아 아르카나` and `XII`; Japanese spells the numeral as 12 and calls the grounds a university. | Medium |
| 25150 | Lieutenant Drefan | Standardize the name and rank; Chinese explicitly uses lieutenant and Korean agrees. | Japanese's `隊長` reads as captain/commander, so retain as a source/title comparison question. | Medium |

## Historical Audit Reconciliation

- Rechecked the historical questions at IDs 25102-25103, 25106, 25108,
  25118, 25126-25127, 25131-25132, 25134-25135, 25137, 25139-25143, and
  25146-25149 against all four active locale rows. These name, idiom, title,
  source-typo, terminology, and plot-sequence questions remain preliminary.
- Cross-checked recurring forms for Travelers, Tuatha, Anela Cergren,
  Blackshriek, Reddle, the Font, Rathir, Helmgard, Wencen, the Telling,
  Gallows End, Idylla, Primos, Kollossae, Teeth of Naros, and Scholia Arcana.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 25101-25150 exactly
  once and in identical order.
- Embedded line-break counts match across all four locales. The four-paragraph
  synopsis at ID 25146 and the multi-line recipe at ID 25143 retain their
  paragraph/line-break counts.
- Runtime-token signatures match; `{1}`, `{2}`, and `{3}` at ID 25115 retain
  their identities and order. No other runtime marker was found in this range.
- Recipe quantities and the synopsis event order are retained. No structural
  exception was found.
- Korean wording and source CSVs were not edited.

## Batch Status

IDs 25101-25150 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default` ID
25151.
