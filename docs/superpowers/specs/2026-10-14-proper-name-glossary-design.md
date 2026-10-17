# Proper-Name Glossary and Consistency Pass

Date: 2026-10-14
Status: Approved for implementation planning (2026-10-14)

## Goal

Build a reusable, evidence-based glossary of named entities and use it to
standardize their Korean renderings across the active `affix`, `base`, and
`default` CSVs. The glossary covers people, places, factions, peoples and
species, deities, monsters, skills, and unique named items. Every confirmed
entity mention should use the standard `한글(English)` form, while preserving
the surrounding Korean grammar and the source's intended meaning.

## Source and Classification Rules

- English rows in `src/csv/en_us/` are the primary index and semantic
  authority. Candidate collection and occurrence mapping start from English
  source rows and their resource IDs, not Korean substring matches.
- Japanese rows in `src/csv/ja_jp/` help establish pronunciation, voice, and
  register. Chinese rows in `src/csv/zh_cn/` provide supporting corroboration.
- The official Korean manual takes precedence for established Korean terms
  when it covers an entity or concept. Other contextual sources are
  corroborative, not substitutes for English-source evidence.
- A matching English token is only a candidate. Review its sentence, title,
  item, quest, dialogue, and cross-row context to classify it. Record ordinary
  words, false positives, unresolved cases, and distinct homonyms so they
  cannot be accidentally normalized as names.
- Do not infer a person's, place's, or creature's identity from capitalization
  alone. When evidence is insufficient or sources materially conflict, retain
  the current text and record the entry as unresolved rather than guessing.

## Glossary and Occurrence Data

Create a tab-separated glossary under `work/zh_cn/audit/`. Each entity record
will contain:

| Field | Purpose |
| --- | --- |
| Entity key | Stable internal key distinguishing homonyms |
| English canonical name | English spelling used to discover and identify the entity |
| Category | Person, place, faction, people/species, deity, monster, skill, or unique item |
| Korean canonical form | Standard bilingual `한글(English)` form |
| English aliases | Confirmed alternate source spellings or titles |
| Korean variants | Existing forms to normalize, not standalone evidence of identity |
| Evidence | Resource and ID references plus concise rationale and cross-locale support |
| Status | Confirmed, unresolved, or explicitly not a named-entity match |

Keep row-level occurrences linked to the entity using resource type, ID, and
variant where the resource has a `Tipo_Variante` column (`base` and
`affix`); `default` occurrences are keyed by resource and ID. This is
necessary because the same English spelling may be a name in one row and an
ordinary word in another. Include relevant source text and disposition in the
audit inventory so each proposed edit is reviewable.

The glossary is the reusable terminology authority; the occurrence inventory
is the auditable map of where each entry applies. Do not use a global
replacement over Korean text as the source of truth or as the sole edit
mechanism.

## Review and Application Workflow

1. Enumerate English source records for all three resource types and discover
   candidate named entities by source text, including standalone labels and
   names embedded in phrases.
2. Group candidates by entity, then inspect aligned English, Korean, Japanese,
   and Chinese rows as applicable. Use cross-row dialogue, titles, roles, and
   item/quest context to distinguish homonyms and confirm classification.
3. Record the canonical bilingual form, observed variants, evidence, and
   every applicable active Korean occurrence. Keep uncertain candidates
   explicit and unmodified.
4. Apply only reviewed, ID/variant-scoped `Texto` changes. Standardize all
   confirmed occurrences in `affix`, `base`, and `default`, including names
   embedded in longer text, without disturbing particles, honorifics,
   punctuation, game tokens, markup, or intentional line breaks.
5. Independently compare the resulting rows against the English-source
   occurrence inventory and search for unresolved Korean spelling variants.
   A pass is complete only when every discovered candidate has a recorded
   disposition; unresolved candidates must be reported, not silently omitted.

Do not reopen or recount historical sequential review dispositions or global
totals. This is a focused terminology consistency pass with its own audit
records.

## Safe CSV Editing and Verification

Before modifying each active CSV, create and record a byte-identical backup
under `/private/tmp/ko-translate-backups/`. Edit only files under
`work/zh_cn/` and project documentation such as the root `README.md`;
`src/csv/` remains read-only. Do not inspect PAK files or PAK-derived files.

For every changed CSV, verify:

- UTF-8 BOM and existing line-ending sequence are preserved.
- Headers, delimiter, record count, row order, IDs, variants, and duplicate
  rows are unchanged.
- Only reviewed target `Texto` cells changed; all other bytes are preserved.
- Reversing the recorded edits reproduces the pre-edit file byte-for-byte.
- Final SHA-256 and the pre-edit backup path are recorded in the audit report.

## README Documentation

Update the Korean and English README translation-principles sections to
explain that proper-name consistency is maintained through an evidence-based
glossary covering all listed entity categories. Describe the English-first
candidate discovery, Japanese/Chinese supporting checks, bilingual
`한글(English)` standard, context-based disambiguation, and that the working
glossary and detailed audit inventory live under `work/zh_cn/audit/`.
Avoid claiming that every entry is confirmed if unresolved cases remain.

## Completion Criteria

- All English-source candidate groups across `affix`, `base`, and `default`
  have an explicit disposition in the glossary/audit inventory.
- Confirmed entities use their standard bilingual form in all verified active
  Korean occurrences, including multiword contexts.
- Homonyms, ordinary-word false positives, and unresolved cases are
  distinguished and documented; no blind global replacement is used.
- CSV integrity and byte-preservation checks pass for each modified resource.
- README guidance accurately describes the glossary process and remaining
  uncertainty.
- No completion claim is made while candidate groups remain unreviewed.

## Out of Scope

- Changing immutable source CSVs, locale keys, resource structure, or sidecar
  binaries.
- Recalculating historical review totals or reopening completed row
  dispositions.
- Building or publishing a patch, inspecting PAK data, or making claims about
  in-game behavior.
- Forcing a bilingual form in places where the English source itself does not
  identify the entity or where doing so would break a game token or
  grammatical construction; such cases require a documented, reviewed
  exception rather than an untracked omission.
