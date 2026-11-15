# Reusable Translation Workflow

## Purpose and Scope

This guide defines a reusable workflow for translating and reviewing
game-localization content. Adapt it to each game's sources, text types, file
formats, and release process; do not assume that one game's language hierarchy
or grouping scheme applies to another.

Before starting, read the repository's project instructions for the approved
translation scope, source locations, editable files, preservation rules, and
validation tools. Those instructions provide project-specific facts; this
guide provides the translation method and role boundaries.

The goal is to catch meaning, terminology, voice, naturalness, and structural
issues during planned passes, then limit later re-review to material affected
by a change. Completing a row-count sweep alone does not establish translation
quality.

## 1. Set Up the Project

Record a concise project profile before translating:

- Source and target languages, locales, and the resources in scope.
- Which source is authoritative for meaning, voice/register, established
  terminology, and world or product context. These roles may belong to
  different sources.
- How to resolve source conflicts, what evidence is acceptable, and when to
  leave a decision unresolved.
- The localization unit and its stable key, including any variants or
  relationships between files.
- Text types and any useful context dimensions, such as menu, quest, chapter,
  character, scene, item, or gameplay system.
- Required glossary, decision/exception register, review ledger, and output
  locations.
- File-format invariants, approved editing tools, and structural, runtime, or
  release checks.

Do not invent missing project settings. Record unknowns and resolve material
scope or authority questions before relying on them.

### Maintain the Project Translation References

Use the canonical translation-reference location named by the project
instructions as the shared, current working reference for every translation
and review pass. Keep it up to date as work proceeds; do not defer reference
maintenance until the end of translation or review.

Update the relevant records when evidence or decisions change: content
grouping and context links, repeated-source occurrences, glossary entries,
terminology, and approved exceptions or unresolved decisions. Apply a
reference decision and its approved translation edit together in the same
work unit when possible, so later passes do not rely on stale guidance.
Preserve scope, status, evidence, and supersession links; do not turn a
key-specific decision into a global rule.

Use only the reference categories that help the project. Rebuild generated
indexes with their documented generators and verify them against their
inputs. Keep dated review findings, batch reports, and chronological edit
history in the project's audit location, linking them from the maintained
reference when they justify a current decision.

## 2. Inventory and Group the Content

Before substantial translation, inspect the available game-resource corpus,
not only the localization table. Inventory useful filename patterns,
extensions, stable asset IDs, and locale variants. Identify resource families
that may contain text or provide context, then validate candidate links using
stable keys, parsed fields, or other independently checked evidence where
possible. Treat matching stems, nearby files, and raw string hits as
candidates rather than semantic proof; record searched-but-not-found results
and unresolved format limits as well.

Put confirmed, reusable resource structure and context mappings in the
project's canonical `translation-reference`. Keep dated reconnaissance,
temporary candidates, and detailed investigation history in the audit
location. Do not modify extracted source assets to store analysis output. The
depth and methods should fit the game; if no useful resource corpus is
available, record that limitation instead of inferring missing relationships.

Build a complete inventory of source and target units using stable IDs or
equivalent keys. Validate missing, duplicate, and unmatched units before
translation begins.

Classify content by text function when that classification affects translation
or review. Use only grouping dimensions supported by the game data. A project
may group by quest, character, chapter, scene, UI system, item family, or
another useful relation; it may also need no contextual grouping for some
resources.

Keep the mapping from each translation unit to its groups explicit and
traceable. Record the evidence and confidence for contextual links. A shared
file, nearby row, matching name, or serialized order is not by itself proof of
speaker, scene, sequence, or relationship.

Plan quality checks by text type and risk. Dialogue, UI labels, objectives,
narrative, and item descriptions can require different checks. Do not postpone
a known quality dimension until after a supposedly final full-corpus review.

## 3. Track Repeated Source Text

Detect exact repeated source strings and create a source-to-target occurrence
map. Preserve the source key, resource, variants, formatting or markup, and
current target for every occurrence. Do not merge distinct records.

Treat a repeated-source group as a consistency and impact-tracking mechanism,
not an instruction to force identical translations. For each group, determine
whether meaning, text function, context, register, and target-language grammar
support shared wording. Record explicit per-unit differences when they are
justified.

When a shared translation or rule changes, identify all linked occurrences
and review the affected group. Never propagate changes by blind global
replacement. A repeated English string may have different senses or
translations in context.

## 4. Maintain a Glossary

Create a project glossary before substantial translation and update it as
decisions are made. Include relevant proper names and game-specific
terminology, such as people, places, factions, characters, skills, abilities,
items, mechanics, titles, and recurring interface terms.

Each entry should record, as applicable:

- A stable term or entity key, canonical source form, category, and aliases.
- The approved target form and usage, including grammatical or display
  conventions.
- Scope and exclusions, especially homonyms, compounds, and ordinary uses of
  the same word.
- Evidence and linked source/target IDs or occurrences.
- Status such as approved, provisional, unresolved, or not applicable.
- Decision history, including what a new decision supersedes.

Use the glossary to guide and check translation, not as evidence that every
matching word has the same sense. Apply terminology by meaning and context;
review affected occurrences before standardizing them.

## 5. Record Exceptions and Decisions

Maintain a searchable decision and exception register from the start of work.
Record source conflicts, ambiguity, unsupported context, variant-specific
wording, formatting differences, deliberate non-unification, and any
exception to a general rule.

For each decision, record the affected key or group, relevant source and
target text, decision and rationale, evidence, confidence, status, date or
revision, and any decision it supersedes. Link it to the glossary or
occurrence map when applicable.

Do not silently guess. Keep uncertain cases visible and unresolved. A
subsequent reviewer should be able to tell what was decided, why, where it
applies, and whether it is still current.

## 6. Translate and Review in Bounded Units

Work in coherent, recorded batches. For each unit, the translator should:

- Follow the project's source-authority profile and glossary.
- Preserve the intended meaning without unsupported additions or omissions.
- Write naturally for the target language and the unit's text function.
- Apply appropriate voice, register, audience, and terminology where evidence
  supports them.
- Preserve required variables, markup, formatting, and intentional layout.
- Record uncertainty and new terminology or exceptions as they arise.

Review each completed batch against an explicit checklist before marking it
reviewed. At minimum, assess semantic fidelity, omissions/additions, target
language fluency, terminology, text-type conventions, and formatting. Add
voice, character, contextual, length, or runtime checks when the resource
requires them.

Track status at the smallest useful stable unit and, where needed, separately
for each quality dimension. Candidate findings are not confirmed defects;
record a disposition such as corrected, retained, or unresolved with its
rationale. Do not count unresolved findings as resolved merely because all
units were visited.

## 7. Freeze Inputs and Revalidate by Impact

At the start of a review batch, record the exact source and target snapshot or
fingerprints, scope, grouping/glossary versions, and review criteria. Resume
only when those inputs still match; otherwise identify the changed units
before reusing prior results.

When a source, translation, glossary entry, grouping, or global rule changes:

- Identify affected units, linked duplicate-source occurrences, glossary
  occurrences, and context groups.
- Re-run only the relevant review dimensions for those units and groups.
- Preserve earlier decisions that remain supported; explicitly supersede
  decisions that no longer apply.
- Update review status and fingerprints so the validated state is
  reproducible.

Do not repeat a full linguistic review by default. A full pass is warranted
when the source or target baseline changes broadly, a global rule changes
across the corpus, prior coverage cannot be trusted, or a known systematic
defect requires corpus-wide verification. Even then, distinguish full
coverage from resolved findings and use recorded decisions rather than
discarding prior evidence.

## 8. Separate Roles

The same person or system may perform multiple roles, but each pass has
distinct permissions and outputs. A translator must not treat their own draft
as independently reviewed.

### Translator

Drafts assigned units, follows source and glossary rules, preserves format,
and records uncertainty. Does not approve their own work as an independent
review.

### Reviewer

Performs a read-only, source-grounded assessment of assigned units and linked
groups. Records the exact keys, evidence, proposed correction, rationale,
confidence, and disposition. Does not edit the source or target files.

### Adjudicator

Resolves disagreements against the declared evidence hierarchy. Accepts only
supported corrections; leaves insufficiently supported cases unresolved.
Records decisions and scope before edits are applied.

### Editor

Applies only accepted, scoped changes using the project's approved editing
method. Address records by stable key and variant where applicable, verify the
expected current text, and stop on missing, ambiguous, or stale targets.
Change only approved text fields; preserve keys, variants, record count, order,
and format. Do not broaden the change, reserialize structured files when that
could alter unrelated data, or perform unreviewed global replacements.

### Verifier

Independently checks the editor's diff against approved decisions, source
meaning, glossary, affected duplicate/context groups, and format invariants.

### Builder or Integrator

Uses verified inputs for conversion, packaging, or integration. Does not make
translation edits and runs only the checks authorized by the project.

## 9. Validate and Close Work

Scale validation to the change while preserving independent gates:

- **Translation quality:** planned review dimensions have recorded coverage;
  exceptions and unresolved items are visible.
- **Consistency:** changed glossary terms, duplicate-source groups, and
  context-linked units have been checked for impact.
- **Structure:** keys, variants, counts, order, encoding, tokens, markup, and
  line breaks satisfy the project's format profile.
- **Integration:** conversion, runtime, display, or release checks are run
  when required and authorized; report exactly what was and was not tested.

Passing structural checks does not establish translation quality. Passing
linguistic review does not establish runtime compatibility.

For each completed batch, report its exact scope and snapshot, decisions and
edits, checks performed, unresolved items, and any work explicitly left out.
Do not claim exhaustive discovery, complete context, or release readiness
without evidence for that claim.

## Workflow Summary

1. Establish the project profile, evidence hierarchy, scope, and invariants.
2. Inspect available game resources; inventory and classify localization
   units, adding only useful, evidence-backed groupings.
3. Locate the canonical translation references; map repeated source strings,
   initialize the glossary and decision register, and maintain the relevant
   references as work proceeds.
4. Freeze inputs and translate in bounded units, reviewing all relevant
   quality dimensions as part of the planned workflow.
5. Adjudicate findings, apply accepted changes, and verify the scoped diff.
6. Revalidate affected units and linked groups after changes; expand to a full
   pass only when a documented trigger requires it.
7. Report coverage, validation, unresolved issues, and the exact snapshot.
