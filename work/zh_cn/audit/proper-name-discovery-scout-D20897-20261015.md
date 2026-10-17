# D-20897: Proper-Name Discovery Scout Triage

Date: 2026-10-15

## Scope

The D-20896 indexed occurrence queue has zero `needs-context` rows. Its
18 existing `uncertain` matches remain closed holds and were not reopened.
The recorded first held key, `faction:travelers / default:19474`, has no new
evidence; it remains unchanged.

D-20897 triaged the first 50 rows of the English-anchored unregistered-name
scout at `/private/tmp/unregistered-person-name-candidates-20261015.tsv`.
The scout is heuristic, not a list of confirmed entities. Its 50 candidates
cover different numbers of distinct source rows; these are candidate-source
counts, not reviewed occurrence dispositions.

- 19 candidates were classified as ordinary words or non-entity standalone spans.
- 7 candidates were classified as components of existing complete names; no global aliases were added.
- 1 candidate, `Tala-Rane`, is already present as `place:tala-rane` and was not recounted.
- 23 candidates need focused identity/category review before glossary registration.

The per-candidate evidence and next action are in
[`proper-name-discovery-scout-D20897.tsv`](proper-name-discovery-scout-D20897.tsv).
Notable follow-up cases include the Tuatha people/faction distinction, Alfar
as a broader people group, Amalur and Erathell geographic scope, Akara and
Naros deity/place homonyms, the Telling tradition, and personal-name
homonyms. These remain candidates, not confirmed glossary additions.

## Integrity and Next Step

No glossary, occurrence-index, active CSV, or source CSV was changed. No CSV
backup was required. Active hashes remain affix
`a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586`, base
`2cbf0bd3aa648ca8af62e3a26aa3cf98f43d43dc74bd530798354842e3346cb5`, and
default
`9b1c1b940f08151bb0d5851a9537d9a71d19b1673fcefb91cafd8342a6f12e87`.

The source inventory remains 73,430 rows with SHA-256
`00900afb7c3d62d4336103388710e638aa94c41e4280439be09a3a8078186e69`.
The scout snapshot SHA-256 is
`ba66362e3df6eeb22916eee596fc6e97c7c42ecf1f8ea23ccc250c8bd8a06891`.
The 29,569-key lexical candidate detector remains heuristic and is not a
verified backlog size. Discovery and residual review are incomplete.

Next: D-20898, review the 23 follow-up candidate groups in rank order, starting
with `Tuatha`. Resolve source identity and category before adding glossary
entries; then enumerate exact source occurrences in 50-row batches. Do not
reopen existing terminal or uncertain keys without new evidence.
