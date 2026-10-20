# D-21877: Low-Precision Person-Name Scout Screen

Date: 2026-10-20

## Scope

Reviewed the 20 already-generated entries in
`/private/tmp/proper-name-person-scout-D21877.tsv` using short aligned
English/Japanese/Chinese/Korean examples and the active glossary. This was a
candidate screen, not a review of every occurrence associated with each token.

## Findings

The queue is dominated by common words or lexical fragments from compound
names, rather than unregistered people. `House`, `Court`, `Chaos`, `Summer`,
`Winter`, `Camp`, `DEAD`, `Teeth`, `Coast`, `Great`, `Hall`, and `HIGH` are
generic or descriptive in the sampled rows. `Senshir`, `Arcana`, `Scholia`,
`Gallows`, `Ansilla`, `Motus`, and `Cape` occur as components of existing
glossary entries such as Mel Senshir, Scholia Arcana, Gallows End, House
Ansilla, Motus Mining, and Cape Solace. `Maid` is a role/common-word hit in
the sampled `Hero and the Maid` and `The Maid` contexts, not evidence of a
new personal-name entity.

Representative aligned rows include `base:1480` (Mel Senshir / メル・センシア
/ 梅尔森溪 / 멜 센시르), `base:1913` (Scholia Arcana / アルカナ大学 /
奥术学院 / 스콜리아 아르카나), `base:2368` (Cape Solace / ケープ岬 /
宽慰角 / 케이프 솔라스), and `base:4585` (Hero and the Maid / 英雄と烈女 /
英雄与少女 / 영웅과 시녀). The sampled Korean renderings are consistent
with the project's established names and do not reveal a clear content error.

## Outcome

No translation, glossary, occurrence-index, or release-artifact change.
No full format validation or residual audit was run: this read-only screen
did not modify source data. The scout's low precision is a reason to skip
similar generic-token queues unless a stronger content-focused signal appears.
Continue bounded, content-first proper-name review.
