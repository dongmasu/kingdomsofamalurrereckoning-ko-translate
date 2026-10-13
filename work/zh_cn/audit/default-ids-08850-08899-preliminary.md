# Preliminary Language Scan: `default` IDs 8850-8899

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 8850-8899.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, and applicable historical questions in
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 8850 | `Great Cycle` → `위대한 순환` | Align the capitalized cosmological term with the dominant in-world form `대순환`; distinguish ordinary uses of “cycle” before normalizing. | The same Korean corpus uses `대순환(Great Cycle)` frequently, but this row says `위대한 순환`. It is a recurring terminology inconsistency, not an approved replacement. | High |
| 8852 | `stones of your fathers and mothers` → `그대 부모의 묘석` | Verify whether the prophecy means ancestral tombstones or stones generally; retain the apocalyptic image and three-line layout. | English is ambiguous; Japanese explicitly reads tombstones, while Chinese says the parents' stones. Korean commits to tombstones. All locales preserve three source lines. | Medium |
| 8858 | `Court of Enchantments` / `in the bed` | Verify the court's canonical Korean name and retain the speaker's sexual double entendre without flattening it. | The Korean preserves both blade skill and sexual prowess, but `마법 궁정` is not reconciled with other court names. Japanese and Chinese also preserve the innuendo. | Medium |
| 8859 | `Sagecraft` → `현명술` | Reconcile the skill name and reagent names with the project's terminology; check the historical note against the active row rather than treating its candidate as current. | Other active rows render `Sagecraft`/`Sagecrafting` as `마법물품 제작`, while this active row uses `현명술`. The archived question table says `마법물품 제작` and English reagent names, but the active CSV has a different skill term and Korean names with English in parentheses. Quantities 2/2/2/1 and blank-line layout are preserved. | High |
| 8864 | `{*1[Passive]}` → `{*1[지속 효과]}`; `Eldritch frost` / `Freezing` / `Ice Barrage` | Confirm the passive label and align the frost, freezing, and ability names with established skill/status terminology. | The localized marker label is in the same `*1` position; the description preserves the effects on freezing duration and Ice Barrage damage. The ability-name translations remain terminology questions. | Medium |
| 8865 | `per stack element` | Confirm that “per stack element” means per stack and that the game effect is +20% Physical Damage for five seconds. | The English mechanic phrase is awkward; Korean interprets it as +20% per stack. Japanese and Chinese broadly support that reading, but gameplay/UI context is still needed. | Medium |
| 8866 | Capitalized `Missives` → `서신` | Determine whether `Missives` is a named set/document or generic letters; reconcile the conflicting locale references. | English and Korean describe the objects as missives/letters, Japanese says “book,” and Chinese names a particular book. Context is insufficient to settle the object. | Medium |
| 8871 | `They have that effect on their owners` | Keep the antecedent unspecified unless surrounding dialogue identifies what “they” are. | The isolated English and Korean line do not name the objects; Japanese and Chinese also preserve an unspecified plural referent. | Medium |
| 8879 | `Smashable Fate Source` → `파괴 가능한 운명 원천` | Confirm the established in-game name for `Fate Source` and whether this is a world-object label. | English capitalization and the matching Japanese/Chinese labels suggest a named gameplay object; the Korean remains a literal descriptive rendering. | Medium |
| 8880 | `murghan` / `porter` | Verify the creature form and whether `porter` means the speaker's baggage carrier or another role. | Korean preserves that the murghan ran off with the porter. English and Japanese use the creature name; Chinese generalizes it to a fish-like monster. | Medium |
| 8885 | `Master's Pick` → `장인의 자물쇠따개` | Check whether `Master` is a rank/name or a modifier and retain the lock-opening claim. | English's theft setup and Japanese's “master's pick” support a specialized lockpick, while Chinese also renders a master lockpick. Korean's `장인` may imply a craftsman rather than a master thief/tool rank. | Medium |
| 8886 | `{*1[Active]}` → `{*1[사용 효과]}` | Confirm consistent Korean naming for active-skill labels and retain the warning that large enemies may reverse the pull effect. | Marker ID/order and one line break match all locales; the localized label is in the same position. The gameplay caveat is present in Korean. | Medium |
| 8887 | `Hierophant` / `Hierophant Shrine` → `대주교` / `대주교의 성소` | Align the rank and shrine name with the established Korean form; retain that the Hierophant is the Travelers' anonymous patron. | English and Chinese use a high-priest title, Japanese uses a prayer leader, and Korean uses `대주교`. Other rows also vary between `대사제`, `대주교`, and `히에로판트`. | Medium |
| 8891 | `Esharra` / `ethereal plane` → `에샤라` / `영적인 차원` | Verify the realm's proper Korean spelling and whether `ethereal plane` has an established setting term. | The English names a distinct plane of existence; Japanese says “spirit world,” and Chinese describes an otherworldly existence. The proper name is transliterated differently across locales. | Medium |
| 8897 | `Eathe` → `이시(Eathe)` | Keep the English spelling traceable and verify the canonical Korean name, since Japanese supplies a substantially different reading. | English spells `Eathe`, Japanese reads `イース`, and Chinese reads `伊瑟`; the active Korean follows a Japanese-informed sound while retaining the English form in parentheses. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 8852, 8858-8859, 8864-8866, 8871,
  8879-8880, 8886, 8891, and 8897 against the active rows.
- The historical `Sagecraft` note for ID 8859 does not describe the current
  active wording exactly; the current row says `현명술` and localizes reagent
  names. The difference is recorded rather than synchronized.
- Added terminology questions for IDs 8850, 8885, and 8887 from direct
  corpus/source comparison.
- Historical candidates remain evidence only; none authorizes a translation
  edit.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys and order.
- Actual CSV record line-break counts match across all four locales,
  including the three-line prophecy at ID 8852 and the blank-line ingredient
  list at ID 8859.
- Runtime-marker IDs and order match after disregarding translated display
  labels. This includes `{*1[Passive]}` at ID 8864, four localized markers
  at ID 8867, and `{*1[Active]}` at ID 8886.
- No active CSV structure or text was changed. The active CSV hashes remain
  the checkpoint values in `preliminary-work-20261007.md`.
- Official Korean manual terminology was not independently searchable in
  this environment; do not treat the name questions above as settled.

## Batch Status

IDs 8850-8899 received one preliminary reading. Findings are candidates and
open questions only; they are not confirmed review dispositions and do not
authorize edits.
