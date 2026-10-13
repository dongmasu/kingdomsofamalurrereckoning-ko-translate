# Preliminary Language Scan: `default` IDs 39501-39550

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 39501-39550 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 39513 | Templars / `템플러` | Check whether the organization should follow one project-wide Korean form. | The 165 English-keyed rows containing `Templar` use several active Korean renderings, including `템플러`, `성전기사`, and `성전기사단`. The current standalone plural follows one existing form but remains inconsistent with others; no global normalization is authorized. | Medium |
| 39521 | The Raven / `까마귀 여관` | Verify whether this is the named inn `Raven` and align its Korean rendering with related references. | The English capitalization and Japanese `大がらす亭` indicate an establishment name. Related active rows render `Raven` as `레이븐 여관(Raven)` (ID 52850) and `레이븐(Raven)` (ID 53908), unlike the literal `까마귀 여관` here. | Medium |
| 39523 | Antelope Trophies / `영양 전리품` | Verify the quest-object sense of `trophies`; consider whether it means trophies, heads, or another collectible rather than generic spoils. | Japanese says `レイヨウの首` (“antelope heads”), Chinese uses `奖杯` (“trophies”), and Korean uses the broader `전리품` (“spoils”). The English objective alone does not establish the exact game object. | Medium |
| 39541 | Plagueshield / `역병 방패` | Resolve the established sense and use of this recurring term before standardizing this occurrence. | The 46 English-keyed `Plagueshield` rows include Korean forms such as `역병 방호제`, `역병 방패`, `플라그실드`, and `역병 방호막`; nearby contexts describe a treatment/medicine, while this short line does not disambiguate the item. Historical terminology questions remain open. | Medium |
| 39542 | the Telling / `전승` | Confirm that this capitalized cultural/storytelling institution is distinguished consistently from generic “tradition/story.” | The active corpus uses forms including `전승(Telling)`, `이야기(Telling)`, and `구전(Telling)`. This row's `전승` may be valid, but the formal setting-specific sense remains unsettled in related audit notes. | Medium |
| 39543 | “A great sword to the throat.” / `목에 대검을 들이댔지.` | Check whether the line describes a killing/throat wound rather than merely pointing a sword at the throat. | English recounts a bloody killing and Japanese says `大剣で喉を` (“with a great sword to the throat”); Chinese explicitly says the throat was cut. Korean `들이대다` can imply brandishing/holding the blade at the throat and may soften the described violence. | Medium |
| 39544 | Gallows End / `가로우즈 엔드` | Carry forward the known place-name consistency issue; decide a canonical form only in terminology review. | The active corpus has many variants for this same place, including `갤로스 엔드`, `갤로우즈 엔드`, `갤로우스 엔드`, and literal forms such as `교수대 끝`. Historical and recent preliminary audits already identify this as a corpus-wide consistency concern. | High |

The English source has apparent text errors at IDs 39512 (missing punctuation
before “The Niskaru”) and 39531 (`they day` for `the day`); the Korean
preserves the apparent intended meaning and these are not counted as Korean
defects. ID 39546 also has the English typo `to from` where context and all
three references support `to form`; Korean follows the apparent intended
meaning.

IDs 39501-39512, 39514-39520, 39522, 39524-39540, and 39545-39550 generally
retain the English meaning on this first reading. Proper names, register,
and short UI/object labels remain subject to integrated review.

## Historical Audit Reconciliation

- No source-keyed historical question entry was found for IDs 39501-39550;
  this range falls within the documented 37700-40349 gap.
- Related open terminology questions for Templars, the Telling, Plagueshield,
  and Gallows End were checked. They remain unresolved and are not treated as
  approved terminology choices.
- The official Korean manual could not be text-searched in this environment;
  no manual-based terminology claim is made here.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 39501-39550 once
  and in identical order.
- Embedded line-break counts match across all four locales. No runtime-marker
  identity/order mismatch was detected.
- Number-word renderings differ in Japanese at IDs 39501 and 39518, and
  Japanese/Korean render the chapter numeral at 39506; these are localized
  text forms, not gameplay-value discrepancies. No numeric gameplay-value
  exception was detected.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 39501-39550 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 39551.
