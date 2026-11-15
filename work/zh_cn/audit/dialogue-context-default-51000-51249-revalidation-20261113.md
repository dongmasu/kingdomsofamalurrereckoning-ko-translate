# Sequential `default` Revalidation: IDs `51000`-`51249`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 61 existing four-language fingerprints; all match. Added the
  other 189 IDs to the review ledger without changing existing rows.
- Recorded 17 current correction-candidate IDs and six evidence-limited
  holds. These groups do not overlap; 227 IDs have no current finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Six candidates were carried forward from asset-level reviews;
existing ledger entries remain unchanged as historical records.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `51001` | Naturalness | `네게서 고기 냄새가 난다고 생각했어` is understandable but stiff. English and Japanese support a more conversational line such as `역시 네게서 고기 냄새가 난다 싶었어.` This rechecks the existing FFQ80 candidate. | Medium |
| `51013` | Objective format | `Defeat the Root Golem` uses a direct command, `뿌리 골렘(Root Golem)을 처치하라`. Align the objective with the established concise `-기` form, such as `뿌리 골렘(Root Golem) 처치하기`. | High |
| `51018` | Terminology | `Flawless` is rendered `완벽한` in an equipment name, while the established equipment-quality form is `흠 없는`. Align the quality term and retain `미타란(Mitharan)` and the hilt subtype. | High |
| `51022` | English pairing | `시녀(Maid)` omits the article from the established title `The Maid`. Use `시녀(The Maid)` in `윈더미어의 시녀` while preserving the sentence's claim about denying her right. | High |
| `51043` | Terminology / consistency | In Nanne's alchemy quest, `What is the formula?` is `조합법이 뭐야?`, while the same formula is inconsistently called `제조법`, `조합법`, and `조제법`. Recheck the existing quest-scoped proposal to use `조제법` consistently; this is not a corpus-wide glossary decision. | Medium-high |
| `51065` | Speech level / naturalness | `토론을 즐기게` uses a marked 하게체 imperative; Japanese `討論を楽しんでくれ` is a plain conversational imperative. Consider a natural direct form such as `토론을 즐겨.` The asset does not establish the individual speaker. | Medium |
| `51091` | English pairing | `시녀(Maid)` omits the article from the established title `The Maid`. Use `시녀(The Maid)` without changing the instruction to speak with Sir Airmer. | High |
| `51109` | Terminology / English pairing | `Chaos Scholar` is rendered only as `혼돈 학자` in the armor description. Pair the named term, e.g. `혼돈 학자(Chaos Scholar)의 갑옷 조각`, while preserving that the pieces are buried and their locations must be found. | High |
| `51117` | Naturalness / speech level | `이런 자리에 앉혀 달라고` is an awkward literal rendering of being placed in a position, and the sentence shifts from `하겠어` to `섬기겠다`. Recast the first clause as `이런 자리를 맡겨 달라고 한 적은 없지만` and keep both commitments in one conversational register. | High |
| `51124` | Terminology | `urns` is rendered `항아리`; English, Japanese `骨壷`, Chinese, and the established Teeth of Naros quest terminology support `유골함`. Recheck the existing scoped terminology candidate without changing the separate reference to Ethene. | High |
| `51156` | Naturalness / terminology / format | `페이의 대열` is an awkward fit for `the ranks of the Fae`; Japanese uses `地位`. Consider `페이(Fae)의 위상` or another natural equivalent. Also pair the named `Summer Court` and `Winter Court` as `여름 궁정(Summer Court)` and `겨울 궁정(Winter Court)`. | Medium-high |
| `51162` | Naturalness | `다가오는 그들의 의지의 충격을 견뎌 내리라` is a stiff calque of `bore the brunt of their imminent will`. Recast the image naturally while retaining the unresolved `their` referent; do not add “gods” from Chinese alone. This carries forward the existing candidate. | Medium |
| `51176` | Meaning / naturalness | `내 누이도 형제도` risks encoding the speaker's gender through `누이`, and the next clause obscures the contrast between trying to end the war and releasing Niskaru. Consider a gender-neutral collective such as `내 형제자매는 모두 ...` and clarify that the speaker did not expect the act to unleash Niskaru in Dalentarth. | High |
| `51178` | English pairing / objective format | The objective title `Fate and Fae` is rendered `'운명과 페이(Fae)' 완료`, leaving the title itself unpaired and the completion label inconsistent with the established action form. Consider `운명과 페이(Fate and Fae) 완료하기`. | High |
| `51184` | Meaning / terminology | `cage` refers to a person's confinement, not a birdcage. Korean `이 새장 말인데...` conflicts with English `cage`, Japanese `檻`, Chinese `笼子`, and the related quest context. Use `이 우리 말인데...` as proposed in the existing quest review. | High |
| `51224` | Naturalness | `운이 좋은가, 응?` is awkward Korean for the card-game prompt. English and Chinese support luck, while Japanese says the player is in good form; consider `운이 좀 따르나 봐?` before asking whether the next card is higher or lower. | Medium-high |
| `51237` | English pairing | Japanese identifies `this House` as the House of Ballads. Korean `발라드의 집` conveys the referent but omits its English pairing. Add `(House of Ballads)` without changing the accusatory tone or the paired `더스트링(Dustling)`. | High |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `51056` | Title / rank | `First of the Watch` is rendered `감시대의 제1위`; Japanese reads as a first-class guard and Chinese as a first guard. The sources do not establish whether this is a formal rank or office. Retain provisionally rather than inventing a hierarchy. |
| `51063` | Title / source conflict | English names the addressee `Oathblade`, while Japanese uses `一等傭兵` (“first-class mercenary”). Korean follows English as `맹세의 칼날(Oathblade)`. The row alone does not resolve whether these are equivalent titles; retain pending stronger context. |
| `51078` | Name / source scope | English says `heroes of the Summer`, Japanese explicitly says Summer Court, and Chinese says summer heroes. Korean `여름의 ... 영웅들` follows the shorter English wording. Do not expand it to `여름 궁정` without confirming that the source intends the full institution here. |
| `51129` | Meaning / object use | `raise the King's Token in his honor` is rendered `왕의 징표를 세우다`; Japanese suggests giving a royal symbol, while Chinese describes honoring Sagrell with the token. The action is unresolved, so keep `세우다` provisional. |
| `51186` | Meaning | English `broken old Fateweaver` is rendered `지친 늙은 페이트위버`; Japanese and Chinese support “old” but do not resolve `broken`. This was previously held as a narrow nuance; retain without guessing a physical or emotional meaning. |
| `51227` | Meaning / insult | English `useful derelicts`, Japanese `有能な怠け者`, Chinese `有用的废弃物`, and Korean `쓸 만한 낙오자` differ on whether the insult means idlers, derelicts, or outcasts. The asset does not resolve the intended sense; retain the existing hold. |

## Rechecked Findings and Structure

- The 61 pre-existing ledger fingerprints in this range match the current
  English, Japanese, Chinese, and Korean rows. Existing entries were not
  overwritten.
- Existing candidates at `51001`, `51043`, `51109`, `51124`, `51162`, and
  `51184` remain supported by the current text. The prior candidate at
  `51189` is cleared for the current text: it already reads
  `오레인(Oreyn)과 난 천생연분이었어`. Its older ledger row remains
  unchanged as a historical record. The earlier Savant rank/name correction
  at `51192` matches the current text and is not reopened.
- Fifty-one exact-English duplicate groups touch the range, covering 53
  target rows. Korean matches within all but one group: `51219` differs from
  `22934` and `60930` only in register; Japanese also shifts to polite form
  at `60930`. Preserve the ID-specific phrasing rather than force-unifying it.
- Three entries contain embedded line breaks: `51066` (three), `51079`
  (three), and `51241` (four). All four languages contain ten embedded
  breaks in total. Korean embedded separators are CRLF. No literal
  backslashes remain in the range, including the previously noted rows
  `51066` and `51079`. Runtime/display marker identities and order match;
  localized text inside the `{*2...}` wrapper differs as expected.
- Of 250 IDs, 211 have indexed asset associations, represented by 214
  ID-asset links across 133 assets; 39 have no indexed asset. Of the 189
  newly recorded IDs, 150 have indexed associations and 39 do not. Asset
  links do not establish per-key speakers or playback order.
- The earlier recorded assets and catalog group several IDs in this range.
  The sequential review does not infer individual speakers or dialogue order
  from those links.

## Range Result

- This range has 17 current correction-candidate IDs and six
  evidence-limited holds; 227 IDs have no current finding.
- After appending 189 IDs, the ledger covers 54,894 of 65,135 unique
  `default` IDs (84.28%), leaving 10,241. Sequential coverage reaches
  `51249`; next is `51250`-`51499`.
- Findings remain proposals requiring separate approval. No translation CSV
  was changed.
