# Task6 Linguistic Review Handoff

Task6A status: `PARTIAL_TASK6_READY_FOR_LINGUISTIC_REVIEW`.
These instructions and packets contain no linguistic judgments.

## Assignment And Evidence

Review only the controller-assigned packets, in their recorded order, one
packet at a time. Each contains at most 50 unique `(resource, id, variant)`
keys. Suggested disjoint assignments are packets 0001-0018, 0019-0036 and
0037-0054. Do not modify the packets, mapping, context inventory, snapshot,
candidate/comparison outputs, CSVs, assets, payloads or existing ledger.
Write separate reviewer-owned JSONL outputs.

English governs meaning; Japanese informs register/voice; Chinese is
supporting context. Read current Korean, complete utterances, applicable
canonical references, exceptions and linked groups. Use current packet
locale text rather than historical locale text embedded in duplicate groups.
Reference locators identify evidence, not a decision or proven speaker.
Inspect the linked context inventory as needed; do not load the entire
144 MiB inventory or 176 MiB candidate file to review one packet.

All candidates remain `exact_source_literal_candidate`. There are zero
direct key mappings and zero supported static localization call-site
mappings. Raw maximal ASCII matches are not established strings, decoded
constants, displayed text or localization links. A linguistically plausible
key translation does not remove that uncertainty. Parsed constant/call
evidence also retains unknown localization/display role.

## Required Key Review Schema

Emit exactly these 11 fields, one JSON object per assigned packet key:

| Field | Type and rule |
| --- | --- |
| `resource` | Exact packet string: `affix`, `base`, or `default`. |
| `id` | Exact decimal string, not a JSON number. |
| `variant` | Exact packet string; `""` for non-affix. |
| `disposition` | `retain`, `proposed correction`, or `unresolved`. |
| `reason` | Nonblank, key-specific rationale explaining evidence and limits. |
| `review_dimensions` | Nonempty array from the dimension names below. |
| `source_conflicts` | Array of nonblank conflict descriptions; `[]` if none. |
| `confidence` | Finite JSON number in `[0,1]`; confidence in this bounded disposition, not proof of runtime linkage. |
| `proposed_text` | String for a proposal; otherwise `null`. Preserve intentional layout/markers. |
| `input_fingerprints` | Exactly `{"en": "<sha256>", "ja": "<sha256>", "zh": "<sha256>", "ko": "<sha256>"}`, copied from this packet row. |
| `evidence_refs` | Nonempty array selected verbatim from this row's `available_evidence_refs`. |

Dimension names: `meaning`, `naturalness`, `voice_register`, `terminology`,
`omissions_additions`, `punctuation_layout`, `evidence_linkage`.
Record the dimensions actually reviewed; do not claim unsupported voice or
speaker context.

Any missing locale, source conflict or insufficient context requires
`unresolved`. Never borrow English `FF` into another affix variant.
`retain` means only no supported correction identified in this bounded
review, not runtime correctness. A proposed correction needs present
same-key four-language evidence and specific rationale, remains provisional,
and requires later independent review. Literal-only findings cannot authorize
a translation edit. Do not generate dispositions from heuristics or defaults.

Validate each completed assignment against exactly its packet paths:

```sh
PYTHONDONTWRITEBYTECODE=1 python3 tools/lua_translation_candidates.py validate-key-reviews \
  --packets work/zh_cn/audit/lua-corpus-review-20261115/review-packet-0001.jsonl \
  --reviews work/zh_cn/audit/lua-corpus-review-20261115/YOUR-REVIEW-OUTPUT.jsonl
```

Both flags accept multiple paths; the example is a single-packet invocation.
The validator rejects missing/extra/duplicate keys, stale hashes, malformed
fields, unavailable refs, and non-unresolved missing-locale/conflict rows.
It checks structure and evidence consistency, not linguistic correctness.

## Later Candidate Reconciliation

`candidate-id-mapping.jsonl` preserves every candidate ID and every
candidate-to-comparison relationship. Packet line-range references locate
the applicable mappings and full context records. `candidate_variant` and
`matched_english_variant` are the originally matched English variant;
`variant` is the comparison row, which may have missing English.

Join ALL mapping rows by `candidate_id`, not by ID alone or by packet.
Require a validated key review for every linked row. There are 106,309
candidate IDs and 106,611 links: 106,257 candidates have one linked row,
two have two rows and 50 have seven rows. Affix relationships can cross
packet or worker boundaries.

Do not fan out one retain/proposal across variants. Preserve every
variant's rationale, text, proposal, conflicts and evidence. Any missing
locale or unresolved conflict requires the candidate to remain unresolved.
Differing per-variant proposals cannot be represented by one candidate-level
`proposed_text`; keep unresolved unless the controller explicitly reconciles
the variants with independent review. No automatic aggregation or judgments
are supplied by Task6A.

Before calling `validate_adjudications`, enrich COPIES of the frozen
candidates with their resource's four-locale `input_fingerprints` and the
COMPLETE list of packet rows under `comparisons`, obtained from the mapping.
The validator cannot discover an omitted comparison without that mapping.
Never alter `candidates.jsonl`. Final candidate decisions have exactly these
nine fields: `candidate_id`, `disposition`, `reason`, `confidence`,
`proposed_text`, `review_dimensions`, `source_conflicts`, `evidence_refs`,
`input_fingerprints`. Do not add an evidence-level promotion field.
