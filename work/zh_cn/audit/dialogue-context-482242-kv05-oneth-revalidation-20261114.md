# Dialogue Context Revalidation: `482242.quest_bxml`

- Date: 2026-11-14.
- Scope: all 189 exact-key asset matches and the 13 linked IDs with prior
  candidate or uncertainty findings.
- The asset has no explicit `QUEST_ID`; it contains
  `NPC_RTH_DOK_OnethTansand` and 96 handlers with a `KV05` prefix. These
  asset-level clues do not map an individual localization ID to a speaker or
  establish playback order.
- The all-ID catalog links 189 IDs to this asset, while existing ledger
  metadata links 188. ID `47715` is the unmatched asset association. The
  existing append-only ledger row was not rewritten; this discrepancy is
  recorded for follow-up.

## Rechecked Findings

- `7527`: English, Japanese, and Chinese all direct the reader to find the
  group by any means and then meet Gwyn in Rathir. Removed the duplicated
  “then” and clarified the sentence as
  `온 힘을 다해 그들을 찾은 뒤, 라시르(Rathir)에서 그윈(Gwyn)과 합류해.`
- `20052`: `이먼의 섬(Eamonn's Isle)` already pairs the complete destination
  name; no edit was needed.
- `22691`: English, Japanese, and Chinese all make the addressee responsible
  for provoking the speaker to hurt them. Recast the awkward Korean without
  reversing that agency: `내가 널 해치게 만들지 마.`
- `61424`: the current Korean preserves the unfinished recollection and does
  not add the earlier unsupported duration; no edit was needed.
- `8804`: register remains uncertain. Japanese is plain and Chinese is
  unmarked, while the Korean is polite; fear may justify the shift, and the
  asset does not establish the individual speaker.
- `10959`, `21075`, `26193`, and `52251`: retained as holds. The “by night”
  expressions conflict across English, Japanese, and Chinese as numbers,
  prices, or measures; do not infer the password or unit.
- `27557`: retained as a hold because `grille` does not establish a door or
  window; Japanese specifies window bars, while Chinese is broader.
- `43359`: retained as a source-conflict hold. English and Chinese support
  carrying a message, while Japanese asks whether someone can be trusted.
- `63633`: the exact status implied by `Pledgeshield` and the
  `inside-or-under` Customs House location remain unresolved across sources.
- `63737`: the referent of `him and his` and the group sense of `Rathiri`
  remain uncertain; Japanese supports a “Harst and his men” reading, but
  does not settle the English ambiguity.

Only IDs `7527` and `22691` were changed in the active CSV. Their existing
ledger decisions were preserved; only their `source_fingerprint` fields were
refreshed. No asset-index or catalog link was added for `47715`, and no
speaker or order was inferred.
