# Preliminary Language Scan: `default` IDs 26951-27000

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 26951-27000 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 26951-26954, 26957-26968, 26970-26995, 26997-27000 | Dialogue, lore, quest, and concise UI/item text | Recheck voice, idiom, titles, and recurring proper names during integrated review. | Korean generally retains English meaning and Japanese tone. The `6%` chance/`5`-second stun values at 26954 are preserved. | Medium |
| 26951 | “The other night” -> `며칠 전 밤` | Check whether the Korean implies a longer elapsed time than the English/Japanese. | English says “the other night” and Japanese says “the other day/night”; Korean's `며칠 전` is more specifically “several days ago.” | Medium |
| 26952-26953, 26955 | Rathir Chapter / Nyralim / Summer Court / High King Mathon poem | Standardize faction/location/title forms and preserve the poem's winter imagery and lineation. | Korean renders `Rathir Chapter` as `라시르 지부`, consistent with Japanese's branch reading; confirm whether Chapter is an organizational branch or chapter. The Mathon poem has four actual embedded line breaks in all locales. | Medium |
| 26956 | “The Pack...” -> `울프 팩` | Keep open whether “Pack” specifically means the named Wolf Pack or another group. | Korean explicitly expands the term to Wolf Pack. Chinese also says “wolf pack,” while Japanese leaves it generic; the historical log asks about the group's identity. | Medium |
| 26962 | Bekan Faintheart -> `베컨 페인트하트` | Preserve the English as a character name and align its Korean form with other occurrences. | Chinese translates `Faintheart` as “coward,” but English presents a proper name; Korean transliterates both name elements instead of adopting the Chinese semantic rendering. | High |
| 26969 | Hyperian “soars within our city” -> `우리 도시 위로 떠 있어` | Recheck the ship's spatial relation to the city; Korean may shift “within” to “above.” | English says the Hyperian soars within the city; Korean says it floats above the city. Japanese describes it rising and joining with the city, while Chinese says it stands within the city. Preserve as a context question. | High |
| 26971 | Fae proverb / literal `\"` | Determine whether the two literal backslash-quote sequences are intended display text or an export artifact; retain the proverb and punctuation for now. | Korean contains two literal `\"` sequences; English, Japanese, and Chinese use ordinary locale quote marks. The same pattern occurred at 26909 and was previously noted at 26224. | Medium |
| 26991 | “I've been chewing it since I was a child” / imperviousness | Keep the substance and mechanism unidentified unless surrounding context resolves them. | Korean preserves the claim that chewing the substance prevents harm and makes the speaker indestructible without naming the object. | Medium |
| 26996 | Tyrenium leakage / twenty deaths / workers | Preserve the reported count and check whether `광부들` is too specific for English “workers.” | Korean preserves twenty deaths and the Almain/Varani groups, but calls the workers miners. The context is a refinement unit and water-supply disaster; English itself says workers, so the added occupation remains a candidate. | High |

## Historical Audit Reconciliation

- The historical question log covers the names, poem, effect values, and
  fragments in this range. It specifically asks whether `Pack` at 26956
  means Wolf Pack, and lists the Mathon poem, Domus, Hyperian, and name/
  location forms.
- It also groups IDs 26991-26999 for the unidentified substance, Blood
  Plague, Alyn Shir, Apotyre, Tyrenium, Almain/Varani, Mystic Hammer,
  Hugues's Well, and the throne room. Those notes remain issue inventory,
  not approval.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 26951-27000 exactly
  once and in identical order.
- Actual embedded line-break counts and normalized runtime-token identities
  and order match. The five-line poem at ID 26955 has four embedded line
  breaks in each locale.
- The `6%` and `5`-second values at ID 26954 match all locales.
- Korean ID 26971 contains two literal backslash-quote sequences; no
  unexpected Unicode format character was found in this range.
- No structural exception was found. Korean wording and all CSVs were not
  edited.

## Batch Status

IDs 26951-27000 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 27001.
