# Consolidated Context Review: `Servant`

- Date: 2026-10-11
- Scope: standalone `default` ID 65112 and related active-corpus entries
  2728, 59353, and 60638.
- Result: D-18214 reclassifies ID 65112 from uncertain to `not an issue`.
  Korean `하인` is supported by English and Japanese. No CSV cell changes.

## Evidence

ID 65112 is a standalone capitalized English label, `Servant`. The Japanese
source uses `召使`, the ordinary servant/household-attendant term, and Korean
uses `하인`. Three related English entries use the same word in compounds:
`Abergast's Servant` (2728), `Rathir Servant` (59353), and `Bendaci Servant`
(60638). Their Japanese sources use `召使い`/`召使`, including the named
association in the last entry. The related Korean entries use `하인` or
preserve `Servant` in the `Bendaci Servant` name.

Chinese translates the first two compounds as `仆人` but transliterates the
standalone and `Bendaci Servant` forms as `塞尔万特`. That inconsistency may
reflect a display/name choice, but it does not establish an English rank or
formal title. English meaning remains servant; Japanese independently
supports that sense. The capitalization of a standalone label alone is not
enough to require a title-specific Korean form. Existing `하인` is accurate
and needs no change.

## Decision and Verification

- D-18214 reclassifies only ID 65112 from uncertain to `not an issue`.
- English, Japanese source, Japanese-derived Korean draft, Chinese source,
  and active Korean were compared by `ID_Linha`; related entries were
  checked by the same key across source locales.
- No runtime marker, value, or line-break change was made.
- Active default CSV SHA-256 before and after review:
  `4ea2a72df4b226d555ad672473b0417754b847dcd699a77f80a5c90b6b0a94da`.
- No backup was needed because no file contents changed.
- Cross-resource totals through D-18214: 1,917 accepted, 22,971
  `not an issue`, and 13,634 uncertain (38,522 unique dispositions);
  next decision: D-18215.

These are working dispositions, not independent final linguistic approval.
