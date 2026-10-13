# Consolidated Context Review: House of Sorrows Naming Follow-up

- Date: 2026-10-12.
- Decision: D-19484.
- Scope: seven existing `default` uncertainties grouped by the explicit
  `House of Sorrows` name.
- Compared English, Japanese source and draft, Chinese, active Korean,
  prior source-keyed findings, and the accepted definition/name by ID.

## Findings

English ID 39470 defines the House of Sorrows as a collective of Winter Fae.
The accepted Korean name is `비탄의 집(House of Sorrows)` (D-19451).

| Decision | ID | Disposition | Rationale |
| --- | ---: | --- | --- |
| D-19484 | 5643 | not an issue | The English House is described as preserving Winter traditions and as the essence of the Faelands. Korean already uses `비탄의 집` and the established `패란즈`; no name or meaning correction is needed. |
| D-19484 | 36935 | not an issue | Korean `비탄의 집 이야기 퀘스트 완료` preserves the named House and completion of its storyline quests. The concise Korean UI label does not require an English parenthetical. |
| D-19484 | 39922 | accepted | English invites the listener to join the speaker at the House; Japanese and Chinese support the named-group reading. Replace `소로스 가문` with the accepted `비탄의 집(House of Sorrows)` and preserve the invitation and promise to show a strange world. |
| D-19484 | 39984 | accepted | English, Japanese, and Chinese identify the House as ruling the Midden. Replace `소로스 가문` with `비탄의 집(House of Sorrows)`; retain the Winter-Fae cradle and rot/decay description. |
| D-19484 | 50531 | accepted | English calls the House of Sorrows a Fae house; Japanese and Chinese corroborate the Fae-house/family description. Replace the provisional transliteration and awkward repeated loanword with `비탄의 집(House of Sorrows)은 페이의 가문이야`; preserve the mortal address and claim that the Fae do things differently. |
| D-19484 | 54704 | accepted | The English source has the transposition typo `Hosue`, while Japanese and Chinese confirm a House of Sorrows guard. Correct only the Korean faction name to `비탄의 집`; retain `경비병`. |
| D-19484 | 59997 | not an issue | Korean already uses `비탄의 집(House of Sorrows)` and preserves the conditional offer of aid and alliance against Tuatha Deohn. |

## Verification

- All seven IDs were looked up directly in English, Japanese source,
  Japanese-derived draft, Chinese, and active Korean by `ID_Linha`.
- Only `Texto` at IDs 39922, 39984, 50531, and 54704 changed. No runtime
  markers or embedded line breaks occur in those cells.
- Pre-edit SHA-256:
  `843b333e6e621e58ffb8473ed7ed7cce3d1bfac3035f09e94889f9a3b1ae4ebc`.
- Post-edit SHA-256:
  `1228e52ca043009cebaa681a58001e2776470afab808f212372780d450ae3f67`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-house-sorrows-term-cluster-D19484/locatexts_zh_cn.koalocatext_default.csv`.
- Replacing the four exact cells in the backup reproduces the active file
  byte-for-byte. The BOM, 65,135 data records, 72,011 CRLF endings, and 73
  existing bare-LF endings are preserved.
- Seven prior uncertainties were resolved: four accepted corrections and
  three `not an issue`. Totals: **2,361 accepted / 25,144 not an issue /
  11,019 uncertain** (38,524). Resume at **D-19485** from the deduplicated
  unresolved-finding queue.

These are working dispositions, not independent final linguistic approval.
