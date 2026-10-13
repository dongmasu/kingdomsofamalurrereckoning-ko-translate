# Edit Addendum D-19868

| ID | Before | After | Reason |
| ---: | --- | --- | --- |
| 39252 | `상주 양조장이야` | `상주 양조사야` | Translate resident brewmaster as the person, not an establishment; retain the correct Korean copula ending. |
| 39253 | `역사적 유물이 풍부한` | `역사적 자료가 풍부한` | Avoid narrowing historical resources to relics/artifacts; retain the correct subject particle. |
| 39255 | `브레이코르` (3 occurrences) | `브래코르` (3 occurrences) | Apply the official Korean manual's Vraekor form, PDF p. 2. |
| 39270 | `타락했고,` / `그로써 자유를 빼앗겼다.` | `타락시켰고,` / `그로써 자유를 빼앗았다.` | Restore the Maid as agent; preserve the English omission and verse breaks. |
| 39279 | `대검으로` | `그레이트소드로` | Apply the official Korean manual's Greatsword form, PDF p. 7, with the correct Korean particle. |
| 39288 | `하이페리온` | `하이페리언` | Reuse accepted Hyperian spelling D-19584/D-19722. |
| 39299 | `콜로새` | `콜로사이` | Reuse later accepted Kollossae spelling D-19573. |
| 39321 | `각 구매자에게` | `평판 좋은 구매자들에게` | Preserve the `respected` quality in English and both supporting locales. |

`apply-named-scope-D19868.rb` enforces that all edit IDs are within
39251-39350, verifies the active pre-edit SHA-256, and makes the
byte-identical backup immediately before writing.

## Follow-Up Inflection Check

Post-edit reading caught three particle/junction issues introduced by
the first pass. `apply-named-scope-D19868-followup.rb` corrected them:

| ID | First-pass form | Final form |
| ---: | --- | --- |
| 39252 | `상주 양조사이야` | `상주 양조사야` |
| 39253 | `역사적 자료이 풍부한` | `역사적 자료가 풍부한` |
| 39279 | `그레이트소드으로` | `그레이트소드로` |

The byte-identical pre-follow-up backup is
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19868-followup/locatexts_zh_cn.koalocatext_default.csv`.

Pre-edit SHA-256:
`27715acf05bb289275a4d1507560f5f387654055147f38b9d574c3c22ddfc1bd`.
Backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19868/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`dc72d6b0c6d461aa6dfc01f7300cb5c7fd1274044f91377829d5c2790f766f17`.
Staged inverse reconstruction verified that all bytes outside these eight
target `Texto` cells were preserved. BOM, mixed line endings, ordered IDs
and four-locale alignment were also verified.

No other CSV cells were changed. D-12550, D-12552, D-12554, D-12557 and
D-19668's accepted ID 39317 were verified in their current state without
duplicate classification. Resume at D-19869 / IDs 39351-39450.
