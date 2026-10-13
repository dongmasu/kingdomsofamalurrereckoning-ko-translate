# Disposition and Edit Batch: `default` IDs 10550-10599

- Decision date: 2026-10-09.
- Scope: fifteen direct preliminary findings and the carried historical
  question at ID 10563.
- Compared English for meaning, Japanese for voice/register and structure,
  Chinese as supporting evidence, active Korean, recurring corpus terms, and
  the archived historical question.
- Sixteen findings received dispositions: two accepted, five `not an issue`,
  and nine uncertain.
- Two supported corrections were applied only to the active Korean `Texto`
  cells. These are working dispositions, not independent final approval.

## Decisions

- ID 10550 remains uncertain: `Votive of Water` may identify an offering,
  votive object, or equipment.
- ID 10552 is accepted: add `(Cape Solace)` to the Korean `솔라스 곶` because
  English `Soalce` is an apparent source typo and recurring rows identify the
  location as Cape Solace.
- ID 10555 is accepted: replace `세 몫` with `세 꾸러미`; English `parcels`,
  Japanese `3箱`, and Chinese `三包` support packages/containers, not shares.
  The Plagueshield term itself remains unchanged.
- ID 10556 is `not an issue`: Korean preserves that the work will not prevent
  the speaker from going there while leaving the destination unspecified.
- ID 10559 remains uncertain: the category meant by `Fae Cairns` is unknown.
- ID 10561 is `not an issue`: urgency, two-person completion, northern
  meeting point, and caution are preserved; name spellings remain terminology
  questions.
- ID 10563 is `not an issue`: Korean follows English on the Kobolds, their
  lair, and the mountain path opened for future caravans.
- ID 10565 is `not an issue`: both tutorial sections and all seven control
  markers retain their order and meaning.
- ID 10572 remains uncertain: `Adopt the Rite` does not establish whether to
  accept, perform, or formally undertake the rite.
- ID 10578 remains uncertain: task/rite names and canonical place forms need
  lore and terminology review.
- ID 10580 remains uncertain: the capitalized `Hollow` may be a named place
  or a generic hollow.
- ID 10589 is `not an issue`: Korean naturally avoids reproducing the source's
  feminine-coded `confidante` followed by masculine pronouns.
- ID 10593 remains uncertain: all seven embedded line breaks are preserved,
  but the source anomalies and lore names need contextual review.
- ID 10595 remains uncertain: `the Sorrows` has no established referent in
  this line alone.
- ID 10597 remains uncertain: English `Even` and the Japanese/Chinese
  readings do not establish the result/UI context.
- ID 10598 remains uncertain: the Korean phonetic form cannot be confirmed
  from this isolated name.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 10552 | `...솔라스 곶으로 알려진 해변...` | `...솔라스 곶(Cape Solace)으로 알려진 해변...` | D-3031: retain the Korean form and identify the canonical place name despite the apparent English source typo. |
| 10555 | `역병 방패를 세 몫 더 만들어` | `역병 방패를 세 꾸러미 더 만들어` | D-3032: render the supported package/container unit without resolving the item name. |

## Verification

- All four locale CSVs have 65,135 sequential default IDs in the same order.
- IDs 10550-10599 have matching normalized runtime-marker sequences and
  embedded line-break counts across English, Japanese, Chinese, and active
  Korean. ID 10593 retains seven embedded line breaks; ID 10565 retains all
  seven control markers in order.
- The active Korean CSV retains its UTF-8 BOM, 65,135 records, and CRLF
  record endings, with no bare LF or CR bytes.
- Only the approved Korean `Texto` cells at IDs 10552 and 10555 were changed
  in this batch.
- Active Korean `default` CSV SHA-256:
  `b52617ea34e5d85c5affcdf35da587ae54cf3031aa43acfbd96a186bd73e4bfa`.
- The prior handoff said 464 accepted, 932 `not an issue`, and 1,633
  uncertain through ID 10549. Direct counting of immutable register rows
  D-0001-D-3029 instead yields 464 accepted, 931 `not an issue`, and 1,634
  uncertain. This one-item discrepancy is preserved as a reconciliation
  note; no prior disposition was rewritten.
- Before this batch, the register contained 464 accepted, 931 `not an issue`,
  and 1,634 uncertain findings. After this batch, it contains 466 accepted,
  936 `not an issue`, and 1,643 uncertain findings.
- Direct findings and the carried historical question through ID 10599 now
  have dispositions. Resume at ID 10600; 54,535 `default` rows remain.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
