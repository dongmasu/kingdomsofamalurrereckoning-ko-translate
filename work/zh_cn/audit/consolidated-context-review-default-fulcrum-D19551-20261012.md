# Consolidated Context Review: Mitharan Frosted Fulcrum (D-19551)

- Date: 2026-10-12; decision D-19551.
- Scope: the remaining `default` D-18027 key 62789.
- English determines meaning; Japanese informs voice/register and Chinese is
  a supporting cross-check. Related base-item and established terminology
  decisions were compared.

## Decision

| ID | Previous Korean | Applied Korean | Disposition | Evidence and rationale |
| ---: | --- | --- | --- | --- |
| 62789 | `완벽한 미사루 서리 지렛대` | `흠 없는 미타란 서리 지렛목` | accepted; closes D-18027 | English default ID 62789 is `Flawless Mitharan Frosted Fulcrum`. Base ID 2127 is the exact corresponding `Flawless Frosted Fulcrum`, translated in the active Korean base CSV as `흠 없는 서리 지렛목`; other `Frosted Fulcrum` base labels at IDs 602, 2065, 3461, and 3823 also use `지렛목`. Add the intervening `Mitharan` modifier as `미타란`, following accepted D-18158/D-18122 and D-1096. D-1189 explicitly distinguishes the cultural adjective Mitharan from deity Mitharu, so `미사루` is not appropriate here. English, Japanese, and Chinese all retain the same Flawless/Frosted/Fulcrum item components. |

## Edit and Integrity

- Accepted edit: default ID 62789 `Texto` only:
  `완벽한 미사루 서리 지렛대` -> `흠 없는 미타란 서리 지렛목`.
- Pre-edit default SHA-256:
  `a227a6b104d324a689b06b36c6f1b29ed27cf6bfca23545b717929b32971f98b`.
- Post-edit default SHA-256:
  `07c8c8bca5d4a2f0c80640ed8df69021759ec627d3d41398433aa511e404cd77`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-mitharan-fulcrum-D19551/locatexts_zh_cn.koalocatext_default.csv`.
- Reversing only the exact ID 62789 `Texto` substitution reproduces the
  backup byte-for-byte. The UTF-8 BOM, 65,135 data rows, row order, physical
  line count, 72,011 CRLF endings, and 73 bare-LF endings are preserved.
- Default totals are **2,458 accepted / 25,349 not an issue / 10,717
  uncertain** (38,524). Seven uncertainties remain: D-18027 IDs 62755,
  62792, 62796, 62797, 62798; D-18038 IDs 62867 and 62869.
- The separate `affix` fallback totals remain 10 accepted / 10
  `not an issue` / 35 uncertain among 55 keys; all 140 fallback keys remain
  10 / 95 / 35. Their active CSV and inventory hashes are unchanged.

These are working dispositions, not independent final linguistic approval.

## Resume

Resume D-19552 at default ID 62755, seeking new context for Kezar
Ten-Fingers and the Varani merchant-princess. The other six remaining
default uncertainties have current grouped reviews; do not repeat them
without new evidence. The separate affix uncertainties also remain open.
