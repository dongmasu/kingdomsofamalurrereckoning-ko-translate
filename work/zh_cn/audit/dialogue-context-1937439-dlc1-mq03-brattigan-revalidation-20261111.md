# `DLC1_MQ03` / Brattigan-Associated Asset Revalidation

- Date: 2026-11-11.
- Scope: all 369 `default` IDs linked to `1937439.quest_bxml`.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Seven correction candidates and four evidence-limited holds are recorded.
  The active Korean translation CSV was not changed.

## Grouping Evidence and Limits

The asset has explicit quest ID `DLC1_MQ03`, the asset-level NPC symbol
`DLC1_NPC_GAL_DOK_Brattigan`, 184 serialized `dialog_line_*` handlers, and
369 distinct localization keys. Its keys cover dialogue-like lines, names,
labels, and quest-related text across the Gallows End story. The asset-level
NPC symbol and handler count do not map individual keys to Brattigan, another
speaker, a callback, branch, addressee, or playback order. Per-key speaker
attribution remains unassigned and playback order unknown.

All 369 rows were compared across English, Japanese, Chinese, and active
Korean. There are 21 exact-English duplicate groups covering 87 rows. Korean
is identical within every group. Japanese differs within one group,
`Hello again.` (`6159`, `63671`); the Korean `또 만났네.` is neutral and
remains unchanged rather than being forced to mirror the Japanese
distinction without speaker evidence. Chinese is identical within all 21
groups. No reviewed row has an embedded line break, runtime placeholder, or
markup token.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `1377` | Naturalness | `내 필요도 좀 더 배려해야 해` is a literal, awkward rendering of `be more considerate of my needs`. Recast conversationally around what the speaker wants or needs, while retaining the flirtatious, assertive tone and the follow-up that there are many such needs. | Medium-high |
| `1430` | Meaning | `모든 사이온은 ... 준비를 마치지` says that all Scions finish their preparations here; the source only says they undergo preparations here. Avoid adding completion, for example with `이곳에서 준비를 하지`. | Medium |
| `34240` | Naturalness | `자라서 번성하기에 이보다 좋은 곳` is understandable but stiff for a place where Nina can grow and flourish. Consider a more idiomatic expression such as `성장하고 번성하기에 이보다 좋은 곳`. Do not infer who is speaking from the asset-level NPC symbol. | Medium |
| `51522` | Naturalness | `가끔 배신이 오가기도 하지만` can suggest that betrayal is exchanged between parties. Prefer wording that says treachery occasionally occurs, while retaining the line's wry description of the sea. | Medium-high |
| `55424` | Naturalness | `선한 영향력을 대변해` is an awkward collocation for representing a benevolent influence. Recast as showing or embodying that influence without changing the source's claim. | Medium-high |
| `58030` | Naturalness | `큰일을 해 줬어` can mean that the player did something major, rather than did the people a great service. Prefer a direct expression such as `큰 도움을 줬어`. | High |
| `59263` | Terminology / format | English is `Commodore Garrick`, while Korean is only `개릭 제독`. Verify the project's rendering of the specific rank `Commodore` against related uses, and include the English name/title together if the established name-label convention applies. Do not silently substitute a Korean rank before checking terminology. | Medium |

## Evidence-Limited Holds

| ID(s) | Dimension | Evidence and disposition |
| --- | --- | --- |
| `39698` | Meaning / text type | The line describes being selected as the next Scion and enduring meditation in Souldeep Fasting. The English, Japanese, and Chinese support the current broad meaning, but this isolated row does not establish whether its first-person register is spoken dialogue, a journal, or another text type. Do not impose a speaker voice or resolve the place-name nuance from the asset association alone. |
| `50343`, `51988` | Terminology / text type | Both exact-English `Scion's Guard` labels have the same Korean `사이온(Scion)의 경비병`. The sources do not establish whether this is an individual guard label, a collective title, or a faction name in the displayed context. Retain pending UI/context evidence rather than changing singular/plural or the group term. |
| `53200` | Meaning / terminology | The line names the meditation location as `Souldeep` while other rows in this asset use `Souldeep Fasting`. Japanese and Chinese describe the place as Souldeep's depths/channel, but do not settle whether the English wording is a proper place name or a descriptive phrase. Keep the existing distinction provisional. |

## Repeated-English Groups

All 21 groups and 87 rows were compared in all four languages. Korean already
matches within each group, including the repeated labels `The Scion`, `The
Offering`, `The Hanged Men`, `Akara`, `Dead Kel`, `Gallows End`, `Gravehal
Keep`, and `Scion's Guard`. The differing Japanese renderings of `Hello
again.` do not by themselves justify changing either Korean row.

## Complete Reviewed ID Set

The exact 369-ID membership is represented by the asset links in
[`default-quest-asset-index.tsv`](default-quest-asset-index.tsv) and the
corresponding fingerprinted rows in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
The regenerated ID catalog links each reviewed ID to this report. These
machine-readable records are authoritative for the complete set.
