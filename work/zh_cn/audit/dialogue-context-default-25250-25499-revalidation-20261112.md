# Sequential `default` Revalidation: IDs `25250`-`25499`

- Date: 2026-11-12.
- Compared all 250 active Korean entries with same-ID English, Japanese, and
  Chinese for meaning, naturalness, register, terminology, names, and format.
- Rechecked 62 existing ledger records and added 188 previously unrecorded
  IDs. Twenty new correction-candidate IDs and two evidence-limited holds
  were recorded.
- Retained nine existing correction-candidate IDs and three existing holds
  after rechecking their source evidence; none was cleared.
- No translation CSV, immutable source, extracted asset, or localization
  binary changed.

## Correction Candidates

These are review findings, not approval to edit the translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `25275` | Name / format | `the Executioner` is a named figure in Mithros, but Korean has only `처형인`. Pair the title as `처형인(The Executioner)`. | High |
| `25288` | Name / format | `Cutter` is capitalized as a name in the exact line; Korean `커터` is unpaired. Add `커터(Cutter)` without expanding it to an unproven full name. | Medium |
| `25292` | Objective form | The objective `Talk to Osduin` is rendered with bare `대화`; use the established `-하기` form, e.g. `오스두인(Osduin)과 대화하기`. | High |
| `25301` | Naturalness | `몇 개는 팔게` counts the quest's uncountable meat as pieces. The FFQ80 context supports `좀 팔게`, matching the choice's casual tone. | Medium-high |
| `25311` | Name / format | `Wyvyrn-Gifres` is rendered as `와이번-기프르 가문 사람들` without the English family name. Add the source name while preserving the plural people reference. | Medium-high |
| `25358` | Name / format | The journal names the soldier Camden, but `캠든` is unpaired. Add `캠든(Camden)` without changing the sentence's regretful tone. | Medium-high |
| `25368` | Naturalness / consistency | This is an exact duplicate of the sentence at `22613` and `35580`; the current Korean wording differs from the already documented shared proposal. Align the repeated sentence to `클라우드크레스트 산(Cloudcrest Mountain)은 여기서 서쪽에 있으며, 남부 할로우랜드(Hollowlands)를 내려다봐.` while retaining each row's continuation. | High |
| `25398` | Name / format | The spoken line names Hugo, but `휴고` is unpaired. Add `휴고(Hugo)`. | High |
| `25403` | Title / format | The book title `The Immortal Fae` is rendered `불멸의 페이(Fae)`, pairing only the final noun. Pair the complete title: `불멸의 페이(The Immortal Fae)`. | High |
| `25407` | Name / format | `Ander's Bank` is a place name in `the village of Ander's Bank`, but Korean `앤더스 뱅크 마을` omits the source spelling. Pair the place name, e.g. `앤더스 뱅크(Ander's Bank) 마을`. | High |
| `25408` | Name / format | The journal names Tari without English. Add `타리(Tari)` while preserving the first-person journal form. | Medium-high |
| `25411` | Grammar / naturalness | The particle after `에어머 경(Sir Airmer)` is `가`, although `경` ends in a final consonant. Use `에어머 경(Sir Airmer)이`; keep the rest of the quest update intact. | High |
| `25433` | Name / format | The objective `Return to Gorem Kane` leaves the personal name unpaired. Use `고렘 케인(Gorem Kane)에게 돌아가기`. | High |
| `25435` | Title / format | `The Blackened Hall` is a named place, but the Korean parenthetical omits `The`. Pair the exact title as `검게 그을린 전당(The Blackened Hall)`. | Medium-high |
| `25441` | Terminology | Retain the prior candidate: the established local term for `heartvines` is `하트바인`, but this row still uses `심장덩굴`. Align it with that term without changing the distinct `Thresh` reference. | High |
| `25450` | Name / format | `Houses of Pride, and of Vengeance` pairs `House of Pride` but leaves `House of Vengeance` unpaired. Add `복수의 집(House of Vengeance)`. | High |
| `25465` | Objective form | `Talk to the Vox Victorium` is rendered with bare `대화`; use `복스 빅토리움(Vox Victorium)과 대화하기`. | High |
| `25486` | Naturalness | The promotional wordplay `ails, fails, or irks you` becomes the stiff list `병이든 실패든 성가신 일이든`. Recast it conversationally, e.g. `아픈 곳이든, 일이 뜻대로 안 되든, 성가신 일이 있든 물약 하나면 돼.` | Medium-high |
| `25487` | Name / format | `Orla Devlin` is named in this journal entry but is not paired in Korean. Add `오를라 데블린(Orla Devlin)`. | High |
| `25491` | Naturalness | `그래? 뭘 쳐다봐?` is less natural for the abrupt challenge in English `Yeah? What are you looking at?` and Japanese `ああ？`. Consider `뭐? 뭘 쳐다봐?`. | Medium |
| `25495` | Naturalness | `이제는 나 자신도 이해하게 됐다니` reads like an incredulous retrospective, while the sources say the speaker now understands themself and feels relieved. Consider `이젠 나 자신도 이해하게 됐어. 정말 다행이야.` | Medium |
| `25496` | Name / format | The objective `Return to Khamazandu` omits the English name. Use `카마잔두(Khamazandu)에게 돌아가기`. | High |
| `25498` | Name / format | The named organization/place `The Pryderi` is rendered only as `프라이데리`. Pair the exact name, e.g. `프라이데리(The Pryderi)는 하층 도시에 있어.` | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `25350` | Meaning / antecedent | English and Chinese preserve “Is he, then?” while Japanese omits the referent. Without the antecedent, Korean `그런가?` cannot be confirmed as preserving the identity question; keep unchanged pending dialogue context. |
| `25450` | House-name spelling | The complete source names Houses of Pride and Vengeance, but Korean House-name forms vary across the corpus. Pairing the English title is a separate formatting candidate; do not standardize its Korean rendering before an approved House-name convention. |

## Rechecked Existing Findings

- Retained `25277`: the objective still omits the English pairing for
  `Chrysalae`; its Korean spelling remains unresolved within the broader
  glossary review, so no spelling was guessed.
- Retained the earlier `25275` and `25288` meaning dispositions. The new
  candidates concern only the missing English pairings for the named
  Executioner and Cutter, not their already-reviewed sentence meanings.
- Retained `25298`: the named ring `Maisie's Luck` still lacks its English
  pairing.
- Retained `25301`: the countability issue remains as described above.
- Retained `25333`: the `Silverback Troll` and named `Stowaway` still lack
  complete English pairings and the active creature term differs from the
  established form.
- Retained `25342`: `great chamber` is still rendered `대회랑`, which suggests
  a corridor; the reviewed source and asset terminology support `대전당`.
- Retained `25368`: the repeated Cloudcrest sentence remains inconsistent
  with the documented shared wording.
- Retained the earlier `25371`-`25374` disposition: the Telling's unraveling
  and repair remain intact, and Japanese supports `창조주` for St. Eadric's
  reference to the Authority.
- Retained `25385`: `The Hollow` remains `할로우`, while Japanese and Chinese
  identify a cave/hollow; the exact location-name treatment remains open.
- Retained `25392`: the Korean `경비대장` for Warden Adwold remains subject to
  the documented unresolved title reconciliation.
- Retained the earlier `25401`-`25450` meaning dispositions. New candidates
  at `25407`, `25408`, `25411`, and `25433` concern omitted English pairings
  or the Korean subject particle, not the previously confirmed event details.
- Retained the earlier meanings for `25462`, `25464`-`25467`, and
  `25477`-`25482`; those rows introduce no new meaning or term finding here.
- Retained `25441`: the active wording still uses `심장덩굴` for
  `heartvines`.
- Retained `25474`: the address `도브` remains a candidate for the established
  neutral `친구`; the sentence meaning is still held because Japanese and
  English conflict.

## Duplicate And Structural Checks

- The range contains one exact-English duplicate group: `Quest Complete` at
  `25305`, `25370`, and `25472`. All three Korean strings are identical.
- Embedded line-break counts and normalized runtime/control-token
  signatures match across all four languages for all 250 IDs.
- Asset links, NPC symbols, handler counts, row adjacency, and numeric ID
  sequence were not treated as proof of an individual speaker or playback
  order. Register findings were held where scene-stage or addressee evidence
  was insufficient.

After recording this range, the ledger contains 35,866 of 65,135 IDs
(55.06%), leaving 29,269. Sequential coverage reaches ID `25499`; the next
range is `25500`-`25749`.
