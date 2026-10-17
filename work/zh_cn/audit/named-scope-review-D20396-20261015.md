# D-20396: D-L Personal-Name Cross-Check

Date: 2026-10-15

## Scope and Decisions

Independently reviewed the 42 row keys in the D-L proposal subset for
Fallon, Egest, Gwalchmai, Gray, and Kaharine. English established the people
and sentence meaning; Japanese and Chinese were checked for identity and
name rendering; the active Korean corpus and prior glossary decisions were
checked for canonical forms. The official Korean manual does not list these
NPCs.

The review accepted 23 proper-name corrections (six `base`, 17 `default`)
and retained 19 rows as `not-an-issue`. No row in this 42-key subset remains
uncertain or excluded. The reviewed manifest is
[`proper-name-edits-D20396.tsv`](proper-name-edits-D20396.tsv).

Use `팰런(Fallon)` from the existing D-20383 glossary decision; the generated
proposal's `파론` would have introduced a new spelling conflict. Retain
`그월흐마이(Gwalchmai)`, also the existing canonical form, and normalize
the proposal's competing spellings back to it. English/Japanese/Chinese
identify the same person, but do not establish a better Korean form.
For Egest, the repeated full names Avery Egest and Rikka Egest, Japanese
イジェスト, Chinese 埃格斯特, and the active corpus support selecting
`이게스트(Egest)` over the older `에게스트(Egest)` entry; the glossary now
records the superseded form as a variant. Gray in the Three Lamps dialogue
and both names in the illness sentence at `default` 48023 are unambiguously
people. The edits add or correct only their proper-name forms and English
annotations; they do not settle separate sentence-level questions.

This is a 42-row reviewed subset, not a disposition of every occurrence for
these people. Other matches remain in the occurrence index for later review.
No prior sequential finding was reopened or recounted, and no global tally
was changed.

## Integrity

See the [edit addendum](named-scope-edit-addendum-D20396-20261015.md).
Only `Texto` cells in active `base` and `default` were edited; `affix` and
all source CSVs were untouched. No PAK or PAK-derived file was inspected.
