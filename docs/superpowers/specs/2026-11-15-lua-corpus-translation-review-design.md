# Lua Corpus Translation Review Design

- Date: 2026-11-15.
- Status: written design approved by the user in chat on 2026-11-15.
- Scope: read-only review of translation evidence available in the extracted
  Lua 5.1 bytecode corpus. Translation CSV edits require separate approval.

## Problem

The project has extracted and round-trip-verified Lua-family payloads from the
unpacked game corpus, but the only bytecode instruction decoder is a
single-quest FFQ35 research probe. The existing exact-literal index finds
candidate localization text; it does not show whether a literal is displayed,
which localization key is used, or how the surrounding code uses it. A review
of only the 16 credit labels is not a corpus-wide Lua translation review.

## Goals

- Account for every extracted Lua payload occurrence and record whether it is
  statically parsed, unsupported, or otherwise unresolved.
- Extend the sample decoder only where the observed format and validation
  evidence support doing so.
- Find translation-relevant script evidence and map it to stable localization
  keys or explicitly provisional source-text candidates.
- Compare each mapped candidate across English, Japanese, Chinese, and the
  active Korean row, including `affix` variants where relevant.
- Produce reproducible review findings, proposed corrections, retained
  translations, and unresolved cases without editing translation CSVs.

## Non-Goals

- Executing game bytecode or embedding/running the game VM.
- Claiming that a string is shown to players solely because it exists in a
  script constant or exact-literal match.
- Recovering original Lua source or creating a general-purpose decompiler.
- Inferring dialogue speakers, order, branches, or localization relationships
  from nearby IDs, strings, registry names, or asset co-occurrence alone.
- Editing source assets, extracted payloads, translation CSVs, or existing
  review-ledger decisions.

## Evidence Model

Every finding must identify the payload hash and source container, payload
offset, script or BXML identity when known, function/prototype and instruction
location when decoded, relevant constant or call operands, and localization
key or candidate source text. Findings use explicit evidence levels:

1. **Direct key mapping:** a stable localization key or ID is traced through
   validated bytecode operands and the relevant localization call path.
2. **Static call-site mapping:** a source string is traced to a call whose
   localization/display role is supported by decoded code, but the exact
   localization row remains unproven.
3. **Exact source-literal candidate:** a printable literal exactly matches an
   English localization row, without a validated display/key path.
4. **Unmapped or unresolved:** strings, functions, opcodes, metadata, or
   relationships that cannot be supported by the current parser.

Only direct key mappings are treated as confirmed Lua-to-localization links.
Other levels remain candidates or unresolved and must not independently
authorize a translation change.

## Analysis Approach

1. Freeze and hash the current extraction manifest, payloads, four locale CSV
   inputs, and relevant classification indexes. Preserve all user changes.
2. Inventory all 13,268 extracted occurrences by kind and provenance:
   standalone BXML payloads, BXML payloads nested in batch records, and Lua
   script records in `klua.batch`.
3. Validate the FFQ35 assumptions against diverse payloads before generalizing
   the parser. Add bytecode parsing incrementally for verified structures,
   constants, prototypes, instruction words, control flow, and string
   references. Reject unknown structures safely instead of guessing.
4. Parse all occurrences with the validated analyzer. Record success,
   unsupported features, and parse failures per occurrence; do not silently
   omit any payload.
5. Extract script string constants and inspect references and call sites.
   Generate candidates against English `affix`, `base`, and `default`
   localization rows. Preserve `(ID_Linha, Tipo_Variante)` for `affix`.
6. Resolve direct mappings only when the bytecode path demonstrates the key
   relationship. Keep exact-string matches and partial/composed strings
   provisional unless corroborated by call flow or independent asset data.
7. Review each mapped row in its full translation context. English is the
   meaning authority; Japanese informs voice/register where relevant; Chinese
   is supporting evidence. Record conflicts and uncertainty instead of
   adopting a reference-language error.
8. Have the read-only review produce findings and proposed edits. Do not
   change translation CSVs, existing review decisions, or source assets.

## Artifacts

- Add a focused reusable static-analysis tool under `tools/` only after the
  parser design and tests are approved.
- Keep generated or ignored payload-derived outputs under
  `work/zh_cn/audit/`; never write analysis output under `references/`.
- Record per-payload parse coverage and candidate evidence in reproducible
  audit data. Keep detailed findings, adjudications, and limitations in a
  dated audit report.
- Add only verified, reusable script-to-resource relationships to
  `work/zh_cn/translation-reference/classification/`.
- Update glossary or exception references only for confirmed decisions or
  explicitly scoped unresolved conflicts. Preserve prior audit records.

Exact output filenames and schemas will be finalized after the parser pilot,
so the design does not prematurely freeze an unverified bytecode model.

## Validation and Safety

- Unit tests cover byte bounds, nested prototypes, constants, opcode fields,
  references, jumps, cache/data words, unknown opcodes, malformed counts,
  truncated inputs, and sample hash pinning.
- Never execute payloads. Treat source assets and extracted `.bin` payloads
  as read-only inputs.
- Compare analyzer output deterministically and report counts by payload kind,
  parse status, evidence level, and localization resource.
- Validate every proposed key against current English, Japanese, Chinese,
  and Korean rows and the current input snapshots.
- Preserve the existing four-language CSV structure and mixed line endings;
  because this review is read-only, no CSV edit or binary build is authorized.
- Record global completion as full payload accounting, not as proof that all
  game behavior is understood or that every candidate is resolved.

## Completion Criteria

- Every manifest occurrence has a recorded analyzer disposition.
- All supported bytecode structures are covered by tests; unsupported forms
  remain explicitly listed.
- Every translation candidate has provenance, evidence level, source/target
  text, and a review disposition (`retain`, `proposed correction`, or
  `unresolved`).
- All proposed corrections have same-key four-language comparisons and
  documented rationale.
- No translation CSV, source asset, extracted payload, or pre-existing ledger
  decision was changed.
- Audit materials state coverage, unresolved cases, and limits without
  implying runtime validation or complete source decompilation.
