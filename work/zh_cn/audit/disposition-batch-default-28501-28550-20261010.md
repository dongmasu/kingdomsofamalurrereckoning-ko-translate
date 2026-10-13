# Disposition and Edit Batch: `default` IDs 28501-28550

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  28501-28550, checked against English, Japanese, Chinese, active Korean,
  and the historical audit.
- Decisions: zero accepted, two `not an issue`, and six uncertain.
- No CSV wording changed.

## Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 28511 | `{1}` hold-to-fire instruction | Not an issue: the button placeholder and hold action are preserved. English/Chinese do not say to release the button, so the Japanese-only release instruction is not added. |
| 28530 | `워스워른의 시초` / “first of the Warsworn” | Not an issue: `시초` can express the beginning/origin of the order, and Japanese explicitly describes Eagonn as its founder. The precise rank remains in the historical terminology inventory. |
| IDs 28501-28550 structural and remaining ordinary text | Keys/order, line breaks, `{1}`, nested markers, and unflagged dialogue/objective text | Not an issue: each locale contains the 50 IDs once in identical order; the placeholder and nested marker sequence at ID 28524 are retained, with no actionable structural mismatch. |
| 28522 | Travelers / letter delivery | Uncertain: the delivery chain and final possession are preserved, but capitalized Travelers may be a formal courier group; align with related entries. |
| 28527 | `속이 다 시원하군` for “That was bracing!” | Uncertain: English can mean invigorating, Korean expresses relief/satisfaction, and Japanese/Chinese differ again. Speaker tone and context are needed. |
| 28532 | `뒤섞인 거래` / “Mixed Business” | Uncertain: this isolated title may be a literal label or a business/relationship idiom; Japanese and Chinese also diverge. |
| 28538 | `거래를 하려 했다` / “wanted to deal” | Uncertain: the line may refer to card dealing, negotiation, or a general transaction. Historical notes specifically flag the card-game possibility. |
| 28544 | `커(Cur)` | Uncertain: English capitalizes the name, Japanese transliterates it, and Chinese reads it as a vicious dog. Preserve the requirement to kill it before entering Bhaile pending context. |
| Other named terms in IDs 28501-28550 | EAP, Tuatha Swordsman, Orella, Niskaru, Death Notices, Airancourt, Henge, Primos, Tidal Pools, Eagonn, Dolve Arne, Cur, Hireling | Uncertain: retain current identities pending canonical spelling, faction, rank, item, and lore-term alignment. |

## Verification

- The source comparison used English, Japanese, and Chinese rows from
  `src/csv/`; the active Korean rows and historical notes were also checked.
- IDs 28501-28550 occur once in each locale in identical order. Embedded
  line-break counts and normalized runtime-token identities/order match.
- No Korean `Texto` cell or source CSV changed in this batch.
- Active default CSV SHA-256 remains
  `0859bb3c801ecab1922860471d810f3a52097e029b484a46c39026e2f49bc8b4`.
  UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings remain.
- Register totals after this batch: 879 accepted, 3,010 `not an issue`, and
  5,025 uncertain (8,914 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 28551; 36,584 `default` rows remain.

These working dispositions do not constitute independent final linguistic
approval.
