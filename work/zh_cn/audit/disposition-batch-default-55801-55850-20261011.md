# Disposition Batch: `default` IDs 55801-55850

- Date: 2026-10-11. Compared all 50 active IDs with English, Japanese,
  Chinese, the preliminary scan, source-keyed historical notes, prior
  terminology decisions, lineation, runtime markers, and numeric values.
  These working dispositions are not independent final linguistic approval.
- One accepted correction, 33 `not an issue` IDs, and 16 uncertain IDs.

## Accepted Correction

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 55832 | `그 쌍두 놈들 중 하나가 그걸 억지로 떼어 냈어. 둘이 바보처럼 낄낄거리며 호수로 가져갔지.` | `그 쌍두 놈들 중 하나가 그걸 억지로 떼어 냈어. 마치 바보 한 쌍처럼 낄낄거리며 호수로 가져갔지.` | English `like a pair of fools` is a simile, not a statement that two creatures carried the object. Korean `둘이` asserted two actors; the edit restores the simile without resolving the source's omitted subject. |

## Uncertain Findings

| ID | Decision | Rationale |
| ---: | --- | --- |
| 55802 | Uncertain | The witnessed attack and fear for Billis are preserved; the canonical Korean form of the named creature/person needs context. |
| 55804 | Uncertain | English `herald the power` can mean announce or manifest it; Japanese supports announcing while Chinese suggests bearing the power. |
| 55808 | Uncertain | `Bvvgiw` is retained as printed because its identity as a name, code, or opaque source string is unknown and locale renderings diverge. |
| 55812 | Uncertain | The loss of Sun Camp, Argine's attribution of blame, and hope of prevention are preserved; names and setting forms remain provisional. |
| 55816 | Uncertain | Capitalized `Legion` may be a formal faction or a generic force, matching the unresolved distinction at D-13136. |
| 55819 | Uncertain | The appeal to seek the goddess's favor and the magic/mystery/fate triad are retained; the antecedent of “her” is contextual. |
| 55820 | Uncertain | `Master Makers` may be a formal group/title or generic master craftspeople; prior corpus decisions remain open. |
| 55823 | Uncertain | All six paragraphs and the sequence of losses, settlement, discovery, and construction are retained; the “ring this from the rag of Amalur” source phrase and several lore relations remain opaque. |
| 55829 | Uncertain | `Level 4 Familiar` may denote a summoned familiar or a familiarity/rank value; locale readings conflict, as at D-16646. |
| 55830 | Uncertain | The ledger, gratitude, and Jottun simile are preserved; the Lunala exclamation and canonical names remain unsettled. |
| 55834 | Uncertain | The death report and return to the Alfar army are retained; the gender implication and canonical title form of `Witch Knight` need consistency review. |
| 55837 | Uncertain | The standalone name is retained bilingually; Lykeios has divergent phonetic forms and its entity type is context-dependent. |
| 55838 | Uncertain | The upbringing, fishing, allegiance to General Tilera, and self-forgiveness wish are retained; canonical place/person forms remain open. |
| 55841 | Uncertain | `House of Valor` is retained bilingually, but its canonical Korean faction/house form remains open in prior decisions. |
| 55846 | Uncertain | The plan to resurrect Fyragnos and destroy Detyre is retained; the identity and canonical Korean form of Belen's Testament remain unresolved. |
| 55850 | Uncertain | The literal label `Center of the space` is translated, but its UI or spatial context is absent. |

## Not an Issue

The other 33 IDs retain the apparent English meaning and structure. This
includes the mainland-castle comparison despite the source's duplicated
`of` (55806), the bone-and-carapace armor including gauntlets (55810), the
courtly-procedure complaint (55821), the Boggart/Thresh warning relation
(55822), and the distinction between the dagger threat and the unspecified
object at 55826. The remaining source ambiguities are not expanded into
unsupported Korean claims.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 55801-55850 once
  in identical ascending order; each default CSV contains 65,135 records.
- Line-break counts, recognized runtime tokens, and numeric values match.
  ID 55823 has six paragraphs and 10 newline characters in each locale.
- Rechecked the source-keyed historical range `55750-55849`, including
  Ethene/herald, Bvvgiw, Sun Camp/Grim/Crilgarin, Legion, Master Makers,
  the six-paragraph Ouranos/Ethenias/Teeth account, Level 4 Familiar,
  Lunala/Jottun wordplay, Witch Knight, Lykeios/Tilera, House of Valor, and
  Belen's Testament. Historical questions are prompts, not approvals.
- The pre-batch CSV matches the byte-identical backup at
  `/private/tmp/ko-translate-backups/20261011/before-resume-55801/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `d0fbc04970a351a4ea48aa460287dfc5dfb97205415d4faf7d57808829e20315`).
  Only the approved `Texto` cell at ID 55832 changed. Post-edit SHA-256:
  `c6ba5ed3d9e55a1ec7f209382408cd8496b29a7a4614794389bf8f95a2eb7c9d`.
  UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and 39
  pre-existing bare-LF endings are preserved.

Decisions D-16837 through D-16853 record the accepted correction and 16
uncertain findings; D-16854 records the remaining 33 `not an issue` IDs.
Direct register totals: 1,634 accepted, 11,102 `not an issue`, and 10,375
uncertain (23,111 total); next D-16855.

Resume at `default` ID 55851; 9,284 IDs remain through ID 65134. The next
preliminary scan is
[`default-ids-55851-55900-preliminary.md`](default-ids-55851-55900-preliminary.md).
