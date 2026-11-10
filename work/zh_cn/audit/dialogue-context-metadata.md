# Dialogue Context Metadata

The dialogue-context metadata is the maintainable bridge from localization
IDs to reviewable quest and character context. Dialogue rows live in the
`default` resource; `base` is a separate resource family and is not included
in this dialogue index.

## Files

- `default-quest-asset-index.tsv` has one row per exact 8-byte localization
  key and quest-asset association. An ID can appear more than once when its
  key occurs in multiple assets.
- `dialogue-context-review-ledger.tsv` has one row per reviewed
  `(resource, ID)`, with group membership, evidence links, and separate
  dispositions for meaning, naturalness, speech level, address, honorifics,
  and format. It stores a SHA-256 fingerprint over that ID's English,
  Japanese, Chinese, and active Korean text so changed source rows can be
  identified as stale.
- `dialogue-context-group-index-and-revalidation-20261110.md`,
  `dialogue-context-regroup-and-review-20261110.md`, and
  `dialogue-context-tr01-revalidation-20261110.md`,
  `dialogue-context-ffq80-revalidation-20261110.md`,
  `dialogue-context-sq87-revalidation-20261110.md`,
  `dialogue-context-ffq64-revalidation-20261110.md`,
  `dialogue-context-ffq67-revalidation-20261110.md`,
  `dialogue-context-ffq116-revalidation-20261110.md`,
  `dialogue-context-sq126-revalidation-20261110.md`,
  `dialogue-context-ffq35-revalidation-20261110.md`,
  `dialogue-context-sq79-revalidation-20261110.md`,
  `dialogue-context-sq102-revalidation-20261110.md`,
  `dialogue-context-sq93-revalidation-20261110.md`,
  `dialogue-context-sq100-revalidation-20261110.md`,
  `dialogue-context-sq108-revalidation-20261110.md`,
  `dialogue-context-sq116-revalidation-20261110.md`,
  `dialogue-context-sq117-revalidation-20261110.md`,
  `dialogue-context-sq118-revalidation-20261110.md`,
  `dialogue-context-ffq60-revalidation-20261110.md`,
  `dialogue-context-ffq66-revalidation-20261110.md`,
  `dialogue-context-sq80-revalidation-20261110.md`,
  `dialogue-context-ffq71-revalidation-20261110.md`,
  `dialogue-context-sq140-revalidation-20261110.md`,
  `dialogue-context-sq143-revalidation-20261110.md`,
  `dialogue-context-sq131-revalidation-20261110.md`,
  `dialogue-context-sq145-revalidation-20261110.md`,
  `dialogue-context-sq68-revalidation-20261110.md`,
  `dialogue-context-trsq01-revalidation-20261110.md`,
  `dialogue-context-trsq02-revalidation-20261110.md`,
  `dialogue-context-sq150-revalidation-20261110.md`,
  `dialogue-context-sasq01-revalidation-20261110.md`,
  `dialogue-context-sasq02-revalidation-20261110.md`,
  `dialogue-context-sasq03-revalidation-20261110.md`,
  `dialogue-context-m0-sq06-revalidation-20261110.md`,
  `dialogue-context-sq01-revalidation-20261110.md`,
  `dialogue-context-sq02-revalidation-20261110.md`,
  `dialogue-context-hm01-revalidation-20261110.md`,
  `dialogue-context-kv03-revalidation-20261110.md`,
  `dialogue-context-kv07-revalidation-20261110.md`,
  `dialogue-context-kvsq02-revalidation-20261110.md`,
  `dialogue-context-hp02-revalidation-20261110.md`,
  `dialogue-context-ffq26-revalidation-20261110.md`,
  `dialogue-context-ffq03-revalidation-20261110.md`,
  `dialogue-context-sq15-revalidation-20261110.md`,
  `dialogue-context-sq69-revalidation-20261110.md`,
  `dialogue-context-u03-revalidation-20261110.md`,
  `dialogue-context-ffq17-revalidation-20261110.md`,
  `dialogue-context-tr03-revalidation-20261110.md`,
  `dialogue-context-mq05-revalidation-20261110.md`,
  `dialogue-context-sq54-revalidation-20261110.md`,
  `dialogue-context-mq09-revalidation-20261110.md`,
  `dialogue-context-mq14-revalidation-20261110.md`,
  `dialogue-context-sq59-revalidation-20261110.md`,
  `dialogue-context-sq53-revalidation-20261110.md`,
  `dialogue-context-sq58-revalidation-20261110.md`,
  `dialogue-context-sq55-revalidation-20261110.md`,
  `dialogue-context-mq01-revalidation-20261110.md`, and
  `squire-brio-dialogue-voice-review-20261110.md` retain the full evidence,
  explanations, and proposed Korean text.

## Index Semantics

`default-quest-asset-index.tsv` is generated from the English 8-byte key table
and the read-only extracted `*.quest_bxml` corpus:

```sh
python3 work/zh_cn/audit/build_dialogue_context_index.py
python3 work/zh_cn/audit/build_dialogue_context_index.py --check
python3 work/zh_cn/audit/build_dialogue_context_index.py --check-review-ledger
```

`quest_ids`, `npc_symbols`, and `dialog_handler_count` describe the containing
asset, not an individual localization row. An exact key match proves only
that the key occurs in that asset. It does not prove dialogue status, speaker,
callback mapping, branch, addressee, or playback order. These remain
`not_mapped_to_key` or `unknown` unless separate evidence establishes them.
The scan is not a complete BXML parser and does not modify extracted assets.
If a serialized handler prefix or runtime-variable name contains a different
quest ID than the asset's explicit `QUEST_ID`, record both in the linked
review report; do not silently replace the explicit quest ID or infer a
key-to-handler mapping from the prefix.

The review ledger is curated. Use `not_flagged`, `candidate`, `uncertain`, or
`n/a` for each review dimension; `overall` is `not-issue`, `candidate`, or
`uncertain`. The validation command checks IDs, duplicate rows, dimension
statuses, and four-language fingerprints. Update the fingerprint only after
rechecking a changed source row. Do not convert a candidate into an approved
edit in the ledger. The Editor applies only accepted findings through the
project's guarded CSV editing workflow. Keep source text and long rationale in
the linked review record rather than duplicating entire translations in the
index.

## Current Seed

The seeded review groups are Squire Brio, `TR06` / Grim Onwig, `TR01` /
Grim's rescue quest, `FFQ80` / Bera Grastar, `SQ87` / Adessa Prison letter,
`FFQ64` / Agraivin Hand, `FFQ67` / Vulgar Donnoh, `FFQ116` / Kreger the
Devout, `SQ126` / Gwenna Hand, `FFQ35` / Menri Togh, `SQ79` / Terenia,
`SQ102` / Aluck's quest, `SQ93` / the Font and Sacred Pools quest, `SQ100` /
Esha's quest, `SQ108` / Decanus Paige's quest, and `SQ116` / Drewn Ansilla's
quest, `SQ117` / Malthon's quest, `SQ118` / Zanvil Whit's quest, and
`FFQ60` / Brit Codgan's quest, `FFQ66` / Harriset Donnel's quest,
`SQ80` / Gorem Kane's quest, `FFQ71` / Knave of Pride quest,
`SQ140` / Colm and Giran Alba, `SQ143` / Galette treasure,
`SQ131` / Bronwen Senn arena, `SQ145` / Lila Janick, and
`SQ68` / Liordran-associated war context, `TRSQ01` / Star Camp initiation,
`TRSQ02` / Moon Camp and Maire Ganan, `SQ150` / Lina Ardeen,
`SASQ01` / Idris Theonen, `SASQ02` / Telemachus Rasp, and
`SASQ03` / Jorum Quintus, `M0_SQ06` / Ratofer's sale quest,
`SQ01` / Ainmhi, `SQ02` / Kells Cafferty, `HM01` / the House of Ballads
contest, `KV03` / Ost Ordura, `KV07` / Gwyn Anwy, and `KVSQ02` / Khamazandu's
gift quest, `HP02` / Erion Raff's staff quest, `FFQ26` / Ruin Imas's
Culminite quest, `FFQ03` / Murdoc Hain's fire-potion quest, and
`SQ15` / Enconeg Holn's Ettinmere quest, `SQ69` / Captain Keloran's Shadow
Pass campaign, `U03` / the Coilsbain Cavern quest associated with Thaddeus
Holn's asset, `FFQ17` / Elrod Edman's refugee-spy quest, and `TR03` / the
Master's Pick quest associated with Eloren Criet's asset, and `MQ05` /
Glianal's main quest asset, `SQ54` / the Family Rivalry quest for Steg
Darkvari and Hrindi Zungar, `MQ09` / General Tilera's quest, `MQ14` / the
Dannestar Island quest associated with Cydan's asset, `SQ59` / Feride Ouet's
research quest, `SQ53` / Aetill Algar's Skoria mine quest, `SQ58` / Parwen
Well's quest, `SQ55` / Aergase's quest, and `MQ01` / Encel's main quest asset.
All 56 priority assets now have a linked review report and ledger coverage.
In
`616680.quest_bxml`, the index extracts
`QUEST_ID ACTOR` while serialized handlers and identifiers use the `U03`
prefix; the linked report records both without treating them as a confirmed
per-key mapping. Each quest asset's NPC symbol and dialogue handlers are
asset-level evidence; localization keys are not mapped to individual
handlers. Rows are separately classified as dialogue, player choice, or
quest/UI text where supported by content. Specific speaker-at-key mapping and
playback order remain unknown unless the linked review record says otherwise.
