# Disposition Batch: `default` IDs 38801-38850

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: two accepted, one `not an issue`, and four uncertain.
- CSV changes: IDs 38810 and 38839.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 38810 | knuckles player / `주먹패 게임의 고수` | Accepted: change to `손가락뼈 놀이의 고수`. English names a player of the knuckles game; Japanese describes a fist/knuckles game and Chinese explicitly identifies the knucklebones game. Korean `주먹패` instead suggests a gang. |
| 38815 | scavs / `약탈자들` | Uncertain: English and Japanese retain the Scav creature/group label, but Chinese identifies a different creature and prior uses do not establish whether to transliterate, translate, or use a species term. |
| 38823 | Cur / `그 개` | Uncertain: capitalization, Japanese transliteration, Chinese's descriptive insult, and prior register entries leave open whether `Cur` is a named figure, creature, or generic insult. |
| 38826 | Master Makers / `장인회 우두머리들` | Uncertain: English names the Master Makers as a collective, but the Korean may turn the group into its leaders. Prior occurrences do not establish the group's exact status or canonical Korean title. |
| 38839 | codex / `암호문` | Accepted: change to `책`. English says `codex`, Japanese explicitly says Book of Fate, and Chinese uses a codex/compendium sense. Korean `암호문` means ciphertext and changes the object type; neutral `책` avoids inventing a specific title. |
| 38845 | Travelers / `여행자들` | Uncertain: capitalization and “our name” indicate a named group, but prior decisions leave the faction's Korean spelling and display convention unsettled. |
| Other rows in IDs 38801-38850, excluding separately listed findings | Dialogue, names, values, objectives, items, and labels | Not an issue: no additional supported row-local correction was found. |

## Historical Audit Reconciliation

- Prior `Cur` decisions at IDs 30864, 31912, and 32765 leave the referent
  open. Master Makers decisions at IDs 33980 and 36013 likewise defer the
  canonical group term. Travelers' named-group spelling remains unsettled.
- The source-keyed audit has a documented gap for IDs 37700-40349; earlier
  candidates on Scavs, Codex, and named groups were consulted, not treated
  as approvals.
- These are working dispositions, not independent linguistic approval.

## Verification

- The two accepted changes were checked against immutable English,
  Japanese, and Chinese rows. No keys, row order, markers, or unrelated
  values were changed.
- The preliminary structural comparison reports ID/order and line-break
  agreement. Runtime marker `{*1[...]}` and icon/price variables remain.
- The active CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39
  pre-existing bare-LF endings.
- Active default CSV SHA-256:
  `d1ab1144133440660ffe42d5ca1e5bc8d13818228a05c8a6c527b10e6cd27e00`.
- No immutable source or prohibited directory was edited.

## Checkpoint

Disposition is complete through ID 38850. Resume at ID 38851; 26,284
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-38851-38900-preliminary.md`. The next unused decision ID is
D-12499.
