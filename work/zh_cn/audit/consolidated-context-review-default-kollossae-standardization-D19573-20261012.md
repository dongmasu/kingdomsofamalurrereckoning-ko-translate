# Kollossae Ethnonym Standardization (D-19573)

- Date: 2026-10-12.
- Scope: eleven spelling-only holds across `default` IDs 191, 1081, 1106,
  7950, 9880, 11003, 11395, 14970, 20950, 31662, and 46995.
- Evidence: English controls meaning; Japanese informs voice/register;
  Chinese, German, Spanish, French, and Italian were cross-checked.
  The official Korean manual was reread in full; printed pages 1-2 cover
  playable races, and pages 17-18 provide broad faction/world context, but
  the manual does not name Kollossae. No PAK or PAK-derived evidence was
  used.

## Findings

The English rows consistently identify the Kollossae people, scout, scout
report, missionary, slaver, or camp. Japanese, Chinese, and the European
locales use different phonetic or grammatical forms, but do not suggest a
different people or change the relevant meanings. Korean decisions
D-18878 at ID 24277 and D-18933 at ID 24482 subsequently established
`콜로사이` as the accepted corpus form. Apply that later precedent to the
eight open rows that still used `콜로새` or `콜로세`.

| Decision | ID | Disposition | Finding |
| --- | ---: | --- | --- |
| D-19573; closes D-054 | 191 | accepted | The scout-report label is source-faithful; normalize only `콜로새` to `콜로사이`. |
| D-19573; closes D-156 | 1081 | accepted | The challenge to face the Kollossae is preserved; normalize the people-name. |
| D-19573; closes D-158 | 1106 | accepted | The epistle's sender, Kollossae missionary role, and ettin recipient are preserved; normalize the people-name. |
| D-19573; closes D-2195 | 7950 | accepted | The speaker's camp question and size comparison are preserved; normalize the people-name. |
| D-19573; closes D-2825 | 9880 | not an issue | English has the one-off spelling `Kollosae`; Japanese, Chinese, German, Spanish, French, and Italian identify the standard Kollossae camp. Korean already uses `콜로사이 야영지`. |
| D-19573; closes D-3181 | 11003 | accepted | The `Kollossae Scout` label is source-faithful; normalize the people-name. |
| D-19573; closes D-3319 | 11395 | accepted | English `Slaver M`, Japanese, Chinese, Spanish, and Italian support the male slaver label; normalize only the people-name. |
| D-19573; closes D-4545 | 14970 | accepted | The statement that the group was Kollossae and later abandoned the gods is preserved; normalize only the ethnonym. |
| D-19573; closes D-6459 | 20950 | accepted | The imperative to behold the people's might is preserved; normalize only the ethnonym. |
| D-19573; closes D-10259 | 31662 | not an issue | The standalone label already uses the accepted `콜로사이`. |
| D-19573; closes D-14355 | 46995 | not an issue | The standalone label already uses the accepted `콜로사이`. |

## Applied Text

| ID | Previous Korean | Applied Korean |
| ---: | --- | --- |
| 191 | `나로스의 이빨에서 발견한 콜로새 정찰 보고서.` | `나로스의 이빨에서 발견한 콜로사이 정찰 보고서.` |
| 1081 | `감히 콜로세(Kollossae)족에게 맞서겠다고?` | `감히 콜로사이(Kollossae)족에게 맞서겠다고?` |
| 1106 | `콜로세(Kollossae) 선교사 디오도레스(Diodores)가 에틴에게 보낸 서신.` | `콜로사이(Kollossae) 선교사 디오도레스(Diodores)가 에틴에게 보낸 서신.` |
| 7950 | `누가 내 야영지에 들어온 거지? 이게 뭐야? 너무 작아서 콜로새(Kollossae)족일 리가 없는데...` | `누가 내 야영지에 들어온 거지? 이게 뭐야? 너무 작아서 콜로사이(Kollossae)족일 리가 없는데...` |
| 11003 | `콜로세 정찰병` | `콜로사이 정찰병` |
| 11395 | `콜로세 노예상(남성)` | `콜로사이 노예상(남성)` |
| 14970 | `그들은 콜로세였어. 하지만 신을 완전히 저버렸지. 이제 야만의 시대로 돌아가 눈에 띄는 자들을 모조리 죽여.` | `그들은 콜로사이였어. 하지만 신을 완전히 저버렸지. 이제 야만의 시대로 돌아가 눈에 띄는 자들을 모조리 죽여.` |
| 20950 | `콜로세의 힘을 보아라!` | `콜로사이의 힘을 보아라!` |

## Verification

- Only the eight approved `Texto` cells above changed.
- Pre-edit default SHA-256:
  `9b745401670abe1d2860e41e826a27f3482bad4338476b3e5549158023e7f432`.
- Byte-identical backup:
  `/private/tmp/ko-translate-backups/20261012/before-kollossae-standardization-D19573/locatexts_zh_cn.koalocatext_default.csv`.
- Post-edit default SHA-256:
  `3a483aa7b6ba6aef9175bec0ae08b39c3a66f6b9b6e8e725ad2dd165c28f30fe`.
- Exact reverse reconstruction passed. UTF-8 BOM, row order/count,
  72,011 CRLF endings, and 73 bare-LF endings are preserved.
- Default totals: **2,499 accepted / 25,376 not an issue / 10,649
  uncertain** (38,524).
- Next open register hold: **D-055, default ID 196**.

This closes the listed Kollossae spelling-only holds; it does not close
other Kollossae findings with separate unresolved meaning or lore questions,
and it does not complete the wider default audit.
