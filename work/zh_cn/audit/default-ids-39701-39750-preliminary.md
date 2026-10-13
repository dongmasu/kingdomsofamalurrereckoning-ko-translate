# Preliminary Language Scan: `default` IDs 39701-39750

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 39701-39750 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 39707 | “these refugees are the worst” / `이 난민들이 가장 딱해` | Preserve the possible contrast between “the worst [off]” and “the worst [people]”; check the speaker's intent in context. | English is ambiguous in isolation. Japanese explicitly reads the refugees as being in the worst circumstances, which supports Korean `딱해`; Chinese can instead be read as saying the refugees themselves are bad. This is a source/reference ambiguity, not a confirmed Korean error. | Medium |
| 39719 | Voices of the Isle / `섬의 목소리` | Check whether plural “Voices” is a collective/title meaning and whether the Korean title should retain that plurality. | English uses plural `Voices`, while Japanese uses singular `島の声`; Chinese uses a plural/archipelago-like form. Korean also has a singular “voice of the island” reading. Confirm the title's referent before changing it. | Low |
| 39723 | House of Valor / `용맹의 가문` | Align the named Fae House with the recurring `용맹의 집` / `용맹의 전당` variants after a terminology decision. | The source capitalizes the formal institution. The active corpus has 99 source rows containing `House of Valor`; Korean examples use both `용맹의 집` and `용맹의 전당`, while this row uses `용맹의 가문`. Related audits already call for consistent House of Valor treatment. | Medium |
| 39724 | “Selni thinks I should look around the watch” / `경비대 주변에서 정보를 알아봐야 한다고 생각한다` | Restore or clarify the stated source of this plan: Selni, rather than the narrator. Also preserve `Sparrows` as the named rag-picker group. | English explicitly says “Selni thinks I should”; the Korean omits Selni as the thinker after first mentioning her request, so the sentence can read as the narrator's own conclusion. Japanese also assigns the request to Selni. | High |
| 39727 | Tilera / `그보다 용감한 전사는` | Avoid a potentially masculine/ambiguous pronoun for the named female warrior; consider repeating the name instead. | English names Tilera and Japanese explicitly uses a feminine pronoun. Korean `그보다` can be read as “than him,” even though Korean `그` is sometimes used generically. | Low |
| 39729 | Warsworn / `워스원` | Carry forward the open faction-name consistency issue; compare with the prevalent `워스워른` form. | The active corpus has many `Warsworn` rows using both `워스워른` and `워스원`, alongside occasional semantic translations. Earlier reports already flag this as a corpus-wide issue; no global normalization is authorized. | Medium |
| 39730 | The Well / `샘` | Confirm whether this capitalized standalone label names a specific place/entity or means a generic well; align only after context review. | English capitalizes the term, while Japanese `泉` and Chinese `井` can be generic nouns. Korean uses generic `샘`; related audit reports have left Well/Well of Souls distinctions open. | Medium |

ID 39709 is a long tutorial string. The `{LINE_LEFT}`, `{LINE_SPACE}`, and
`{*1...}` / `{*2...}` markers retain their identities and order in all four
locales; only localized heading payloads differ. English and Korean spell
out “nine,” while Japanese uses `9`. At ID 39738, `x 50` is retained; the
automated digit scan's Chinese `0`-only match is a regex artifact, not a
quantity mismatch.

IDs 39701-39706, 39708-39718, 39720-39722, 39725-39726, 39728,
39731-39750 generally retain the English meaning on this first reading.
Names, UI labels, and terminology remain subject to integrated review.

## Historical Audit Reconciliation

- No source-keyed historical question entry was found for IDs 39701-39750;
  this range falls within the documented 37700-40349 gap.
- Related preliminary questions were checked for Warsworn and House of
  Valor; both remain open terminology decisions. The official Korean manual's
  `Fateweaver = 페이트위버` term is preserved at ID 39716.
- The official Korean manual could not be text-searched in this environment;
  no additional manual-based terminology claim is made here.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 39701-39750 once
  and in identical order.
- Embedded line-break counts match across all four locales. Runtime-marker
  identities/order match; localized label payloads at ID 39709 are expected.
- No confirmed gameplay-value mismatch was detected.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 39701-39750 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 39751.
