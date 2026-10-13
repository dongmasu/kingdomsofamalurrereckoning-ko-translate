# Initial Register Scope Review (D-19742)

Date: 2026-10-13. No translation CSV edit or new backup.

The read-only `reconcile-default-scopes-D19742.rb` diagnostic classifies
early (`D` number <= 18156) `default` register rows by whether their
scope is an explicit numeric ID/range. It finds 28,057 distinct IDs in
numeric scopes, 925 of which appear in multiple early numeric records.
It also finds 79 `uncertain` and 594 `not an issue` rows with non-numeric
scopes. This is **not** a reconstruction of the 38,524 operational
cohort: early register entries were appended out of decision order,
some abbreviated ranges need expansion, and `remaining`/`named terms`
scopes cannot be converted to exact IDs just by reading their bounds.
Do not interpret 925 as duplicate uncertain rows or subtract it from
any checkpoint. The diagnostic reports scope syntax and overlaps only.

Postscript (2026-10-14): rerunning the same diagnostic against the current,
non-frozen register yields 27,966 distinct numeric-scope IDs and 922
with multiple records, not the 28,057/925 reported above. The nonnumeric
counts remain 79 uncertain and 594 not-an-issue rows. The 91-ID /
three-overlap discrepancy has not been attributed to a specific register
revision. Neither run reconstructs the historical cohort. See
`global-tally-reconciliation-D20378-20261014.md`.

Two non-numeric uncertain scopes can be resolved by exact source key:

| Earlier finding | ID | English | Japanese / Chinese | Active Korean | D-19742 |
| --- | ---: | --- | --- | --- | --- |
| D-12592 | 39567 | `They called themselves the Fatesworn.` | `フェイトスウォーン` / `誓命者` | `그들은 스스로를 운명에 맹세한 자들(Fatesworn)이라 불렀다.` | not an issue |
| D-12592 | 39582 | `Warsworn, greetings.` | `ウォースウォーン` / `誓战者` | `워스원, 반갑소.` | not an issue |

English distinguishes the Fatesworn from the Warsworn. ID 39567
preserves the self-designation and explicit source name; ID 39582 uses
the official Korean manual's Warsworn faction term `워스원` (PDF p. 7,
printed pp. 13-14).
The greeting is compatible with English; Japanese provides no evidence
that the Korean speaker's politeness is a material error. Chinese
corroborates that these are different groups. No correction is warranted.
These two keys do not occur in the reconstructed D-19727/28 manifests
or the 98-key D-17843 legacy snapshot; they were not part of D-19741's
1,183-key verified union. Membership in the historical 987 remains
unproved, so its cumulative tally is **not** decremented.

The other easily identified non-numeric uncertain scope, D-12575 at
IDs 39470 and 39489, is already terminally corrected by D-19485; do
not re-review or recount it. Other non-numeric scopes include
D-8854 `named terms in IDs 28201-28250` and D-12877 `named terms in
remaining findings 40951-41000`: they specify a topic and a bounding
range, not a row-level membership list.

Next **D-19743 / D-8854**, start with the named-term scope in
28201-28250. Cross-reference its listed English terms against exact
active English/Japanese/Chinese/Korean rows and subsequent terminal
decisions; disposition genuinely unclosed IDs by term/context, not the
entire 50-ID range. Continue through the other ambiguous scopes and
bulk remainders without repeating terminal keys. Default review is
incomplete. The separate Chinese-only affix 55 remain closed.

Active default SHA-256:
`3f862aeda41678f71ceb3cce3ab4bbc9298dfb2bdbc6695223847378ccabf964`.
Last byte-identical pre-edit backup (D-19740):
`/private/tmp/ko-translate-backups/20261012/before-legacy-85-D19740/locatexts_zh_cn.koalocatext_default.csv`.
