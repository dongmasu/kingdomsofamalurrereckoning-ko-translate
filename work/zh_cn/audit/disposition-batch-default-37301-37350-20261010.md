# Disposition Batch: `default` IDs 37301-37350

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: one accepted, eight `not an issue`, and nine uncertain.
- CSV change: ID 37343.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 37301 | Dokkalfar / Mythany Keen / worship circle | Uncertain: meeting time and discreet location are preserved, but faction and personal-name spellings need alignment; the generic Korean location avoids inventing a temple. |
| 37304 | Lightning potion ingredients | Uncertain: reagent names, quantities, list structure, and line breaks remain, but canonical ingredient terms need glossary review. |
| 37306 | Traveler / noose / jail | Not an issue: the keys may save a Traveler from execution but require the speaker to enter jail; the tradeoff is intact. |
| 37309 | Rathir ruling council / old debts | Not an issue: secrecy of council membership and substantial old debts owed to the speaker remain. |
| 37311 | `dog-face` / `개대가리` | Not an issue: English and Chinese support a direct insult; the Whitestone/Snaketail ultimatum remains. |
| 37313 | Capitalized `Reverie` | Uncertain: all three poetic images are present, but the lore-state versus ordinary-dream meaning is unresolved. |
| 37316 | Selkie Veil | Uncertain: transformation power and the stolen Fae-item history remain; canonical artifact-name form is unsettled. |
| 37318 | `Revival` / `부활` | Uncertain: English/Japanese give only `Revival`, while Chinese adds “Camp”; resource context is needed before changing the label. |
| 37323 | `Dispelling Skill: {*1{1}}` | Not an issue: the nested runtime marker is preserved exactly and in order; skill-name terminology can be reviewed globally. |
| 37328 | Gnomes “are creation chaos” | Not an issue: the English source is ungrammatical, but the Korean “causing chaos” reading is supported by Japanese/Chinese and fits the sentence; the source error remains unmodified. |
| 37333 | Royal fortunes / Braxis | Not an issue: hidden royal wealth, the spell, and the persistent-adventurer condition remain; the locale variance between wealth and heirlooms does not establish a Korean error. |
| 37337 | Implicit `they` / recovery objective | Uncertain: Korean leaves the object implicit as English does; nearby quest context is needed to identify what must be recovered. |
| 37338 | Quake values | Not an issue: +55% damage, 40% chance, 5-second stun, +18 Mana cost, and the two-line layout are retained. |
| 37340 | Lowercase `reverie` | Uncertain: Korean preserves centuries of interrupted reverie and the mortal-directed challenge; ordinary versus lore-specific meaning depends on context. |
| 37343 | Left stockade / `왼쪽 구역` | Accepted: revise to `왼쪽 감방 구역으로 통하는 문` to retain the prison enclosure/cell-block specificity supported by Japanese and Chinese, not just direction. |
| 37345 | Flawless Mitharan Rigid Lining | Uncertain: all item components are represented, but quality/material terminology needs glossary alignment. |
| 37350 | Fae Cairns / `페이 케른` | Uncertain: the collective/place label is preserved; canonical Fae Cairns form remains unresolved in prior decisions. |
| Other rows in IDs 37301-37350 | Dialogue, names, values, objectives, and labels | Not an issue: remaining rows were compared across the four locales; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- Source-keyed questions at IDs 37301-37316, 37318-37328, 37331-37333,
  and 37337-37343 were checked against the four locale rows.
- The malformed English phrase at 37328 was interpreted conservatively
  using Japanese/Chinese support; immutable English was not changed.
- Prior unresolved terminology for Fae Cairns and lore terms remains open;
  no corpus-wide replacement was made.
- These are working dispositions, not independent linguistic approval.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs
  37301-37350 once and in identical order.
- Potion recipe and Quake line breaks are preserved. Nested `{*1{1}}` at
  37323 and all listed Quake values at 37338 remain unchanged.
- Only active Korean `Texto` at ID 37343 changed.
- The UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings
  are preserved.

## Checkpoint

Disposition is complete through ID 37350. Resume at ID 37351; 27,784
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-37351-37400-preliminary.md`. The next unused decision ID is
D-12119.
