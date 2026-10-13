# Disposition Batch: `default` IDs 56851-56900

- Date: 2026-10-11. Rechecked all 50 active Korean rows against the
  English, Japanese, and Chinese source CSVs under `src/csv/`, the active
  Korean CSV, historical audit prompts, recurring terms, line breaks,
  runtime markers, and values. English was the semantic anchor; Japanese
  informed voice/register and Chinese was supporting evidence. These
  working dispositions are not independent final linguistic approval.
- Two accepted corrections, 31 `not an issue` IDs, and 17 uncertain
  findings. The two corrections restore the explicit game/player reference
  and repair a sentence fragment; lore, title, and context questions remain
  open.

## Accepted Corrections

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 56877 | `하지만 우리만 싸우는 건 아니야. 에라셀 평원에는 이 싸움에서 너무 오래 떠나 있던 사람이 있어. 틸레라 장군에게 연락할 때가 됐어.` | `하지만 우리만 싸우는 건 아니야. 에라셀 평원에는 이 게임을 너무 오래 떠나 있던 플레이어가 있어. 이제 틸레라 장군에게 연락할 때가 됐어.` | English explicitly says `a player ... away from this game`, and Chinese also says a player left the game; Korean had reduced both to a person away from a fight. Japanese interprets it as a battle, but English is primary. Restore the meta-game wording without changing the next objective. |
| 56900 | `내가 웨인 에문다스(W. Emundas), 친구여. 무엇을 도와드릴까? 우리 사이는 특별하고, 오래도록 이어질 테니.` | `친구여, 웨인 에문다스(W. Emundas)가 무엇을 도와드릴 수 있을까? 우리 사이는 특별하고, 오래도록 이어질 테니.` | English asks how W. Emundas can be of service; Japanese and Chinese agree on the offer of help. The previous Korean opening was a sentence fragment. The correction restores a complete service offer and preserves the following relationship statement. |

## Uncertain Findings

| ID | Decision | Rationale |
| ---: | --- | --- |
| 56851 | Uncertain | The relic's protective purpose is clear, but `Gnome enchanter` as a formal profession/class and the relic account need lore alignment. |
| 56852 | Uncertain | The race's experience is distilled for later generations; `axioms` may mean principles or teachings rather than mathematical/logical axioms. |
| 56854 | Uncertain | Wencen's epithets are retained, but locale readings differ on several titles and whether the Gilded Gorgon is a ship. |
| 56861 | Uncertain | `Trick` may mean a scheme or trap; Korean's `함정` is plausible but context-specific. |
| 56868 | Uncertain | Access to the Reserve Armory is retained, but the granting subject and whether it is a named facility remain unclear. |
| 56869 | Uncertain | The execution sentence is clear, but translating `Cointaker` as “coin hunter” may misread a proper surname; canonical name treatment is open. |
| 56870 | Uncertain | `Offering` may be a named ritual, sacrifice, or tribute; the Korean `공물` is plausible but not settled. |
| 56871 | Uncertain | English/Japanese say justice; Chinese adds compensation. Korean follows English, but justice versus retribution/compensation is context-sensitive. |
| 56873 | Uncertain | English/Japanese associate the relic with King Ysa's followers; Chinese instead says it is decorated with the king's flower. Korean follows English/Japanese. |
| 56878 | Uncertain | The five-line creation verse is retained, but `Architect` and `Sidhe` have unresolved canonical forms and referents. |
| 56879 | Uncertain | `House of Valor` may denote a faction, institution, or physical hall; Korean selects a hall. |
| 56880 | Uncertain | Quotation turns and paragraph structure are retained, but the speakers/antecedents and the register of `and why not?` need context. |
| 56888 | Uncertain | The service/succession sequence is preserved, but English's `lands before him` is compressed and the Korean land/ownership relation is syntactically dense. |
| 56889 | Uncertain | `Good Humors` may be a named item/effect or an ordinary mood phrase; the isolated label does not decide. |
| 56890 | Uncertain | English calls it a whistle, Japanese a flute, and Chinese a whistle-flute. Korean follows English; the exact instrument type needs item context. |
| 56897 | Uncertain | `Trigger Hall Belens` may be an internal/test label or an in-world action/location; the sources parse the phrase differently. |
| 56898 | Uncertain | The Office of the Primos is retained, but whether Primos is a title/person and the UI function are unclear. |

## Not an Issue

The remaining 31 IDs are 56853, 56855-56860, 56862-56867, 56872,
56874-56876, 56881-56887, 56891-56896, and 56899. They preserve the
evident source meaning, register, and structure; unresolved proper names
remain provisional where appropriate.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and active Korean each contain IDs 56851-56900
  once in ascending order. Each default file has 65,135 records with
  identical full key order.
- Line-break counts match throughout, including the five-line creation verse
  at 56878 and the multi-voice quoted passage at 56880. Runtime-marker
  identities and order match.
- Japanese uses digits for “three” and “one” where English/Chinese/Korean
  spell the same counts out at IDs 56863 and 56896; no value discrepancy
  was found.
- Reconciled historical prompts for IDs `56850-56949`, including Enke,
  `axioms`, Wencen, the Offering, justice, the player/game metaphor,
  Architect/Sidhe, House of Valor, the witch passage, Good Humors, the
  crystal whistle, Hall Belens, and W. Emundas. These prompts informed
  review but do not independently confirm a disposition.
- Only the approved `Texto` cells at 56877 and 56900 changed. The active CSV
  retains its UTF-8 BOM, 65,135 records, key order, 72,045 CRLF endings, and
  39 pre-existing bare-LF endings. Post-edit SHA-256:
  `41e22e7989b15ea6f2e8e459f30c566fa4e9c1c6272d6eba6796c4223f9e6b48`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-56851/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `6c1897f4b72f83cb6fc239034020ac249cb31c6c950c68b89255d13ddcfb4244`).

Decisions D-17132 and D-17133 record the accepted corrections; D-17134
through D-17150 record the 17 uncertain findings; D-17151 records the
remaining 31 `not an issue` IDs. Direct register totals: 1,673 accepted,
11,886 `not an issue`, and 10,611 uncertain (24,170 total); next D-17152.

Resume at `default` ID 56901; 8,234 IDs remain through ID 65134. The next
preliminary scan is
[`default-ids-56901-56950-preliminary.md`](default-ids-56901-56950-preliminary.md).
These are working dispositions, not independent final linguistic approval.
