# D-21880: Two-Character Singleton Outlier Screen

Date: 2026-10-20

## Scope

Screened accepted indexed name annotations for singleton final Korean
Hangul tokens exactly two edit-distance characters from a form repeated at
least five times under the same English label. The prior one-character
candidate set was not rerun. Two candidates met this additional threshold.

## Findings

- `organization:praetorians`, `Praetorians`: `근위대원(Praetorians)` at
  `default:1553` differs from the more common `근위병` form, but the English
  describes Praetorians as members of one of three gnomish societal pillars.
  Japanese `兵士` and Chinese `禁卫军` support the member/unit reading.
  This is a contextual role noun, not a competing name spelling.
- `family:zungar`, `Zungar`: `중가르(Zungar)` at `default:38373` differs
  from the repeated `중가르 가문(Zungar)` forms because this sentence
  specifically refers to the Zungar name/surname. English says “The Zungar
  name,” Japanese `ズンガーの名前`, and Chinese `尊加尔这个姓氏`; Korean
  `중가르라는 이름` preserves that distinction. No family suffix should
  be inserted here.

Neither candidate is a content error. No source change is warranted.

## Outcome

No CSV, glossary, occurrence-index, or release-artifact change. No full
format validation or residual audit was run; only these two exact source
rows were reviewed.
