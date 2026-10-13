# Disposition Batch: `default` IDs 63201-63250

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, the preliminary scan,
  source-keyed historical questions, terminology, and structure.
- Three accepted targeted corrections, 25 `not an issue` IDs, and 25
  uncertain IDs. Accepted IDs 63203, 63234, and 63235 retain separate
  literary, sibling-term, or game-effect questions. These are working
  dispositions, not independent final linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check.

## Accepted Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18057 | 63203 | `이 언덕 곁의 작은 못보다도 위대하다.` | `이 언덕 곁의 호수보다도 위대하다.` | English says `loch`, not a small pond; remove the unsupported size/category change while retaining the poem's comparison. |
| D-18057 | 63234 | `귀하의 오빠 탁 에드스타는 ...` | `귀하의 형제분인 탁 에드스타께서는 ...` | The English letter identifies a brother but gives no relative age; `오빠` adds that he is older than the female addressee. |
| D-18057 | 63235 | `적이 받는 피해가 50% 감소하고 18초 동안 넘어뜨립니다.` | `적이 주는 피해량을 18초 동안 50% 줄이고 넘어뜨립니다.` | The English and Japanese describe reducing the enemies' outgoing damage, not reducing damage they receive. Keep the 18-second duration on the reduction and leave knockdown duration unstated. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-18058 | 63202 | Peace Edict wording is retained; English says weapons must be controlled, while Japanese reads as a prohibition, so the exact restriction is unresolved. |
| D-18058 | 63203 | The six-line Dara poem is preserved; its compressed opening, lake/loch relation, and imagery need literary review. |
| D-18058 | 63204 | `Hollow of Sinsear` may be a cavern, hollow, or valley; locale readings differ and the site needs lore context. |
| D-18058 | 63206 | Fieriol's Korean phonetic spelling lacks corroborating context. |
| D-18058 | 63208 | The Telling may be a named lore tradition and `reaper` a role/title; canonical terms are unsettled. |
| D-18058 | 63216 | The crates entering and leaving Rathir are retained; Japanese alone specifies wooden crates. |
| D-18058 | 63217 | English identifies Allyn as the woman's deceased husband, then says Allyn prayed; the identity/pronoun conflict remains in the source. Chinese alone has one embedded line break. |
| D-18058 | 63222 | Winter poem and vigil are retained; English opening is ungrammatical and the image/register merits literary review. |
| D-18058 | 63225 | Beckoned may be a formal title/address; Japanese omits it while English and Chinese include it. |
| D-18058 | 63227 | English leaves what is being taken from the people unstated; retain the open object without inferring it. |
| D-18058 | 63229 | `Great House` may be a formal social/faction category; align the Korean form with lore terminology. |
| D-18058 | 63230 | Arba and the historical comparison are retained; the name and precise “greatest since” reference need context. |
| D-18058 | 63231-63232 | Foes' Hearth and House of Sorrows are retained; the former is a place name and the latter a formal House, both requiring glossary alignment. |
| D-18058 | 63234 | The brother's name and death are retained; the letter's exact Korean honorific/register still needs review after removing unsupported age. |
| D-18058 | 63235 | The debuff and knockdown are retained; surrounding ability context should confirm the scope of “enemies' Damage.” |
| D-18058 | 63236 | Korean matches English/Chinese values; Japanese differs at 90% versus 80% and +95% versus +85%. Preserve English pending gameplay verification. |
| D-18058 | 63237 | Caledus's departure and Archsage succession are retained; name form and whether “gone” means departed/absent need context. |
| D-18058 | 63238 | Canneroc Gossamer and delayed shipment are retained; product/material terminology remains provisional. |
| D-18058 | 63243 | Korean correctly retains the bug-count shortfall; Chinese incorrectly substitutes money, so do not import that reading. |
| D-18058 | 63244 | The bandit threat and amulet's value are retained; Korean can ambiguously make `poor` describe “us” rather than the refugees. |
| D-18058 | 63246 | Widow, Summer Fae, Webwood, spiders, and Canneroc are retained; title/name forms and the scene's geography need consistency review. |
| D-18058 | 63248 | Korean conveys bewilderment and lack of expertise; English's deliberately playful “doohickies and thingamabobs” tone and device terminology remain open. |
| D-18058 | 63249 | Wand destruction and cleansing metaphor are retained; the relation between the stain and “those wretches” differs across locale readings. |
| D-18058 | 63250 | Praise and invigorating effect are retained; `writing` versus `work` and the formal/flattering address depend on context. |

## Not an Issue

Decision D-18059 records these 25 IDs: 63201, 63205, 63207, 63209-63215,
63218-63221, 63223-63224, 63226, 63228, 63233, 63239-63242, 63245, and
63247. These rows preserve available meaning, voice, labels, values, and
structure.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 63201-63250 once,
  in identical ascending order.
- Embedded newline counts match except the documented Chinese-only newline
  at ID 63217. The three `{LINE_BULLET}` markers and their order at ID 63236
  match all locales. Japanese alone differs in two numeric values at 63236.
- Rechecked historical questions for Peace Edict, Dara poem, Sinsear hollow,
  Fieriol, Telling/reaper, Allyn identity, Winter poem, Beckoned, Great House,
  Arba, Foes' Hearth/House of Sorrows, Edstar letter, damage effect,
  Caledus, Canneroc Gossamer, bug count, refugees, Widow/Garaner,
  Arrivus Engine, and Aurela.
- Pre-edit CSV SHA-256:
  `c339d774e0297f1a5ad75bef2743ac6e7189abc1e559d3e76cc63306d3acf9bc`.
  Post-edit SHA-256:
  `22faef0c11927e4da293b3edf3ad588bc6f943f13a800f37ba38d346b1653c5a`.
  Byte-level verification against the batch-start backup confirmed that only
  the `Texto` fields at IDs 63203, 63234, and 63235 changed. The UTF-8 BOM,
  record count, key order, poem lineation, runtime markers, and outer record
  separators are preserved. Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-63201/locatexts_zh_cn.koalocatext_default.csv`.
- D-18057 records three accepted corrections, D-18058 records 25 uncertain
  findings (three overlap accepted IDs), and D-18059 records 25
  `not an issue` IDs. Corrected direct register totals: 1,809 accepted,
  15,888 `not an issue`, and 12,353 uncertain (30,050 dispositions total); next
  D-18060.

Resume at `default` ID 63251; 1,884 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.
