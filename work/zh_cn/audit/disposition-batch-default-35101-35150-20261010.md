# Disposition Batch: `default` IDs 35101-35150

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling the preliminary scan with active Korean,
  immutable English/Japanese/Chinese rows, historical dispositions,
  line breaks, markers, and values.
- Evidence caution: Japanese wording refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- Decisions: one accepted, forty `not an issue`, and nine uncertain.
- CSV changes: ID 35127 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 35103 | `A Careless Passage` | Uncertain: English capitalization, Japanese transliteration, and Chinese literal translation do not establish whether this is a named route/title or a descriptive phrase. |
| 35105 | `Dispelling Trainer` | Uncertain: Korean conveys a dispelling instructor, but whether this is a named skill category/rank and its canonical terminology remain open. |
| 35107 | Cloudy / Lambent / Pristine Shards | Uncertain: the weakest-to-strongest ordering is retained, but the three quality-tier names are setting-specific and lack approved Korean forms. |
| 35111 | `{*1[Weapon Attacks]}` / attacks from Dodge | Uncertain: the `{*1[...]}` wrapper is preserved and localized correctly, but `회피 중` may mean during the dodge action; the exact gameplay timing is not settled by this isolated row. |
| 35117 | `Prismere Chantries` | Uncertain: the named modifier and religious-building sense are conveyed, but the canonical Chantry/Chantries term and number convention remain open, including the related issue at 34949. |
| 35124 | Cora Banick's journal | Not an issue: all four dated entries, the documented 34 line breaks, event progression, and source tone are retained. The Japanese-only explicit “two legs” numeral does not change the English/Korean pair reference. |
| 35127 | Next portion of Galenun Hegem's memoirs | Accepted: revise `다음 회고록은` to `회고록의 다음 부분은`; English says “the next portion of his memoirs,” and Japanese/Chinese likewise identify a continuation/portion, not another separate memoir. The person's spelling and office names remain provisional. |
| 35129 | `agents of Chaos` | Uncertain: `혼돈의 첩자들` narrows the English/Chinese broader “agents” sense, while Japanese specifically says spies; the group's exact role remains context-dependent. |
| 35144 | `St. Eadric's Remains` | Uncertain: bodily remains, relics, or a named artifact are all possible, and Japanese instead reads “shroud”; the referent cannot be resolved from the label. |
| 35147 | `Castor's Wrath` | Uncertain: English/Chinese suggest Castor's anger, while Japanese reads revenge against Castor; the title's relation and canonical name remain open. |
| 35148 | `Greetings dove` | Uncertain: English explicitly uses a warm vocative, but Japanese/Chinese omit or reinterpret it and prior decisions leave a safe Korean endearment/context unresolved. `그대` avoids an unsupported intimacy level. |
| Remaining ordinary text in IDs 35101-35150 | Dialogue, labels, values, markers, and structure | Not an issue: no additional supported row-local defect was identified in the other 39 IDs. |

## Historical Audit Reconciliation

- The established `St. Eadric` spelling at D-2993 does not settle whether
  `Remains` at 35144 means a shroud, relic, or bodily remains; retain the
  existing row for a context pass rather than importing the shroud reading.
- Prior `dove` decisions (including D-240, D-461, D-936, D-1211, and D-2268)
  show conflicting omissions and Korean vocatives. They do not authorize a
  global replacement at 35148.
- Historical notes flag the clarity tiers, the marker, Galenun/Ganelun Hegem,
  Domus Politica/Grand Bursar, St. Eadric, Castor's Wrath, and `dove`; open
  terminology and lore questions remain open.

## Verification

- All 50 IDs were checked in English, Japanese, Chinese, and active Korean;
  keys and order match.
- ID 35124 retains 34 line breaks and all four dates. ID 35111 retains its
  `{*1[...]}` wrapper, marker order, and break; ID 35122 retains the exact
  `#NAMED_ICON_GRAY_360_LB#` token.
- Only the `Texto` value at ID 35127 changed. The UTF-8 BOM, 72,046 CRLF
  endings, and 39 original bare-LF endings remain intact.
- These working dispositions are not independent final linguistic approval.
- Resume disposition at ID 35151; 29,984 IDs remain through ID 65134.
