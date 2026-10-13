# Preliminary Language Scan: `default` IDs 17950-17999

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 17950-17999.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 17950 | `Cynrics` | Determine whether this is a proper name, demonym, test string, or intentionally untranslated label. | All four locales preserve the same isolated English form; the row gives no context. | Medium |
| 17954 | stopped listening / wandered off | Preserve the speaker's uncertainty and comic complaint about the long-winded man. | Korean retains both interpretations; Japanese more specifically says the speaker may have left mid-conversation, while English leaves the physical “wandered off” reading open. | Medium |
| 17956 | active quest / quest log | Preserve the three controls and their order while localizing only the text inside `{*1...}` markers. | English, Japanese, Chinese, and Korean each have two localized markers around `{1}`; the localized payloads differ as expected. | High |
| 17960 | “if I'm to have a head at the end of this” | Keep the survival idiom figurative rather than turning it into a literal decapitation objective. | Korean's `목을 붙이고 나가다` retains the idiomatic survival sense; this matches the historical question. | Medium |
| 17965-17966 | Wyvyrn-Girfe / Key to the Sorrows | Verify the Great House name and whether “the Sorrows” denotes the House or its key/location. | Korean uses `대가문 - 와이번-기르페` and identifies the key as the House of Sorrows key; Japanese/Chinese render the source phrase differently. | Medium |
| 17967 | `-{1} {2} {3}` | Preserve the source/Korean value order; record the Japanese-only reordering for UI-context verification. | English, Chinese, and Korean order the values `{1}`, `{2}`, `{3}`; Japanese orders `{2}`, `{3}`, `{1}`. | High |
| 17973 | “token amount” | Retain the sense of a symbolic/small amount without inventing what is being offered. | Korean says `상징적인 양`; the source does not identify the token or its quantity. | Medium |
| 17974 | Klurikon sickness / cure / deserters | Verify the disease and preserve that the treatment is difficult to make and must not be taken by deserters. | Korean retains the key facts; `일부를 덮치는 병` is compressed and may benefit from context about whom the sickness strikes. | Medium |
| 17977 | Firstsworn | Standardize the group's proper-name treatment across the corpus. | Korean translates the name as `최초의 맹세자들`, while the source treats Firstsworn as a named group; earlier occurrences use the same Korean form but its naming convention remains open. | Medium |
| 17981 | “I've you to thank” / Astrid says he'd be dead | Check who is being thanked; the Korean may redirect the thanks. | English addresses the listener (“I've you to thank”), but Korean says `아스트리드에게 고맙군` (“I have Astrid to thank”). Japanese and Chinese address the listener, then name Astrid as the source of the survival claim. | High |
| 17984 | Widow's Way | Determine whether this is a named road/title and align its Korean form with the related Maid of Windemere verse. | Korean uses the literal `과부의 길`; Japanese transliterates and Chinese translates the name. | Medium |
| 17987 | Mercantile skill | Verify the established Korean skill name and apply only through a later approved terminology pass. | Korean uses `상업 기술`; Japanese uses a skill-specific term and Chinese uses a trading-skill term. | Medium |
| 17994 | oath / threat to slit throat | Preserve the threatening but wry turn without weakening the physical threat. | Korean retains the oath, throat-cutting threat, and reconsideration; the English uses an em dash where Korean uses an ellipsis. | Medium |
| 17999 | Evasion Chance / `+100%` | Preserve both displayed values and their scope in the two-line ability description. | All four locales retain the same escaped two-line layout and `100%` value. | High |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 17950, 17954, 17956, 17960,
  17965-17967, 17973-17974, 17977, 17981, 17984, 17987, and 17999 against
  the active four-locale rows. They remain preliminary questions; no
  historical note authorizes a translation edit.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain IDs 17950-17999
  in identical order.
- No key or row-count difference was found. Runtime controls at ID 17956
  retain the same marker classes and order, with localized payloads. At ID
  17967, Japanese alone reorders the numeric controls; Korean matches English
  and Chinese. Other brace/bracket tokens and line-break counts match.
- The official Korean manual could not be text-searched in this environment;
  terminology candidates remain unverified against it.

## Batch Status

IDs 17950-17999 received one preliminary reading followed by a disposition
pass. See
[`disposition-batch-default-17950-17999-20261009.md`](disposition-batch-default-17950-17999-20261009.md).
The thank-you direction was corrected at ID 17981. The Japanese-only marker
reorder at ID 17967 remains documented; five name/terminology findings
remain uncertain. Continue disposition work with `default` IDs 18000-18049.
