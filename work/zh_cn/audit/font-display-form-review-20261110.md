# Font Display Form Review

Date: 2026-11-10

## Decision

`Font` and `The Font` refer to the same named wellspring in the Gardens of
Ysa. The article varies with English grammar and title presentation; it does
not identify a different place. Reuse the established Korean display form
`샘(The Font)` for this entity.

The Japanese rows use `イーサの泉`, and the Chinese rows use `圣泉`, supporting
the spring/source meaning. This agrees with the prior bounded `The Font`
short-label review in `named-scope-review-D21814-20261018.md`.

`샘` names the place. Korean `근원` remains appropriate as an ordinary noun,
as in default:1192, “우리가 흘러나오는 근원이지.” It was inconsistent only
when used as the paired proper-name form `근원(Font)`.

## Applied Scope

The following 23 default IDs were standardized to `샘(The Font)`:

`1192, 6020, 6072, 6987, 7792, 11183, 17812, 24349, 25126, 25383, 27137,
29017, 29173, 32839, 45462, 51753, 53176, 53537, 54119, 54760, 55022,
59269, 61164`.

At default:28565, `샘물(Font)이 자유롭게 흐르게 했다` was rephrased as
`샘(The Font)의 물줄기가 ... 자유롭게 흐르게 했다`, matching English
“the Font's flow” and Japanese `泉の流れ`. Its journal-style past-tense
register and remaining sentence structure were retained.

The ordinary plural `fonts` at default:27275 was excluded; it is not the
singular named place `The Font`. Distinct names were also left unchanged:
`Njordir's Font`, `Font of the Crossing`, and `Prismere Font`. The
`Fontmaster Nomeron` title was not treated as a place-name occurrence.

## Verification

- The 65,135-record default CSV retained its UTF-8 BOM and existing line
  ending counts: 71,846 CRLF and 244 LF-only line endings.
- The ID-targeted preservation helper regression suite passed (11 tests).
- The edited IDs, canonical labels, excluded plural at default:27275, and
  unchanged base label `이사의 샘 (The Font)` were checked with a CSV parser.
- `git -c core.whitespace=cr-at-eol diff --check -- work/zh_cn/locatexts_zh_cn.koalocatext_default.csv` passed.
- The historical D-21814 Ruby test could not complete its inventory refresh:
  Ruby's CSV parser reports `MalformedCSVError` at line 11. The same parser
  error reproduces against the committed `HEAD` CSV, so this is a pre-existing
  mixed-line-ending/parser limitation, not a regression from these edits.
