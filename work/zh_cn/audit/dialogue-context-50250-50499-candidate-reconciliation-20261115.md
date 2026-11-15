# Candidate Application Reconciliation: IDs `50250`-`50499`

- Date: 2026-11-15.
- Rechecked all 13 correction proposals in the sequential range report
  against current Korean, English, Japanese, Chinese, and previous
  application/context decisions.
- Ten active candidates were newly reconciled. `50445`, `50460`, and
  `50475` were already handled in linked reviews. The older candidate
  `50270` was also already reconciled in the `46000`-`51999` review.
- Two source-supported corrections were applied: the crafting label at
  `50342` and the sentence at `50426`. Other proposed wording is already
  present and supported.

## Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `50284` | Retained | The current line uses direct, conversational plain speech and a natural invitation; no unsupported speaker attribution was added. |
| `50342` | Corrected | Changed `피해 증폭 손잡이` to `피해 손잡이`, matching `Damaging Handle` → `피해 손잡이` in `base:682`. The exact subtype/function of this crafting modifier remains unresolved. |
| `50375` | Retained | `숙련된 도적(Rogue)` naturally conveys more experienced Rogues; the Korean preserves stealth, ranged attacks, precise weak-point targeting, and critical damage. |
| `50398` | Retained | `세이블의 서신(Missives of Sable)` is already paired and consistent with the named book. The line's address/register remains unresolved because the individual speaker and stage are not established. |
| `50407` | Retained | The map fragment pairs `폭풍 곶(Storm Point)` and preserves the distinct Alfar and Dvergan script references. |
| `50418` | Retained | `도시 중심에 있는 질서의 사원 주변에 모여 있다` removes the nested-modifier awkwardness while preserving the claim about Crownhold. |
| `50426` | Corrected | Recast `선을 위해 사용해` as `이걸 선한 일에 써서`, keeping the plain register and the instruction to use the gift against evil. |
| `50429` | Retained | `들판(The Field)` is paired as the card name and the collective `페이트위버(Fateweavers)` is plural and paired. |
| `50431` | Retained | The ingredient is already `펜라크(Fennwrac)`. The identity of `stew-grist` and the force of `About bloody time` remain unresolved. |
| `50497` | Retained | `테스타먼트(The Testament)` is paired as the named group. Whether it is identical to the Belen organization in Japanese and Chinese remains unresolved. |

## Previously Reconciled Candidates

- `50270` was checked in the `46000`-`51999` application review; the current
  sentence accurately says the owner paid handsomely for the scrolls'
  return.
- `50445` already uses `오물 배출관`, consistent with the linked Lost Squad
  entries.
- `50460` already uses the accepted `작은 자여`, matching the related
  Khamazandu references.
- `50475` was previously retained after checking the chicken-meat simile;
  its current `닭고기처럼` wording is natural and supported by Japanese.

## Separate Holds

The existing evidence-limited holds remain unchanged: `50343` (Scion's
Guard referent), `50362` (service versus worship), `50387` and `50431`
(grist identity), `50417` (speaker/register), `50428` (fragment/text type),
`50448` (malformed English line break), `50467` (kinship), `50470`
(collaborators versus collaborators with an enemy), and `50496`/`50497`
(Testament/Belen identity). No speaker or dialogue order was inferred from
asset associations.

## Verification

- The 13 sequential-report proposals were rechecked across the four language
  tables. Four additional active ledger candidates were already reconciled;
  they were not counted again.
- Only Korean rows `50342` and `50426` changed, using
  `tools/replace_text_preserve_eol.py`; only those IDs' source fingerprints
  were refreshed.
- Candidate reconciliation is now `3,275 / 4,026` (`81.35%`), with `751`
  remaining.
- Structural, fingerprint, regression-test, and line-ending checks are
  recorded in the accompanying decision manifest.
- No immutable source CSV or extracted asset was changed. No commit was
  made.
