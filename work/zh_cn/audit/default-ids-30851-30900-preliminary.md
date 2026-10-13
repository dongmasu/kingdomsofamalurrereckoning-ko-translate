# Preliminary Language Scan: `default` IDs 30851-30900

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 30851-30900 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 30851 | `히페리안` for `Hyperian` | Standardize the people/race name against active Korean forms such as `하이페리언`. | The isolated label uses a different phonetic form from recurring corpus spellings. Historical notes list Hyperian as a recurring proper-name question. | Medium |
| 30852 | `크로싱의 수호자` for `Keepers of the Crossing` | Confirm whether Keepers of the Crossing is a formal order/title and distinguish it from generic guards of a passage. | The English capitalizes both group terms. Korean preserves the Crossing as a named place but uses the generic `수호자`; other locales also vary between a named Crossing and a generic gateway. | Medium |
| 30859 | `마법물품 제작` for `sagecrafting` | Standardize the named discipline/skill against the active `Sagecraft`/`Sagecrafting` terminology. | Korean translates the craft descriptively, while the active corpus uses this form alongside other Sagecraft renderings. The items are explicitly described as made for Donnel's study. | Medium |
| 30862 | `성 오드윅 선교원` for `St. Odwig's Mission` | Determine whether Mission is a named place, religious institution, or task and use a consistent Korean form. | Japanese says monastery; Chinese says mission/task; Korean uses mission house. Other active rows refer to St. Odwig as a place and separately to its mission and lodging. | Medium |
| 30864 | `개자식` for `Cur` | Confirm whether this is a generic canine insult or a named creature/role, and preserve the source's animal-insult force. | English is the bare insult `Cur`; Japanese transliterates it and Chinese interprets it as a vicious dog. Korean uses a general human insult (“bastard”). The historical audit explicitly asks for the official form. | Medium |
| 30865 | Three Adessa contacts and their roles | Preserve all three names, affiliations, and titles; confirm canonical Korean terms for Hospitalis Quarters and Domus Politica. | Korean retains the list and each person's function: Reddle Mane leads humans/Alfar in the Hospitalis Quarters, Courdan Passant is chief scrivener, and Feride Ouet is from the laboratories. The exact institutional titles remain open. | Medium |
| 30869 | `트렐리스 위 이곳의 안식처` for `the Sanctuary here on the Trellis` | Confirm whether Trellis is a named platform/location and Sanctuary a formal site; preserve that it has wilted and closed after the loss. | English capitalizes Sanctuary and Trellis. Korean preserves the closure and loss but the syntax may make “on the Trellis” sound spatially literal. | Medium |
| 30870 | `부름받은 자여` for `Beckoned` | Standardize the formal title against active variants such as `간택받은 자` and `초대받은 자`. | This is a direct form of address using the capitalized title. The same term has multiple Korean forms in the active draft. | High |
| 30873 | `네게 그런 복종이 필요하겠어` for `I will have need of such obedience` | Keep the speaker as the one who needs obedience from the addressee; check the subordinate clause's register and target. | English has first-person `I ... need`. Korean `네게 ... 필요하겠어` can read as “you need such obedience,” shifting the person who needs it. Historical notes flag the sentence's obedience/threat sense. | High |
| 30878 | `자루` for `Shaft` | Confirm whether Shaft is a named weapon/crafting component and choose the established component term. | The row is an isolated item/component label; Korean gives a generic handle/shaft sense. Historical notes explicitly ask whether Shaft is a weapon component. | Medium |
| 30879 | `발화 표식` for `Mark of Flame` | Standardize the ability name and preserve all target, damage, and mana values. | Korean retains up to 7 targets, 280 Fire Damage, 40 Burning Damage, 10 mana to mark, and 42 mana to execute. Other locale names for Mark of Flame vary. | High |
| 30890 | `조우 1` for internal-looking `encounter1` | Determine whether this is a debug/test identifier or player-facing encounter label; preserve its intended UI status. | The source is a compact English identifier; other locales render it as a localized encounter label. Historical notes flag it as an encounter/debug label. | Medium |
| 30891 | `전하` for `your grace`; `비아토르` for `the Viator` | Confirm the addressee's court honorific and whether Viator is a formal office/title or proper name. | Korean uses the conventional royal honorific and transliterates Viator. Historical notes list Viator as a title/name question. | Medium |
| 30893 | `오만은 몰락을 부른다` for `Pride Before A Fall` | Confirm whether this is an established proverb/title and preserve the intended warning rather than an event description. | Korean adapts the English idiom into a natural maxim. Japanese says “last pride,” while Chinese is closer to the English fall-before-defeat image. | Low |
| 30899 | `신탁자` for `the Oracle` | Determine whether Oracle is a person, office, or prophecy source and standardize the Korean title against forms such as `예언자`. | This is a quest objective to return to a named/known Oracle. Korean uses `신탁자`; the corpus has multiple oracle/prophet renderings. | Medium |

Rows 30853-30858, 30860-30861, 30863, 30866-30868, 30871-30872,
30874-30877, 30880-30888, 30889, 30892, 30894-30898 generally retain the
English meaning on this first reading. Their names, register, fragments,
lore terms, and surrounding quest context remain for the integrated pass; no
separate high-confidence wording candidate was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 30800-30899 was checked against
  this batch, including Hyperian, Crossing Keepers, St. Odwig's Mission,
  Cur, the Adessa contacts, the Wending, Sanctuary/Trellis, Viator, Oracle,
  and save-data UI.
- The narrower historical questions at 30852, 30856, 30862-30865,
  30867, 30869, 30873, 30878-30879, 30884, and 30890-30895 were reviewed.
  ID 30856's “more good / more death” contrast, ID 30862's Mission,
  ID 30873's obedience, Shaft, Mark of Flame, ordination tome, debug label,
  Viator, and pride idiom remain open contextual candidates.
- ID 30879 preserves the three-line effect/cost layout and values: up to 7
  targets; 280 Fire Damage; 40 Burning Damage; 10 mana to mark; 42 mana to
  execute.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 30851-30900 once,
  in identical order.
- Embedded line-break counts and normalized runtime-token identities/order
  match. No runtime marker or variable was found to be missing or reordered.
- Numeric meanings match, including ID 30865's three contacts and ID 30879's
  target/effect/cost values. Some locales use digits where others use words.
- No unexpected Unicode format-character or structural exception was found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 30851-30900 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 30901.
