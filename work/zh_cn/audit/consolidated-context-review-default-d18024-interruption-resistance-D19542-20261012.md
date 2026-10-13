# Consolidated Context Review: Interruption Resistance (D-19542)

- Date: 2026-10-12; decision D-19542.
- Scope: residual `default` D-18024 ID 62744.
- Compared English meaning, Japanese mechanics explanation, Chinese
  supporting evidence, active Korean, and exact in-corpus combat-term
  precedents.

## Decision

| ID | Disposition | Evidence and rationale |
| ---: | --- | --- |
| 62744 | accepted | English calls the effect `resistance to interruption`; Japanese explicitly says enemy attacks will no longer interrupt the player's actions. The exact English term `Interruption Resistance` already appears at ID 12982 and is translated in the active Korean as `행동 방해 저항`. `Stagger immunity` is separately translated as `경직 면역` at ID 3858, so `경직 저항` conflates distinct combat effects. Change only the target term and retain the armor tradeoff, duration, and increased damage. |

## Accepted Text Edit

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 62744 | `방어력을 희생하는 대신 잠시 경직 저항을 얻습니다. 공격을 맞아도 버틸 수 있지만 약간 더 큰 피해를 받습니다.` | `방어력을 희생하는 대신 잠시 행동 방해 저항을 얻습니다. 공격을 맞아도 버틸 수 있지만 약간 더 큰 피해를 받습니다.` |

## Verification

- D-19542 reviewed one key: one accepted edit; no `not an issue` or
  uncertain dispositions.
- Pre-edit SHA-256:
  `aa1f1b6566dec8b3e729ab8ceaed361774398ffadb4041e413a7aae035aa1732`.
- Post-edit SHA-256:
  `e7365d79061560e46c8cb845b3f7f8b5a782b3c763800a530b893c6311897292`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-interruption-resistance-term-D19542/locatexts_zh_cn.koalocatext_default.csv`.
- Reversing only the approved `Texto` substitution reproduces the backup
  byte-for-byte. The UTF-8 BOM, all 65,135 ordered IDs, 72,011 CRLF
  endings, and 73 pre-existing bare-LF endings remain unchanged.
- No source, preserved Japanese-work, build, or distribution files changed.
- Totals: **2,456 accepted / 25,348 not an issue / 10,720 uncertain**
  (38,524). Resume D-19543 at ID 62755 in D-18027. Remaining default
  uncertainties: D-18027 62755, 62789, 62792, 62796, 62797, 62798;
  D-18038 62867, 62869, 62897, 62899. The separate 55 Chinese-only
  provisional `affix` uncertainties remain outside these totals.

These are working dispositions, not independent final linguistic approval.
