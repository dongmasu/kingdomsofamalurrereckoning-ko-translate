# Grouped Default Uncertain Review: D-19668

**Correction:** IDs 39884 and 40370 end in `미타란`, not
`미사루식`; refer to
`consolidated-context-review-default-mitharan-corrigendum-D19670-D19671-20261012.md`.
The post-edit hash below describes this batch's historical checkpoint.

Reviewed 200 source-keyed English, Japanese, Chinese and Korean records
from `uncertain-200-D12543-D13086-20261012.jsonl`, grouped by
faction, named role and contextual meaning. English anchors meaning;
Japanese informs voice, Chinese supplies corroboration. Used the
extracted official Korean manual (printed pp. 2, 7, 13-14) and prior
approved term decisions. No PAK files used.

| ID | Approved change | Basis |
| --- | --- | --- |
| 39317 | `내 사랑` -> `친구` | Dove is a familiar address; neither Japanese nor Chinese supplies romantic meaning. |
| 39521 | `라시르` -> `라시어` | Established Rathir form. |
| 39544 | `가로우즈 엔드` -> `갤로우즈 엔드` | Established Gallows End place name. |
| 39700, 39723, 39910, 42707 | `복수의 가문`, `용맹의 가문`, `하우스 오브 소로우즈` -> `복수의 집`, `용맹의 집`, `비탄의 집` | Named Houses of Vengeance, Valor and Sorrows; avoid conflating the House with Sorrows as a power. |
| 39884, 40370 | `미사란` -> `미사루식` | Mitharan equipment adjective; official manual's deity name `미사루` and existing active item terminology. |
| 40089 | `플레지실드` -> `서약방패병` | Established Pledgeshield rank. |
| 42460 | `여행자`, `여행자 야영지` -> `트래블러`, `트래블러 야영지` | English explicitly names the Travelers thieves' faction and Japanese names the same organization. |
| 42554 | `노움 근위병` -> `노움 프레토리안` | Named gnomish Praetorian rank. |
| 42707 | `투아타` -> `투아사` | Established Tuatha faction name; same passage names House of Sorrows. |

**12 accepted / 188 not an issue / 0 newly retained** in this
200-key batch. The other Korean readings either follow English or
have no substantiated row-local correction; e.g. the official manual
confirms `대장기술` at 42752, and `바실리카 노스트라` at 39802
remains a source-traceable institution reading despite differing
locale transliterations.

Pre-edit SHA-256:
`4e5ef51a298d4c94b86b48c623026bc3d1e9732be1e53d904f5ab88b5b717cfd`.
Byte-identical backup:
`/private/tmp/ko-translate-backups/20261012/before-uncertain-200-D19668/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`52b1d3cd174daec6e30f4c65e7d939cc1a7b93f865f927ba26076c1c3f3f3f84`.
Applicator `REVIEW_BATCH=D19668 ruby work/zh_cn/audit/apply-uncertain-200-D19657.rb`
verified exact source-key agreement (200 each locale), inverse
reconstruction, BOM, mixed newline counts, row order, and unchanged
bytes outside approved `Texto` replacements.

Totals **3,086 accepted / 30,536 not an issue / 4,902 uncertain**
(38,524); affix 55 closed D-19565, default still incomplete.
