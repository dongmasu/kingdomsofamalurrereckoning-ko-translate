# Korean Review: `default` IDs 0-49

- Review date: 2026-10-05
- Resource: `work/ja_jp/locatexts_ja_jp.koalocatext_default.csv`
- Meaning authority: `src/csv/en_us/locatexts_en_us.koalocatext_default.csv`
- Supporting references: matching `ja_jp` and `zh_cn` default rows, plus the terminology table in `README.md` sourced from the official Korean manual.
- Scope: read-only review of the existing draft, followed by a separate editor pass for accepted findings.
- Structural fields and reference files were not edited.

## Accepted and Applied

| ID | Finding and evidence | Applied Korean |
| --- | --- | --- |
| 2 | “I've given you the gold” means the speaker gave the addressee money for the purchase; the earlier wording could imply the gold was merely handed to the seller. | 그에게서 사라고 금화를 네게 줬어. |
| 17 | “Ambassador Kulder of the Almain” identifies the Almain he represents, not necessarily his place of origin. | 저는 알마인(Almain)의 대사 컬더(Kulder)입니다. |
| 20 | “Indeed? Perhaps not.” was understandable but unnatural Korean. | 그래? 아닐지도 모르겠네. |
| 25 | The English source is `Mitharan`; the draft used `Mitharu`, which is not the source form. “Flawless” was also rendered more naturally as “흠 없는.” | 흠 없는 미사란(Mitharan) 확장 장식 |
| 40 | `Great Spine` is capitalized as a proper place name. Literal translation as “거대한 척추” risks reading as anatomy rather than a location. `Fellfire Bloom` is retained as a named flower. | 알세룬드(Alserund)의 그레이트 스파인(Great Spine); 펠파이어 블룸(Fellfire Bloom) |
| 41 | `Crows` is capitalized and Japanese renders it phonetically as クロウズ, indicating a named group rather than ordinary birds. | 너희 크로우(Crows)는… |

## Uncertain; Left Unchanged

| ID | Question |
| --- | --- |
| 1 | `the Maid` may be a title or a named character. Japanese interprets it as “Windemere's heroine,” while Chinese uses “young woman.” The current “시녀(The Maid)” preserves the English reference but may not capture the intended in-world title. |
| 29 | `Lyria's Lost` may be a quest/title or lost property. Japanese adds “goddess,” while Chinese and English do not resolve the intended sense. |
| 32 | Developer/test text for `Kollossae`; Japanese and Chinese transliterations differ. The current Korean transliteration is provisional. |
| 45 | `Bonnlach Courtier`: the source identifies a courtier, but the proper Korean rank or institutional role is unclear. |
| 46 | `the Crossing` is capitalized and appears to be a named place, service, or entity. The references do not disambiguate it. |
| 29, 32, 45, 46 | Keep the current draft pending stronger in-game or terminology evidence; do not infer a definitive translation from machine-translated references. |

## Checked; No Change Needed

- ID 0: `Persuasion` -> `설득`.
- ID 18: the English source specifies three blade projectiles; the draft correctly uses `3개` despite Japanese saying five. The four line breaks and damage values are preserved.
- ID 24: `{1}/{*1{2}}` variable markup is unchanged.
- IDs 21 and 48: the established `Erathi` and `Varani` renderings are consistent with the English meaning and the project terminology.
- IDs 1-49 retain their IDs and order; no `src/` files or sidecars were changed.
