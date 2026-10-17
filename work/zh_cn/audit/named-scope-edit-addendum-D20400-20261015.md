# D-20400 Edit Addendum: Magnus Personal Names

Applied 39 reviewed `Texto` edits from 48 distinct `default` row keys; nine
were retained as `not-an-issue`. Linked personal-name occurrence records for
Tyr Magnus and Hroth Magnus were reconciled with the row-level decisions.

| Resource | Pre-edit SHA-256 | Post-edit SHA-256 |
| --- | --- | --- |
| `default` | `f66c7ee1f049960a34d94bd652eeaa759fff6596dd13f10434bb17f7fa48560c` | `d5b5b782fe9c210b4ba456c348a971d6049f0750476e647ac0d8f5bd61ff8c06` |

Byte-identical backup created immediately before the CSV write:

- `/private/tmp/ko-translate-backups/20261015/before-proper-name-D20400-Magnus/locatexts_zh_cn.koalocatext_default.csv`

The byte-preserving editor and independent verifier passed for all 65,135
ordered rows. The UTF-8 BOM, exact record line endings, target keys and
values, non-target bytes, and inverse reconstruction were preserved. The
file retains 72,084 CRLF record endings and no bare LF or CR endings.

Active affix/base/default SHA-256:
`0d323b8fc86cc44c5f5386767a3ca073afd990ed1fa7b09f6ce376a765786112` /
`dbdc8887be365a7727e79e9f60396bc706ac0be6c0e9e1e2092dd96e62168be7` /
`d5b5b782fe9c210b4ba456c348a971d6049f0750476e647ac0d8f5bd61ff8c06`.

The refreshed 73,430-row active-source inventory has SHA-256
`52cb1f619d245b2e1026dde95aa31423701ea35f2464d2e6cc8e894562ab164d0`.
The 11,072-match occurrence index now records 2,701 `accepted`, 1,457
`not-an-issue`, 6,908 `needs-context`, and six `excluded` entity/row
matches. Within `person:magnus`, all 98 indexed row matches are terminal:
72 `accepted`, 23 `not-an-issue`, and three `excluded`. These index states
are not global translation counts.

Sequential review remains complete through D-20377 / ID 65134. Proper-name
discovery and review across the glossary remain incomplete; proceed to the
next bounded proper-name occurrence set. No source edit, PAK, build, or
publication.
