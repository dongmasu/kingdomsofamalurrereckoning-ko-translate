# Translation References

Canonical, reusable reference data for the active Korean localization lives
here, separate from chronological audit evidence. Follow the game-agnostic
workflow in the repository's `TRANSLATION-ROLE.md`; adapt these datasets to
the game and language sources rather than assuming this project's groupings
apply elsewhere.

- `classification/` maps localization IDs to evidence-backed game assets.
- `duplicates/` maps exact repeated English `default` text to every current
  multilingual occurrence; identical source text does not require identical
  Korean wording.
- `glossary/` contains proper-name decisions and their source-aligned
  occurrence index. Candidate coverage is not exhaustive.
- `exceptions/` indexes approved terminology, formatting, and exact-key
  decisions and links to the durable decision register; dated review evidence
  remains under `work/zh_cn/audit/`.

Generated indexes must be reproducible from their documented inputs. Review
ledgers, dated reports, candidate decisions, and edit manifests remain in
`work/zh_cn/audit/`; do not treat those audit records as translation rules
unless a current decision explicitly adopts them.
