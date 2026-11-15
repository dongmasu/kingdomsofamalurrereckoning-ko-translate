# Extracted Resource Corpus Map

This is the maintained, reusable map of confirmed structural facts about this
game's extracted resources. It is intended to guide translation research and
context classification; it is not a complete runtime dependency graph or a
schema for other games.

The dated inventory and full extension counts are in the
[2026-11-15 reconnaissance report](../../audit/unpacked-resource-inventory-and-relationships-20261115.md).
The report is the detailed evidence record; update this map when a structural
fact or its interpretation is verified or superseded.

Focused results for the extracted `.bin` registries are in the
[2026-11-15 binary analysis](../../audit/unpacked-bin-resource-analysis-20261115.md).

## Corpus and Naming

- The snapshot contains 12,337 files, 56 extensions, and 2,235,925,829 bytes
  (about 2.08 GiB), all directly under `references/data/unpacked/`.
- There are 11,266 distinct filename stems. A stem occurs with multiple
  extensions in 1,041 cases and with one extension in 10,225 cases.
- Common filename forms include numeric asset ID plus extension
  (`1339422.quest_bxml`), numeric ID plus locale plus extension
  (`2601200_en_us.animset`), locale plus numeric ID plus extension
  (`en_us_2664555.ksdf`), and named localization tables such as
  `locatexts_en_us.koalocatext_default`.
- The inventory found 10,615 filenames in the first numeric form, 348
  numeric-ID-plus-suffix forms, and 24 localization-table names. Other files
  use locale prefixes, scripts, or descriptive global names.

## Translation-Relevant Resource Families

| Family | Files | Confirmed use or limitation |
| --- | ---: | --- |
| `.quest_bxml` | 530 | 426 files contain at least one exact `default` localization-key byte match. |
| `.interaction_bxml` | 517 | No exact `default` key match was found in the scan. |
| `.facefx_quest_bxml` | 53 | Each has an exact same-stem `.animset`; no exact `default` key match was found in the scan. |
| `.animset` | 136 | 46 numeric asset IDs: 45 have `de_de`, `en_us`, and `fr_fr` variants; one has only `en_us`. |
| `.koalocatext_{affix,base,default}` | 24 | Eight locales each have all three localization resource families. |
| `.ksdf` | 473 | 149 numeric assets have `de_de`, `en_us`, and `fr_fr` variants (447 files); 26 filenames follow other patterns. |
| `.lore_bxml` | 195 | No corpus-wide localization-key relationship was established in this analysis. |
| `.ui_bxml` | 39 | No corpus-wide localization-key relationship was established in this analysis. |
| `.batch` | 11 | Names include module-like suffixes such as `_klua`, `_ksmt`, `_fact`, and `_loot`; callback links require content inspection. |

The corpus also includes substantial world, visual, and item data, including
5,980 `.bundle`, 591 `.collision_set_bin`, 420 `.dds`, 393 `.space_bxml`,
335 `.fab_visual_data_streamable_bin`, and 263 `.loottable_bxml` files.
These families can help investigate names and setting context, but their
translation relationships have not been mapped comprehensively.

## Localization Fields and Markup

A read-only comparison parsed all 24 original localization binaries for the
eight locales and matched their `base`, `affix`, and `default` source CSVs
exactly. In `base` and `affix`, `Tipo_Variante` records a byte associated with
each stored variant string. The values are real resource data, but their
complete semantic code map and runtime selection rules are unknown.
Cross-language forms support grammatical hypotheses for some codes without
establishing a universal mapping. The active Korean `affix` data uses the
same Korean text across all variants of its 573 multi-variant IDs; this is an
observed editorial choice, not evidence that the game ignores those variants.

Brace forms in the original `default` binaries are stored as literal text.
Their names and cross-language alignment suggest substitution and display or
layout markup, but the extracted resources do not establish their runtime
semantics. Preserve them conservatively and adjudicate differences by ID.
Detailed examples, limits, and the binary/CSV comparison are in the
[localization markup and variant audit](../../audit/default-markup-and-variant-evidence-20261115.md)
and the [cross-language brace audit](../../audit/default-brace-cross-language-20261105.md).

## Confirmed Relationship Evidence

### Binary Registry Evidence

- The 79 `.bin` files comprise 35 ordinary ID-to-name symbol tables, one
  64-bit localization-key table, 34 initialization tables, and nine other
  manager/graph/asset-info files. The ordinary symbol tables contain 110,752
  validated ID/name records.
- `quest_init.bin` and `symbol_table_quest.bin` enumerate the same 530 IDs as
  the extracted `.quest_bxml` filename stems, in the same order. The symbol
  table adds a symbolic name for each asset ID.
- The 64-bit localization-key table has 84,380 validated key/string records.
  It contains 63,214 of the 65,135 English `default` keys; 53,889 matched
  values equal the English CSV after removing the `@@...@@` wrapper. Use it
  as secondary evidence, not as a replacement for the ID-aligned English
  source.
- The first ID sequence in 33 of 34 paired `_init.bin` files matches its
  symbol table; `voicetype_init.bin` is the unresolved exception. One symbol
  table, `symbol_table_lua_script_path.bin`, has no matching init file.
- `assetinfos.bin` contains exact filename-like strings, including
  `.task_bxml` names for which no corresponding files are extracted. Its
  record layout is unresolved, so these are not confirmed manifest entries.

The counts, parsing checks, and limits are documented in the
[`binary-analysis report`](../../audit/unpacked-bin-resource-analysis-20261115.md).
Do not infer dialogue, speaker, or runtime relationships from a symbol name
or raw filename alone.

The current `default` localization bridge uses each row's 8-byte key in
`src/csv/en_us/estrutura_hashes_flat.bin`. All 65,135 keys are unique in the
current corpus. A read-only exact byte-sequence scan found:

- 51,080 keys in 426 of the 530 `.quest_bxml` files.
- 1,257 matched keys occurring in more than one quest asset.
- No exact key match in the 517 `.interaction_bxml` or 53
  `.facefx_quest_bxml` files included in the scan.

A key match establishes that the containing quest resource includes that
key. It does not establish that the row is dialogue, identify an individual
speaker, resolve a callback or branch, or prove playback order. The maintained
[`default-quest-asset-index.tsv`](default-quest-asset-index.tsv) is therefore
a candidate-asset index, not a dialogue-flow map.

Exact-stem co-occurrence is another confirmed filename fact, but only a
candidate relationship between resources:

| Same-stem extensions | Groups |
| --- | ---: |
| `.bundle` + `.simtype_visual_data_bundle` | 327 |
| `.bundle` + `.loottable_bxml` | 263 |
| `.fab_bxml` + `.fab_visual_data_streamable_bin` | 135 |
| `.bundle` + `.space_bxml` | 70 |
| `.bundle` + `.quest_bxml` | 59 |
| `.animset` + `.facefx_quest_bxml` | 53 |
| `.bundle` + `.region_bxml` | 43 |

An exact filename stem does not by itself prove an internal reference,
runtime dependency, or complete resource family. In particular, quest and
interaction files do not share exact numeric filename stems in this snapshot;
any relationship between them needs content-derived or independently
verified evidence.

## Applying the Map

For this project, start with the localization key-to-quest index when
classifying `default` text, then inspect the candidate asset's structured
content and related symbols before assigning text type, character, or order.
Group locale variants by asset ID while preserving locale. Treat filename
patterns, same-stem pairs, raw string extraction, and byte scans according to
their evidence level; do not promote a candidate link to a confirmed semantic
relationship without an internal reference or independent verification.

The current generator
[`build_dialogue_context_index.py`](../../audit/build_dialogue_context_index.py)
indexes top-level `*.quest_bxml` files only. The corpus-wide scan and its
limitations are documented in the
[reconnaissance report](../../audit/unpacked-resource-inventory-and-relationships-20261115.md).

### Quest Registry Enrichment

The initial generator check on 2026-11-15 passed for all three classification
TSVs but exposed that the generator did not consume the verified quest
registry. At that point, 374 of 530 catalog assets had no extracted
`quest_ids`; 273 of those had default-key links, totaling 28,913 ID-asset
associations (not unique IDs). Every asset has a registry name available by
numeric ID.

Registry names must be recorded separately from embedded `QUEST_ID` values:
for example, `1252458.quest_bxml` resolves to `sq75`, while
`1278069.quest_bxml` resolves to `nqd_village_didenhil`. Do not turn every
registry name into a quest code or silently populate `quest_ids` by uppercasing
it.

Updated 2026-11-15: the generator now records exact numeric-filename lookups
as separate `registry_quest_name` / `registry_name_evidence` columns. The ID
catalog uses sorted `asset=value` pairs so each name remains attached to its
asset. The original `quest_ids` field is unchanged; registry names are not
uppercased or promoted to dialogue groups. All 530 assets resolve through the
quest symbol table. Rebuild with
`python3 work/zh_cn/audit/build_dialogue_context_index.py` and validate with
`--check`.

### Embedded Lua-Family Data

A read-only scan of all 3,360 `*_bxml` files found the exact signature
`1b 4c 75 61` at 5,362 positions in 600 files:

| Family | Files with signature | Signature hits |
| --- | ---: | ---: |
| `.quest_bxml` | 269 | 3,407 |
| `.interaction_bxml` | 226 | 228 |
| `.loottable_bxml` | 105 | 1,727 |

Every hit shares the prefix
`1b 4c 75 61 51 08 00 04 04 04 04 01`. The preceding four-byte little-endian
length makes all 5,362 ranges in-bounds and non-overlapping. All payloads
contain the same validated 13-entry big-endian type table, ending at relative
offset 238. These are parsed envelope counts, not Lua function counts; the
instruction bodies remain opaque. None had an exact eight-byte English
`default` key match. The format byte differs from standard Lua 5.1 under its
documented header layout, so decoder compatibility and the exact runtime
remain unverified. Game-specific community reverse-engineering independently
documents a Lua 5.1-based Kore VM variant and describes format `0x08` as
likely "Havik Script" (the source's spelling). This corroborates the format
family but is not official format documentation; details and limits are in
the dated resource-container analysis.

All 11 `.batch` files share a validated count + `(ID, byte length)` directory
+ concatenated record layout; directory and records consume each file exactly.
Ten of the eleven record-ID sequences align with their symbol-table IDs; all
eleven align with same-family init IDs. Same-ID comparison confirms 827
byte-identical batch-record/BXML pairs: 517 interaction, 263 loot-table,
27 talent, 6 faction, 6 collision-profile, and 8 voice-type assets. Same-ID
non-identical records remain unclassified.

`134230570_klua.batch` contains 3,666 length-delimited Lua script records,
aligned with both Lua script symbol tables and the init file. Every record
parses as a length-prefixed name, count and length-prefixed string references,
and a length-prefixed Lua-family payload ending at the record boundary. The
record name case-folds to the registry name for 3,663 records; three
case-insensitive disagreements are retained in the index. Serialized string
references are not assigned runtime semantics.

Each numeric quest BXML begins with its asset ID at byte offset 8, matching
all 530 filename stems. The little-endian value at offset 28 matches a Lua
script ID and its batch record for 529 assets; one asset has zero there. One
linked pair has different names: `4000137.quest_bxml` (`sq_ao_12_test`) points
to script ID `2600200` (`main_ao12_wip`). Keep this as an observed asset-to-
script link; it does not map dialogue lines, speakers, or playback order.

The detailed, reproducible indexes are
[`resource-batch-catalog.tsv`](resource-batch-catalog.tsv),
[`bxml-resource-catalog.tsv`](bxml-resource-catalog.tsv),
[`bxml-lua-payload-index.tsv`](bxml-lua-payload-index.tsv),
[`lua-script-registry-index.tsv`](lua-script-registry-index.tsv),
[`quest-script-asset-links.tsv`](quest-script-asset-links.tsv), and
[`resource-container-summary.json`](resource-container-summary.json). Use
`python3 work/zh_cn/audit/analyze_resource_containers.py` to regenerate and
add `--check` to validate.

Script-mediated relations remain an investigation route, including in
interaction assets without exact default-key matches. Do not infer a
callback-to-line, speaker, or playback-order mapping from Lua presence alone.
Evidence, examples, and limits are recorded in the
[BXML/signature and classification-gap report](../../audit/bxml-lua-and-classification-gap-20261115.md)
and the follow-up
[resource-container analysis](../../audit/unpacked-resource-container-analysis-20261115.md).

### Extraction and Exact No-Edit Re-Encoding

The structure-preserving tools in `tools/` extracted all recognized payloads
from the 12,337-file unpacked corpus to the ignored
`work/zh_cn/audit/lua-script-extracted/` directory:

| Payload kind | Count |
| --- | ---: |
| Standalone BXML Lua-family payloads | 5,362 |
| BXML payloads inside `.batch` records | 4,240 |
| Lua script records inside `.batch` files | 3,666 |
| Total extracted payload occurrences | 13,268 |

The manifest records each occurrence, container location, byte range, and
SHA-256. The scanner found 13,268 exact `1b 4c 75 61` signatures and classified
all of them; this is a corpus-snapshot result, not a guarantee about other
game versions. Extracted bytes are preserved separately. The re-encoder
updates only validated length fields in output copies and never writes into
`references/data/unpacked/`.

`python3 tools/extract_lua_scripts.py --check` and
`python3 tools/reencode_lua_scripts.py work/zh_cn/audit/lua-script-extracted --check`
both verified 13,268 occurrences across 606 containers, with byte-identical
no-edit reconstruction and zero unclassified signatures. These checks verify
container extraction/re-encoding, not bytecode semantics.

The exact-source literal index is a separate aid for translation research.
Literal equality can identify candidate text, but cannot prove that a script
executes the string, displays it, or ties it to a specific dialogue line,
speaker, or playback order. See the
[dated extraction and re-encoding audit](../../audit/lua-script-extraction-and-reencoding-20261115.md).

### FFQ35 Static Bytecode Sample

The [single-quest experiment](../../audit/ffq35-lua-sample-20261115.md)
decoded the associated `FFQ35` script (ID `1164041`) and both Lua payloads
embedded in `1164038.quest_bxml`. This advances beyond the corpus-wide
envelope scan above, but only for this pinned sample: 27 prototypes,
687 instruction/data words, valid constant and closure references, and 11
in-range non-DATA jump targets. Metadata and final trailer bytes remain
partly opaque; other scripts are not validated by this result.

All 22 script child functions have explicit `CLOSURE` + `SETGLOBAL` name
assignments. Six are `on_dialog_line_1164038_*` callbacks: five contain
stage-setting calls (10, 30, 40, 100, 100) and one contains only `RETURN`.
The stage-30 callback requests faction hostility; the stage-100 callback
requests completion/rewards. The two anonymous embedded predicates check
stage 0 or 10 respectively and that `NPC_DAL_LJO_MenriTogh` was not killed.
These are static call/control-flow interpretations, not in-game validation.

Use the [readable Lua subset](../../audit/ffq35-lua-sample-20261115.reconstructed.lua)
and [full listing](../../audit/ffq35-lua-sample-20261115.disassembly.txt) to
guide targeted context research. The script's six named dialogue callbacks
are not yet matched to the BXML's 17 conditional handler names or 56 linked
localization IDs. Numeric callback suffixes are not CSV row IDs. Speaker,
dialogue order, predicate attachment and per-line branch mapping remain
unknown; no translation or generated per-ID classification change is
justified yet. Reproduce with
`python3 work/zh_cn/audit/probe_ffq35_lua.py --check`.
