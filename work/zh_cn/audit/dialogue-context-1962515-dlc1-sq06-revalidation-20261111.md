# DLC1 SQ06 / Alder Malloi Revalidation

- Date: 2026-11-11.
- Scope: all 67 `default` IDs linked to `1962515.quest_bxml`.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Three correction candidates and two evidence-limited holds are recorded.
  The active Korean translation CSV was not changed.

## Grouping Evidence and Limits

The asset has explicit quest ID `DLC1_SQ06`, one NPC symbol
`DLC1_NPC_GAL_VAR_AlderMalloi`, 28 dialogue handlers, and 67 matched
localization IDs. Its content concerns the abduction of Cape Solace villagers,
including Nina, by Calder Vonn's force. This is a strong quest/NPC grouping
candidate, but the key scan does not map all 67 IDs to Alder, individual
handlers, branches, or playback order. Speaker and order remain unassigned
and unknown in the ledger.

All 67 rows were compared across English, Japanese, Chinese, and active
Korean. The exact-English duplicate pair `17262` / `23068` (“Who was taken?”)
already has matching translations in all three reference/target languages.
No row contains an embedded line break, runtime variable, or markup token.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `74`, `18864` | Terminology consistency | Both rows say `invader(s)` about the force attacking this island. Other rows for that force in the same quest use `침략자` (including `10460`, `26137`, `29845`, `35976`, and `44268`), while these two use `침입자`. Consider aligning these two to `침략자`. This is local to the island-invasion context; it does not authorize a global replacement of `침입자`. | High |
| `14524` | Naturalness | `wipe Cape Solace off the beach` is rendered `해변의 케이프 솔라스를 쓸어 버리고`, which reads as a literal spatial phrase. Japanese says to destroy Cape Solace entirely. Consider `케이프 솔라스를 통째로 쓸어 버리고 그곳에 있는 사람은 모두 죽일 거야.` | High |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `28855` | Meaning | English uses “a new season” metaphorically for a period in which the people must fend for themselves. Japanese explicitly shifts to `時代` (“era”), while Chinese retains “season.” `새로운 계절` is literal but may be intentional in the setting; keep the reading provisional rather than choosing between a literal season and a new era without more context. |
| `55575` | Speech level | Korean uses polite endings (`왔군요`, `기도하고 있었어요`), while Japanese is plain/casual. The asset contains an Alder NPC symbol but does not map this key to a particular speaker or dialogue stage; retain the current line pending that evidence rather than declaring a register error. |

## Retained Text

The other 62 IDs were retained after source comparison. For example,
`12794` preserves that Vonn brings Niskaru demons harnessed for this purpose,
and `40208` correctly renders “secure its powerful magic” as taking control
of the island's magic rather than protecting it. The review did not infer a
speaker or order from asset membership or serialized handler names.

## Complete Reviewed ID Set

`74`, `561`, `1854`, `3627`, `4058`, `4709`, `6548`, `9004`, `10460`,
`11197`, `11352`, `12364`, `12794`, `13571`, `14524`, `16930`, `17262`,
`17765`, `18826`, `18864`, `20439`, `20476`, `22016`, `23068`, `24954`,
`26137`, `26380`, `28855`, `28908`, `29845`, `32428`, `35384`, `35976`,
`36637`, `37325`, `40147`, `40182`, `40208`, `40764`, `41142`, `41662`,
`43398`, `44268`, `45575`, `46150`, `48227`, `48589`, `48938`, `49744`,
`51761`, `52320`, `52355`, `53412`, `53457`, `53560`, `53630`, `54779`,
`55034`, `55575`, `55645`, `59622`, `59797`, `62733`, `62977`, `63542`,
`63783`, `65041`.

All 67 IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
