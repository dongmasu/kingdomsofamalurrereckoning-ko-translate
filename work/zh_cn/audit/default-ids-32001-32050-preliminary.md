# Preliminary Language Scan: `default` IDs 32001-32050

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 32001-32050 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  variables, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 32003 | `문 캠프` / `돌브 아른에 법의 눈` | Confirm Moon Camp as a place/group label and standardize it; preserve that the legal authorities in Dolve Arne prevent the speaker's group from practicing its “true talents.” | English says those in Moon Camp do more than perform and that the law “housed in Dolve Arne” constrains them. Japanese makes the judiciary explicit; Chinese says the castle's law. Korean retains both the performance contrast and surveillance/authority implication. | Medium |
| 32014 | `운명의 정수(Essence of Fate)` | Standardize the named reagent and item display convention. | All locales identify Essence of Fate as a special reagent obtained sometimes from enemies defeated in Reckoning Mode and used for powerful alchemical potions. Korean retains the name and mechanic. | Medium |
| 32016 | Five-line winter/Fae passage | Preserve all five lines; clarify what place “this place/its depths” denotes and the image of the earth outlasting and draining the beasts. | English and all locales describe fossils/bones of beasts larger than the Fae and the earth sapping their strength, life, and flesh. Japanese identifies Klurikon explicitly, while English/Korean leave the place unnamed. Korean retains the four line breaks and sequence. | Medium |
| 32025 | `세기초 세 그루` for `three Century Plants` | Align with the established active-corpus term `백년초`; verify Hollowlands' canonical form and preserve the three-plant count and Calovar's belief as attributed speech. | Other active Korean rows render Century Plant as `백년초` (for example IDs 1793, 2304, and 2386), while this row says `세기초`. Japanese calls them 百年草 and Chinese uses Century Trees. This is a high-confidence consistency candidate, not an applied edit. | High |
| 32026 | `우로르(Uror)` on statue base | Confirm Uror as the statue/name and keep the base inscription distinct from the statue description. | English, Japanese, and Chinese agree on a seductive woman in tight leather and the name etched on the base. Korean retains the inscription and includes the English spelling for traceability. | Medium |
| 32028 | `$NQD_Village_Didenhil.m_inn_cost$` | Preserve the exact runtime cost variable and the lowercase `gold` value label. | The same variable is present in all four locales; Korean retains its identity and order. | High |
| 32032 | `대사제께서는 ... 그분들을 섬기는` for singular `The Hierophant ... their service` | Confirm whether `their` refers to one Hierophant using singular they or to a group; review the Korean plural honorific. | English names one Hierophant but uses `their`. Japanese treats the Hierophant as singular, while Chinese/Korean use plural forms. Korean follows the gender-neutral plural reading provisionally. | Medium |
| 32033 | `서약방패병(Pledgeshield)` | Confirm Pledgeshield as a formal rank/group term; retain the established Korean rendering pending role review. | English is an isolated capitalized label. Japanese reads it as a second-class mercenary rank and Chinese translates it as “shield of oath.” Existing Korean rows repeatedly use `서약방패병(Pledgeshield)`, supporting this draft's corpus consistency. | Medium |
| 32037 | `권력은 숨기고 보이지 않는 곳에서 이끌어야 한다` | Preserve the speaker's rejection of Rathir's doctrine, but clarify whether `guide from an unseen source` means leaders should guide secretly or be guided by an unseen source. | The source is compressed/ungainly and can support different grammatical relations. Japanese makes power-holders hide and guide from the shadows; Chinese says guidance comes from an unseen source. Korean follows the former sense. | Medium |
| 32041 | `예언자` / `예정된 자들` for `Augur` / `Preordained` | Confirm Augur as a name/title and standardize Preordained across the corpus; its Korean forms currently vary. | English capitalizes both. This row's Korean translates Augur and uses `예정된 자들`; other active rows also use forms such as `운명받은 자들` and `정해진 자들`. The denial/accusation remains intact. | Medium |

Rows 32001-32002, 32004-32015, 32017-32024, 32027, 32029-32031,
32034-32036, 32038-32040, 32042-32050 generally retain the English
meaning on this first reading. Names, register, and setting terminology
remain candidates for the integrated pass; no separate high-confidence
wording correction was identified.

## Historical Audit Reconciliation

- The source-keyed historical entries for IDs 32000-32099 were checked.
  They specifically flag Moon Camp, Hollowlands/Century Plants, Uror,
  Pledgeshield, Augur/Preordained, and the institutional house of learning.
- Active-corpus evidence confirms a Century Plant terminology inconsistency:
  IDs 1793, 2304, and 2386 use `백년초`, while ID 32025 uses `세기초`.
  This is recorded for later disposition without editing the CSV.
- ID 32028's `$NQD_Village_Didenhil.m_inn_cost$` variable is identical in
  all locales. ID 32016 retains its five-line layout.

## Other Checks

- English, Japanese, Chinese, and Korean each contain all 50 IDs
  32001-32050 once and in identical order.
- Embedded line-break counts match throughout the range, including four
  breaks in the five-line passage at ID 32016.
- Runtime-variable identities and order match at ID 32028; no token
  discrepancy was detected.
- No inspected row contains a locale-specific BOM, NBSP, zero-width space,
  or directional formatting character.
- No CSV text or source file was edited.

## Batch Status

IDs 32001-32050 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 32051.
