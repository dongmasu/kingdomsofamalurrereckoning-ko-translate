# Unpacked Resource Inventory and Relationship Reconnaissance

- Date: 2026-11-15
- Scope: read-only inventory and first-pass relationship analysis of
  `references/data/unpacked/`
- Status: filename/extension inventory and selected localization-key evidence
  are recorded; this is not a complete parser-derived asset graph.

## Why This Was Done

The translation workflow began without a systematic inventory of the
extracted game resources. That left useful evidence about dialogue, quests,
characters, UI, world locations, and resource variants to be discovered late
and case by case. This reconnaissance identifies which resource families
exist, what current evidence connects them, and what remains unknown before
the next translation project begins.

## Corpus Snapshot

The directory contains 12,337 files totaling 2,235,925,829 bytes
(approximately 2.08 GiB). All files are directly under the extracted
directory; there are no resource subdirectories in this snapshot.

Filename inspection found 11,266 distinct filename stems. Of these, 1,041
stems have more than one extension and 10,225 occur once. Same-stem
co-occurrence is useful for discovering candidate resource families, but is
not by itself proof that one file references or requires another.

The main naming forms are:

- Numeric resource ID plus extension, e.g. `1339422.quest_bxml`.
- Numeric resource ID plus locale plus extension, e.g.
  `2601200_en_us.animset`.
- Locale plus numeric resource ID plus extension, e.g.
  `en_us_2664555.ksdf`.
- Locale/resource-family localization names, e.g.
  `locatexts_en_us.koalocatext_default`.
- Descriptive names for global tables, sound banks, and other shared data.

The inventory matched 10,615 filenames of the first numeric form, 348 numeric
ID-plus-suffix forms, and 24 localization-table names. The remaining names
include locale-prefixed resources, scripts, and descriptive global assets.

## Resource Families

| Extension or family | Files | Observed role or relationship evidence |
| --- | ---: | --- |
| `.quest_bxml` | 530 | Quest/script resources; exact localization-key matches connect 426 files to `default` IDs. |
| `.interaction_bxml` | 517 | Interaction scripts and conditions; no exact `default` localization-key matches in the scan. |
| `.facefx_quest_bxml` | 53 | Locale-tagged quest facial-animation resources; every file has an exact same-stem `.animset` companion. |
| `.animset` | 136 | 46 numeric asset IDs: 45 have `de_de`, `en_us`, and `fr_fr` files; one has only `en_us`. |
| `.koalocatext_{affix,base,default}` | 24 | Eight locales, each with the three localization resource families. |
| `.ksdf` | 473 | 149 numeric assets each follow the `de_de` / `en_us` / `fr_fr` naming pattern (447 files); 26 filenames use other patterns. |
| `.batch` | 11 | Compiled/script batches; names include module-like suffixes such as `_klua`, `_ksmt`, `_fact`, and `_loot`. |
| `.lore_bxml` | 195 | Lore-resource family; no corpus-wide localization-key relationship was established in this pass. |
| `.ui_bxml` | 39 | UI-resource family; no corpus-wide localization-key relationship was established in this pass. |
| `.bundle` | 5,980 | High-count, small files; same-stem associations occur with multiple typed resources, but their complete reference semantics were not parsed. |
| `.collision_set_bin` | 591 | Largest family by total size, approximately 764 MiB; world/physics-side data, not analyzed for translation links here. |
| `.dds` | 420 | Texture images, approximately 449 MiB; filenames commonly include numeric IDs and page/variant suffixes. |
| `.space_bxml` | 393 | Space/world resources, approximately 359 MiB; many share stems with `.bundle`. |
| `.fab_visual_data_streamable_bin` | 335 | Visual data, approximately 172 MiB; 135 exact-stem pairs exist with `.fab_bxml`. |
| `.simtype_visual_data_bundle` | 327 | Every file shares a stem with a `.bundle`. |
| `.loottable_bxml` | 263 | Every file shares a stem with a `.bundle`. |
| `.path_set_bxml` | 228 | Path/navigation resources; some world-resource families share numeric IDs. |
| `.region_bxml` | 464 | Region resources; 43 exact-stem pairs exist with `.bundle`. |

## Same-Stem Resource Families

The most frequent multi-extension stem groups are:

| Extensions sharing a stem | Stem groups |
| --- | ---: |
| `.bundle` + `.simtype_visual_data_bundle` | 327 |
| `.bundle` + `.loottable_bxml` | 263 |
| `.fab_bxml` + `.fab_visual_data_streamable_bin` | 135 |
| `.bundle` + `.space_bxml` | 70 |
| `.bundle` + `.quest_bxml` | 59 |
| `.animset` + `.facefx_quest_bxml` | 53 |
| `.bundle` + `.region_bxml` | 43 |
| `.bundle` + `.vignette_bxml` | 23 |
| `.bundle` + `.talent_bxml` | 19 |
| `.bundle` + `.mtns_bxml` + `.visualbundle` | 13 |
| `.bundle` + `.mtns_bxml` | 1 |
| `.terrain_bin` + `.terrain_streamable_bin` + `.veggie_streamable_bin` | 9 |
| `.koalocatext_affix` + `.koalocatext_base` + `.koalocatext_default` | 8 |
| `.bundle` + `.collision_profile_bxml` | 6 |
| `.bundle` + `.ui_bxml` | 6 |
| `.bundle` + `.encounter_bxml` | 3 |
| `.bundle` + `.cinematicscene_bxml` | 2 |
| `.behavior_tree_bxml` + `.bundle` | 1 |

These patterns suggest several useful analysis units:

- Locale variants should be grouped by resource ID while preserving locale;
  do not treat one locale file as the complete resource.
- Exact-stem `.animset` / `.facefx_quest_bxml` pairs are strong filename-level
  links for voice/facial-animation investigation.
- Exact-stem `.fab_bxml` / `.fab_visual_data_streamable_bin` pairs and
  `.bundle` / typed-resource pairs are candidate asset families.
- Quest and interaction files do not share exact numeric filename stems in
  this snapshot. Any relationship between them must be established through
  references inside their contents or through other resource tables.

## Localization-Key and Dialogue Evidence

The established bridge from a `default` row to game resources is the row's
8-byte key in `src/csv/en_us/estrutura_hashes_flat.bin`. The existing
byte-window scan reported:

- 51,080 of 65,135 unique `default` keys occur in 426 of the 530
  `.quest_bxml` files.
- 1,257 matched keys occur in more than one quest asset.
- No exact `default` key match was found in the 517 `.interaction_bxml` files
  or 53 `.facefx_quest_bxml` files scanned.
- A key match identifies a containing quest resource, not necessarily
  dialogue, an individual speaker, a callback, a branch, or playback order.

The maintained generator
[`build_dialogue_context_index.py`](build_dialogue_context_index.py) currently
reads only top-level `*.quest_bxml` files. Its reproducible ID-to-asset index
does not build edges for the other file families. Separate reports document
some manual inspection of script blocks, NPC symbols, `dialog_line_*`
handlers, topic symbols, and batch callbacks, including the Brio / `SQ81`
example. Those investigations are useful but are not a corpus-wide parse.

## Complete Extension Counts

| Extension | Files | Extension | Files |
| --- | ---: | --- | ---: |
| `.bundle` | 5,980 | `.collision_set_bin` | 591 |
| `.quest_bxml` | 530 | `.interaction_bxml` | 517 |
| `.fab_bxml` | 490 | `.ksdf` | 473 |
| `.region_bxml` | 464 | `.koarsoundbank` | 455 |
| `.dds` | 420 | `.space_bxml` | 393 |
| `.fab_visual_data_streamable_bin` | 335 | `.simtype_visual_data_bundle` | 327 |
| `.loottable_bxml` | 263 | `.path_set_bxml` | 228 |
| `.lore_bxml` | 195 | `.animset` | 136 |
| `.bin` | 79 | `.ntx` | 75 |
| `.facefx_quest_bxml` | 53 | `.ui_bxml` | 39 |
| `.behavior_tree_bxml` | 33 | `.mat_bxml` | 33 |
| `.talent_bxml` | 27 | `.vignette_bxml` | 23 |
| `.ftl_bxml` | 19 | `.mtns_bxml` | 14 |
| `.visualbundle` | 13 | `.batch` | 11 |
| `.terrain_bin` | 9 | `.terrain_streamable_bin` | 9 |
| `.veggie_streamable_bin` | 9 | `.font` | 8 |
| `.koalocatext_affix` | 8 | `.koalocatext_base` | 8 |
| `.koalocatext_default` | 8 | `.voice_type_bxml` | 8 |
| `.collision_profile_bxml` | 6 | `.faction_bxml` | 6 |
| `.itemset_bxml` | 6 | `.anm_bxml` | 5 |
| `.koaspace` | 5 | `.koafontlist` | 4 |
| `.bxml` | 3 | `.encounter_bxml` | 3 |
| `.cinematicscene_bxml` | 2 | `.koaenumassetlist` | 2 |
| `.koaregion` | 2 | `.partset_bxml` | 2 |
| `.all_excel_workbooks` | 1 | `.always_loaded_material_data` | 1 |
| `.cinematic_bxml` | 1 | `.koabuffvariables` | 1 |
| `.koadlcdestinationslist` | 1 | `.koalightpalette` | 1 |
| `.koarsoundmap` | 1 | `.texture_metadata` | 1 |

This is static reconnaissance. `strings`, filename patterns, and raw
byte-window matches are discovery evidence, not a complete interpretation of
BXML or other binary schemas. The repository does not currently contain
maintained parsers for BXML, FaceFX, soundbanks, or KSDF. The observed
corpus-wide facts should therefore be separated from hypotheses about runtime
references.

A focused follow-up parsed the repeated ID/name and localization-key
structures in the 79 `.bin` files and checked selected relationships to the
English `default` keys and quest assets. See the
[`2026-11-15 .bin analysis`](unpacked-bin-resource-analysis-20261115.md) for
the structural results and remaining unknowns.

For a future translation project, build the resource map before substantial
translation:

1. Keep a reproducible inventory of file path, extension, size, filename ID,
   locale, and naming-pattern match.
2. Build resource-family groups from exact IDs and locale variants, keeping
   filename co-occurrence labeled as such.
3. Add content-derived edges only when a stable key, parsed field, or
   independently verified reference establishes them; record the evidence
   method and confidence for each edge.
4. Link localization IDs to quest, interaction, lore, UI, cinematic, and
   voice resources where the formats support it, and explicitly record
   searched-but-not-found cases.
5. Use the resulting graph to classify text types and context before
   translation; preserve unknown speakers, order, and relationships rather
   than inferring them from co-occurrence.

This analysis confirms that the existing quest-key index is valuable but
narrower than a complete resource relationship map. It would have provided
useful translation context earlier, while still requiring source-language
comparison and Korean linguistic review.

## Evidence Sources

- The maintained reusable summary is
  [`resource-corpus-map.md`](../translation-reference/classification/resource-corpus-map.md).
- [`references/README.md`](../../../references/README.md): extracted-corpus
  scope, 8-byte key method, known examples, and binary-analysis limits.
- [`dialogue-context-group-index-and-revalidation-20261110.md`](dialogue-context-group-index-and-revalidation-20261110.md):
  reverse-mapping totals and the no-match result for interaction and FaceFX
  quest resources.
- [`build_dialogue_context_index.py`](build_dialogue_context_index.py):
  implementation scope of the maintained quest-asset index.
- Read-only `find`, `stat`, and filename-stem inventory of
  `references/data/unpacked/` on 2026-11-15.
