# D-21925: Fresh Name Candidates at default:24000-24099

Date: 2026-10-20

## Finding

At `default:24089`, the English explicitly names the new druid guild “the
Tree and the Branches,” and the following clause identifies it as a guild.
Japanese `木と枝` and Chinese `大树与树枝` support the translated name.
Korean already translates the title as `나무와 가지`, but omits the English
name used by the established bilingual display at `default:62702`.

Added the source name only to that quoted title:
`나무와 가지` -> `나무와 가지(Tree and the Branches)`.
This is a scoped name-display correction; D-7736's broader sentence/lore
uncertainty and all other prior dispositions remain unchanged.

Other name candidates in the range were consistent with existing row or
glossary decisions and were not reopened.

## Focused Verification

Manifest: `translation-correction-D21925.tsv`.

Only the exact title span in `default:24089` changed. The focused independent
check confirmed the expected target text, exact inverse reconstruction, and
byte-identical non-target content. No full format/residual audit, inventory
rebuild, package build, or in-game test was run.

Default SHA-256:
`58562b49f9d98c4b123bf859ff7893accfb13458edcc944c75fa7f1a4341ccf0` ->
`41e9a3c1a417f07fb9306027b6d3779db1a47ffeb755517102ef954c22fd7433`.

Byte-identical backup:
`/private/tmp/ko-translate-backups/20261020/before-proper-name-D21925/locatexts_zh_cn.koalocatext_default.csv`.

Next: D-21926, screen fresh candidates from `default:24100` onward; exclude
exact scopes already reviewed and retain existing unresolved holds unless
new decisive evidence appears.
