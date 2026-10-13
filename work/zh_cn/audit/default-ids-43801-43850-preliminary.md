# Preliminary Language Scan: `default` IDs 43801-43850

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 43801-43850 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 43802, 43849 | Beckoned; Fateless One / `부름받은 자`; `운명 없는 자` | Standardize formal lore addresses and capitalization; preserve that Beckoned arrives in the speaker's hour of need. | Korean retains both concepts; Beckoned's Korean form varies across earlier rows. | Medium |
| 43804 | Detect Hidden / `은신 감지` | Confirm the established Korean name for this skill and keep the +1 value. | English/Japanese/Chinese/Korean all identify the hidden-detection skill; Korean preserves +1. | Medium |
| 43807 | Niskaru in “the War”; Orbocant / `수정 전쟁`; `오르보칸트` | Confirm whether capitalized “the War” refers to the Crystal War and standardize Orbocant. | Korean and Chinese specify the Crystal War; English/Japanese say “the War.” This may be contextual identification, not an error. | Medium |
| 43810-43811 | Isles; Hall of Appointments / `군도`; `알현 준비의 전당` | Standardize the named Isles and confirm whether the Hall is an appointment desk, audience hall, or preparation venue. | English/Japanese/Chinese vary between the Hall's name and its function; Korean interprets its role as preparing for an audience with the High King. | Medium |
| 43812 | Circle of Engard / `엔가드 결사단` | Confirm the organization's canonical Korean name and whether `Circle` denotes a sect, order, or circle. | English says Circle, Japanese transliterates the name, and Chinese calls it a sect. Korean chooses a secret-order reading. | Medium |
| 43817 | Champion / `투사여` | Check whether this address is the character's formal Champion title or a generic fighter and keep the challenge's friendly register. | English/Chinese use champion, Japanese uses a casual challenge, and Korean uses “gladiator/fighter.” | Medium |
| 43818 | “To reach me, you must speak with me” / `나에게 다가오려면 먼저 말을 걸어야 해` | Preserve the possible approach/touch double entendre without making the Korean unnatural. | Japanese explicitly says “if you want to touch me”; English/Korean can mean approach/contact. | Medium |
| 43820 | curios/meaningless monikers / `별난 것들`, `별칭` | Clarify the intended sense of `curios` and preserve that Fae Heralds announce visitors with ego-boosting but meaningless names. | English is unusual; Korean calls them strange things and later clarifies them as nicknames. Japanese/Chinese also differ on the first noun. | Medium |
| 43821 | “not long for Ironfast” / `오래 머물 사람은 아닌` | Resolve whether the idiom predicts departure, death, or simply a poor fit for Ironfast. | Korean reads it as not remaining long; Chinese says he dislikes Ironfast. English alone leaves the idiomatic implication open. | Medium |
| 43822 | Savant Engar; Skycrown; artifact/corpse sequence | Standardize Savant's rank and the proper-name forms; preserve that the lightning blast knocks Engar from Skycrown and the speaker seeks his landing place/body. | Korean follows the English sequence. Japanese and Chinese render Savant as a rank/title differently and differ on where the lightning struck. | Medium |
| 43827 | Bloody / `블러디` | Confirm whether Bloody is a named creature/person or a descriptive term and use the glossary form. | English capitalizes Bloody; Korean transliterates it. Chinese expands it to “Bloody Skeleton,” adding a creature type not explicit in English. | High |
| 43838 | Hillared; family fortress of Seawatch / `힐러레드`; `시워치의 오래된 가문 요새` | Clarify whether Seawatch is the fortress name or a family/estate reference; preserve the lock-box retrieval objective. | Korean keeps the old family-fortress reading. Chinese says “old family castle of Seawatch,” and Japanese explicitly inserts the Drewn family, which English does not name. | High |
| 43842 | “your grace” / `전하` | Confirm the speaker's intended honorific and standardize it with other forms of address. | Korean chooses a royal “Your Highness”; English says “your grace,” Japanese says “king,” and Chinese uses a general honorific. | Medium |
| 43845 | Anokatos' intentions; “we do not trust them” / `그들을 믿지 않아` | Keep the plural referent unresolved unless nearby dialogue identifies who “them” means. | English leaves the referent implicit; Korean preserves the plural without adding an identity. Historical notes explicitly flag this pronoun. | High |
| 43850 | Aggressive Mode and crime-warning tutorial / `공격 모드` | Confirm the official Korean UI term for Aggressive Mode and retain the distinction between disabling the mode and NPCs still remembering crimes. | Korean preserves both warning sentences and the continue prompt; locale translations of the mode label differ. | Medium |

IDs 43801, 43803, 43805-43806, 43808-43809, 43813-43816, 43819,
43823-43826, 43828-43830, 43832-43837, 43839-43841, 43843-43844,
43846-43848 generally retain the English meaning on this first reading.
Names, UI labels, register, and recurring lore terms remain subject to
integrated review.

## Historical Audit Reconciliation

- The source-keyed historical sections for IDs 43791-43823 and 43827-43849
  were checked. Applicable questions cover Hall of Appointments, Circle of
  Engard, Savant, Bloody, Nanne Hanri, Phasmer, Canneroc, Hillared/Seawatch,
  Kalt, Dren, Anokatos' intentions, Galafor, and Fateless One.
- The pronoun at 43845 and the Seawatch fortress/family relationship remain
  unresolved in the historical record and are not inferred here.
- The 43850 section flags Aggressive Mode as an unresolved UI name.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 43801-43850 in
  ascending order; all four full default CSVs have 65,135 records.
- The selected rows are single-line strings; the `{LINE_SPACE}` tokens at
  43850 are explicit runtime separators, not literal newline characters.
- At 43850, `{*1}`, both `{LINE_SPACE}` tokens, and `{1}` occur in the same
  order across locales. ID 43836's named icon was checked in the preceding
  batch; it is outside this range. The +1 value at 43804 is preserved.
- No hidden formatting characters were found in the selected rows.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 43801-43850 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 43851.
