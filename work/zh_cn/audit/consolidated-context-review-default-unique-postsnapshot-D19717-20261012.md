# Unique-Key Review: D-5308 to D-5412 (D-19717)

- Date: 2026-10-12.
- Previously completed D-19654 snapshot IDs excluded before
  selecting these ten actual open keys: 16895-16896,
  16979-16980, 16990-16991, 17115-17116,
  17180-17181 (D-5308, D-5336, D-5339,
  D-5390, D-5412). No closed snapshot key recounted.
- English/Japanese/Chinese/active Korean checked by exact
  ID. English governs meaning; Japanese informs tone;
  Chinese supports familial affiliation and UI error
  reading. Manual extraction consulted for Fate/setting;
  no PAKs.

## Decision

- `accepted` (1): ID 16990 `스코리아인들처럼
  그들도 자기 길을 택했다` -> `그들도 자기 길을 택했다.
  우리 스코리아인들처럼`. English `as we did Skorias`
  and Chinese `我们斯考瑞亚家族` identify the
  speaker's own group; the old third-person phrasing
  detached the speaker from the Skorias.
- `not an issue` (9): 16895-16896 (Chaos God
  name/household claim), 16979-16980 (Fate and
  Destiny effects), 16991 (Winter King's jester;
  parallels the source at 16192), 17115-17116
  (rite and Cras threat), 17180-17181 (continue
  prompt and failed erase/save-disable UI). Runtime
  question and combat-effect meanings are preserved.
  Japanese and Chinese disagree on `his house`;
  generic Korean `집` follows English without
  choosing a narrower family or building.

## Integrity and Resume

- Pre-edit SHA-256
  `abe79778c10c70aa427f29505aff05bad5bd46c23d7fbc83a7faa515f5383cc1`.
- Byte-identical backup
  `/private/tmp/ko-translate-backups/20261012/before-skoria-speaker-D19717/locatexts_zh_cn.koalocatext_default.csv`.
- Active SHA-256
  `27cb13f3c6d4a047c560f9774c95fc01db40608d70bf8e1196144d3e7605c8d8`.
- Exact inverse reproduces backup; BOM, 72,011
  CRLF, 73 existing bare LF, row count/order
  and all other bytes unchanged.
- Corrected totals (after D-19716):
  **3,383 accepted / 33,813 not an issue / 1,328 uncertain**
  (38,524). Next candidate outside completed 200-key
  snapshots: D-5614 / ID 17711. Verify later
  focused closures before counting it.
