# Consolidated Context Review: House of Sorrows Lore References

- Date: 2026-10-12.
- Decision: D-19485.
- Scope: `default` IDs 39470, 39489, and 39589, grouped under the direct
  House-of-Sorrows definition at ID 39470.
- Compared English, Japanese source and draft, Chinese, active Korean, and
  the accepted canonical name from D-19451.

## Findings

English ID 39470 explicitly defines the House of Sorrows as a collective of
Winter Fae opposed to the Tuatha. Japanese independently calls it a group of
Winter Fae, and Chinese identifies the House as a group/family of Winter
spirits. The accepted Korean name is `비탄의 집(House of Sorrows)`.

| Decision | ID | Disposition | Rationale |
| --- | ---: | --- | --- |
| D-19485 | 39470 | accepted | Replace `비탄의 가문` with the approved `비탄의 집(House of Sorrows)` in the direct definition. The collective, Midden location, Winter Fae identity, and conflict with the Tuatha remain unchanged. |
| D-19485 | 39489 | accepted | English's capitalized `The House`, Japanese's explicit House of Sorrows, and Chinese's group name identify the same faction. Replace generic `가문` with `비탄의 집(House of Sorrows)`; preserve the collapse threat and the request for someone to help. |
| D-19485 | 39589 | accepted | English and both supporting locales explicitly identify the House of Sorrows. Replace `비탄의 가문` with `비탄의 집(House of Sorrows)`; preserve the relics and the despair threatening the House. |

## Verification

- All three IDs were matched directly across English, Japanese source,
  Japanese-derived draft, Chinese, and active Korean.
- Only `Texto` at IDs 39470, 39489, and 39589 changed. No runtime markers
  or embedded line breaks occur in the target cells.
- Pre-edit SHA-256:
  `1228e52ca043009cebaa681a58001e2776470afab808f212372780d450ae3f67`.
- Post-edit SHA-256:
  `83503852fe5b0f6be04a358bd91883235d5d001550464456a76ab5b1fc928d9d`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-house-sorrows-core-lore-D19485/locatexts_zh_cn.koalocatext_default.csv`.
- Replacing the three exact cells in the backup reproduces the active CSV
  byte-for-byte. The BOM, 65,135 data records, 72,011 CRLF endings, and 73
  existing bare-LF endings are preserved.
- Three prior uncertainty findings were accepted and corrected. Totals:
  **2,364 accepted / 25,144 not an issue / 11,016 uncertain** (38,524).
  Resume at **D-19486** from the deduplicated unresolved-finding queue.

These are working dispositions, not independent final linguistic approval.
