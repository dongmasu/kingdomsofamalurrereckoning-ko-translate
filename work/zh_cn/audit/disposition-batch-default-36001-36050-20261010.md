# Disposition Batch: `default` IDs 36001-36050

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and earlier term decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- Decisions: one accepted, four `not an issue`, and seven uncertain.
- CSV change: ID 36042 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 36004, 36013 | Arcadium / Master Makers | Uncertain: English/Japanese leave Arcadium as a named place and identify Master Makers as a group/title; the Chinese gloss does not settle official Korean forms. Preserve current names pending terminology alignment. |
| 36014 | Four-panel map tutorial | Not an issue: all four sections, fast-travel restrictions, discovery rules, map descriptions, north-locked default, and runtime marker sequence are retained. |
| 36015 | `Find another entrance` | Not an issue: English and Chinese say entrance; Japanese alone says exit. Korean follows the English objective and does not reverse the direction. |
| 36017 | Battle of Galafor Plain / Orieator / Varlaine / Alfar | Uncertain: the battle, generals, Alfar strength, Fae opposition, casualties, and Lyria's exaltation are retained. Proper names, historical framing, and the relation expressed by `dogged foes` need lore/glossary review. |
| 36019 | Hierophant / `대사제` | Uncertain: the quest instruction and proof goal are retained, but prior register decisions leave the Korean office term unsettled between translated and phonetic forms. Do not normalize this occurrence alone. |
| 36020 | Ariad | Uncertain: the speaker's long leadership, modest comparison, and competence are retained; the formal group/office and canonical Korean name need broader context. |
| 36024 | Rotelos / Nerotelos and colored lock | Uncertain: the descending cage, hidden treasure, three-part/three-color lock, and violet-first instruction are preserved. `paranoid in their labors` is narrowed to being persistent specifically about hiding treasure; context is insufficient to choose a safer stylistic correction. |
| 36028, 36031 | Belne / Ashmoor Clan / Esklad | Uncertain: the dagger attribution and speaker's loss of Esklad are retained, but proper-name spellings vary in the corpus, including `에스클라드` versus `에스크라드`. No isolated normalization is approved. |
| 36036 | Malformed English `know she that she` | Not an issue: Korean removes the duplicated source word and preserves the intended desire to know that she is unharmed, plus the prohibition on leaving after serving the city. Japanese/Chinese support the reading. |
| 36042 | `preying on the weak and injured` / `잡아먹으며` | Accepted: English's idiom does not establish literal eating; Japanese describes making them prey and Chinese says targeting them. Replace the narrowed `잡아먹으며` with `노리며`, preserving the victimization meaning without inventing consumption. |
| 36046-36047 | Varani king's shield / restoring the hunt | Uncertain: the shield's materials and elemental protection, possible return from death, restoration of the hunt, and indignity are retained. Varani/barrow terminology and the underlying lore remain open. |
| Remaining ordinary text in IDs 36001-36050 | Dialogue, objectives, names, labels, and values | Not an issue: the other 36 IDs were checked in all four locales; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- The source-keyed 36000-36199 entry flags the Galafor history and names at
  36017; that question remains uncertain rather than being treated as an
  approved spelling or lore decision.
- Earlier register entries repeatedly defer the canonical Korean title for
  `Hierophant`; ID 36019 follows that policy.
- The English entrance reading at 36015 was checked against the Japanese
  exit divergence and Chinese entrance; English is the meaning authority.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs 36001-36050
  once in identical order.
- ID 36024 retains one embedded break in all locales. ID 36014 preserves its
  four headings and `{LINE_LEFT}`, `{*2...}`, and `{LINE_SPACE}` marker
  identities/order. No other runtime-token order mismatch was found.
- The active default CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39
  pre-existing bare-LF endings. SHA-256:
  `a56d9ba8b1eb8052a04251f9d3af7b238a00536ce8d291934ca473c3337d578a`.
- The previously documented checkpoint-hash discrepancy remains unresolved;
  no unrelated content was reverted.
- These are working dispositions, not independent final linguistic approval.

## Checkpoint

Disposition is complete through ID 36050. Resume at ID 36051; 29,084
`default` IDs remain through ID 65134. The next unused decision ID is
D-11627. Preliminary scan:
`default-ids-36051-36100-preliminary.md`.
