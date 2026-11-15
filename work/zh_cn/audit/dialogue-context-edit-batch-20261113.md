# Dialogue Context Review: First Translation Edit Batch

- Date: 2026-11-13.
- Scope: review existing phase-4 findings against the current English,
  Japanese, Chinese, and Korean rows before applying targeted edits.
- The previous phase-4 reports are the initial review; decisions below are a
  separate source-based adjudication. No speaker or playback order is inferred.
- Historical ledger dispositions are retained as review-time records. Only
  the fingerprints for actually edited rows are refreshed, following the
  previous Litany and Amphora edit procedure; this addendum records the
  superseding decisions and previous Korean text.

## Accepted

| ID | Current Korean | Approved Korean | Evidence and decision |
| ---: | --- | --- | --- |
| 95 | 내 연구 성과 앞에서는 휴그(Hugues)의 결함투성이 발견쯤은 빛을 잃겠죠. 그가 노력해서 얻은 게 뭐죠? 위대한 인물이라도 된 듯 망상에 빠진 되살아난 시체 하나잖아요. | 내 연구 성과 앞에서는 휴그(Hugues)의 결함투성이 발견쯤은 빛을 잃겠죠. 그가 노력해서 얻은 게 뭐죠? 과대망상에 빠진 되살아난 시체 하나잖아요. | English says a reanimated corpse with delusions of grandeur. Simplify the Korean without resolving the existing speech-level hold: Japanese is casual, but the speaker and situation are unconfirmed. High confidence for the scoped naturalness change. |
| 221 | 여름 궁정(Court of Summer)이 속국의 왕의 충성을 사려고 보낸 선물이야. 운시엘리(Unseelie) 장인들이 볼간(Bolgan) 양식으로 새겼지. | 여름 궁정(Court of Summer)이 속국 왕의 충성을 사려고 보낸 선물이야. 운시엘리(Unseelie) 장인들이 볼간(Bolgan) 양식으로 새겼지. | English says a Court of Summer gift to purchase the loyalty of a client king. Remove the awkward repeated possessive without changing the purchase metaphor or existing terms. High confidence. |
| 243 | 마을 사람들은 귀신이 나온다고 믿지만, 난 그게 레드 리전(Red Legion)이 꾸민 계략인 것 같아. 이 사람들을 겁줘서 굴복시키려는 거지. 실제로 효과를 보고 있고. | 마을 사람들은 귀신이 나온다고 믿지만, 난 그게 레드 리전(Red Legion)이 꾸민 계략인 것 같아. 이 사람들을 겁줘서 굴복시키려는 거지. 실제로 효과를 보고 있어. | English concludes “And it's working”; Japanese and Chinese likewise indicate the plan is succeeding. Finish the Korean sentence naturally while retaining its plain register. High confidence. |
| 64706 | 내가 좋아하는 투사들, 보스 디비언트(Voss Deviant), 어니언스킨(Onionskin), 더 헥스(The Hex)를 가까이서 보려고 이번 시즌 순회 공연에 참가했어. | 내가 좋아하는 투사들, 보스 디비언트(Voss Deviant), 어니언스킨(Onionskin), 더 헥스(The Hex)를 가까이서 보려고 이번 시즌 투어에 참가했어. | English and Japanese say this season's tour, not a performance. Chinese describes a competition circuit; the associated arena asset supports the context but does not identify the speaker or dialogue node. The neutral `투어` avoids adding an unsupported event type. High confidence. |

All four IDs have unique exact English source strings. The changes preserve
the existing name annotations, speech levels, single-line format and lack of
runtime markers.

## Held Or Retained

| ID | Decision | Reason |
| ---: | --- | --- |
| 239 | Not an issue | `가 줄 생각이라면` is understandable and preserves the conditional offer. A stylistic preference alone does not require replacing it. |
| 64412 | Uncertain | English `Damn scavengers` could refer to different people or creatures in context; Japanese recasts the collection as scavenging rather than identifying the same referent. `약탈자들` may overstate the meaning, but the precise replacement is not established. Retain pending stronger context. |

## Verification

- Compared the saved CSV with the pre-edit snapshot: exactly `95`, `221`,
  `243`, and `64706` changed; all 65,135 IDs and their order are unchanged.
- UTF-8 BOM and the existing mixed newline counts were preserved: 71,846
  CRLF and 244 LF-only both before and after.
- The four-language ledger check passed for 65,135 IDs, and the index and
  both catalogs passed reproducibility checks. The CSV preservation helper
  passed 11 tests, the context index passed nine tests, and the CRLF-aware
  `git diff --check` passed.
- The prior ledger fingerprints are retained here for history:
  `95`: `4d13d12964a8087de84c34c0bc757749a3fb49d3d39faf78224f0003ddfe16a2`;
  `221`: `a114fbf6ad949b368a9dec789b6538eb4edd1e00d8785599db6ed989caf6bc7a`;
  `243`: `b6be58c7b6a39dc6c55b041bb8871f45c9da380ce5a9275680afb94961322ad7`;
  `64706`: `ef3560c6d3ab86a9366012bee7916564e9ee0a1678d4fabcfc61b054feda10f6`.
- The editor's verification above is not an independent verifier pass. Other
  review findings and unresolved speech-level/context holds remain open.

## Continued Adjudication

After the first application, the source was rechecked for additional
candidate rows in the same reviewed ranges and for exact repeated English
text. The following source-supported corrections were applied:

| ID(s) | Decision |
| --- | --- |
| `64054` | Removed an unsupported honorific shift in a teasing, conversational line; kept the whole Korean line conversational. |
| `64074` | Replaced the awkward `마법 에너지의 힘인 소로우` with the established `마법 에너지인 비탄의 힘(Sorrows)`, preserving the distinction from the House of Sorrows. |
| `64110` | Replaced the unnatural passive `찾히고 싶지 않은` with `모습을 드러내기 싫은` and made the informal endings consistent. |
| `64193` | Corrected the English-source typo `Dierdre` to the established character name `Deirdre`, consistent with this quest's other rows. |
| `64240` | Changed `권위(Authority)` to the established divine name `권능(Authority)`, as in epitaph `6908`. |
| `7589`, `15148`, `19510`, `21922`, `54076`, `64167`, `64664` | Aligned the exact repeated Khamazandu offer sentence to `... 내가 이 세상에서 자신의 뜻을 이루는 도구가 되어 준다면 선물을 주겠다고 제안했다.`; each row's distinct quest progress after that sentence was preserved. |
| `13502`, `14231`, `20428`, `24993`, `41271`, `64234`, `65048` | Applied the context-checked `master-at-arms` form `무기 교관`, consistent with the role described as training fighters at `13436`. |

`239` remains unchanged because its conditional offer is understandable.
`64085` already renders `clan` as `씨족`; `our people` is not the same English
term and was not changed to force a match. `64412` remains on hold because
`scavengers` does not identify a sufficiently clear referent for a precise
Korean replacement. These decisions do not infer speakers from asset links.

The total number of distinct IDs changed in this edit batch is now 23. The
larger candidate inventory remains in progress; this total is not a claim
that all ledger candidates have been adjudicated.

### Sequential Candidate Batches `250`-`999`

| ID | Decision |
| ---: | --- |
| `320` | Reflowed the Webwood poem from seven Korean lines to the six-line source structure; moved `너를 붙들지` onto the preceding line without changing the poem's wording otherwise. |
| `333` | Replaced `강건하기를` with `힘이 다하지 않기를` to express the source wish that the Beckoned's might endure. |
| `358` | Removed the unsupported claim that the woman lives in Cape Solace; the Korean now locates the monetary dispute there. |
| `483` | Replaced the unsupported `불명예 제대한` with `불명예를 입은`; made the self-narration consistent with the source's plain conversational style. |
| `642` | Retained. Korean's `민감한 상품` preserves the English/Chinese peek-at-sensitive-goods joke; Japanese omits the joke but does not establish a contrary meaning. No clear defect remains. |
| `806` | Changed `마음만은 고맙네` to `마음씨는 좋네`, preserving the source's praise of the person's good intentions rather than thanking them for the gesture. |
| `948` | Added the established English pairing: `로어스톤(Lorestone)`. |
| `952` | Added `Children of Dust` to the first occurrence, preserving the poem's existing four-line layout and all other wording. |
| `981` | Replaced `얼빠진` with `칠칠맞지 못한`; Japanese and Chinese describe slovenliness/carelessness, not foolishness. |

These nine candidate IDs were checked in the cited range reports and against
all four current language rows; eight cells were changed and one was retained.
The cumulative number of distinct changed IDs in this edit batch is 31.

### Sequential Candidate Batches `1000`-`1999`

The four range reports contain 51 candidates. Source-based adjudication
accepted and corrected 45 candidates:

`1002`, `1018`, `1041`, `1061`, `1137`, `1139`, `1151`, `1214`, `1282`,
`1293`, `1316`, `1325`, `1349`, `1360`, `1370`, `1376`, `1379`, `1389`,
`1444`, `1467`, `1496`, `1498`, `1519`, `1534`, `1553`, `1560`, `1572`,
`1580`, `1590`, `1671`, `1686`, `1695`, `1697`, `1711`, `1721`, `1739`,
`1784`, `1791`, `1806`, `1860`, `1865`, `1893`, `1909`, `1936`, `1988`.

Four candidates were retained because they were already correct or the
proposed change was not warranted: `1234` already includes `Ivan Hugues`;
`1490` preserves the source meaning and is natural; `1723` already includes
`Circle of Therosin`; and the six card names at `1866` were already made
consistent. `1046` and `1492` remain on hold because the poetic meaning and
the archery sense of “supple overdraw” are not established. Repeated-source
and term-group checks, including all 19 `Maire, Queen of Cups` copies and the
Lykeios academic title, expanded the batch to 70 changed rows. Existing
sentences and distinct quest progress were preserved when harmonizing exact
repeated text.

### Sequential Candidate Batches `2000`-`2999`

The four range reports contain 33 candidates. Each candidate was rechecked
against its current English, Japanese, Chinese, and Korean row before
application; speaker or playback order was not inferred from asset links.

| ID(s) | Decision |
| --- | --- |
| `2005` | Replaced the unnatural loanword `태피스트리` with `실타래`, retaining the fate-weaving metaphor. |
| `2018`, `2121`, `2272`, `2365`, `2429`, `2504`, `2512`, `2558`, `2561`, `2688`, `2703`, `2723`, `2820`, `2871` | Added or completed English pairing for the full named item, title, place, or signature; `2429` also restores the comparison expressed by “As.” |
| `2202`, `7404` | Completed the English title pairing `The Maid of Windemere`; both exact-English poem copies were updated identically. |
| `2220` | Recast the awkward “칼과 화살에 맞지 않은 게” phrase as escaping the threat of blades and arrows. |
| `2224` | Restored the sea's personified “breast” as `출렁이는 바다의 가슴`. |
| `2303`, `19738`, `35729`, `36663`, `40536`, `51266`, `52913`, `61566`, `64889` | Reviewed the related place-name set. Standardized `Warden's Bridge` as `워든스 브리지(Warden's Bridge)` and separately paired the source's `Warden Bridge` at `19738`. Existing complete forms at `9230` and `11951` were retained. |
| `2345` | Retained all 20 exact-English copies: the current Korean already pairs `King of Cups` and `Irion` in every row, superseding the stale candidate note. |
| `2372`, `42957` | Removed the extra Korean verse break so both exact-English copies follow the five-line source structure. |
| `2611` | Corrected the awkward resistance construction to `해당 피해 유형에 대한 저항이 있습니다`, preserving the display marker. |
| `2639` | Rewrote the hearsay so the Hierophant clearly makes Grim Onwig regret the coup; kept the existing conversational register. |
| `2647`, `1498`, `10181`, `12473`, `14938`, `37666` | Standardized the urban venue as `챔피언의 저택(Champion's Manor)` across the complete six-ID source set. |
| `2665` | Retained: `울프(Wulf)` is already paired correctly. |
| `2682` | Replaced the redundant `명장 대장장이` with `명장급 대장장이`. |
| `2716`, `1793`, `2304`, `2386`, `29528`, `32025`, `35000`, `42925` | Added the full English plant name on first mention where missing, and corrected the singular English parenthetical at `1793`; already paired rows `61507` and `63622` were retained. |
| `2799` | Matched the established `base:587` wording `표식 없는 무덤`. |
| `2846` | Corrected “imbued with” from an inherited quality to indifference that is imbued in the subject, and completed the `Archsage Caledus` pairing. |
| `2853` | Naturalized the slider label as `수염자국 농도`. |
| `2959` | Recast the discount as the speaker's offered reward and kept the Korean line conversational. |
| `2999` | Replaced the stiff `전문 자연 안내인` with the natural `제대로 된 자연 안내자`. |
| `2030` | Retained both exact-English copies (`2030`, `57861`): `페이트위버(Fateweaver)` is already paired and agrees with the established term. |

The 33 candidate IDs resolve to 30 accepted corrections and three retained
findings (`2030`, `2345`, and `2665`). Exact-duplicate and terminology-group
review expands the accepted corrections to 52 edited rows. The
ID-targeted application manifest is
[`dialogue-context-edit-batch-20261113-2000-2999.json`](dialogue-context-edit-batch-20261113-2000-2999.json).

The 52 rows were applied sequentially through
`tools/replace_text_preserve_eol.py`, after verifying the manifest's
pre-edit CSV SHA-256 and every unique target fragment. The helper regression
suite passed all 11 tests. The active CSV retains its UTF-8 BOM; its current
newline inventory is 71,843 CRLF and 244 LF-only. The two removed poem breaks
account for the intended line-count change; all other targeted strings retain
their original layout. Fingerprints for all edited rows are refreshed only
after the saved translations are rechecked against the four language tables.

### Sequential Candidate Batches `3000`-`3999`

The four range reports contain 36 correction candidates. All 36 were
rechecked against the current English, Japanese, Chinese, and Korean rows and
accepted; evidence-limited holds were left unchanged. The source-based
decisions are summarized in
[`dialogue-context-edit-batch-20261113-3000-3999.md`](dialogue-context-edit-batch-20261113-3000-3999.md).
Related full-corpus checks standardized `Activity` labels, `Living Quarters`,
standalone `Entry` headings, the `Longlegs` epithet, Upgrade display labels,
plural `Oracles`, and the Maid's true Champion title. The exact-English
confession copies at `3330` and `25915` were kept identical and aligned to
the five-line source layout.

The batch changed 98 unique Korean rows, applied sequentially through
`tools/replace_text_preserve_eol.py` from the ID-scoped manifest. The
65,135-row ledger's fingerprints for exactly these 98 IDs were refreshed.
Ledger validation, all index/catalog reproducibility checks, nine
context-index tests, 11 CSV-preservation tests, and the CRLF-aware diff check
passed. The CSV has 71,845 CRLF and 244 LF-only record endings; two added
CRLF separators reflect the source-aligned break in each duplicated
confession.

### Sequential Candidate Batch `4000`-`4999`

The four range reports contain 12 correction candidates. All 12 were
rechecked against the current four-language rows and corrected. Related
source review aligned the `Main Hall` label across three Scholia Arcana
references, matched the duplicate poem at `4768` and `50357`, and corrected
seven references to the magical force `the Sorrows` without conflating it
with the `House of Sorrows`. Evidence-limited candidates remain unchanged.

The batch changed 22 unique Korean rows through the ID-targeted preservation
tool. The exact edits and their pre-edit CSV SHA-256 are recorded in
[`dialogue-context-edit-batch-20261113-4000-4999.json`](dialogue-context-edit-batch-20261113-4000-4999.json);
the source decisions and checks are summarized in
[`dialogue-context-edit-batch-20261113-4000-4999.md`](dialogue-context-edit-batch-20261113-4000-4999.md).
Ledger fingerprints were refreshed only for those 22 IDs. Candidate
adjudication now reaches 145 IDs (about 4.6% of the approximately 3,155
candidate inventory); this is not a claim that remaining candidates have
been resolved. The next sequential range is `5000`-`5999`.

### Sequential Candidate Batch `5000`-`5999`

The four range reports contain 20 correction candidates. All 20 were
rechecked against current four-language rows and corrected. The full-corpus
terminology check also aligned the `Side Quests` category at ID `56687` with
the established `부가 퀘스트` form used at `5705` and `52930`; other
unsettled category names at `56687` were left unchanged.

The batch changed 21 unique Korean rows through the ID-targeted preservation
tool. Exact edits and the pre-edit CSV SHA-256 are recorded in
[`dialogue-context-edit-batch-20261113-5000-5999.json`](dialogue-context-edit-batch-20261113-5000-5999.json);
source decisions are summarized in
[`dialogue-context-edit-batch-20261113-5000-5999.md`](dialogue-context-edit-batch-20261113-5000-5999.md).
Ledger fingerprints were refreshed only for those 21 IDs. Candidate
adjudication now reaches 165 IDs (about 5.2% of the approximately 3,155
candidate inventory); remaining candidates are still in progress. The next
sequential range is `6000`-`6999`.

The 65,135-row ledger validation, index/catalog reproducibility checks, all
nine context-index tests, all 11 CSV-preservation tests, and the CRLF-aware
diff check passed for the `5000`-`5999` batch. The active CSV retains its BOM
and 71,845 CRLF / 244 LF-only newline inventory.

### Sequential Candidate Batch `6000`-`6999`

The four range reports contain 45 correction candidates. After checking the
current English, Japanese, Chinese, and Korean rows, 39 candidate decisions
were applied and six retained because the affected row was already correct,
already consistent across its exact-English group, or supported by the
current terminology. Eleven evidence-limited holds remain unchanged.

The batch changed 76 unique Korean rows, including all 26 exact copies of
`Argine, Queen of Staves`; the four references to the named gambling venue
`The Den`; all 10 standalone `Mayor Eswin` labels; and both
`God Under the Mountain` copies. The full list of decisions and the
ID-scoped edits are recorded in
[`dialogue-context-edit-batch-20261113-6000-6999.md`](dialogue-context-edit-batch-20261113-6000-6999.md)
and
[`dialogue-context-edit-batch-20261113-6000-6999.json`](dialogue-context-edit-batch-20261113-6000-6999.json).
Ledger fingerprints were refreshed only for the 76 edited IDs.

The 65,135-ID ledger validation, index/catalog reproducibility checks, all
20 CSV and context-index regression tests, and CRLF-aware diff check passed.
The active CSV retains its UTF-8 BOM, 65,135 rows, 71,845 CRLF, and 244
LF-only endings. Candidate adjudication now reaches 204 IDs (about 6.5% of
the approximately 3,155-candidate inventory); this is not full resolution.
The next sequential range is `7000`-`7999`.

### Sequential Candidate Batch `7000`-`7999`

The four range reports contain 42 correction candidates. After checking the
current four-language rows, 35 were corrected, four were retained because
the wording was already correct or supported by established terminology,
and three remain on hold for insufficient source evidence. The existing
format follow-up at `7141` and source-supported duplicate and terminology
checks expanded the batch to 60 unique edited IDs. These include all 19 exact
copies of `Maire, Queen of Cups`, all four `Ballads Library` labels, the
paired `Golden Age Alchemy` shop references, and the exact Hallam sentence
at `7733`/`8516`. The exact-English mismatch at `7332`/`11660` was also
resolved after confirming all four language rows match.

The source decisions are recorded in
[`dialogue-context-edit-batch-20261113-7000-7999.md`](dialogue-context-edit-batch-20261113-7000-7999.md);
the ID-scoped edits and pre/post CSV hashes are in
[`dialogue-context-edit-batch-20261113-7000-7999.json`](dialogue-context-edit-batch-20261113-7000-7999.json).
Ledger fingerprints were refreshed for exactly the 60 edited IDs. The
65,135-ID ledger validation, index and catalog reproducibility checks, all
20 CSV-preservation and context-index tests, exact-English duplicate checks,
and CRLF-aware diff check passed. The active CSV retains its BOM, 65,135
rows, 71,845 CRLF, and 244 LF-only endings.

Candidate adjudication now reaches 246 IDs (about 7.8% of the approximately
3,155-candidate inventory). The next sequential range is `8000`-`8999`.

### Sequential Candidate Batch `8000`-`8999`

The four revalidation reports contain 46 correction candidates. Source-based
adjudication corrected 42, recognized three as already resolved by earlier
edits (`8190`, `8516`, and `8663`), and held `8992` because the English and
Japanese give different evaluative nuances without enough context to settle
them.

The batch changed 59 unique Korean rows, including related terminology and
repeated-text rows outside the numeric range. The reviewed groups include
`Victor's Brew`, `Lord of the Chase`, `Acathan`, the deadly Headhunter
descriptions, `Marten Strand`, and `Long Winter`. The seven-paragraph
Skratta history and the Nix poem were checked as complete texts; existing
paragraph and line-break structure was retained.

The decisions and verification are recorded in
[`dialogue-context-edit-batch-20261113-8000-8999.md`](dialogue-context-edit-batch-20261113-8000-8999.md).
The CSV retains its UTF-8 BOM, 65,135 rows, and the established newline
inventory of 71,845 CRLF and 244 LF-only endings. The saved CSV SHA-256 is
`b5d36d211ba22d30918aee19644cc6a328e2ae2f18d6976cc88a10f48bf5e9a9`.
Ledger and duplicate checks, index/catalog reproducibility, related tests,
and the CRLF-aware diff check passed.

Candidate adjudication reached 354 IDs (about 11.2% of approximately 3,155).
The next sequential candidate range is `10000`-`10999`.

### Sequential Candidate Batch `9000`-`9999`

The four revalidation reports contained 62 correction candidates. Source-based
adjudication accepted 58 for correction and retained four because the proposed
pairing was already present (`9304`, `9627`, `9691`, and `9721`).

The range changed 80 unique Korean rows through 73 manifest rules and 96
ID-scoped applications, including exact-English copies outside the numeric
range. Full-text English/Japanese checks corrected misassigned proposed edits
between the separate `9342` hammer instructions and `9405` Aodh history
before application. One unrelated manifest proposal was discarded, and the
existing paragraph, poem, and token structure was retained.

The decisions, manifests, and verification are recorded in
[`dialogue-context-edit-batch-20261113-9000-9999.md`](dialogue-context-edit-batch-20261113-9000-9999.md)
and
[`dialogue-context-edit-batch-20261113-9000-9999.json`](dialogue-context-edit-batch-20261113-9000-9999.json).
The ledger, index/catalog reproducibility, 20 focused tests, duplicate-group
checks, and CRLF-aware diff check passed. The CSV retains its BOM and the
established 71,845 CRLF / 244 LF-only inventory.

### Sequential Candidate Batch `10000`-`10999`

The four revalidation reports contained 51 new correction candidates. All 51
were re-adjudicated against the current four-language rows and their
source-supported corrections applied. The previously recorded `10945`
Ticneri pairing was also completed without recounting it as a new candidate.

The manifest contains 68 fragment rules and 72 ID-scoped applications across
59 unique rows: 52 in-range IDs and seven related occurrences outside the
range. These include consistent pairings for Order of the Ash, Turner's
Finest, Rathir Harbor, Order of Mitharu, and Arcane Carrack. Evidence-limited
findings remain held rather than guessed.

The active CSV already contained the full application on resumption. Reversing
the 72 manifest operations in memory restored its exact recorded input hash,
so no edits were reapplied. The 59 affected rows retained their line-break
and runtime/display-token signatures. Ledger fingerprints, index/catalog
reproducibility, nine context-index tests, 11 CSV-preservation tests, and the
CRLF-aware diff check passed. The saved CSV hash is
`d443457688afd35b7473def0af5e97ba37eea35f4cb53ab342d218d650ec55f4`;
the ledger hash is
`8f08f24dcebc159c9deb33cd3cdc238a6fafb7125dc2298e6e010410c1f3eba5`.
See the [range report](dialogue-context-edit-batch-20261113-10000-10999.md)
and [application manifest](dialogue-context-edit-batch-20261113-10000-10999.json).

Candidate adjudication now reaches 405 of approximately 3,155 (about 12.8%).
The next sequential candidate range is `11000`-`11999`.

### Sequential Candidate Batch `11000`-`11999`

The four revalidation reports contained 17 new correction candidates; all
were rechecked against the four language rows and corrected where supported.
The batch applied 21 ID-scoped operations to 19 unique rows, including
directly related Epic Gem labels at `167` and `38457`. It aligned the two
mining terms in `11599` with their existing uses at `19029` and `14767`;
other specialized mining terms remain unresolved rather than guessed.

The official Korean manual supports `시약` for alchemical reagents and
`에픽 보석` for Epic Gems. `Curseeker` at `11907` was corrected to the
established `Cureseeker` form. The CSV was changed only through the guarded
preservation tool; the 19 changed rows preserve their source line-break and
token structure. The manifest reverse-restores its exact input hash.
Ledger/index/catalog checks, nine context-index tests, 11 CSV-preservation
tests, and the CRLF-aware diff check passed. See the
[range report](dialogue-context-edit-batch-20261113-11000-11999.md) and
[manifest](dialogue-context-edit-batch-20261113-11000-11999.json).

Candidate adjudication now reaches 422 of approximately 3,155 (about 13.4%).
The `12000`-`12999` batch adjudicated all 35 candidate IDs: 34 received
source-supported corrections, while `12766` was already resolved in the
active CSV. It applied 80 guarded operations to 79 unique rows, including
linked groups for all 20 `Irion, King of Cups` labels, nine `Hermit Smith`
references, 14 Testament references, five `Ordination Tome` references, and
three `Ambassador Kulder` rows. Evidence-limited findings remain unresolved.
The CSV retains its BOM, 65,135 rows, and 71,845 CRLF / 244 LF-only endings.
The ledger was refreshed only for edited rows. Ledger/index/catalog checks,
nine context-index tests, 11 CSV-preservation tests, and the CRLF-aware diff
check passed. See the
[range report](dialogue-context-edit-batch-20261113-12000-12999.md) and
[manifest](dialogue-context-edit-batch-20261113-12000-12999.json).

Candidate adjudication now covers 457 of approximately 3,155 (about 14.5%).
The `13000`-`13999` batch adjudicated all 37 candidates: 33 were corrected,
three were already resolved, and one was retained. It applied 115 guarded
fragment operations to 112 unique rows, including linked name and
terminology groups. Evidence-limited findings remain held. The CSV and
four-language ledger retain their structure and line endings; the ledger
fingerprint check, index/catalog checks, 11 preservation tests, and
CRLF-aware diff check passed. Candidate adjudication now covers 494 of
approximately 3,155 (about 15.7%). See the
[range report](dialogue-context-edit-batch-20261113-13000-13999.md) and
[manifest](dialogue-context-edit-batch-20261113-13000-13999.json).

The `14000`-`14999` batch adjudicated all 59 candidates: 50 received
source-supported corrections, seven were already resolved, one was retained,
and one remains held. It applied 98 guarded text-fragment operations to 90
unique IDs, including documented nearby name and terminology groups. The
manifest reverse-restores the exact input CSV hash. The CSV retains its BOM,
65,135 ordered rows, and 71,845 CRLF / 244 LF-only endings; only the 90 edited
row fingerprints were refreshed. Ledger/index/catalog checks, nine context
index tests, 11 CSV-preservation tests, reverse-patch verification, and the
CRLF-aware diff check passed. Candidate adjudication now covers 544 of
approximately 3,155 (about 17.2%). See the
[range report](dialogue-context-edit-batch-20261113-14000-14999.md) and
[manifest](dialogue-context-edit-batch-20261113-14000-14999.json).

The `15000`-`15999` batch adjudicated all 56 candidates: 50 received
source-supported corrections, four were already resolved, and two were
retained. It applied 103 guarded text operations to 98 unique IDs. Reversing
the manifest restores its exact input CSV hash; the output CSV and ledger
hashes are recorded in the
[range report](dialogue-context-edit-batch-20261113-15000-15999.md) and
[manifest](dialogue-context-edit-batch-20261113-15000-15999.json).

The `16000`-`16999` batch adjudicated all 36 current candidates: 30 were
corrected, three were already resolved, and three were retained. It applied
50 guarded operations to 49 unique rows, including the SQ122 Notices of Duty
and Officer's Hall terminology, six Cliffbreak Fasting references, the
exact-English Carver poem, and standalone Chosen title pairings. The ledger,
index/catalog reproduction, 11 preservation tests, nine context-index tests,
CSV row order, embedded line breaks, tokens, and CRLF-aware diff check passed.
Reversing the manifest and restoring the original unquoted representation
for ID `16927` reproduces the exact input CSV hash; the active CSV correctly
quotes that field because the English name contains quotation marks. See the
[range report](dialogue-context-edit-batch-20261113-16000-16999.md) and
[manifest](dialogue-context-edit-batch-20261113-16000-16999.json).

Candidate adjudication now covers 636 of approximately 3,155 (about 20.2%).
The next sequential candidate range is `17000`-`17999`.
