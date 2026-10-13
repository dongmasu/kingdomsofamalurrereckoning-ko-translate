# Consolidated Context Review: `default` IDs 25801-25850

- Date: 2026-10-11.
- Scope: re-review the 27 prior uncertain unique keys in IDs 25801-25850
  against English, Japanese source and draft, Chinese, active Korean, earlier
  audit decisions, and recurring terminology.
- Result: resolve 26 keys (five accepted corrections and 21 `not an issue`);
  retain ID 25834 for the unresolved Korean form of `Preordained`.
- English is the semantic authority; Japanese informs voice/register and
  supplies supporting terminology evidence; Chinese is a secondary check.

## Decisions D-19239-D-19247

| Decision | ID | Outcome | Evidence |
| --- | ---: | --- | --- |
| D-19239 | 25804-25806 | not an issue | The Kandrian tale preserves Aral's blindness, the parents' pride, the singer, and the southern stronghold. Korean follows English/Japanese for Aral; the Chinese name divergence is not evidence of a Korean error. The source's unspecified pronouns and nightingale metaphor are not over-resolved. |
| D-19240 | 25808-25812 | mixed | Vane's Luck, the health-steal chance, Grim question, and Wencen amulet description are retained. Accept 25811 as `소울딥 지하 통로는 어디야?`, matching the same named place and Japanese/Chinese underground-passage readings at 25811 and the accepted destination form at 13928 (D-4132). |
| D-19241 | 25816-25819 | not an issue | Names, the ship attack and abandonment, the betting boast, and Haiti are retained. Korean's gender-neutral first-person narration does not import the Japanese feminine ending or conflict with English's male `he`. |
| D-19242 | 25823 | not an issue | Korean preserves Maire and the Queen of Cups title. The same title/person was judged identifiable at ID 22673 (D-18467); spelling canon is non-blocking for this row. |
| D-19243 | 25826 | not an issue | `도크알브` is the official-manual form (D-042/D-049/D-153); the English misspellings `appesr` and `Dokklafar` are source defects. Korean conveys the book's apparent origin and the title `일반적인 교역 관행`. |
| D-19244 | 25827 | accepted | Replace the “ordinary mortal would not dare” reading with the source's burden beyond what one mortal could hope to bear; Japanese independently supports the one-mortal/impossible-to-carry construction. |
| D-19245 | 25832-25837 | mixed | The notice delivery, Motus Mining report, Precise Weaponry III, Fae twilight warning, and Fight Board are retained. Keep 25834 uncertain: the group is identifiable as the Preordained, but `선결된 자들` conflicts with other Korean forms and the project-wide canonical rendering remains open. |
| D-19246 | 25840 | not an issue | `루체른과 상호작용했다!` follows the English action without guessing whether the event means use, harvesting, or another plant interaction; the object identity remains traceable. |
| D-19247 | 25844-25848 | mixed | Accept 25844's `Fae body` as a magical Fae collective (`페이 무리`), normalize Aergase at 25846 to the prevailing source-matched `에어가스`, and reuse accepted `부름받은 자` / `콜로사이` at 25847. The heights remark and Adessa comparison remain accurate. |

## Accepted Text Edits

| ID | Previous Korean | Applied Korean | Rationale |
| ---: | --- | --- | --- |
| 25811 | `소울딥 페스팅은 어디야?` | `소울딥 지하 통로는 어디야?` | Match the same location at ID 13928 and the Japanese/Chinese underground-passage readings. |
| 25827 | `흥미롭군. 필멸자면서도 발걸음에는 보통 필멸자라면 감히 짊어지지 못할 무게가 실려 있어.` | `흥미롭군. 자네는 필멸자지만, 발걸음에는 필멸자 한 명이 감당할 수 있으리라 기대조차 못 할 무게가 실려 있군.` | Remove the unsupported “ordinary” and “dare” nuance while preserving the supernatural burden and conversational voice. |
| 25844 | `우리는 들판과 샘의 자식들, 깊은 마력의 숨결로 가득 찬 페이의 육신이다. 네 주위에 보이는 것은 모두 우리 것이다.` | `우리는 들판과 샘의 자식들, 깊은 마력의 숨결로 가득 찬 페이 무리다. 네 주위에 보이는 것은 모두 우리 것이다.` | English `a Fae body` is a collective here; Japanese explicitly uses `集団`, not a physical body. |
| 25846 | `에어게이즈와 만나기` | `에어가스와 만나기` | Match the English `Aergase`, Japanese `エアガス`, and repeated active Korean form at IDs 3267, 9498, and 64033. |
| 25847 | `발밑을 조심하시오, 선택받은 자여. 콜로새의 실패로 이미 많은 이들이 목숨을 잃었소. 희생자가 더 늘어나는 건 원치 않소.` | `발밑을 조심하시오, 부름받은 자여. 콜로사이의 실패로 이미 많은 이들이 목숨을 잃었소. 희생자가 더 늘어나는 건 원치 않소.` | Reuse accepted `Beckoned` (D-692/D-3443) and the recent preferred `Kollossae` form (D-18878/D-18933); retain the warning and claimed prior losses. |

## Verification

- English, Japanese source, Japanese-derived draft, Chinese, and active Korean
  each contain 65,135 unique ascending IDs. IDs 25801-25850 occur once in
  identical order in every file.
- Embedded line-break counts match for all 50 IDs. Marker identities and
  order are preserved in Korean. ID 25849 retains the previously recorded
  Chinese-only reversal of the two localized wrapper markers; Korean matches
  English and Japanese.
- Only the five active Korean `Texto` values listed above changed. Reversing
  those exact substitutions reproduces the pre-edit backup byte-for-byte.
  UTF-8 BOM, row order, 72,011 CRLF endings, and 73 existing bare-LF endings
  are preserved.
- Byte-identical pre-edit backup:
  `/private/tmp/ko-translate-backups/20261011/before-context-25801-25850-D19239/locatexts_zh_cn.koalocatext_default.csv`.
- Pre-edit SHA-256:
  `5e8e39450e3254c1cf3c50413bdd1683624f772234256372798a956e5e33dac1`.
- Post-edit SHA-256:
  `65a3e909862eeab29618c5283567adaf4b565f0405c79760276838f8cab643e3`.
- Totals: 2,185 accepted / 24,302 `not an issue` / 12,037 uncertain
  (38,524 counted keys). Resume at D-19248, ID 25851.
- Decision-register reconciliation remains incomplete: the detailed register
  has no context entries for D-19162-D-19238, although batch reports exist.
  The earlier D-18422-D-18452 register gap also remains; neither gap is
  silently treated as reconciled by this batch.
