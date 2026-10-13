# Disposition and Edit Batch: `default` IDs 9200-9249

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and carried historical questions for
  `default` IDs 9200-9249.
- English governs meaning, Japanese informs voice/register and source
  structure, and Chinese is supporting evidence. Historical audit notes and
  active-corpus usage were also checked.
- Twelve findings received dispositions: two accepted, five `not an issue`,
  and five uncertain.
- This remains an in-progress disposition pass, not independent final
  linguistic approval.

## Decisions

- ID 9204 is `not an issue`: the request for a quick, painless end and the
  reason for it are preserved without making the unstated situation explicit.
- ID 9205 is `not an issue`: the Korean distinguishes the rebuilt body from
  the restored, unharmed spirit and preserves the safe-place detail.
- ID 9207 is accepted: replace `질문은 받지 않아` with
  `아무것도 묻지 않아`. English, Japanese, and Chinese mean the seller asks
  no questions during transactions; the previous Korean could instead mean
  that the speaker refuses to receive questions.
- ID 9210 is `not an issue`: the runtime icon token and the instruction that
  missing a glyph reseals all glyphs are preserved.
- ID 9212 is `not an issue`: the journal retains both successful theft
  objectives and the failed attempt to reunite Irion with his estranged wife.
- ID 9219 remains uncertain: `Hall of Appointments` is capitalized as a
  location, but its identity and canonical Korean place-name are unsettled.
- ID 9225 is `not an issue`: the plural referent remains unspecified, as in
  English, Japanese, and Chinese; no unsupported object category is added.
- ID 9228 remains uncertain: the Korean poem preserves twelve lines and the
  gruesome imagery, but the source's rhetorical question about witnessing
  the loss is rendered as a dependent statement. A literary revision needs
  stanza-level review rather than an isolated line change.
- ID 9230 remains uncertain: `Warden's Bridge` is a named location, but its
  established Korean spelling and display convention are unresolved.
- ID 9232 remains uncertain: `Trigger Leanashe` may be an internal event
  label or player-facing text; whether it should be localized is unknown.
- ID 9234 is accepted: replace `대가를 치르게 될` with
  `그 거래가 이제 곧 결실을 맺을 거야`. Chinese reads the bargain as
  nearing success, and the English idiom `pay off` supports a result-bearing
  transaction here; Japanese preserves an alternative “pay the price”
  reading. The correction keeps the impending consequence and Tirnoch's
  wrath without asserting that someone will pay a penalty.
- ID 9244 remains uncertain: the investigation sequence is preserved, but
  the canonical Korean forms for the artifact, locations, faction, person,
  and rank require terminology reconciliation.

## Applied Edits

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 9207 | `...질문은 받지 않아.` | `...아무것도 묻지 않아.` | D-2567: restore the seller-as-asker meaning. |
| 9234 | `...이제 곧 대가를 치르게 될 거야.` | `...그 거래가 이제 곧 결실을 맺을 거야.` | D-2575: express the bargain's impending result without adding a penalty. |

Both accepted texts were already present in the active CSV when this
interrupted checkpoint was reconciled; their source alignment and exact text
were verified. The two affected record endings were normalized to CRLF.

## Verification

- The preliminary report covers all 50 IDs. Candidate lines were compared
  across English, Japanese, Chinese, and active Korean, with historical
  questions rechecked.
- ID 9210 retains `#NAMED_ICON_360_B#`. ID 9228 retains all twelve poem
  lines and eleven embedded line breaks in the active Korean record.
- The active CSV parses as 65,135 records with IDs 0-65134 in order,
  matching the immutable English and Chinese keys. Its non-text fields,
  UTF-8 BOM, and CRLF record endings are preserved.
- Active Korean `default` CSV SHA-256:
  `da9b2348b57283ea35f426adcb3e748eb01c3571b5b3ccf42ffcb79371c7a197`.
- Before this batch: 406 accepted, 815 `not an issue`, and 1,343 uncertain.
  After this batch: 408 accepted, 820 `not an issue`, and 1,348 uncertain.
- Resume at ID 9250; 55,885 `default` rows remain.

Findings remain working dispositions, not independent linguistic approval.
Corpus-wide terminology and integrated voice review remain open.
