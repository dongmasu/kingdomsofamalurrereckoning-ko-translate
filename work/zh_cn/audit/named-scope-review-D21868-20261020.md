# D-21868: Current-Text Name Spelling Residuals

Date: 2026-10-20

Screened the current affix/base/default Korean English-paired name spans,
rather than restarting the historical person scout. Marus Torix was already
reviewed and was skipped.

## Accepted Corrections

| Source key | Old span | New span | Evidence |
| --- | --- | --- | --- |
| default:27804 | 네린(Nareen) | 나린(Nareen) | English Nareens, Japanese ナレーン and Chinese 纳林 agree with the established 나린 surname. Preserve the household reference. |
| default:29366 | 자니크(Janick) | 재닉(Janick) | English Janicks explicitly refers to the family; Japanese ジャニック and Chinese 雅尼克 support the already registered 재닉 spelling. |
| default:60503 | 티레라(Tilera) | 틸레라(Tilera) | Correct the Korean spelling only, using the established 틸레라. English begins with the fragment ...ilera; Japanese and Chinese also have truncated openings. The existing interpretation, fragment handling and journal narrative are not re-reviewed or expanded. |

Do not merge the plural family mentions into individual-person occurrences.
No new entity, alias, occurrence key or disposition is added. Four existing
occurrence rows on the edited source keys have only their Korean context
snapshots refreshed; their status and evidence remain unchanged.

`base:4629:11` (Teiner Home) retains its existing household/place exclusion
under person:teiner, documented in D-20540. The name alone does not justify
reopening that classification or assuming it denotes Esklad Teiner.

## Verification

Exact old/new cells and aligned source evidence:
`proper-name-edits-D21868.tsv`.

The existing cell editor passed BOM, newline sequence, row count/order,
tokens, non-target byte preservation and inverse reconstruction for three
Texto cells in the 65,135-row default CSV. Index inverse serialization also
matches its backup exactly; only four Korean context fields changed.

- Default pre-edit SHA-256: `6007add4aebd1a93aba3b18c43595807da324cd5983153254fa8f9e03e47a74d`.
- Default post-edit SHA-256: `409387c697e74b8a7ecb77024a312a6d1a15b6cccaae994ce2667cfc4e93b09b`.
- Occurrence index post-edit SHA-256: `7198864fa9dd7e802887db31d1f78e52ab1b03c2c0d05dd065a92f6cda3ffc8f`.
- Backup directory: `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21868`.

No full residual/bilingual audit, inventory rebuild, build, release change
or in-game test was performed for this spelling-only batch.
