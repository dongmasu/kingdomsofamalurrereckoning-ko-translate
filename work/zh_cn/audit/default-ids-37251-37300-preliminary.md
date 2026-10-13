# Preliminary Language Scan: `default` IDs 37251-37300

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 37251-37300 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 37253 | Basilica Gnostra / `그노스트라 대성당` | Standardize the Basilica Gnostra place name and verify whether `quarters` means lodging or a formal office. | English says Scholar Nerenne has quarters there and will get the player started. Japanese describes lodging; Chinese says she lives there. Korean uses `거처`, preserving the broad sense. | Medium |
| 37257 | `Word of Mitharu according to St. Odwig` | Confirm the established title form for this religious text and the relation implied by `according to`. | English presents it as a text attributed to St. Odwig; Korean says the saint “conveyed” Mitharu's words, which may imply a different transmission relation. Japanese calls it the saint's words; Chinese calls it an oracle. | Medium |
| 37259 | Decanus / Auxiliary / Centurion | Standardize the military ranks and verify whether `Decanus` should be rendered as `십인장`. | The English explicitly places Decanus above Auxiliary and below Centurion. Japanese uses ten-/hundred-person ranks; Korean follows that interpretation, while the Chinese leaves Decanus untranslated. | Medium |
| 37263 | `Court` / `궁정` | Determine whether capitalized `Court` is a named Fae institution rather than a generic royal court. | English capitalizes the term; Japanese uses the project-like `英雄院`, while Korean says `궁정` and Chinese uses a different institution term. Historical notes flag this as a named-Court question. | High |
| 37264 | `birthright` / `대대로 누려 온 권리` | Preserve the claim that the people are asserting an inherited/natural right; check whether the Korean's “rights enjoyed for generations” narrows or changes `birthright`. | English calls it the people's birthright; Japanese says their right, Chinese says an innate right, and Korean emphasizes long-standing enjoyment. The core recovery objective remains. | Medium |
| 37268 | Ereen / old Orieator | Standardize Ereen and Orieator, and preserve the speaker's comic exaggeration about being talked at. | English says Ereen heard of the speaker's fight and seemed ready to talk their ears off. Korean retains the name, fight, and idiomatic exaggeration; Japanese instead frames it as being interrogated, while Chinese says scolded. | Medium |
| 37271 | “bring to bear for what has happened to the House” | Keep the source's awkward accountability wording unresolved; verify who must answer for the House's misfortune from context. | English is syntactically awkward. Korean interprets it as holding “that person” responsible and having much to question them about; Japanese/Chinese also assign blame, but the exact relationship is context-dependent. | High |
| 37274 | Nil “The White” Kern biography | Review against story context before resolving its difficult source imagery; preserve the illness/pain account and the first-earned-white contrast without silently repairing the source. | This long English account contains awkward or unclear clauses, including “when and when not to sit still,” the Orieator's Lance sentence, and the pain description. Korean preserves the four body paragraphs and most events, but renders the pain as beginning below the waist rather than explicitly in the small of the back. Japanese and Chinese make different interpretive choices, so neither settles the English. | High |
| 37275 | gorta / `고타` | Standardize the creature name and preserve the speaker's request to escape the decaying place. | English and Japanese use `gorta`; Chinese identifies skeleton soldiers; Korean transliterates `gorta` and retains both the walls and groaning. | Medium |
| 37279 | `adulation` / `숭배` | Check whether `숭배` overstates the source's praise/admiration and whether the following belief statement is intended as religious veneration. | English says the addressee has resisted the community's adulation; Japanese uses a flattery term, while Chinese also uses worship. Korean follows the stronger religious reading. | High |
| 37282 | cut off and surrounded / `포위되어 고립됐어` | Preserve the isolation and certainty of death without adding a specific manner of injury. | English says he was cut off and surrounded, then presumed dead. Korean's `포위되어 고립` retains the tactical isolation; Chinese adds that he was cut in half, which is unsupported by English/Japanese. | High |
| 37286 | Headsman / Midden / Alfar presence | Standardize the title and place/faction terms; preserve that summoned Wild Fae impede reaching the Headsman and protecting the Alfar presence. | Korean retains the objective sequence and hostile summons. The phrase `알파르 세력` is a plausible reading of `Alfar presence`, but its institutional scope remains uncertain. | Medium |
| 37293 | Bag of Winds / Missives of Sable | Standardize item and faction terms and preserve the two alternatives: frame the Hierophant or betray Grim. | Korean retains the exact either/or agency. It renders `Missives of Sable` as `검은 사절문서`; Japanese and Chinese use other item/title forms, so the proper-name treatment remains open. | Medium |
| 37298 | “We will free her. And I will kill her.” | Preserve the deliberate contradiction in the speaker's stated plan; do not reconcile the pronoun or motive without surrounding context. | English and Korean both explicitly promise to free and then kill her. Japanese omits this detail and Chinese retains it, supporting the English/Korean wording. | High |
| 37300 | `x{1}` | Preserve the exact multiplier format and runtime token. | All four locales contain `x{1}` with the same token identity and order. | Low |

IDs 37251-37252, 37254-37256, 37258, 37260-37262, 37265-37267,
37269-37270, 37272-37273, 37276-37278, 37280-37281, 37283-37285,
37287-37292, 37294-37297, and 37299 generally retain the English meaning
on this first reading. Proper names, lore, register, and UI context remain
subject to integrated review.

## Historical Audit Reconciliation

- The historical source-keyed entry for IDs 37200-37299 was checked against
  this batch. Questions at 37253, 37257, 37259, 37263-37264, 37268,
  37271, 37274, 37279, 37286-37288, 37293-37295, and 37298 were compared
  directly with all four locale rows.
- The unresolved `Court` identity at 37263, birthright wording at 37264,
  Nil Kern biography at 37274, and adulation intensity at 37279 remain
  candidates for contextual review, not approved corrections.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 37251-37300 once
  and in identical order.
- Embedded line-break counts match across all four locales, including the
  multi-paragraph biography at 37274.
- Detected runtime-marker identities and order match; `x{1}` at 37300 is
  unchanged in all four locales.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 37251-37300 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 37301.

Subsequent working disposition: see
[`disposition-batch-default-37251-37300-20261010.md`](disposition-batch-default-37251-37300-20261010.md).
Corrections at IDs 37264 and 37279 were accepted; the remaining findings
were dispositioned or left uncertain there. This later working pass is not
independent linguistic approval.
