# Consolidated Context Review: Ivan Hugues References

- Date: 2026-10-12; decision D-19513.
- Scope: unresolved `default` keys 8302, 14539, 15917, 32543, 54475, and
  57355.
- Compared each fixed-ID English, Japanese, Chinese, and active Korean row.
  English determines meaning; Japanese supports voice/name readings; Chinese
  is secondary evidence. Closed Savant-rank keys were not reopened.

## Decisions

| ID | Disposition | Evidence and rationale |
| ---: | --- | --- |
| 8302 | accepted; close D-2309 | The standalone English key is `Ivan Hugues`; Japanese gives `アイヴァン・ヒューズ` and Chinese `伊凡·修格斯`. The active Korean corpus repeatedly uses `이반 휴그` for the same English name (including IDs 1234, 1973, 7350, 10387, 15917, and 51937). Normalize the one-off `아이번` to that established in-project form. |
| 14539 | partial accepted; retain D-4397 | English, Japanese, and Chinese all identify Ivan Hugues in the new-acquaintance sentence. Normalize only `아이반 휴그` to the dominant active form `이반 휴그`; retain the independent Lyenna Crosse spelling question. |
| 15917 | not an issue; close D-4962 | D-19510 already corrected the formal rank/name to `사반트 린`. The row's `이반 휴그`, `미스로스(Mithros)`, and `크라운홀드(Crownhold)` match recurring active Korean forms. English, Japanese, and Chinese agree on the monolith notes, delivery to Reen, and archival destination; no remaining row-local defect is demonstrated. |
| 32543 | partial accepted; retain D-10565 | English and Chinese use Master Ivan Hugues; Japanese independently confirms the personal name. Normalize only `휴그스` to the established `휴그`; retain the separate Master/title and sentence-construction question. |
| 54475 | partial accepted; retain D-16491 | The English row identifies Ivan as a geologist and scholar; Japanese and Chinese confirm the same person and research description. Normalize only `휴스` to `휴그`; retain the independent Hugues-family/context question. |
| 57355 | accepted; close D-17275 | English and Japanese identify scholar Ivan Hugues and delivery to the Great Library in Crownhold. Normalize `아이번 휴스` to `이반 휴그`; the archival and safekeeping meaning is preserved. |

The Korean corpus most often uses `이반 휴그`; this is an internal
consistency precedent, not a claim that the project's official Korean manual
establishes a canonical pronunciation for Hugues. Other name, title, and
family-context concerns remain open only at the partial keys above.

## Applied Text

| ID | Previous Korean fragment | Applied Korean fragment | Disposition |
| ---: | --- | --- | --- |
| 8302 | `아이번 휴그(Ivan Hugues)` | `이반 휴그(Ivan Hugues)` | accepted |
| 14539 | `아이반 휴그(Ivan Hugues)` | `이반 휴그(Ivan Hugues)` | partial |
| 32543 | `이반 휴그스 석학입니다.` | `이반 휴그 석학입니다.` | partial |
| 54475 | `이반 휴스(Ivan Hugues)` | `이반 휴그(Ivan Hugues)` | partial |
| 57355 | `아이번 휴스(Ivan Hugues)` | `이반 휴그(Ivan Hugues)` | accepted |

## Verification

- Six keys reviewed: two fully accepted, one `not an issue`, and three
  partial corrections whose independent uncertainties remain open.
- Pre-edit SHA-256:
  `89545fe708d38fceb8fc4a6aad63700efa7c481b93bc0ec4143b942f2971bc13`.
- Post-edit SHA-256:
  `4b733a978ab6e753b118ddbc18938cdcf8a2301aa94b0eaa30e637550b40a088`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-ivan-hugues-cluster-D19513/locatexts_zh_cn.koalocatext_default.csv`.
- The five exact substitutions reverse to the backup byte-for-byte. UTF-8
  BOM, all 65,135 IDs and their order, 72,011 CRLF endings, and 73 existing
  bare-LF endings were preserved.
- Totals after D-19513: **2,436 accepted / 25,239 not an issue /
  10,849 uncertain** (38,524). The separate 55 provisional extra-`affix`
  uncertainties remain outside this total.

These are working dispositions, not independent final linguistic approval.
