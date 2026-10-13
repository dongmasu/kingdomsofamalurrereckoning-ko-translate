# Preliminary Language Scan: `default` IDs 59251-59300

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 59251-59300 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 59251 | Brother Fallon / prayer beads / Mission | Preserve that Brother Fallon failed to make it through the woods and return his prayer beads to the religious Mission when able. | All locales retain the failed journey, regret, and return request. Korean uses the religious-sounding `선교소`; the institution's formal name remains provisional. | Medium |
| 59253 | Crystal War / Ysa / seasons | Preserve the speaker's certainty that the Crystal War will not reach Ysa and the seasonal-rebirth image. | All four retain the assurance and change/rebirth metaphor. Korean uses the plural `계절은 모두 바뀌고`, a plausible reading of “all seasons change”; tone remains prophetic. | Medium |
| 59260 | mounted trophies / champion in the ballad / Lekka | Preserve that the trophies should be mounted/displayed as in the ballad so Lekka will appear; verify which trophy set is meant. | English says “mount the trophies,” Japanese says to display heads, and Chinese says to take trophies. Korean says to hang trophies, a reasonable mounting sense. The exact items remain open per the historical audit. | Medium |
| 59269 | Font / `샘` | Align the named Font with the project's established term and preserve the approach/light/closer sequence. | English capitalizes Font; Japanese identifies Ysa's Font and Chinese uses a sacred-font term, while Korean uses generic `샘`. The instructions and imperatives are otherwise retained. | Medium |
| 59271 | Chalice of Forced Vintage / `강제 숙성의 성배` | Confirm whether “Forced Vintage” is a named item and whether “vintage” means wine aging or a specific magical effect. | English capitalizes the title; Japanese reads it as a wine-making chalice, Chinese as forced brewing, and Korean as forced aging. The item identity/effect remains unresolved. | Medium |
| 59282 | affectionate `dove` / pounds joke / `몇십 킬로` | Preserve the affectionate bird address and the exaggerated weight-loss joke, while converting units accurately only if localization policy permits. | English says “a few dozen pounds”; Korean converts this to `몇십 킬로`, which can substantially increase the implied weight, and omits the bird/endearment image in favor of `그대여`. The historical prompt specifically flags both details. | High |
| 59285 | The Chariot / `전차` / Travelers | Determine whether “the Chariot” is a formal Fate card/title and preserve the claim that it left a lasting mark on the Travelers. | English capitalizes the Chariot; Japanese uses a named epithet, Chinese transliterates it, and Korean says `전차` without title marking. The positive/negative legacy clause is retained. | Medium |
| 59287 | House of Sorrows / `슬픔의 가문` | Align the faction name with its other active Korean rendering and preserve the locked entrance, struggle signs, and Proving Halls route. | Korean uses `슬픔의 가문`, while ID 58966 uses `비탄의 가문` for the same House of Sorrows. English, Japanese, and Chinese retain the entry clues and required halls. This is a terminology-consistency candidate. | High |
| 59289 | Gallows End / `교수대 끝` | Check this literal form against the many existing phonetic and translated variants; do not normalize before the terminology decision. | The English is a place name; Japanese transliterates it, Chinese translates the image, and Korean uses a literal translation. The project's audit already records corpus-wide Gallows End inconsistency. | High |
| 59293 | family arms / `가문의 무기` / Dolve Arne | Verify that “arms” means the family's inherited weapon(s) here, and preserve the speaker's bad-luck complaint. | Japanese and Chinese explicitly interpret the phrase as a family weapon; Korean uses singular/plural-neutral `무기`. It retains the summons and burial-location detail. | Medium |
| 59294 | Blacksmithing Skill / Repair Kits | Align the skill and item UI terms, preserving the causal relation that the skill improves kit effectiveness for field repairs. | All locales retain the improved repair-kit effect and field use. Korean's `대장장이 기술` and `수리 도구` are clear but may differ from established game UI terminology. | Medium |
| 59295 | Quarterlings / `쿼털링` | Identify whether this is a people, rank, or other setting term before choosing a Korean form. | English capitalizes the term and Japanese/Chinese leave it untranslated. Korean transliterates it; the historical audit explicitly leaves its identity open. | Medium |
| 59299 | The Oratory / `기도실` | Preserve the question asking where the named location is, and keep it consistent with the Korean location rendering at 59225. | English asks “Where is the Oratory?” and Japanese/Korean treat it as a prayer place; Chinese interprets it as public speaking. Korean correctly retains a location question. | High |
| 59300 | “Your energy will not be spent in vain” / `네 수고가 헛되지 않게` | Preserve the promise of fair payment and the warning that the path will be long and grief-filled. | All locales retain compensation and hardship. Korean renders energy as effort (`수고`), a natural contextual interpretation. | Medium |

Other reviewed rows generally preserve first-read English meaning and
Japanese voice/register. Provisional names and terms include Brother Fallon,
the Mission, Ysa, Beckoned, Big Hunt, Lekka, Lykeios, Commodore Garrick,
Greatswords, Shrine of Air, Font, Iluvia, the Great Cycle, Firstsworn,
King Wencen, Red Legion, the Chariot, House of Sorrows, Proving Halls,
Tilera, Alfar, Dolve Arne, Blacksmithing, Quarterlings, Culminite, and
the Oratory.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `59250-59349`.
  Applicable prompts include Brother Fallon/prayer beads/Mission (59251),
  Crystal War/Ysa (59253), Beckoned (59255), trophies/Lekka (59260),
  Commodore Garrick (59263), Shrine of Air (59266), Font (59269), Chalice
  of Forced Vintage (59271), Firstsworn (59273), the affectionate `dove`
  and pounds joke (59282), the Chariot (59285), House of Sorrows/Proving
  Halls (59287), Tilera/Alfar (59288), family arms/Dolve Arne (59293),
  Blacksmithing (59294), Quarterlings (59295), Culminite (59296), and the
  Oratory (59299). These remain open prompts, not accepted corrections.
- Checked the repeated House of Sorrows name at 58966 and the Oratory
  question at 59225; both support logging consistency rather than deciding
  terminology during this preliminary pass.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 59251-59300 once
  and in identical ascending order. All four full `default` files contain
  65,135 records with matching key order.
- Embedded newline counts match throughout the batch. Runtime markers and
  numeric values are preserved; the unit wording at 59282 is a meaning/
  magnitude concern, not a structural token issue.
- Active Korean CSV SHA-256 values remain at the recorded checkpoint:
  - `base`: `c6adbf220bd66bab7ef61274886ea6a47427b58dc971f9e9703d4fd089b946a6`
  - `affix`: `7697d7d09933ca7f7f8f6e41cd82bb5f29e4b092368a8c62f1dc21b9`
  - `default`: `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`
- No translation CSV edit was made.

## Batch Status

IDs 59251-59300 received a preliminary reading and a working disposition.
The two accepted corrections and remaining findings are recorded in
`disposition-batch-default-59251-59300-20261011.md`; these are not
independent final linguistic approval. Continue at `default` ID 59301.
