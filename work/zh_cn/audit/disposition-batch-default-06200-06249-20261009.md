# Disposition and Edit Batch: `default` IDs 6200-6249

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and applicable historical questions for
  `default` IDs 6200-6249.
- Compared immutable English, Japanese, and Chinese rows with active Korean.
  English governed meaning; Japanese informed voice/register; Chinese was a
  supporting cross-check.
- Eight findings were dispositioned: one accepted, two `not an issue`, and
  five uncertain. One accepted `Texto` cell was changed.
- This is a working disposition, not independent final linguistic approval.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 6203 | `taint of Prismere` | Keep the corruption/taint sense; leave the proper-name spelling open. | D-1668: not an issue. |
| 6204 | `Deadeye` | Defer whether this isolated label is an ability, title, or another category. | D-1669: uncertain. |
| 6208 | `Flawless Mitharan Illuminator's Hilt` | Defer the item/component relation and Mitharan/Illuminator terminology. | D-1670: uncertain. |
| 6212 | `Ruin of Aodh` | Keep the clear ruin/fire-element meaning; defer canonical Aodh spelling and exact lore sense of `element`. | D-1671: uncertain. |
| 6215 | `hired her to ferry us` | Restore the explicit hiring relation while retaining the casual speaker voice. | D-1672: accepted. |
| 6220 | `Master's Pick` | Keep the lockpick reading, supported by the Japanese wording and prior decisions at IDs 3520, 3755, and 5766. | D-1673: not an issue. |
| 6231 | `Preordained` | Defer the canonical Korean form for this potentially named group. | D-1674: uncertain. |
| 6248 | `The Fae have taken my husband!` | Keep the current broad `데려갔어요`; English does not establish abduction as specifically as the supporting references. | D-1675: uncertain. |

## Applied Correction

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 6215 | `브래티건 선장(Captain Brattigan)과는 처음 항해할 때부터 함께였어. 남편과 나는 포리안 해협(Phorian Strait)을 건너 아데사로 데려다 달라고 선장에게 부탁했지.` | `브래티건 선장(Captain Brattigan)과는 처음 항해할 때부터 함께였어. 남편과 나는 포리안 해협(Phorian Strait)을 건너 아데사까지 태워다 달라며 선장을 고용했지.` | D-1672: restore the explicitly stated hiring arrangement. |

## Historical Audit Reconciliation

- Rechecked the source-keyed questions for IDs 6203-6204, 6208, 6212,
  6215, 6220, and 6231, plus the direct preliminary finding at 6248.
- ID 6203's `taint` meaning is retained; the Prismere spelling remains a
  separate corpus-wide terminology issue.
- ID 6220 agrees with the established `Master's Pick` tool reading in prior
  dispositions; no duplicate correction was made.
- IDs 6204, 6208, 6212, and 6231 remain unresolved for context or
  corpus-wide terminology. At 6248, the Japanese and Chinese specify
  abduction while English only says `taken`; the Korean was not intensified.

## Structural Verification

- English, Japanese, Chinese, and Korean each contain 65,135 `default` IDs
  in identical order; IDs 6200-6249 are present in matching order.
- The accepted edit at ID 6215 changes no runtime marker, explicit line
  break, or numeric value.
- The Korean CSV retains its UTF-8 BOM, semicolon delimiter, CRLF record
  endings, and zero bare LF/CR bytes.
- Only the approved `Texto` cell at ID 6215 changed in this batch.
- Active Korean `default` CSV SHA-256:
  `730169f6d1faccffd42a5f6deaaa7d028473d4164ace190f4cdc4a87ba145256`
- Cumulative dispositions: 303 accepted, 469 `not an issue`, and 903
  uncertain. Resume at `default` ID 6250; 58,885 rows remain.

Findings are working dispositions, not independent linguistic approval.
Corpus-wide terminology, combined-name consistency, and integrated voice
review remain open.
