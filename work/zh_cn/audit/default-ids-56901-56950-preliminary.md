# Preliminary Language Scan: `default` IDs 56901-56950

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 56901-56950 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 56903 | `half-felt apology` / `반쯤은 진심 어린 사과` | Preserve the speaker's uncertainty about whether the apology was sincere or merely partial/half-hearted. | English is ambiguous; Japanese and Chinese both suggest a half-hearted/apparently insincere apology. Korean's “half sincere” is possible but can instead imply that part of the apology was genuine. | Medium |
| 56904 | Font of the Crossing / `교차점 샘` | Confirm whether `Font` is a named place, sacred font, or spring, and distinguish Narca's “affliction” from a curse. | English capitalizes the Font and calls the Narca effect an affliction. Japanese specifically uses a baptismal-font term, Chinese a sacred spring, and Korean a spring plus “curse.” The historical audit flags both names and referents. | High |
| 56913 | Henge / Kollossae / `헨지`, `콜로사이` | Confirm established spellings and preserve that the Henge transports Kollossae between city and surface. | All sources identify the Henge as a transport device; Japanese/Chinese use divergent local names. Korean preserves the mechanism and direction. | Medium |
| 56914 | Prismere / `프리즈미어` | Reconcile the spelling with the existing corpus variants without a row-local global replacement. | All four sources identify the same material/entity. Korean uses `프리즈미어`, while historical notes record multiple Korean spellings. The narrative claim about changing ballads and possessing Wencen is otherwise preserved. | Medium |
| 56915 | Playing Crownhold / `크라운홀드 경기하기` | Determine whether this names a performance/appearance at Crownhold or a game/match. | Japanese says a Crownhold performance and Chinese says performing at Crownhold; Korean's `경기하기` reads as competing/playing a match. English is ambiguous without the activity context. | High |
| 56916 | blind the magical trap / `눈을 멀게` | Confirm the pronoun's referent and preserve the stealth consequence. | English says the magical object still relies on sight; all sources infer that blinding it permits unseen passage. Korean retains the condition and consequence but leaves “it” implicit. | Medium |
| 56919 | `curtain-calls` / `막이 내린 뒤에도 함께하는 이들` | Confirm the intended performer/encore image and retain the camp's list of entertainers. | The line lists bards, singers, tumblers, jugglers, and “curtain-calls.” Japanese uses the literal curtain-call term and Chinese describes performers taking a bow; Korean paraphrases it as people who remain together after the curtain falls. | Medium |
| 56920 | Eldric Orhelm notice | Preserve the western-road departure, 12-day timing, Alserund destination, Bodine Borgues, walking-stick clue, and gold reward. | All four sources retain these details. Korean's notice is coherent; exact proper-name forms and the route/reward wording remain historical review prompts. | Low |
| 56926 | quarried stone / `다듬고 채석해 둔 돌` | Keep the source's sequence and clarify whether the stone was found already hewn/quarried or the warriors quarried it. | English's syntax is compressed; Japanese says the soldiers found stone already cut and ready to use, while Chinese says they quarried it to build the city. Korean combines both readings (“hewn and quarried”), leaving the agency ambiguous. | Medium |
| 56933 | Hoarders in the Sewer / `하수도의 수집광들` | Determine whether this is an in-world group, quest, or descriptive title. | All sources use a title-like phrase for sewer hoarders. Korean reads as a plural descriptive label; the historical audit leaves the title's status open. | Medium |
| 56938 | the Cradle / `요람` | Confirm whether this is a named place, likely the Cradle of Summer, rather than a generic cradle. | English capitalizes `Cradle`; Japanese supplies “Cradle of Summer,” while Chinese is less explicit. Korean omits the possible Summer title and treats it as a place generically. | Medium |
| 56941 | Scholia / `스콜리아`; `head for letters` / `글공부에 소질` | Confirm Scholia as the formal institution name and preserve the idiomatic literacy/learning meaning. | English capitalizes `Scholia` and says the speaker had “a head for letters.” Japanese interprets this as reading ability and Chinese as literary skill; Korean's “aptitude for letters/study” is plausible. | Medium |
| 56943 | Tala-Rane / `탈라-레인` | Confirm the canonical location spelling and preserve the wasteland-traversal context. | All sources identify the same wasteland region; Korean follows the English name phonetically. The historical audit leaves the proper name open. | Low |
| 56945 | Xeno / `제노` | Confirm the name's canonical spelling and preserve the intended intellectual contest. | All sources identify Xeno as the person to speak with and describe a contest/testing of intellect. Korean preserves both the request and intended contest. | Low |

Other reviewed rows generally preserve the first-read English meaning and
Japanese voice/register. Names and terms remain provisional, including
Gorhart, Fellfire Bloom, Narca, Font of the Crossing, Luminitsa, Gnarsh,
Mauritania, Henge, Kollossae, Prismere, Crownhold, Eldric Orhelm, Bodine
Borgues, Dalentarth, the Cradle, Scholia, Tala-Rane, and Xeno.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `56850-56949`.
  Relevant prompts in this active range include Font of the Crossing and
  Narca (56904), Prismere spelling variants (56914), Playing Crownhold
  (56915), the sight-dependent trap (56916), curtain-calls (56919), Eldric's
  notice (56920), quarrying sequence/pronouns (56926), Hoarders in the
  Sewer (56933), the Cradle (56938), Scholia and “a head for letters”
  (56941), and Tala-Rane/Xeno (56943, 56945). These remain prompts, not
  accepted corrections.
- IDs 56901-56949 fall within `56850-56949`. ID 56950 begins the next
  historical range `56950-57049` and is reviewed once here as the batch's
  final row; it must not be counted again in a later batch.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 56901-56950 once
  and in identical ascending order. All four default files contain 65,135
  records with identical full key order.
- Newline counts match throughout the batch.
- `{1}` at 56910 is retained once in all four locales and in the same
  position. The +6% Fire Damage at 56902 and +20% Stun Duration at 56918
  retain their values; no numeric discrepancy was identified.
- Active CSV SHA-256 values remain at the recorded checkpoint:
  - `base`: `c6adbf220bd66bab7ef61274886ea6a47427b58dc971f9e9703d4fd089b946a6`
  - `affix`: `7697d7d09933ca7f7f8f6e41fcd82bb5f29e4b092368b856489a8c62f1dc21b9`
  - `default`: `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`
- No translation CSV edit was made.

## Initial Batch Status

IDs 56901-56950 received one preliminary reading. The subsequent disposition
pass is recorded below and in the linked batch report.

## Disposition Follow-up (2026-10-11)

All 50 rows were rechecked against the English, Japanese, and Chinese source
CSVs under `src/csv/`, the active Korean CSV, and the source-keyed historical
audit. One correction was applied at ID 56919. Thirteen findings remain
uncertain and 36 IDs were dispositioned `not an issue`. See
[`disposition-batch-default-56901-56950-20261011.md`](disposition-batch-default-56901-56950-20261011.md).
These are working dispositions, not independent final linguistic approval.

The four locale CSVs contain 65,135 IDs in identical order. Batch line-break
counts and runtime markers match. `{1}` at 56910, `+6%` at 56902, and
`+20%` at 56918 are preserved. The active Korean default CSV SHA-256 is
`333016dfb93c55119c1093c64e26fd8e9885ee6ed575f4eca994383a102ffe3a`.
UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
pre-existing bare-LF endings are preserved. Resume at ID 56951.
