# D-19646: Resolve the Remaining D-19645 Item

**D-2386 / default ID 8500** in the 200-key snapshot
`uncertain-200-D2320-D2663-20261012.jsonl` is now **accepted**.
English has `Mitharan Prismere Plumb`; Japanese transliterates `プラム`,
Chinese interprets the item as a hammer, and Korean `배관` asserts
plumbing. The official Korean manual gives no item-specific equivalent.
Change `미타란 프리즈미어 배관` to `미타란 프리즈미어 플럼(Plumb)`.
This replaces the false plumbing category with a searchable phonetic
item name while expressly preserving the English noun and not inventing
a tool/weapon category. If primary item metadata is later discovered,
the retained English form permits a targeted terminology refinement;
no further hold is needed for the current text. No PAK or derivative
was used.

The full D-19645 snapshot is now resolved: five previously closed IDs
linked without recount, **38 newly accepted** and **157 newly
not an issue**. D-19646 adds one accepted to D-19645's historical
totals and subtracts one uncertain.

- Pre-edit SHA-256: `2ee10c3cddf17eec601215eeaba0a6862983bbf66ddbf5f194803ac3e76ca5d6`.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261012/before-plumb-D19646/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit SHA-256: `9a683428ba7c91cec308df8287acdf4669b1c05db7a8f4de023982a6ba93d989`.
- Exact inverse, UTF-8 BOM, all 72,011 CRLF and 73 bare-LF
  endings, original row order, and all other bytes verified.
- New totals: **2,677 accepted / 26,557 not an issue /
  9,290 uncertain** (38,524). Next **D-2664 / default ID 9480**,
  snapshot `uncertain-200-D2664-D3004-20261012.jsonl`; its 200
  keys were matched against four live locale CSVs. Separate Chinese-only
  provisional `affix` holds: **55**. Overall review incomplete.
