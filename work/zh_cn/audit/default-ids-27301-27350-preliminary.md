# Preliminary Language Scan: `default` IDs 27301-27350

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 27301-27350 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 27301-27331, 27333-27350 | Dialogue, lore, quest, and concise UI/item text | Recheck voice, idiom, item labels, and recurring names during integrated review. | Korean generally retains English meaning and Japanese tone. The material counts at 27301, bow modifiers at 27315, and physical-damage/mana values at 27331 match all locales. | Medium |
| 27302-27303, 27308, 27311, 27313-27317, 27324-27328, 27333-27337, 27339, 27341-27344, 27347 | Summer/Winter Fae, Gadflow, Atteia, Tenhwa, Helius, Erathell, Lorca, Carasta Arawyn, Ashmoor, House of Pride, Seawine, House Anwon, Mace Darkken, Twayn | Standardize recurring names, factions, place/role terms, and the historical entries already flagged for this range. | The source-keyed history groups these names, the Summer Fae garrison, Winter Court rule, Tenhwa, Beril Diara's Helius vigil/vision, Erathell, Ashmoor, House of Pride, Seawine, House Anwon, and Mace Darkken. Keep forms provisional pending glossary review. | Medium |
| 27306 | `Display the Trophies` -> `전리품 전시하기` | Confirm whether `Trophies` is a specific Arena collection/category or generic loot. | Korean translates the label as displayable loot; Japanese says decorate/display heads, Chinese says trophies. English remains primary, but the displayed object may be a game-specific category. | Medium |
| 27327 | glyphs around a dead/prone body / empty space above the head | Preserve the source's distinction between the dead man and the prone man, and verify the spatial description in scene context. | Korean retains the body, blood-drawn glyphs, empty space, and head position. The English repeats “dead man”/“prone man” awkwardly; the historical audit says not to smooth this source structure without context. | Medium |
| 27332 | “Wouldn't I love to move our camp...” -> `옮기고 싶지 않겠어?` | Recheck grammatical subject and rhetorical force; English expresses the speaker's wish, while Korean addresses the listener. | English says the speaker would love to move the camp but cannot. Korean can read as asking whether the addressee would like to move it; Japanese/Chinese more directly express the speaker's wish. | High |
| 27339 | `dustlings` -> `먼지 인간들` | Align the in-world address/species term with the broader glossary. | Korean preserves the contemptuous in-world address, but other rows use related forms such as `먼지 아이` or `필멸자`; keep the cross-corpus form open. | Medium |
| 27347, 27350 | mother's proverb / `User 2` | Preserve the comic warning and retain the QA-looking label pending confirmation of its user-facing status. | The Korean proverb preserves the source's “prepare for the worst” punchline. `User 2` is translated as `사용자 2`; historical review groups it with test/QA labels. | Low |

## Historical Audit Reconciliation

- The source-keyed log groups the names, Summer Fae garrison, Gadflow,
  trophies, Tenhwa, Helius/Er athell, Pteryx/bow values, the dead/prone body
  glyph scene, House of Pride, Seawine, House Anwon, Mace Darkken, the
  mother's proverb, and `User 2`.
- It explicitly describes ID 27327 as internally awkward and asks that its
  source structure be retained pending context review. The combat values at
  27315 and 27331 were checked directly in all four active locale rows.
- These notes are issue inventory, not approved translation decisions.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 27301-27350 exactly
  once and in identical order.
- Actual embedded line-break counts and normalized runtime-token identities
  and order match. ID 27301 has two actual embedded line breaks; 27315 and
  27331 each have one.
- Material counts, bow modifiers, damage, and mana costs match all locales.
  No unexpected Unicode format character was found.
- No structural exception was found. Korean wording and all CSVs were not
  edited.

## Batch Status

IDs 27301-27350 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 27351.
