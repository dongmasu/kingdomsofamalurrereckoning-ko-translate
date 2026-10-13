# Preliminary Language Scan: `default` IDs 41801-41850

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 41801-41850 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 41801 | coercive betting / `대신 내기에 쓰고 있어` | Preserve that the speaker is compelled to place bets on another person's behalf and cannot resist without risking their ability to stay. | Korean retains the proxy betting and danger implied by remaining, but the rhetorical `우리가 뭘 할 수 있겠어?` is less explicit about coercion than English/Japanese. | Medium |
| 41803 | Fate pattern / `운명의 결`; `너만은 있어야` | Preserve that the addressee should have a place in the pattern even if dead; check the emphasis in `너만은`. | English says all mortal creatures have a place and the addressee should too. Korean retains that claim, though `너만은` can add an “you, at least” emphasis. The pattern/Fate terminology remains contextual. | Medium |
| 41811 | `Art` / `예술` | Determine whether this is a UI tab/category, a discipline, or a general label before settling the Korean form. | The source is a one-word label; Japanese retains `Art`, Chinese uses `美术`, and Korean uses `예술`. The historical audit explicitly leaves its interface role open. | Medium |
| 41812 | Well of Souls research / `그 어떤 희생도 아깝지 않아` | Preserve the speaker's explicit claim that the Well is worth every sacrifice, while leaving the ethical stance visible for context review. | Korean retains the innocent-blood cost and the speaker's justification; the line itself endorses the research rather than neutrally describing it. | Medium |
| 41821-41822 | Ljosalfar/Faitir; Solemn Bell; Dolve Wayle; The Font | Confirm canonical names and whether `The Font` is a named sacred site or a generic spring. | Korean preserves the ritual and ancestral-spirits context. The historical log flags the Ljosalfar ritual, Dolve Wayle, Solemn Bell, and Font terminology; locale forms diverge. | Medium |
| 41825 | inn-cost prompt / `$NQD_Village_Tirinsrestl.m_inn_cost$` | Keep the gold requirement clear without altering the runtime variable. | The Korean preserves the exact variable and amount slot. Its phrasing omits English/Chinese `Need`, but still communicates that the listed gold is required. | Medium |
| 41831 | `Yes. You do.` / `그래, 네가 맞아.` | Recheck the antecedent: the line likely confirms that the addressee has a reasonable chance to stop events, rather than saying the addressee is correct. | The preceding sentence states that the addressee is the only one with a reasonable chance. English `You do` echoes that predicate; Korean `네가 맞아` ordinarily means “you are right.” Japanese says “yes, you,” and Chinese confirms. | High |
| 41833 | Irion/Maire verse; `wayward eon` / `아득한 시대로` | Preserve the poem's unusual time/era image and clarify the lost-path clause without inventing a resolution. | English's `some wayward eon` is unusual; Korean renders a distant era and retains the Hierophant's severe gaze as the cause of their being lost. Names and verse diction remain open. | Medium |
| 41839 | `Lipstick Intensity` / `립스틱 농도` | Determine whether this is a graphics/UI setting or another property before choosing its Korean label. | Korean translates the words literally; English and Chinese do not establish the setting type. The historical question log flags the same uncertainty. | Medium |
| 41841 | `estate` / `저택` | Confirm whether the term means a residence, property, or another kind of estate in context. | Korean selects a mansion/residence reading; English and Chinese leave the property type less specific, and the historical note asks what kind of estate is meant. | Medium |
| 41846-41847 | `reawakened a part of me`; `the order` / `교단` | Preserve the personal recovery image and verify the organization type; avoid settling “order” as religious without context. | Korean retains the renewed sense of self. At 41847, English says `the order`, while Japanese/Chinese identify an academy/university and Korean selects `교단`; the institution type and name need context. | High |
| 41849 | Divine Reward / `신성한 보상` | Confirm whether this is a formal quest/item name and standardize its capitalization/name form. | Korean preserves the objective but renders the phrase generically; the historical log flags it as a possible proper name. | Medium |

IDs 41802, 41804-41810, 41813-41820, 41823-41830, 41832, 41834-41838,
41840, 41842-41845, 41848, and 41850 generally retain the English meaning on
this first reading. Names, register, and recurring terminology remain open to
integrated review.

## Historical Audit Reconciliation

- The source-keyed historical question log for IDs 41750-41849 was checked.
  Its entries specifically flag betting coercion (41801), the Fate-pattern
  claim and Dead Kel/Akara context (41803-41805), the Art label, sacrifice
  stance and ability help (41811-41812, 41817), the Ljosalfar ritual and
  Font/Evenroot terms (41821-41826), the Irion/Maire verse (41833), and
  Lipstick Intensity, the empty estate, reawakened self, organization, and
  Divine Reward (41839-41849).
- The archived progress log records that the exact inn-cost variable at
  41825 and localized ability marker IDs at 41817/41840 were preserved.
  These historical structure checks were repeated against the active files.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 41801-41850 once
  and in identical ascending order.
- Embedded line-break counts match across all four locales.
- IDs 41817 and 41840 retain three localized ability markers in the same
  order and with the same `*1` marker IDs. The exact localized labels differ
  by design. ID 41825 retains the exact
  `$NQD_Village_Tirinsrestl.m_inn_cost$` variable.
- Japanese ID 41833 alone includes the explicit numeral `2` (`2人`);
  English, Chinese, and Korean express the plural through the two named
  people/pronouns instead. This is recorded as a source-layout/content
  variance, not a confirmed Korean omission.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 41801-41850 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 41851.
