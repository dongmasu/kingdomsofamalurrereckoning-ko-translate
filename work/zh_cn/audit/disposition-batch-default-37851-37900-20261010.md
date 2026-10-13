# Disposition Batch: `default` IDs 37851-37900

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: one accepted, ten `not an issue`, and twelve uncertain.
- CSV change: ID 37857.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 37851 | `with Melee` / `근접 공격 시` | Uncertain: the short Korean qualifier is plausible, but the UI/stat context does not establish whether it means “with melee” or an action condition. |
| 37852 | Camp Moondown / Captain Canwen | Uncertain: raid, rebuild, defensive readiness, and discussion objective remain; camp and name forms are provisional. |
| 37853 | “your people” / temporary changed lives | Not an issue: the speaker's concern about the group's changed lives and hope that it is temporary are retained. |
| 37856 | seeing the addressee's death | Not an issue: the dark conditional promise not to tell the addressee is preserved; it is not changed into a promise to prevent the death. |
| 37857 | Antechamber / coercion / Hyperian | Accepted: change `대기실` to `전실` using D-008's established Antechamber term, and explicitly restore English `force` with `강제로 편입시키려고`; Chinese confirms coercion. |
| 37860 | family curse / deserved torture | Not an issue: the speaker's causal blame and explicit belief that the person deserves the torture remain. |
| 37862 | liege / books aside | Not an issue: deferential comic proclamation and the sudden question about the liege's books are retained. |
| 37865 | Aisle of Flame | Uncertain: traversal objective and flame imagery remain; capitalization and cross-locale descriptive renderings do not settle whether this is a named passage. |
| 37867 | Hugues / toughness and plan | Uncertain: escape, reassurance, toughness, and plan remain; the name's canonical Korean form needs alignment. |
| 37870 | Staff block-attack mechanic | Not an issue: attacking with the Staff while blocking and drawing forward enemies into one central location are retained. |
| 37872 | potential applicants / notice | Not an issue: the applicant-only interaction and resulting inference about why the listener came are preserved. |
| 37875 | Casual difficulty / achievements | Not an issue: the difficulty-change confirmation and possible achievement disqualification warning remain. |
| 37878 | Galette / “not much left to find” | Uncertain: warning against searching and the scarcity are preserved, but English does not restrict what remains to people; ja/zh lean toward survivors/remnants. |
| 37880 | Crows / handicap | Uncertain: disgrace, continued fighting as Crows, crowd-drawing role, and persistent handicap remain; the group/status and handicap referent need context. |
| 37881 | Great Cycle | Uncertain: return to the prior state and gratitude for the addressee remain; canonical cosmological term needs alignment. |
| 37882 | his order / gifts | Uncertain: supremacy and eternal gifts remain, but English is ambiguous and Korean's `교단` reading conflicts with Japanese/Chinese governance or command readings. |
| 37883 | Tak Edstar / Alfar Army / line of duty | Uncertain: official family notice and death in service remain; personal and faction name forms need alignment. |
| 37889 | Pledged of Shield / Sworn to War / Order | Uncertain: proclamation, welcome, and honor remain; formal rank/oath and organization terminology are unresolved. |
| 37891 | Captain Rydder / Warsworn protectors | Uncertain: reduced harassment fear, summons, captain role, and camp protection remain; proper-name and faction forms need alignment. |
| 37892 | Paling Wand | Uncertain: the item and grandfather reference remain, but the locales disagree on what `Paling` means; no safe item-name correction is supported. |
| 37896 | The Memoirs of Patrick Morkan | Not an issue: named author and memoir/title relationship are preserved. |
| 37897 | safety / home / reciprocal friendship | Not an issue: the speaker's protective motive and the mutual-friendship maxim are retained. |
| Other rows in IDs 37851-37900 | Dialogue, names, values, objectives, items, and labels | Not an issue: remaining rows preserve English meaning and structure; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- No source-keyed historical open-question row was found for this range.
  Candidate terms were checked against existing project terminology and
  decisions; D-008 supports `Antechamber = 전실`.
- At 37857, Japanese describes joining/unifying the Hyperian with the city,
  while English and Chinese explicitly support force. The correction keeps
  the source's coercive agency and avoids the modern waiting-room sense.
- Crows/handicap, Order, Warsworn titles, Great Cycle, and Paling Wand remain
  unresolved; no corpus-wide normalization was authorized.
- These are working dispositions, not independent linguistic approval.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs
  37851-37900 once and in identical order, as checked in the preliminary
  structural comparison.
- Only active Korean `Texto` at ID 37857 changed.
- No runtime marker, numeric value, or intentional line break changed.
- UTF-8 BOM and original mixed endings are preserved: 72,046 CRLF and 39
  bare-LF endings. Active default CSV SHA-256:
  `0ff3de91ad9122d5ab11e4ad213d3660d8484c626b41b300c0cfb810e747836c`.

## Checkpoint

Disposition is complete through ID 37900. Resume at ID 37901; 27,234
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-37901-37950-preliminary.md`. The next unused decision ID is
D-12311.
