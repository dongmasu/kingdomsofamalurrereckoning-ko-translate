# Consolidated Context Review: `default` IDs 24851-24900

- Date: 2026-10-11.
- Re-reviewed prior uncertain findings against English meaning, Japanese
  voice/register and draft, Chinese supporting evidence, active Korean,
  linked corpus uses, and earlier audit decisions.
- Resolved all 12 prior uncertain IDs: two accepted corrections and ten
  `not an issue`. No hold remains in this interval.

## Decisions D-19019-D-19028

| Decision | ID | Outcome | Evidence |
| --- | ---: | --- | --- |
| D-19019 | 24853 | not an issue | The four-entry diary and one-of-five key count match English and Chinese; Japanese conflicts internally and does not override English. Odarath and Ugnar Odgray forms recur in the active corpus, including IDs 903 and 23644. |
| D-19020 | 24857-24859 | mixed | IDs 24857-24858 are `not an issue`: Japanese/Chinese support a sparring/training arena, and Penri Kell is identifiable from repeated quest text. ID 24859 is accepted: the established person Tine Delfric appears in the mountain-base objective, so add `(Tine)` and the natural Korean comitative marker to disambiguate `타인`. |
| D-19021 | 24861 | not an issue | The dagger skill requires an undetected approach from behind and enables a special execution attack; `처형 공격` preserves this mechanic without changing its condition. |
| D-19022 | 24865 | not an issue | English `lackey`, Japanese being made to work like Egan, and Chinese `servant` support low-status `심부름꾼`; the warning to leave remains. |
| D-19023 | 24868 | not an issue | Osgar Krast, Ost Ordura, the returned dagger, gold, and Warsworn commendation are retained with recurring Korean name forms. |
| D-19024 | 24874 | not an issue | The objective is to defeat the Baresarks; Japanese transliterates the enemy type and Chinese describes berserk fighters. `광폭한 야수` conveys the target class; no reliable canonical Korean creature spelling is established for this isolated objective. |
| D-19025 | 24876 | not an issue | `치명타 피해 보너스` directly preserves the Critical Hit Damage Bonus stat label. |
| D-19026 | 24879 | accepted | The English poem is identical to ID 55208. That independently repeated Korean passage supplies a verified reference for the Bhaile/Pietra/Hoolgan names, epithets, and poetic phrasing; align this occurrence while preserving the source's nine lines and stanza break. |
| D-19027 | 24891 | not an issue | The speaker is accountable for the entrusted men; Japanese explicitly calls them subordinates, supporting Korean `부하들`, and both clauses of responsibility remain. |
| D-19028 | 24895 | not an issue | The failed attempts, ship decorated with their failures, and gallows left on the beach remain. Japanese and Chinese support the same boast; no scene fact is needed to preserve the line. |

## Edits

| ID | Before | After | Rationale |
| ---: | --- | --- | --- |
| 24859 | `산기슭에서 타인 만나기` | `산기슭에서 타인(Tine)과 만나기` | Identify Tine as the named person, not the Korean common noun `타인`. |
| 24879 | Existing localized poem with unmarked/variant names | Align with the identical-source poem at ID 55208 | Reuse verified names, epithets, and poetic phrasing from the repeated source text. |

The revised 24879 text:

```text
겨울의 가장 위대한 영웅들은 언제나 베일(Bhaile)의 창백한 가지에서 떨어졌네,
예리한 피에트라(Pietra)부터 굶주린 훌건(Hoolgan)까지.
투아사가 우리를 지배하려 들자,
영웅들이 일어나 겨울을 지켰네.

가드플로우(Gadflow)는 도전을 비웃고,
티르노크(Tirnoch)의 분노를 불러냈네.
순식간에 가장 충성스러운 영웅들이 프리즈미어 첨탑에 꿰뚫렸지.
우리의 영웅들은 사라져 다시는 태어나지 못했고,
우리 민족은 가드플로우의 광기에 굴복했네.
```

## Verification

- English, Japanese, Chinese, Japanese-derived Korean draft, and active
  Korean each contain IDs 24851-24900 exactly once and in identical order.
- The two approved `Texto` values are the only byte-level differences from
  the pre-edit backup. The UTF-8 BOM, row order, 72,011 CRLF endings, and 73
  pre-existing bare LF endings remain unchanged.
- ID 24879 retains the nine source lines and stanza break. The linked poem
  at 55208 has the same English text; no runtime markers occur in the edits.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-24851-24900-D19019/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `14260e68e2a32f339ba665e737db7c0b7dc0cbddfc3873f3b3a049b43978a1fd`.
- Post-edit SHA-256:
  `33402ae212e395fd7001404a0b976bcfd46f17e0e229688566fc97cad31b791e`.
- Totals: 2,133 accepted / 23,881 `not an issue` / 12,510 uncertain
  (38,524 counted keys). Resume D-19029 at ID 24901. Sequential IDs
  24901-65134 remain (40,234), along with earlier specific holds and the
  D-18422-D-18452 register backfill.
