# Preliminary Language Scan: `default` IDs 31351-31400

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 31351-31400 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 31352 | `요툰 룬술사` for `Jottun Runelord` | Confirm the canonical forms for the people/title and align them with other Naros/Jottun references. | English presents a formal compound title; Korean translates both components. Japanese and Chinese use different transliterations and title terms. | Medium |
| 31357 | `앰비언트의 유리` for `Glass of Ambient` | Confirm whether this is an artifact/item name and standardize its Korean form without choosing among the conflicting locale renderings. | English capitalizes the item; Japanese describes a “glass of viewing,” Chinese calls it a mirror, and Korean uses a transliteration plus a literal material noun. | Medium |
| 31359 | `얼음 보석` for `icen gem` | Confirm whether `icen` is a formal gem/material name rather than ordinary “ice”; preserve the sword-in-stone image. | English lowercases the uncommon term; Japanese calls it a gem with cold properties, Chinese says ice gem, and Korean follows the generic ice reading. | Medium |
| 31360 | `방해하지 마라` for `I am not to be distracted, mortal` | Preserve whether the speaker is stating a personal duty/focus or directly ordering the mortal not to interrupt. | English centers the speaker's own distraction; Korean turns this into an imperative to the addressee. Japanese uses a similar imperative, while Chinese describes being unable to be disturbed. | Medium |
| 31362 | `미든을 돌보는 자` for `a Tender of the Midden` | Confirm whether `Tender` is a formal rank/role and `Midden` a named institution/place; standardize both. | English capitalizes the role and place. Korean gives a descriptive caretaker phrase; Japanese preserves Tender as a title, while Chinese translates it as a keeper. | Medium |
| 31364 | `혼돈의 노예 X` for `Chaos Thrall X` | Confirm whether `X` is a Roman-numbered creature tier or an identifier; preserve the source's Roman form until established. | English/Chinese use `X`, while Japanese spells the identifier as ten. Korean preserves the Roman character. | Medium |
| 31368 | `성 하드윈 선교원` for `St. Hadwyn's Mission` | Confirm the institution type and canonical Korean name; do not silently equate Mission with monastery/order. | English says Mission, Japanese says monastery, and Chinese says mission. Korean follows the English institution type. | Medium |
| 31370 | `치유를 구하는 자` / `지정된 나선형 지점` | Verify the Cureseeker ballad title, Lady Oleyn/Brightower names, and what makes the spiral points “chosen”; preserve both reagent-planting actions. | Korean retains the story sequence and the instruction to replant the reagents. The title and place names vary across locales, and “chosen spiral points” lacks context in this row. | Medium |
| 31372 | `얼음 갑옷 [사용 금지]` for `Ice Armor [DO NOT USE]` | Record the warning-delimiter difference; confirm whether this is a developer-facing label and retain the warning without treating it as a runtime token. | The warning text appears in all four locales. English, Chinese, and Korean use square brackets; Japanese uses parentheses around its localized warning. This is a display/annotation-format variation, not a missing runtime marker. | Medium |
| 31375 | Six-line Faehunter gauntlet poem | Preserve all six lines and review the grammar/image in `The instruments of war are readied, light` and `In the grip and machinations`. | Korean retains six source lines, but “light” becomes an adverb meaning “lightly/easily,” and the final two lines add an implied hand/grip construction. The English is compressed and ambiguous; do not silently normalize the poem. | High |
| 31379 | `잡동사니 {1}개 ... 금화 {2}개` | Preserve both variable identities and order, and verify that the counted units refer to sold junk items and gold. | Korean retains `{1}` before `{2}` and attaches each to the corresponding count. The other locale wording localizes spacing differently but not variable identity. | High |
| 31382 | `대사제` for `Hierophant`; `성전 활동` for `his crusade` | Confirm the title and whether Grim Onwig's “crusade” is a literal campaign, religious mission, or named undertaking. | English uses capitalized Hierophant and crusade. Korean translates the rank and renders crusade as an activity; Japanese/Chinese also differ in the degree of religious/military force. | Medium |
| 31386 | `필멸자 시녀?` for `Mortal maid?` | Resolve whether `Maid` is a formal Fae role/title or an ordinary servant/young woman, and preserve the speaker's surprised question. | English capitalizes Maid in a setting where it may be a title. Japanese reads “mortal's daughter,” Chinese “mortal girl,” while Korean selects “maid/handmaid.” | Medium |
| 31387 | `의적 이스` for `the rogue ... Eathe` | Confirm Eathe's name form and whether `rogue` is a class/title or the ordinary “outlaw”; retain that Belen's Testament is the death cult. | English says “rogue,” which does not itself imply a righteous bandit. Korean's `의적` adds a favorable Robin Hood-like judgment. The sentence also names the Red Marches and the cult's cistern. | Medium |
| 31396 | `비애와 순환의 섭리` for `Sorrows, the cycles` | Distinguish the formal `Sorrows` concept/faction from the cycles; preserve capitalization and the Winter Court speaker's doctrinal claim. | English capitalizes Sorrows and appositionally names “the cycles.” Korean renders it as ordinary “sorrow” and combines the terms into a governing principle. Japanese identifies House of Sorrows/the cycle; Chinese is also unclear. All four source lines are preserved. | High |
| 31399 | `이걸로 다리가 말끔히 나을 거야` for `These should fix my leg up nicely` | Clarify the referent of `These` and whether `fix my leg` means heal an injury, set a fracture, or provide support. | English does not identify the items in this isolated line. Korean assumes they will make the leg recover; Chinese says set/fix the leg. Historical notes explicitly leave both reference and treatment open. | Medium |

Rows 31351, 31353-31356, 31358-31359, 31361, 31363, 31365-31367,
31369, 31371, 31373-31374, 31376-31381, 31383-31385, 31388-31395,
31397-31398 generally retain the English meaning on this first reading.
Their names, register, fragments, and lore terms remain for the integrated
pass; no separate high-confidence wording candidate was identified.

## Historical Audit Reconciliation

- The historical source-keyed entries for IDs 31300-31399 were checked
  against this batch. They specifically flag the wise tree and Jottun Runelord,
  Glass of Ambient, Icen gem, Tender/Midden, Chaos Thrall X, St. Hadwyn's
  Mission, Cureseeker/spiral points, the Faehunter poem, `{1}`/`{2}`,
  Hierophant/Grim Onwig, `Mortal maid?`, Sorrogweth, Belen's Testament,
  Buru's Boots, and Sorrows/cycles.
- The six-line poem at 31375 remains unresolved; its source syntax and
  imagery are retained rather than rewritten as a settled interpretation.
- ID 31372's localized warning is present in all four locales, but its
  bracket/parenthesis formatting differs. It is documented as annotation
  text, not counted as a game runtime marker.

## Other Checks

- English, Japanese, Chinese, and Korean each contain all 50 IDs
  31351-31400 once and in identical order.
- Embedded line-break counts match, including the six-line poem at 31375.
- Runtime/control-token identities and order match, including `{1}` then
  `{2}` at 31379. The separate bracketed warning at 31372 has the
  cross-locale formatting variation described above.
- ID 31379 preserves both variable identities/order. No numeric
  effect-value discrepancy was identified.
- No CSV text or other source file was edited.

## Batch Status

IDs 31351-31400 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 31401.
