# Candidate Reconciliation: IDs `35750`-`35999`

- Date: 2026-11-14.
- Rechecked all 12 current `overall=candidate` IDs against English, Japanese,
  Chinese, active Korean, and earlier edit/terminology decisions.
- The supported corrections were already present except at `35959`. That row
  had drifted from the previously accepted `첫째 스케이스` to `최초의
  스케이스`; the approved form has been restored.
- The separate meaning holds at `35864` and `35663` remain open; the format
  findings at those IDs are adjudicated independently of their uncertain
  referents.

## Candidate Decisions

| ID | Decision and evidence |
| ---: | --- |
| `35784` | Confirmed the natural warning `날 화나게 하지 마`, preserving the Hierophant's blunt voice. |
| `35789` | Confirmed `샘(The Font)` and its water-flow meaning; no claim that every use of `flow` means literal water was added. |
| `35832` | Confirmed `악명 높은 해적` for the feared/notorious pirate, retaining the playful reaction. |
| `35843` | Confirmed the complete named label `교만의 시종(Knave of Pride)`. |
| `35857` | Confirmed the full rank/name `레마란 일병(Private Lemalan)` and preserved the four short epitaph statements. |
| `35864` | Confirmed `열쇠 세 개` rather than compound `삼중 열쇠`, and the complete `차람의 동굴(Charam's Grotto)` pairing. The referent of `Maun's Horde` remains held. |
| `35870` | Confirmed `살롱 마지스테리움(Salon Magisterium)` as the named venue while retaining the source's labor-auction wording. |
| `35890` | Confirmed `전승(The Telling)의 흐름과는 맞지 않아`; the line describes inconsistency with the Telling, not providence. |
| `35919` | Confirmed both names, `앰비스(Ambyth)` and `아든(Arden)`, and retained the card-game idiom. |
| `35921` | Confirmed the previously accepted neutral label `항목 VIII`, matching `Entry VIII`; do not infer a book or journal section. |
| `35957` | Confirmed the summoned Faer Gorta sends siphoned health to the player. The localized upgrade wrapper and line break are intact. |
| `35959` | Restored `첫째 스케이스(First Scaith)` under the accepted D-19835 decision. Linked English at `11102` identifies this ancestor by the appellation `First`; other unresolved First Scaith rows were not globally normalized. |

## Evidence-Limited Holds

- `35858`: `They are lost` does not resolve whether the siblings are missing
  or dead.
- `35864`: English `Maun's Horde`, Japanese treasure, and Chinese tribe
  readings conflict; keep `마운의 보물창고` provisional.
- `35871`: Japanese uses a deferential request while Korean is plain; the
  speaker and dialogue stage remain unmapped.
- `35937`: `pall` may be a coffin cover or burial shroud; retain `관 덮개`
  until the item identity is resolved.
- `35947`: preserve the eight-line poem without supplying a specific
  syntactic relation that the English does not establish.

## Duplicate And Structure Checks

- Fifty-seven exact-English duplicate groups (1,353 corpus rows) touch this
  range; Korean strings match within each full-string group. The in-range
  groups include `Lyana's Dance`, `Quest Complete`, and `Quest Failed`.
- Seven rows with embedded line breaks retain the source counts. Runtime
  token and markup signatures match across all four languages.
- The existing candidate at `35865` remains cleared, and `35937` remains a
  hold rather than a correction candidate.
- Asset associations remain grouping evidence only. No individual speaker or
  playback order was inferred.

## Verification

- Newly counted candidates: 12. Cumulative candidate reconciliation is
  2,256 / 4,015 (56.19%), with 1,759 not yet adjudicated.
- Only `default:35959` changed in the active Korean CSV; its
  `source_fingerprint` was refreshed.
- All 65,135 ledger fingerprints validate. The generated index and both
  catalogs reproduce exactly. CSV-preservation and context-index tests: 20
  passed.
- The active CSV retains its UTF-8 BOM and exact newline inventory: 71,838
  CRLF, 244 LF-only, and no bare CR. CRLF-aware `git diff --check` passes.
- No source CSV, extracted asset, or game binary was changed. No commit was
  made.

See the four-language review at
[`35750`-`35999`](dialogue-context-default-35750-35999-revalidation-20261112.md),
the prior application batch at
[`33500`-`35999`](dialogue-context-final-edits-33500-35999-20261114.json),
and the accepted
[`D-19835 correction`](named-scope-edit-addendum-D19835-20261013.md).
