# Preliminary Language Scan: `default` IDs 27651-27700

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 27651-27700 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 27651 | `가.` for “Leave me.” | Preserve the request to be left alone rather than making it sound only like an order to go away. | Japanese says “leave me alone” and Chinese says “don't bother me.” Korean `가.` means “go/leave,” omitting the explicit “me alone” sense in this isolated row. | High |
| 27652, 27654, 27657, 27659-27660, 27674, 27676-27680, 27682-27683, 27688-27689, 27698 | Widow / Canneroc / Valor Arena / Sprite Champion / Chief Protector / Onwer Brond / Hyperian Tragedy / The Humbled / Flowering / Chrysalae / Mitharans / Alfar / Varani / Arne names / Witch Knight | Reconcile recurring proper names, factions, roles, and titles against the terminology inventory; retain the source spelling question at 27660. | Korean generally preserves the identities and plot relationships. English spells the armor owner's name `Onwer Brond`; Japanese has another rendering, and historical notes identify `Onwer` as a possible English typo. Do not silently correct the source name. | Medium |
| 27670 | `헥스` for `the hex` | Confirm whether this is the named card/game result or a numeric result, and standardize the term. | English and Japanese use `hex`; Chinese interprets it as six points. Korean transliterates the English term and says the player won. The historical audit leaves card terminology open. | Medium |
| 27671, 27690 | `도브(Dove)` | Reconcile the recurring lowercase vocative with its likely affectionate/familiar use; do not assume it is a character's proper name. | English addresses the listener as “dove”; Japanese omits it, while Chinese renders it as “peace messenger.” Earlier historical entries treat this as a likely endearment but do not define one universal Korean equivalent. | Medium |
| 27672, 27675, 27681, 27687, 27691, 27697 | Stations of the Day / den / ring and affinity descriptions / date placeholders | Check UI, venue, item, and time-display terminology, retaining placeholder values and order. | Korean is clear in context. ID 27697 preserves `{1}` and `{2}` in source order; 27687 retains the ring's fire-affinity effect. These remain candidates for integrated terminology and UI review. | Medium |
| 27689 | `돌브 아른(Dolve Arne)의 나머지` | Clarify whether `Dolve Arne` refers to a place, family, or people, and what “the rest” denotes. | English is compressed and permits more than one referent; Japanese and Chinese also diverge on the abandoned family/place. Korean keeps the uncertainty but chooses a reading that may sound like abandoning the rest of a group/place to decay. | Low |
| 27692 | Proper name `Yurny` | Retain the Korean name provisionally and record the source-format anomaly. | The Korean transliteration matches the name. Chinese alone contains U+FEFF after `尤恩尼`; it was retained and not copied into Korean. | High |
| 27700 | Belmaid poem / Maid of Windemere | Preserve the poem's speaker, story relationships, and stanza formatting; review meter and naturalness during integrated review. | Korean conveys the Maid's curse, Belmaid's rescue and grief, and Wencen's illness. English, Chinese, and Korean preserve the four-line stanza break with a blank line; poetic quality remains open rather than a structural defect. | Medium |

## Historical Audit Reconciliation

- The source-keyed 27600-27699 inventory flags the Widow quest, Valor Arena,
  Sprite, Ysa title, `Onwer` source spelling, Hex, Dove, Hyperian Tragedy,
  theater roles, Mitharans, Alfar/Varani, fire-affinity item, Arne names,
  Forsaken Plain, and an unnamed object.
- The 27700-27799 inventory flags the Maid/Belmaid poem and recurring
  faction/title terminology. These questions remain open and are not
  approved translation dispositions.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 27651-27700 once,
  in identical order.
- Actual embedded line-break counts and normalized runtime-token identities
  and order match. ID 27700 retains the matching two-stanza lineation; ID
  27697 preserves `{1}` and `{2}` in source order. The `50%` value at 27663
  is identical in all four locales.
- Chinese ID 27692 contains a U+FEFF (`ZERO WIDTH NO-BREAK SPACE`) after the
  localized name; it is absent from the other three locales. The artifact
  was retained and logged, not removed.
- No other unexpected Unicode format character or structural exception was
  found.
- Korean wording and all CSVs were not edited.

## Batch Status

IDs 27651-27700 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 27701.
