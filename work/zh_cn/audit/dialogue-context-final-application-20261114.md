# Dialogue Context Candidate Application: Final Status

- Date: 2026-11-14.
- All 551 candidate IDs in `40000`-`45999` have a disposition: 445 edits,
  84 retained, and 36 evidence-limited holds. Fourteen IDs have separate
  dispositions for distinct issues. No candidate remains unclassified.
- Changes are restricted to ID-scoped Korean `Texto` cells. Rows matching
  supported wording are retained; evidence-limited findings remain held
  rather than guessed.

## Final Batch Dispositions

| Range | Edit rows | Retained | Held | Application status |
| --- | ---: | ---: | ---: | --- |
| `33500`-`35999` | 193 | 62 | 3 | Applied, including the six-row follow-up |
| `36000`-`39999` | 77 | 187 | 41 | Applied and verified, including four reconciled candidates |
| `40000`-`45999` | 445 | 84 | 36 | Complete; 137 edits applied and 308 already matched |
| `46000`-`51999` | 6 | 301 | 12 | Six final edits applied; prior supported wording retained |
| `52000`-`57999` | 2 | 270 | 6 | Two final edits applied; prior supported wording retained |
| `58000`-`65134` | 14 | 374 | 89 | Fourteen final edits applied; prior supported wording retained |

The gap review accounted for 148 additional candidate findings: 147 retained,
one held, and no new edit. Some reports contain overlapping findings for
different dimensions of the same ID; the 551 count is unique candidate IDs,
while disposition counts preserve those separate issues.

## Application Notes

- The `46000`-`51999`, `52000`-`57999`, and `58000`-`65134` manifests were
  adjudicated against the active Korean text. Earlier supported wording
  already present in the CSV was retained; only the final `edit` entries
  still needing changes were applied.
- In `40000`-`45999`, 308 edit values already matched the active CSV and 137
  were applied with the byte-preserving editor. Four multiline manifest
  entries stored literal `\r\n` text; these were interpreted as the CSV's
  existing CRLF breaks. The follow-up adjudication reclassified three
  register findings from held to edit after direct EN/JA/ZH comparison and
  retained `45816`, whose Aster pairing was already approved and present.
- The complete final manifest is
  [`dialogue-context-final-edits-40000-45999-20261114.json`](dialogue-context-final-edits-40000-45999-20261114.json);
  the follow-up adjudication of 66 additional edits and one retained ID is
  also preserved in
  [`dialogue-context-final-edits-followup-40000-45999-20261114.json`](dialogue-context-final-edits-followup-40000-45999-20261114.json).
- A linked Dreadscale-series check also added English pairings to two other
  `default` item names and four `base` variant-`11` rows. These six related
  edits are outside the 551-candidate count and are documented separately in
  [`dialogue-context-dreadscale-pairing-20261114.md`](dialogue-context-dreadscale-pairing-20261114.md).
- `default:47277` reorders the existing `{1}` and `{*1...}` markers to the
  order supported by English, Japanese, and Chinese. Both marker identities
  were preserved.
- `default:49486` changes only the localized label inside the existing
  `{*1...}` wrapper; the wrapper and its position are preserved.
- `default:61216` applies the established `권능(Authority)` term and closes
  the Korean quotation. `default:62998` changes one uniquely matched sentence
  fragment while preserving the rest of the row.
- A subsequent source check found that `default:49259` had been incorrectly
  listed as already matching its proposal: the Aster-history row still lacked
  several English name pairings and contained a literal succession phrase.
  Those issues were corrected in a follow-up; its existing testament
  quotation and eight line breaks were already correct and remain unchanged.
  See [`dialogue-context-49259-followup-20261114.md`](dialogue-context-49259-followup-20261114.md).
- The same current-row cross-check found two more missed items in
  `49750`-`49999`: the `Arne` pairing at `49795` and the trader's stiff offer
  at `49851`. Both were corrected and their fingerprints refreshed; the
  unresolved transliteration hold at `49795` remains separate. See
  [`dialogue-context-49795-49851-followup-20261114.md`](dialogue-context-49795-49851-followup-20261114.md).
- Checking the next candidate range found two additional unapplied
  naturalness/register corrections at `50014` and `50016`; the other
  candidates in `50000`-`50249` already reflected their supported wording.
  See [`dialogue-context-50014-50016-followup-20261114.md`](dialogue-context-50014-50016-followup-20261114.md).
- A final row check confirmed that `50508` already had the complete
  `Circlet of Arkes` pairing and refreshed its stale fingerprint. At
  `50533`, the Korean location was aligned to the established
  `허바르의 문턱` form while retaining the exact source spelling
  `Hurvar's Doorsil`; the earlier format hold is superseded by direct
  cross-reference evidence. See
  [`dialogue-context-50508-50533-followup-20261114.md`](dialogue-context-50508-50533-followup-20261114.md).
- In `50250`-`50499`, three supported corrections were still absent:
  `50284` (register), `50342` (crafting-term readability), and `50497`
  (`The Testament` terminology). They were applied; the item subtype and
  Belen-identity questions remain held. See
  [`dialogue-context-50284-50342-50497-followup-20261114.md`](dialogue-context-50284-50342-50497-followup-20261114.md).
- A later source cross-check found the approved `54630` Teeth of Naros urn
  correction still absent, plus particle errors at `6103` and `8606`. These
  three rows were corrected after checking the full 18-reference urn group;
  `35675` already matched its final manifest. See
  [`dialogue-context-teeth-of-naros-urns-followup-20261114.md`](dialogue-context-teeth-of-naros-urns-followup-20261114.md).
- Only fingerprints for IDs whose Korean text changed were refreshed. Existing
  review dispositions and unrelated ledger bytes were preserved.
- Reconciliation of the `36000`-`39999` ledger candidates found four IDs
  omitted from that range's final manifest: `38770`, `38771`, `38818`, and
  `38891`. Their source-supported corrections were applied and only their
  four fingerprints were updated. See
  [`38770`/`38771`/`38818`/`38891` follow-up`](dialogue-context-38770-38891-application-followup-20261114.md).
- A further reconciliation found 16 active ledger candidates in
  `40000`-`45999` omitted from the final manifests. Four-language review
  assigned three edits (`41926`, `42063`, `43026`), 11 retentions, and two
  evidence-limited holds. The three edits were applied and only their
  fingerprints refreshed. This supplements the earlier manifest totals; it
  does not rewrite the historical counts or collapse separate findings.
  See
  [`missing-candidate follow-up`](dialogue-context-40000-45999-missing-candidate-followup-20261114.md).

## Verification

- The active `default` CSV contains 65,135 ordered rows and retains its UTF-8
  BOM, 71,838 CRLF sequences, 244 LF-only sequences, and no bare CR.
- All 65,135 review-ledger fingerprints validate against the four language
  tables. The quest-asset index and both context catalogs reproduce exactly.
- All 11 CSV-preservation and nine dialogue-context-index tests pass.
- `git -c core.whitespace=cr-at-eol diff --check` passes.
- No commit was made.

## Candidate Reconciliation Follow-Up

After this application summary was written, the `3000`-`3249` candidate
reconciliation corrected three in-range rows and three related rows. It also
superseded the earlier erroneous retention of the omitted two-bug count at
`36982` and `38893`. The repeated `Grasper of the Spear of Light` epithet at
`56854` was aligned with `3075`. See
[`dialogue-context-03000-03249-candidate-reconciliation-20261114.md`](dialogue-context-03000-03249-candidate-reconciliation-20261114.md)
for the row-level evidence and follow-up verification.
