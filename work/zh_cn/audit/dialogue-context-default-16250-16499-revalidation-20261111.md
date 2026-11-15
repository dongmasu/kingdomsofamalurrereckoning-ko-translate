# Sequential `default` Revalidation: IDs `16250`-`16499`

- Date: 2026-11-11.
- Scope: compare all 250 active Korean rows with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Seventy existing ledger records had current four-language fingerprints;
  180 previously unrecorded IDs were reviewed and added.
- Seven new correction candidates and twelve evidence-limited holds are
  recorded. Six existing candidates and three existing uncertain findings
  were rechecked without changing their dispositions. No translation CSV,
  source resource, extracted game asset, or localization binary was changed.

## New Correction Candidates

These are review proposals, not authorization to edit the active translation
CSV.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `16250` | Format / name-title pairing | The English label is `Ambassador Mandolph`; the Korean pairs the title and name but reverses them inside the English parenthesis as `(Mandolph Ambassador)`. Preserve the existing Korean name/title order and pair the complete source label: `맨돌프 대사(Ambassador Mandolph)`. | High |
| `16276` | Naturalness | English `intimidating friend` and Japanese `いかついお友達` describe an imposing or rough-looking friend. Korean `무서운 친구` can instead mean a frightening friend. Consider `험상궂은 친구` while retaining the playful line. | Medium-high |
| `16283` | Naturalness | `살해당했어. 너희 사람들에게.` leaves the English's abrupt fragments but makes the Korean passive-agent ending unnatural. Preserve the accusation and emotional cadence with a direct clause, for example `내 스승 칼란 맥클라우드(Calan Mcleod). 안쪽 바닥에 쓰러져 있는 사람이야. 너희가 죽였어.` | High |
| `16389` | Meaning / naturalness | The English says the armor's stone and steel plates were painted with blood nightly for six months. Korean `이 갑옷은 ... 피를 발라 만들었다` can imply the blood-painting created the armor. Consider making the plates the subject: `굶주린 훌간(Hoolgan the Hungry)이 이름 없는 적의 시체에서 처음 손에 넣은 이 갑옷은 돌과 강철 판으로 되어 있으며, 여섯 달 동안 매일 밤 그 표면에 피를 발랐다.` Preserve the following worn-Fae-spiral and blood-drinking details. | High |
| `16404` | Naturalness | Korean `불로 불을 다스릴 때야` is understandable but less idiomatic than the English expression `fight fire with fire`. Consider `흔히 하는 말처럼, 이제 불에는 불로 맞서야 해.` | Medium-high |
| `16414` | Naturalness / name clarity | `Three Swords` is a named Varani blademaster, but repeating the literal Korean `세 자루의 검` for both the person and his blades can make the sentence read as a count of swords. After naming him, refer to `그의 전설적인 검날` and avoid repeating the translated name. | Medium-high |
| `16461` | Meaning / naturalness | English describes a projection of the Fae maiden while she dreams. `꿈꾸는 그녀가 투영한 환영` can make her sound like the one actively projecting it. Consider `우리가 대화하는 건 꿈꾸는 그녀의 투영체인 것 같아.` | Medium |

## Existing Candidates Rechecked

- `16301`: retain the SQ122 navigation candidate. English and Japanese place
  the posted guards at the Watch; Korean currently places them at the market.
- `16368`: retain the naturalness candidate for the literal `시간과 자원`;
  `시간과 여건` better fits the offer.
- `16391`: retain the register-consistency candidate within the sentence.
- `16443`: retain the naturalness candidate concerning the stone's solitary
  presence in the wilderness.
- `16452`: retain the `Notices of Duty` terminology candidate; the established
  military item term is `복무 소집 통지서`.
- `16478`: retain the terminology candidate, but resolve the earlier
  conflicting recommendation in favor of `패스팅(Fastings)`. English ID
  `54487` defines Fastings as the Dverga-built bunker/tunnel network, and
  IDs `5728`, `6372`, `6650`, and `13930` refer to that same network. The
  lowercase uses do not establish a different feature. The asset-specific
  proposal to use only `지하 통로` is superseded by this corpus-wide term
  check; this remains a proposal, not a CSV edit.

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `16263` | Meaning | The verse's light, souls, well, flowing pattern, and moving balance are cryptic; Japanese and Chinese also diverge. Korean preserves the images and paragraph layout. Retain provisionally rather than inventing a reading. |
| `16271` | Meaning / name | `Ohn's Stand` is rendered as a `거점` in Korean, a fortress in Japanese, and a castle in Chinese. The label does not identify the place type. |
| `16305` | Meaning / UI context | `GRAND HP GRUNT` may be an internal/test label or displayed enemy name. English and Japanese retain it, while Chinese interprets it. Do not normalize `HP` or expand the label without display context. |
| `16310` | Meaning / UI context | `The Midden` may be a proper name, creature term, or internal label; Japanese transliterates it and Chinese interprets it. Retain the current bilingual form pending context. |
| `16311` | Meaning / UI context | `Cthongeny: Atlasus` is transliterated in Japanese, while Chinese treats it as a creature/category label. The isolated string does not establish whether it is a name or test label. |
| `16318` | Speech level | English is neutral, Japanese uses plain speech, and Korean is polite. With no per-key speaker/addressee mapping, retain the polite service phrasing provisionally. |
| `16337` | Meaning / terminology | `Flame Locus` is rendered as a land of flame in Japanese, a flame trail in Chinese, and a focus area in Korean. The isolated label does not settle whether `Locus` is a place or magical node. |
| `16344` | Meaning / name | `The Fahrlangi` may be a people, religious group, or named order; Japanese transliterates it and Chinese reads it as adherents. Retain `파를랑기(Fahrlangi)` provisionally. |
| `16399` | Meaning / UI context | `Pillars` is rendered as a canopy/crown in Japanese and pillars in Chinese and Korean. The isolated label does not identify the referent. |
| `16444` | Meaning / place type | `Spawning Pools` may be a literal breeding area or named location. Japanese, Chinese, and Korean use different readings; retain the literal Korean provisionally. |
| `16451` | Meaning / name | The English label `Tester Barclay` conflicts with Japanese `Kester Barclay`; Chinese also treats `Tester` as a role. The row alone cannot determine whether this is a name, title, or source anomaly. |
| `16499` | Meaning / format | The source is an unfinished-looking verse ending in a comma, and the subject of `goes unseen` is unclear. Korean preserves the King/Queen/Grim sequence; retain without inventing a subject or completing the verse. |

## Existing Findings Retained

- Existing uncertain findings at `16290`, `16437`, and `16460` remain
  evidence-limited: an isolated register contrast, a Japanese/Korean register
  difference without a mapped speaker, and an unresolved referent,
  respectively.
- The current `16395` already renders `company` as companionship (`말벗`);
  the preliminary concern that it added a home/location is cleared.
- The current `16494` already uses `사역마 강화`, not the earlier
  preliminary `친숙도 업그레이드`; that concern is cleared.
- ID `16300` correctly keeps `Traveler` singular because English says
  `a Traveler's base`; this is not the collective faction label used at
  `16371`.
- Corpus context supports `Pryderi` as Rathir's market district, so the
  wording at `16264` is retained. The established familiar-address rendering
  `dove` -> `친구` supports `16400`; neither is reopened.
- The source-language test label `FAIL LINE` at `16425` is retained because
  Korean matches English and Japanese. Chinese localization alone does not
  establish that the English label should be translated.

## Duplicate and Structural Checks

- All 250 IDs are present in identical order in the four language tables.
- Sixty-five exact-English duplicate groups touch this range, covering 1,301
  corpus rows. Korean wording matches within every group.
- Logical line-break counts and normalized runtime/layout-marker signatures
  match across all four languages. ID `16417` uses localized warning text
  (`[DO NOT USE]` / `使用不可` / `不可用` / `사용 금지`); this is not treated
  as a missing runtime token.
- Six Korean strings contain 27 existing embedded CRLF breaks:
  `16261` (2), `16263` (3), `16291` (5), `16448` (8), `16453` (3), and
  `16477` (6). These breaks were preserved.
- Of the 180 new IDs, 127 have indexed quest-asset links and 53 do not.
  Three IDs (`16412`, `16436`, and `16456`) link to multiple assets. Exact
  key matches and asset membership do not establish per-key speakers,
  handlers, branches, addressees, or playback order.

The ledger now contains 29,214 of 65,135 IDs (44.85%), leaving 35,921
unreviewed. Four-language fingerprints and per-ID dispositions are recorded
in [`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
