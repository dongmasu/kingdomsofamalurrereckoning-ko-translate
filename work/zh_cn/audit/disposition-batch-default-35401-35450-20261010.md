# Disposition Batch: `default` IDs 35401-35450

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling preliminary findings with active Korean,
  immutable English/Japanese/Chinese rows, prior decisions, terminology,
  values, and structure.
- Evidence caution: Japanese wording refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- Decisions: zero accepted, eight `not an issue`, and eight uncertain.
- CSV changes: none.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 35402 | Seawatch / `my liege` / claiming the keep | Uncertain: feudal address and claim condition are retained; Seawatch spelling and whether the place is a keep/claimable holding remain corpus/context questions. |
| 35407 | Tuatha as the same sort of creature | Uncertain: Korean preserves the comparison without inventing the omitted comparison group; surrounding conversation is needed to identify the referent. |
| 35410 | `master-at-arms` | Uncertain: Japanese suggests chief guard and Chinese weapon master; prior decisions also leave trainer/armorer/security-office readings open. |
| 35413, 35417 | Mitharan Expansive String / Thora Woolstring | Uncertain: item subtype and character name are retained, but the item term and Thora's Korean spelling need glossary/cross-entry confirmation. |
| 35423 | Ear of Barnabus / Eye of Sunspar confusion | Not an issue: Korean preserves the speaker's self-correction between both mismatched names, matching the English sequence. |
| 35425 | Executioner's Den | Uncertain: the named destination is retained, but the exact place type behind `Den` needs context before standardizing it. |
| 35426 | `I'm your gnome` repair pun | Not an issue: Korean naturally conveys that the gnome is the person to consult for repairs, preserving the wordplay's service function. |
| 35429-35431 | Darkvari family / Sons of Laz / Amaldor Kura / Warsworn | Uncertain: raids, objective, leadership, and faction are retained; family, faction, rank, and personal-name segmentation remain unresolved. |
| 35432 | Hunter's days / addressee's days beginning | Not an issue: the contrast between the speaker's finished hunting days and the addressee's beginning is retained; Korean's `사냥` supplies the clear parallel antecedent. |
| 35436 | 14% chance / 100 Bleeding Damage / 5 seconds | Not an issue: chance, damage, and duration are all retained without inventing a per-tick value. |
| 35438 | `move some merchandise` | Uncertain: Korean chooses selling/dealing goods; Japanese and Chinese support physical movement, while English merchant context permits sales. The exact action needs scene context. |
| 35439 | Faith-enforced laws / cases outside divine attention | Not an issue: the contrast and the speaker's responsibility for lesser cases are retained; the elliptical English does not support a more specific rewrite. |
| 35441 | `Junk pile` tutorial | Not an issue: storage of unwanted items and selling them together at the next merchant are preserved; `잡동사니 목록` is a plausible UI label. |
| 35445, 35449 | Court of Summer / Ice Queen | Uncertain: the faction and title are retained, but canonical lore-name forms and whether Court is an institution or place remain open. |
| 35450 | One-week loan and collection by other means | Not an issue: repayment within one week and the unspecified nonmonetary collection threat are preserved. |
| Remaining ordinary text in IDs 35401-35450 | Dialogue, objectives, labels, and structure | Not an issue: the other 31 IDs were checked in all four locales; no additional supported row-local defect was identified. |

## Historical Audit Reconciliation

- Existing `master-at-arms` decisions (including D-3973, D-4251, D-5448,
  D-9174, and D-11312) leave the exact office open; ID 35410 is not changed.
- Seawatch, Amaldor/Warsworn, Court of Summer, Ice Queen, and merchandise
  terms remain cross-corpus/context questions, not approved normalization.
- The Korean does not import the Japanese/Chinese interpretations where they
  conflict with or exceed the English meaning.

## Verification

- All four locale files contain IDs 35401-35450 exactly once and in the same
  order. No embedded line breaks or runtime marker tokens occur in the range.
- ID 35436 retains 14%, 100 Bleeding Damage, and five seconds; ID 35450
  retains the one-week term and unspecified collection threat.
- No Korean `Texto` value changed; CSV keys, row order, and encoding remain
  at the verified preceding checkpoint.
- These working dispositions are not independent final linguistic approval.
- Resume disposition at ID 35451; 29,684 IDs remain through ID 65134.
