# Preliminary Language Scan: `default` IDs 12750-12799

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 12750-12799.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 12753 | `Truesworn` → `진실의 맹세자` | Align with recurring uses of the named faction/title and distinguish it from generic sworn oaths. | The isolated label preserves the “true” and “sworn” components, but other corpus occurrences use differing Korean/title forms. | Medium |
| 12758 | `Snaketail River` → `스네크테일강` | Align the river/place spelling with the corpus's `스네이크테일` forms. | Korean preserves both the trapping work and feeding Whitestone, but its transliteration differs from other Snaketail references. | Medium |
| 12761 | `do any work on the mine?` | Clarify whether the worker offers routine work, maintenance, or a mine expansion. | Korean keeps the broad “work on the mine” question. Japanese assumes expansion; English and Chinese do not specify it. Historical question remains open. | Medium |
| 12766 | Missives of Sable / Glass of Ambient / frame the Hierophant | Preserve the scheme that frames the Hierophant for theft and clarify the mirror's established name. | Korean retains the frame-up, location search, mirror, and Sun Camp instruction. `Glass` becomes `유리잔` (“glass/cup”), which may misidentify the named mirror. Historical question remains open. | Medium |
| 12769 | women ordained as members of the Order of Mitharu | Confirm whether ordination means joining the Order, becoming clergy, or both; preserve the contradiction with scripture. | Korean uses `서품받다`, a specifically clerical reading. English, Japanese, and Chinese support ordination but do not fully define the institution's membership. Historical question remains open. | Medium |
| 12770 | `Testament worms` → `베렌의 테스타먼트 신도들` | Confirm that `Testament` refers to Belen's named group and align Belen/Belen's Testament spellings. | Korean interprets “worms” as followers and preserves the summoning plot; the corpus has competing Korean forms for Belen and the Testament. Historical question remains open. | Medium |
| 12774 | `Things he does with a flick of the wrist` | Preserve the unclear boast: his feats may amaze, frustrate, or literally provoke a troll-like roar. | Korean interprets the speaker as wanting to roar in reaction to the man's feats. Japanese/Chinese lean more toward literal transformation or a display of skill. Historical question remains open. | Medium |
| 12778 | `Mortal.` → `필멸자여` | Determine whether this is an address/title or an isolated conversational fragment. | Korean reads it as a vocative address; Japanese instead reads “well then.” Historical question remains open. | Medium |
| 12779 | `The Humbled` → `겸손해진 자들` | Determine whether this is a named group/title or a descriptive epithet before standardizing capitalization and Korean wording. | Korean preserves a collective reading. Japanese/Chinese also imply a group, but context does not establish a formal name. Historical question remains open. | Medium |
| 12785 | `Jakin told you about my little arrangement with the Champion?` | Retain the casual, understated question while recognizing that the English is grammatically incomplete. | Korean supplies a natural “did Jakin tell you” construction and preserves the agreement with the Champion. Historical question remains open. | Low |
| 12787 | Great Library / Forbidden Stacks / Tome of Synthesis | Verify established Korean names for the library, restricted archive, and book title. | Korean preserves all three entities and the magical ward, but the project's canonical display terms are not established by this row. Historical question remains open. | Medium |
| 12788 | `{1}` / `{*6{2}}` | Preserve nested runtime-variable structure and confirm the gold display wording. | Korean retains the loan amount, current gold label, both variables, and nested wrapper in the same order as all locales. | Low |
| 12791 | HP / maximum-Mana percentages | Verify the official Korean HP term and preserve all restoration amounts and mana costs exactly. | Korean retains 20% on cast, 10% while charging, 10% on completion, 30% maximum mana to cast, and up to 20% to sustain. Historical question remains open. | Medium |
| 12794 | `righteous flames of the Niskaru` / demons harnessed for one purpose | Preserve the relationship between the righteous flames, the Niskaru demons, and their single purpose. | Korean keeps the Niskaru as harnessed demons and the exclusive purpose, but the English image is syntactically unusual. Historical question remains open. | Medium |
| 12796 | `she couldn't make it` → `그녀가 오지 못했다` | Determine whether this means she failed to arrive or did not survive. | Korean chooses non-arrival, then says the speaker expected her to survive; the English and following line leave the intended sense uncertain. Historical question remains open. | Medium |
| 12797 | Enconeg / monster / `his nymph` | Clarify the relationship between Enconeg, the monster, and the nymph, and whether `his nymph` refers to an established person. | Korean preserves that the monster and the previously described nymph are one, and that Enconeg intends to marry it. Historical question remains open. | Medium |
| 12799 | `Flawless Mitharan Ravenous Fulcrum` | Verify the game's affix order and whether Fulcrum is a proper item type; preserve all quality/material/name components. | Korean renders the quality, Mitharan association, ravenous modifier, and fulcrum image, but the source phrase may be a mechanically composed item name. Historical question remains open. | Medium |

## Historical Audit Reconciliation

- Rechecked archived questions at IDs 12761, 12766, 12769-12770, 12774,
  12778-12779, 12785, 12787, 12791, 12794, and 12796-12797, 12799 against
  the active Korean and all three source locales. They remain open.
- Added current-pass consistency candidates at IDs 12753 and 12758 after
  checking recurring Truesworn and Snaketail forms.
- ID 12788 retains both variables and the nested `{*6...}` wrapper; its
  runtime-token order matches all locales.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed CSV-record line-break counts match throughout this range.
- Runtime-token signatures match; no structural or marker-order exception
  was found.
- Proper-name parenthetical use remains selective; this range does not set a
  global bilingual-display convention.
- Official Korean manual terminology could not be independently searched
  during this pass. Active Korean CSV hashes match the recorded baseline;
  no active CSV was edited.

## Batch Status

IDs 12750-12799 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 12800-12849.
