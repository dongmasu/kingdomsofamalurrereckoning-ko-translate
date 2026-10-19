# D-21692: Title-Inclusive Proper-Name Label Corrections

Latest verified proper-name batch: D-21692 (2026-10-18).
Corrected two title-inclusive bilingual labels using aligned English/Japanese/Chinese and established same-scope forms: default:39042 `맨돌프(Mandolph) 대사` -> `맨돌프 대사(Ambassador Mandolph)`; base:1114:11 `대현자 칼레두스(Caledus)` -> `대현자 칼레두스(Archsage Caledus)`. Existing occurrence-index statuses/evidence are preserved; no new key or cumulative count is added.
Next batch: D-21693; continue remaining short-label candidate groups and residual discovery from `proper-name-short-label-discovery-D21689.tsv`, resolving one scoped group at a time.
Indexed matches: 46150; accepted=30890, excluded=3011, not-an-issue=12146, uncertain=103. Unreviewed indexed matches: 0; reviewed uncertain holds: 103. These counts do not measure discovery remaining.
Sequential default review through ID 65134 remains completed and is not recounted.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Active CSV SHA-256:
- affix: `c21fa755fe559f5dd980b79900cb920ee3739b25b7138950e8f54123aa308310`.
- base: `2486607c818c26511fdfe42c1116de1eb6fde8ee41a427a2dd8cb08aacac8a54`.
- default: `9d435ed2e1a658106bd996c078eeee6fc847b3521d1fb9c964099f53ec79bf29`.
Last batch pre-edit backups and byte validation:
- default: 1 cell; pre `691c5a79b4098df00f76ced595ebac4205dbb97469c4d5387eb251a0c4d69865`; post `9d435ed2e1a658106bd996c078eeee6fc847b3521d1fb9c964099f53ec79bf29`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21692/locatexts_zh_cn.koalocatext_default.csv`.
- base: 1 cell; pre `cd2515bd52d278f27f8a890be095038812927d6c6ab8caf3b0d08c913f0e7e27`; post `2486607c818c26511fdfe42c1116de1eb6fde8ee41a427a2dd8cb08aacac8a54`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21692/locatexts_zh_cn.koalocatext_base.csv`.
default: PASS 1 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 9d435ed2e1a658106bd996c078eeee6fc847b3521d1fb9c964099f53ec79bf29
base: PASS 1 cells; 4844 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 2486607c818c26511fdfe42c1116de1eb6fde8ee41a427a2dd8cb08aacac8a54
Last actual CSV-edit backups (retained across no-edit batches):
- affix: 1 cells; pre `9ae001a379b766612293d076eafb5b02a27ac2de70f05f2f98a706f7aef5607c`; post `c21fa755fe559f5dd980b79900cb920ee3739b25b7138950e8f54123aa308310`; backup `/private/tmp/ko-translate-backups/20261017/before-proper-name-D21521/locatexts_zh_cn.koalocatext_affix.csv`.
- default: 1 cell; pre `691c5a79b4098df00f76ced595ebac4205dbb97469c4d5387eb251a0c4d69865`; post `9d435ed2e1a658106bd996c078eeee6fc847b3521d1fb9c964099f53ec79bf29`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21692/locatexts_zh_cn.koalocatext_default.csv`.
- base: 1 cell; pre `cd2515bd52d278f27f8a890be095038812927d6c6ab8caf3b0d08c913f0e7e27`; post `2486607c818c26511fdfe42c1116de1eb6fde8ee41a427a2dd8cb08aacac8a54`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21692/locatexts_zh_cn.koalocatext_base.csv`.
Aligned inventory: 73430 rows; SHA-256 `ed1ebc6d4028c7fe4498e1b208d162e51969e9fb22cd1ca3ca182bb7b3f567b7`.
Occurrence index: 46150 rows; SHA-256 `a8ad27c4142257032f190faba50718df9d56b854fac763ab817c13c6c95c3ba0`.
Proper-name glossary: 2211 entries; SHA-256 `f5f28c5fbb21fc93fcbbbe5a994155819839c90af8288d3346aaed686d2a3b0a`.
Residual bilingual/index audit: PASS; Source/index key differences: missing=0, documented exclusions=0, contextual extras=1064, undocumented extras=0; Source/occurrence comparison: 45086 source matches, 46150 indexed matches, 73430 CSV rows; Terminal matches without a covering bilingual English label: 0.
Data validation: PASS 2211 unique entities; 46150 unique active-aligned occurrences
{"accepted"=>30890, "uncertain"=>103, "excluded"=>3011, "not-an-issue"=>12146}
Report: `work/zh_cn/audit/named-scope-review-D21692-20261018.md`.
Addendum: `work/zh_cn/audit/named-scope-edit-addendum-D21692-20261018.md`.
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21692.tsv`.


## Evidence

- default:39042: D-21692: English explicitly identifies Ambassador Mandolph; aligned Japanese マンドルフ大使 and Chinese 曼多尔夫大使 identify the same complete title/name. The existing Korean name pairing is already correct, but the title-inclusive label was split as 맨돌프(Mandolph) 대사 while the same source label at default:16250 is 맨돌프 대사(Ambassador Mandolph). Standardize only this displayed proper-name label. Preserve the existing person:mandolph accepted status/evidence and do not recount.
- base:1114: D-21692: English explicitly labels Archsage Caledus; aligned Japanese 大賢者カルダス and Chinese 大贤者克雷多斯 confirm the rank/name compound. The person name is already correctly paired, but this standalone base label omits the English rank from its parentheses while base:3019 and default:23576 use the complete 대현자 칼레두스(Archsage Caledus). Standardize only this title-inclusive label. Preserve the existing person:caledus not-an-issue status/evidence and do not recount.
