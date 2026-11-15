# Plain-language review of `벼리다` forms

The user requested replacing difficult forms of `벼리다` throughout the
active Korean translation with familiar wording. The active `base`,
`default`, and `affix` CSVs were searched; 9 `base` keys and 71 `default`
keys contained the targeted forms, with 82 occurrences altogether.
No affected `affix` keys were found.

The English source is the meaning anchor; Japanese and Chinese were used as
supporting references. The changes are contextual, not a blanket rule for
the English word `forge`: crafting and recrafting generally use `만들다`,
`제작하다`, or their `다시` forms; weapon honing uses `다듬다`;
chain-link construction uses `엮다`. Figurative uses were adapted to their
sentences. For example, `default:9945` now says `직접 만들어야 한다`.
At `default:48096` the broken weapon is entrusted to a skilled smith;
at `default:54140` the forge recalls making the hammer, not itself.

Repeated English groups `3268/30663`, `11314/35745`, `15803/56157`,
`32611/57093`, and `21146/54916` were reviewed for impact. Their Korean
wording need not be identical where context or existing expression differs.

Changed keys:

- `base`: 339, 802, 1079, 2192, 2351, 2657, 3140, 3511, 4034.
- `default`: 1404, 3268, 4300, 5202, 5399, 7912, 9945, 9966, 11028,
  11040, 11314, 13270, 13306, 15803, 19515, 21146, 21607, 21753, 23942,
  25506, 25866, 25901, 27574, 28774, 30663, 32578, 32611, 33653, 34483,
  34776, 35356, 35745, 36134, 37741, 38796, 38917, 38945, 38985, 39548,
  39661, 39688, 39975, 40384, 42136, 43050, 43053, 43095, 43632, 45657,
  48096, 49001, 49092, 51325, 51595, 53705, 54140, 54916, 55085, 55383,
  56157, 56320, 56649, 57093, 57633, 58245, 61804, 62386, 62458, 62651,
  63263, 63792.

The editor updated only the selected text fields with the ID-scoped
preservation tool. The 71 affected `default` ledger fingerprints and 157
related proper-name occurrence snapshots were refreshed, leaving existing
statuses and evidence intact. The repeated-source index was regenerated.
The changed 71 fingerprints, parsed row counts, keys, brace markers,
embedded newline counts, BOMs, and file newline totals were checked.
The preservation-tool tests and duplicate-index tests passed. The full
ledger check stops at the pre-existing stale `default:14712` fingerprint;
that unrelated record was not changed.
