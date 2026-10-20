# D-21903: Aelric Aedic Given-Name Distinction

Date: 2026-10-20

## Finding

At `default:12095`, English names `Aelric Aedic`; Japanese
`アエルリック・エイディック` and Chinese `埃尔里克·埃迪克` preserve an
initial Ael-/Ai-el- sound. Korean was `엘릭 아에딕(Aelric Aedic)`, using
the same given-name form as the distinct confirmed `Elric Sequaning` at
`default:59456`.

The separate `Elric Sequaning` label is Japanese `エルリック・セカニング`,
Chinese `艾尔里克·瑟荃宁`, and Korean `엘릭 시퀘이닝`. Thus, the current
Korean `엘릭` collapses the source spelling `Aelric` into the distinct
name `Elric`, while both supporting locales preserve the initial Ael-/Ai-
distinction. Correct only the given name to `에일릭`; retain the established
surname form `아에딕` and exact English parenthetical. This does not identify
the two characters or add an alias.

## Focused Verification

The byte-preserving editor and independent manifest verifier passed for one
`Texto` cell across 65,135 ordered rows. BOM, mixed line endings, row order,
non-target bytes, and inverse reconstruction against the byte-identical
backup were preserved.

- Manifest: `proper-name-edits-D21903.tsv`.
- Backup: `/private/tmp/ko-translate-backups/20261020/before-proper-name-D21903/locatexts_zh_cn.koalocatext_default.csv`.
- Default SHA-256 before: `f8b4a7d0a1515a24df58274ec7991cc081f4458f8da9ab564810783d6889570d`.
- Default SHA-256 after: `353f28f3890edb1feac645e4282af345faf3a7d0e0a90e6632175a8e09b953aa`.

No glossary, occurrence-index, other resource, or release artifact changed.
No full residual/format audit, package build, or in-game validation was run.
