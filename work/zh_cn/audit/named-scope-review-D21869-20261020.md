# D-21869: Source-Variant Name-Term Residuals

Date: 2026-10-20

Review current affix/base/default paired names for isolated Korean variants,
including source forms missed by exact canonical-English matching.

| Source key | Old span | New span | Evidence |
| --- | --- | --- | --- |
| default:541 | 레아나시(Leanashe) | 리아네시(Leanashe) | English spells the creature leanshe; Japanese レナシー corroborates the existing creature interpretation. Chinese omits its name. Reuse the established monster:leanashe spelling. |
| default:18225 | 페이랜드(Faelands) | 패란즈(Faelands) | English Fae lands, Japanese フェイランド and Chinese 灵族大陆 identify the place. The existing glossary cites the official Korean manual for 패란즈. |
| default:53267 | 나로스의 송곳니(Teeth of Naros) | 나로스의 이빨(Teeth of Naros) | English Teeth is a local shortened reference; Japanese explicitly has ナロスの牙. Chinese supports the floating-city travel context without naming the place. Reuse the established place term. |

Only Korean lexical spans change. Preserve source spelling/spacing, the
existing expanded English pairings, narrative, punctuation and line breaks.
No global leanshe, Fae lands or Teeth alias is registered. No entity,
occurrence key, disposition or cumulative count changes. Two existing
index context snapshots at default:18225 are refreshed, retaining both the
Sidhe decision and the D-20713 Fae-race-component exclusion.

`base:4754:11` (Apotyre Stone) is left unchanged: its existing D-20752
exclusion separates the complete item compound from the place entity.
The place spelling alone does not justify modifying this separate item scope.

## Verification

Exact cells and aligned references: `proper-name-edits-D21869.tsv`.
The existing byte-preserving cell editor passed all structural, token,
newline and inverse-reconstruction checks for three default Texto cells.
Index inverse serialization equals its backup; only two context fields
change.

- Default pre-edit SHA-256: `409387c697e74b8a7ecb77024a312a6d1a15b6cccaae994ce2667cfc4e93b09b`.
- Default post-edit SHA-256: `246ab51028d07e149d6cf808f95befac23d7764791dbd25c6bdffdb361c351c4`.
- Index post-edit SHA-256: `1302c1ea118048307f591043f49f17f137d8a92bd0a2e06d69cf0d0d36ad8607`.
- Backups: `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21869`.

No global residual audit, inventory rebuild, release rebuild or game test.
