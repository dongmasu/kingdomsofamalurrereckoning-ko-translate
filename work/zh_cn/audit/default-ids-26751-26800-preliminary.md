# Preliminary Language Scan: `default` IDs 26751-26800

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 26751-26800 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 26751-26762, 26764-26782, 26784-26800 | Dialogue, quest, and concise UI/item text | Recheck voice, idiom, register, and short-string context during integrated review. | Korean generally follows English meaning and Japanese tone. ID 26759 retains the speaker's concern about collapsing under their own weight; ID 26766 preserves the explicit female pronoun's referent through the gladiator context; ID 26787 conveys “Ignorance is bliss” idiomatically as `모르는 게 약`. | Medium |
| 26751, 26756, 26762-26765, 26767-26770, 26772-26774, 26780-26783, 26786-26788, 26791, 26795-26799 | Sir Sagrell / Fomorous Hugues / Ainmhi / Ljosalfar and Dokkalfar / Caravaneer / Crilgarin / Brownie / Silverware / Tirnoch / Tyrenium / Apotyre / Motus Mining / Fateweaving / Den / Ursin Kettle / Preordained | Standardize proper names, race/faction, role, item, and metaphysical terminology against the glossary and historical issues. | The historical audit records Tyrenium forms as an existing consistency issue. ID 26783 uses `티레니움`, while the historical candidate is `타이레니움`. Ljosalfar/Dokkalfar, `Caravaneer`, `Fateweaving`, `Den`, `Ursin Kettle`, and `The Preordained` also need corpus-wide review; the Korean rendering of Preordained includes the English name in parentheses. | High |
| 26756, 26758-26759, 26764-26766, 26770, 26782, 26786-26787, 26790, 26793-26796 | Agency, idioms, and metaphors | Preserve who caused the condition, the social/faction implications, and the speaker's rhetorical force. | Korean keeps the `errant thread` and mockingbird metaphors in the Gadflow poem at 26705 in the preceding range; this batch preserves the own-weight collapse image, the Tyrenium class/wealth argument, “ignorance is bliss,” and mutual destruction. At 26796, “fortified Kandrian Keep” becomes `칸드리안 요새를 요새화했어`, which is semantically aligned but potentially redundant in Korean. | Medium |
| 26763, 26780 | Equipment socket help / `$M0_SQ06.silverware_cost$` | Preserve marker identity/order, spacing markers, variable spelling, and currency context. | ID 26763 retains `{LINE_SPACE}` then `{LINE_LEFT}` in all locales. ID 26780 retains the exact cost variable and Gold label in Korean. | High |
| 26783 | Apotyre / Tyrenium / trec / Joson / Basilica Gnostrum / Motus Mining Interests | Review the complete historical chapter together and resolve terminology and proper-name consistency; retain its internal paragraph structure. | This entry covers the ore's discovery, mining history, social symbolism, and Tyrenium boom. Korean preserves all three sections and the historical sequence. It has nine actual embedded line breaks, matching every locale. `Tyrenium` uses `티레니움`, differing from the historical `타이레니움` form. | High |

## Historical Audit Reconciliation

- The source-keyed question log groups the Sir Sagrell poem, Encel/Hugues,
  Ainmhi, socket-gem UI, Ljosalfar/Dokkalfar, Caravaneer, Crilgarin,
  Tyrenium, and later Gravehal/Preordained references.
- It specifically calls for review of the complete Apotyre/Tyrenium passage
  and records `타이레니움` as an earlier Korean form, while the active draft
  at ID 26783 uses `티레니움`.
- The silverware cost variable at ID 26780 and related profession/faction
  names remain terminology/format candidates, not approved dispositions.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 26751-26800 exactly
  once and in identical order.
- Actual embedded line-break counts match. ID 26783 has nine embedded line
  breaks in each locale.
- At ID 26763, `{LINE_SPACE}` and `{LINE_LEFT}` identities/order match. The
  cost variable at ID 26780 is preserved.
- No structural exception was found. Korean wording and all CSVs were not
  edited.

## Batch Status

IDs 26751-26800 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 26801.
