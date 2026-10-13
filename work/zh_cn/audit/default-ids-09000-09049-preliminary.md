# Preliminary Language Scan: `default` IDs 9000-9049

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 9000-9049.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, and applicable historical questions in
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 9000 | `both of their houses` → `양쪽 가문` | Keep both houses unnamed unless the surrounding quest identifies them; preserve that both will crumble. | The English threat gives no house names. Korean retains both without assigning factions; this is consistent with the historical open question. | Medium |
| 9001 | `your aunt` → `네 이모할머니` | Avoid adding a great-aunt generation not present in the source; choose a suitable Korean aunt term only with speaker/family context. | English says only `aunt`; Japanese uses `叔母` and Chinese `姑姑`. Korean `이모할머니` specifies a great-aunt relationship unsupported by this line. | High |
| 9003 | `scandalous wretch`; homeland/people scale contrast | Preserve the speaker's disparaging description of their father and the contrast between the homeland's large features and the small stature of its people; do not infer the speaker's identity. | Korean retains both claims and the insult. The homeland and people are not named in this line, as noted in the historical audit. | Medium |
| 9009 | `infrequent equipment` → `고급 장비` | Confirm the equipment rarity tier and use the exact Korean UI term; distinguish rarity from general quality. | Japanese explicitly says uncommon rank, while English uses the unusual `infrequent`; Korean `고급` can mean high-grade rather than the game's uncommon rarity. Chinese says rare, so the tier remains unresolved. | Medium |
| 9018 | Pirate-king opening verse / `blood-red wake` | Preserve the elevated, unfinished verse and the nautical image of a blood-red wake; confirm whether the trailing ellipsis is intentional across the verse. | Korean renders `wake` as a ship's wake/track (`항적`) and keeps the line fragment. The sentence continues beyond this row. | Medium |
| 9026 | Capitalized `The Maid` → `시녀` | Check whether this is the named Maid of Windemere/title rather than a household servant; preserve the capitalized referent if context confirms it. | English capitalizes `The Maid`; Japanese explicitly names the Maid of Windemere, while Chinese also says “maiden.” Korean currently uses generic `시녀`. | Medium |
| 9028 | `Tuatha Overlords` → `투아타 대군주` | Standardize the ethnonym against recurring `투아사` forms and confirm whether `Overlord` is a rank or creature category. | The same source name appears in both `투아타` and `투아사` Korean forms elsewhere. English, Japanese, and Chinese support a plural pair of Tuatha Overlords. | Medium |
| 9030 | `Delvers` / `Sorrows` → `탐굴자` / `비탄의 힘` | Reconcile `Delvers` as a formal role and `Sorrows` as a named entity/concept with earlier uses; preserve that only this character can commune with them. | English capitalizes both terms. Japanese uses a role-like “bearers” and generic sorrow; Chinese calls them researchers and sorrow spirits. Korean's current terms are plausible but not established. | Medium |
| 9035 | `{*1[Passive]}`; blunt-trauma mastery | Confirm the established Korean for the passive label, blunt-weapon damage category, and `Stunned`; preserve the condition that damage increases against stunned enemies. | All locales localize the same `*1` passive label. Korean keeps the target status and effect but renders “art of blunt trauma” as `둔기 충격 전투`, whose category/official term needs confirmation. | Medium |
| 9036 | `Pledgeshields` → `서약방패병` | Confirm this plural formal rank/group name against `Pledgeshield` occurrences and distinguish it from `Plagueshield`. | Korean uses a consistent provisional rank form. Japanese instead says second-class mercenary and Chinese transliterates the shield term; related English spellings can be confused with `Plagueshield`. | Medium |
| 9041 | `former Oathblade` / Keurig Shaster / Mattix Dace / Derfel | Verify names and the formal `Oathblade` rank; preserve that Mattix hired Keurig, who followed the player intending to kill Derfel. | Korean preserves the hiring and threat but uses the unsettled `서약검병` rank. The final request is phrased awkwardly as `처리하는 데 도와 달라고`; distinguish a Korean readability candidate from any source-meaning issue. | Medium |
| 9043 | `pick` / Eloren Criet / jewelry box | Preserve that the lockpick was seen in the jewelry box associated with Eloren; avoid asserting more about who placed it there. | English's `on the personage of` is awkward. Japanese and Chinese say the box belongs to Eloren; Korean says she put the pick in it, adding agency not explicit in English. | Medium |
| 9047 | `Plagueshield` → `역병방패`; compare `Pledgeshields` at 9036 | Keep the two spellings distinct until context establishes whether they are separate names or a source inconsistency. | English has `Plagueshield`, unlike `Pledgeshields` at ID 9036. Korean follows the English distinction; the historical audit already flags this pair. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 9000, 9003, 9009-9010, 9018,
  9030, 9035-9036, and 9041 against the active rows.
- Kept `Plagueshield` and `Pledgeshield` separate at IDs 9047 and 9036;
  no spelling was silently normalized.
- Added current-row questions for IDs 9001, 9026, 9028, and 9043 after direct
  comparison with all four locales.
- Historical candidates remain evidence only; none authorizes a translation
  edit.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys and order.
- Actual CSV record line-break counts match across all four locales.
- Runtime-marker IDs/order and other control tokens match in this range;
  ID 9035 localizes the visible `[Passive]` label while retaining marker ID
  `*1`.
- The active Korean default CSV still matches its checkpoint SHA-256:
  `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`.
- Official Korean manual terminology was not independently searchable in
  this environment; do not treat the name questions above as settled.

## Batch Status

IDs 9000-9049 received one preliminary reading. Findings are candidates and
open questions only; they are not confirmed review dispositions and do not
authorize edits.
