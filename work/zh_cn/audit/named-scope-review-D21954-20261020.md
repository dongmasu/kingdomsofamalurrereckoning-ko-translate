# D-21954: Singular/Plural English-Name Collision Screen

Date: 2026-10-20

## Scope

Compared English canonical names and aliases across glossary entities after
normalizing a trailing plural `s`, checking whether singular/plural spellings
concealed a source-meaning or Korean-translation conflict.

## Findings

Six cross-entity groups surfaced. `Darkvari`/`Darkvaris`,
`Skoria`/`Skorias`, and `Zungar`/`Zungars` distinguish personal or family
forms in their exact contexts. `Obsidian Isle`/`Obsidian Isles` retain the
previously reviewed singular/plural geographic scopes. `Galette Tunnel` and
`Galette Tunnels` keep their exact source forms and unmerged scope under
D-21326. `The Raven` inn and `The Ravens` arena team remain separate under
D-21557.

These source distinctions and prior exact-row decisions support the current
Korean translations. No new name error or identity conflict was found. No
source CSV, glossary, or occurrence-index change was warranted. No
format/residual audit, inventory rebuild, package build, or in-game test was
run.

Next: D-21955, use a distinct source-bounded content heuristic. The hard stop
remains D-22000.
