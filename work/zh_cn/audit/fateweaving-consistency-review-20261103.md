# Fateweaving Consistency Review

- Date: 2026-11-03
- Scope: all English `default` rows containing `Fateweaving` or the descriptive phrase `fate weaving`; matched by stable ID against English, Japanese, Chinese, and active Korean.
- Result: 19 source rows reviewed: 18 uses of the fate-reading practice/service and one descriptive use of weaving fate-threads. The established Korean term is `운명 엮기`; English is paired on all 18 named-term uses.

## Meaning and Evidence

The source describes Fateweaving as a practice of reading the threads of fate, sometimes offered as a service. English `default:5514`, `9136`, `30965`, and `32351` explicitly describe learning to read the weave or reading fate-threads. Japanese uses `フェイトウィーブ`; Chinese uses `织命`. English `default:52956` separately explains the Fateweaver's paid service of resetting Skills and Abilities. These usages support `운명 엮기(Fateweaving)`, not literal textile-making.

## Row Review

| ID | Source context | Korean disposition |
| ---: | --- | --- |
| 2745 | `Activity - Fateweaving` | Updated label to `활동 - 운명 엮기(Fateweaving)`. |
| 7163 | Before Fateweaving became dreary work | Kept sentence wording; paired `운명 엮기(Fateweaving)`. |
| 9804 | Studied fateweaving under Simeon Crowe | Replaced `운명 직조` with `운명 엮기(Fateweaving)`. |
| 14334 | Standalone `Fateweaving` label | Replaced `운명 직조` with `운명 엮기(Fateweaving)`. |
| 14541 | Seeking Fateweaving; see Priestess Seranon | Replaced `운명 직조` with `운명 엮기(Fateweaving)`. |
| 15424 | Standalone `Fateweaving` label | Added English pairing: `운명 엮기(Fateweaving)`. |
| 20128 | Distrust of Franz Englehart regarding Fateweaving | Kept sentence wording; paired `운명 엮기(Fateweaving)`. |
| 23680 | Standalone `Fateweaving` label | Added English pairing: `운명 엮기(Fateweaving)`. |
| 24692 | Making a living from Fateweaving; predicting farmers' yields | Clarified the practice as the livelihood: `운명 엮기(Fateweaving)에 재주가 있다면 그걸로 생계를 꾸릴 수 있어.` |
| 26476 | Standalone `Fateweaving` label | Added English pairing: `운명 엮기(Fateweaving)`. |
| 26786 | Skeptic calls Fateweaving a crock and the Den's readings lies | Kept the Fateweaving translation and paired English. The separate `Den` place-versus-gambling-hall question remains outside this term review. |
| 34645 | Standalone `Fateweaving` label | Added English pairing: `운명 엮기(Fateweaving)`. |
| 39464 | Standalone `Fateweaving` label | Added English pairing: `운명 엮기(Fateweaving)`. |
| 40909 | Threads of fate weaving around a target's mind and heart | Kept as descriptive `운명의 실이 ... 엮이는`; this is not the practice/service term. |
| 47111 | Temple offers prayer, reflection, Fateweaving, and Orison | Kept meaning; paired `운명 엮기(Fateweaving)`. |
| 52562 | High Priestess offers blessings, counsel, and Fateweaving | Replaced the transliteration `페이트위빙`; clarified as `운명 엮기(Fateweaving)` and made the service list natural Korean. |
| 53721 | Visitor asks Luminitsa for Fateweaving | Replaced `운명 직조`, removed repeated “came,” and paired the service: `운명 엮기(Fateweaving)를 받으러 이 외딴 호숫가까지 온 거야?` |
| 55977 | Priestess offers prayer, Fateweaving, or Orison | Kept meaning; paired `운명 엮기(Fateweaving)`. |
| 63340 | Standalone `Fateweaving` label | Added English pairing: `운명 엮기(Fateweaving)`. |

## Scope and Verification

`Fateweaver` names the practitioner or group, not the practice, so those rows were not globally replaced. The descriptive participle at `40909` was likewise excluded from the glossary-term replacement. All changed Korean rows were targeted by ID and exact prior text; English, Japanese, and Chinese reference files were not modified.

The active `default` CSV retains 65,135 data rows, its UTF-8 BOM, and its pre-existing line-ending distribution of 71,885 CRLF and 199 LF. The four regression tests for `tools/replace_text_preserve_eol.py` pass.
