# Edit Addendum D-19898

Scope: `default` IDs 41151-41200.

The prior accepted corrections at IDs 41153, 41187, 41193, and 41195 were
already active and were verified without re-editing or recounting.

Immediately before editing, the active CSV had SHA-256
`823f144e32bdd4d13c501ab96d696417f8dacdaf09c2c06e211270ccf224f9df`.
Byte-identical backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19898/locatexts_zh_cn.koalocatext_default.csv`.

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 41152 | `아가씨를 살려 보내기로` | `시녀를 살려 보내기로` | English names the Maid; reuse the accepted named-figure form `시녀` (D-19880/D-19889). The separate Telling term remains uncertain. |
| 41184 | `상업 기술이 일시적으로 1 증가합니다.` | `상술이 일시적으로 1 증가합니다.` | Use official Korean manual terminology for Mercantile (PDF p. 4); keep the temporary +1. |
| 41188 | `다음 회고록은 아데사 연구소에서 찾을 수 있다.` | `회고록의 다음 부분은 아데사 연구소에서 찾을 수 있다.` | Preserve English `the next portion` of the existing memoir without assigning a new chapter number. |
| 41197 | `콜로새가 하이페리안을 발견했을 때` | `콜로세가 하이페리안을 발견했을 때` | Reuse accepted Kollossae people-name `콜로세` established at 41195/D-12901. |

Post-edit SHA-256:
`8da80d8f1a34ad8bd4435bbbaa2183605c75aa1a6e466e09fcd1adc1b8e3f265`.
The guarded edit script
`apply-named-scope-D19898.rb` verified the active hash and backup,
four-locale scope IDs, complete ID order, BOM, line-ending counts, and
exact inverse reconstruction of all non-target bytes.
