# Translation References

Canonical, reusable reference data for the active Korean localization lives
here, separate from chronological audit evidence. Follow the game-agnostic
workflow in the repository's `TRANSLATION-ROLE.md`; adapt these datasets to
the game and language sources rather than assuming this project's groupings
apply elsewhere.

Maintain this directory as the current shared reference throughout
translation, review, and approved edits. Update relevant classifications,
duplicate-source groups, glossary entries, and exceptions when new evidence
or decisions arise or supersede earlier ones; do not wait until a full pass is
finished. Preserve each decision's scope, status, and evidence links. Not
every project needs every category.

- `classification/` maps localization IDs to evidence-backed game assets and
  maintains the reusable [resource corpus map](classification/resource-corpus-map.md).
- `duplicates/` maps exact repeated English `default` text to every current
  multilingual occurrence; identical source text does not require identical
  Korean wording.
- `glossary/` contains proper-name decisions and their source-aligned
  occurrence index. Candidate coverage is not exhaustive.
- `exceptions/` indexes approved terminology, formatting, and exact-key
  decisions and links to the durable decision register; dated review evidence
  remains under `work/zh_cn/audit/`.

The classification map also records confirmed localization-binary fields and
the evidence limits for `Tipo_Variante` and `default` brace markup. Their
observed structure is distinct from unverified runtime meaning; see the
[binary and markup audit](../audit/default-markup-and-variant-evidence-20261115.md).

The completed [Lua corpus review](../audit/lua-corpus-translation-review-20261115.md)
found no direct localization-key or supported static display links. A matching
Lua literal remains a candidate, not proof that a localization row is used or
that its Korean translation is wrong.

Generated indexes must be reproducible from their documented inputs. Review
ledgers, dated reports, candidate decisions, and edit manifests remain in
`work/zh_cn/audit/`; do not treat those audit records as translation rules
unless a current decision explicitly adopts them. When a dated audit finding
supports a current reference decision, link the evidence here while keeping
the full chronological record in `audit/`.
