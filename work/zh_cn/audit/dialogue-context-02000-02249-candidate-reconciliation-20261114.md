# Candidate Reconciliation: IDs `2000`-`2249`

- Date: 2026-11-14.
- Rechecked all 12 current `overall=candidate` ledger IDs in this interval
  against English, Japanese, Chinese, the active Korean CSV, and linked
  evidence reports.
- Six candidates received source-supported corrections; six were retained
  because their current translation already reflected the evidence.
- One related parallel line, `23635`, was also aligned with `2064`.
- No speaker or playback order was inferred from asset association.

## Applied Decisions

At `2033`, the quest-journal entry was changed from conversational speech to
neutral journal narration, following English and Japanese. The established
`관리관` wording was preserved; the separate Warden-title inconsistency
remains unresolved.

At `2064`, the ceremonial introduction was kept dramatic but changed from
marked `-오/-소` speech to the plain commands supported by English and
Japanese. The parallel Kells Cafferty greeting at `23635` received the same
opening while retaining its distinct response.

At `2079`, `머건(Murghan)족` was corrected to `머건(Murghan)들`; the source
refers to Murghan creatures, not a tribe. The established `대전당` wording
was retained.

At `2211`, Japanese `監獄` and Chinese `牢笼` confirm a prison cage; the
ambiguous `우리` was replaced with `철창`.

At `2220`, the report of repeated protection was recast as natural plain
speech without changing the speaker's relief or meaning.

At `2224`, the sea's personified, heaving breast was restored in natural
Korean, the incorrect `가슴를` particle was fixed, and the original paragraph
breaks were preserved.

## Retained

IDs `2005`, `2018`, `2030`, `2121`, `2163`, and `2202` already reflected the
source or established terminology. In particular, `fate's weave` at `2005`
is a metaphor rather than the named practice `Fateweaving`; `Fateweaver` at
`2030` already uses the established `페이트위버(Fateweaver)` form; `2163`
matches its exact-English duplicate at `473`; and the poem at `2202` already
includes the full title `The Maid of Windemere`.

The separate evidence-limited holds at `2024` and `2116` remain unresolved
and were not treated as candidates in this batch.

## Verification

- All 12 candidates in this interval have a decision in the
  machine-readable
  [`decision manifest`](dialogue-context-final-edits-followup-02000-02249-20261114.json).
- Seven changed IDs (six in-range and related ID `23635`) were edited with
  `tools/replace_text_preserve_eol.py`; only their ledger
  `source_fingerprint` fields were refreshed.
- Candidate reconciliation now covers 126 of 4,015 current candidates
  (3.14%). This is not full candidate-review completion.
- No commit was made.
