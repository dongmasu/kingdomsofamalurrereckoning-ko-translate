# Proper-Name Source/Index Validation Through D-21296

Date: 2026-10-17

The existing English-led matcher was rerun against the refreshed 73,430-row
aligned inventory and current 1,255-entry glossary. It generated 37,190
entity/row source matches. The active occurrence index contains 37,679
entries: zero generated source matches are missing, and 489 indexed-only
contextual matches remain. All 489 match an exact reviewed manifest event
whose entity, row key, terminal status, and evidence agree with the active
index. The four latest evidence-only clarifications are documented in the
D-21243 and D-21247 site-scope TSVs.

The terminal bilingual-label check found zero uncovered name labels. The
single documented Crudok idiom at `default:3851` is intentionally not a
bilingual species label. Existing exact row-scoped name forms were validated
against their reviewed `matched_english` terms and active parenthetical
labels; this did not create aliases or reopen prior identities.

Validation results:

```text
PASS 1255 unique entities; 37679 unique active-aligned occurrences
{"accepted"=>25091, "excluded"=>2329, "not-an-issue"=>10230, "uncertain"=>29}
Source/index key differences: missing=0, documented exclusions=0,
  contextual extras=489, undocumented extras=0
Source/occurrence comparison: 37190 source matches, 37679 indexed matches,
  73430 CSV rows
Terminal matches without a covering bilingual English label: 0
Documented idiomatic non-labels: 1
```

`audit-proper-name-residual-final.rb` now verifies indexed-only extras against
their exact terminal manifest evidence, including the scoped D-21243 and
D-21247 clarifications. It does not treat an unreviewed or status-mismatched
extra as documented.

Active CSV SHA-256 values are unchanged: affix
`a4cca50e29718ffb0f1ad9ba75e4df8a24eff9cf5097f56f05484c52f5c63586`, base
`70de5056bb0e7929b8ea24e4020965fb6f349198820d56b4b2a85984237dfa85`, and
default
`7899c7bb61befd08e18a022368fad761a44a2cce0a832acdd3f968f954fcbc4e`.

This reconciles the current registered glossary scope, not all proper names
in the game. The 305-term machine-generated candidate list is non-exhaustive;
overall discovery and consistency work remain incomplete.
