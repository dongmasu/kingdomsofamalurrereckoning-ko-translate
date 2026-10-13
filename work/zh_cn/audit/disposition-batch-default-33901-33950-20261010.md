# Disposition Batch: `default` IDs 33901-33950

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling preliminary findings with English, Japanese,
  Chinese, historical questions, active Korean, prior decisions, and runtime
  structure.
- Decisions: two accepted, two `not an issue`, and eleven uncertain findings,
  plus one `not an issue` disposition for remaining ordinary text.
- CSV changes: IDs 33916 and 33934 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 33902 | Arrivus engine / `free the key` | Uncertain: the memo and action are retained, but “free” may mean release, unlock, or enable; the mechanism is not established by the locale rows. |
| 33909 | Source typo `loosing` / `주문을 쏟아붓다` | Not an issue: Korean conveys the apparent intended act of unleashing spells; the source-side spelling issue is not reproduced as a translation defect. |
| 33913 | `your telling` / `전승` | Uncertain: the threat's finality is retained, but Telling could be an individual fate/story or a named lore tradition. |
| 33916 | `Your Grace` / `폐하` | Accepted: change to `각하`. English does not establish royalty; Japanese and Chinese use broader formal addresses, and prior honorific reviews warn that `폐하` overstates rank. |
| 33917 | Mother's name / speaker's fall from cliffs | Uncertain: Korean and other locales retain a falling-from-cliffs reading, but the relation between the speaker's act, the mother's name, and the fall remains context-dependent. |
| 33919 | Grand mistress of Ysa / High King's Guide | Uncertain: the ceremonial introduction is retained, but the titles' hierarchy and Korean equivalents vary across locales. |
| 33921 | Warsworn / `워스워른` | Uncertain: the joining invitation is preserved; active findings document competing faction spellings, and no global normalization is authorized here. |
| 33926 | Ravenswing / `레이븐스윙호` | Not an issue: Japanese and Chinese independently identify a vessel, supporting the Korean ship suffix; no contrary referent is present. |
| 33929 | Njordir / `니오르디르` | Uncertain: water-god and blessing claims are retained, but locale spellings differ and the historical audit requests lore-name confirmation. |
| 33932 | Three Swords / `스리 소드` | Uncertain: English capitalization and Japanese support a name/group reading, while Chinese translates it literally; identity and canonical form need context. |
| 33934 | `{*1Shadow Strike}` / `{*1Twisted Claw}` payloads | Accepted: localize to `{*1그림자 강타}` and `{*1뒤틀린 발톱}`, matching established Korean ability names at ID 7807. Preserve both wrappers, order, two-paragraph layout, and the five-hit maximum. |
| 33938 | Crossing ampulla | Uncertain: the armor-enhancement relation is retained, but Crossing's place/rite meaning and the relic's identity remain open across locales. |
| 33942 | Preordained / `예정된 자들` | Uncertain: the indiscriminate slaughter claim is retained, but whether Preordained is a faction or descriptive state is not settled. |
| 33946 | Wyvyrn-Gifre | Uncertain: the joined-name form is preserved, but surname construction and canonical family spellings need corpus context. |
| 33950 | Music Preparation / `음악 준비` | Uncertain: player-facing versus internal/production-label status is unknown; do not alter until the UI purpose is established. |
| Remaining ordinary text in IDs 33901-33950 | Dialogue, labels, and structure | Not an issue: no additional supported row-local defect was identified; ordered IDs, marker structure, values, and line breaks align. |

## Historical Audit Reconciliation

- The source-keyed entry for IDs 33800-33999 is present in
  `work/zh_cn/audit/from-ja_jp/open-questions.md` and flags the engine/key,
  source spelling, cliff/mother passage, High King's Guide, Warsworn,
  Ravenswing, Njordir, Three Swords, ability markers, ampulla, Preordained,
  and Wyvyrn/Gifre.
- Decision D-2150 at ID 7807 records the established `그림자 강타` and
  `뒤틀린 발톱` ability names; this batch reuses those exact terms inside
  the existing runtime wrappers.
- Prior `Your Grace` decisions caution against a royal honorific when rank is
  unknown; `각하` is used as the broader formal address here.
- No historical question was treated as authorization to edit the CSV.

## Verification

- English, Japanese, Chinese, and active Korean contain IDs 33901-33950 once
  and in identical order.
- ID 33934 retains two newline characters, both `{*1...}` wrappers in source
  order, and the five-hit maximum.
- Active default CSV SHA-256:
  `cacfe527f7af070a4ac1bb323e6712e0a962ecbd98eb58a8c4dc440a4ad40c48`.
- UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
  preserved.
- These are working dispositions, not independent final linguistic approval.
- Resume at ID 33951; 31,184 default IDs remain through ID 65134.
