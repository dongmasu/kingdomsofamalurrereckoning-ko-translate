# D-21895: Four Standalone Personal Names

Date: 2026-10-20

## Findings

| Key | English | Japanese | Chinese | Current Korean |
| --- | --- | --- | --- | --- |
| default:1871 | Marisal Cadyr | マリサル・サディア | 玛丽莎尔·凯德尔 | 마리살 카디르(Marisal Cadyr) |
| default:2046 | Huell Hofwe | フエッル・ホフェ | 修尔·霍夫维 | 휴엘 호프위(Huell Hofwe) |
| default:2076 | Deidra Carlson | デイドラ・カールソン | 戴德拉·卡尔森 | 데이드라 칼슨(Deidra Carlson) |
| default:2190 | Honnas Kulder | ハナス・カルダー | 霍恩纳斯·库尔德尔 | 호나스 쿨더(Honnas Kulder) |

All three English source resources were searched for Marisal/Cadyr and
the distinctive components Keozai, Huell/Hofwe, Deidra/Carlson, and Honnas.
The four complete labels occur only at the keys above.

- Marisal: `default:29858` pairs Cyf and Marisal, and `default:30141`
  preserves the short name. Both Korean forms use `마리살`. D-21605
  explicitly established `카디르` for Cyf Cadyr at `default:8371` and
  `default:42847`; its discovery manifest does not include Marisal.
  Japanese alone uses `サディア` in Marisal's full label, whereas English
  and Chinese preserve the Cadyr identity. The current Korean is defensible.
  The separately confirmed `드레이드 케이더(Dreid Cadyr)` and source-only
  `Cadyr` label at `default:22773` do not establish a global pronunciation
  rule; do not normalize every Cadyr or infer family relationships.
- Huell: Korean uses the same `휴엘` component in `default:10584`
  (`Defeat Huell and his men`) and `default:27781` (`Search for Huell's
  Lair`). Japanese and Chinese transliterations differ, but no omitted
  name component or clear Korean spelling error is established.
- Deidra: the complete English name is preserved; Japanese and Chinese
  support the two personal-name components. No competing corpus occurrence
  supplies stronger Korean spelling evidence.
- Honnas: the complete English name is preserved. Japanese `ハナス・カルダー`
  and Chinese `霍恩纳斯·库尔德尔` differ in vowel rendering; neither alone
  establishes that the English-led Korean must be changed.

Retain all four cells. This is a bounded finding of no demonstrated error,
not authoritative pronunciation approval or new glossary registration.

## Duplicate Candidate Excluded

`default:1879`, `Keozai Blur`, already has a terminal `not an issue`
disposition in D-19598, superseding D-275. Its Japanese `ケオザイの霞`,
Chinese `基奥赛残影`, and current Korean `케오자이의 잔상(Keozai Blur)`
provide no new evidence to reopen that exact scope.

## Outcome

No CSV, glossary, occurrence index, historical disposition, or release
artifact changed. No format/residual audit, package build, or in-game
validation was run. Exclude these exact reviewed scopes from subsequent
candidate queues unless new evidence appears.
