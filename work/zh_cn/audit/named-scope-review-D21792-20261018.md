# D-21792: Savant Short-Label And Title Pairing

Date: 2026-10-18

## Scope

Latest verified proper-name batch: D-21792 (2026-10-18).
Reviewed the `Savant` and `Savant Aethan Engar` short-label candidates at two distinct source keys. Added only the missing English rank/title labels: default:58585: `사반트` -> `사반트(Savant)`; default:47690: `사반트 에이선 엥가르(Aethan Engar)` -> `사반트 에이선 엥가르(Savant Aethan Engar)`.
D-19509's standalone-rank translation closure and the existing D-19512/D-20831 Aethan identity disposition remain unchanged; no indexed status or cumulative match count was reopened or recounted.
Next batch: D-21793; continue the refreshed short-label candidate snapshot `proper-name-short-label-discovery-D21792.tsv` (52 bounded groups; first `Sceptre`; not exhaustive or a completion estimate).
Indexed matches: 48102; accepted=32358, excluded=3184, not-an-issue=12449, uncertain=111.
Remaining unreviewed indexed matches: 0; reviewed unresolved indexed holds: 111. These focused index counts do not measure discovery remaining.
Sequential default review through ID 65134 remains completed and is not recounted.
Full proper-name discovery/residual validation remains incomplete; do not claim overall completion.
Candidate dispositions: `work/zh_cn/audit/proper-name-short-label-dispositions-D21792.tsv`.
Candidate snapshot: `work/zh_cn/audit/proper-name-short-label-discovery-D21792.tsv`.
Active CSV SHA-256:
- affix: `ad71ac980b05288bef4c2adef5b6a272a16fce8f995f4e7956bfdf8c3df3196c`.
- base: `7c7c28c72f7a7e4991e90c1f0a0dc38ead3120d92c37be70601adc27d08c81bd`.
- default: `67d886985562b53062284511ff330e85b62289cfb8f9fe2e4a5e325b0d151c58`.
Last batch pre-edit backup and byte validation:
- default: 2 cells; pre `d9ebb5c97f03e1442c57b8107d17375cce3e717f7daf67569fab363354a908ca`; post `67d886985562b53062284511ff330e85b62289cfb8f9fe2e4a5e325b0d151c58`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21792/locatexts_zh_cn.koalocatext_default.csv`.
default: PASS 2 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 67d886985562b53062284511ff330e85b62289cfb8f9fe2e4a5e325b0d151c58
Last actual CSV-edit backups (retained across no-edit batches):
- affix: 12 cells; pre `6c493c8da944fcfd510290a66a512d5cbba2fc848f33de80927ba976f4c6ac8b`; post `ad71ac980b05288bef4c2adef5b6a272a16fce8f995f4e7956bfdf8c3df3196c`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21762/locatexts_zh_cn.koalocatext_affix.csv`.
- base: 2 cells; pre `692ba1bdf2d9e1ae21ad5a0aacac8e2c89c44dcb398b1ccc95397aa11122eb80`; post `7c7c28c72f7a7e4991e90c1f0a0dc38ead3120d92c37be70601adc27d08c81bd`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21791/locatexts_zh_cn.koalocatext_base.csv`.
- default: 2 cells; pre `d9ebb5c97f03e1442c57b8107d17375cce3e717f7daf67569fab363354a908ca`; post `67d886985562b53062284511ff330e85b62289cfb8f9fe2e4a5e325b0d151c58`; backup `/private/tmp/ko-translate-backups/20261018/before-proper-name-D21792/locatexts_zh_cn.koalocatext_default.csv`.
Aligned inventory: 73430 rows; SHA-256 `fec73fcf0789ba313cc17b439f835b4c30babf24866c86dbce51eda4ae0a2290`.
Occurrence index: 48102 rows; SHA-256 `a8f85893d826900d54158541cba30a3c1e13b71b14241ddedc07129cc100d725`.
Proper-name glossary: 2308 entries; SHA-256 `ec0e56e9e6b6397c60bbab0f45d880729e58ae9e326ed4e6ccad66397390af06` (unchanged).
Residual bilingual/index audit: PASS; Source/index key differences: missing=0, documented exclusions=0, contextual extras=1064, undocumented extras=0; Source/occurrence comparison: 47038 source matches, 48102 indexed matches, 73430 CSV rows; Terminal matches without a covering bilingual English label: 0.
Data validation: PASS 2308 unique entities; 48102 unique active-aligned occurrences
{"accepted"=>32358, "uncertain"=>111, "excluded"=>3184, "not-an-issue"=>12449}
Exact source comparison manifest: `work/zh_cn/audit/proper-name-edits-D21792.tsv`.


## Evidence

English establishes `Savant` as the displayed formal rank; D-18268
fixes its Korean form as `사반트`. The Japanese `一級魔道師` supports
the formal mage-rank reading, while Chinese `博学者` is corroborative
and does not override English. The Aethan Engar title/name spelling
follows the established complete label at default:18347, 54082, and
760. This batch adds only missing English display labels. D-19509's
translation closure at default:58585 and D-19512/D-20831's person
disposition at default:47690 remain terminal; no index status or
historical count is changed.

- `default:58585:`: `사반트` -> `사반트(Savant)`. D-19509 closes the translation/rank finding as not-an-issue: the formal rank is already rendered 사반트. This follow-up addresses only the separate bilingual-label requirement; it does not reopen the rank or translation judgment.
- `default:47690:`: `사반트 에이선 엥가르(Aethan Engar)` -> `사반트 에이선 엥가르(Savant Aethan Engar)`. D-19512/D-20831 establish the rank and canonical person spelling. Preserve the terminal person:aethan-engar disposition; add only the omitted English rank to this complete displayed title/name label.
