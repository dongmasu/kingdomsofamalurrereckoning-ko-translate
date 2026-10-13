# Consolidated Context Review: `Lower` and `Preordained`

- Date: 2026-10-11
- Scope: direct follow-up on uncertain `default` IDs 11571, 11720, and 14141,
  plus the repeated `Preordained` cluster at IDs 12528, 12633, 15020,
  16822-16823, 22818, 23113, 29692, 33942, 48058, 50160, 50537, 50598,
  51459, 54702, 57717, and 58256.
- Result: no disposition or translation changes. `Lower` remains uncertain
  because its UI binding was not found. The reviewed `Preordained` rows clearly
  refer to the same named group, but remain uncertain because the canonical
  Korean rendering is unresolved. No decision number was consumed and no keys
  were recounted.

## `Lower`: UI Binding Not Established

The five-file values at IDs 11571, 11720, and 14141 are respectively
`Lower`, `ロー`, Japanese-derived Korean `낮음`, Chinese `较低`, and active
Korean `낮음`. ID 6256 repeats the same values, and D-1677 accepted its
low-value reading. At ID 11720, the next key is `vs. heavily wounded
enemies`; adjacency alone does not prove the two keys form one phrase or
identify the relevant UI control.

The unpacked UI resources `1621436.ui_bxml` and `1850858.ui_bxml` are binary
data. A targeted search of the available UI resources and repository tools
found no localization-ID binding for these three strings and no BXML-to-text
inspection utility. The presence of slider/options resources is not evidence
that these particular `Lower` keys label a slider. This inspection is limited
to the resources and tools present in this workspace; it does not establish
that no such binding exists in the running game or elsewhere.

Keep IDs 11571, 11720, and 14141 uncertain. Do not infer a setting dimension,
directional command, or comparison from the isolated word; do not change the
CSV or reuse D-1677 as proof of screen context.

## `Preordained`: Group Meaning Confirmed, Korean Form Open

The English source has 130 rows containing `Preordained`. In the 16 uncertain
rows listed above, surrounding sentences describe the group patrolling
streets, imprisoning or killing enemies, persecuting Wild Fae, and pursuing
objectives. The Japanese source consistently uses `定められし者`; Chinese
consistently uses `天命者`. These contexts support a named collective/faction
reading rather than an ordinary adjective or an isolated predestination
state.

That evidence does not select a canonical Korean name. Active Korean uses
competing forms including `예정된 자들`, `예정자들`, `운명 예정자들`,
`불려온 자들`, `정해진 자들`, and `미리 정해진 자들`. Some reviewed rows
are bare labels, while others are dialogue or objectives; contextual
agreement on the referent cannot resolve the project's proper-name convention.
Keep the existing uncertain dispositions and translations unchanged. Future
term normalization should use an authoritative Korean game glossary/manual
or a corpus-wide explicit naming decision, not frequency alone.

## Verification

- The 16 listed `Preordained` IDs were matched by `ID_Linha` across English,
  Japanese, Japanese-derived Korean, Chinese, and active Korean files.
- No active Korean CSV was edited. Its SHA-256 remains
  `7c3cde61768c72e5f5517dc495ba76a4e534121b2920f4f82d9c6459f4039f21`.
- Cross-resource totals were 1,910 accepted, 22,969 `not an issue`, and
  13,643 uncertain (38,522 unique dispositions) at the time of this review.
  D-18212 was subsequently used for the separate `Beckoned` correction;
  current totals and next decision are recorded in
  `consolidated-context-review-default-beckoned-20261011.md`.

These are working contextual findings, not independent final linguistic
approval.
