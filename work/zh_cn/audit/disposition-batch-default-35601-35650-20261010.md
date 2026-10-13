# Disposition Batch: `default` IDs 35601-35650

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling preliminary findings with active Korean,
  immutable English/Japanese/Chinese rows, prior decisions, terminology,
  values, and structure.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- Decisions: one accepted, three `not an issue`, and seven uncertain.
- CSV change: ID 35617.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 35601-35602 | Tyr/Hroth Magnus / Sagecraft shard instruction | Uncertain: the memoir names need canonical spelling/context review. The `마법물품 제작 제단` at 35602 is already the established Korean Sagecraft term accepted at D-263; the shard, Ice essence, socketable Gem instruction, and two-paragraph layout are retained. |
| 35604, 35608-35609 | Oracle / Oddities and Curios / Azo Raemund | Uncertain: the claim of faith and shop/merchant relations are preserved, but Oracle as an office and the shop/name forms need glossary context. |
| 35611, 35615-35616, 35618 | Hospitalis / Mitharan Dreadscale / Unbound / Keloren's Legion | Uncertain: the location comparison, named equipment, necklace, faction, and fallen Captain's ownership are retained; canonical district, item, faction, and people-name terms remain unresolved. |
| 35617 | `Crime Doesn't Pay` | Accepted: change `범죄는 대가를 치른다` to `범죄는 이득이 되지 않는다`. The English idiom means crime is not profitable; the previous Korean shifts the focus to punishment. Japanese and Chinese support the unprofitable-crime meaning. |
| 35623 | `books and recipes` / student of the world | Uncertain: the roaming student's argument is retained, but Korean `조리법` may narrow `recipes` to cooking despite the broader knowledge/crafting context. Do not choose a replacement term without corpus context. |
| 35625-35626 | Map / Niskaru Bloodhunter | Uncertain: the forgotten reason for traveling and the map as the only remaining item are retained; the enemy subtype and speaker/context need alignment. |
| 35631 | Revival / Maisie's Luck | Uncertain: the returned settler, missing belongings, named lucky ring, and promise to watch for it are preserved; proper-name forms need integrated consistency review. |
| 35633 | Five Sacred Pools / Water Lock | Not an issue: Korean preserves the English count of five and the requirement to collect drops from each pool to break the Water Lock. Japanese alone says four; this is a source-locale disagreement, not a Korean count defect. Keep the Water Lock term open for glossary review. |
| 35639, 35643 | Cursed-looking fugitive / `He's been through enough` | Not an issue: the vacant stare, strange light, flight, and apparent curse are retained; `충분히 고통받았어` conveys that the man has already endured enough. |
| 35645 | Luminitsa letter / trust comparison | Uncertain: the multi-paragraph letter, sign-off, speaker relation, truth claim, and trust contrast are retained; the exact comparison and relation between the speakers need broader context. |
| Remaining ordinary text in IDs 35601-35650 | Dialogue, labels, names, values, and structure | Not an issue: the other 32 IDs were checked in the four locales; no additional supported row-local correction was identified. |

## Historical Audit Reconciliation

- D-263 establishes `마법물품 제작 제단`; this accepted terminology is
  applied at 35602 and is not reopened by the preliminary wording concern.
- The English five-Sacred-Pools count is retained despite Japanese's four.
  The other unresolved rank, faction, item, and place names remain open.

## Verification

- English, Japanese, Chinese, and active Korean rows for IDs 35601-35650
  were checked; the five-versus-four locale conflict at 35633 was verified.
- The two embedded breaks in 35602 and five in the 35645 letter are
  preserved. No numeric or structural edits were made.
- Only the approved Korean `Texto` at ID 35617 changed. UTF-8 BOM, 72,046
  CRLF endings, and 39 pre-existing bare-LF endings are preserved.
- These working dispositions are not independent final linguistic approval.
- Resume disposition at ID 35651; 29,484 `default` IDs remain through 65134.
