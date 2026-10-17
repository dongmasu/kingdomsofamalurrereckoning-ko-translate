# D-20391: A–A Personal-Name Families

Date: 2026-10-15

## Scope and Decisions

Reviewed the prepared A–A person-name families against English, Japanese,
Chinese, the active Korean text, and the existing glossary. The source-aligned
proposal set contains 274 records but two identical duplicate keys; the
deduplicated manifest covers 272 distinct active rows: three `base` and 269
`default`. Every row has an explicit disposition: 154 accepted edits, 117
unchanged (`not-an-issue`), and one excluded family-name false positive.

The 154 changes are one `base` cell and 153 `default` cells. They standardize
source-identified occurrences of Aara Lollyrs, Aedran Tyr, Afan Del, Afan
Arduoch, Beckry Aideh, Billis Aideh, Durant Alaghus, Einar Abergast, Agraivin
Hand, Aewald, Agarth, and the reviewed A–A short-name families to established
English-indexed Korean forms with English in parentheses. Aewald uses
`애월드(Aewald)`; personal names retain the glossary's accepted forms.

English controls identity and name spelling. Japanese and Chinese corroborate
the same people but do not override the English source or the established
Korean canon. Full names are kept distinct: Afan Del is not Afan Arduoch;
Beckry Aideh is not Billis Aideh. In full-name contexts, the comparison
manifest also associates the reviewed component-name dispositions only when
the English source explicitly contains that full name. The source variant
`Afan Dell` at `default` 29273 is documented as an alias of Afan Del, not a
separate person.

The Aidehs plural at `default` 62222 denotes the Aideh family in a historical
passage, not the individual Aideh person; it is explicitly excluded. Other
ordinary words, unrelated names, and unreviewed contexts are not implicitly
standardized by this pass.

The complete cell-level decisions and source evidence are in
[`proper-name-edits-D20391.tsv`](proper-name-edits-D20391.tsv), with the
original source-aligned proposals retained at
[`proper-name-proposals-A-D20391.tsv`](proper-name-proposals-A-D20391.tsv).
The glossary remains in progress; this pass does not assert exhaustive
discovery or change a historical/global disposition tally. Sequential review
remains complete through D-20377 / ID 65134.

## Integrity

See [edit addendum](named-scope-edit-addendum-D20391-20261015.md).
Only active Korean `Texto` cells in `base` and `default` changed. Affix,
source CSVs, PAKs, and PAK-derived files were not modified or inspected.
No build or publication occurred.
