# Consolidated Context Review: House of Pride

- Date: 2026-10-12.
- Decision: D-19488.
- Scope: nine independently listed `default` House of Pride findings.
- English directly identifies the same named House in all nine. Japanese
  transcribes it consistently, Chinese treats it as a named family/group, and
  active Korean ID 51471 already supplies `긍지의 집(House of Pride)`.
  Compare the established House-of-Sorrows/Ballads naming convention without
  equating the distinct groups.

| IDs | Result | English-led reasoning |
| --- | --- | --- |
| 31176, 35174, 52864, 55762, 57486, 58822 | accepted | Normalize competing `가문`, `하우스`, `자부심`, `프라이드`, and `전당` names to the established `긍지의 집(House of Pride)`. The first speaker's reluctance to be saved by a mortal, the beacon image, and the restored free/pure status remain intact. Closes D-10103, D-11400, D-16048, D-16828, D-17308, D-17783. |
| 42956 | accepted; close D-13151 | English states only Ventrinio can breach the House's defenses; Japanese and Chinese corroborate it. D-13151 deferred only the competing House-name forms. Normalize `긍지의 하우스` and retain the rest unchanged. |
| 48999, 51471 | not an issue | The standalone ID 48999 already says `긍지의 집`; ID 51471 already includes the exact English parenthetical. Both preserve the named House without forcing identical display length. Closes D-14996 and D-15683. |

The other House-of-Pride findings with independent questions (e.g. Knave of
Pride, chantry, Dren, and UI objective relations) are not silently closed.

## Verification

- All nine IDs were compared by ID across English, Japanese original and
  draft, Chinese, and active Korean. The seven edited cells have no embedded
  newline or runtime marker.
- Pre-edit SHA-256:
  `ba22ef09faa03f98a7c511a1f57d7dea4f900c38bd1d342b89a82535e54c09fe`.
- Post-edit SHA-256:
  `8a3beb7092fc2f329ae49ad6ac165765411a7d42e63052eb784445fe10859021`.
- Byte-identical backup:
  `/private/tmp/ko-translate-backups/20261012/before-house-pride-cluster-D19488/locatexts_zh_cn.koalocatext_default.csv`.
- `apply-house-pride-D19488.py` validates original bytes/hash and replaces
  exactly one verified substring on each of seven distinct ID lines. BOM,
  72,011 CRLF and 73 original bare-LF endings remain unchanged.
- Seven counted uncertainties accepted and two resolved without edits.
  Totals: **2,374 accepted / 25,149 not an issue /
  11,001 uncertain** (38,524). Resume **D-19489** from grouped
  unresolved findings.

Working dispositions, not independent final linguistic approval.
