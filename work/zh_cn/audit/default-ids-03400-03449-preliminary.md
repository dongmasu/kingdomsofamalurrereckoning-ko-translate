# Preliminary Language Scan: `default` IDs 3400-3449

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 3400-3449.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled source-keyed historical questions and checked proper names,
  player titles, long text, UI labels, and parsed CSV quoting.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 3402 | ... `{*1Special Deliveries}` 상자 ... | Localize `Special Deliveries` inside the indexed markup span consistently with the Korean rendering already used elsewhere; preserve the `{*1...}` token and product-title spans. | English/Japanese/Chinese treat `Special Deliveries` as a chest label and localize it in the supporting references. Korean leaves it in English, unlike the corresponding earlier promotional row. | High |
| 3406 | 과부다. 저 여자가 그들을 이끌고 있어. | Align `The Widow` with the proper-name rendering used in the related Webwood/lore rows (for example, `위도우`), unless this is intentionally generic. | English capitalizes the enemy/title; Japanese transliterates it and Chinese says “widow.” Korean uses the generic `과부`, while ID 3166 uses `위도우(The Widow)`. This repeats the historical question. | Medium |
| 3411 | '신의 폭풍(God Storm)'? 둘스턴(Dulstan)의 사색 | Confirm whether `God Storm` is a named event/title or a literal question, and whether `Musings` means reflections/meditations; retain the title's punctuation. | English gives `God Storm? The Musings of Dulstan`; Japanese/Chinese treat it as a titled work. Korean is plausible but leaves the compound's proper-name status unresolved. This repeats the historical question. | Medium |
| 3420 | ... 모든 근심을 변화의 바다에 맡기며 ... 마지막 문장 ... 너 자신의 최후도 마찬가지다. | Preserve the doctrine's named terms and three-item structure; retain the apparent source grammar error as meaning rather than reproducing it literally. | English contains “the your own demise” in its last item. Korean normalizes the intended meaning and preserves the contrast between others' deaths and one's own. The paragraph and numbered list remain intact. This repeats the historical question. | Medium |
| 3425 | [long Dvergan keep/library passage] | Keep the three-paragraph travelogue and verify the people-name variants `Dverga`/`Dvergan`, `Erathi`, and the architectural terms in context. | English uses both Dverga and Dvergan and describes the keep, louvered windows, Erathi texts, and shipwreck-derived collection. Korean preserves the three-paragraph structure and most specific details; the historical people/text terminology remains open. This repeats the historical question. | Medium |
| 3426 | ... 각 분야에서 그와 맞먹는 이는 드물지만 ... | Keep the second-person address in `Few are your equal`; replace the unexplained masculine third-person `그와` with a direct reference such as `당신과` or a subject-omitted construction. | English addresses the player as “you” throughout the description. Korean changes to `그와` (“equal to him”), shifting to a third-person male referent and sounding inconsistent in direct address. This repeats the historical question. | High |
| 3427 | 여행자들(The Travelers) | Confirm whether this is the named Travelers faction and use the same Korean form as other faction references (e.g. `트래블러스(Travelers)`). | English capitalizes the faction name; Japanese transliterates it, while Chinese uses the common noun. Korean uses a generic translated plural despite the proper-name context. This repeats the historical question. | Medium |
| 3446 | ... `\"원하는 사람이 되려고 노력해. ... 없어.\"` | Verify quote rendering and remove literal backslashes only if confirmed to be unintended; preserve the nested quotation and punctuation. | The parsed Korean CSV value contains literal `\"` sequences, while English/Japanese encode quote marks with standard CSV quote doubling and parse without backslashes. As at ID 3381, the game may display stray backslashes. | High |
| 3447 | ... 비탄의 페이(Fae of Sorrows)가 있어. ... 재주를 좀 더 발휘하길 바라. | Confirm whether `Fae of Sorrows` is a formal faction/creature label and whether `finesse` intentionally echoes the Finesse ability/attribute. | English, Japanese, and Chinese retain the “Sorrows” identity and the finesse wordplay. Korean preserves both in transliteration/official-stat vocabulary, but the faction relation remains open. This repeats the historical question. | Medium |
| 3448 | 정찰병들은 그들을 찾아내지 못했지만 ... | Preserve inability rather than a completed past failure, e.g. `찾아내지 못하는데`; retain the contrast that the Hero of Mel Senshir may succeed. | English says scouts “can't track them down,” Japanese says they cannot find them, and Chinese also describes inability. Korean changes this to past `찾아내지 못했지만`, implying an already completed attempt. | Medium |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 3406, 3411, 3414,
  3420, 3425-3427, 3436, and 3447 against active Korean and source rows.
- The historical `base` question for `Tenhwa's library` at ID 3445 is
  separate from this `default` Walen/Rathir/Mel Senshir sentence and was not
  merged into this report.
- IDs 3420 and 3425 retain their numbered-list/paragraph structure. No
  historical disposition was treated as approval.

## Other Checks

- ID 3410 preserves the approaching army and the Soulbind Curse threat.
- ID 3438 retains `{1}` and its percentage relationship; ID 3444 retains the
  10% lifesteal value and all-attacks scope.
- No structural changes were made.

## Batch Status

IDs 3400-3449 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
