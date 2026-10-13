# Disposition Batch: `default` IDs 35701-35750

- Decision date: 2026-10-10.
- Scope: all 50 IDs; checked active Korean against immutable English,
  Japanese, and Chinese rows, historical source-keyed questions, names,
  meaning, and structure.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- Decisions: one accepted, five `not an issue`, and seven uncertain.
- CSV change: ID 35741.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 35701 | Forsaken Plains refugees / Tirin's Rest | Uncertain: the Korean preserves the speaker's criticism of hypocrisy and the named refuge/town, but the exact force of the final idiom and canonical place-name form need context. Chinese's invitation reading conflicts with the English rhetorical use and is not adopted. |
| 35709 | `Preordained` | Uncertain: the fate-related label is rendered as `정해진 자`; its formal UI/group role and canonical term need broader consistency review. |
| 35711 | Peace Edict | Not an issue: the edict's application to all mortals, nobles and commoners, including the addressee, is retained. |
| 35714-35717 | Niahm / Gallows' Bloom / Primos / Hyperian shrines | Uncertain: the route, two shrines, prior Primos Arkes, and Secandra's Earth-first suggestion remain distinct; lore names, titles, and shrine terms need glossary/context review. |
| 35718 | Wanted status / self-correction | Not an issue: the speaker is wanted in the three towns, then corrects that status as past; Korean preserves both clauses. |
| 35723 | Prisoner's joke | Uncertain: the speaker's observation that the addressee is not a guard and the joke about being released are retained; whether the second clause is a deadpan jest or earnest request needs scene context. |
| 35725 | `The Superego Was Killed!` | Uncertain: Korean preserves the capitalized kill-event label, but whether Superego is a player-facing target, internal status, or named event is unknown. |
| 35729-35730 | Warden's Bridge / Dverga mariners | Uncertain: patrol mustering, mariners' size/strength, and northern kingdoms/islands are retained; the bridge and Dverga identification need terminology review. |
| 35741 | Farmland shares | Accepted: change `미스로스의 농지를 팔면서` to `미스로스의 농지 지분을 팔며`. English and Chinese say the merchant sold shares, not the land itself; Japanese's broader land-sale reading does not override the English. |
| 35742 | Hallam's plots / `The Hero and the Maid` | Uncertain: Korean retains exclusion from Hallam's plots, the named work, and the ill omen; `plots` as schemes versus narrative scripts and the work's formal title remain unclear. |
| 35745 | Salvage and reforge Chaos weapons | Not an issue: Korean distinguishes dismantling/salvaging from reforging and preserves the unlock-potential instruction. |
| 35749 | Meet Alyn Shir on Dannestar | Not an issue: Korean says to meet Alyn Shir at Dannestar, matching English and Chinese; Japanese alone changes the relation to traveling there with her. |
| Remaining ordinary text in IDs 35701-35750 | Dialogue, labels, names, and objectives | Not an issue: the other 32 IDs were checked in the four locales; no additional supported row-local defect was identified. |

## Historical Audit Reconciliation

- The source-keyed 35600-35799 inventory confirms the open questions for
  Peace Edict, Niahm/Gallows' Bloom, Primos/shrines, wanted status, Superego,
  Warden's Bridge, Dverga, The Hero and the Maid, Chaos Weapons, and Alyn
  Shir. No historical note itself authorizes an edit.
- The 35749 action divergence was resolved in favor of English meaning;
  the farmland-shares correction is independently supported by English and
  Chinese.

## Verification

- English, Japanese, Chinese, and active Korean rows for IDs 35701-35750
  were checked in matching key order; no embedded breaks or runtime markers
  occur in the range.
- Only the approved Korean `Texto` at ID 35741 changed. UTF-8 BOM, 72,046
  CRLF endings, and 39 pre-existing bare-LF endings are preserved.
- These working dispositions are not independent final linguistic approval.
- Resume disposition at ID 35751; 29,384 `default` IDs remain through 65134.
