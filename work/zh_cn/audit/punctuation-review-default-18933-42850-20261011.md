# Targeted Punctuation and Selector Review: `default` IDs 18933 and 42850

- Date: 2026-10-11
- Decision: D-18203
- Scope: two user-identified `default` keys
- Disposition: accepted; supersedes the earlier `not an issue` dispositions

## Decisions

| ID | English | Japanese source | Chinese source | Before | Applied |
| ---: | --- | --- | --- | --- | --- |
| 18933 | `Auto. ($STR0)` | `自動($STR0)` | `自动（$STR0）` | `자동. ($STR0)` | `자동 ($STR0)` |
| 42850 | `Yes` | `はい` | `是` | `네.` | `예` |

At ID 18933, the English period is internal to the label-plus-variable
string, and the previous Korean mirrored it. The user requested a specific
exception: omit the period after `자동` while preserving the space and
`$STR0` marker.

ID 42850 is the affirmative choice in a system Yes/No selector. The user
selected `예` as the more polite standard Korean form. This also aligns with
the other active Korean rendering of the exact English `Yes` at ID 46876.

## Scope Check

A mechanical scan of all 65,135 active `default` rows found 233 keys where
Korean ends in a period while English has no terminal punctuation. Of these,
136 also have no terminal punctuation in either Japanese or Chinese. These
are candidates only, not confirmed defects: complete Korean sentences and
imperatives commonly use a period even when the English source omits one.
No automatic punctuation stripping was applied. D-18203 changes only the
two keys listed above.

## Edit and Verification

| Check | Result |
| --- | --- |
| Pre-edit SHA-256 | `58d4b88f79266b94f30af1bcb86d1b38d7d5407d859c3effbae49f3cfd51995c` |
| Post-edit SHA-256 | `e6baa895a059ae0de03aad514db5354049b877cc6d49ef34178cc8de560af2e7` |
| Byte comparison | Exactly the two authorized cell replacements |
| Runtime marker | `$STR0` preserved exactly |
| CSV structure | UTF-8 BOM, row order, and all existing CRLF/bare-LF endings preserved |
| Backup | `/private/tmp/ko-translate-backups/20261011/before-default-18933-42850-20261011/locatexts_zh_cn.koalocatext_default.csv` |

The two keys were previously included in `not an issue` totals under D-5977
and D-13112. D-18203 reclassifies those same keys as accepted; it does not
increase the unique-disposition count. Cross-resource totals are now 1,905
accepted, 22,910 `not an issue`, and 13,707 uncertain (38,522 total); next
decision: D-18204.
