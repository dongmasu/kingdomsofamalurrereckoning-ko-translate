# Disposition Batch: `default` IDs 33751-33800

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciled with English meaning, Japanese
  voice/register, Chinese supporting evidence, historical questions, active
  Korean, prior decisions, and structure.
- Decisions: five `not an issue` and seven uncertain findings, plus one
  `not an issue` disposition for remaining ordinary text.
- CSV changes: none.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 33752 | Courdan Passant wants his letter | Not an issue: Korean directly preserves the English statement. Japanese adds a return imperative and Chinese says he wants to find it, but neither extra action is supported by English in this isolated quest label. |
| 33756 | `the Scion` / `계승자` | Uncertain: the instruction is preserved, but prior findings show Scion can be a specific religious/organizational office rather than a generic successor. This row lacks enough context to choose a canonical title. |
| 33759 | Wyvyrn/Gifre family names | Uncertain: Korean preserves that keeping the speaker's name was unusual and that joining with Gifre was agreed, but the exact surname/marriage construction and canonical family spellings need context. |
| 33762 | Understyle / source `its the ruler` | Not an issue: Korean uses the established `언더스타일` place-name form and correctly interprets the obvious English `its` typo as `it's`; the speaker's surprise and sarcasm remain. The Chinese descriptive “underworld garden” does not establish a competing Korean correction. |
| 33763 | `Activity - Applause` / `활동 - 박수` | Uncertain: the row may be a player-facing activity label or an internal/debug string. Localize further only after its UI status is known. |
| 33764 | Gallows End / `갤로우스 엔드` | Not an issue: the island name and restriction on fast travel off the island are retained; the Korean spelling matches the established active-corpus rendering. |
| 33771 | Fateless One / `운명 없는 자` | Not an issue: retain the established Korean title form used in prior disposition D-10324; this standalone label does not justify switching to a Japanese transliteration or Chinese wording. |
| 33778 | Tirin's Rest / `티린의 쉼터` | Uncertain: the instruction to ask around is preserved, but the place may be a settlement, inn town, or refuge, and the Korean name convention remains unsettled. |
| 33780 | the Hollow / `할로우` | Uncertain: English capitalization suggests a name, while Japanese and Chinese read it as a cave. The referent must be identified before choosing transliteration or translation. |
| 33782 | Maid of Windemere / 13-line poem | Uncertain: all 13 physical lines and the broad narrative are retained. The formal status of Maid and the poem's imagery/rhyme need integrated lore review. English's `each- / Other` is a word-wrap split, not a semantic hyphen that should be mechanically copied into Korean. |
| 33792 | Lord Ohn battle account / Seelie and three staffs | Uncertain: the separation, unfamiliar ground, battle reversal, three exits, ambush, and named staffs are present. Canonical faction, military, personal-name, and artifact forms need corpus/context alignment. |
| 33796 | Sustained Abilities / `지속형 능력` | Not an issue: Korean preserves that the abilities continuously consume part of the mana bar while active; Japanese and Chinese support the sustained/continuous reading. |
| Remaining ordinary text in IDs 33751-33800 | Dialogue, labels, and structure | Not an issue: no additional supported row-local defect was found. The 50 ordered IDs, 13-line poem, marker, numeric values, and inspected structures align with the source rows. |

## Historical Audit Reconciliation

- The source-keyed entry for IDs 33600-33799 is present in
  `work/zh_cn/audit/from-ja_jp/open-questions.md`. It flags Scion,
  Wyvyrn/Gifre, Understyle, activity label, Gallows End, Tirin's Rest,
  Hollow, the Maid poem, and the Lord Ohn battle account.
- Prior Scion findings leave global normalization open; retain this row's
  `계승자` rather than importing a context-specific ceremonial title.
- No historical question was treated as authorization to edit the CSV.

## Verification

- English, Japanese, Chinese, and active Korean contain IDs 33751-33800 once
  and in identical order.
- ID 33782 retains 12 newline characters (13 physical lines) in each locale;
  the source's within-word line-wrap hyphenation is not treated as a missing
  newline or a semantic defect.
- ID 33792 retains the three exits and all three named staffs; ID 33760's
  `+8` and `+25%` values remain unchanged.
- Active default CSV SHA-256 remains
  `5b8e14fe286ec8ba364a3562780a89663d58acc18af1831db3505e63db284b08`.
- UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings remain
  intact.
- These are working dispositions, not independent final linguistic approval.
- Resume at ID 33801; 31,334 default IDs remain through ID 65134.
