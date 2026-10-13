# Preliminary Language Scan: `default` IDs 64901-64950

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 64901-64950 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, source-keyed historical
  questions, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 64902 | Gallows End / `갤로스 엔드` | Reconcile with the project's other Korean forms, including literal translations. | This is a recurring high-impact place-name inconsistency; this row uses one transliteration among several. Do not normalize without an approved term decision. | High |
| 64903 | `FAIL LINE` | Preserve as developer/debug text unless UI context establishes it should be localized. | English/Japanese retain the literal token; Chinese translates it. Korean preserves the source string. | Medium |
| 64905 | `A second?` / `결투 보조자?` | Confirm `second` means a dueling assistant/witness, not a second unit of time. | Korean selects the dueling role, consistent with Japanese; Chinese says reserve/backup fighter. Historical context also identifies this as a dueling role. | Medium |
| 64907 | four famous scribes and missing works | Preserve all names and the incomplete, disappointed statement. Check transliterations against the project glossary. | Korean keeps Aewald, Dulsten, Kallas, and Wildfrold and the narrator's near-completion; other locales spell the names differently. | Medium |
| 64909 | salvage near Cape Solace | Check Cape Solace's established form and preserve the speaker's contrast between the ghastly face and interest in salvage. | Korean retains both clauses. Historical locale names vary for this place. | Low |
| 64911 | Kollossae / `콜로사이` | Verify the canonical people-name and preserve the distinction between the intruder and the land's owners. | Korean keeps the challenge and collective identity; transliterations differ across locales and other Korean rows. | Medium |
| 64918 | ten houses flanking the spire and two atop it | Preserve the exact 10+2 arrangement; verify whether `flank the spire's rise` refers to positions beside the ascent or along a spiral stair. | Korean follows English with ten beside the spire and two at its top. Japanese explicitly mentions a spiral staircase, not stated in English. | Medium |
| 64919 | signet ring / escape undetected | Preserve the causal plan: the ring has been returned so Kandrian will wear it and die; the narrator must escape and speak to Eli Tems. | Korean retains the sequence and names without adding the curse mechanism. | Low |
| 64921 | Pledgeshield / `플레지실드` | Check rank/title spelling against the established Pledgeshield terminology. | English directly addresses the addressee by the rank; Japanese/Chinese omit the title. Korean preserves the address. | High |
| 64922 | Age of Deep Gloam / ettin hammer | Preserve the discovery location/time and the ettin belief that their god's spirit inhabits the hammer. | Korean keeps Skycrown Mountain, the era, and the belief. Japanese recasts it as a protective god; English only says their god. | Low |
| 64925 | `freed of bolgan` / `볼건을 몰아내야` | Preserve the requirement to clear bolgan from the cliffside location without implying the story itself is imprisoned. | Korean treats the phrase as driving the creatures away, consistent with the quest context and Japanese. | Low |
| 64927 | `artistic license` / `사실을 각색했어` | Preserve the admission that the writer embellished the correspondence. | Korean expresses factual embellishment, a plausible contextual reading; Japanese says artistic spirit and Chinese says artistic license. | Medium |
| 64930 | `wooed me, honored me` / `사랑을 속삭이고, 치켜세우며` | Preserve the witch's sequence of seduction, courtship, honor, and promise of power. | Korean captures seduction, romantic pursuit, flattery, and power but may compress the distinct “honored me” step. | Medium |
| 64937 | `Too tall.` / `너무 커.` | Keep the phrase contextually open: it may mean too tall, not merely too large. | English/Japanese specify height; Chinese may mean “too tall for me.” Korean `크다` is broader and retains ambiguity. | Medium |
| 64948 | Caer Elatha / Crossing's energy / `지형을 바꿔 놓았지` | Preserve that spiritual confluence is not accidental and the Crossing's energy influenced/shaped the landscape. | Korean conveys the energy changing the terrain; the English final clause is elliptical about the ancients' prior shaping. Proper-name spelling remains open. | Medium |

Other reviewed rows generally retain first-read meaning, including
architecture, quests, conversation, Henge travel, and combat references.
Findings remain provisional and are not confirmed corrections.

## Historical Audit Reconciliation

- Rechecked the historical source-keyed entry covering IDs 64850-64949.
- Historical questions independently flag `FAIL LINE`, the dueling second,
  scribes, the ten houses, `Too tall`, and Caer Elatha Crossing.
- No historical candidate was treated as an approved correction.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 64901-64950 once
  and in identical ascending order.
- Embedded newline counts and runtime marker identities/order match.
- No embedded line breaks, runtime markers, or numeric values occur in this
  range; the 10+2 house count is retained.
- No translation CSV edit was made.

## Batch Status

IDs 64901-64950 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 64951.
