# Sequential `default` Revalidation: IDs `29500`-`29749`

- Date: 2026-11-12.
- Read all 250 entries in English, Japanese, Chinese, and active Korean.
- Rechecked 62 recorded IDs and added 188 new IDs. Findings are proposals,
  not approved translation edits.
- No translation CSV, reference asset, or game binary was modified.

## Correction Candidates

| ID | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `29508` | Name / format | `Keen` and `Lan` are named people, but only `Myfa` is paired with English. Add source pairings to `킨` and `랜`; retain the casual dismissal of the others. | High |
| `29529` | Title / format | `Scholia Arcana Prefect` pairs the institution with English but leaves the office title `Prefect` unpaired. Consider `수석관(Prefect)` while preserving the established `스콜리아 아르카나(Scholia Arcana)` form. | Medium |
| `29563` | Name / format | `Cortius` is not paired with English in the journal entry, while the same name is rendered `코르티우스(Cortius)` at `51007`. Add the pairing without changing the speaker's view of the task. | High |
| `29586` | Meaning | English `abandon my post` means giving up the speaker's assignment or position; Japanese has `職務`, and Chinese has `岗位`. Korean `초소를 버릴 순 없어` narrows this to a physical guard post. Prefer wording such as `내 직책을 버릴 순 없어`, preserving the need for a replacement. | High |
| `29625` | Name / format | `Ivan` and the formal rank `Savant Reen` are unpaired in this objective. Add the source names, e.g. `이반(Ivan)` and `사반트(Savant) 린(Reen)`, preserving the delivery objective. | High |
| `29685` | Name / format | The proper group names `Children of Erathell` and `Watchers` are translated but lack English pairings. Add `Children of Erathell` to `에라셀의 자손` and `Watchers` to `감시자`; preserve the sentence's distinction between the extinct cult and the current guardians. | High |
| `29693` | Format | The two reagent lines omit a space between their English-name parentheses and quantities: `(Scarwood Bark)(2)` and `(Scarlet Flowstone)(1)`. Add the spaces before `(2)` and `(1)` to match the source-list format; preserve the blank line and order. | High |
| `29705` | Name / format | The entry names Yaba and the event `Ohn's Last Stand` without English pairings. Add `야바(Yaba)` and `오언의 최후의 항전(Ohn's Last Stand)`; retain the weapon's history and existing paired place/war names. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `29507` | Name / format | `DongleBolt` is capitalized in the source but appears only as `동글볼트`; this isolated hyphenated label does not establish whether it is a proper name or a technical category. Do not invent a parenthetical or normalize the label without more evidence. |
| `29534` | Name / format | The English title spells the deity `Lupoku`, while Korean pairs `로포쿠` with `Lopoku`, the spelling used by many other source rows. This may be a source inconsistency; retain the canonical spelling pending a scoped name decision. |
| `29566` | Meaning | `Many tidings, stranger.` may be an archaic greeting or a literal reference to news. Japanese is a generic greeting, while Chinese is more literal. Korean `반가운 소식이 많군` selects a specific reading that is not established by this isolated row. |

## Earlier Findings And Checks

- Retain candidates `29564`, `29585`, `29616`, `29627`, and `29707`, and
  holds `29516`, `29557`, and `29609`.
- `29501` uses `젬스톤 여관` consistently with the same venue at `56333`;
  no venue-name change is proposed here.
- 61 exact-English duplicate groups touch this range (1,043 corpus rows).
  Korean wording matches within each group; Japanese styles differ in some
  groups.
- Normalized runtime-token signatures and line-break counts match across
  English, Japanese, Chinese, and Korean. No embedded breaks or tokens were
  altered.
- No per-key speaker or playback order was inferred from asset membership,
  NPC symbols, handler serialization, or ID order.

After this range, the ledger contains 39,023 of 65,135 unique IDs, leaving
26,112. Sequential coverage reaches ID `29749`; next: `29750`-`29999`.
