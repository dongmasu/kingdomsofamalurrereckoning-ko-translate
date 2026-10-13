# Combined `base` + `affix` Disposition: Round 13

- Date: 2026-10-11
- Scope: `base` IDs 1200-1299 (100 rows) and all six active Korean variants
  for `affix` IDs 120-129 (60 keys).
- English determined meaning; Japanese informed voice and affix structure;
  Chinese was supporting evidence. Existing preliminary reports,
  terminology decisions, and prior audit findings were reconciled by ID.
- These are working dispositions, not independent final linguistic approval.
  No runtime base/affix pairing or rendered full name was verified.

## Accepted `base` Corrections

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-18180 | 1277 | `알메인(Almain) 대투구` | `알마인(Almain) 대투구` | The official Korean terminology inventory and accepted D-093 establish `Almain = 알마인`; the current spelling conflicts with that authority. |
| D-18181 | 1298 | `전쟁의 시어던(Thyrdon) 각반` | `시어던(Thyrdon)의 전쟁 각반` | English `Thyrdon's Chausses of War`, Japanese, and Chinese agree on Thyrdon as possessor and War as the item modifier; the old Korean reverses/obscures that relation. |

## Uncertain `base` Findings

| Decision | ID(s) | Finding |
| --- | --- | --- |
| D-18182 | 1204 | `Heaven` is capitalized and transliterated in Japanese but translated as `天堂` in Chinese and `천국` in Korean; name versus common-noun status is unresolved. |
| D-18183 | 1206 | `Eventide Treasure` may refer to the named place Eventide rather than evening. Japanese transliteration and other corpus occurrences support a proper name, but D-122 and the broader Korean naming treatment remain unresolved. |
| D-18184 | 1207 | `Gem of Ice Hindrance` is awkwardly literal in Korean; Japanese suggests ice-binding while English and Chinese do not establish the exact item/effect sense. |
| D-18185 | 1227 | `Silkfarmer` is rendered as a farmer, but the locale sources describe silk gathering/reeling. Existing `Silkfarmer` questions (including D-1491, D-11865, D-16662) leave the occupation/group and canonical Korean term unsettled. |
| D-18186 | 1230 | `Zungar Shaft` could be a mine shaft or another named structure. Chinese explicitly uses a mine-shaft term, but English and Japanese do not settle the in-game referent; do not replace `축` by guesswork without context. |
| D-18187 | 1243 | English and Chinese support a path, while Japanese describes a petition board. Korean follows English, but the source/entity mismatch needs context before changing or closing the finding. |
| D-18188 | 1244, 1245 | The English names are `Ina Sawerth` and `Othe Theswin`; locale transliterations differ, and the project has no confirmed canonical Korean name forms for these entries. |
| D-18189 | 1252 | English and Chinese identify a trellis/lattice, while Japanese describes a gathering place. Korean follows English; the conflicting referent needs context. |
| D-18190 | 1283 | `Perfidious Leggings` is adjectival in English, whereas `배신자의 레깅스` reads possessively. Locale readings share betrayal imagery, but the intended item-name relation and Korean naming style are not established. |

## Remaining `base` Rows

D-18191 records the other 88 IDs in 1200-1299 as `not an issue`: the
available meaning and item/label category are preserved, and no further
actionable slot, structure, or terminology defect was established. This set
excludes IDs 1204, 1206, 1207, 1227, 1230, 1243-1245, 1252, 1277, 1283,
and 1298.

## `affix` Findings

| Decision | ID(s) / variants | Disposition | Rationale |
| --- | --- | --- | --- |
| D-18192 | 120 / 11, 12, 14, 21, 22, 24 | uncertain | `Haven` may be a proper name or a harbor/refuge; Chinese favors harbor, Japanese transliterates the name, and Korean chooses refuge. No composed item settles the choice. |
| D-18193 | 121 / 11, 12, 14, 21, 22, 24 | uncertain | `Plant` is an action/UI fragment. Korean `심기:` is plausible as a label, but the complete prompt and following text are unavailable; Japanese uses an imperative and Chinese omits the colon. |
| D-18194 | 122-127, 129 / all six variants each | not an issue | The Korean pointed/paramount modifiers and the Ruin, Festering, Hail, Deluge, and Prodigy relations retain the available source senses; no specific actionable defect was established. |
| Linked D-004 | 128 / 11, 12, 14, 21, 22, 24 | uncertain, previously counted | The postposed `of Ice Shield` fragment remains unresolved without a verified full-name slot or safe Korean rendering. This round rechecked it but adds no duplicate disposition. Related `default` D-3327 is also retained as a separate resource finding. |

## Coverage, Structure, and Evidence

- This completes round 13 of 59 aligned range buckets. Combined-name
  follow-up now covers `base` IDs 0-1299 (1,300/4,844 rows) and `affix`
  IDs 0-129 (760/3,451 variants). The original first-pass coverage remains
  73,430/73,430 and was not repeated.
- The five `base` files each contain 4,844 rows and the exact same ascending
  `(ID_Linha, Tipo_Variante)` array; target IDs 1200-1299 occur once each,
  variant 11. The Japanese-derived draft and active Korean rows were joined
  by exact key.
- The English `affix` source has one `FF` row per ID (10 rows). Japanese
  source and Japanese-derived draft have 55 target rows each; ID 124 has
  only variant 11 in Japanese. Chinese and active Korean each have all 60
  target keys in the same order, six variants per ID
  (11, 12, 14, 21, 22, 24). Korean text repeats across the six variants.
- None of the 100 base labels or 60 affix fragments contains an embedded
  line break or runtime marker. The colon on all six variant rows for action
  fragment `Plant` (ID 121) is retained and documented as a UI-composition
  question; no complete prompt was available to verify its punctuation or
  register.
- No runtime base/affix pairing was inferred from matching numeric ranges.
  In particular, the six `affix` 128 rows remain linked to D-004 and are not
  counted again. The preliminary duplicate listing of `base` 1227 was
  reconciled and counted once.
- Base source files:

| File | SHA-256 |
| --- | --- |
| `src/csv/en_us/locatexts_en_us.koalocatext_base.csv` | `e6af9e9008892f082f741f73275aef215c606cb73b9d6d9c7f558375b10dbfa0` |
| `src/csv/ja_jp/locatexts_ja_jp.koalocatext_base.csv` | `23708c6a4479006bcfbc25fc24484bf88dc85ae503ae35094a19363592c79fcc` |
| `work/ja_jp/locatexts_ja_jp.koalocatext_base.csv` | `5f7f3375108c7e78d9209be00a2351b000c7b174ed7b513bed772f4e6ec09c4f` |
| `src/csv/zh_cn/locatexts_zh_cn.koalocatext_base.csv` | `b95d447e09f68e54dc08a82294806619d9942ac080654b7a278b6fd053ba3310` |
| Active `work/zh_cn/locatexts_zh_cn.koalocatext_base.csv`, pre-edit | `124bae756b438f4819fbfd71c3f722df07487206514723ab24d0aa4a107a4ca8` |
| Active `work/zh_cn/locatexts_zh_cn.koalocatext_base.csv`, post-edit | `71885c90357e952f9a35b03dd958f33bcb447f4094cbb571c4eeaa31d2917e3e` |

- Affix source files:

| File | SHA-256 |
| --- | --- |
| `src/csv/en_us/locatexts_en_us.koalocatext_affix.csv` | `8727c06a9cd19a2c9c79090072684da97a1586858b50986a8cc4de72fc3ac302` |
| `src/csv/ja_jp/locatexts_ja_jp.koalocatext_affix.csv` | `984bb7ca18f074c456d46d0c043fa999b95ad12e7ffea45460330b9c3e1b0677` |
| `work/ja_jp/locatexts_ja_jp.koalocatext_affix.csv` | `1a09f5536e0735c38567f5143fbb2babe6471f24c590e8baf9dfbce64457fa10` |
| `src/csv/zh_cn/locatexts_zh_cn.koalocatext_affix.csv` | `9f9d25d578b35ba607cebf9a0bd1ec45153736d618f7d6d1b14b09049a40e3e6` |
| Active `work/zh_cn/locatexts_zh_cn.koalocatext_affix.csv` (unchanged) | `7697d7d09933ca7f7f8f6e41fcd82bb5f29e4b092368b856489a8c62f1dc21b9` |

## Edit Integrity and Running Counts

- Only active Korean `base` `Texto` cells at IDs 1277 and 1298 changed.
  UTF-8 BOM, 4,844 data rows, key order, and all 4,845 CRLF record endings
  are preserved. A parsed before/after comparison found exactly these two
  cell changes and no other field changes.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-base-affix-review-1200-1299/locatexts_zh_cn.koalocatext_base.csv`
  (SHA-256 `124bae756b438f4819fbfd71c3f722df07487206514723ab24d0aa4a107a4ca8`).
- Round 13 adds 2 accepted, 130 `not an issue`, and 22 uncertain unique
  row/key dispositions (154 total); `affix` 128's six keys are linked to
  D-004 and excluded from the increment.
- Cross-resource totals through D-18194: 1,869 accepted, 17,574
  `not an issue`, and 12,942 uncertain (32,385 total); next D-18195.
  These are working dispositions, not independent linguistic approval.

## Resume

Continue with `base` IDs 1300-1399 and `affix` IDs 130-139 (round 14).
There are 36 remaining base batches and 46 remaining affix batches through
`affix` ID 585. The original first-pass source scan remains complete.
