# Disposition Batch: `default` IDs 36201-36250

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and established project terminology.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: one accepted, three `not an issue`, and eight uncertain.
- CSV change: ID 36226 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 36201 | `Base Reckoning Buff` | Uncertain: `기본 레코닝 강화 효과` preserves the mechanic and buff sense, but this isolated UI label does not establish whether `Base` names a particular stat/build category. Chinese's `惩罚` is not enough to override the game's Reckoning term. |
| 36218 | `Child of Dust` / `먼지의 자식` | Uncertain: the capitalized address is rendered literally and intelligibly. Prior decisions leave its identity and canonical relationship to other dust-born epithets unresolved; do not normalize from this row alone. |
| 36225 | `Embassy Hall` / `대사관` | Uncertain: the English names a hall/building, and Japanese/Chinese retain an explicit building/hall noun. Korean `대사관` may identify the location but drops that distinction; map/location context is unavailable. |
| 36226 | `Training a pet` / `길들이면` | Accepted: English, Japanese, and Chinese all describe training an already acquired pet. Korean `길들이다` can instead mean taming it. Change to `반려동물을 훈련시키면 특별한 유대가 생겨 전투에서 도움을 받을 수 있습니다.`; retain the bond and combat-benefit relation. |
| 36232 | Shrines of Earth and Air / Arkes | Uncertain: the shrine names and Arkes's foreknowledge are preserved, but English, Japanese, Chinese, and Korean differ on whether these are shrines, temples, or sanctuaries. The source does not explain how Arkes knew they would be needed. |
| 36237 | `the Sidhe` / `시드헤` | Uncertain: this is a capitalized place/people/realm term. The phonetic Korean is plausible, but prior decisions leave both the referent and canonical form unresolved. |
| 36239 | Fate Shrine / funding request | Not an issue: Korean preserves the damaged-shrine repair, rare materials, request to Gelda Tash for money, and her ability to fund it. It does not add the loan obligation found in Japanese. The formal shrine name remains a separate terminology question. |
| 36240 | `Reverie` / Calovar | Uncertain: capitalization may identify a named realm or state; Japanese and Chinese can read it as ordinary dreaming. The relation between Calovar walking the sands and the speaker needing to sleep is also context-dependent. |
| 36241 | `scavs` / `스캐브` | Not an issue: the established Korean creature/group term is used naturally as a collective; English plural marking does not require an added Korean plural suffix. |
| 36244 | `Pledgeshield` / `서약방패병` | Uncertain: English capitalizes the compound, Japanese interprets it as a mercenary rank, and Chinese retains a shield-like title. Prior decision D-1782 leaves the formal role and Korean term unresolved. |
| 36249 | `Let me go` / `날 내버려 둬` | Uncertain: Korean follows Japanese's “leave me alone” reading; English and Chinese can mean physical release. Without scene context, neither sense can be selected safely. |
| Remaining ordinary text in IDs 36201-36250 | Dialogue, objectives, labels, values, and names | Not an issue: all other IDs were compared across the four locales; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- Historical questions at IDs 36232, 36240, and 36244 remain unresolved.
  Prior Dverga/Sidhe/Pledgeshield decisions were checked; none authorizes a
  global terminology change.
- The preliminary concerns at IDs 36226 and 36249 were checked against all
  four rows. Only the pet-training verb has sufficient aligned evidence for
  an edit.

## Verification

- English, Japanese, Chinese, and active Korean each contain IDs 36201-36250
  exactly once in identical order.
- The two embedded line breaks in the three-line damage-stat description at
  ID 36211 match across all four locales. Values remain 8 Magic, 6 Melee,
  and 6 Ranged damage.
- Active default CSV SHA-256:
  `881b47e41e9d55e1110aca5978a7ecb18a231d3bf46618e57355e003ddc23030`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings are
  preserved.
- These are working dispositions, not independent final linguistic approval.

## Checkpoint

Disposition is complete through ID 36250. Resume at ID 36251; 28,884
`default` IDs remain through ID 65134. The next unused decision ID is
D-11673. Preliminary scan:
`default-ids-36251-36300-preliminary.md`.
