# Consolidated Context Review: Explicit House of Sorrows

- Date: 2026-10-12.
- Decision: D-19486.
- Scope: `default` IDs 49422, 57442, and linked ID 65045.
- English is the meaning anchor; Japanese source and draft are register/name
  cross-checks; Chinese is supporting evidence. D-19451 and English ID 39470
  establish `비탄의 집(House of Sorrows)` as the collective's Korean name.

| ID | Result | Evidence |
| ---: | --- | --- |
| 49422 | accepted; close D-15078 | English and Japanese explicitly name the House while accusing its members of treating bodies as sacred; Chinese likewise names the group. Change only `슬픔의 집은` to the established form. Keep the accuser's hostile rhetorical question. |
| 57442 | accepted; close D-17298 | English explicitly calls him the first and greatest of the House, a Fae offered to Winter. Japanese and Chinese corroborate the collective. Change only `슬픔의 전당의` to the established House name, not the individual or offering. |
| 65045 | name-only correction; D-18156 group remains uncertain | English explicitly identifies the House alongside the Winter Fae as victims of Tuatha malice; Japanese and Chinese corroborate it. Change `소로우의 집은` only. D-18156 includes seven other distinct keys and questions, which are not adjudicated here; no count adjustment for this grouped key. |

The ten standalone labels from D-19447 were already resolved by D-19451;
none is recounted. Capitalized `the Sorrows` without an explicit `House`
remains outside this decision.

## Verification

- Each key was matched by ID across English, Japanese source, Japanese-derived
  Korean draft, Chinese, and active Korean. No target cell contains an embedded
  newline or runtime marker.
- Pre-edit SHA-256:
  `83503852fe5b0f6be04a358bd91883235d5d001550464456a76ab5b1fc928d9d`.
- Post-edit SHA-256:
  `b91de2555b9bf7afc7a076bc8465a0fd2d42b1247fed066e3c100abdfd8f3642`.
- Byte-identical backup:
  `/private/tmp/ko-translate-backups/20261012/before-house-sorrows-final-refs-D19486/locatexts_zh_cn.koalocatext_default.csv`.
- `apply-house-sorrows-D19486.py` asserts the backup bytes/hash, unique ID
  lines, and unique old phrase per line before replacing only the three
  specified `Texto` substrings. BOM, 72,011 CRLF and 73 existing bare-LF
  endings are unchanged.
- Two previously counted uncertainties accepted and corrected; the linked
  group remains open. Totals: **2,366 accepted / 25,144 not an issue /
  11,014 uncertain** (38,524). Resume at **D-19487** from unresolved
  findings, not sequential source rows.

These are working dispositions, not final independent linguistic approval.
