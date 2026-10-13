# Preliminary Language Scan: `default` IDs 41851-41900

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 41851-41900 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 41860 | `The Hero returns... but to what?` / `영웅이 돌아왔군... 그런데 어디로?` | Preserve the rhetorical “to what end/for what?” unless context confirms the question is about destination. | English and Japanese question the purpose/value of the Hero's return; Korean asks where the Hero is returning, closer to the Chinese reading. | Medium |
| 41862 | Sons of Laz / `라즈의 아들들` | Confirm whether this is the named faction and standardize the name. | English/Chinese identify the Sons of Laz, while Japanese calls them Laz soldiers. The historical question log flags the faction reading. | Medium |
| 41863 | the Oath / `맹세를 한 자들` | Determine whether “the Oath” is a formal faction/status and preserve that distinction from an ordinary promise. | Korean preserves the sworn members' respect across Amalur; the source-keyed historical log leaves the institutional status open. | Medium |
| 41864 | Wending / Spire / `웬딩`, `첨탑` | Clarify whether the cards and walks refer to named locations/activities and standardize the recurring terms. | Korean preserves the speaker's expectation of another day, card-playing, and a walk; references diverge on whether Spire is a named stair/structure. | Medium |
| 41867-41868 | fate / Alyn Shir; `cut me down` / `베어 죽여 줘` | Preserve the danger of changing fate and verify whether the speaker asks for execution or release to Esharra. | Korean retains the Alyn Shir comparison and explicitly reads `cut me down` as killing; the historical log keeps the latter context open. | Medium |
| 41872 | Orison / `오라이슨` | Confirm whether this is a named rite/entity or the ordinary word “prayer,” then standardize it. | Korean and Japanese transliterate the term; Chinese interprets it as prayer. The isolated question does not settle the sense. | Medium |
| 41875 | four-line Nix poem, stored as one string | Preserve the source's four-part poetic content without inserting unsupported CSV line breaks; review imagery and voice in the integrated pass. | English contains four verse lines within one source string; Korean conveys the troll's dissatisfaction with its form and desire to change. Historical notes explicitly say the string has no source line breaks. | Medium |
| 41880 | Varani Kessanniki / `바라니의 케산니키` | Verify whether Kessanniki is a named genre/text and keep it distinct from the gloss “sea chants.” | Korean retains both the name and explanatory gloss; Japanese transliterates the name and calls them boat songs, while Chinese treats it as a title. | Medium |
| 41882 | Rat Plague / `쥐 역병` | Determine whether this names a disease/event or a rat infestation and standardize the title. | Korean and Chinese use a plague/disease reading; Japanese describes a mass outbreak of rats. | Medium |
| 41888 | `& Public Relations` (unchanged) | Confirm the interface/category role; preserve the exact source label pending context. | Korean keeps the English string exactly, consistent with the historical structure note. Its intended UI use remains unresolved. | Medium |
| 41891 | shield tutorial; malformed English clause | Record the English source fragment (`Master ... , allow you ...`) and verify that the Korean tutorial still expresses the intended shield/parry/bash instruction. | Korean is grammatical and retains both Parry and Shield Bash functions; this appears to repair the source grammar rather than add a new mechanic. | Medium |
| 41897 | key-guarding “they” / `그들의 질문` | Identify the guards and confirm whether the addressee must answer questions or otherwise address them. | Korean makes the implied question explicit; English only says “if only you answer them,” while Chinese specifies statues and their questions. | Medium |
| 41900 | Patrick Morkan and his dead wife | Preserve the source's explicit statement that the wife is already dead and clarify the intended target/mechanism from context. | Korean retains both Patrick and `his dead wife` as the task, matching the source; the historical log flags this unusual objective as a source/context question. | Medium |

IDs 41851-41859, 41861, 41865-41866, 41869-41871, 41873-41874,
41876-41879, 41881, 41883-41887, 41889-41890, 41892-41896, and 41898-41899
generally retain the English meaning on this first reading. Proper names,
register, and recurring terminology remain subject to integrated review.

## Historical Audit Reconciliation

- Source-keyed historical questions for IDs 41850-41880, 41882-41911, and
  41900-41918 were checked where they overlap this batch. They specifically
  flag Sons of Laz, the Oath, Wending/Spire, the Alyn Shir threat, `cut me
  down`, Orison, the Nix poem, Kessanniki, `& Public Relations`, the shield
  tutorial, and the key-guarding “they.”
- The historical record says the Nix passage remains one CSV string and that
  `& Public Relations` is retained exactly; both were verified against the
  active source and Korean files.
- The unusual task involving Patrick Morkan and his dead wife at 41900 is
  source wording, not a Korean-only addition.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 41851-41900 once
  and in identical ascending order.
- Embedded line-break counts, detected runtime-marker sequences, and numeric
  token sequences match across all four locales.
- ID 41861's period-only text and ID 41888's `& Public Relations` string are
  retained.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 41851-41900 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 41901.
