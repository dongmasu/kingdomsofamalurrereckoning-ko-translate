# Sequential `default` Revalidation: IDs `42250`-`42499`

- Date: 2026-11-12.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 51 existing ledger records and added 199 newly reviewed IDs.
- Recorded 26 current correction-candidate IDs and six evidence-limited
  holds. `42447` has both a format candidate and a meaning hold; 219 IDs
  have no supported finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `42254` | Name format | The English says `Welcome to the Sun`, while Japanese and Chinese identify the place as Sun Camp. The current `태양 야영지` lacks the established English pairing. Prefer `태양 야영지(Sun Camp)에 온 걸 환영해.` | High |
| `42258` | Name format | The standalone place label `Pitcairn Island` is rendered `핏케언섬` without English. Pair it as `핏케언섬(Pitcairn Island)`; retain the English singular while noting that Japanese and Chinese use a plural island form. | High |
| `42261` | Name format | The standalone country name `Uruguay` is rendered `우루과이` without English. Pair it as `우루과이(Uruguay)`. | High |
| `42297` | Name format | `Praetorians` is a capitalized military group, while Korean has only `근위병`. Pair the existing translation as `근위병(Praetorians)`; this does not settle the group's canonical Korean military term. | Medium-high |
| `42307` | Objective format | The objective `Kill the Crudok` is rendered `크루독(Crudok) 처치`, unlike the established `-하기` objective form. Prefer `크루독(Crudok) 처치하기`. | High |
| `42329` | Full-name format | English names `Sir Elswin`, but Korean uses `엘스윈(Elswin) 경`. Pair the complete titled name as `엘스윈 경(Sir Elswin)`. | High |
| `42340` | Speech level | English `I will help` and Japanese `手伝おう` are plain, direct offers; Korean `돕겠소` introduces marked 하오체. Prefer a plain form such as `돕겠어.` | Medium-high |
| `42348` | Name format | The score label names `Alain`; Korean `앨런 점수: {1}` omits the English name. Prefer `앨런(Alain) 점수: {1}` and preserve the variable. | High |
| `42349` | Objective format | The objective `Visit Mine` is rendered `광산 방문`. Use the established action-label form `광산 방문하기`. | High |
| `42350` | Speech level | The Korean shifts from archaic `좋소` to polite `시작합시다`, while Japanese uses a neutral approval followed by plain `始めよう`. Unify the register; for example, `좋소. 토론을 시작하지.` | Medium |
| `42351` | Name format | The established location `Gloamthicket` appears as `글룸시킷` without English. Pair it as `글룸시킷(Gloamthicket)` while retaining the supported `페이 동굴` sense. | High |
| `42360` | Title format | The standalone title `A Faint and Fainter Pulse` lacks English pairing. Prefer `점점 약해지는 맥박(A Faint and Fainter Pulse)`. | High |
| `42371` | Objective format | The objective `Destroy the Prismere Chantries` is rendered as a noun fragment. Prefer `프리즘미어 예배당(Prismere Chantries) 파괴하기`. | High |
| `42377` | Full-name format | English names `Hireling Rendig`; Korean splits the role pairing from the unpaired name as `고용병(Hireling) 렌디그`. Pair the complete role and name as `고용병 렌디그(Hireling Rendig)`. Do not add `Wyl`, which is absent from this source row. | High |
| `42385` | Title format | The standalone title `A Valiant Knight` lacks English pairing. Prefer `용맹한 기사(A Valiant Knight)`. | High |
| `42426` | Name format | `Narit` is unpaired while `Guenfear` is paired. Add the English name as `나릿(Narit)과 구엔페어(Guenfear)의 형제야.` | High |
| `42431` | Name format | `House of Sorrows` is a named group and its established Korean form is `비탄의 집(House of Sorrows)`. Pair the occurrence in this sentence. | High |
| `42445` | Name consistency / pairing | The name `Ticneri` appears twice as unpaired `틱네리`. Existing bounded quest evidence consistently uses `틱네리(Ticneri)`; pair both occurrences without assigning a speaker. | High |
| `42447` | Title format | The standalone label `Iconoclast` is rendered `성상 파괴자` without English. Pair the current translation as `성상 파괴자(Iconoclast)`; its meaning remains on hold below. | High |
| `42449` | Naturalness | `몸을 팔고 동전을 찾아 뒤지는 생활` is an awkward rendering of being tired of sex work and scavenging for money. Consider `몸을 팔고 돈 될 만한 걸 찾아다니는 생활은 이제 지긋지긋해.` | Medium-high |
| `42450` | Terminology / format | The material list omits or inconsistently cases the English names: `비치스톤 세 묶음, 곰가죽 두 묶음, 바다강철(seasteel) 세 묶음`. Existing material labels support `비치스톤(Beachstone)`, `곰가죽(Bearhide)`, and `바다강철(Seasteel)`. | High |
| `42456` | Naturalness | `내 경비 비용` is redundant Korean for `my security fee`. Prefer a concise form such as `내 경비료도 겨우 낼 판인데, 해충 구제업자를 부를 돈은 어디 있어?` | Medium-high |
| `42461` | Naturalness / name format | `Job well done, Lina` is sarcastic in context, and the name lacks English. The existing `수고했어` can read as sincere. Prefer `참 잘했네, 리나(Lina).` | Medium-high |
| `42474` | Name format | The full person name `Bridgette Malloi` is unpaired in the question. Use `브리짓 말로이(Bridgette Malloi)는 어디 있지?` | High |
| `42489` | Naturalness / sentence structure | The appositive `us, the servants and advisors` becomes the awkward self-correction `우리를, 그러니까 하인들과 고문들을`. Prefer `투아사는 십 년 전 침공했을 때 하인과 고문인 우리를 감옥에 가뒀어.` | Medium-high |
| `42493` | Title format | The standalone title `A Difficult Start` lacks English pairing. Prefer `험난한 시작(A Difficult Start)`. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `42268` | Name / referent | English says only `the Well`; Japanese says `泉`. Korean expands this to `영혼의 샘(Well of Souls)`. The MQ01 context concerns a well and its lens core, but does not establish that the full Well of Souls name is intended here. Retain the expansion provisionally rather than conflating the distinct `Well` and `Well of Souls` entries. |
| `42272` | Meaning / source conflict | English and Chinese say `Well done`, while Japanese `元気そうだな` means that the listener looks well. Korean follows English. Keep it pending source/context resolution; do not import the Japanese reading into Korean without evidence. |
| `42315` | Text type / title | `Into the Light` is capitalized in English but may be a title or a generic phrase. No linked asset or other source establishes the text type. Keep `빛 속으로` pending context rather than adding an assumed title annotation. |
| `42405` | Meaning / source fragment | English ends with the incomplete possessive `the Grand Bursar's`; Japanese names the Grand Bursary/office, while Chinese suggests the Grand Bursar's house. Korean `대회계원(Grand Bursar's)` does not resolve whether the person, office, or residence is meant. Retain provisionally. |
| `42447` | Meaning / title | English `Iconoclast`, Japanese `因果を断ち切る者` (“one who cuts off causality”), and Chinese `圣像碎屑` (“icon fragment”) diverge materially. The English pairing can be added independently, but do not replace `성상 파괴자` or normalize this lore label without stronger evidence. |
| `42482` | Meaning / referent | English `the old Primos` may mean an aged Primos, while Chinese reads it as a former/old leader; Japanese and Korean describe him as old in age. The line does not settle whether `old` is temporal or a status/title. Retain `늙은 프리모스` provisionally. |

## Rechecked Findings

- All 51 existing ledger fingerprints in the range match the current
  four-language rows. Existing candidates `42297`, `42445`, `42450`, and
  `42461` were rechecked and retained. Their historical ledger rows remain
  unchanged under the append-only rule; this report records the current
  assessment.
- The prior uncertainty at `42496` is released: Korean `네가 아무도 해치게
  두지 않겠어` is compatible with both the English reassurance and the
  Japanese promise to prevent anyone from being hurt.
- `42331` `Greatsword` remains `대검`, matching the active `base` vocabulary
  at the corresponding weapon-category entries; no `그레이트소드`
  correction is proposed.
- Fifty-six exact-English duplicate groups (1,230 corpus rows) touch this
  range. Korean text matches within every group; no translation was unified
  merely because English is identical.
- Three multiline rows contain 14 embedded Korean line breaks. All three
  have matching per-row break counts across all four languages. The
  extracted runtime/control-token signatures also match.
- Of 250 IDs, 199 have indexed asset associations; 148 of the 199 new
  ledger entries are linked. Asset membership does not establish an
  individual speaker, branch, addressee, or playback order. Unsupported
  attribution and order remain unknown.

## Range Result

- The range has 26 current correction-candidate IDs and six evidence-limited
  holds; `42447` has both. The remaining 219 IDs have no supported finding.
- The ledger covers 48,465 of 65,135 unique `default` IDs (74.40%), leaving
  16,670. Reviewed IDs with indexed asset links total 39,319; 9,146 have no
  indexed asset link. Sequential coverage reaches `42499`; next is
  `42500`-`42749`.
- Four-language fingerprints, regenerated catalogs, nine related index
  tests, and the line-ending-aware diff check must pass before this batch is
  considered recorded. Translation CSVs remain unchanged.
