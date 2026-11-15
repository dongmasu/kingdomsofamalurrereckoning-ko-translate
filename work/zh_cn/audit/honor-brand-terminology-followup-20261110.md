# Honor Brand Terminology Follow-up

Date: 2026-11-10

The English source distinguishes singular `Honor Brand` from plural
`Honor Brands`: an individual weapon or component versus multiple weapons or
the named Faeblade line. Japanese `オナーブランド` uses the same name. Keep
the Korean rendering `아너 브랜드` in both forms and preserve English
singular/plural in the parenthetical source label.

Updated the five `base` component names to use the same Korean term:

| ID | Updated Korean |
| --- | --- |
| 761 | 이사 아너 브랜드 결속구(Ysa Honor Brand bindings) |
| 1630 | 이사 아너 브랜드(Ysa Honor Brand) |
| 2590 | 이사 아너 브랜드 손잡이(Ysa Honor Brand grip) |
| 3493 | 이사 아너 브랜드 지렛목(Ysa Honor Brand fulcrum) |
| 4632 | 이사 아너 브랜드 칼날(Ysa Honor Brand Blades) |

Also aligned `default:64046` to `이사 아너 브랜드(Ysa Honor Brands) 제작`.
Corrected the particle in `default:10779` from `아너 브랜드(Honor Brand)을`
to `아너 브랜드(Honor Brand)를`. Other singular and plural dialogue labels
were checked and retained.

The edit changed only those seven `Texto` cells. Both CSVs retained their BOM,
row count, and exact pre-edit CRLF/LF counts. The text-preservation helper's
11 regression tests and `git diff --check` passed.
