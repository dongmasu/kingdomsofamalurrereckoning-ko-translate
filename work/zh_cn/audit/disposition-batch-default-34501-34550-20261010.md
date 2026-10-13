# Disposition Batch: `default` IDs 34501-34550

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling the preliminary scan with active Korean,
  immutable English/Japanese/Chinese source rows, historical questions,
  prior decisions, terminology, values, markers, and structure.
- Evidence caution: `work/ja_jp/` contains the same Korean draft and was not
  treated as Japanese evidence. Japanese wording below refers to the
  immutable `src/csv/ja_jp/` source.
- Decisions: four accepted, eight `not an issue`, and eight uncertain.
- CSV changes: IDs 34505, 34514, 34529, and 34546 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 34501 | Warsworn / Oathblade | Uncertain: faction and age relation are retained, but Oathblade may be a formal rank, role, or title; Japanese and Chinese differ. |
| 34502 | `+1 to Might Abilities` | Not an issue: the +1 value and Might ability category are preserved. |
| 34504 | Chakram power drain / deeper piercing | Not an issue: striking transfers some target power and can pierce more deeply; the possibility remains conditional. |
| 34505 | Praetorians protesting about laborers | Accepted: replace `법무관들` with `근위대`. `Praetorians` is a military group here, supported by Japanese's legion-soldier wording and Chinese's Imperial Guards; the old Korean incorrectly names legal officials. The formal Korean faction name remains open. |
| 34509 | Skald / Chaos Weapons / powers | Uncertain: the answer-bearing role and both topics remain, but Skald's canonical name and Chaos Weapon terminology need corpus alignment. |
| 34512 | Great Huntress Hartwen | Uncertain: leadership, her particular disposition, and concern about angering her are retained; title and name forms vary. |
| 34513 | Health / Fate Energy / Mana tutorial markers | Not an issue: all `{LINE_LEFT}`, `{*2...}`, and `{LINE_SPACE}` wrappers and their order remain intact; the gender-neutral character reference is preserved. |
| 34514 | Fairness that former peers do the same | Accepted: remove unsupported `기회를 얻는`; English, Japanese, and Chinese say it is fair for them to do the same, not that they must obtain an opportunity. |
| 34518 | Rathir's founding / Bayala Tirin memorial tree | Uncertain: chronology, naming, death, and memorial purpose are retained, but place/title terminology and lore context remain open. |
| 34519 | Nested `{*6{1}}` / `{*6{2}}` crafting variables | Not an issue: both nested variables remain in source order and the Core/component requirement is preserved. |
| 34523 | Waterhall Down / Brother Egan / relic | Uncertain: conditional reward, companion's protective purpose, and west-of-camp location remain; proper place and title forms need context. |
| 34526 | Telogrus / the Order | Uncertain: urgency and destination are preserved, but the capitalized Order's identity is not established by the row or locale readings. |
| 34529 | Ward dispel failure limit | Accepted: clarify the source-supported threshold as one safe failure followed by explosion on another failure; Chinese explicitly confirms the second-failure consequence. |
| 34530 | Siege and lack of places for bodies | Not an issue: the prolonged siege and shortage of space for bodies are preserved. |
| 34540 | Woman's departure and speaker's failure | Not an issue: both possible explanations for her departure remain questions, and the regret that the speaker could not make her happy is retained. |
| 34544 | Enraged Summer Fae attacking friend and foe | Not an issue: their anger and indiscriminate attacks are preserved. |
| 34546 | `our army's greatest failure` recovering a relic | Accepted: replace the malformed `우리 군대가 저지른 가장 큰 실패자가` with `우리 군대의 가장 큰 실패작이`; this restores a natural subject while preserving the source's insulting reference to the woman and the speaker's objection to committing the city to her rescue. |
| 34548 | Grim / taking the reins / `spur-galled layabouts` | Uncertain: the possible future transfer of control is retained, but the obscure insult is rendered literally as hoof-kicking in Korean and locale sources do not settle its exact image. |
| 34549 | Seelie Sorcerer | Uncertain: role is translated, but Seelie is a named Fae court/type and its established Korean form is unresolved. |
| Remaining ordinary text in IDs 34501-34550 | Dialogue, labels, values, and structure | Not an issue: no additional supported row-local defect was identified in the other 31 IDs. |

## Historical Audit Reconciliation

- Historical notes explicitly flag Oathblade, Praetorians/laborers,
  Skald/Chaos Weapon, Great Huntress/Hartwen, the tutorial and nested
  variables, Rathir's memorial tree, Waterhall Down, Telogrus/Order, ward
  failure, siege corpses, Summer Fae, the army's greatest failure, Grim/reins,
  and Seelie Sorcerer. These were checked against the immutable locale rows
  and prior decisions.
- The Oathblade and Praetorian terminology remains unresolved; this batch
  corrects only the clear legal-official mistranslation to a supported
  military-group meaning.
- No historical question by itself authorized broader terminology edits.

## Verification

- All 50 IDs were checked in English, Japanese, Chinese, and active Korean
  source tables in identical key order. The Japanese-derived `work/ja_jp/`
  Korean draft was not treated as independent evidence.
- ID 34513 retains all three tutorial sections and marker order. ID 34519
  retains `{*6{1}}` followed by `{*6{2}}`; ID 34502 retains `+1`.
- Accepted Korean corrections are limited to IDs 34505, 34514, 34529, and
  34546.
- Active default CSV SHA-256:
  `1a60972628f8607a1d24b109b71e866f2f15d967dd3223e567e74b5fde6b18b7`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
  preserved.
- These are working dispositions, not independent final linguistic
  approval.
- Resume at ID 34551; 30,584 default IDs remain through ID 65134.
