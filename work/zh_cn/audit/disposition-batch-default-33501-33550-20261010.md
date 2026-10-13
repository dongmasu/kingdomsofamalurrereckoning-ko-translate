# Disposition Batch: `default` IDs 33501-33550

- Decision date: 2026-10-10.
- Scope: all 50 IDs and the fourteen findings in the preliminary scan,
  reconciled with English meaning, Japanese register, Chinese supporting
  evidence, historical audit, active Korean, and structure.
- Decisions: one accepted, three `not an issue`, and ten uncertain findings,
  plus one `not an issue` disposition for the remaining ordinary text.
- CSV change: ID 33539 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 33503 | Travelers need `discipline` / `규율` | Uncertain: source ellipsis may imply self-control, punishment, or imposed order; Japanese and Chinese do not resolve the intended threat. |
| 33511 | Alchemy skill +2 unit | Uncertain: English gives only +2; Japanese says levels and Chinese says points. Preserve the value without inventing a unit. |
| 33514 | `de-sist ‒ I mean, I insist` | Not an issue: Korean's `그만두겠…… 아니` reproduces the deliberate self-interruption and then states the toll condition; the exact English wordplay cannot be carried over literally. |
| 33520 | +2 Physical Damage with Longbows | Not an issue: the value, physical-damage category, and longbow scope are retained. The +5% line and blank separator also remain structurally intact. |
| 33521 | `Grand Bursar's` possessive fragment | Uncertain: Korean preserves the possessive fragment, but the title and implied following noun remain unresolved in prior corpus decisions. |
| 33523 | `in her time` / `살아 계실 때` | Not an issue: the English phrase refers to the mother's lifetime, and Japanese/Chinese explicitly support the lifetime reading; no row-local correction is warranted. |
| 33527 | Bloody Bones | Uncertain: Japanese transliterates the capitalized phrase while Chinese translates its components; name/title status and canonical display form remain open. |
| 33528 | `Red in Tooth and Claw` / `핏빛 이빨과 발톱` | Uncertain: the English idiom can mean savage or violent, while Japanese keeps a literal tooth/claw image and Chinese gives the idiomatic sense. Title/context is needed before replacing the Korean. |
| 33532 | House of Ashmoor / `애쉬무어 가문` | Uncertain: the English house may be a family/noble house or a place/stronghold; locale readings differ. |
| 33533 | `berk` and `the Quarters` | Uncertain: Korean omits a possible insult, but the English is compressed and Japanese/Chinese interpret the Quarters differently. No safe row-local edit is established. |
| 33539 | `good village` / `선량한 주민들` | Accepted: change to `이 살기 좋은 마을의 주민들은 그저 농부가 아니라 최고 계층에 속했다.` English modifies the village, not the residents' moral character; Chinese also describes the village itself positively. |
| 33542 | `special breed` / `특별한 혈통` | Uncertain: English and Japanese can mean a distinct kind/species, while Chinese supports lineage; the intended group identity is context-dependent. |
| 33547 | `Systems Administrators` / `시스템 관리자` | Uncertain: English/Japanese retain the English label, while Chinese/Korean translate it; user-facing versus internal-label status is not established. |
| 33550 | `Activity - CarryLumber` | Uncertain: it may be a player-facing activity or internal/debug identifier; preserve current wording pending UI/context evidence. |
| Remaining ordinary text in IDs 33501-33550 | Dialogue, labels, and structure | Not an issue: no additional supported row-local defect; all 50 ordered IDs and inspected structures align. |

## Verification

- Active default CSV SHA-256:
  `354a7742b2e2796a1499376332c21357914472703321f179ba2b08f1b9cfd7db`.
- UTF-8 BOM, 72,046 CRLF, and 39 pre-existing bare-LF endings are preserved.
- ID 33539 is the only authorized CSV text edit in this batch.
- Cumulative register after recording this batch: 1,020 accepted, 3,702
  `not an issue`, and 6,121 uncertain (10,843 categorized decisions,
  excluding duplicate D-5305/D-5306).
- Resume at ID 33551; 31,584 default IDs remain through ID 65134.
- This is a working disposition, not independent final linguistic approval.
