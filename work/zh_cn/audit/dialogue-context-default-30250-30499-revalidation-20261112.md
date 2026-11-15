# Sequential `default` Revalidation: IDs `30250`-`30499`

- Date: 2026-11-12.
- Compared all 250 entries in English, Japanese, Chinese, and active Korean.
- Rechecked 86 existing ledger entries and added 164 IDs. Findings are
  proposals, not approved translation edits.
- No translation CSV, reference asset, or game binary was modified.

## Correction Candidates

| ID | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `30266` | Terminology | The same health-potion description appears at `37751` and `49632`. Korean uses `생명력` for the first two but `체력` at `49632`; the project's established attribute term is `체력`. Align this entry with the established term. | High |
| `30321` | Name / format | `field of Huber` is a named location. This row says `후버 들판` without English, while other references vary between `후버(Huber)의 들판` and `후버 평원`. Pair the name and align the location wording with the established form. | High |
| `30363` | Name / format | The letter addresses `Mstr. Almar`; Korean has `알마르 님께` without the name pairing. Add `Almar` locally, but do not expand the ambiguous source abbreviation. | Medium-high |
| `30371` | Name / format | The objective `Kill Balthasar` omits the English name pairing. Add the established name form, e.g. `발타사르(Balthasar) 처치하기`. | High |
| `30384` | Name / format | `St. Eadric's Chapel` is rendered `성 이드릭(St. Eadric) 예배당`, pairing only the saint's name rather than the full named location. Pair the full source label, e.g. `성 이드릭 예배당(St. Eadric's Chapel)`. | High |
| `30398` | Title / format | `Templar Octienne` is rendered `템플러 옥티엔(Octienne)`, leaving the title unpaired. Pair the title and name separately. | High |
| `30420` | Meaning / naturalness | `Wooed Rast Brattigan` is rendered `라스트 브래티건을 유혹했다`. Japanese says the speaker gained Rast's affection; `유혹했다` can imply seduction. Consider `라스트 브래티건의 환심을 샀다` or another context-appropriate courtship wording. | Medium-high |
| `30474` | Name / format | The named historical period `Corthian Age` is rendered `코르티아 시대` without English. Add the pairing. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `30347` | Speech level / source | English and Chinese include the deferential address `your grace`, while Japanese omits it and uses a casual greeting. Korean's `어서 와` follows the Japanese register. Do not change the register until the cross-language discrepancy is resolved. |
| `30378` | Source / terminology | English uniquely says `Fatewaver`; Japanese says `Fateweaver`, and Korean uses the established `Fateweaver` form. Treat the English spelling as a possible source typo, not proof that the Korean pairing should be changed. |
| `30390` | Meaning / source | English says `Unless you depart Amalur forever`, but Japanese says the opposite, and Korean follows Japanese. Retain the current translation pending source resolution. |

## Earlier Findings Rechecked

- Retain existing candidates `30265`, `30277`, `30290`, `30331`, `30336`,
  `30348`, `30374`, `30375`, `30401`, `30408`, `30409`, `30411`, and
  `30430`; their four-language fingerprints still match.
- Retain the existing evidence-limited hold at `30364`; its source fingerprint
  still matches.
- The `Fair Folk` rendering at `30374` remains a terminology-consistency
  candidate: other occurrences in the active Korean use `페이`/`페이들`,
  while this row uses `요정족`.
- No per-key speaker or playback order was inferred from asset membership,
  NPC symbols, handler serialization, or ID order.

## Repeated Sources And Structure

- Two exact-English duplicate groups touch this range: `Farewell.` (`30453`,
  `30478`) and `Quest Complete` (`30437`, `30441`). Korean wording matches
  within both groups.
- Runtime-token signatures match across all four languages.
- At `30355`, English, Chinese, and Korean have three embedded line breaks;
  Japanese has two. Korean preserves the English/Chinese layout.

After this range, the ledger contains 39,569 of 65,135 unique IDs, leaving
25,566. Sequential coverage reaches ID `30499`; next: `30500`-`30749`.
