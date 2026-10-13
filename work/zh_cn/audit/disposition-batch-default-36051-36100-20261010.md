# Disposition Batch: `default` IDs 36051-36100

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior accepted terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New decisions: two accepted, four `not an issue`, and eight uncertain.
- CSV changes: IDs 36051 and 36074 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 36051 | `Beckoned` / `선택받은 자` | Accepted: English uses the established player title `Beckoned`; prior accepted decisions, including D-692, set the Korean form to `부름받은 자`. Replace the inconsistent `선택받은 자여` with `부름받은 자여`; retain the formal greeting. |
| 36052 | Idylla / `이딜라` | Uncertain: the name is recognizable, but the active corpus alternates `이딜라` and `이디라`; do not choose a global spelling based on this isolated label. |
| 36055-36056 | Narca's `vessel` / Ansillas | Uncertain: the curse, unknown cause, possible cure, adoptive upbringing, and home sentiment are retained. `Vessel` may denote a body or host, and the proper-name/family forms need context and glossary alignment. |
| 36058, 36060 | House of Seasons / Nyralim / Gardens of Ysa | Uncertain: the House and ancient Fae homeland relations are preserved, but official Korean forms for the formal House and named garden require integrated terminology review. |
| 36069-36070 | Brooding / withheld evidence / Hugues | Uncertain: the key/evidence situation and the gift's transfer are retained. `Broods` may be emotional or scheming, locale readings differ, and Korean `휴그` varies from established `휴그스`; defer rather than infer scene intent or normalize one name. |
| 36071 | Tuatha displaying the dead | Not an issue: Korean preserves the speaker's hatred, Tuatha's use of the object to dominate the living through their dead, and the intent to act. |
| 36074 | Minimap-trails tutorial marker | Accepted: Korean redundantly says `미니맵의` immediately before the localized marker `미니맵 경로`; English, Japanese, and Chinese have only the marker phrase. Remove the extra prefix and retain the marker wrapper and following instruction. |
| 36084 | Antidote instruction | Not an issue: although English says `take it`, Japanese and Chinese explicitly say drink, and the object is an antidote. Korean's `마셔` is supported by the potion context and both references. |
| 36088 | `I'm not afraid of you` | Previously dispositioned, not counted again: D-012 already accepted `네가 두렵지 않아` and rejected the Japanese-only addition of “your god.” The active CSV contains the approved text; the preliminary report's quoted Korean is stale. |
| 36090 | `Right where who wants us?` | Uncertain: the English is malformed; Japanese asks who wants them, Chinese asks where they are wanted, and Korean follows the location reading. Without scene context, do not replace that provisional interpretation. |
| 36092 | Rathir / `라시어` | Uncertain: the place is clear, but `라시어` and `라시르` both occur in the active Korean corpus and earlier decisions defer global normalization. |
| 36097 | Second Burning / Llosgiad / Watch / Strait | Uncertain: the attack, piers, defense, repulsion, and strait are retained; event-name, faction/title, and historic-place terms remain unsettled. |
| 36098 | `Find the last remains` | Not an issue: Korean preserves the retrieval objective; no context supports a more specific object. |
| 36099-36100 | Jottun / acting Scion / Bridgette Malloi | Uncertain: the speaker's surprise at the Jottun being spared and the private-letter attribution are retained; the proper names, `Scion` office, and force of `acting` need integrated alignment. |
| Remaining ordinary text in IDs 36051-36100 | Dialogue, objectives, names, labels, and values | Not an issue: the other 29 IDs were checked in all four locales; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- The source-keyed 36000-36199 questions and the preliminary candidates at
  36090 were checked; the malformed question remains context-dependent.
- D-012 already dispositioned ID 36088. The active row is correct despite the
  stale quoted wording in the preliminary scan; no new decision or edit was
  made for that ID.
- Accepted title precedent D-692 and related Beckoned decisions support the
  correction at 36051. They do not settle the separate spelling of Idylla.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs 36051-36100
  once in identical order.
- No embedded line breaks or runtime-token sequence mismatch occurs in the
  range. ID 36074 retains `{*1...}` with its identity and position unchanged;
  ID 36072 retains +20% Battle Frenzy attack speed.
- The active default CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39
  pre-existing bare-LF endings. SHA-256:
  `d02540ed7f26486c36eba956db9f9b0d59cf7ed34a7d076343f933e05c33545c`.
- The previously documented checkpoint-hash discrepancy remains unresolved;
  no unrelated content was reverted.
- These are working dispositions, not independent final linguistic approval.

## Checkpoint

Disposition is complete through ID 36100. Resume at ID 36101; 29,034
`default` IDs remain through ID 65134. The next unused decision ID is
D-11641. Preliminary scan:
`default-ids-36101-36150-preliminary.md`.
