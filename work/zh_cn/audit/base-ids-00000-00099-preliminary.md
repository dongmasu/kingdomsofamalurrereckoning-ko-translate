# Preliminary Language Scan: `base` IDs 0-99

- Review date: 2026-10-07
- Active resource: `work/zh_cn/locatexts_zh_cn.koalocatext_base.csv`
- Meaning authority: matching `en_us` rows.
- Supporting references: matching `ja_jp` and `zh_cn` rows; official Korean
  manual and project terms where applicable.
- Scope: read-only first pass over all 100 active `base` rows.
- No translation CSV was edited.

## Preliminary Findings

| ID | Current Korean | Candidate wording / question | Evidence and rationale | Confidence | Preliminary status |
| ---: | --- | --- | --- | --- | --- |
| 32 | 발라드 기도실 | Is `Ballads` a reference to the named House of Ballads? If so, consider a rendering that makes the affiliation clear, such as `발라드의 기도실`. | English `Ballads Oratory` and Japanese `バラードの祈祷場` indicate an oratory associated with Ballads. The current text is understandable but can read as an oratory for musical ballads. Confirm the in-game location/faction usage. | Medium | Open |
| 62 | 승리 게임의 별 | Confirm whether `Victory Games` is a named tournament and `Star` is an award/title or participant label; then choose a natural Korean item/title form. | English is capitalized `Victory Games Star`; Japanese transliterates the full phrase and Chinese renders it as a competition star. Current literal `승리 게임의 별` is awkward and does not make the likely proper-name structure clear. | Medium | Open |
| 99 | 이건(Eagonn)의 정강이받이 | Confirm the established Korean pronunciation/spelling of `Eagonn`. | Japanese `イーゴン` and Chinese `伊贡` suggest a pronunciation not obvious from English spelling. The current English parenthetical preserves traceability, but the Hangul form is provisional. | Low | Open |
| 109 | 벨른(Belne)의 분노의 지팡이 | Consider `벨른(Belne)의 분노 지팡이` or another concise item-name construction after checking whether `Ire` is a named property. | The current stacked possessives `벨른의 분노의 지팡이` are awkward Korean. English `Belne's Staff of Ire` and both supporting locales preserve the two-part relationship; do not remove or reinterpret `Ire` without checking item naming conventions. | High | Candidate wording correction |

## Name-Marking Consistency Notes

Within this short range, some named locations/items include English in
parentheses while others do not. This is recorded as corpus-wide consistency
input only; no per-row correction is authorized until the project decides
when to use `한글(English)`.

## Batch Status

All 100 rows received one preliminary reading. This is not an independent
Reviewer disposition and does not approve any change. Revisit the candidates
and questions in the later consolidated assessment.
