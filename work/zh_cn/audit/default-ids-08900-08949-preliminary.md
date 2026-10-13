# Preliminary Language Scan: `default` IDs 8900-8949

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 8900-8949.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, and applicable historical questions in
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 8906 | `a sturdy hammer and a anvil` / `those two` | Preserve the source grammar error and unspecified “those two” referent; do not infer who or what made forge work unhappy. | English contains the typo `a anvil` and leaves the pair unexplained. Korean preserves the unspecified pair and the contrast. This matches the historical open question. | Medium |
| 8912 | `dagger pommels / twining / spoons` → `단검 손잡이 장식과 꼬임끈, 숟가락` | Confirm whether `twining` means twine/string, a specific material, or something else in this inventory-like list. | English is unusual; Japanese says “twisted thread,” Chinese says hemp rope, and Korean uses `꼬임끈`. The item category cannot be settled from this line alone. | Medium |
| 8915 | `Counsel` → `평의회` | Determine whether capitalized `Counsel` is a governing body, a counselor/advisor, or a source typo for `Council`. | English capitalizes `Counsel`; Japanese and Chinese interpret it as an advisor, while Korean renders a council/assembly. Retain the conflict for lore-context review. | Medium |
| 8917 | `Sceptre Ammo` → `홀 탄약` | Confirm whether this is ammunition for a sceptre-like weapon, a crafting component, or an internal item label. | English and Chinese support an ammo label; Japanese transliterates the term. The unusual equipment category is not clear from the isolated label. | Low |
| 8920 | `Oathblade Ordura` → `서약검병 오두라` | Verify whether `Oathblade` is a formal rank/title or a weapon descriptor, then align with other occurrences. | Japanese renders a rank-like “first-class mercenary,” Chinese transliterates the oathblade title, and Korean treats it as a person/rank. Historical audit records the title ambiguity. | Medium |
| 8926 | `Savant Engar` → `현자 엥가` | Confirm the formal rank and standard Korean rendering of `Savant`; preserve that the person is a war mage. | Japanese gives a first-class mage, Chinese uses “scholar,” and Korean uses “sage.” Other active rows use `사반트` and `학자` for this title. | Medium |
| 8930 | 7/18 traps; 5 meters; 150 damage; 80/120 Mana | Keep the numeric skill behavior intact and confirm whether “holding the attack” means holding the attack button. | Korean retains both trap counts, radius, damage, and mana costs. The input wording is inferred from the English control instruction and should be checked against the UI. | High |
| 8933 | `Is it a good day?` → `오늘 날씨 좋지?` | Check whether this is a weather question or a general greeting/contextual line. | English and Chinese can refer to the day generally; Japanese instead says “How are you?” Korean commits to weather without explicit weather wording in English. | Low |
| 8934 | `{LINE_LEFT}{*1Maps}{LINE_LEFT}` | Preserve the marker sequence and verify consistent display labels for the Maps tutorial; retain all three map types and the fast-travel/waypoint functions. | All locales use the same `{LINE_LEFT}`, localized `{*1...}`, `{LINE_LEFT}` sequence. Korean preserves world/local/mini-map and both functions. | High |
| 8937 | `Tuatha` → `투아타` | Align the ethnonym with the recurring `투아사` form or document a deliberate distinction. | English uses the same proper name; active Korean varies between `투아타` and `투아사` without an evident sense distinction here. | Medium |
| 8942 | `the city rose` → `도시는 다시 일어섰다`; `Hyperian did not follow` | Verify whether “rose” means the city physically ascended rather than recovered or stood up; preserve the speaker's rejection of the result. | Japanese explicitly says the city floated, and Chinese says it rose into the air. Korean's `다시 일어섰다` can mean revival/recovery and obscures the likely physical motion. The event context remains open. | High |
| 8947 | `Plagueshield` → `역병방패`; compare `Pledgeshield` | Determine whether `Plagueshield` and the recurring `Pledgeshield` are distinct names/ranks or a source spelling error. | English spells `Plagueshield`; Japanese transliterates it, while Chinese translates “plague shield.” The similar `Pledgeshield` form appears elsewhere but should not be silently substituted. | Medium |
| 8949 | `educated guess` → `박식한 추측` | Confirm the idiom as an informed/reasoned guess rather than a guess made by a learned person. | English and Chinese support a reasoned, informed guess; Korean's `박식한 추측` is unusually literal and may imply the guess itself is learned. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 8906, 8912, 8915, 8917, 8942, and
  8947 against the active rows.
- The `Plagueshield` spelling remains distinct from `Pledgeshield` pending
  source/context verification; no automatic normalization was made.
- Added terminology/context questions for IDs 8920, 8926, 8930, 8933, 8934,
  8937, and 8949 after direct comparison.
- Historical candidates remain evidence only; none authorizes a translation
  edit.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys and order.
- Actual CSV record line-break counts match across all four locales. ID 8930
  preserves its blank-line separation between the two skill effects.
- Runtime-marker IDs and order match after disregarding translated display
  labels. ID 8934 preserves `{LINE_LEFT}`, `{*1...}`, `{LINE_LEFT}` in order.
- No active CSV structure or text was changed. The active CSV hashes remain
  the checkpoint values in `preliminary-work-20261007.md`.
- Official Korean manual terminology was not independently searchable in
  this environment; do not treat the name questions above as settled.

## Batch Status

IDs 8900-8949 received one preliminary reading. Findings are candidates and
open questions only; they are not confirmed review dispositions and do not
authorize edits.
