# D-20395: C-Family Personal Names and Linked Names

Date: 2026-10-15

## Scope and Decisions

Reviewed 687 unique row keys in `affix`/`base`/`default` where English
identifies a C-family person or a directly linked full name, title, faction,
place, organization, or named item. The prioritized C-initial personal-name
group contains 25 single-name entries. Additional entries were included only
where needed to distinguish whole names from their components or resolve a
same-row homonym (for example, Colet versus Colet and the Echoes, and Cryamor
the person versus the pet sword).

The review made 433 evidence-backed `Texto` corrections: seven `base` and
426 `default`. It retained 252 source-faithful or already canonical cells as
`not-an-issue` (six `base`, 246 `default`) and excluded two non-person
`Cemble's` business references. No `affix` row matched this scope. No
materially unresolved row was left in the final disposition set.

The report and [row-level manifest](proper-name-edits-D20395.tsv) preserve
the source evidence and each disposition. Main consistency decisions include
`코던 파상트(Courdan Passant)`, `애스터 콜리앤(Astor Colliane)`,
`콜렛(Colet)`, and `콜렛과 에코즈(Colet and the Echoes)`. The musical
ensemble is not treated as one personal name. `House Anwon`, `Togh Farm`,
and named-object titles are kept distinct from their people/components.
Full personal names receive one complete English parenthetical; titles and
unrelated parentheses are retained. Korean particles were checked after
respelling.

Fifteen provisional no-match rows received a focused second pass against
their English, Japanese, Chinese, and Korean context. This cleared the
House Anwon forms, Togh Farm labels, Caerwyn's Tome, Calovar's Relic,
Scholar Nerenne, Coriana's title, and the ensemble title; `Anwon blood` is
retained as contextual lineage wording rather than mechanically rewritten as
a House title. These source-aligned decisions are represented in the
manifest, not added to a global tally.

## Integrity

See [edit addendum](named-scope-edit-addendum-D20395-20261015.md).
Only active Korean `Texto` cells changed. The official Korean manual does not
cover these individual C-family names; it remains the authority for any
established terms it does cover. No source CSV or PAK material was inspected
or modified, and no build or publication occurred.
