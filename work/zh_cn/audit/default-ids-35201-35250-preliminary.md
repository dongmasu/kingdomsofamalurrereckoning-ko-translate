# Preliminary Language Scan: `default` IDs 35201-35250

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 35201-35250 inclusive.
- Compared English meaning, Japanese register, Chinese supporting
  evidence, active Korean, and the historical source-keyed questions.
- Read-only preliminary candidates; no independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 35206 | `앞으로 200마일 동안 마지막 마을` | Check whether the village is the last one for the next 200 miles, and retain the past/present contrast. | Korean follows one possible direction of English's `last village for two hundred miles`. Chinese reads a 200-mile area, Japanese explicitly says ahead. The distant-village context is not settled by this line. | Low |
| 35210 | `파라글렌의 보석`, `마녀 기사 아니라`, `캔레인` | Standardize Farraglen's Gem, Witchknight Anira and Cann-Rane; confirm the socketed special-weapon objective. | Korean preserves the acquisition, socketing and intended defeat; names and game equipment terms need consistent treatment elsewhere. | Medium |
| 35213 | `그레이홀의 꿈` for `Dream of Gravehal` | Verify Gravehal spelling against other uses. | English and Japanese refer to the same named place; Korean `그레이홀` differs from the elsewhere recorded `그레이브홀` form. | Medium |
| 35216 | `보가트 성게` for `Boggart Urchins` | Confirm the creature category and whether `Urchin` is a species/sea-urchin label, then standardize Frostbreak Sea and Alfar names. | English specifies a separate species native to the sea; Japanese calls it distinct from the playful land beasties, Chinese treats it as a spherical Boggart. Korean preserves the distinction. | Medium |
| 35218 | `권능께서` for `the Authority` | Decide whether Authority denotes a deity, institution, or divine attribute in this blessing. | Japanese substitutes Creator and Chinese uses divine power; Korean personifies Authority as an honorific addressee. The proper theological referent is not determined by the sentence alone. | Medium |
| 35219 | `정해진 자와의 만남` | Check `Preordained` as title/person versus adjective before approving this encounter/quest title. | English's `A Preordained Encounter` is ambiguous; Japanese reads a predestined meeting, Chinese reads a meeting with a chosen person. Korean chooses the latter. | Medium |
| 35220-35221 | `아우구르`, `갈레눈 헤젬` | Confirm whether Augur is a person or rank, and standardize Galenun Hegem with ID 35127; retain the memoir-chapter relationship. | Japanese reads Augur as a seer while Chinese transliterates a name. English 35221 has the typo `memoris`; Korean conveys the intended memoirs without copying the typo. | Medium |
| 35229, 35233 | `퀘이크` and `전투 격노` ability labels | Confirm the official Korean ability and resistance names; retain damage 32-54 per hit / 15 Mana and +4% during Battle Frenzy. | The Korean preserves the source's numerical values, line break at 35229, and effect scope. | Low |
| 35230, 35234 | `플레지실드`, `끈` (`Strings`) | Resolve Pledgeshield rank/address and the context of the isolated `Strings` item/UI label. | Japanese drops the Pledgeshield address at 35230, while English and Korean retain it; Japanese/Chinese interpret `Strings` differently. | Medium |
| 35239 | `희망이 넘치는 곳`, `'그것'` | Check whether `place of promise` is figurative or names a specific place, and identify the divine spirit and the quoted object `it`. | Korean preserves the seven lines, Lyria, the two-day/whole-life contrast and the mentors' gratitude. English has an opening and terminal single quote around the entire passage; Korean has neither outer quote but preserves the inner quotation. Keep this formatting divergence visible. | Medium |
| 35240, 35245 | `세이그렐`, `블러디` | Confirm the ballad's rescue role and the character's name (Bloody/Bloody Bones) across entries. | English says the usual Sagrell is absent; Korean keeps the player's replacement role. English 35245 uses the short `Bloody` name. | Medium |
| 35249 | `동족 사이에서는 거의 하나의 기관처럼 여겨질 정도지` | Reassess the literal `institution`: the speaker likely boasts of being a fixture or widely recognized among their people, not a physical agency. | English calls an accomplished mason `an institution amongst my people`; Japanese paraphrases that everyone knows their name, whereas Korean and Chinese render `institution` literally. Mark as a meaning/naturalness candidate, not a decided replacement. | High |

IDs 35201-35205, 35207-35209, 35211-35212, 35214-35215, 35217,
35222-35228, 35231-35232, 35235-35238, 35241-35244, 35246-35248,
and 35250 generally preserve English meaning on this first reading. The
meta-translation joke at 35207 and the farewell at 35250 remain voice
questions for an integrated pass.

## Historical Audit Reconciliation

- The source-keyed historical IDs 35200-35399 entry raises the Nina/food
  line, 200-mile village, translation joke, Oleander's past, Farraglen's
  Gem, Boggart Urchins, Authority, Augur, Galenun, Quake values, the
  Pledgeshield address, Strings, the quoted reminiscence, Sagrell/Bloody,
  Quay, and the mason's `institution` idiom. These were checked against
  the active Korean and all three reference locales.
- The historical log notes `memoris` at 35221; it is an English typo,
  not an instruction to introduce a Korean typo.

## Other Checks

- Four locale files each contain exactly IDs 35201-35250 once in the
  same order. All embedded line-break counts match: one at 35229 and
  six at 35239.
- No runtime variable tokens occur in this range. The values 200 miles,
  32-54 damage, 15 Mana and +4% resistance are retained.
- ID 35239 differs in outer quotation marks: English starts and ends with
  `'`, Japanese/Chinese use their own opening/closing quotation conventions,
  and Korean has no outer quotation. This is a formatting question, not a
  line-break mismatch.
- Active Korean `default` CSV SHA-256 remains
  `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`.
- No CSV or immutable source file was edited.

## Batch Status

IDs 35201-35250 received one preliminary reading. Continue at `default`
ID 35251; all findings remain open for independent review.
