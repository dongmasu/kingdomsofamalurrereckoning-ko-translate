# D-20924: Great Cycle Glossary Standardization

Date: 2026-10-15

## Scope and Decision

Reviewed all 75 distinct `default` row keys whose English source contains
the exact named term `Great Cycle`. English is the meaning anchor;
Japanese uses `大円環` and Chinese uses `伟大轮回`, corroborating the
same Fae cosmological cycle involving death, rebirth, seasons, and
magical balance. The official Korean manual's extracted text and
reference were searched; they do not provide a direct Korean rendering
for this lore concept.

D-19550 locally preferred `대순환` at ID 62899 by reference to D-3787,
but the later D-19613 and D-19617 reviews explicitly established
`위대한 순환` as the corpus form. This pass follows those later decisions
and registers `lore:great-cycle` as `위대한 순환(Great Cycle)`.
Observed alternatives `대순환`, `대주기`, `대원환`, and
`위대한 대순환` are recorded as Korean variants, not canonical forms.
Generic seasonal/natural cycles and standalone `Cycle` wording were not
inferred from this exact-phrase search.

Corrected 71 `Texto` cells and retained four already-canonical cells as
`not-an-issue`. ID 4828's `대주기의 한 순환을 마칠 때마다` was recast
as `위대한 순환(Great Cycle)이 한 차례 돌 때마다` to preserve the
source's meaning while making the named term explicit. Repeated
Great Cycle mentions inside a reviewed cell were normalized together.
These are focused glossary dispositions; historical sequential-review
totals and exact-key findings were not recounted or changed.

## Integrity

- Active default before: `e9a841405bb10f2567c81042d777c8e27751707898e7727c3209d5a944463767`.
- Active default after: `5e8e74fae5633528e7a339124a3feabebf66036e870f9f091432a4b02035c8bc`.
- Byte-identical pre-edit backup: `/private/tmp/ko-translate-backups/20261015/before-proper-name-D20924/locatexts_zh_cn.koalocatext_default.csv`.
- The independent verifier confirmed 65,135 ordered rows, target
  `Texto` values, BOM, mixed line endings, unchanged non-target bytes,
  and byte-for-byte inverse reconstruction.
- The occurrence index preserves all prior dispositions and five
  contextual Anwon-family records; it adds 75 reviewed Great Cycle
  matches. No global translation tally was changed.
- `src/csv/` was read-only. No PAK or PAK-derived resource was inspected.

See [`proper-name-edits-D20924.tsv`](proper-name-edits-D20924.tsv) for
all aligned English/Japanese/Chinese/Korean cells, and
[`proper-name-glossary.tsv`](proper-name-glossary.tsv) /
[`proper-name-occurrences.tsv`](proper-name-occurrences.tsv) for the
canonical entry and reviewed match index.
