# Sequential `default` Revalidation: IDs `45750`-`45999`

- Date: 2026-11-12.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 54 previously recorded four-language fingerprints; all match.
  Added the other 196 IDs to the review ledger.
- Recorded 20 current correction candidates and five evidence-limited holds.
  The other 225 IDs have no current finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Existing ledger rows remain unchanged as historical records; this
report records the current revalidation.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `45759` | Meaning / naturalness | `반응식의 용액 구조` reads like the structure of a chemical equation. Japanese describes changing the compounding formula, and the English refers to the formula's solution. Consider `조제액의 조성을 바꾸면`. | Medium-high |
| `45766` | Name format | The named scholar Augra is referred to by her first name, but the English form is omitted. Consider `오그라(Augra)가 말했듯이`. | High |
| `45774` | Name format | `Aurenda` is an established named character, but her name is unpaired in this reference to her lamp. Consider `아우렌다(Aurenda)의 등불도?`; the artifact's canonical title remains a separate question. | High |
| `45787` | Name format | The quest direction names Tormin without the English pairing used for named quest targets. Consider `토민(Tormin)을 찾아야 해`. | High |
| `45794` | Objective format | `Patrol the Area` is a quest objective rendered as the bare noun phrase `주변 순찰`. Align with the action-form objective style: `주변 순찰하기`. | Medium-high |
| `45816` | Name / format | `Aster family` is rendered `아스터 가문` without the English pairing. Preserve the current Korean spelling, which remains unsettled across the related Aster-family references, and pair the full source expression: `아스터 가문(Aster family)`. | High |
| `45817` | Naturalness | `만신창이에 빈털터리가 되어` is an awkward connective. Consider `우리에게 돌아온 건 만신창이가 된 데다 빈털터리가 되어, 자신을 잊으려고 술을 구걸하는 남자 하나뿐이었어.` | High |
| `45818` | Terminology / format | The Dreadscale set is rendered `공포비늘` in this default item and in four other Mitharan Dreadscale descriptions; the English series name is not paired here, while the base headwear entry uses `드레드스케일(Dreadscale)`. Consider `미타란(Mitharan) 공포비늘(Dreadscale) 머리장식`, retaining the established default-set Korean term while pairing the series name. | Medium-high |
| `45827` | Terminology / name format | `Captain of the Watch` is rendered `감시대장` without its English title. Japanese and Chinese use a guard-captain reading, and the same English title is usually `경비대장` elsewhere. Consider `경비대장(Captain of the Watch)` here; keep the wider office-term reconciliation separate because prior records are mixed. | Medium |
| `45833` | Name format | The objective names Adelena without an English pairing. Consider `아델레나(Adelena)에게 피리 돌려주기`. | High |
| `45838` | Terminology | `longlegs` is rendered `롱레그`, while `장다리(Longlegs)` is already used at ID `53146`; related direct-address forms remain inconsistent at IDs `583` and `22815`. Consider aligning this occurrence to `장다리(Longlegs)` and retain the broader address-form group for separate reconciliation. | Medium-high |
| `45875` | Terminology / objective format | In Nanne's alchemy quest, the same formula is variously called 제조법, 조합법, 조제법, and 연금술 공식; Japanese repeatedly uses `調合法`. The current objective also lacks the action-form ending. Consider `조제법이 실린 수송품 파괴하기`, consistent with the scoped terminology proposal in the SQ12 report. | High |
| `45899` | Name format | `Bolton` is a named person, but the name is unpaired. Consider `볼턴(Bolton)을 잘 돌봐 줘`. | High |
| `45922` | Objective format | `Kill the sentry on the Overlook` is rendered as the bare noun phrase `전망대의 보초병 처치`. Consider `전망대의 보초병 처치하기`. | Medium-high |
| `45932` | Speech level / naturalness | This quest-failure journal text uses polite endings, unlike the comparable plain narrative in the same context and Japanese. Consider `필수 당사자 중 한 명이 사망했다. 이 퀘스트는 더는 완료할 수 없다.` | High |
| `45941` | Meaning | `Unknown make` means that the equipment's maker or origin is unknown, not that its method of manufacture is unknown. Consider `몸에 걸친 장비는 어디서 만든 것인지 알 수 없다.` | High |
| `45943` | Name format | `Julia` is unpaired in this rescue-related question, while the same name is paired elsewhere in the associated topic. Consider `줄리아(Julia)는 어디 있지?`. | High |
| `45949` | Meaning / title format | `The Lady's Children` is one of the Ansilla story titles and is rendered inconsistently across its occurrences. Use the established `안실라 부인의 아이들(The Lady's Children)`. | High |
| `45969` | Objective format | `Rescue Asa Arding` is rendered as the bare noun phrase `아사 아딩 구출`. Consider `아사 아딩(Asa Arding) 구출하기`. | Medium-high |
| `45992` | Name / terminology format | The capitalized mythic group `Furies` is transliterated as `퓨리` without the English name. Consider `복수의 신들인 퓨리(Furies)`. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `45819` | Meaning / source conflict | English says the Testament is prevented from “summoning” but omits its object; Japanese instead names the Belen Covenant and states its purpose. Korean follows English and supplies only the grammatically required indefinite object. Do not resolve the faction or missing clause by inference. |
| `45829` | Text type / source conflict | English and Chinese give the fragment `Nette,`, while Japanese expands it to a grave inscription (“Nette rests here”). Korean treats it as an address in a letter. The text type is not established; retain the current reading provisionally. |
| `45886` | Meaning | English `pisspot husband` is an insult that may imply a drunkard, but Japanese says only “despicable husband.” Korean's `술주정뱅이 남편` is more specific than the Japanese evidence supports. Retain pending context. |
| `45968` | Meaning / source conflict | English `mission` is ambiguous; Japanese says monastery and Chinese says mission/chapel. Korean's `수도원` follows Japanese, but the intended institution is not settled. |
| `45994` | Title / source conflict | English says `Cycle, the First`, while Japanese says “third discovery.” Korean follows English. Preserve the current source-following choice and do not harmonize the conflicting title without further evidence. |

## Rechecked Findings and Structure

- Existing candidates `45816`, `45875`, `45932`, `45943`, and `45949` were
  rechecked against current text and remain candidates. Their earlier ledger
  rows and historical findings were not overwritten.
- The earlier questions at `45804`, `45812`, `45822`, `45828`, `45842`, and
  `45872` do not establish current errors: the translated Theater of Fate
  follows English and Chinese; card values are equivalent; the Combo Point
  and Tuatha Overlord labels preserve their meaning; and `Darkvari Outlaw`
  follows the parallel `Cynric Outlaw` form at ID `23298`.
- The Canneroc journal at `45878` retains the source's sequence, militia
  captain, destination, and meeting instruction. No meaning correction is
  supported.
- Fifty-eight exact-English duplicate groups touch the range and cover 935
  corpus rows. Korean matches within every group; no translation was unified
  solely because English repeats.
- Three rows contain embedded line breaks: `45855` (2), `45901` (4), and
  `45953` (1). Each language has matching per-row break counts, and all seven
  Korean separators are CRLF.
- Runtime arguments, localized display wrappers, markup, and their order
  were checked. No structural signature discrepancy was found.
- Of 250 IDs, 189 have indexed asset associations, including 135 of the 196
  newly recorded IDs. The other 61 have no indexed asset association. Asset
  links do not establish per-key speakers, addressees, branches, or playback
  order; unsupported attribution and order remain unknown.

## Range Result

- The range has 20 current correction-candidate IDs and five evidence-limited
  holds; the other 225 IDs have no current finding.
- After appending 196 new IDs, the ledger covers 51,046 of 65,135 unique
  `default` IDs (78.37%), leaving 14,089. Sequential coverage reaches
  `45999`; next is `46000`-`46249`. Of reviewed IDs, 41,051 have indexed
  asset links and 9,995 do not.
- Catalog reproduction, all ledger fingerprints, the nine related index
  tests, and the line-ending-aware diff check passed after the ledger update.
