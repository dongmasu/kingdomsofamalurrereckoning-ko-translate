# Preliminary Language Scan: `default` IDs 34501-34550

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 34501-34550 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 34501 | `워스워른` / `맹세의 검(Oathblade)` | Standardize Warsworn and determine whether Oathblade is a formal rank/title or role; preserve that the speaker has been both since before the addressee was born. | Korean preserves the age comparison but translates Oathblade literally. Japanese reads it as a first-rate mercenary; Chinese uses the oathblade title. Historical notes explicitly flag Oathblade status. | High |
| 34502 | `+1 힘 계열 능력` | Preserve the +1 bonus and standardize Might Ability terminology. | Korean retains +1 and Might abilities. Japanese/Chinese use equivalent ability labels; no value discrepancy is present. | Low |
| 34504 | Chakram power-drain / deeper piercing | Preserve that striking a target borrows some of its power and may pierce more deeply/effectively than normal; standardize Chakram and combat-effect wording. | Korean retains the power transfer and enhanced penetration. English's `may` is conditional; Korean's `수 있다` preserves that possibility. Japanese/Chinese similarly describe deeper piercing. | Low |
| 34505 | `법무관들이 들고일어난` for `the Praetorians are up in arms` | Standardize Praetorians as the named group (not generic legal magistrates) and preserve that they are protesting/up in arms about the laborers; retain the unsolicited-subjects joke. | Korean renders Praetorians as `법무관`, which ordinarily means legal officials/magistrates. English capitalization and Japanese/Chinese use a military guard/imperial guard term. The historical log explicitly flags the Praetorians/labor dispute. | High |
| 34509 | `스칼드` / `혼돈 무기` | Standardize Skald and Chaos Weapon terminology; preserve the speaker's claim that Skald has answers about both the recovered weapon and “our powers.” | Korean retains both topics and the pronoun relation. The proper-name spelling varies across locales; historical notes list Skald/Chaos Weapon terms. | Medium |
| 34512 | `대사냥꾼 하트웬` | Standardize the title Great Huntress and Hartwen; preserve that she should lead and the speaker fears angering her because of her particular nature. | Korean retains the leadership suggestion and concern. Japanese/Chinese similarly describe her as particular/demanding. The title/name need corpus consistency. | Medium |
| 34513 | `{LINE_LEFT}`, `{*2...}` Health/Fate Energy/Mana markers | Preserve all wrapper tokens, identities, order, and section boundaries; separately decide whether each localized payload is approved and standardize Health/Fate Energy terminology. | Korean preserves the sequence of `{LINE_LEFT}`, each section marker, and `{LINE_SPACE}` separators. Marker payloads are localized (`체력`, `운명 에너지`, `마나`) as they are in JA/ZH; wrappers and order match English. Gender-neutral “his or her” is rendered as `캐릭터`. | High |
| 34514 | `그들도 그렇게 할 기회를 얻는 게 공평` | Preserve the speaker's reasoning that having become a respectable merchant, it is only fair for “them” to do the same; avoid adding a distinct opportunity not stated in the source. | Korean adds `기회를 얻는` (“get the opportunity”), while English says only that it is fair they do the same. The overall idea is retained but agency/opportunity may be softened. | Medium |
| 34518 | 37 years / pilgrims / Rathir / Bayala Tirin | Preserve the 37-year chronology, the pilgrims' settlement and naming of Rathir, Bayala Tirin's death, and the memorial first tree; standardize spire-rock and the High Priestess title. | Korean retains the chronology and memorial purpose. “Fate cut ... free from the world of the living” is rendered as Fate taking her from the living, an acceptable euphemistic reading. The historical log flags the Rathir memorial tree. | Medium |
| 34519 | `{*6{1}}` / `{*6{2}}` | Preserve both nested variables and their exact order; standardize the item-crafting terminology. | Korean retains both nested wrappers in source order and says the item requires a Core and a second component. Historical notes explicitly require preserving these nested token structures. | Low |
| 34523 | Waterhall Down / Brother Egan / relic | Preserve that two Fae promise Egan magical power for retrieving a relic from the caverns, and that the speaker accompanies him to keep him out of trouble; standardize the place and title. | Korean retains the conditional reward, companion's purpose, and west-of-camp location. Japanese/Chinese use differing generic cave/waterfall readings; English gives the named Waterhall Down. | Medium |
| 34526 | `텔로그러스의 패배 소식` / `교단` for `the Order` | Preserve that news of Telogrus' defeat must go immediately to the Order, which is expecting the speakers; standardize the organization/name. | Korean retains urgency and destination but translates the capitalized Order generically as a religious order. Japanese/Chinese likewise use a group/sect reading; the institutional identity remains open. | Medium |
| 34529 | `결계 해제에 한 번 실패해도 폭발하지 않습니다` | Clarify the failure limit and consequence: one dispel failure is allowed before the ward explodes; state what happens on a subsequent failure without implying unlimited safe attempts. | English says one failure is possible “before it will explode.” Korean says one failure does not cause an explosion but does not state that another failure triggers it. Chinese makes the second-failure consequence explicit; Japanese gives only the one-failure allowance. The historical audit specifically asks for the actual effect/limit. | High |
| 34530 | `시신을 둘 곳조차 바닥나기 시작했어` | Preserve the siege's duration and the grim shortage of places to put bodies; retain the understated voice. | Korean conveys the city is running out of space for bodies. Japanese/Chinese agree; no material omission is apparent. | Low |
| 34540 | `결국 난 그녀를 행복하게 해 주지 못했어` | Preserve the speaker's regret and uncertainty about whether the woman left from fear or chose to stay behind; do not resolve her fate beyond the source. | Korean retains both questions and the speaker's feeling of inevitability and failure. English says “couldn't make her happy”; Korean uses direct causation, consistent with Japanese. | Medium |
| 34544 | `분노한 여름 페이 동족` | Preserve that the enraged Summer Fae attack anyone, friend or foe; standardize Summer Fae and the combat warning. | Korean retains indiscriminate attacks. Japanese/Chinese agree. Historical notes include the enraged Summer Fae as a faction/creature terminology item. | Medium |
| 34546 | `우리 군대가 저지른 가장 큰 실패자가 낡은 유물을 되찾았다는 이유로` | Clarify that “our army's greatest failure” is a person/undertaking described as a failure, not the army committing a failure; preserve the speaker's incredulous objection to committing the whole city to saving her. | Korean's `우리 군대가 저지른 가장 큰 실패자` can parse as a “failure” the army committed and is syntactically awkward. English is also compressed, but Japanese/Chinese treat it as a failed general/person who recovered an old relic. Historical notes flag this argument/agency. | High |
| 34548 | `지휘권을 넘기겠대` / `발굽에 치인 게으름뱅이들` | Preserve Grim's current control, the possible future transfer of the reins, and the speaker's boastful threat toward the `spur-galled layabouts`; check the insult/wordplay without inventing literal hoof-kicking. | Korean translates “take the reins” as command authority but renders `spur-galled` as “kicked by hooves,” which may alter the image. Japanese/Chinese simply say lazy people; the historical log flags Grim/reins context. | Medium |
| 34549 | `실리 마법사` for `Seelie Sorcerer` | Standardize Seelie as the named Fae court/type rather than an opaque phonetic string; preserve Sorcerer as the role. | Korean transliterates the first element and translates the second. Japanese/Chinese translate or transliterate Seelie differently; the title's worldbuilding sense needs glossary review. | Medium |

IDs 34503, 34506-34508, 34510-34511, 34515-34517, 34520-34522,
34524-34525, 34527-34528, 34531-34539, 34541-34543, 34545, 34547,
34550 generally retain the English meaning on this first reading. Proper
names, lore, voice, and display conventions remain integrated-pass
candidates; no additional distinct wording issue was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry explicitly flags Oathblade (34501),
  Chakram power (34504), Praetorians/laborers (34505), Skald/Chaos Weapon
  (34509), Great Huntress/Hartwen (34512), the Health/Fate Energy/Mana
  tutorial (34513), Rathir's tree (34518), nested variables (34519),
  Waterhall Down (34523), Telogrus/Order (34526), ward failure (34529),
  refugee corpses (34530), Bhaile (34539), Summer Fae (34544), army
  failure (34546), and Grim/reins (34548). These were checked against active
  Korean and all locale references.
- ID 34513 wrapper identities/order match; localized marker payloads are
  recorded as a separate terminology decision. ID 34519 preserves
  `{*6{1}}` then `{*6{2}}`.
- ID 34529's consequence after the allowed failure is underspecified in
  Korean and remains a high-confidence candidate; the CSV is unchanged.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 34501-34550 once
  and in identical order.
- Embedded line-break counts match across all four locales. ID 34513 retains
  its three tutorial sections and separator structure.
- Runtime wrappers and marker order match. ID 34513 localizes payloads
  inside the `{*2...}` markers; ID 34519 preserves both nested structures.
- ID 34502 retains `+1`; no numeric-value discrepancy was detected.
- Active Korean CSV hashes remain at their recorded checkpoint values.
- No CSV text or source file was edited.

## Batch Status

IDs 34501-34550 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 34551.
