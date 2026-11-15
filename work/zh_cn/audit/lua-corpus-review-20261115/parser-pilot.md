# Lua Structural Parser Pilot

Date: 2026-11-15. The original outcomes below are a read-only, static
structural pilot, not a decompiler, translation review, or runtime test.
The approved design remains authoritative. Task 2 passed independent
specification and quality review per the Task 3 handoff. The separate Task 3
instruction analyzer and Task 4 output contract are checkpointed below;
they have not yet passed independent review.

## Outcomes

[Deterministic results](parser-pilot-results.jsonl) contain every selected
occurrence's exact key, source kind, payload path, SHA-256, length, status,
diagnostic, function ranges and metadata, constant-tag counts, and opcode
populations. The inventory supplies container-level provenance. All offsets
below are payload-relative; ranges are half-open. `unknown` means parsing
stopped, not zero.

| Payload file | Kind | Status | Functions | Words | Root range | Constant tags: count |
| --- | --- | --- | ---: | ---: | --- | --- |
| `lua-00000002.bin` | bxml | success | 2 | 31 | [238,607) | 0:8, 1:1, 3:1, 4:8 |
| `lua-00000001.bin` | bxml | success | 2 | 31 | [238,607) | 0:8, 1:1, 3:1, 4:8 |
| `lua-00000058.bin` | bxml | success | 2 | 9 | [238,384) | 1:2 |
| `lua-00000203.bin` | bxml | success | 2 | 24 | [238,500) | 0:4, 1:2, 4:4 |
| `lua-00000391.bin` | batch_bxml | success | 2 | 35 | [238,592) | 0:6, 1:2, 3:1, 4:7 |
| `lua-00001159.bin` | batch_bxml | success | 2 | 267 | [238,2005) | 0:6, 1:2, 3:1, 4:35 |
| `lua-00003475.bin` | batch_script | success | 4 | 344 | [238,3407) | 0:50, 1:1, 4:67 |
| `lua-00003977.bin` | batch_script | success | 1 | 10 | [238,389) | 0:4, 4:4 |
| `lua-00002721.bin` | batch_script | success | 23 | 625 | [238,7654) | 0:148, 1:3, 3:16, 4:193 |
| `lua-00001487.bin` | batch_script | unsupported | unknown | unknown | unknown | unknown |
| `lua-00005198.bin` | batch_bxml | success | 2 | 9 | [238,384) | 1:2 |
| `lua-00008481.bin` | bxml | success | 2 | 16 | [238,458) | 0:2, 1:1, 3:1, 4:2 |
| `lua-00011815.bin` | bxml | success | 2 | 541 | [238,3906) | 0:6, 4:48 |

Twelve successes, one unsupported, zero malformed; 46 functions and 1,942
raw instruction words in successful occurrences only. The results file
records each prototype's exact boundaries and each payload's complete
numeric-opcode population. Aggregate constant tags: 0:242, 1:17, 3:21,
4:376. Success means all bytes are accounted for, including the exact
8-byte opaque trailer. It does not validate instruction references, jumps,
cache/data framing, opcode meaning, or runtime behavior.

The unsupported `cheats` payload (`lua-00001487.bin`, 455,233 bytes) stops
at byte 110835, value `07`, in the candidate vararg field. The exact error
is `unsupported_function_header`, `unverified vararg=7`. Raw bytes at
[110827,110859) are
`00000000000000000700000008000000a2aa0000018c0001147e020201aa0003`.
The observed last eight bytes are reported as raw bytes only, not validated
as a trailer. Its function count, ranges, constants, opcode populations,
remaining structure, and full consumed length are unknown.

## Corroboration And Limits

The independent pinned FFQ35 probe agrees on all three sample SHA-256s,
27 prototype ranges, 687 raw instruction words, constants and child
relationships. The test independently reads big-endian counts, instruction
words, constant tags/lengths and child boundaries from raw bytes for each of
the 12 successful pilot payloads, and checks every zero suffix and trailer.
This validates framing against these inputs, not arbitrary bytecode.

For example, `xxd -g 1 -s 238 -l 80` on `lua-00000058.bin` and
`lua-00005198.bin` shows identical root prefix/header and initial words
across standalone and batch BXML; `lua-00003977.bin` shows the same framing
in a batch script with a different stack and code count. At offset 238 the
first 16 bytes are zero for those roots; their code counts are at 267 and
code starts at 271. Across all successes the first two prefix words and
three suffix words are zero, while the last two prefix words are sometimes
nonzero (34 of 46 functions). Those 16 prefix bytes and 12 suffix bytes
are retained as opaque: the last pair's apparent line-number interpretation
is not asserted. The exact observed trailer is `0000000100000000` in all 12
successes, with no meaning assigned. These examples corroborate framing,
not every possible value or layout. The remaining pilot, nonzero first
prefix words, nonzero suffixes, other trailer forms, nonzero upvalue counts,
other vararg values, unknown constant tags and other headers/tables are
unsupported; no resynchronization is attempted.

`decode_fields` uses the probe's field layout; numerical opcode counts are
not semantic support. The structural reader does not identify DATA words,
control flow, references, calls, localization keys, speaker, or display behavior.
Even a structurally accepted payload can contain semantically invalid words.
The 13 selected occurrences do not establish corpus-wide coverage.

## Task 3 Contract

`parse_payload(payload: bytes)` returns JSON-safe data, or raises
`ParseError(ValueError)` with string `code`, integer payload-relative
`offset`, and nonempty `detail`. Prefixes `unsupported_` and `malformed_`
distinguish unverified features/resource limits from malformed input.
The caller must associate the hash with its occurrence key, container path
and payload offset; the parser does not infer provenance or localization.
No partial functions are returned on error.

- Top-level object: `payload_sha256` (lowercase hex), `functions` (preorder
  list), `opaque_regions` (byte-order list).
- Function: `path` (zero-based child-index array, root `[]`), `start`,
  `end`, `metadata`, `instructions`, `constants`, `child_paths`. The
  function range includes its children and its suffix, so nested ranges
  overlap their ancestors. `child_paths` is ordered.
- Function `metadata`: `prefix_words` (four unsigned big-endian 32-bit
  integers), `nups`, `params`, `vararg`, `stack`, `suffix_words` (three
  unsigned big-endian 32-bit integers). These field labels describe the
  probe's interpretation, not verified runtime semantics.
- Instruction: `pc` (zero-based), `offset`, `word` (unsigned 32-bit),
  `opcode`, `a`, `b`, `c`, `bx` (raw integer fields),
  `semantic_support` and `reference_support` (both always `unassessed`).
  In particular, a word with numeric opcode 70 is not automatically marked
  as a cache word or treated as executable.
- Constant: `index` (zero-based), numeric `tag`, `type` (`nil`, `boolean`,
  `integer`, `string`), `value`, `start`, `end`, `raw_hex`. `raw_hex`
  covers the complete encoded constant including tag, string length and
  terminator. String constants additionally have `bytes_hex` (raw content,
  excluding the final NUL), `data_start` and `data_end` (content range).
  `value` is decoded UTF-8 when valid and `null` otherwise; empty and
  non-UTF-8 bytes remain exactly recoverable. Nil also uses `null` but has
  a different `type`. Integer values are signed 32-bit.
- Opaque region: `kind` (`function_prefix`, `function_suffix`, `trailer`),
  `start`, `end`, and `raw_hex`. The caller can recover exact byte ranges;
  opaque labels confer no semantic meaning.

Supported prototype framing is the probe's four prefix words, two count
words, one vararg byte, stack word, counted four-byte code words, counted
tagged constants, counted recursive children, and three suffix words.
No padding or resynchronization is inferred. Limits are 8 MiB per payload,
depth 64 (root depth 0), 10,000 functions and 300,000 combined declared
instruction/constant/child/string-byte items. Counts are checked against
remaining bytes before allocation; limits are explicit unsupported
dispositions, not claims that an input is malformed.

## Task 3 Instruction Support

`analyze_function(function: dict) -> dict` consumes one function from
`parse_payload`, including its constants and ordered `child_paths`. It is
deterministic, JSON-safe, static, and does not mutate the function. It does
not import the sample probe; the probe is test-only provenance.
`parse_payload` and its exact Task 2 schema/results are unchanged.

Support comes from the pinned [FFQ35 report](../ffq35-lua-sample-20261115.md)
and [disassembly](../ffq35-lua-sample-20261115.disassembly.txt), not opcode
names. `S` below is script SHA-256
`2b0ba91abe92a761ae7f28330f5765f74a1f45101cf879745a740b43697578b5`;
`Q0` and `Q1` are quest payload hashes
`604abfc9f55fdccb5b276b23de8027683f993f898e5907234a65bbfb5bbc69b4`
and `f3ac587da8ba1cbd92c34d054ff14c8a9776b10b042ecebc9d4bc2b4f9eaec12`.
All PCs are zero-based, offsets payload-relative. Tests check literal
words against raw pinned bytes for every declared rule, all eight observed
CALL count pairs, both LOADBOOL forms, both RETURN forms, and EQ register
and constant operands. Synthetic mutations test rejection, not new support.

| Opcode / Label | Checked Rule And Conservative Effect | Pinned Example: Payload, Path, PC, Raw Word |
| --- | --- | --- |
| 2 / CALL_I | A callee register; fixed B includes callee; arguments R[A+1..A+B). Supported (B,C): (3,1), (2,1), (2,2), (2,0), (0,2), (0,1), (5,1), (4,1). C=2 checks result R[A]. B=0 has unknown argument arity; C=0 unknown result arity. Every call forgets R[A..stack), never propagates return values. | S, [], 8, `04060100`; other count pairs pinned across S children |
| 4 / EQ | A is a 0/1 flag, B a register; C<256 register, otherwise K[C-256]. Only the observed following-JMP pattern. Both next-word and skip-word edges, without evaluating the comparison. | S, [0], 7, `08020200`; constant form PC 19, `08050d00`; Q0 [0] PC 22 has A=1 |
| 9 / RETURN | A bounds; only B=1 or 2, C=0; terminal. B=1 does not claim a value read. No returned-value propagation. | S, [], 76, `12020000`; Q0, [], 1, `12040000` |
| 13 / LOADBOOL | A write; only (B,C)=(1,0) or (0,1), loading true/fallthrough or false/skip one raw word. | S, [0], 83, `1a020003`; Q0, [0], 24, `1a000102` |
| 25 / LOADK | A write, K[Bx] bounds; constant value provenance. | S, [], 2, `32000301` |
| 27 / SETGLOBAL | A read, K[Bx] string; a known closure yields a static global assignment. No global environment or cross-function propagation. | S, [], 24, `36000e00`; closure assignment PC 33, `36001900` |
| 28 / JMP | Only A=0; destination PC+1+Bx-65535 must be an instruction start, not a cache/DATA marker. | S, [0], 8, `39002300` |
| 60 / CLOSURE | A write, Bx bounds in ordered child_paths; no upvalue support beyond Task 2's nups=0 contract. | S, [], 32, `78000000` |
| 67 / GETFIELD_R1 | A write, B read, K[C] string; exactly two following opcode-70 words owned as opaque cache. Provenance is only a global plus one field; other bases overwrite A with unknown. | S, [], 5, `86040702` |
| 85 / GETGLOBAL_MEM | A write, K[Bx] string; exactly one following opcode-70 word owned as opaque cache. Produces load-site lookup provenance, not runtime function identity. | S, [], 0, `aa000000` |
| 70 / DATA marker | Auxiliary only with an identified owner under 67/85. Never interpreted as register operands. Internal cache fields are opaque; no cache-slot meaning inferred. Unowned markers are unsupported, not proof of malformed payloads. | S, [], 1, `8c000114`; PCs 6/7, `8c000000` |
| 15, 68 / SETFIELD, SETFIELD_R1 | Reference-only: A bounds, K[B] string, K[C-256] bounds when C>=256. C-register form/effects/control flow unverified; always unsupported, reference_support=partial unless a checked reference is invalid. | S, [], 23, `1e231000`; PC 22, `881f1000` |
| 46 / NEWTABLE | Reference-only A bounds. B/C meaning, writes and control flow not asserted; always unsupported, reference_support=partial unless A invalid. | S, [], 21, `5c000200` |

Other opcodes (including MOVE=7 and unknown=127), other count/flag forms,
deeper field chains, table mutation/alias effects, open stack-top tracking,
upvalues, return-value relationships, and localization/display API roles
remain unverified. No supported rule is inferred from a mnemonic.

A valid reference is a local operand check, not proof of reachable execution
or a localization relationship. Missing caches, checked out-of-range or
wrong-type references, and invalid destinations receive instruction-level
`invalid` status, never a structural `ParseError`. Unsupported forms remain
`unsupported` even when their known reference subset validates.

Control-flow analysis starts at PC 0, follows only supported instruction
edges, skips owned cache words, and retains both EQ predecessors. A reachable
unsupported/invalid instruction could conceal another control-flow edge:
it blocks **all value evidence in that function**, including earlier call
sites. Raw statuses/references/edges and unresolved call observations remain.
Unreachable unknown instructions do not contaminate the modeled live path.
At joins, a value survives only if every predecessor agrees; missing or
conflicting assignments become unknown. Equal values union sorted origin
PCs. Calls are emitted only after fixed-point convergence. A 50,000-step
dataflow limit clears all partial values and reports `dataflow_work_limit`.

FFQ35 retains 27 prototypes / 687 words: 464 supported instructions, 220
owned auxiliary words, 3 reference-only unsupported instructions, zero
invalid. There are 99 call observations, 94 with lookup provenance; all
have unresolved localization meaning, and **zero confirmed localization
links**. All 26 child/wrapper functions have complete modeled dataflow; S's
main is blocked by PCs 21-23. Its 22 closure/assignment pairs are checked
in an isolated real-byte suffix regression (rebased PCs, original byte
offsets), not claimed as full-function bindings through that barrier.
This is a deliberate precision-over-coverage limitation.

## Task 4 Analysis Contract

This is a new result schema, not a change to the structural schema.
The caller must retain the occurrence key, source/container provenance,
payload offset and payload SHA-256 around this result. Analyze functions
independently in the structural preorder; do not discard an occurrence or
its constants because semantic analysis is partial.

Every instruction status, reference, edge, call and binding includes this
site envelope, with integer fields copied from the structural instruction:

```text
path: [child_index, ...]
pc: int
offset: int
word: uint32
raw_operands: {opcode: int, a: int, b: int, c: int, bx: int}
support_rationale: nonempty string
```

The top-level object has exactly these fields:

```text
path: [child_index, ...]
status: "supported" | "partial"
dataflow_status: "complete" | "blocked"
control_flow_complete: bool
reason_codes: [string, ...]
instruction_statuses: [site + status fields, ...]   # one per raw word, PC order
references: [site + reference fields, ...]          # PC / declared operand order
control_flow_edges: [site + edge fields, ...]       # PC / successor order
calls: [site + call fields, ...]                    # PC order
closure_bindings: [site + binding fields, ...]      # SETGLOBAL PC order
```

- Instruction status fields: `status` is `supported`, `unsupported`,
  `invalid` or `auxiliary`; `semantic_support` is `supported`, `partial`,
  `unsupported` or `not_executable`; `reference_support` is `validated`,
  `partial`, `invalid`, `unsupported` or `not_applicable`; `reason_codes`
  is a string list; `cache_owner` is the owner PC or null; `reachable` is
  true, false or null. True means reached by known edges; false means
  known unreachable (or auxiliary/non-executable); null means uncertain
  beyond an incomplete-flow barrier. Empty instruction lists are explicitly
  incomplete. Supported open CALL forms have partial semantic support.
- Reference fields: `kind` is `register`, `constant` or `prototype`;
  `field` is the raw field name, or `arguments`/`results`; `index` is
  the decoded register/constant/child index; `status` is `valid`/`invalid`.
  Registers additionally have `access` (`read`, `write`, `bounds`).
  String-key references additionally have `expected_type: "string"`.
  Prototype references additionally have `child_path` (array or null
  when invalid). No references are emitted for cache fields. Missing
  references for unverified operands do not mean no references exist.
- Edge fields: `source_pc`, `target_pc` (ints), `target_offset` (int or
  null if outside code), `kind` (`fallthrough`, `jump`, `conditional_next`,
  `conditional_skip`, `skip`) and `status` (`valid`/`invalid`). Only valid
  edges **whose source instruction is supported** are traversed; an invalid
  sibling edge can invalidate the source.
- Call fields: `reachable` (bool or null), `dataflow_status` (`available`
  or `blocked`), `callee` (value descriptor below), `arguments` (ordered
  `[{register: int, value: descriptor}, ...]` or null for open B=0),
  `arguments_status` (`fixed` or `open_unknown`), `results_status` (`none`,
  `unknown`, `open_unknown`), `localization_role: "unknown"`,
  `localization_key: null`, `evidence_level: "unresolved"`. Fixed argument
  positions do not imply known values. Invalid/unverified call forms have
  statuses but no call record. Known-unreachable calls are not emitted.
  Blocked calls have unknown callee/values; open arguments remain null.
- Binding fields: `child_path` (array), `name_constant_index` (int),
  `closure_source_pcs` (sorted int list), `relationship` fixed to
  `static_global_assignment`. A matching name or adjacent printable string
  is insufficient; the assigned register must contain an agreed closure.

Value descriptors are exactly one of:

```text
{kind: "unknown"}
{kind: "constant", constant_index: int, source_pcs: [int, ...]}
{kind: "boolean", value: bool, source_pcs: [int, ...]}
{kind: "lookup", constant_indexes: [int, ...], source_pcs: [int, ...]}
{kind: "closure", child_path: [int, ...], source_pcs: [int, ...]}
```

Indexes and origin PCs refer to the **same function**. Constants resolve
through its unchanged structural constant records, including raw bytes for
non-UTF-8 strings. Lookup indexes are a global string and optionally one
field string, describing the load path, not a verified API identity.
A literal string used as callee does not become a named target.
No descriptor contains a synthesized localization ID, constructor result,
speaker, or dialogue order. Task 4 must preserve unresolved evidence and
must not upgrade a call's localization role based on its name.

## Reproduction

```sh
PYTHONDONTWRITEBYTECODE=1 python3 -m unittest discover -s tools -p 'test_lua_bytecode_reader.py' -v
PYTHONDONTWRITEBYTECODE=1 python3 tools/test_lua_bytecode_reader.py --pilot-results | cmp - work/zh_cn/audit/lua-corpus-review-20261115/parser-pilot-results.jsonl
PYTHONDONTWRITEBYTECODE=1 python3 -m unittest discover -s work/zh_cn/audit -p 'test_probe_ffq35_lua.py' -v
```

The tests and result generator hash-check local extracted payloads and never
write or execute them. Local extracted assets are required; the payloads are
not included in the result artifact.
