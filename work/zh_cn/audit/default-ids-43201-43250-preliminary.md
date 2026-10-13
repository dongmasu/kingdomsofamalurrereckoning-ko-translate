# Preliminary Language Scan: `default` IDs 43201-43250

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 43201-43250 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 43201 | Headsman / prisoner life link | Determine whether the prisoner's life was tied to one specific Headsman or to multiple Headsmen; preserve the causal link without inventing its mechanism. | English first names a singular Headsman, then uses “theirs”; Japanese uses singular, while Chinese/Korean use plural possessive wording. | High |
| 43205 | `-{1}% {2} {3}` format string | Preserve each placeholder's association and intended display order; verify the field semantics before changing locale order. | English, Chinese, and Korean order `{1}`, `{2}`, `{3}`. Japanese reorders them to `{2}{3}-{1}%`. Korean matches English/Chinese. | High |
| 43206 | “blend in, get lost in the sea of faces” / `사람들 틈에 ... 묻힐 수` | Preserve the speaker's wish to remain anonymous and the comparison with a large city. | Korean conveys blending into the crowd without adding a new motive; Japanese makes the place itself emphatically “very good,” unlike English/Chinese. | Medium |
| 43208, 43210 | Reckoning Duration; Parry | Standardize the combat mode and parry terminology while preserving the +45% duration and 25-hit objective. | Korean retains the +45% value and asks for 25 special-attack hits after Parry; locale terminology differs. | Medium |
| 43213 | floating city of gold and silver | Preserve the report as hearsay and the speaker's skepticism about a city floating above the earth. | All four versions retain both materials and the floating-city claim; Korean keeps the “if you can believe it” qualification. | Medium |
| 43214 | Master Hugues / `휴즈 선생님` | Confirm the formal title/name spelling and preserve that Hugues, not the speaker, is making discoveries. | English/Japanese/Chinese identify Hugues as Master; Korean uses the deferential Korean title “teacher.” | Medium |
| 43215 | Telling / `전승의 이야기` | Confirm whether Telling is the named fate/legend cycle or ordinary storytelling; standardize the capitalized term. | English capitalizes it and links it to the Maid's fixed desire to destroy the House of Ballads. Japanese uses a named “Telling,” while Chinese calls it a prophecy. | High |
| 43216 | First Sword / `제일검` | Confirm whether this is the established formal rank/title and standardize its Korean form. | English/Japanese treat First Sword as a title; Chinese and Korean translate it literally. | Medium |
| 43218, 43221 | Freemen; Lords of Valor | Distinguish named factions/titles from generic “free people” and “lords,” then standardize recurring forms. | Korean translates both semantically. English capitalization suggests formal names; Japanese transliterates Lords of Valor, while Chinese translates it. | Medium |
| 43220 | Chaos potion recipe / reagent terms | Preserve the four reagents, order, and quantities; standardize Chaos/Scarwood/Bloodroot/Fate terminology. | All four locales retain Chaos Essence 3, Scarwood Bark 2, Bloodroot 1, and Essence of Fate 1, with the same recipe paragraph structure. | High |
| 43224 | `sanguine crystal`; `{*3Blood}` / `핏빛 수정`, `{*3피}` | Preserve the marker's style code and confirm whether the localized content should be “blood” or “blood essence.” | Korean retains marker code `3` and localizes its text. All locales keep the sharp-crystal, powder, and potion-binding sequence. | Medium |
| 43225-43228 | Gardens; Harrol poem title; Prismere Chantry | Standardize the named location/institution and preserve the short poem title's direct address. | Korean uses generic `정원`; locale references translate or transliterate Prismere Chantry differently. The historical log flags the Harrol title and Chantry terminology. | Medium |
| 43229 | “free ourselves” / `우리 스스로 벗어날 수만 있다면` | Preserve the unfinished escape wish and the conditional trap: as long as she remains, the speakers remain too. | All locales retain the trailing fragments and the “she is here / we are here” relation; Korean makes the captivity implication explicit. | Medium |
| 43230 | `{1} of 3 beacons extinguished` | Preserve the completed-count variable and total of three; confirm the display order expected by the target UI. | English/Chinese place `{1}` before the total. Japanese/Korean put the total first and retain `{1}` as the extinguished count. Values and marker identity are intact. | High |
| 43231 | `#NAMED_ICON_360_RS#Camera` | Keep the named-icon token unchanged and standardize the localized camera/view label. | The exact icon identifier is present in all four locales; localized text differs appropriately by locale. | High |
| 43232 | Beckoned / `선택받은 자` | Standardize the recurring title while preserving the instruction to seek treatment above. | English uses Beckoned as direct address; Chinese calls the addressee chosen and Korean uses its existing provisional title form. | Medium |
| 43233 | “He is but a soldier, an officer” / `그저 병사가 아니라 장교` | Resolve whether `but` means “merely” or introduces a contrast (“not a soldier but an officer”) from context. | English punctuation permits a compressed reading; Japanese/Chinese use a contrastive “not soldier but officer,” as does Korean. | Medium |
| 43236 | Ambassador Keen / “put an end to that” | Preserve the threat and identify whether the requested action is explicitly killing Keen or ending her obstruction more generally. | English and Korean leave “that” indirect; Japanese similarly says to put an end to it, while Chinese makes the threat of her death explicit. | Medium |
| 43238-43240 | Teeth of Naros; House of Ballads; Keep Library | Standardize regional/institution names and clarify whether Keep Library is a named facility. | Korean retains the ancient mountain carvings, fallen House, and almost-complete library, but translates Teeth of Naros and uses “Keep” phonetically. | Medium |
| 43243 | “given all the tools” / `모든 수단을 얻었기에` | Preserve the antagonist's stated reason for requiring the addressee's death without changing who received the tools. | English, Japanese, Chinese, and Korean retain the same cause-and-consequence relationship. | High |
| 43245 | `falter` / `무너지리라곤` | Confirm whether the speaker means that she would falter, fail, or lose courage; preserve the broken recollection and ellipses. | Korean uses “break down/collapse.” Japanese says the outcome was unexpected; Chinese explicitly says she would retreat. | Medium |
| 43246 | Counsel / `자문위원`; Cipher / Hyperian | Determine whether Counsel is a person, group, or body of advice and standardize the related lore names. | English capitalizes Counsel but uses a singular verb. Korean chooses an adviser/committee member; Japanese says adviser and Chinese says staff/strategist. Cipher and Hyperian also have recurring name-form questions. | High |
| 43247-43249 | Missives of Sable; Tywili; Rathir | Standardize the document, region, and city names. | Korean renders Missives as correspondence. At 43248 it says “Tywili Coast,” adding “coast” absent from English, while Japanese explicitly includes coast and Chinese says Tywili generally. | Medium |
| 43250 | Thick as Thieves / `막역한 도둑들` | Preserve the idiom/title meaning of close companions and determine whether it names an in-world group or is descriptive. | Japanese gives an “intimate thieves” reading, Chinese translates closeness without thieves, and Korean retains both the intimacy and thief image. Historical notes explicitly flag the title/idiom. | Medium |

IDs 43202-43204, 43207, 43209, 43211-43212, 43217, 43219, 43222-43223,
43226-43227, 43234-43235, 43237, 43241-43244, and 43250 generally retain
the English meaning on this first reading. Proper names, register, and
recurring terminology remain subject to integrated review.

## Historical Audit Reconciliation

- The source-keyed historical section for IDs 43150-43249 was checked. It
  flags the Headsman/prisoner link, field order at 43205, Reckoning, Parry,
  Lerkara Fel, the floating city, Hugues, Telling, First Sword, Freemen,
  reagent names, Prismere Chantry, `{*3Blood}`, the Harrol verse, beacon
  counter, named Camera icon, border record, Assassin Swordsman, Teeth of
  Naros, Counsel/Cipher/Hyperian, and Missives of Sable.
- Historical questions remain prompts for integrated review. No open item
  was silently treated as approved by the previous Japanese-derived audit.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 43201-43250 once
  and in identical ascending order; each default CSV has 65,135 records.
- Embedded line-break counts match across all four locales. The recipe at
  43220 retains its blank paragraph break and four ingredient lines.
- Placeholder identities are retained. Japanese reorders `{1}`, `{2}`, and
  `{3}` at 43205. At 43230, Japanese and Korean place `{1}` after the total
  `3`, while English/Chinese place it before; the count still means `{1} of
  3`. `{*3Blood}` retains style code `3` at 43224, and the exact
  `#NAMED_ICON_360_RS#` token is preserved at 43231.
- Numeric values are preserved: +45% at 43208, 25 at 43210, recipe
  quantities 3/2/1/1 at 43220, 10 of each at 43226, and three beacons at
  43230.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 43201-43250 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 43251.
