# Disposition and Edit Batch: `default` IDs 26251-26300

- Decision date: 2026-10-10.
- Scope: preliminary findings for IDs 26251-26300, checked against English,
  Japanese, Chinese, active Korean, and historical questions.
- Decisions: one accepted, three `not an issue`, and three uncertain.
- Accepted correction at ID 26274 is applied to the active Korean CSV.
  Proper-name, faction, and lore questions remain open.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 26253-26254, 26257-26260, 26264, 26270, 26272, 26276, 26279-26282, 26287-26288, 26290, 26292-26293, 26297-26298, 26300 | Dialogue voice / short responses | Not an issue: the reviewed lines preserve their conversational intent, voice, and response meaning. |
| 26256, 26263, 26266, 26277 | Alchemy recipe / stat / difficulty-options wrappers | Not an issue: reagent counts and layout, +25%, and both localized `{*1...}` wrappers are preserved. |
| 26262, 26269, 26273, 26284-26285, 26289, 26299 | Country / navigation / quest labels | Not an issue: these short labels convey their source meaning; separate name-consistency questions remain open. |
| 26274 | Threat / past violence | Accepted: change the opening to `너라면 이렇게 협박하진 않았겠지. 그냥 날 찔러 죽이고 시체를 털었을 거야.` English and Chinese make the addressee the actor and the speaker the victim; the old Korean reversed those roles in its first clause. |
| 26251-26252, 26255, 26265, 26267-26268, 26275, 26278, 26283, 26286, 26293, 26295-26296 | Sorrows / names / factions / creatures / lore terms | Uncertain: recurring entity and place names need corpus-wide alignment. The English `Lupoku` versus established `Lopoku` discrepancy remains unresolved. |
| 26261, 26271, 26291 | Ballad / seasonal duty / Mitharu's “great and greater strength” | Uncertain: these use setting-specific or deliberately heightened lore language; preserve current Korean pending broader narrative review. |
| 26268, 26294 | Vagabond / the Order | Uncertain: local context does not establish whether `Vagabond` is a named group or which institution `the Order` denotes. |

## Verification

- English, Japanese, Chinese, and Korean each contain IDs 26251-26300 once in
  identical order, as checked against the source tables.
- ID 26256 retains reagent quantities 2/2/2/1 and its list layout. ID 26263
  retains +25%. ID 26277 retains both `{*1...}` wrappers in order.
- ID 26274 now preserves the source's speaker/addressee roles. The only Korean
  CSV edit in this batch is ID 26274.
- UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
  preserved.
- Active default CSV SHA-256:
  `826f03d98c6cf21cba9abd3b06140958aa6dc41a366a303d1223030ba7555c4c`.
- Register totals after this batch: 832 accepted, 2,901 `not an issue`, and
  4,827 uncertain (8,560 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 26301; 38,834 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
