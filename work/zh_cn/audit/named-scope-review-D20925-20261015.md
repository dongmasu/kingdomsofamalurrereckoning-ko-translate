# D-20925: Victory Games Event Standardization

Date: 2026-10-15

## Scope and Decision

Reviewed 37 distinct row keys whose English source contains the name
`Victory Games`: 36 standalone `default` event references and one
out-of-scope compound `base` title. English identifies the House of Valor's
annual, touring combat competition; Japanese consistently uses
`ビクトリーゲームズ`, and Chinese `胜利大赛` corroborates the event.
Context includes arena access, event rounds, passes, prizes, scheduling,
and its public entertainment purpose.

Registered `event:victory-games` with canonical Korean
`승리의 경기(Victory Games)`. Corrected 29 cells, retained
already-canonical event references as `not-an-issue`, and excluded
`base:62:11` (`Victory Games Star`) from event-only normalization so its
complete title can be reviewed atomically next. Context-specific edits preserve arena, round, event,
annual, and participation grammar; they do not turn ordinary matches,
games, or arenas into aliases. Prior exact-key decisions and historical
global translation tallies were not recounted or changed.

## Integrity

- Active default before: `5e8e74fae5633528e7a339124a3feabebf66036e870f9f091432a4b02035c8bc`.
- Active default after: `56c204a50cb2dd717796687fbc03234adb33cef1f209a140f284fdf10df2c803`.
- Byte-identical pre-edit backup: `/private/tmp/ko-translate-backups/20261015/before-proper-name-D20925/locatexts_zh_cn.koalocatext_default.csv`.
- The independent verifier checked 65,135 ordered rows, target `Texto`
  values, BOM, mixed line endings, unchanged non-target bytes, and
  byte-for-byte inverse reconstruction.
- The occurrence index preserves prior dispositions and five
  contextual Anwon-family records while adding 37 reviewed event-scope
  matches. No global tally changed.
- `src/csv/` was read-only. No PAK or PAK-derived resource was inspected.

The [manifest](proper-name-edits-D20925.tsv) contains aligned source and
target cells. See also the [glossary](proper-name-glossary.tsv) and
[occurrence index](proper-name-occurrences.tsv).
