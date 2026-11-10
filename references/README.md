# Reference Materials

This directory contains read-only sources for translation research and game
resource analysis. It is not an active editing or build directory.

## Contents

- `manual/`: official Korean game material used to verify established names,
  terminology, and setting context.
- `data/unpacked/`: extracted game resources. The observed corpus contains
  12,337 files, including 530 `quest_bxml`, 517 `interaction_bxml`, and 53
  `facefx_quest_bxml` files. It also contains `affix`, `base`, and `default`
  localization binaries for `de_de`, `en_us`, `es_es`, `fr_fr`, `it_it`,
  `ja_jp`, `ru_ru`, and `zh_cn`.
- `unpacker repacker scripts/`: reference unpacker/repacker scripts and their
  accompanying instructions. The maintained project tools are in
  `tools/loc_toolset/`.
- `wiki/`: a saved community-maintained article. Use it only as secondary
  context and verify relevant claims against primary game resources.

## Dialogue and Binary Analysis

The `default` localization unpacker assigns row IDs by pointer-table order.
Those IDs identify strings in the localization table; they are not dialogue
sequence numbers. The CSV contains no speaker field, so do not infer speaker
identity or conversation order from an ID or neighboring rows.

The bridge between localization rows and quest assets is an 8-byte key per
`default` row in `src/csv/en_us/estrutura_hashes_flat.bin`. Its 65,135 keys are
unique in the current corpus, and the same byte sequences occur in quest BXML
resources. A read-only scan found 51,080 row keys in 426 of the 530 quest
resources; the scan also covered interaction and FaceFX quest resources. This
maps many rows to quest assets, but a quest asset can contain text for several
NPCs and non-dialogue objectives or journal entries.

For example, IDs `5748`, `27137`, and `9219` map to
`data/unpacked/1339422.quest_bxml`. Their 8-byte keys occur in the same
serialized script block that names `NPC_YSA_SEE_Brio` and quest `SQ81`, which
strongly connects those rows to Brio's quest interaction. The quest asset also
has symbolic `dialog_line_*` handlers. Related callback names in
`134230570_klua.batch` encode quest, dialog-topic asset, and line number; the
topic symbol table resolves callback topic ID `1530217` to `ProblemTOPIC`.
That is distinct from the separately registered `BrioTOPIC` asset ID
`1252288`, so the callback topic ID alone must not be treated as proof of
Brio's speaker identity. The keys have not been mapped to exact callback line
numbers or a complete playback order.

Other Brio-related candidate IDs, including `1326`, `4669`, `6737`, `46922`,
`52385`, and `56934`, map to `1490841.quest_bxml` (`NQD_City_Ysa`). That asset
contains several NPCs and dialog topics but no explicit
`NPC_YSA_SEE_Brio` identifier. These matches identify the containing quest
resource only; they do not verify Brio as the speaker or locate the exact
dialogue node.

Use the 8-byte key match to find candidate assets, then inspect script blocks,
NPC references, callback names, and topic symbols before assigning a speaker
or sequence. A quest-file match alone does not prove that a row is spoken
dialogue, and callback line numbers do not by themselves establish the full
conversation order.

Binary string extraction is useful for reconnaissance, but it is not a
complete parser for BXML resources. Treat partial strings or inferred links as
unconfirmed until checked against the resource structure and related assets.

## Handling

- Keep extracted game assets and other reference materials unchanged.
- Do not place generated analysis output under `references/`.
- `references/README.md` and `references/manual/` are the only contents
  intended for Git; all other reference files remain ignored.
