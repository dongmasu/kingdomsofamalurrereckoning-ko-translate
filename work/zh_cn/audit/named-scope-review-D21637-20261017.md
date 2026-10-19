# D-21637: Syl Person And Place Homonyms

Date: 2026-10-17

## Scope

Scanned the exact English token `Syl` across all three resources and
locales. The complete English scope is 11 default keys. Japanese and
Chinese were checked as supporting pronunciation/context only.

The English context distinguishes the person at `default:24765` from
five explicit references to the Syl Hollow place. Three already
terminal D-21219 place rows were preserved, not re-reviewed or
recounted. The standalone labels at `default:43207` and `47222` do not
establish person versus place and remain unchanged. No global `Syl`
alias was added.

| Key | Person disposition | Place disposition | Change |
| --- | --- | --- | --- |
| `default:9918` | `excluded` / `accepted` | Texto edited |
| `default:17547` | `excluded` / `not-an-issue` | unchanged |
| `default:24765` | `accepted` / `excluded` | Texto edited |
| `default:30641` | `excluded` / `accepted` | Texto edited |
| `default:43207` | `uncertain` / `uncertain` | unchanged |
| `default:47222` | `uncertain` / `uncertain` | unchanged |
| `default:55176` | `excluded` / `not-an-issue` | unchanged |
| `default:59101` | `excluded` / `accepted` | Texto edited |
| `default:7509` | excluded | not-an-issue | Preserved terminal D-21219 |
| `default:14513` | excluded | accepted | Preserved terminal D-21219 |
| `default:36738` | excluded | accepted | Preserved terminal D-21219 |

## Evidence And Validation

The new `person:syl` glossary entry is limited to `default:24765`.
Existing `place:syl-hollow` keeps its canonical `Syl Hollow` spelling;
individual `Syl` matches are recorded only for the explicitly reviewed
rows. The manifest contains aligned English, Japanese, Chinese, and
previous/revised Korean values.

default: PASS 4 cells; 65135 ordered rows; masked non-target bytes + inverse equal backup; SHA-256 a6635ffc518551c3bd7c9e9dc117d3307cc4e23b5aa7837f3aa61b54a1a796f9

The full edit addendum and active hashes are in
[`named-scope-edit-addendum-D21637-20261017.md`](named-scope-edit-addendum-D21637-20261017.md).
No PAK or PAK-derived material was consulted.
