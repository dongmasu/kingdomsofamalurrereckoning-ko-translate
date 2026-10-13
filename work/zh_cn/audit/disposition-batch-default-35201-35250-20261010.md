# Disposition Batch: `default` IDs 35201-35250

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling the preliminary scan with active Korean,
  immutable English/Japanese/Chinese rows, prior decisions, terminology,
  line breaks, markers, values, and structure.
- Evidence caution: Japanese wording refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- Decisions: three accepted, two `not an issue`, and eight uncertain.
- CSV changes: IDs 35206, 35213, and 35249.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 35206 | “last village for two hundred miles” | Accepted: change `앞으로 200마일 동안 마지막 마을이야` to `앞으로 200마일 안에 있는 마지막 마을이야`. English and Japanese establish a distance ahead, not a duration; the old `동안` wording suggests time. The past-tense contrast in the following sentence is retained. |
| 35210 | Farraglen's Gem / Witchknight Anira / Cann-Rane | Uncertain: acquisition, socketing into a special weapon, intended defeat, and appeasement are retained, but the proper-name spellings and equipment terms need corpus-wide alignment. |
| 35213 | Dream of Gravehal | Accepted: change `그레이홀의 꿈` to `그레이브홀(Gravehal)의 꿈`, matching accepted D-2395's established spelling while retaining the source name explicitly. |
| 35216 | Boggart Urchins / Frostbreak Sea / Alfar | Uncertain: Korean preserves the distinct marine species and playful land Boggarts; the creature label and proper-name forms are not settled for normalization from this row. |
| 35218 | the Authority | Uncertain: Korean's personified `권능` blessing is plausible, but Japanese's Creator and Chinese's divine-authority reading do not establish whether Authority is a deity, entity, or attribute. |
| 35219 | A Preordained Encounter | Uncertain: Korean's “meeting with the chosen one” is possible, but the English title and locale readings do not resolve person/title versus predestined encounter. |
| 35220-35221 | Augur / Galenun Hegem | Uncertain: the speaker and memoir context are retained and the source typo `memoris` is not copied; the canonical name/title spellings remain open. |
| 35229, 35233 | Quake damage and Battle Frenzy resistance | Not an issue: 32-54 Physical Damage per hit, 15 Mana, +4% Physical and Piercing Damage Resistance, and the single line break are retained. |
| 35230, 35234 | Pledgeshield address / `Strings` | Uncertain: the report to Grian and meeting at Helmgard are preserved, but the title's canonical form and the isolated UI/label sense of `Strings` need context. |
| 35239 | Quoted reminiscence / place of promise / `it` | Uncertain: all seven lines, Lyria, the two-day/lifetime contrast, and the inner quotation are retained. English's outer quotation differs from Korean, and the passage's quoted referents and source punctuation do not justify a formatting edit here. |
| 35240, 35245 | Sagrell / Bloody | Uncertain: the rescue role, Wencen, Uduath, and the uncertainty about Bloody's account are retained; the character-name forms and ballad wording need cross-entry context. |
| 35249 | “an institution amongst my people” | Accepted: change `동족 사이에서는 거의 하나의 기관처럼 여겨질 정도지` to `동족 중에선 모르는 이가 없을 정도지`. English uses `institution` figuratively for a well-known fixture, and Japanese explicitly paraphrases that no one among the speaker's people is unfamiliar with their name; the literal Korean incorrectly suggests an organization. |
| Remaining ordinary text in IDs 35201-35250 | Dialogue, labels, names, values, markers, and structure | Not an issue: the other 34 IDs were checked in all four locales; no additional supported row-local defect was identified. |

## Historical Audit Reconciliation

- D-2395 establishes `그레이브홀(Gravehal)` for the same place name;
  ID 35213's `그레이홀` is corrected to that accepted form.
- The prior Authority decisions leave its religious/lore referent open; no
  global terminology choice is made at ID 35218.
- Historical questions for Farraglen's Gem, Boggart Urchins, Augur, Galenun
  Hegem, Pledgeshield, Strings, and the Sagrell/Bloody names remain open.

## Verification

- All four locale files contain IDs 35201-35250 exactly once and in the same
  order. IDs 35229 and 35239 retain one and six embedded line breaks,
  respectively; the Korean stores these as CRLF inside field values.
- The Quake values, Battle Frenzy resistance, and detected runtime-marker
  signatures were checked; no runtime variables occur in this range.
- Only the three authorized Korean `Texto` values changed. CSV keys, row
  order, BOM, and original physical line-ending distribution are preserved.
- These working dispositions are not independent final linguistic approval.
- Resume disposition at ID 35251; 29,884 IDs remain through ID 65134.
