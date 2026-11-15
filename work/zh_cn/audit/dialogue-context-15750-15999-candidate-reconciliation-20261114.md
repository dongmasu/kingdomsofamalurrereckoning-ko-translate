# Candidate Reconciliation: IDs `15750`-`15999`

- Date: 2026-11-14.
- Scope: all eleven current ledger candidates in this range, checked against
  English, Japanese, Chinese, and the active Korean translation.
- All eleven were already supported by the current Korean after four-language
  review; no CSV or fingerprint edit was needed.
- Asset associations support grouping only. No individual speaker or
  playback order was inferred.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `15784` | Previously applied, confirmed | The Omnibus Arcana's directions and the speaker's own directions are compared directly. The current Korean names the book in both clauses and no longer leaves the comparison detached. |
| `15794` | Previously applied, confirmed | English, Japanese, and Chinese praise the addressee's intelligence in the playful reward line. `머리도 좋구나!` preserves that compliment rather than changing it to a general blessing. |
| `15811` | Previously applied, confirmed | The context identifies `Missives` as the book *Missives of Sable*. The current line uses `세이블의 서신(Missives of Sable)` and retains the speaker's interest and decision to leave it for later. |
| `15816` | Previously applied, confirmed | `지팡이 조각 회수하기` is a concise objective label with the established `-하기` form. |
| `15879` | Previously applied, confirmed | `Authority` is the established deity `권능(Authority)`, not an ordinary authority figure. The prayer form is natural and consistent with the other deity references. |
| `15885` | Previously applied, confirmed | `No lessons! No precious pearls of wisdom!` means the speaker has no instruction to offer. `가르침은 없어! 귀한 지혜도 없다고!` preserves that direction without implying that the speaker needs no lessons. |
| `15886` | Previously applied, confirmed | In the Invasive Species quest context, the capitalized `Critters` are the Chaos Critters. `혼돈 생물들(Chaos Critters)` matches the established creature term and the crop-damage context. |
| `15933` | Previously applied, confirmed | `외설 문학 수집품` describes Brother Til's bawdy-literature collection without changing the quest-journal narration. The wording was retained in the prior broad edit review and remains source-supported. |
| `15964` | Previously applied, confirmed | `마주하게 될 거야` naturally conveys the new Ragnarr encountering both an unignorable challenge and a battle he thinks he can win; it does not invent a specific battle or sequence. |
| `15965` | Previously applied, confirmed | The current journal entry consistently uses `처형인(Headsman)` and `베셀리(Betheli)`, and says the Headsman died, matching the quest outcome and the Japanese and Chinese sources. |
| `15985` | Previously applied, confirmed | `그 장난꾸러기` preserves the affectionate, mischievous sense of `the little scamp`; `그 꼬마` would retain only the age implication. |

## Related Consistency Checks

- The `Glass of Ambient` / `Missives of Sable` references, `Authority`,
  `Chaos Critters`, and the recurring `Headsman` / `Betheli` names were
  checked against their bounded asset reviews.
- The existing hold at `15775` and the evidence-limited findings at
  `15846` and `15902` remain unresolved under their source-conflict reports;
  this pass does not treat them as candidates or guess at their meanings.
- The other evidence-limited rows in the range remain unchanged. Quest assets
  do not establish a particular speaker or playback order for these IDs.

## Verification

- All eleven in-range candidates are reconciled; cumulative reconciliation
  is 898 / 4,015 (22.37%), with 3,117 remaining.
- No translation CSV or review-ledger fingerprint changed in this range.
- The full ledger and generated index/catalogs validate. The preservation
  tests (11) and context-index tests (9) passed in the validation run for the
  preceding batch.
- The active CSV's UTF-8 BOM, 65,135 ordered records, and existing mixed
  line endings were preserved; the CRLF-aware diff check passed.
- Source CSVs and extracted game assets were not changed.
