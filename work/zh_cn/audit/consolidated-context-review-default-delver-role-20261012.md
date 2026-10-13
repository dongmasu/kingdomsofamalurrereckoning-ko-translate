# Consolidated Context Review: Delver Role Meanings

- Date: 2026-10-12.
- Decision: D-19459.
- Scope: open House-role questions at `default` IDs 33669, 37094, 42553,
  44689, 58651, and 63584.

## Finding

English IDs 42553 and 63584 explicitly distinguish the roles: Delvers attend
to a Fae's sorrows and the spiritual, while Tenders care for the body and
the corporeal. Japanese and Chinese corroborate that contrast, though their
role nouns differ. This definition resolves function; it does not establish
a single canonical Korean transliteration for `Delver`.

The Korean rows preserve the stated role distinction with meaning-bearing
wording or a source-spelled parenthetical. ID 44689 now retains the exact
English label alongside the plausible Korean `탐굴자` rendering.

| ID | Disposition | Rationale |
| ---: | --- | --- |
| 33669 | Not an issue | `Tender` and `Delver` are presented as the first two roles; Korean preserves both titles and the source spellings. |
| 37094 | Not an issue | Korean preserves service to the Weeping King and the “first of” relation, with both role labels retained. |
| 42553 | Not an issue | Korean directly preserves the spiritual/sorrow versus flesh/corporeal distinction and the body's delivery to the Midden. |
| 44689 | Accepted | Add `(Delver)` to the Korean path label; the English explicitly names one of two House paths and the paired Tender path is already aligned. |
| 58651 | Not an issue | Tenders and Delvers are the two roles; the Korean preserves `돌보는 이들(Tenders)` and `델버들(Delvers)`. A canonical Korean title is not needed to preserve this sentence. |
| 63584 | Not an issue | Korean preserves Alarane's order, House stewardship, and the spiritual/corporeal division; exact role spellings are included. |

Do not recount the three exact Counsel duplicates cleared at D-19443 or the
Tenders correction at ID 58651. Other Delver holds with separate name,
wordplay, or narrative questions remain open. Tenders findings at IDs 31362,
2116, 14987, and 36286 also remain open for their distinct contextual
questions.

## Verification

- Compared the six target keys by ID in English, Japanese source,
  Japanese-derived draft, Chinese, and active Korean; checked definitions at
  IDs 42553 and 63584.
- Only active Korean `Texto` at ID 44689 changed.
- Pre-edit SHA-256:
  `64199c46d05981d9af21ab6e15447dfb618467c8e64ed5a98c73ce189fbf251d`.
- Post-edit SHA-256:
  `ffbb92a4b8b4c76c2f5d0fc03909e1c195c7cc58889dc89b81117742e8986b2d`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-delver-role-D19459/locatexts_zh_cn.koalocatext_default.csv`.
- Reversing the exact substitution reproduces the backup byte-for-byte.
- Totals after D-19459: **2,309 accepted / 25,004 not an issue /
  11,211 uncertain** (38,524). Continue at D-19460 from the explicit,
  deduplicated unresolved queue.
