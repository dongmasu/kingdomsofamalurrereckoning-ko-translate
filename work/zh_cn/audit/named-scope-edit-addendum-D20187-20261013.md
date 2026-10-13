# Edit Addendum D-20187

Before editing, the active default CSV and byte-identical backup matched
SHA-256
`4e042bd4c20ff2dc6376aa38685b49350ec8de36707159a246d713dead13abf6`:

`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20187/locatexts_zh_cn.koalocatext_default.csv`

Only the following Korean `Texto` cells changed:

- ID 55609: `브레이코르의 격노(Fury of Vraekor)` to `브래코르의 격노(Fury of Vraekor)`, using the official manual form. The earlier D-16793 `not an issue` disposition remains terminal; this terminology follow-up is not recounted.
- ID 55620: `갤러스 엔드(Gallows End)` to `갤로우스 엔드(Gallows End)`, using the accepted named-place spelling at D-10903/D-11264 and D-19825.

The apply script verified the pre-edit hash and backup, required each
target string exactly once, and confirmed that inverse replacements
restore the complete original byte stream. The active post-edit SHA-256
is `289a526b23484d2be8763b368c1133dd3edda06501677bae0e47b96c31072cdf`.
The UTF-8 BOM, 72,011 CRLF endings, 73 bare-LF endings, row order, and
65,135 IDs remain unchanged. The 50 active IDs parse as two-column CSV
records in all four locales; line-break counts and runtime-marker
identities/order match. ID 55602 retains all values 15%, 50, 5, and 25%;
only Chinese presents the duration number before the damage value.

Implementation and checks: `apply-named-scope-D20187.rb`.
