# Task6 Key Review Checkpoint

Date: 2026-11-15

## Scope And Counts

- Completed packets: `0001`-`0018`, exactly 900 unique assigned keys.
- Manual decisions: 900 unique rows; expanded key reviews: 900 rows.
- Overall dispositions: 754 retain, 145 unresolved, 1 proposed correction.
- Newly completed packets: `0016` (48 retain, 2 unresolved), `0017` (50 retain), `0018` (47 retain, 3 unresolved); no new proposals.
- English governs meaning; Japanese informs register/voice; Chinese is supporting context. Missing, conflicting, or insufficient evidence remains unresolved. Lua literals/candidates do not establish runtime display or localization linkage.
- No translation CSV, source, reference, or ledger files were changed.

## Unresolved Keys

Every unresolved key is listed below; key-specific rationale and evidence are in the manual decision JSONL.

- `affix`: for IDs `1, 6, 89, 102, 134, 153, 190, 199, 269, 300, 335, 367, 382, 406, 421, 461, 575`, variants `11, 12, 14, 21, 22, 24, FF`; ID `84`, variants `11, FF`. All 121 affix keys have missing locale data; no English `FF` value was borrowed.
- `base`: `3272`, `4336`.
- `default`: `596, 2571, 2845, 4442, 5348, 8723, 8780, 9062, 9530, 10287, 10298, 10363, 10400, 11428, 12508, 12891, 13302, 15304, 15333, 16940, 18070, 18214`.

Notable holds: `base:3272` remains unresolved because the packet variant is blank while the primary CSV and D-21506 identify variant `11`; equivalence is not established. `default:16940` retains the raider-versus-ship conflict from D-5321; `default:18214` retains the wanderer-versus-vessel conflict from D-5769. `default:18070` lacks enough role context to normalize the FQA title. `default:15304` and `default:15333` remain unresolved for insufficient label/title context.

## Proposal

- `base:891`: provisional `전승석` -> `로어스톤`. This addresses only the deferred Korean lexical-variant question: D-21766's not-an-issue decision concerned proper-name/entity registration, while D-133 supports the project term. The proposal was reviewed against all four current locale cells and does not assert Lua display linkage. It remains provisional pending independent review.

## Preserved Decisions

- `default:16906` is retained under the English/Chinese battle-tide reading, consistent with its exact-key D-5311 not-an-issue ruling; Japanese alone says the battle ended.
- `default:17711` is retained under the later D-19718 not-an-issue closure; the Korean `주문망토(Spellcloak)` preserves the English identity.
- `base:3272` remains unresolved as described above.

## Validation

- Expanded with `expand-key-reviews-0001-0018.py` using its full default bounds `0001`-`0018`.
- Ran `PYTHONDONTWRITEBYTECODE=1 python3 tools/lua_translation_candidates.py validate-key-reviews` with exactly `review-packet-0001.jsonl` through `review-packet-0018.jsonl` and `key-reviews-0001-0018.jsonl`.
- Result: passed; 900 packet keys and 900 reviewed keys (754 retain, 145 unresolved, 1 proposed correction).

## Artifacts

- Manual decisions: `key-review-decisions-0001-0018.jsonl`
- Expanded reviews: `key-reviews-0001-0018.jsonl`
- Checkpoint: `key-reviews-0001-0018-checkpoint.md`
- Expander: `expand-key-reviews-0001-0018.py`
