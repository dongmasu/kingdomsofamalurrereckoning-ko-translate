# Preliminary Language Scan: `default` IDs 19050-19099

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 19050-19099.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, recurring names, and UI.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 19050 | `Tyrannus Bolganus` | Confirm whether this is a name, title, or descriptive epithet and align it with the full Tyrannus Bolganus phrase elsewhere. | Korean transliterates it as `티라누스 볼가누스`; Japanese/Chinese interpret the string descriptively. | Medium |
| 19051 | `her excellence` / Morsus Canis Imperius | Verify the feminine honorific and whether the Latin phrase is a formal creature name. | Korean uses `존귀하신` for the honorific and transliterates the Latin name; Japanese instead interprets it as “Imperial Wolf.” Historical note remains open. | Medium |
| 19055 | `{*1Chaos Rift}` / `{LINE_SPACE}` / `{1}` | Preserve wrapper, paragraph break, and button variable while localizing only the Rift label. | Korean retains all markers in source order and preserves the instruction to defeat Niskaru, weaken the Rift, and close it. | High |
| 19056 | “barrel-gaited loggerhead” / “do right by me” | Preserve the comic insult and the unresolved meaning of whether “they” will treat the speaker fairly or reward them. | Korean keeps the barrel-gaited image and broad “do right by me” sense. The historical question notes the source's unusual phrasing. | Medium |
| 19060 | Warsworn / oath of protection | Keep the protection-oath meaning and distinguish its payment from concealing the incident. | Korean preserves both points and the speaker's concern about whom to tell. | Low |
| 19063-65 | Savant Methneen / font of life / Ysa | Align the rank, name, and life-source metaphor with established lore terms. | Korean renders Savant as `현자`, Methneen as `메스닌`, and the font metaphor as `생명의 샘`; historical terminology notes remain relevant. | Medium |
| 19067 | Belmaid / Fae hammer / enchanted haze / crystal | Verify names and preserve the poem's cause-and-effect sequence and lineation. | Korean retains eight verse lines plus the stanza break: the hammer/song dispels the haze, creatures become savage, the crystal threatens Fae, and Belmaid destroys the ore. | Medium |
| 19069-71 | `Odd` / High Roll | Confirm the compact label and whether High Roll compares individual die faces or the total rolled. | Korean `홀수` matches Japanese/Chinese for Odd. For High Roll, Korean says the higher die face wins; Japanese explicitly says the higher sum wins, while English is ambiguous. | High |
| 19073-76 | Rathir / Motus Mining Interest / Apotyre / Carasta Arawyn / Gwalchmai / Pryderi / Maybryn Wine | Align region, company, people, merchant-district, and wine forms. | Korean preserves the sovereignty complaint and wine-bribe sequence. Historical notes identify these proper names and the political reference for glossary review. | Medium |
| 19078 | `Widow` | Determine whether Widow is a proper entity/title or an ordinary widow. | Korean uses `과부`; capitalization and the invocation “Widow spare you” may indicate a named entity. | Medium |
| 19082 | Shrine of Air | Distinguish the formal concept `Air` from `Wind` and use the canonical site name. | Korean uses `바람의 성소`; Japanese says “atmosphere shrine,” while Chinese says “air shrine.” Historical question explicitly flags the Air/Wind distinction. | Medium |
| 19085 | Finesse-based Faeblades | Align weapon and skill-tree terminology. | Korean `재주 기반` renders Finesse by meaning; the Faeblades term follows recurring usage. | Low |
| 19088 | `SpawnVol3` | Confirm whether this is an internal spawn-volume label or player-facing text before deciding how to localize it. | Korean expands it as `스폰 볼륨 3`; Japanese/English retain `Vol3`, while Chinese also spells out level 3. Historical note marks its status unresolved. | Medium |
| 19089 | Red / threat and order | Keep the signature distinct from the preceding threat; determine whether Red is a person, faction, or speaker label. | Korean preserves the blank line and renders the signature as `레드`; the isolated row does not establish its function. | Medium |
| 19092 | “another sacrifice” / reward location | Confirm whether sacrifice is a physical offering or broader ritual cost. | Korean interprets it as presenting an offering (`제물`); Japanese/Chinese likewise suggest sacrifice/ritual. | Medium |
| 19098 | “The chest it's in” | Preserve the speaker's self-correction and the unknown chest/object without resolving it from this line alone. | Korean keeps the correction and uncertainty about which chest; English and Japanese imply a ledger/storage chest while Chinese leaves the object unclear. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 19051, 19055-56, 19065, 19067,
  19073-76, 19078, 19082, 19088-89, 19092, and 19098 against active rows.
  They remain preliminary; no historical note authorizes a translation edit.
- The High Roll rule at 19071 remains unresolved because Japanese specifies
  a sum and English/Korean do not explicitly state whether the sum or a
  single die determines the winner.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain IDs 19050-19099
  in identical order.
- No key, row-count, or physical line-break difference was found.
- At 19055, all locales retain `{*1...}`, `{LINE_SPACE}`, and `{1}` in order;
  the localized Chaos Rift label is preserved inside its wrapper.
- Verse structure at 19067 and the signature break at 19089 match. No
  semantic numeric-value mismatch was found; Japanese writes the two dice at
  19071 as a digit while the other locales spell the count, and 19088's
  `Vol3`/volume-3 label denotes the same value.

## Batch Status

IDs 19050-19099 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 19100-19149.
