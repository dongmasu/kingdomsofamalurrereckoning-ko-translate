# Sequential `default` Revalidation: IDs `41500`-`41749`

- Date: 2026-11-12.
- Compared all 250 current rows across English, Japanese, Chinese, and Korean.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 67 existing ledger records and added 183 newly reviewed IDs.
- Recorded 11 correction candidates and one evidence-limited hold. The other
  238 IDs have no supported finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. The ledger has no separate terminology dimension, so terminology
findings are recorded under `meaning`.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `41525` | Meaning / naturalness | `이중 장갑` can read as “double gloves” or as an unclear armor construction. The source says the armor is double-plated and double-enchanted. Name the two layers of plating and two applications of enchantment explicitly, without changing the resized-for-mortals detail. | Medium-high |
| `41533` | Objective / full-name format | `Sell Ratofer's Ring` is rendered `라토퍼의 반지(Ratofer's Ring) 판매`, separating the English possessive name from its Korean proper-name span. Prefer `라토퍼(Ratofer)의 반지 판매`. | High |
| `41545` | Address / naturalness | English uses the familiar endearment `dove`; `내 사랑` adds romantic intimacy not established by the source. The surrounding line is relieved and informal. Prefer the same-quest neutral address `친구`, e.g. `이런... 친구, 너였구나! 크릴가린(Crilgarin)이 널 보내다니 정말 다행이야.` | High |
| `41586` | Meaning / terminology | `Lorestones` is rendered `지식의 돌`, while the established project term is `로어스톤`. Prefer `남은 로어스톤 찾기`. | High |
| `41599` | Meaning | `나타나리라` adds the idea that a hero appears; the English says that a hero alone will stand between order and ruin. Prefer a prophecy that retains the barrier/sole-hero claim without adding an arrival, e.g. `미스로스(Mithros)의 눈 속에선 영웅만이 질서와 파멸 사이에 서게 될 것이다.` | Medium |
| `41650` | Meaning / naturalness | `픽을 풀어내다` is unclear in this context. English names the trapped lockpick, and Chinese supports retrieving it while Japanese says making it usable. Clarify that the Arrivus Engine is a means to free/retrieve the named Master's Pick, without implying that the Pick itself is a “pick” of unspecified type. | Medium-high |
| `41671` | Meaning / terminology | In the `SQ122` call-up-notice context, `What notices?` is rendered `무슨 공지야?`, which suggests a public announcement. Prefer `무슨 통지서야?`, consistent with the delivered `Notices of Duty` in this quest. | High |
| `41720` | Meaning | `the adoring girls` is generalized to `모두`, broadening the group who will hear the news and see him as a monster. Keep the reference to the women, e.g. `흠모하던 여자들이 이 소식을 들으면, 이제 날 괴물로 여기겠지.` | High |
| `41722` | Place-name format | The standalone location `Barter Row` is translated as `물물교환 거리` without its English name. Pair the place name, e.g. `물물교환 거리(Barter Row)`. | Medium-high |
| `41732` | Meaning | `Well, I am` explicitly affirms that she is an intellectual; the Korean moves from the beauty remark directly to becoming a summoner. Restore the self-correction, e.g. `뭐, 실제로 지식인이야. 소환사가 되려고 평생을 바쳤어.` | Medium |
| `41746` | Objective format | `Go to Adessa Mine` is rendered `아데사(Adessa) 광산으로 이동`, a fragment rather than the established action-label form. Prefer `아데사(Adessa) 광산으로 이동하기` or `아데사(Adessa) 광산으로 가기`. | High |

## Evidence-Limited Hold

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `41648` | UI terminology / text type | `Recipes` is rendered `조리법`. Japanese `レシピ` and Chinese `配方` support a general recipe/crafting label, but this isolated key does not establish whether the menu is specifically for cooking or covers alchemy/crafting. Keep the current wording provisional pending UI-context evidence rather than applying a blanket term. |

## Rechecked Findings

- Sixty-seven existing four-language fingerprints were checked. Candidates
  `41533`, `41545`, `41586`, `41650`, `41671`, and `41746` were rechecked and
  retained.
- The prior candidate at `41701` is released. Its source says Venris carried
  `the information`; it does not name a `reconnaissance report`, so the
  proposed replacement `정찰 보고서` is unsupported for this row. The
  Korean `정보` wording is retained.
- The old terminology prompt at `41531` is not promoted: the exact-English
  pair `2426`/`41531` has identical Korean, including `Child of the Dust`;
  the Japanese greeting differs, so no forced greeting change is warranted.
- Prior prompts at `41514`, `41538`, `41549`, `41669`, `41677`, `41695`,
  `41719`, `41734`, and `41744` were checked against the current rows and
  source evidence. They do not produce a new candidate: some already reflect
  accepted corrections, while the remaining differences are either supported
  by the English/Japanese context or lack a per-key speaker mapping.
- Sixty-seven exact-English duplicate groups (1,051 corpus rows) touch this
  range. Korean text matches within every group. Japanese differs within some
  groups, so matching English alone was not used to infer a common speaker or
  force changes.
- Six multiline rows contain 20 embedded Korean line breaks. All four
  languages have the same per-row line-break counts. Normalized runtime-token
  and markup signatures match across the range.
- Of 250 IDs, 201 have indexed asset associations; 134 of the 183 new ledger
  records are linked and 49 are not. Asset membership does not establish an
  individual speaker, branch, addressee, or playback order. Unsupported
  speaker attribution and dialogue order remain unknown.

## Range Result

- The range has 11 correction candidates, one evidence-limited hold, and 238
  IDs with no supported finding.
- The ledger covers 47,895 of 65,135 unique `default` IDs (73.53%), leaving
  17,240. Reviewed IDs with indexed asset links total 38,903; 8,992 have no
  indexed asset link. Sequential coverage reaches `41749`; next is
  `41750`-`41999`.
- Catalog reproducibility, all 47,895 four-language ledger fingerprints, nine
  related index tests, and the line-ending-aware diff check passed. Translation
  CSVs remain unchanged.
