# Consolidated Context Review: `default` IDs 26651-26700

- Review date: 2026-10-11.
- Scope: the 16 unique prior uncertainties in D-8612-D-8613 within IDs
  26651-26700. ID 26687 was already accepted at D-18244 and is linked,
  not recounted.
- Result: one accepted correction, twelve `not an issue`, and two specific
  unresolved readings at IDs 26672 and 26680.
- English controls meaning; Japanese source and its Korean draft inform
  voice/register; Chinese is supporting evidence.

## Decisions D-19318-D-19320

| Decision | Key | Outcome | Evidence |
| --- | --- | --- | --- |
| D-19318 | `default` 26652 | accepted | Replace the inconsistent `워스워른` with the already accepted faction form `워스원(Warsworn)` per D-2857 and prior corrections. The oil-and-water metaphor and the speaker's wish to escape remain intact. |
| D-19319 | `default` 26653, 26662, 26666, 26668-26669, 26673-26675, 26684, 26686, 26698, 26700 | not an issue | The location, Templar warning, names, Faeblades, Taibreah objective, artifact custody, messenger's role, Fae raid, Revival warning, Seawatch offer, and character references remain source-traceable. Spelling questions do not establish row-local errors. |
| D-19320 | `default` 26672, 26680 | uncertain | At 26672, Japanese identifies Lady Ancilla, while English and Chinese do not establish whether `Lady's Children` is her named treasure or a broader label; retain the current generic rendering pending item/lore context. At 26680, English `our people` and Japanese `我が民` contrast with Chinese `人类`; the essay's Kollossae context makes Korean `우리 민족` plausible, but the collective's scope is not conclusive. |

ID 26687's Hanged Men name correction is linked to D-18244; it is not
recounted as a new disposition. The earlier broad not-an-issue assignment
for ID 26686 does not replace this contextual review of the Seawatch name.

## Accepted Text Edit

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 26652 | `워스워른과 여행자들이 물과 기름처럼 섞이지 못한다는 건 다들 알아.` | `워스원(Warsworn)과 여행자들이 물과 기름처럼 섞이지 못한다는 건 다들 알아.` | Reuse the approved Warsworn form from D-2857 and subsequent accepted corrections. |

## Verification

- English, Japanese source, Chinese, Japanese-derived Korean draft, and
  active Korean each contain IDs 26651-26700 exactly once in ascending order.
- The active Korean `Texto` cell at 26652 is the only content change.
  Reversing the exact substitution reproduces the pre-edit backup byte-for-byte.
- UTF-8 BOM is retained. The file retains 72,011 CRLF and 73 pre-existing
  bare-LF endings.
- The preliminary scan checked embedded line breaks, runtime-token identity
  and order, ID 26680's four line breaks, and the recipe values at 26692.
  This review independently confirmed 50 ordered IDs in each of the five files.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-26651-26700-D19318/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `59c1c500a9baf9d335764f44db900b9bc7e50fbb94d927a6bb6c70bfd36098a6`.
- Post-edit SHA-256:
  `db85756a1b919985fb49fa0bb4a1ff4066513b66b2b9fd2939bffc61ae5bf040`.
- Thirteen of the fifteen not-previously-resolved uncertainties were
  reclassified: one accepted and twelve `not an issue`; two remain uncertain.
- Totals: 2,209 accepted / 24,516 `not an issue` / 11,799 uncertain
  (38,524). Resume at D-19321, ID 26701.
