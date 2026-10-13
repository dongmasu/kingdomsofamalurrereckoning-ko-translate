# Disposition and Edit Batch: `default` IDs 26301-26350

- Decision date: 2026-10-10.
- Scope: preliminary findings for IDs 26301-26350, checked against English,
  Japanese, Chinese, active Korean, and historical questions.
- Decisions: one accepted, two `not an issue`, and three uncertain.
- Accepted terminology correction at ID 26306 is applied to the active Korean
  CSV. Lore-specific names and format questions remain open.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 26301-26302, 26305, 26307-26309, 26315-26316, 26322-26328, 26330, 26332, 26334-26336, 26341-26346, 26350 | Dialogue / short UI / story wording | Not an issue: the reviewed lines preserve dialogue intent, concise prompts, and the relevant story meaning. |
| 26327, 26331, 26346 | Quest status / Dagger attack | Not an issue: the completion label and delayed second-hit Critical Hit mechanic are preserved. |
| 26306 | Keeper's Rite / Crossing at Caer Elatha | Accepted: use `감시관의 의식` to match the accepted Keeper term at ID 26151. The distinct lore term `Crossing` and the Korean rendering of `Fae hollow` remain unresolved. |
| 26303-26304, 26306, 26308, 26310-26314, 26317-26320, 26324, 26329, 26333, 26337, 26339-26340, 26343, 26347-26349 | House of Valor / Crossing / factions / proper names / title terms | Uncertain: canonical names, institutional roles, and lore-specific forms require cross-corpus alignment. The House of Valor form at ID 26303 remains linked to ID 26558. |
| 26321 | Fae proverb | Uncertain: the proverb's wording and Korean `\\\"` sequences require literary and runtime-format review. |
| 26338 | `SpawnVol5` | Uncertain: it is unclear whether this internal-looking spawn label is player-facing; keep it unchanged pending classification. |

## Verification

- English, Japanese, Chinese, and Korean each contain IDs 26301-26350 once in
  identical order.
- The six-line House of Valor passage at ID 26303 has five embedded line
  breaks in all locales. Dagger mechanics at ID 26331 are preserved.
- The only Korean CSV edit in this batch is ID 26306, replacing `수호자` with
  the already accepted `감시관`. UTF-8 BOM, 72,046 CRLF endings, and 39
  pre-existing bare-LF endings are preserved.
- Active default CSV SHA-256:
  `c6dd0e0b779ab1b97dbdc50cf427eeb3627fd60b3a571cb520b4950846197e8b`.
- Register totals after this batch: 833 accepted, 2,903 `not an issue`, and
  4,830 uncertain (8,566 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 26351; 38,784 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
