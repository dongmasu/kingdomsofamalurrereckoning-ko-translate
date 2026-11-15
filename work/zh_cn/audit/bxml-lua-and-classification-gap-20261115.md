# BXML Lua Signatures and Classification Gaps

- Date: 2026-11-15
- Scope: read-only signature scan of all 3,360 top-level `*_bxml` files,
  quest-registry/catalog comparison, and existing-generator reproducibility.
- Status: signature presence and registry coverage verified; embedded script
  decoding and enriched generated indexes remain unimplemented.

## Existing Classification Is Reproducible, Not Fully Enriched

`python3 work/zh_cn/audit/build_dialogue_context_index.py --check` passed for
all three maintained classification TSVs. This proves they match the current
generator and inputs; it does not prove the generator uses all known evidence.

The generator extracts printable `QUEST_ID` values, NPC symbols, handler names,
and exact eight-byte localization-key matches from `*.quest_bxml`. It does not
read `symbol_table_quest.bin` or inspect Lua headers. Its quest-value regex also
accepts uppercase identifiers only.

Comparing the 530-row asset catalog with the validated quest symbol table:

| Observation | Count |
| --- | ---: |
| Catalog assets with an exact numeric-ID registry name | 530 |
| Assets with an empty current `quest_ids` field | 374 |
| Such assets with at least one linked default ID | 273 |
| ID-asset associations in those 273 assets | 28,913 |

The last count is associations, not unique localization IDs. Registry names
are asset-level identifiers, not necessarily `QUEST_ID` values or quest codes:

| Asset | Registry name | Current `quest_ids` | Matched default IDs |
| --- | --- | --- | ---: |
| `1164038.quest_bxml` | `ffq35` | `FFQ35` | 56 |
| `1252458.quest_bxml` | `sq75` | empty | 38 |
| `1278069.quest_bxml` | `nqd_village_didenhil` | empty | 451 |
| `1307600.quest_bxml` | `allestar_nqd` | empty | 129 |

Therefore enrichment is needed, but rerunning the current generator alone
cannot add it. A generator extension should preserve the distinction between
the existing embedded `quest_ids` evidence and an exact registry-name lookup.
Do not silently uppercase registry names or use them to fill `quest_ids`.
Add separately sourced asset-registry metadata, propagate it to useful ID
lookups, and retain existing unknown speaker/order values.

No generator or generated TSV was changed in this investigation. Tool changes
are subject to the project's explicit-request rule.

## Embedded Lua Signature Scan

Each file was searched for every exact `b"\x1bLua"` occurrence; the following
12 bytes were compared. All 5,362 hits have the same 12-byte prefix:

```text
1b 4c 75 61 51 08 00 04 04 04 04 01
```

| Resource family | Files scanned | Files with signature | Signature hits |
| --- | ---: | ---: | ---: |
| `.quest_bxml` | 530 | 269 | 3,407 |
| `.interaction_bxml` | 517 | 226 | 228 |
| `.loottable_bxml` | 263 | 105 | 1,727 |
| Other `*_bxml` families | 2,050 | 0 | 0 |
| Total | 3,360 | 600 | 5,362 |

Offsets below are zero-based byte offsets, not script IDs:

| Asset | First signature offsets |
| --- | --- |
| `1164038.quest_bxml` | 699, 1323 |
| `1164089.quest_bxml` | 427 |
| `1241289.quest_bxml` | 1179, 1883, 2539 |

These are signature hits, not a validated count of complete chunks,
functions, callbacks, or source scripts. Chunk boundaries, length fields,
instructions, constants, and links to surrounding BXML records were not parsed.
The observation supports investigating embedded compiled Lua-family data;
it does not establish standard-tool compatibility or a recovered call graph.

For comparison, the official Lua 5.1 sources (`lundump.c`, `luaU_header`, and
`lundump.h`) place version and format bytes after the signature, and define
the standard format as zero. Under that layout, this corpus has version byte
`0x51` but format byte `0x08`, not the standard `0x00`. Do not assume ordinary
Lua 5.1 disassemblers can read these bytes unchanged, or identify the exact
runtime from this prefix alone.

Earlier resource reports inspected visible symbols and handlers but did not
record this corpus-wide signature/header validation. Do not describe that
earlier work as complete Lua-bytecode analysis.

## Translation Use and Remaining Work

- Keep the exact-key asset associations as currently evidenced.
- Enrich classification through a reproducible generator change, not manual
  edits to generated TSVs. Keep registry names separate from embedded IDs.
- Record Lua presence/header/offset evidence per asset before attempting
  script-to-BXML linkage.
- Validate the variant's chunk layout before decoding instructions or
  connecting handlers, conditions, dialogue keys, and reply branches.
- Signature presence cannot identify a line's speaker or playback order.
  Absence of an exact default key in an interaction asset also does not prove
  it has no indirect script-mediated relation to localized dialogue.

No source assets, translation CSVs, or review-ledger records were modified.
Confirmed reusable facts are summarized in
[`resource-corpus-map.md`](../translation-reference/classification/resource-corpus-map.md).

## Follow-up

The follow-up resource-container analysis is recorded in
[`unpacked-resource-container-analysis-20261115.md`](unpacked-resource-container-analysis-20261115.md).
The quest registry has since been added as separate evidence columns to the
generated classification indexes. Six reproducible resource indexes now
cover all batch records, BXML Lua-family envelopes, and quest-to-script
registry links. This follow-up does not decode Lua instructions or authorize
speaker, branch, or playback-order inference.
