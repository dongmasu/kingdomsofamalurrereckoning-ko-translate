# Extracted Resource Container Analysis

- Date: 2026-11-15
- Scope: read-only structural parsing of top-level `*.batch`, all 3,360
  `*_bxml` files, related symbol tables, init lists, and English `default`
  localization keys.
- Status: envelope and record boundaries were validated and reproducible
  indexes were generated. Lua instruction bodies and runtime semantics remain
  undecoded.

Follow-up: the [FFQ35 single-quest experiment](ffq35-lua-sample-20261115.md)
later decoded instruction bodies for that pinned quest and its linked script.
It does not extend instruction coverage to this report's full corpus.

## Reproduction and Preservation

Run:

```sh
python3 work/zh_cn/audit/analyze_resource_containers.py
python3 work/zh_cn/audit/analyze_resource_containers.py --check
```

The analyzer reads `references/data/unpacked/` and source key sidecars without
modifying them. It writes six maintained indexes under
`work/zh_cn/translation-reference/classification/`. It checks directory
lengths, record bounds, IDs, string-table structure, payload hashes, and
source key matches. All input hashes are recorded in
`resource-container-summary.json`.

## `.batch` Record Tables

All 11 top-level `.batch` files share this verified layout in this snapshot:

1. Little-endian 32-bit record count.
2. `count` little-endian `(asset ID, record byte length)` pairs.
3. Concatenated records in directory order.

For every file, the directory and sum of record lengths exactly consume the
file. Across all files, 53,384 records were parsed. Ten batch ID sequences
match their corresponding ordinary symbol tables; the exception is
`134836660_kvtp.batch`. All eleven sequences match their paired init files,
including `voicetype_init.bin` for `kvtp`.

| Batch | Records | Matching symbol table | Matching init | Exact BXML records |
| --- | ---: | --- | --- | ---: |
| `134225858_ksmt.batch` | 27,350 | `symbol_table_simtype.bin` | `simtype_init.bin` | 0 |
| `134227287_fact.batch` | 613 | `symbol_table_faction.bin` | `faction_init.bin` | 6 |
| `134230570_klua.batch` | 3,666 | Lua script ID and path tables | `luascript_init.bin` | 0 |
| `134319395_ktal.batch` | 2,916 | `symbol_table_talent.bin` | `talent_init.bin` | 27 |
| `134372811_kgor.batch` | 8,028 | `symbol_table_globalobjectref.bin` | `globalobjectref_init.bin` | 0 |
| `134377515_colp.batch` | 201 | `symbol_table_collision_profile.bin` | `collision_profile_init.bin` | 6 |
| `134415964_inac.batch` | 542 | `symbol_table_interaction.bin` | `interaction_init.bin` | 517 |
| `134431475_kbuf.batch` | 7,144 | `symbol_table_buff.bin` | `buff_init.bin` | 0 |
| `134571130_loot.batch` | 1,096 | `symbol_table_loottable.bin` | `loottable_init.bin` | 263 |
| `134619123_kmog.batch` | 1,427 | `symbol_table_monstergroup.bin` | `monstergroup_init.bin` | 0 |
| `134836660_kvtp.batch` | 401 | none | `voicetype_init.bin` | 8 |

The 827 exact ID-matched batch/BXML pairs comprise 517 interaction, 263 loot
table, 27 talent, 6 faction, 6 collision-profile, and 8 voice-type assets.
These byte identities establish that the extracted BXML is exactly a batch
record for those IDs. They do not establish semantic relationships for
non-identical same-ID records or imply dialogue order.

The voice-type result narrows but does not resolve the prior
`voicetype_init.bin` versus `symbol_table_voicetype.bin` ID-order mismatch:
the 401 batch IDs match the init list, and eight same-ID extracted
`voice_type_bxml` files are byte-identical to batch records. The batch's
relationship to the differently ordered voice-type symbol table remains
unresolved.

## Embedded Lua-Family Payloads

The analyzer scans every BXML family for `1b 4c 75 61`; only quest,
interaction, and loot-table BXMLs contain hits:

| Family | Files containing payloads | Payloads |
| --- | ---: | ---: |
| `.quest_bxml` | 269 / 530 | 3,407 |
| `.interaction_bxml` | 226 / 517 | 228 |
| `.loottable_bxml` | 105 / 263 | 1,727 |
| Other BXML families | 0 / 2,050 | 0 |
| Total | 600 / 3,360 | 5,362 |

Every occurrence has the bytes `02` followed by a four-byte little-endian
length immediately before the signature. The header starts with
`1b 4c 75 61 51 08 00 04 04 04 04 01`. The version field is `0x51`; the
following format field is `0x08`, whereas official Lua 5.1.5 defines the
standard format as zero. See the official Lua 5.1.5 source files
[`lundump.h`](https://www.lua.org/source/5.1/lundump.h.html)
(`LUAC_VERSION`, `LUAC_FORMAT`, `LUAC_HEADERSIZE`) and
[`lundump.c`](https://www.lua.org/source/5.1/lundump.c.html) (`luaU_header`).

### Community Reverse-Engineering Corroboration

Kender2's game-specific
[Kore VM notes](https://github.com/Kender2/amalur/blob/314e878609f42e9f53cb407c5dab72564ad5fdeb/korevm.md)
identify the format as a Lua 5.1-based Kore VM variant and describe `0x08` as
likely "Havik Script" (their spelling, apparently referring to Havok Script).
Their header interpretation says byte-order field `0x00` denotes big endian,
the integer/size/instruction/number widths are four bytes, and the final
`0x01` is a nonstandard bytecode-sharing field. The observed big-endian type
table agrees with that byte-order interpretation. The notes also report that
game scripts are compiled and stripped of debug information.

Those notes describe an expanded 86-opcode instruction set and additional
`TUI64` / `TSTRUCT` types, consistent with evidence in this corpus. This is
independent, game-specific reverse-engineering corroboration, not official
format documentation. The exact engine/runtime build and remaining
prototype/instruction layout have not been independently verified. Attempts
to interpret the bytes after the type table as an ordinary Lua 5.1 prototype
are not yet validated; the analyzer deliberately leaves that region opaque.
The payloads are strongly consistent with the documented Kore VM / Havok
Script family, but this analysis has not decoded their bytecode.

All 5,362 declared ranges are in bounds and non-overlapping; payload lengths
range from 392 to 3,914 bytes, totaling 3,162,150 bytes. Every occurrence has
the same 13-entry big-endian type table from relative offset 14 through 238:

`TNIL`, `TBOOLEAN`, `TLIGHTUSERDATA`, `TNUMBER`, `TSTRING`, `TTABLE`,
`TFUNCTION`, `TUSERDATA`, `TTHREAD`, `TIFUNCTION`, `TCFUNCTION`, `TUI64`,
`TSTRUCT`.

This validates the common envelope and type table, not a complete standard
Lua chunk parser. Instruction encoding, prototype boundaries, constants,
upvalues, closure links, and execution semantics remain undecoded. An exact
eight-byte scan found zero English `default` localization keys in these Lua
payloads. None of the printable runs contained a `dialog_line_*` handler.
Printable strings remain candidates, not verified bytecode operands or calls.

The 5,362 payload occurrences have 2,057 distinct SHA-256 hashes, including
500 hashes reused more than once. The largest group occurs 923 times across
quest and interaction files. This proves byte-identical payload reuse, not
that every occurrence has the same surrounding BXML context or playback
behavior.

Header references:

- Lua 5.1.5 `lundump.h`: `https://www.lua.org/source/5.1/lundump.h.html`
- Lua 5.1.5 `lundump.c`: `https://www.lua.org/source/5.1/lundump.c.html`
- Kender2 game-specific Kore VM reverse-engineering notes:
  `https://github.com/Kender2/amalur/blob/314e878609f42e9f53cb407c5dab72564ad5fdeb/korevm.md`

## Lua Script Batch and Quest Links

The `134230570_klua.batch` has 3,666 length-delimited records. Its ordered IDs
match both `symbol_table_luascript.bin` and
`symbol_table_lua_script_path.bin`, and cover `luascript_init.bin`. Each record
is structurally parsed as:

1. A little-endian length-prefixed UTF-8 record name.
2. A little-endian count followed by that many length-prefixed UTF-8 strings.
3. A little-endian payload length and that many bytes of Lua-family data.

All declared string and payload lengths fit exactly within the record; every
payload has the common header and type table above. The record name equals the
registry name in 831 cases and matches after case-folding in 3,663 cases. The
three case-insensitive differences are preserved in the generated index:

| ID | Registry name | Batch record name |
| ---: | --- | --- |
| `2150032` | `ao_test_enc_01` | `AO_EncTest_01` |
| `2150034` | `ao_test_plate_01` | `AO_PlateTest_01` |
| `2601428` | `chaos_rift_enemy_horrinox` | `chaos_rift_enemy` |

The length-prefixed strings are retained verbatim in JSON arrays. Their exact
runtime meaning is not established by this layout alone.

All 530 numeric quest BXML headers have a little-endian ID at byte offset 8
equal to their filename stem. At byte offset 28:

- 529 values match a `symbol_table_luascript.bin` ID and a corresponding
  `134230570_klua.batch` record.
- One value is zero (`1850718.quest_bxml`, registry name `ffq04_deer2`).
- One valid script association has different names:
  `4000137.quest_bxml` (`sq_ao_12_test`) points to script ID `2600200`,
  named `main_ao12_wip`, at
  `c:/unit4projects/koar/root/content/levels/regions/mithros/dungeons/ao_12_dgn_ancient_ruin/luatestscripts/sctipts/ao_12/main_ao12_wip.lua`.

The path spelling is preserved as stored, including `sctipts`. These are
strongly corroborated asset-to-script registry links based on the fixed BXML
field, ID registry, path registry, and exact batch record. The field's runtime
role is not decoded, and it does not connect a script to a specific dialogue
line, speaker, branch choice, or playback order.

## Reusable Indexes

The analyzer writes:

- `resource-batch-catalog.tsv`: batch hashes, sizes, ordered-registry matches,
  and exact same-ID BXML matches.
- `bxml-resource-catalog.tsv`: per-asset hash, payload count/bytes, and exact
  batch record links.
- `bxml-lua-payload-index.tsv`: per-payload offsets, sizes, hashes, key scan,
  and printable runs after the validated type table.
- `lua-script-registry-index.tsv`: script IDs, names, paths, batch offsets,
  payload hashes, and serialized string lists.
- `quest-script-asset-links.tsv`: the quest-header-to-script-registry
  crosswalk, including zero and name-disagreement cases.
- `resource-container-summary.json`: scope, aggregate findings, and hashes of
  analyzed batch, symbol-table, init, and localization-key inputs.

The generated records are classification and investigation evidence only.
They do not change the review ledger or translations and must not be used to
infer unsupported speaker, callback, branch, or playback relationships.
