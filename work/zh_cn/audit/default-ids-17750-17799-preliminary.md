# Preliminary Language Scan: `default` IDs 17750-17799

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 17750-17799.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 17752 | sad stories / seat elsewhere | Preserve the dismissive request and the condition for continuing the conversation. | Korean retains both the speaker's weariness and the request to sit elsewhere unless the news is cheering. | Low |
| 17753 | rat meat / “leaves one wanting” | Preserve the joke that the food is unsatisfying without changing the underlying image. | Korean says the meat never satisfies, matching the English idiom; Japanese instead says it makes one hungrier and Chinese says it is unpleasant. | Medium |
| 17762 | staffs / Cradle of Summer | Preserve the urgency and the claim that the staffs belong in the Cradle. | Korean retains the recovery imperative and collective-safety consequence; name form should align with other Cradle references. | Medium |
| 17767 | Grinning Vane | Verify whether this is a personal/creature name or an epithet and standardize its Korean form. | Korean transliterates Vane while translating Grinning; Japanese also translates the grin, while Chinese translates both as a vine-like phrase. | Medium |
| 17772 | internal `to spawn "Hunter-Gatherer"` | Determine whether this is a developer/spawn label or player-facing content before deciding how to localize it. | Korean localizes the label and adds doubled quotation marks; the source/locale forms indicate a diagnostic or internal-looking string. | Medium |
| 17774 | Might stat | Align the named attribute with the game's stat glossary. | Korean uses `힘`, which conveys physical strength but may not preserve the formal stat name `Might`. | Medium |
| 17775 | Hospitalis Quarters | Verify the place/institution name and standardize the Korean form. | Korean gives a generic hospital ward; English is capitalized, and Japanese/Chinese use related but different institution terms. | Medium |
| 17776 | Chancellor / wish only to serve | Preserve the deferential response and verify the rank/address. | Korean retains the title and service intent; Japanese omits the direct address while English/Chinese keep a title. | Low |
| 17778 | The Calamity / found and lost family | Determine whether The Calamity is a ship name and preserve the repeated “found it, and lost it” emotional turn. | Korean treats it as `재앙호`, supporting a vessel reading; Japanese/Chinese also imply a ship. | Medium |
| 17779 | “proper warden” / volunteer | Preserve the speaker's shaken tone and distinction between formal warden and volunteer. | Korean retains both points; the source's double period is rendered as a Korean double period. | Low |
| 17781 | Secandra / Hyperian / Anokatos / heroine | Align lore names and preserve the narrator's account and fate-changing sequence. | Korean retains all four paragraphs, the Hyperian's ascent, and the Kollossae's changed fate. “Brethren” is rendered inclusively as siblings. | Medium |
| 17783 | Balor / General Tilera / `{*1...}` | Preserve both localized marker wrappers and their order, plus the instruction to stand behind Tilera. | All four locales retain the two markers in order and localize their payloads; Korean preserves beam damage and shield protection. | High |
| 17787 | city “will stand for centuries” | Preserve the claim that the city will endure for centuries, not merely resist an attack. | Korean's `버틸` can imply withstand/endure; the exact nuance is close but worth checking against the setting context. | Low |
| 17797 | Callis Dren / Defender of Pride | Determine whether Pride is the House/faction or the abstract virtue. | Korean says `자존심의 수호자`; Japanese identifies the House of Pride, while Chinese can read as a proud defender. | High |
| 17798 | Astor Colliane / gnome swindler / Seawatch | Verify the names and preserve the last-seen location and looting motive. | Korean retains all facts; name/place transliterations are not settled by this row. | Medium |
| 17799 | Jen / Widow / quoted warning | Preserve who says the warning and inspect Korean quote punctuation. | Korean retains the remembered warning and uncertainty, but uses doubled ASCII quotation marks around the quoted dialogue. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions at IDs 17753, 17778, 17781, 17783,
  17787-17788, and 17797-17799 against the active four-locale rows. They
  remain preliminary questions; no historical note authorizes a translation
  edit.
- Internal/diagnostic status at 17772 and Might terminology at 17774 are
  recorded as context/glossary questions.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain IDs 17750-17799
  in identical order.
- Embedded line-break counts match. The four-paragraph story at 17781
  retains its six line breaks.
- Localized marker class/order at 17783 matches; the two marker payloads are
  localized in each locale. No structural exception was found.
- The official Korean manual could not be text-searched in this environment;
  terminology candidates remain unverified against it.

## Batch Status

IDs 17750-17799 received one preliminary reading followed by a disposition
pass. See
[`disposition-batch-default-17750-17799-20261009.md`](disposition-batch-default-17750-17799-20261009.md).
One quote-format correction was accepted at ID 17799; seven terminology/name
questions remain uncertain and unchanged. Continue disposition work with
`default` IDs 17800-17849.
