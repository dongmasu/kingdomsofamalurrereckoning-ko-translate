# Candidate Reconciliation: IDs `12500`-`12749`

- Date: 2026-11-14.
- Scope: all eight current candidates in this range, checked against English
  meaning, Japanese voice/register/layout, Chinese supporting evidence, the
  active Korean, and related title and terminology references.
- All eight proposed corrections were already present and were confirmed;
  no new CSV edit was needed.
- No speaker or playback order was inferred from asset membership.

## Candidate Decisions

| ID | Decision | Evidence and result |
| ---: | --- | --- |
| `12506` | Previously applied, confirmed | `부역자들` preserves the negative occupation-era sense supported by Chinese `通敌之人` without changing the sentence's concern for citizens. |
| `12545` | Previously applied, confirmed | The label is `쿨더 대사(Ambassador Kulder)`, consistent with the related introduction and title at `17` and `33632`. |
| `12550` | Previously applied, confirmed | `우리 자매` avoids adding the younger-sibling detail found only in Japanese; the regret and counterfactual remain intact. |
| `12571` | Previously applied, confirmed | `형제인 루이(Louis)` avoids assuming the speaker's gender or the sibling's relative age, neither of which is established by English or Chinese. |
| `12585` | Previously applied, confirmed | `받아들이겠어` conveys acceptance of the condition rather than eagerness, matching English and Japanese. |
| `12610` | Previously applied, confirmed | The two additional ballad titles now carry English pairings while keeping the Korean book-title brackets and the already paired first title. |
| `12673` | Previously applied, confirmed | `10,000개 넘게` preserves the strict `over 10,000` threshold; the English source controls despite Japanese using an inclusive threshold. |
| `12735` | Previously applied, confirmed | The first mention is consistently paired as `로어스톤(Lorestone)`, matching the established game term and the related entry at `62074`. |

## Related Consistency

- `Ambassador Kulder` is consistently rendered as
  `쿨더 대사(Ambassador Kulder)` at `17`, `12545`, and `33632`.
- `Lorestone` remains the established `로어스톤(Lorestone)` term; the source
  typo `Loretones` does not change the referent.
- Existing holds elsewhere in the range remain evidence-limited and were not
  converted into corrections or guessed resolutions.

## Verification

- All eight in-range candidates are reconciled; cumulative reconciliation is
  746 / 4,015 (18.58%), with 3,269 remaining.
- No translation or ledger fingerprint change was needed for this range.
- The full review ledger validates all 65,135 reviewed IDs; the generated
  quest-asset index and both catalogs reproduce exactly.
- CSV-preservation tests: 11 passed; dialogue-context index tests: 9 passed.
- The active default CSV retains 65,135 ordered rows, its UTF-8 BOM, 71,838
  CRLFs, 244 LF-only separators, and no bare CRs.
- CRLF-aware `git diff --check` passed. No source CSV or extracted asset was
  changed.
