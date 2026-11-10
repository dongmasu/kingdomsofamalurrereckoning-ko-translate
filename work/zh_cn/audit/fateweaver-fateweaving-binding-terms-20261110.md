# Fateweaving, Fateweaver, and Fate-Binding Review

Reviewed on 2026-11-10 against the English, Japanese, Chinese, and active
Korean `default` rows. The official Korean manual glossary in `README.md`
confirms `Fateweaver` as `페이트위버`.

## Terminology

| English | Korean | Meaning and scope |
| --- | --- | --- |
| `Fateweaving` | `운명 엮기(Fateweaving)` | The practice or service of reading the threads of fate. It is related to, but not the same term as, the practitioner. |
| `Fateweaver` | `페이트위버(Fateweaver)` | A practitioner or member of the Fateweavers. Japanese uses `フェイトウィーバー`; Chinese uses `织命者`. |
| `Order of Fateweavers` | `페이트위버 교단(Order of Fateweavers)` | The organization. Preserve the full organization name rather than glossing it as an individual Fateweaver. |
| `fate's bonds` / `bonds of Fate` | `운명의 속박` | A general metaphor for being constrained by fate, not a name for Fateweaving or a Fateweaver. |
| `Unbind Destiny` | `운명의 속박 풀기(Unbind Destiny)` | The named character-reset action offered through a Fateweaver; it resets Skill and Ability points. It is functionally related to the Fateweaver service, but distinct from Fateweaving. |

`Fatewaver` is a source typo at `default:30378`; Japanese and Chinese confirm
the intended `Fateweaver`, so the Korean gloss uses the canonical spelling.
`Fateweaver Order` at `default:34098` refers to the same organization and is
paired using its established full name.

## Applied Changes

Added or corrected the Fateweaver pairing in 108 rows:

`371, 474, 981, 1010, 1222, 5159, 5514, 5751, 5889, 6286, 7027, 7124, 7957, 8550, 9066, 9136, 9265, 11329, 12526, 12654, 13346, 14798, 15317, 16866, 17017, 17034, 17133, 17168, 17245, 17512, 19459, 19649, 19802, 20004, 20272, 20745, 20777, 20997, 21559, 22481, 24095, 24114, 24415, 24603, 25083, 26047, 26055, 27573, 28694, 30068, 30378, 30965, 32351, 32917, 34098, 34166, 34433, 34680, 35038, 35831, 36367, 37554, 37786, 37926, 38591, 39016, 39151, 39716, 39790, 39947, 41119, 42223, 42322, 42708, 44065, 45294, 45514, 46821, 46866, 47190, 47796, 48009, 48917, 49575, 49953, 50129, 50429, 51932, 52853, 52956, 53126, 53130, 53256, 53675, 54032, 55907, 56256, 56640, 57205, 57541, 58097, 58316, 58357, 59096, 59653, 63186, 64593, 64940`

The same review normalized the translated role variants at `default:7957`,
`24095`, `24114`, `28694`, `36367`, `45514`, and `63186` to `페이트위버`.
At `default:34900`, the action label now includes `(Unbind Destiny)`. At
`default:4770`, the payment and release clause was clarified as:

> 캐릭터를 완전히 다시 구성하고 싶다면 페이트위버(Fateweaver)를 찾아가 대가를 내고 운명의 속박을 풀어 달라고 하면 됩니다. 그러면 기술 및 능력 포인트가 모두 초기화됩니다.

The generic `운명의 속박` passages at `default:2702`, `13404`, `22230`, and
`60101` were checked against their sources and retained. Their wording describes
fate's constraints, not the named `Unbind Destiny` action. The repeated source
text at `default:45514` and `63186` remains identically translated.

All 18 source rows containing `Fateweaving` already had the correct
`운명 엮기(Fateweaving)` pairing. No `Fateweaver` source matches were found in
`base` or `affix`.

## Verification

- Re-searched all 157 `default` source rows containing `Fateweaver`,
  `Fateweavers`, or the typo `Fatewaver`; no unpaired or nonstandard Korean
  role terms remain.
- Confirmed the `Fateweaving` pairing in all 18 matching source rows.
- Confirmed 65,135 parsed records and source ID order, UTF-8 BOM, and the
  pre-existing line-ending distribution of 71,846 CRLF and 244 LF-only
  separators.
- `python3 -m unittest tools/test_replace_text_preserve_eol.py`: 11 tests
  passed.
- `git -c core.whitespace=cr-at-eol diff --check -- work/zh_cn/locatexts_zh_cn.koalocatext_default.csv`: passed.
