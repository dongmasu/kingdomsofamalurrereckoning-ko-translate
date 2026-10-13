# Disposition and Edit Batch: `default` IDs 26351-26400

- Decision date: 2026-10-10.
- Scope: preliminary findings for IDs 26351-26400, checked against English,
  Japanese, Chinese, active Korean, and historical questions.
- Decisions: one accepted, two `not an issue`, and three uncertain.
- Accepted correction at ID 26374 is applied to the active Korean CSV.
  Other role, rank, name, and terminology questions remain unchanged.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 26351, 26353, 26355-26366, 26368, 26370, 26373, 26375, 26377-26380, 26382-26390, 26392, 26394-26400 | Dialogue / short UI / story wording | Not an issue: the reviewed lines retain dialogue intent, brief UI meaning, and relevant narrative relationships. |
| 26352 | Havok copyright notice / `{LINE_CENTER}` | Not an issue: Korean preserves the English legal notice, both NBSPs, and the marker. The Chinese-only localization/spacing difference is a source-locale variation. |
| 26374 | Didenhil's warden | Accepted: change `경비대장` to `감시관`. English establishes a warden role but does not specify a guard captain, matching the accepted wording at ID 26093. |
| 26354, 26357, 26367, 26369, 26371-26372, 26381, 26387, 26391, 26393, 26395 | High King / Scaith / Beckoned / Master Makers / ranks / Bursars / swords / Warsworn | Uncertain: faction, rank, and lore terms need corpus-wide alignment. The malformed English number agreement at ID 26381 is treated as a source anomaly. |
| 26355-26360, 26363, 26368, 26378, 26392, 26396-26399 | Proper names / Evenroot / faction and place forms | Uncertain: spellings and plant, faction, and place terminology remain candidates for global consistency review. |
| 26376 | Gadflow's ability to “infect this land” | Uncertain: `타락시키다` is plausible, but its relation to established corruption terminology needs broader lore review. |

## Verification

- English, Japanese, Chinese, and Korean each contain IDs 26351-26400 once in
  identical order.
- The `{LINE_CENTER}` marker and both NBSP characters are preserved in the
  Korean Havok notice. The malformed English `Bursars has` source wording was
  not silently edited.
- The only Korean CSV edit in this batch is ID 26374. UTF-8 BOM, 72,046 CRLF
  endings, and 39 pre-existing bare-LF endings are preserved.
- Active default CSV SHA-256:
  `e7bc53fcc6f7e246749f39d587199aba60d10ead2f392b03bd01fa102a21289b`.
- Register totals after this batch: 834 accepted, 2,905 `not an issue`, and
  4,833 uncertain (8,572 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 26401; 38,734 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
