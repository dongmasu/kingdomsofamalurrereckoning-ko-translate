# Edit Addendum D-20223

Verified active SHA-256
`6b5e29e9dc7d184f7e62f0699cd2cbf5ec6fd6768ddb74e0af81b0ba2a009d11`
and byte-identical pre-edit backup
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D20223/locatexts_zh_cn.koalocatext_default.csv`
immediately before changing three Korean `Texto` cells:

- 57407: `미사란의 전설적인` -> `미타란의 전설적인`
  (Mitharans, accepted adjective/people form; not god Mitharu).
- 57437: `유언장 결사(Testament)` ->
  `테스타먼트(Testament)`.
- 57438: `유언장 결사,` -> `테스타먼트,`.
  The Testament is a named group, not a will (D-19574; D-19686/57100).

`apply-named-scope-D20223.rb` verified inverse non-target bytes,
BOM, mixed line endings, all 65,135 ordered IDs, and 50 four-locale
keys/breaks/markers. Post-edit SHA-256:
`f24f6ff2d220b7bef7f09d13c52d46ffc7afca1c52fce6ddb621710261dcebd7`.
