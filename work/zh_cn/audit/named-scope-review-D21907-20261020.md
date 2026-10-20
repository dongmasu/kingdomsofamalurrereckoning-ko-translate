# D-21907: Historical Plack Meaning Correction

Date: 2026-10-20

## Finding

At `default:18572`, English labels the object `Historical Plack`. A plack
is a historical Scottish coin; the Dictionaries of the Scots Language defines
it as a small Scottish coin, and aligned Chinese `古老硬币` also identifies
it as an old coin. Korean `역사 명판` instead means a historical plaque.
Correct the label to `역사적인 동전(Historical Plack)`, preserving the exact
English source title.

This corrects the item's meaning only. The available row does not establish a
separate named entity, so no glossary or occurrence-index entry was added.

## Candidates Excluded

- `Arkes` (`default:18526`) and `Halcyor` (`default:18535`) already have
  terminal, source-aligned findings; their Korean labels are correct.
- `Montenegro` (`default:18559`) is already rendered with the standard Korean
  country-name spelling and provides no correction evidence.
- `Old Avgrunn Wine` (`default:18554`) has no demonstrated Korean meaning or
  name-form error; it remains unchanged.

## Focused Verification

Applied one `Texto` cell with `proper-name-cell-editor.rb` and verified it
against the exact pre-edit backup with `verify-proper-name-edits.rb`. No
full-format or residual audit, package build, or in-game validation was run.
No glossary, occurrence-index, or release artifact changed.

Manifest: `translation-correction-D21907.tsv`.
Backup:
`/private/tmp/ko-translate-backups/20261020/before-proper-name-D21907/locatexts_zh_cn.koalocatext_default.csv`.
Default SHA-256:
`7bdeeddf87d8f0f56a9b077f519968b97a4d473f44a137abbab426d4e3ae91d5` →
`3ec84a35afab3392eb25abbab22411d91db82d5512cbd0d551ab925986fa123b`.
The editor and independent verifier passed for one cell across 65,135
ordered rows; BOM, line endings, row order, non-target bytes, and inverse
reconstruction were preserved.

Lexical source: [Dictionaries of the Scots Language, “plack”](https://dsl.ac.uk/entry/snd/plack).
