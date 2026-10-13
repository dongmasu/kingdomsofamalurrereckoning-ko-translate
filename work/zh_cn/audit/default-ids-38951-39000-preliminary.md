# Preliminary Language Scan: `default` IDs 38951-39000

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 38951-39000 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, available historical terminology notes, line
  breaks, runtime markers, values, and recurring terms.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 38977 | The Telling / `구전 이야기` | Confirm whether this capitalized term is the formal Fae fate-story/tradition and standardize it separately from generic storytelling. | English defines the Telling as the ongoing story in which Fae play an integral role. Korean translates it as an oral tale; earlier audits repeatedly leave The Telling's formal lore meaning and canonical Korean open. | Medium |
| 38978 | `Increases Quake Cost: 10 Mana` / `퀘이크 소모 마나: 10` | Preserve that Quake's Mana cost increases by 10, rather than presenting 10 Mana as its total cost. | English, Japanese, and Chinese explicitly describe a cost increase; Korean's label can be read as a total cost of 10. Damage +10%, final-hit stun chance +20%, and 3-second duration are otherwise retained. | High |
| 38991 | Mitharan Piercing Handle / `미사루식 관통 손잡이` | Confirm the canonical material/item term and distinguish Mitharan from the deity Mitharu. | English identifies a Flawless Mitharan crafting component. Korean's `미사루식` can be read as “Mitharu-style”; earlier audits repeatedly flag Mitharan component naming and spelling. | Medium |
| 39000 | Nix verse / four-line English text | Verify whether the compact Korean sentence preserves the source's verse/rhyme and punctuation, even though the CSV line-break counts are equal. | English uses a four-line rhyming verse ending with Creth and Airmer “sure to fall”; Korean conveys the events in prose-like phrasing and does not reproduce the rhyme. Japanese and Chinese also differ in rhyme/layout, so this is a style/context question rather than a structural exception. | Medium |

IDs 38951-38976, 38978-38990, and 38992-38999 generally retain the English
meaning on this first reading. The subject/reference and all item names remain
subject to integrated review.

## Historical Audit Reconciliation

- The historical source-keyed open-question log has a documented gap covering
  IDs 37700-40349. Earlier Telling, Quake, and Mitharan-component notes were
  considered; they remain unresolved candidates, not approved dispositions.
- No line-break exception was detected for the Nix verse; its rhyme and
  literary form remain a separate content question.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 38951-39000 once
  and in identical order.
- Embedded line-break counts and detected runtime-marker identities/order
  match across all four locales. ID 38937 retains `{1}` on the maximum-skill
  line.
- ID 38952 retains four orbs at 75 Physical Damage each; ID 38960 retains
  +15% Ranged Attack Damage; ID 38978 retains the damage/stun figures and
  10 Mana cost increment; ID 38991 retains the named crafting-component
  category.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 38951-39000 received one preliminary reading. Findings were later
dispositioned in `disposition-batch-default-38951-39000-20261010.md` and
registered as D-12514-D-12518. This remains preliminary work, not independent
Reviewer approval. Continue the disposition pass at `default` ID 39001.

## Subsequent Working Disposition

The separate disposition pass is recorded in
`disposition-batch-default-38951-39000-20261010.md`: two accepted, one
`not an issue`, and two uncertain findings. The accepted changes at IDs
38977 and 38978 reuse the prior The Telling term and restore the Quake
Mana-cost increment. Mitharan item terminology and the Nix verse's rhyme
remain open; this preliminary scan is not independent final review.
