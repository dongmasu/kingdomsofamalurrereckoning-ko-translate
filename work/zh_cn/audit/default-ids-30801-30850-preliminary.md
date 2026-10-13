# Preliminary Language Scan: `default` IDs 30801-30850

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 30801-30850 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 30804 | `부름받은 자여` for `Beckoned` | Standardize the formal title against active forms such as `간택받은 자` and `초대받은 자`. | The address is a named role/title in a Kollossae dialogue. The active draft has several Korean renderings for the same capitalized term. | High |
| 30807 | `거미 주머니의 진액`, `펜와락`, `곡물` for `spidersac ichor`, `Fennwrac`, and `grist` | Confirm the canonical reagent names and whether `grist` is grain/mash taken from a Jottun cook pot. | The recipe's three ingredients are retained, but English, Japanese, and Chinese differ on the unfamiliar reagents and the cook-pot ingredient. Historical notes explicitly flag these terms. | Medium |
| 30813 | `구름 위에 머리를 둔 추종자` for `followers with their heads in the clouds` | Preserve the idiom's criticism that followers are detached/unrealistic, rather than translating it as a literal physical position. | English uses an idiom; Korean calques the cloud/head image. The contempt for the followers and the vulgar insult about the Hierophant's boots are both preserved. | Medium |
| 30816 | `마을에 이 물약이 꼭 필요해` for `the town needs this potion soon` | Retain the time pressure (“soon”) as well as the potion's necessity. | English and Chinese say the town will need it soon; Japanese says immediately. Korean stresses that it is needed but does not explicitly state when. | Medium |
| 30819 | `안실라 가문` for `House Ansilla` | Confirm the formal House/faction convention and standardize its Korean name. | Korean treats House as `가문`; historical materials flag House Ansilla among recurring institutions and names. | Low |
| 30821 | `분명 내 허락을 받았겠지` for `By my leave, I'm sure` | Confirm the speaker's intended sarcastic or literal register before fixing the Korean phrasing. | English is elliptical and may sarcastically imply that permission was not granted. Korean can be read as the speaker asserting permission was surely obtained. Japanese instead sounds like granting permission. | Medium |
| 30830 | `스콜리아 아르카나` for `Scholia Arcana` | Standardize the organization name against `아르카나 학회(Scholia Arcana)` and other active transliterations. | The same organization appears in the draft as `스콜리아 아르카나`, `숄리아 아르카나`, and the semantic `아르카나 학회`. Historical notes treat it as a formal organization. | High |
| 30838 | `그것은 ... 손이 닿지 않는 곳에` for `It rests out of reach` | Identify the antecedent of `it` and preserve the condition/date when the gods forgive the trespass and deem the people worthy again. | The isolated English line does not name the object. Korean retains a generic pronoun, as do the other locales; historical notes explicitly flag the antecedent. | Medium |
| 30841 | `시체가 필요해. 죽은 시체면 더 좋고` for `I need bodies. Preferably dead ones.` | Preserve the distinction between bodies in general and preferably-dead bodies without creating an unintended tautology. | Korean first says a corpse is needed and then prefers a “dead corpse.” English distinguishes bodies from dead ones; Japanese and Chinese retain that contrast. | Medium |
| 30843 | `{*6Resisted}` | Preserve marker index `6`; note that the Chinese locale translates the visible payload while English, Japanese, and Korean leave it in English. | All four retain the same `{*6}` marker identity. Chinese displays `抵抗`; the other three display `Resisted`. This is a localized-payload difference, not a marker-order/key mismatch. | Medium |
| 30847 | Lightning Damage potion recipe | Preserve the blank-line-separated ingredient list and exact counts: Eel Petal (3), Scarwood Bark (2), Bloodroot (1), and Essence of Fate (1). | Korean retains the recipe layout and all four counts. Reagent-name forms vary among the locales and remain terminology candidates. | High |

Rows 30801-30803, 30805-30806, 30808-30812, 30814-30815, 30817-30818,
30820, 30822-30829, 30831-30837, 30839-30840, 30842, 30844-30846,
30848-30850 generally retain the English meaning on this first reading.
Their names, register, fragments, lore terms, and surrounding quest context
remain for the integrated pass; no separate high-confidence wording candidate
was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 30800-30899 was checked against
  the applicable rows, including Kollossae/Beckoned, spidersac ichor,
  Fennwrac, Jottun grist, Dren/Dyth, the Hierophant, House Ansilla, Augur,
  Scholia Arcana, Hearts of Chaos, and Hreid Amelthoe.
- The narrower historical questions at 30807, 30813, 30820-30821,
  30838, 30843, and 30847 were reviewed. The recipe terms, insult/idiom,
  Augur reference, elliptical permission line, unnamed antecedent, localized
  marker payload, and potion recipe remain candidates rather than approvals.
- ID 30847's blank-line-separated recipe was checked directly. All
  ingredient quantities match: 3, 2, 1, and 1.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 30801-30850 once,
  in identical order.
- Embedded line-break counts and normalized runtime-token identities/order
  match. The `{*6}` marker at 30843 is preserved; only its Chinese visible
  payload is localized.
- Numeric meanings are retained, including the twin defenders at 30811,
  the one-day shout at 30833, the repeat instruction at 30836, and all four
  recipe ingredient quantities at 30847. Localized written forms vary.
- No unexpected Unicode format-character or structural exception was found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 30801-30850 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 30851.
