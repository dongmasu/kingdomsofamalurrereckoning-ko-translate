# D-21897: Three Personal-Name Groups

Date: 2026-10-20

## Findings

| Key | English | Japanese | Chinese | Current Korean |
| --- | --- | --- | --- | --- |
| default:2276 | Squire Coran | 従者コラン | 乡绅科兰 | 종자 코란(Coran) |
| default:2378 | Ezekiel Fife | エズィキール・ファイフ | 艾泽凯尔·菲弗 | 에제키엘 파이프(Ezekiel Fife) |
| default:2471, default:13044 | Maslow Tarric | マズロー・タリック | 马斯洛·塔里克 | 매슬로 타릭(Maslow Tarric) |

- Coran: Korean `코란` agrees with the aligned Japanese and Chinese name
  readings and is repeated in the related labels `Return to Squire Coran`
  (`default:285`), `Squire Coran` (`default:36949`), and short `Coran`
  (`default:15895`). Keep `종자` as the localized role term. The separate
  question of the exact military meaning of `Squire` is not resolved here;
  do not treat this name-only review as closing that terminology question.
- Ezekiel Fife: all three source locales support the two name components.
  Korean `에제키엘 파이프` is a plausible pronunciation-based rendering of
  the English, and no competing Korean source occurrence establishes a
  stronger form. No clear name error is demonstrated.
- Maslow Tarric: both exact English full-name rows have identical Korean
  spellings, with Japanese and Chinese supporting the same components.
  The separate short `Maslow` references at `default:24967` and
  `default:28314` also use `매슬로`. Retain both complete-name cells.

## Outcome

No CSV, glossary, occurrence index, or release artifact changed. This
bounded name review does not resolve Coran's separate role terminology or
establish authoritative pronunciation beyond the checked corpus. No
format/residual audit, package build, or in-game validation was run.
Exclude these exact name scopes from future candidate queues unless new
evidence appears.
