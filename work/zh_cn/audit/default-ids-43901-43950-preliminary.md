# Preliminary Language Scan: `default` IDs 43901-43950

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 43901-43950 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 43904 | pacify a target; alternate approach / `표적을 제압`; `다른 방식으로 임무 수행` | Confirm the gameplay meaning of `pacify` (neutralize/disable vs. calm) and preserve the necklace's alternate approach. | Korean interprets it as subduing a target without detection. Japanese says eliminate the target; Chinese uses “deal with/solve” the target. The isolated item text does not settle the exact mechanic. | Medium |
| 43907 | Reverie; Calovar / `몽상계`; `칼로바르` | Standardize Reverie as a named realm/concept and preserve that the speaker must sleep while Calovar walks the sands. | Korean treats Reverie as a realm; Japanese reads it as meditation and Chinese as a daydream. Proper-name forms vary. | Medium |
| 43910 | Hierophant / `대사제` | Standardize this title with other Hierophant occurrences. | Japanese uses a guide title, while English/Chinese/Korean use a religious leader reading. | Medium |
| 43914 | trade writs; escrow / `무역 증서`; `예치된 계좌 잔액` | Confirm the financial meaning and standardize writ/escrow terms while retaining the speaker's factual inventory of Rathir. | Korean preserves seasonal average trade writs and escrowed account balance; Chinese instead says average trade amount/account count. Historical notes flag financial terminology. | Medium |
| 43917 | “Hugues will answer to me” / `위그는 내게 책임을 져야 할 거야` | Resolve whether `answer to me` means report/respond to the speaker or be held accountable by them. | Korean selects the accountability sense; Japanese and Chinese read it as answering the speaker's questions. Historical notes flag Hugues. | High |
| 43919 | Infrequent rarity / `{*4비흔한}` | Confirm the official Korean rarity tier and keep its marker attached to the correct label. | Korean's `비흔한` is an unusual, potentially unnatural tier name. English/Japanese/Chinese preserve the tier as a rarity category; the `{*4}` and `{*3}` IDs remain attached to Infrequent and Rare. | High |
| 43921 | Race and Gender Change Placeholder / `종족 및 성별 변경용 자리표시자` | Determine whether the label is developer-facing metadata or a visible placeholder and whether it should be translated. | English/Japanese leave the phrase untranslated; Chinese/Korean translate it. Historical notes explicitly leave this display decision open. | Medium |
| 43925 | Paling Wand / `페일링 지팡이` | Confirm the canonical item name and standardize the wand/wood terminology. | English names a Paling Wand; Japanese gives a semantic “tilling staff,” Chinese uses a pointed wand, and Korean transliterates Paling. | Medium |
| 43926 | key from Sinsear; reach the Sorrows / `신시어`; `비탄` | Preserve the division of tasks and resolve Sorrows as a named entity/force rather than generic grief if context supports it. | Korean correctly assigns one helper to retrieve the key and another to teach Bisarane how to reach the Sorrows. Chinese reverses the opening clause to say the player will work alone. | High |
| 43928 | Hall of Appointments / `알현 준비의 전당` | Reuse the chosen canonical form and ensure it matches the earlier Hall reference at 43811. | Korean uses the same explanatory title at both IDs; Japanese says “appointment hall” and Chinese “appointment hall.” | Medium |
| 43930 | Dverga; keeps; blacksmithing equipment | Standardize Dverga and keep the crafting-equipment/fortification meaning distinct. | Korean retains the causal relation: Dverga need good smithing equipment to establish their keeps, making shipboard equipment likely. Locale names differ. | Medium |
| 43931 | The Unbound; Fate/destiny; Fateless One's command of the Weave; Black Odeon / `결속되지 않은 자들`; `직물`; `검은 오데온` | Confirm formal faction/lore terms, especially capitalized Weave, and preserve the invitation, destination instructions, named recipients, and signature. | Korean retains the letter's full meaning and structure but renders the lore term Weave literally as `직물`; this may not match its in-world sense. Proper names and terms vary across locales. | High |
| 43940 | The Master / `주인` | Confirm whether `Master` is a formal theater role/title or simply the theater's owner; standardize its Korean form. | English capitalizes the role and calls the Master the playwright who runs the theater; Korean's generic `주인` may lose title status. | Medium |
| 43942 | Apothecary Services / `약제사 서비스` | Confirm whether this is a menu/service label and align it with established Korean alchemy/apothecary UI terms. | All locales translate or adapt the service label differently; isolated context does not establish its function. | Medium |
| 43945 | High King's Guide / `최고왕의 안내자` | Confirm whether this is a formal office/title or a literal guide role. | English capitalizes the title; Japanese says guide, Chinese says aide/staff, and Korean uses guide. | Medium |
| 43946 | “Every other week it tastes like buttermilk” / `격주로 버터밀크 맛` | Preserve the recurring alternate-week joke and confirm its timing from context. | Korean follows the English/Japanese “every other week”; Chinese instead says it tastes like buttermilk after a week. | Medium |
| 43949 | FAIL LINE / unchanged | Confirm whether this is intentional test content or an internal string before deciding whether it belongs in player-facing localization. | Korean/Japanese preserve the English label; Chinese translates it as “failed dialogue.” Historical notes explicitly flag it. | Medium |

IDs 43901-43903, 43905-43906, 43908-43909, 43911-43913, 43915-43916,
43918, 43920, 43922-43924, 43927, 43929, 43932-43939, 43941, 43943-43944,
43947-43948 generally retain the English meaning on this first reading.
Names, titles, item/UI terms, and lore terminology remain subject to
integrated review.

## Historical Audit Reconciliation

- The source-keyed historical sections for IDs 43850-43949 were checked.
  Applicable entries flag pacify/alternate-assassination wording, Reverie/
  Calovar, trade writs/escrow, Hugues, the Infrequent rarity tier, the
  Race and Gender Change Placeholder, Paling Wand, Sinsear/Sorrows, Hall of
  Appointments, Dverga, the Unbound/Weave/Black Odeon letter, Apothecary
  Services, High King's Guide, and `FAIL LINE`.
- Historical notes explicitly preserve the placeholder and marker questions
  as unresolved; no prior disposition was treated as approval.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 43901-43950 once
  and in identical ascending order; each default CSV has 65,135 records.
- Line-break counts match across all four locales. ID 43931 contains six
  line breaks, including blank paragraph separators, in every locale.
- ID 43919 retains `{LINE_SPACE}` and the `{*4}` / `{*3}` rarity markers in
  source order. The +6% Mana value at 43913 matches across locales.
- No hidden formatting characters were found in this range.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 43901-43950 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 43951.
