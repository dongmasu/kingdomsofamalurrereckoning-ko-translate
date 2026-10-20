# D-21931: Fresh Name Candidates at default:24600-24699

Date: 2026-10-20

## Findings

At `default:24666`, the standalone English title is “The Tree and the
Branches.” This is the same druid guild named in the aligned English,
Japanese `木と枝`, and Chinese `大树与树枝` at `default:24089`, and it matches
the established bilingual display `나무와 가지(Tree and the Branches)` at
`default:62702`.

The Korean standalone title lacked its English name. Corrected only
`default:24666`:
`나무와 가지` -> `나무와 가지(Tree and the Branches)`.
This does not reopen D-7736's broader sentence/lore uncertainty.

Other candidates were consistent with existing row/glossary decisions.
The unresolved Asker's Alley/name relation and all other prior holds remain
unchanged.

## Focused Verification

Manifest: `translation-correction-D21931.tsv`.

The first focused check caught that the text patch changed the target row's
line ending from CRLF to LF. Restored the source CRLF, then independently
confirmed that the exact target row was the only byte change, inverse
reconstruction matched the backup, and all non-target bytes were identical.
No full format/residual audit, verifier suite, inventory rebuild, package
build, or in-game test was run.

Default SHA-256:
`41e9a3c1a417f07fb9306027b6d3779db1a47ffeb755517102ef954c22fd7433` ->
`88eecfe711c483754356fd782d09d7974fbfb51cbd8938b31a24f0ce77af3585`.

Byte-identical backup:
`/private/tmp/ko-translate-backups/20261020/before-proper-name-D21931/locatexts_zh_cn.koalocatext_default.csv`.

Next: D-21932, screen fresh candidates from `default:24700` onward; exclude
exact scopes already reviewed and retain existing unresolved holds unless
new decisive evidence appears.
