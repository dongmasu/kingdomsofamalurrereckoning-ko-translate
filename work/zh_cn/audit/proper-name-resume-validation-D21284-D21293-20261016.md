# D-21284-D-21293: Resumed Proper-Name Verification

Date: 2026-10-16

Reviewed 179 entity/row occurrences in 178 distinct CSV row keys.
Changed 126 cell edit events in 125 distinct CSV cells.
Repeated row default:53181 concerns two distinct entities in D-21292 and D-21293; count it once for unique-row coverage.
These are this run's focused scopes, not global translation totals or an overall completion percentage.

PASS: inverse chain reconstructed every initial CSV hash.
PASS: removing only the 179 new occurrence keys and restoring initial Korean snapshots reproduces the exact 37,444-row D-21283 index SHA-256 `9ee9dfdffe2b42acb34d26be47078529d5ac521fbc02cfb610c99a5fc091f3dc`.
PASS: removing only 11 new glossary records reproduces the exact 1,243-entry initial glossary SHA-256 `4c75cccc05c695613d1313c0e4c23d024c6debb5b3d66a7f9e9e2e2f13114038`.
Thus the original index dispositions/evidence and glossary entries were preserved byte-for-byte after snapshot reconstruction.
PASS: protected default:51702 is unchanged and not recounted.
PASS: all five current checkpoint blocks agree on D-21293, next D-21294, and the active CSV hashes.
The two provisional source-form records remain unresolved for identity, separately from indexed occurrence holds.
Full proper-name discovery remains incomplete. No build, archive inspection, game test, commit or push was performed.

## Data Validation

```text
PASS 1254 unique entities; 37623 unique active-aligned occurrences
{"accepted"=>25090, "excluded"=>2274, "not-an-issue"=>10230, "uncertain"=>29}
```

## Inverse Byte Verification

```text
PASS D-21293 default: 6 Texto cells; 65135 ordered rows; exact masked bytes, BOM/line endings, and inverse backup
PASS D-21292 default: 13 Texto cells; 65135 ordered rows; exact masked bytes, BOM/line endings, and inverse backup
PASS D-21291 default: 2 Texto cells; 65135 ordered rows; exact masked bytes, BOM/line endings, and inverse backup
PASS D-21290 base: 1 Texto cells; 4844 ordered rows; exact masked bytes, BOM/line endings, and inverse backup
PASS D-21290 default: 2 Texto cells; 65135 ordered rows; exact masked bytes, BOM/line endings, and inverse backup
PASS D-21289 base: 1 Texto cells; 4844 ordered rows; exact masked bytes, BOM/line endings, and inverse backup
PASS D-21289 default: 33 Texto cells; 65135 ordered rows; exact masked bytes, BOM/line endings, and inverse backup
PASS D-21288 base: 3 Texto cells; 4844 ordered rows; exact masked bytes, BOM/line endings, and inverse backup
PASS D-21288 default: 1 Texto cells; 65135 ordered rows; exact masked bytes, BOM/line endings, and inverse backup
PASS D-21287 default: 21 Texto cells; 65135 ordered rows; exact masked bytes, BOM/line endings, and inverse backup
PASS D-21286 default: 3 Texto cells; 65135 ordered rows; exact masked bytes, BOM/line endings, and inverse backup
PASS D-21285 default: 6 Texto cells; 65135 ordered rows; exact masked bytes, BOM/line endings, and inverse backup
PASS D-21284 default: 34 Texto cells; 65135 ordered rows; exact masked bytes, BOM/line endings, and inverse backup
Verified edit events by resource: {"default"=>121, "base"=>5}
Reconstructed pre-D-21284 hashes:
affix: a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586
base: 8486262cc98e9b186c8c8fe64c0cae6b529b40d8edae3cff538c5256759826cb
default: 02c068fd28edc475fbd6b70136314c943f5685095d5726df2513de4737727c56
```
