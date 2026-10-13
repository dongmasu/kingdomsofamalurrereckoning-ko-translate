# Preliminary Language Scan: `default` IDs 53701-53750

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 53701-53750 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 53701 | `아르카나 학회(Scholia Arcana)` / Jubal Caledus | Confirm the established Korean names for the institution and Jubal; retain English spellings for traceability until standardized. | English provides the names; Japanese and Chinese use differing phonetic forms. Korean identifies both names and preserves the former Archsage role. | Medium |
| 53703 | nearby town / “were prevented from going back” | Preserve that the couple could not return after becoming crazed without inventing who imposed the restriction. | Korean says they could not return and retains the cause, but the English passive leaves the restricting party unspecified. | Medium |
| 53710 | rapid Health Regeneration recipe | Preserve Black Cohosh (2), Scarlet Flowstone (1), and the Alchemy Workbench instruction; confirm reagent terminology. | Korean retains both ingredients, quantities, and all three source line breaks. | High |
| 53711 | `제물 의식` for `the Offering` | Confirm whether this is a named rite/event or a generic offering; avoid adding specificity without context. | English capitalizes `Offering`; Korean interprets it specifically as a sacrificial ritual. Japanese and Chinese also support a devotional/offering sense but do not settle the formal category. | Medium |
| 53713 | House of Ballads / Fae telling | Preserve that a death creates an opportunity for one hero to join the ranks of the greatest champions; verify `telling` as the in-world tradition/category. | Korean retains the named champions and opportunity. Its `페이 전승` is plausible, but the exact sense of `telling` remains contextual. | Medium |
| 53715 | `여름의 요람(Summer's Cradle)` for `the Cradle` | Verify whether the abbreviated English `Cradle` refers to Summer's Cradle. | Japanese names Summer's Cradle explicitly and the Korean follows it; English omits `Summer's`, while Chinese also leaves the name generic. The expansion is plausible but not directly explicit in English. | Medium |
| 53718 | House of Valor / Dren | Preserve that no force can harm Dren while the speaker is defending the House of Valor; do not follow the Chinese source's different “defeating the family” reading. | Korean follows the English and Japanese protection reading. Chinese materially differs, but does not outweigh the English semantic anchor. | High |
| 53721 | `운명 직조(Fateweaving)` | Check the established Korean term and whether Fateweaving is a service or process offered by Luminitsa. | Korean preserves the invitation and lonely lakeside setting; the isolated line does not define the practice. | Medium |
| 53731 | Nearth / Hammer of the House of Vengeance | Verify Nearth's title/role and the sequence in which he attempts to kill his master, renounces his position, and passes on the hammer. | Korean retains the attempt and transfer. English has the source spelling `Vengence`; the Japanese wording suggests the hammer continues to be inherited, while English only says it was passed on. Keep the precise lore chronology open. | Medium |
| 53736 | Lady Ansilla letter and signature | Preserve the pointed accusation, the “first three times” reference, the two-days-ago denial, Rathir business, and Lady Ansilla signature; confirm voice and relationship context. | Korean retains the accusation and all details, including the source's three-times count. Its body/signature separation has the same two line breaks as the other locales. | High |
| 53738 | `유언단(Testament)` | Reconcile English `the Testament` with Japanese and Chinese `Belen Covenant`; retain the English-based draft provisionally pending faction terminology review. | Korean follows English, while both supporting locales identify Belen. Earlier audit notes treat Testament as a possible named faction/institution, so this remains a material cross-locale naming conflict. | High |
| 53744 | `{1}% {2}` | Preserve the English placeholder order in the runtime format string. | English, Chinese, and Korean use `{1}% {2}`; Japanese alone uses `{2}{1}%`. Korean follows English and Chinese. | High |
| 53749 | `끝내 받지 못한 지참금` / bride never wed | Preserve the coin's origin in a dowry never taken and a bride who never married; clarify whether “never taken” means unclaimed or never received. | Korean retains the dowry and unmarried-bride relation, but “never received” is one interpretation of the source's passive wording. | Medium |

Other reviewed rows generally preserve the English meaning on this first
reading. Recurring names and terms remain provisional, including Scholia
Arcana, Jubal Caledus, Cydan the Outcast, Erathell, House of Ballads, House
of Valor, Luminitsa, Nearth, House of Vengeance, Beckoned, Heliodorus,
Dokkalfar, Astor Colliane, Almain, Poison Shower, and the Offering.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for `default` IDs 53650-53749.
  It covers the Jubal Caledus note (53701), the recipe quantities (53710),
  the Summer's Cradle expansion (53715), the House of Vengeance hammer
  (53731), the Lady Ansilla letter (53736), Testament naming (53738), the
  dowry (53749), and the `{1}% {2}` variable order (53744).
- The historical entry explicitly notes that Korean at 53715 follows
  Japanese in spelling out Summer's Cradle, where English says only
  `the Cradle`. This is retained as a candidate, not treated as settled.
- Historical `default` IDs 53750-53849 begins at ID 53750 (`The War`).
  This batch includes that boundary row once; the next batch starts at
  ID 53751, so ID 53750 must not be reviewed or counted again.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 53701-53750 once
  and in identical ascending order.
- Physical line-break counts match throughout the range. IDs 53710 and
  53736 contain three and two line breaks respectively in every locale.
- Runtime markers match except for Japanese marker order at 53744:
  `{2}{1}%` in Japanese versus `{1}% {2}` in English, Chinese, and Korean.
  Korean follows English. No hidden format/control characters were detected.
- The recipe quantities `(2)` and `(1)` at 53710, the “first three times”
  and two-days-ago references at 53736, and the dynamic percentage/variable
  at 53744 are retained.
- No translation CSV edit was made. Active CSV SHA-256 values remain equal
  to the recorded immutable baseline.

## Batch Status

IDs 53701-53750 received one preliminary reading. This report remains
preliminary; working dispositions are recorded separately in
[`disposition-batch-default-53701-53750-20261010.md`](disposition-batch-default-53701-53750-20261010.md).
Those dispositions are not independent final linguistic approval. The
current disposition pass continues at `default` ID 53751.
