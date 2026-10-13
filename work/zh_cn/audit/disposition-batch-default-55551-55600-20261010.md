# Disposition Batch: `default` IDs 55551-55600

- Date: 2026-10-10. Compared all 50 active IDs with English, Japanese,
  Chinese, the preliminary scan, the source-keyed historical notes, prior
  terminology decisions, lineation, runtime markers, and name consistency.
  These working dispositions are not independent final linguistic approval.
- One accepted correction, 43 `not an issue` IDs, and 6 uncertain IDs.

## Accepted Correction

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 55590 | `우리가 알파르(Alfar)를 이끄는 건 사실이지만` | `우리 알파르(Alfar)가 앞장서는 건 사실이지만` | English `we Alfar lead` and Chinese both make the Alfar the leaders; the previous Korean instead said that the speaker's group leads the Alfar. |

## Uncertain Findings

| ID | Decision | Rationale |
| ---: | --- | --- |
| 55554 | Uncertain | The malformed English clearly requests killing Murghan and Scav creatures and returning color-changed paint vials, but the creature-name/type correspondence differs among locales. |
| 55566 | Uncertain | The verse's isolation, absent divine blessings, ignorance, and wasted potential are retained; whether `Ouranos` names a people or another entity and its Korean form remain unsettled. |
| 55578 | Uncertain | The first-week “trial by fire” joke is conveyed, but the formal status and Korean form of `Pledgeshield` remain unresolved across the project. |
| 55582 | Uncertain | The cautious introduction and mine-ownership claim are preserved; `Thelgood Skoria`'s canonical Korean name remains open. |
| 55594 | Uncertain | The four-day creation sequence, puzzle hint, and all eight localized `{*1...}` wrappers are preserved; canonical forms for the places, myth, and deities remain unsettled. |
| 55595 | Uncertain | English identifies only `St. Eadric's`, while Japanese specifies a monastery and Chinese a preaching mission; the Korean `선교원` type cannot be confirmed from the English alone. |

## Not an Issue

The remaining 43 IDs preserve the apparent English meaning and structure.
This resolves the preliminary questions at 55551 (the discreet phrasing
retains its suggestive ambiguity), 55558 (a natural exclamation consistent
with Japanese), 55560 (the brittle leaf-made doll and gem), 55570 (the
harvesting action), 55577 (the speaker's noncombat usefulness), and 55598
(retelling versus reliving tales). ID 55590 is handled separately above.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 55551-55600 once
  in identical ascending order; each default CSV contains 65,135 records.
- At ID 55594, all four locales have eight `{*1...}` marker wrappers in
  source order. English and Korean have 11 newline characters, Japanese 5,
  and Chinese 16. Korean follows English lineation; the localized marker
  payloads remain locale-specific.
- The historical note in
  `from-ja_jp/open-questions.md` incorrectly says ID 55594 retains seven
  `{*1...}` markers. Direct inspection of all four source rows confirms
  eight; the historical file is preserved unchanged.
- Pre-edit active CSV SHA-256:
  `ae2aa229677bbbbc1e95336ee2ec7e53e01ce5d25f037f1a4fdfc8ea747e37d3`.
  Byte-identical backup:
  `/private/tmp/ko-translate-backups/20261010/before-resume-55551/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit active CSV SHA-256:
  `b7f2d4e954b22835187090dafa6559abdd1de6e4dd97b99706d757b4d7733e84`.
  Only the approved `Texto` cell at ID 55590 changed. UTF-8 BOM, 65,135
  records, key order, 72,045 CRLF endings, and 39 pre-existing bare-LF
  endings are preserved.

Decisions D-16773 through D-16780. Direct register totals after this batch:
1,630 accepted, 10,921 `not an issue`, and 10,310 uncertain (22,861 total);
next D-16781.

Resume at `default` ID 55601; 9,534 IDs remain through ID 65134. The next
preliminary scan is
[`default-ids-55601-55650-preliminary.md`](default-ids-55601-55650-preliminary.md).
