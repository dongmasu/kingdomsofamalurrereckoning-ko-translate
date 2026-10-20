# D-21870: Source-Local Testament Faction References

Date: 2026-10-20

The current-text paired-name screen found two inconsistent Korean renderings
of the existing faction name. English source uses the short Testament form
in both rows; aligned Japanese ベイレン結社 and Chinese 贝伦神约 explicitly
identify the Belen organization.

| Source key | Old span | New span |
| --- | --- | --- |
| default:55846 | 벨렌의 테스타먼트(Belen's Testament)는 | 벨렌의 성약단(Belen's Testament)은 |
| default:60084 | 벨렌의 유언(Belen's Testament) | 벨렌의 성약단(Belen's Testament) |

Use the established faction:belens-testament Korean name, not a literal
will/testimony meaning. Adjust only the topic particle required by 성약단
in 55846; preserve the revival/destruction claims and all other dialogue.
Keep the existing complete English pairings. No general Testament alias,
entity registration, occurrence key, disposition or cumulative count is added.
Two existing index context snapshots at 55846 are refreshed, preserving the
Fyragnos and Detyre evidence/statuses.

The Fatesworn variants at default:49657 (ambiguous old armor reference) and
60886 (player epithet) retain D-21747's exclusions from the faction scope.
Do not replace either with the faction's collective Korean name.

## Verification

Exact old/new cells and aligned sources: `proper-name-edits-D21870.tsv`.
The existing cell editor passed all row/order, token, newline, BOM,
non-target-byte and inverse-reconstruction checks for two default cells.
Index inverse serialization equals its backup; only two context fields
change.

- Default pre-edit SHA-256: `246ab51028d07e149d6cf808f95befac23d7764791dbd25c6bdffdb361c351c4`.
- Default post-edit SHA-256: `6cd0a8ff589eac93351f3da593bfd5c08df026d8656ff78236b79ca0c79b15df`.
- Index post-edit SHA-256: `0988c7a118760fee6e4c1c37e7fd6c4cd909dd6aac45c7e931769a90687f7d47`.
- Backups: `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21870`.

No global residual audit, inventory rebuild, build, release change or game test.
