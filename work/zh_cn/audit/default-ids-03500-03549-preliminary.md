# Preliminary Language Scan: `default` IDs 3500-3549

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 3500-3549.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled source-keyed historical questions and checked gameplay labels,
  lore terms, proper names, and source contradictions.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 3502 | `{*1[Active]}` | Localize the bracketed ability type consistently with Japanese/Chinese while preserving `{*1...}`. Confirm whether the game's Korean UI uses `액티브`, `능동`, or another established label. | English and Korean both retain `[Active]`, while Japanese/Chinese localize the category. The ability description is translated, leaving only the indexed category label in English. | High |
| 3507 | 도시가 들어 올려질 때 우리는 헤어졌어. ... 워런(The Warren)의 채석장 ... | Confirm that `raised` refers to the city's magical elevation/lifting and determine whether `the Warren` is a proper place name or a generic quarry district. | English/Japanese describe the city being raised; Chinese interprets it as the city being founded. Korean follows the elevation reading and retains the place name, matching the lore-sensitive question. This repeats the historical question. | Medium |
| 3515 | 마녀 기사 아니라(Anira) | Verify the canonical pronunciation and name form for Anira; the Korean spelling `아니라` is visually/aurally identical to the common grammar word meaning “not.” | English, Japanese, and Chinese identify a named Witch Knight. Korean's transliteration can be misread as ordinary Korean syntax even though the Latin spelling disambiguates it. The rank/class term also remains provisional. This repeats the historical question. | Medium |
| 3520 | ... 달인의 자물쇠따개 ... | Confirm whether `Master's Pick` is a named quest item and add a consistent English parenthetical/name marker if required; retain the Hierophant's request and the item-location chain. | English capitalizes the lockpick's name, Japanese transliterates the title, and Chinese calls it a master key. Korean translates it descriptively without the proper-name form. This repeats the historical question. | Medium |
| 3522 | ... 이제 예언자들도 다시 마땅한 존경을 받게 되겠지. | Confirm whether capitalized `Oracles` is a formal order/group rather than generic seers; align its Korean name and capitalization. | English capitalizes Oracles, Japanese and Chinese translate them as prophets/oracle-givers, and Korean uses generic `예언자들`. This repeats the historical question. | Medium |
| 3535 | 복수(Vengeance)에서 볼 수 있을까? | Identify whether `Vengeance` is an arena, event, venue, faction, or other named destination before deciding whether to translate or retain it. | English capitalizes the term but does not identify the referent. Chinese reads it as the House of Vengeance, while Japanese/Korean leave the location vague. This repeats the historical question. | Medium |
| 3540 | 카마잔두(Khamazandu)의 왕관을 파괴해 그것을 고대의 감옥으로 되돌려 보냈다. | Preserve the unresolved source contradiction and identify whether `it` refers to the Crown, Khamazandu, or another entity; do not silently repair the source. | English says the Crown was destroyed and also forced back into its ancient prison. Japanese/Chinese preserve the return-to-prison idea without resolving the contradiction. Korean mirrors both actions, leaving the referent unclear. This repeats the historical question. | Medium |
| 3546 | 한때 페이의 '기도'에서 흔히 쓰였지만, 지금은 그 용도를 아는 이가 거의 없다. | Identify the omitted subject/object and whether `Fae "prayer"` is a ritual, practice, or quoted in-world term; preserve the source fragment until context is available. | English is a fragment about an unspecified thing once common in Fae prayer. Japanese/Chinese also leave the referent implicit. Korean preserves the fragment and quote marks, but the use cannot be understood without context. This repeats the historical question. | Medium |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 3507, 3515, 3520-3522,
  3527, 3535, 3538, 3540, and 3546 against active Korean and source rows.
- Same-numbered historical questions for `Master Merchant's Command` (3500),
  `Demo Village` (3507), `High Stone` (3521), and `Nai'mee'an Cowl` (3538)
  are separate resource entries and were not merged into these `default`
  findings.
- ID 3505 retains the `#NAMED_ICON_MOUSE_BUTTON_1#` token and glyph/reseal
  instruction sequence; no token was edited.
- No historical disposition was treated as approval.

## Other Checks

- ID 3508 retains controller index `{1}`; ID 3479's damage, duration,
  knockdown, and Mana values were outside this range and not re-evaluated.
- ID 3530 preserves the nighttime march, dawn attack, and retreat to the sea.
  ID 3533 preserves the refugee effort, ten-year occupation period, and
  sacrifice bringing return closer.
- No structural changes were made.

## Batch Status

IDs 3500-3549 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
