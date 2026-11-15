# Sequential `default` Revalidation: IDs `15500`-`15749`

- Date: 2026-11-11.
- Scope: compare active Korean with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- All 250 IDs were checked across the four language tables. Fifty-nine
  existing ledger rows had current fingerprints; 191 new rows were added.
- Seven new correction candidates and one evidence-limited hold were found.
  Existing ID `15577` was reclassified in place from `not-issue` to a format
  candidate after the title-order mismatch was confirmed. The card-name
  candidate at `15632` carries forward an earlier cross-row finding and is
  not counted as newly raised.
- No translation CSV, source resource, extracted game asset, or localization
  binary was changed.

## Correction Candidates

These findings are review proposals, not authorization to edit the active
translation CSV.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `15525` | Naturalness / meaning | English says `We're in a bit of a bind here`; Japanese likewise says the speakers are in difficulty. Korean `여기가 좀 곤란한 상황이거든` treats discourse `here` as a location and leaves the speakers' predicament unclear. Consider `마음이 바뀌었나? 우린 지금 좀 난처한 처지야.` | High |
| `15577` | Format / title | English is `Ambassador Brenner`, Japanese `ブレナー大使`, and Chinese `布伦纳大使`. Korean `브레너 대사(Brenner Ambassador)` reverses the established English title/name order. Use `브레너 대사(Ambassador Brenner)`. | High |
| `15580` | Meaning / naturalness | English `the aura of Akara's protection`, Japanese `アカラの庇護下`, and Chinese `阿卡拉的保护光环` describe leaving Akara's protective reach. `아카라(Akara)의 보호권` is not a natural Korean expression for that area. Consider `아카라(Akara)의 보호가 미치는 영역을 벗어나야 하니`. | High |
| `15582` | Terminology / format | English names `the Greater Niskaru, Balor`; Japanese and Chinese likewise identify Balor as a Greater Niskaru. Korean `상위 니스카루(Niskaru) 발로르(Balor)` omits `Greater` from the English pairing and differs from the aligned in-game wording at `6983`, `상급 니스카루 발로르(Greater Niskaru, Balor)`. | High |
| `15632` | Terminology / format | This six-card list (`Ace, deuce, three, four, five, and the hex`) is part of the cross-row card-name set previously flagged at `1866`, `40020`, and `62621`. Korean spells out the names but pairs only `헥스` with English. Carry forward the earlier request to reconcile the full set's English-pairing and number-word style; no single list-wide display form is approved here. | Medium |
| `15633` | Meaning | English `a salvaged peace treaty` and Chinese `拯救和平条约` describe a treaty that was saved. Korean `평화 조약이 무산될 위기를 넘기고` adds an unsupported near-collapse scenario. Consider `다른 곳에선 평화 조약을 구해 내고`, while preserving the line's sequence of examples. | Medium-high |
| `15659` | Naturalness / format | English deliberately corrects `Whiner` to the name `Wine`; Japanese also renders an epithet followed by the name. Korean `와인(Whiner… Wine)` places the entire English joke in parentheses and reads awkwardly. Consider `징징이… 아니, 와인(Wine)은 인정하지 않겠지만, 창 다루는 솜씨는 내가 더 나아.` | High |
| `15708` | Naturalness | English `really climbing the ladder` and Japanese `正に出世` mean that the addressee is advancing in status. `출세 사다리를 타고 올라가고 있네` is an awkward literal calque. Consider `정말 출세 가도를 달리고 있네.` | Medium-high |
| `15712` | Naturalness | The item description says the letter is mostly unreadable because its corners are worn and its handwriting indecipherable. Korean's `모서리가 닳고 글씨를 알아볼 수 없어, 대부분 읽기 힘든 편지` is syntactically awkward. Consider `모서리가 닳고 글씨도 알아보기 어려워 대부분 판독할 수 없는 편지.` | Medium-high |

## Evidence-Limited Hold

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `15587` | Meaning / format | English source is the unusual label `Entering the land of awesomea`; Japanese and Chinese also retain a phonetic form. The row alone does not establish whether `awesomea` is an intentional name, source typo, or test string. Retain `어썸아의 땅에 들어가는 중` pending context. |

## Existing Findings Rechecked

- All 59 prior ledger records in the range have fingerprints matching the
  current English, Japanese, Chinese, and Korean rows. Fifty-eight prior
  dispositions were retained; `15577` was reclassified in place and linked
  to this report rather than added as a duplicate.
- Existing findings at `15517`, `15532`, `15581`, `15593`, `15621`, `15625`,
  `15627`, `15688`, `15717`, and `15745` remain linked to their earlier
  context reports. They were not recounted as new findings.
- The prior card-name review at `1866` already identified `15632` as part of
  the same open consistency question. This report carries that issue into
  the sequential ledger rather than treating it as a separate terminology
  decision.
- The established inn name `The Raven` at `15520` and the accepted item
  label `The God Fang` at `15664` were retained.

## Duplicate and Structural Checks

- Sixty-three exact-English duplicate groups touch this range, covering
  1,400 corpus rows. All groups have identical Korean translations.
  Sixteen groups have Japanese source-local differences and two have
  Chinese source-local differences; those differences were preserved.
- All 250 IDs are present in matching order in the four language tables.
  Logical line-break counts and runtime-argument, variable, layout-token,
  and display-wrapper signatures match across all four languages.
- Five Korean strings contain 26 existing embedded CRLF breaks:
  `15536` (5), `15619` (6), `15644` (5), `15655` (4), and `15714` (6).
  Their line breaks were preserved.
- Of the 191 new IDs, 148 have indexed asset links and 43 do not; seven
  link to multiple assets. These are context clues only. No per-key speaker,
  handler, branch, addressee, or playback order was inferred.

The ledger now contains 28,647 of 65,135 IDs (43.98%), leaving 36,488
unreviewed. Four-language fingerprints and per-ID dispositions are recorded
in [`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
