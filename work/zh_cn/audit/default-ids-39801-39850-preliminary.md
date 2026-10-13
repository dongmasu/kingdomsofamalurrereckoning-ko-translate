# Preliminary Language Scan: `default` IDs 39801-39850

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 39801-39850 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 39802 | Basilica Gnostra / `바실리카 노스트라` | Align with the existing alternatives `바실리카 그노스트라`, `노스트라 대성당`, and `그노스트라 대성당` after a project-wide naming decision. | This is a recurring named institution (47 source rows). Earlier audits at IDs 4493, 11462, and 13865 already identify inconsistent Korean renderings; this occurrence adds another variant. | High |
| 39807 | “before you could count twelve” / `네가 열둘을 세기도 전에` | Keep the English/Chinese count unless broader context establishes a timed interval; record the Japanese divergence. | English says “count twelve” and Chinese agrees, but Japanese says the guards return the speaker within ten seconds. Korean follows English and Chinese. This is a source-reference discrepancy rather than a Korean numeric error. | Medium |
| 39809 | Master Makers / `명장들` | Confirm whether this is a formal group/name and distinguish it from generic master artisans. | English capitalizes `Master Makers`; Korean translates it generically as `명장들`. Related entries variously use `장인 대가`, `명장`, and English in parentheses; prior audit records already leave the group/title unresolved. | Medium |
| 39820 | Caeled Coast / `캐일드 해안` | Align the proper-name spelling with related `Caeled Coast` entries after terminology review. | Earlier audit work records both `캐일드` and `케일드` for this same coast (including ID 1354); the present row follows one active variant but does not settle the canonical form. | Medium |
| 39827 | Theater of Fate / `운명의 극장` | Retain the English/Chinese “theater” reading unless context establishes the Japanese-only “altar” interpretation; keep the title's Korean form consistent. | English and Chinese say “Theater of Fate,” while Japanese says `運命の祭壇` (“Fate altar”). Korean follows English. An earlier report at ID 5751 already records this source divergence. | Medium |
| 39839 | “They forced a village of mortals to shelter them.” / `필멸자 마을을 강제로 점거하고` | Preserve that the village was coerced into sheltering the Tuatha, rather than asserting that the Tuatha occupied/seized it. | English, Japanese, and Chinese say the Tuatha forced the village to shelter/provide for them. Korean `점거하고` describes occupation of the village, changing the action and omitting the explicit sheltering relation. | High |
| 39843 | General Tilera / `티레라 장군` | Align this person's Korean spelling with related occurrences before finalizing the proper name. | Other active rows render the same English name as `틸레라` and `티레이라`; this occurrence uses `티레라`. The source-keyed historical range is unavailable here, but the active corpus gives direct same-entity comparisons. | High |
| 39847 | “Mortals are chaos animals.” / `필멸자는 혼돈을 좇는 짐승` | Preserve the source's “creatures/animals of chaos” image without adding that mortals actively seek chaos. | Japanese says `混沌の獣` (“beasts of chaos”) and Chinese says “chaos animals.” Korean `혼돈을 좇는` means “pursuing chaos,” adding agency not present in the other references. | High |
| 39849 | the Sorrows / `소로스` | Determine whether `Sorrows` refers to a force, people, or named group and align with other uses instead of transliterating in isolation. | English capitalizes the term and says it is unleashed on mortal armies. Related active rows use `비탄의 힘`, `비탄의 집`, and `소로스`; earlier audit questions explicitly leave the referent open. | Medium |

ID 39829 contains the English spelling `gaunlets` for `gauntlets`; the Korean
uses the apparent intended item name, so this is recorded as a source typo,
not a Korean defect. The `Well of Souls` at ID 39774 is consistently rendered
as `영혼의 샘` here and is not conflated with the standalone `The Well`.

IDs 39801, 39803-39806, 39808, 39810-39819, 39821-39826, 39828-39838,
39840-39842, 39844-39846, 39848, and 39850 generally retain the English
meaning on this first reading. Other names and terms remain subject to
integrated review.

## Historical Audit Reconciliation

- The source-keyed historical log contains an entry for IDs 39750-39849,
  including IDs 39804-39805, 39816, 39825, 39829, 39831, 39839-39841,
  and 39849. A second entry for IDs 39850-39949 begins at ID 39852; its
  questions for IDs 39852, 39858, 39860, 39871, 39877-39878, and
  39884-39888 overlap this report's scope.
- The older description of IDs 37700-40349 as wholly undocumented was
  inaccurate; the historical log has source-keyed entries within this span.
- Related prior questions were checked for Basilica Gnostra, Master Makers,
  Caeled Coast, Theater of Fate, and the Sorrows. These remain open and are
  not treated as approved terminology decisions.
- The official Korean manual could not be text-searched in this environment;
  no manual-based terminology claim is made here.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 39801-39850 once
  and in identical order.
- Embedded line-break counts match across all four locales. Runtime-marker
  identities/order match; `{1}` at ID 39826 is preserved in all four.
- The numeric check found no Korean gameplay-value mismatch. Japanese uses a
  ten-second wording at ID 39807 instead of the source's count-to-twelve
  expression; the dozen-bet amount at ID 39835 is also preserved.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 39801-39850 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 39851.
