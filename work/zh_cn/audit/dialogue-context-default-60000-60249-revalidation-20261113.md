# Sequential `default` Revalidation: IDs `60000`-`60249`

- Date: 2026-11-13.
- Compared all 250 active Korean rows against English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 58 pre-existing ledger fingerprints and preserved those rows.
  Appended the remaining 192 IDs in ascending order.
- Twelve new-row correction candidates and 15 new ledger holds are recorded.
  Three existing candidates and five prior `not-issue` rows were rechecked;
  five findings at existing IDs remain report-only, preserving their
  append-only ledger rows.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `60013` | Name / format | The standalone location label `Forge Hall` is only `대장간 전당`. Pair the complete name as `대장간 전당(Forge Hall)`. | Medium-high |
| `60016` | Format | The ability labels pair only Sorcery, while Might and Finesse lack English. Pair all three consistently as `힘(Might)`, `재주(Finesse)`, and `마법(Sorcery)`, preserving the existing display wrappers and layout token. | High |
| `60018` | Naturalness | `집단은 둘이야. 오래전에는 하나였지만` is stiff. Consider `둘로 나뉘어 있어. 예전에는 하나였지만, 오래전 일이야.` This keeps the source's generic `groups` without guessing their identity. | Medium |
| `60025` | Naturalness | `부디 값을 깎아 주게 해 줘` awkwardly phrases the discount offer. The plain conversational register is otherwise appropriate. Japanese explicitly asks to give a discount; consider `부디 할인 혜택을 받아 줘.` | High |
| `60061` | Name / format | The English label is `Witchknight Anira`, but the Korean parenthetical identifies only Anira. Use the established complete label `마녀 기사 아니라(Witchknight Anira)`. | High |
| `60089` | Naturalness | `결투의 조수` is an awkward calque for a dueling `second`; Japanese `介添人` supports an attendant who stands with the duelist. Consider `내 곁에서 결투를 거들어 줄 사람`. | Medium |
| `60101` | Meaning | `before he died` can attach to the Beckoned in the current sentence, while Japanese explicitly makes the Counsel the person who may die. Clarify the choice as finding the Counsel before the Counsel dies, e.g. `조언자(Counsel)가 죽기 전에 그를 찾을 것인가`. | Medium-high |
| `60112` | Name / format | The standalone ability title `Shock and Awe` is translated as `충격과 공포` without its English name. Consider `충격과 공포(Shock and Awe)`. | Medium |
| `60138` | Naturalness | `복합 시설` is a stiff, administrative-sounding rendering of the underground `complex`; Japanese describes it as ruins. Consider `하지만 땅 밑에 유적이 있을 줄은 몰랐지. 아무도 몰랐어.` | Medium |
| `60152` | Name / format | `아이텐(Ayten) 여관(Ayten's Inn)` repeats the inn's name in two parentheticals. Use the complete label once: `아이텐 여관(Ayten's Inn)`. | High |
| `60232` | Name / format | The standalone ability title `Skillful Defense` is only `능숙한 방어`. Pair it as `능숙한 방어(Skillful Defense)`. | Medium |
| `60237` | Title / format | The standalone title `A King's Mandate` is only `왕의 명령`. Pair the complete title as `왕의 명령(A King's Mandate)`. | Medium |

## Rechecked Existing Findings

These findings concern IDs already in the append-only ledger or covered by an
earlier review. Their existing ledger rows are unchanged.

| ID | Current finding and disposition |
| ---: | --- |
| `60012` | The spelling candidate remains supported. The NPC symbol and Japanese/Chinese references support `Idris Theonen`; the English key itself has the typo `Idiris`, which the Korean parenthetical currently repeats. Prefer `이드리스 테오넨(Idris Theonen)`. |
| `60037` | The transliteration candidate remains supported. English/Japanese identify Idris, while Korean `이디리스(Idris)` conflicts with the established `이드리스(Idris)` form. |
| `60104` | Reopened as an evidence-limited question: `Pteryx` is rendered as different creatures across locales. The prior ledger row remains unchanged; this concern is report-only. |
| `60105` | Reopened as an evidence-limited question: `raised Travelers` may mean faction upbringing or a life among Travelers. The prior ledger row remains unchanged; this concern is report-only. |
| `60108` | The earlier `not-issue` disposition is retained in its ledger row, but this pass found a report-only format issue: English says `Mountain Trolls Killed`, while Korean pairs singular `Mountain Troll`. Use the complete plural type `산악 트롤(Mountain Trolls) 처치`. |
| `60134` | The earlier `not-issue` disposition is retained in its ledger row, but this pass found a report-only meaning issue. `Move, move!` means hurry in this context; Japanese says `急げ！`. Prefer `서둘러, 서둘러!` over `비켜, 비켜!`. |
| `60185` | Reopened as an evidence-limited question: uppercase `Prompt` may be an input/UI label or encouragement. The prior ledger row remains unchanged; this concern is report-only. |
| `60188` | The charter terminology candidate remains supported by the grouped M0_SQ06 evidence: this is the same Ratofer family document rendered as `勅許状` across Japanese references, with established Korean `칙허장` elsewhere. Consider `라토퍼(Ratofer)의 칙허장 찾기`; do not overwrite the existing ledger row. |

## Rechecked without a New Finding

| ID | Finding |
| ---: | --- |
| `60229` | The Korean `비탄에 귀 기울이지 않아` preserves the English metaphor `deaf to the sorrows`; Japanese likewise describes being unable to hear sorrow, apart from one exception. No correction is supported. |

## Evidence-Limited Holds

| ID | Question and disposition |
| ---: | --- |
| `60056` | The betting rule is not settled: English and Chinese describe selecting a range for the roll, while Japanese specifies the total of the dice. Keep the current mechanics provisional. |
| `60058` | The capitalized `Maid` may be a title/name, and Japanese uses a different epithet. Preserve the current wording pending stronger naming/context evidence. |
| `60075` | `the key to the Sorrows` does not establish that `Sorrows` means the House. Japanese and Chinese also construe the referent differently; do not add or remove a House destination by guess. |
| `60084` | `Testament` conflicts with Japanese/Chinese covenant wording. The proper faction/path term is not established by this key alone. |
| `60104` | `Pteryx` is rendered as different creatures across locales. Keep the Korean creature name provisional. This is report-only because the ID already has a ledger row. |
| `60105` | `raised Travelers` may mean upbringing in the faction or a life among Travelers. Korean commits to one reading without enough evidence. This is report-only because the ID already has a ledger row. |
| `60106` | The status of `Faebourn`, `Children of Dust`, and the quoted stone inscriptions is unclear. Preserve the poem rather than assign unsupported formal-name readings. |
| `60132` | `Bisarane's pet mortal` may be deliberately demeaning, possessive, or affectionate. Korean softens this to `아끼는 필멸자`; the intended tone remains uncertain. |
| `60136` | The specialized roles `shaper` and `gnosticant`, and the metaphor `blinded by the darkness`, remain context-sensitive. Keep the current account provisional. |
| `60158` | `Dvergan` and `Undersea Fasting` terminology is not fully established. The current spelling and letter structure are retained pending stronger references. |
| `60169` | The source fragment `For 12 Rats tails` does not establish whether the tails are a price, barter, or requirement. Keep the incomplete exchange line unresolved. |
| `60174` | `Curate` may be a keep office; Japanese and Chinese suggest roles different from Korean `담당 사제`. Do not choose a title without clearer game context. |
| `60177` | `Woolstring` may be a material, maker, or named armor type. Korean `양모끈 갑옷` commits to a literal material reading that the sources do not settle. |
| `60182` | The syntax of the label `Cthongeny: Alcyon` may indicate a paired name, title, or identifier; locale evidence does not resolve it. |
| `60184` | Capitalized `Shade` may be a name/title rather than common-noun `그림자`. The alliance offer itself is preserved. |
| `60185` | Uppercase `Prompt` may be an input/UI label or encouragement; Japanese and Chinese differ, so `안내` remains provisional. This is report-only because the ID already has a ledger row. |
| `60189` | Uppercase `SCROLL` may name a mouse-wheel input or another UI action. Keep `스크롤` pending stronger UI evidence. |
| `60198` | The creature names differ across locales. Korean preserves the two enemy groups and immediate destruction objective without resolving their canonical names. |

## Repeated English and Structure

- Fifty-three exact-English duplicate groups across the corpus touch this
  range, comprising 1,147 rows; 57 IDs in the range participate. Korean
  wording is identical within every group.
- Ten rows contain embedded line breaks. The totals are 60/60/61/60 across
  English/Japanese/Chinese/Korean; Chinese alone has one extra break at
  `60101`, already present in its source. Korean matches English and Japanese.
- Runtime, display, and layout marker identities are preserved. At `60016`,
  Korean marker order matches English and Japanese; Chinese places `{3}`
  before the final ability display marker. The source-specific order is not
  normalized.
- Of 250 IDs, 188 have indexed asset associations, represented by 191 links
  across 123 assets; 62 have none. Of the 192 newly recorded IDs, 130 are
  linked through 132 links across 72 assets, and 62 are unlinked. Asset
  associations do not establish an individual speaker or playback order.

## Range Result

- All 58 pre-existing ledger rows remain unchanged; 192 new IDs are appended
  in ascending order. Twelve new-row candidates and 15 new ledger holds are
  recorded. Three existing candidates and five prior `not-issue` rows were
  rechecked; five findings remain report-only (two correction proposals and
  three evidence-limited questions).
- The ledger covers 61,560 of 65,135 unique `default` IDs (94.51%), leaving
  3,575 unrecorded. Sequential coverage reaches `60249`; next is
  `60250`-`60499`.
- Candidate findings are proposals, not approval to edit translation CSVs.
  No translation CSV was changed.

## Verification

- English, Japanese, Chinese, and Korean each contain IDs `60000`-`60249`
  once and in identical ascending order; each full `default` file contains
  65,135 records with matching key order.
- All 61,560 ledger fingerprints validate, including the 58 rechecked and
  192 newly appended rows.
- The regenerated quest-asset index and catalogs reproduce exactly; all
  nine related tests and the CRLF-aware audit diff check pass.
