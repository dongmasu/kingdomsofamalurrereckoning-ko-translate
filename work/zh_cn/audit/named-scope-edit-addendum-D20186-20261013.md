# Edit Addendum D-20186

Before editing, the active default CSV and the byte-identical backup
matched SHA-256
`8948338b778dc8cf9531428d2b6eb3c2411d77a8eada08586e8ad7dd392e8be2`:

`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20186/locatexts_zh_cn.koalocatext_default.csv`

Only the approved Korean `Texto` cells were changed:

- ID 55566: `언덕 땅` to `언덕 지대`.
- ID 55578: `서약방패병(Pledgeshield)가` to `서약방패병(Pledgeshield)이`.
- ID 55594: `미사란` to manual-backed `미타란`; clarified the tears forming the oceans and the sigh forming the Southern Wind; normalized Vraekor to the manual's `브래코르`; and rendered the evening sun as set aflame.

The apply script verified the pre-edit hash and backup, required each
target substring exactly once, and confirmed that inverse replacements
restore the complete original byte stream. The active post-edit SHA-256
is `4e042bd4c20ff2dc6376aa38685b49350ec8de36707159a246d713dead13abf6`.
The UTF-8 BOM, 72,011 CRLF endings, 73 bare-LF endings, row order, and
65,135 IDs remain unchanged. The 50 active IDs parse as two-column CSV
records in all four locales; their marker identities/order match. ID
55594 line breaks remain 11/11/5/16 in Korean/English/Japanese/Chinese,
and all eight localized `{*1...}` markers are preserved in order.

Implementation and checks: `apply-named-scope-D20186.rb`.
