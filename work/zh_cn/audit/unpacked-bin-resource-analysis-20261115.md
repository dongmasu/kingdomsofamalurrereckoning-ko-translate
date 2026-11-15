# Extracted `.bin` Resource Analysis

- Date: 2026-11-15
- Scope: read-only structural analysis of all `references/data/unpacked/*.bin`
- Status: repeated record layouts and selected ID relationships were validated;
  this is not a complete semantic parser for every registry binary.

## Inventory

The extracted directory contains 79 `.bin` files totaling 18,438,181 bytes:

| Group | Files | Bytes | Finding |
| --- | ---: | ---: | --- |
| `symbol_table_*.bin` | 36 | 11,543,583 | 35 ordinary ID-to-name tables and one 64-bit localization-key table |
| `*_init.bin` | 34 | 856,960 | Counted initialization lists, mostly aligned with same-family symbol tables |
| Other registries | 9 | 6,037,638 | Manager, graph, and asset-info files not fully decoded |

The other nine files are `assetinfos.bin`, `behaviormgr.bin`,
`fasttravellocationmgr.bin`, `globalobjectreferencedestinationmgr.bin`,
`questmgr.bin`, `sagecraftmgr.bin`, `spacegraph.bin`,
`spacegraphdlcownership.bin`, and `spacemgr.bin`.

## Ordinary Symbol Tables

The 35 non-localization symbol tables share an observed layout:

1. A little-endian 32-bit entry count.
2. `count` 12-byte records containing a 32-bit ID and start/end offsets.
3. A 32-bit string-area byte count followed by the string area.

Across the tables, 110,752 records were checked. Every offset range was
contiguous and in bounds; every string was UTF-8 decodable and
null-terminated. The string-area length agreed with the declared byte count.
These are verified properties of this snapshot; they do not establish the
meaning of every ID or prove that a symbol name is a player-facing name.

Each of the 34 `_init.bin` files has a first 32-bit value of `1`, a second
32-bit declared count, and a total size of `8 + count * 8` bytes. The first
`count` 32-bit values match the ID sequence in the corresponding symbol table
for 33 of the 34 pairs. `voicetype_init.bin` has the same count as
`symbol_table_voicetype.bin` (401), but its first value sequence does not
match that symbol table; the relationship is unresolved. The remaining
`count` values in each init file have not been assigned semantics. The
symbol-table family `lua_script_path` has no same-family `_init.bin` in this
snapshot.

### Quest Registry

`quest_init.bin` declares 530 entries. Its first 530 values match, in order,
both the 530 IDs in `symbol_table_quest.bin` and the numeric filename IDs of
all 530 extracted `.quest_bxml` files. The symbol table also supplies one
null-terminated symbolic name per ID. This establishes an asset-ID/name
crosswalk for the extracted quest files; it does not map a localization row
to a dialogue line, speaker, or playback order.

A preliminary note had reported a mismatch between ID `4844` and
`197327`. Rechecking the ordered lists does not reproduce it: `197327` is
present in the init list, symbol table, and extracted filenames, while all
three 530-entry lists match. Treat the preliminary mismatch as superseded.

## 64-bit Localization-Key Table

`symbol_table_64_localization_keys.bin` contains 84,380 records. The observed
record layout is a 64-bit key followed by start/end offsets into a UTF-8
string area. All ranges are contiguous and in bounds; all 84,380 strings are
UTF-8, null-terminated, and wrapped in the game's `@@...@@` convention.

The English `default` sidecar
`src/csv/en_us/estrutura_hashes_flat.bin` contains 65,135 eight-byte keys,
aligned by ID with the English `default` CSV. Exact byte matching against the
64-bit table found:

| Check | Records |
| --- | ---: |
| English `default` keys found in the 64-bit table | 63,214 / 65,135 |
| Found keys whose unwrapped table string exactly equals the English CSV text | 53,889 |
| Found keys whose table string differs from the English CSV text | 9,325 |
| English `default` keys not found in the table | 1,921 |

The table is therefore useful as an additional key-linked index, but not as a
complete or authoritative English-text replacement. A key match proves the
key is present in this table; a differing value may be a symbolic event or
other representation and must be checked in context rather than treated as
the row's English translation.

## Asset Information and Remaining Opaque Files

`assetinfos.bin` is 5,695,536 bytes and contains many printable filename-like
strings. A printable-ASCII-run scan found 6,966 occurrences of 6,938
distinct exact filenames that also exist in the extracted directory. It also
found 169 strings matching `<number>.task_bxml`; no `.task_bxml` files are
present in the extracted directory. Because the record boundaries and
reference fields in `assetinfos.bin` were not decoded, these string matches
are candidate inventory clues, not a complete manifest or proof of runtime
references.

The other eight manager/graph files were inventoried by name, size, and
header bytes only. Their field semantics and reference edges remain
unresolved. A text search of the supplied modding PDF for `.bin`, symbol,
initialization, localization, and `assetinfos` returned no hits. This does not
rule out information in other documentation or undocumented formats.

## Translation-Relevant Use

- Use `symbol_table_quest.bin` with `quest_init.bin` to resolve extracted
  quest asset IDs to their symbolic quest names.
- Use the 64-bit key table as secondary evidence when investigating a
  localization key; retain the English CSV and its ID as the source of truth.
- Treat names and co-occurrence as classification clues, not proof of a
  speaker, dialogue order, or text type.
- Do not infer additional semantics for the init arrays, manager binaries, or
  asset-info strings without a parsed field or independent corroboration.

No extracted `.bin`, file under `src/`, or translation CSV was changed during
this analysis. The reusable summary is maintained in
[`resource-corpus-map.md`](../translation-reference/classification/resource-corpus-map.md).
