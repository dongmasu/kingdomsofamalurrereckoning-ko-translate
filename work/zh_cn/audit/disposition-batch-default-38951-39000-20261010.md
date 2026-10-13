# Disposition Batch: `default` IDs 38951-39000

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: two accepted, one `not an issue`, and two uncertain.
- CSV changes: IDs 38977 and 38978.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 38977 | The Telling / `구전 이야기` | Accepted: change to `전승(The Telling)`, reusing the accepted named-lore rendering at IDs 10017 and 10040 (D-2872, D-2881). English explicitly defines The Telling as the ongoing shared story; retain the sentence's explanation. |
| 38978 | Quake Mana Cost / `퀘이크 소모 마나: 10` | Accepted: change to `퀘이크 소모 마나 +10`. English/Japanese/Chinese specify a 10-Mana cost increase; the former Korean label could be mistaken for the total cost. Damage, stun chance/duration, and value remain unchanged. |
| 38991 | Flawless Mitharan Piercing Handle / `완벽한 미사루식 관통 손잡이` | Uncertain: the component category and modifiers are represented, but `미사루식` may be confused with Mitharu and prior decisions leave the canonical Mitharan form/item segmentation unresolved. |
| 39000 | Nix verse / compact Korean prose | Uncertain: English uses a four-line rhyme ending in Creth and Airmer's fall. Korean preserves events but not the rhyme; Japanese and Chinese also differ in literary form, so the right adaptation needs integrated verse review. |
| Other rows in IDs 38951-39000, excluding separately listed findings | Dialogue, names, values, objectives, items, UI, and markers | Not an issue: no additional supported row-local correction was found. |

## Historical Audit Reconciliation

- Accepted The Telling decisions D-2872 and D-2881 establish the Korean
  display `전승(The Telling)` for capitalized lore usage. This is a
  row-local reuse, not a full-corpus normalization.
- Earlier Mitharan component decisions continue to defer material spelling
  and item segmentation; no global form is inferred here.
- The source-keyed audit has a documented gap for IDs 37700-40349. These
  are working dispositions, not independent linguistic approval.

## Verification

- The 10-Mana increment is preserved as an increment, not a total, and all
  damage/stun values remain unchanged.
- The preliminary comparison reports matching keys/order, line-break
  counts, and runtime-marker identities/order; verse form remains a
  separate open content question.
- The active CSV's UTF-8 BOM, mixed line endings, and SHA-256 are recorded
  after verification below.
- No immutable source or prohibited directory was edited.
- Byte-level verification: SHA-256
  `d9db022adfe28def4e57752fd48fbc242c8300a7895063d36b5ce26732835ba4`;
  UTF-8 BOM present, 72,046 CRLF endings, and 39 bare-LF endings. Both
  approved Korean texts are present in the active CSV.

## Checkpoint

Disposition is complete through ID 39000. Resume at ID 39001; 26,134
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-39001-39050-preliminary.md`. Decisions D-12514 through D-12518
are recorded in the register; the next unused decision ID is D-12519.
