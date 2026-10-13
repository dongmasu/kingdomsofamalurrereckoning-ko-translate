# Consolidated `affix` Linked-Hold Context Check (D-19549)

- Date: 2026-10-12; decision D-19549.
- Scope: fallback variants 12, 14, 21, 22, and 24 linked to affix IDs 115
  and 117.
- Linked dispositions remain under D-18173 and D-18175; these five-row
  fallback groups are not counted as separate decisions.

## Decisions

| ID / variants | Active Korean | Disposition | New context check |
| --- | --- | --- | --- |
| 115 / 12, 14, 21, 22, 24 | `*심판받은 자*` | uncertain; link D-18173 | A search of English default text finds no occurrence of `the Reckoned` or `Reckoned` that identifies the affix's referent. Generic `Reckoning` mechanics and the unrelated phrase “force to be reckoned with” do not resolve whether the modifier denotes a judged person, recompense, or another lore effect. |
| 117 / 12, 14, 21, 22, 24 | `행운의` | uncertain; link D-18175 | English default text contains generic luck/fortune, a named ship (`Maid of Fortune`), and unrelated fortune-telling references, but none links this affix to an item, effect, or named entity. ID 15844's “fate's favors” likewise does not identify affix 117. |

No new evidence safely resolves either linked decision. Their five fallback
rows each remain linked and must not be double-counted.

## Counts and Integrity

- The 55 Chinese-only fallback keys remain 10 `ACCEPTED`, 10
  `NOT_AN_ISSUE`, and 35 `UNCERTAIN`; all 140 fallback keys remain
  10 / 95 / 35.
- Active `affix` SHA-256 remains
  `516b827b70d6a1262fd95ab7de46a1d5a9494d3b70a9a64dad89ad1d0a1b2f8e`.
- Fallback inventory SHA-256 remains
  `d9bfb5934c1216d718134374ffdd74f75b903a2d42e01a713a94f652dab279cc`.
- No Korean CSV or inventory cells changed; no backup was needed.
- At this checkpoint, default totals remain **2,456 accepted / 25,349 not
  an issue / 10,719 uncertain** (38,524), with active SHA-256
  `84f6eac5ab61cca00b219d2949605f086a86daca0ddeb5d132321c959ad71ebd`.

## Resume

D-19550 follows the newly found cross-corpus term context for default ID
62899 (`Great Cycle` / `Flowering`). Do not repeat source-only comparisons
for IDs 115 and 117 without a newly linked item/effect source.
