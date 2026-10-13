# Consolidated Context Review: `default` Repeated `dove` Vocatives

- Review date: 2026-10-12.
- Scope: unresolved `dove` address findings at IDs 1719, 48425, and 28129;
  exact-source duplicate ID 5285 was aligned but remains uncertain on other
  terms.
- English controls meaning; Japanese informs voice/register; Chinese is
  supporting evidence. Historical dispositions were checked for precedent.

## Decision D-19432

The English lines at IDs 1719 and 48425 are exact duplicates:
`You dare betray me, dove?!`. IDs 5285 and 28129 are also exact duplicates:
`I got a plan, dove. We're doing more than getting our revenge ‒ we're
removing the Hierophant from power, to rule the Travelers no more.` The
English lowercase vocative is a familiar address, not evidence of a name,
age, gender, or romantic relationship. Japanese omits it; Chinese renders
it literally as `和平使者`, which is supporting evidence for the image but
not a Korean naming rule.

The Korean precedent at ID 8174 already renders the familiar `dove` vocative
as `친구` (`Ain't a good time, dove.` → `지금은 때가 아니야, 친구.`).
Using the same neutral Korean address here avoids the unsupported age/gender
implication of `아가씨`, the untranslated name-like reading of `도브(Dove)`,
and the awkward literal bird address. This resolves the address-only holds at
IDs 1719, 48425, and 28129.

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 1719 | `감히 날 배신해, 도브(Dove)?!` | `감히 날 배신해, 친구?!` |
| 48425 | `감히 날 배신하다니, 비둘기야?!` | `감히 날 배신하다니, 친구?!` |
| 5285 | `계획이 있어, 아가씨.` | `계획이 있어, 친구.` |
| 28129 | `계획이 있어, 도브(Dove).` | `계획이 있어, 친구.` |

ID 5285 remains uncertain for the separate canonical rendering/status of
`Hierophant` and `Travelers`; its address correction is linked here and does
not clear or recount that row's remaining uncertainty. The repeated line's
other Korean wording at IDs 5285 and 28129 is not normalized by this decision.

## Structural Checks

- Compared source IDs directly in English, Japanese, Chinese, the preserved
  Japanese-derived Korean draft, and the active Korean CSV.
- Only the four listed active Korean `Texto` values changed. IDs, row order,
  delimiter/schema, BOM, and all line endings were preserved.
- The active CSV retains 72,011 CRLF and 73 bare-LF endings.
- Reversing the four exact substitutions reproduces the byte-identical
  pre-edit backup.

## Verification

- Pre-edit SHA-256:
  `9283e4d07847fecb9daac7a6b4ca9b40b48d7848fd3b7aa5e3d07611e4c30cfa`.
- Post-edit SHA-256:
  `6f80a870f122f45d9e87553e4c76d39e547d6194843dc244b20eec82be5ec513`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-dove-cluster-D19432/locatexts_zh_cn.koalocatext_default.csv`.

Totals: 2,268 accepted / 24,948 `not an issue` / 11,308 uncertain
(38,524). Continue with the deduplicated, evidence-based uncertainty queue;
do not restart a contiguous 50-ID scan.
