# Quickling Consistency Review (2026-11-04)

## Scope and decision

- Built the occurrence list from the English `default` source, then matched each ID against Japanese, Chinese, and the active Korean CSV.
- Reviewed all 20 English occurrences: `1756`, `7116`, `19585`, `22409`, `34297`, `34323`, `35936`, `37469`, `40388`, `42257`, `42468`, `43780`, `47920`, `48474`, `53441`, `61082`, `61456`, `61777`, `63479`, and `64237`.
- Japanese renders many direct references as `命短き者` (“short-lived one”), while omitting the address in several rows; at `42257` it renders “the curious one” as `興味深き者`. Chinese usually transcribes the term and once uses “short-lived race.” In context, especially the contrast between quicklings, immortals, and young races, this is a Fae way to refer to mortal peoples by their brief lifespans, not a distinct playable species or a reference to being physically quick.
- Standardized the Korean term as `단명자(Quickling)` and, where the sentence explicitly refers to plural people, `단명자들(Quicklings)`. This preserves the lifespan nuance while distinguishing the in-world term from neutral `필멸자`.
- Rechecked all 20 sentences, normalized the duplicate source lines at `1756` and `7116`, and corrected the awkward “새로움을 배운” wording at `40388`. The other sentence meanings were retained except where noted below.

## Requested sentences

### ID 42257

- English: `The curious one seeks a way to the Fae, but it has found its way to the boughs of the world tree, instead. Rest, quickling, and I may study you.`
- Japanese uses “short-lived one” for the address and confirms that the curious traveler reached the world tree's large branches and is told to rest so the speaker may observe them.
- Final Korean: `호기심 많은 자가 페이(Fae)에게 가는 길을 찾고 있지만, 엉뚱하게도 세계수의 가지에 이르렀구나. 쉬어라, 단명자(Quickling). 널 연구해 보겠다.`

### ID 34297

- English: `Alyn Shir is a mystery and a simplicity. She is focused in a way few quicklings are. Her dedication is true, but I do not know the cause.`
- Japanese also frames the comparison as rare focus among short-lived beings. `단명자` therefore refers to mortal peoples generally, not a separate species. Added the English term and made the final clause explicitly refer to Alyn's dedication.
- Final Korean: `앨린 시어(Alyn Shir)는 수수께끼 같으면서도 단순해. 그녀만큼 집중력 있는 단명자(Quickling)는 드물지. 그녀의 헌신은 진심이지만, 이유는 모르겠어.`

### ID 22903

- The preceding English sentence identifies `them` as creatures of pure magic, such as Tuatha or Trolls, and names Prismere as the subject. Japanese `歓喜` and Chinese `极乐` support the sense of intense pleasure in `rapture`; `황홀감` is clearer and more natural here than `황홀경`.
- Before: `그들에겐 저주이자 축복이자 황홀경이야. 그들을 몰아붙이는 동시에 집어삼키지. 의지가 약한 자는 완전히 타락해.`
- Final Korean: `순수한 마법의 피조물들에겐 프리즘미어(Prismere)가 저주이자 축복이며 황홀감이기도 해. 프리즘미어는 그들을 몰아붙이고 집어삼키지. 의지가 약한 자는 완전히 타락해.`

## Validation

- The English-keyed occurrence inventory contains exactly 20 rows; all 20 IDs are represented in the final Korean review.
- CSV edits were limited to the listed `default` IDs. English, Japanese, and Chinese reference files were not changed.
- Confirmed the active CSV retains its BOM, all 65,135 row starts in the same order, and the exact existing line-ending sequence (71,885 CRLF and 199 LF). All four line-ending-preservation tests pass, as does a CRLF-aware diff check.
