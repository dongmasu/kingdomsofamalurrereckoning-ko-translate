# Default Scope Review D-19859

2026-10-13. Reviewed all active `default` IDs 38351-38450,
using English as meaning anchor, Japanese for voice and Chinese
as supporting evidence, plus the official Korean manual and prior
terminology decisions. All 100 rows align across the four locale
files, each with 65,135 ordered IDs. No PAK-derived source was used.

Thirteen D-19667 exact source keys in this range match the current
English/Japanese/Chinese fields (13/13 in each locale).
The accepted 38382 Crow finding remains applied; the other twelve
are terminal `not an issue`, with no reclassification or recounting.

| IDs | Result | Evidence |
| ---: | --- | --- |
| 38396 | Subsequent name-term correction within a three-paragraph narrative | English `Kollossae` appears twice, `Idylla` once and `Beckoned` once. Use the already accepted `콜로사이` (D-19855), `이디라` (D-19842/50) and `부름받은 자` (D-692). Preserve all other text and paragraph breaks. |
| 38427 | Subsequent Idylla spelling correction | English place name `Idylla`; replace `이딜라` with accepted `이디라`. |

The remaining 98 rows retain their prior readings and dispositions.
Official-manual PDF p. 2 confirms `미사루` in 38398 and
`에테네` in 38409. The `former staff` at 38403 remains `신하들`:
the Japanese `臣下` supports the role in this setting, while Chinese
uses generic staff. No unsupported revision is imposed on the
source's duplicated `{3}` marker in 38383. Global category totals
remain unreconciled; the separate affix 55 are closed by D-19565.

Pre-edit SHA-256:
`05093b6fbde2bdd5ed8779e30b0a19fea90c64ae3828c63d5ce175555d34469e`.
Byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19859/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`796abd3d00c31bccab551327c4620897d3e509b564e2430113556aa944870b5f`.
Exact inverse reconstruction verified that only the two targeted
`Texto` cells changed. UTF-8 BOM, 72,011 CRLF, 73 existing bare-LF
endings and all row IDs remain intact.

Last reviewed ID 38450; next D-19860 / IDs 38451-38550.
26,684 actual default rows remain through 65134; review incomplete.
