# Sequential `default` Revalidation: IDs `41750`-`41999`

- Date: 2026-11-12.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 63 existing ledger records and added 187 newly reviewed IDs.
- Recorded 17 correction-candidate IDs and 16 evidence-limited holds.
  `41798` and `41999` each have both a candidate and a separate hold; 219 IDs
  have no supported finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `41750` | Name format | The named Archmage Linniel is not paired in Korean. Add `리니엘(Linniel)` without changing the sentence. | High |
| `41796` | Name format | The named Shan Gethen is not paired in the grave label. Pair the complete name, e.g. `샨 게센(Shan Gethen) 중위의 무덤`. | High |
| `41798` | Title format / wordplay | `Deserters' Deserts` is rendered literally as `탈영병의 사막`, losing the title's desert/deserts wordplay. Pair the complete title and review a Korean title that preserves the wordplay if context supports one; exact recreation is held below. | Medium |
| `41804` | Naturalness | `지진 마법적 영향` is an awkward modifier chain for `seismagical effects`. Prefer a clear construction such as `아데사(Adessa) 분화구가 체액에 미치는 지진과 마법의 영향에 관한 획기적인 분석`, after checking the intended technical sense. | Medium-high |
| `41813` | Name format / terminology | `Julia` is unpaired, and `bandits` is rendered `산적` while this character-rescue context uses the broader `도적` term elsewhere. Pair `줄리아(Julia)` and verify the project's bandit/brigand distinction before normalizing the noun. | Medium-high |
| `41814` | Name format | Roth is a named character but appears only as `로스`. Pair as `로스(Roth)`. | High |
| `41817` | Terminology / format | The three weapon names use `장검`, `대검`, and `망치`, diverging from the approved `롱소드`, `그레이트소드`, and `해머`. Align the list to the established weapon terms and preserve the three-paragraph layout and display tokens. | High |
| `41827` | Objective format | `Travel to Virki` is a quest objective but lacks the established `-하기` ending. Prefer `비르키(Virki)로 이동하기`. | High |
| `41853` | Objective format | `Sail to Mel Senshir` is rendered as the fragment `멜 센시르(Mel Senshir)로 항해`. Use the action-label form `멜 센시르(Mel Senshir)로 항해하기`. | High |
| `41880` | Name format | `Kessanniki` is a named Varani sea-chant form but is not paired. Pair it as `케산니키(Kessanniki)` while retaining the explanatory phrase. | Medium-high |
| `41905` | Name format / terminology | `The Big Hunt` is a named organization/event in this greeting but appears only as `대사냥`. Pair the full name as `대사냥(The Big Hunt)` and keep that rendering consistent in related references. | High |
| `41921` | Name format | The ship `Steadfast` is not paired. Add `스테드패스트호(Steadfast)` and retain the established `알파르 상선단(Alfar Merchant Navy)`. | High |
| `41961` | Name format | The objective `Speak with Acyone` omits the English name. Pair it as `아시온(Acyone)과 대화하기`. | High |
| `41977` | Name format | The character Lila is unpaired in both mentions. Pair each as `리라(Lila)` and preserve the existing Sativa Fiber and Cradle of Summer names. | High |
| `41994` | Meaning / naturalness | The Korean follows English and Chinese plural `they`, while Japanese reads as a place touched by the gods. Keep the plural referent from the primary English source, but make the Korean question natural and avoid resolving who `they` are without context. | Medium |
| `41995` | Speech level | The line shifts from honorific `지켜보고 계셔` to the lower, old-fashioned `어떻겠나`. The Japanese is consistently plain. Use one conversational register throughout; do not infer a speaker from asset membership. | Medium-high |
| `41999` | Full-name format | Korean pairs only `Gwalchmai`, although the source names `Galen Gwalchmai`. Pair the complete name as `갈렌 그월흐마이(Galen Gwalchmai)`; the agreement-status conflict is held below. | High |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `41752` | Meaning / referent | The English and Japanese support a small gift set aside in gratitude, while Chinese paraphrases the clause differently. Korean's generic `하나` avoids inventing the item's identity; retain it pending item context. |
| `41757` | Meaning / item type | English identifies a burial shroud, while Japanese describes a magical artifact more generally. Korean follows the English item type; do not broaden or rename the relic without stronger evidence. |
| `41803` | Terminology / lore | `pattern` may be ordinary pattern imagery or the game's fate-pattern concept. Korean `운명의 결` is plausible, but this isolated sentence does not settle whether the capitalized lore concept is intended. |
| `41826` | Terminology / place | `Njordir's font` may name a magical spring or a particular ceremonial basin. Keep `뇨르디르(Njordir)의 샘` provisional until the quest's physical referent is confirmed. |
| `41833` | Meaning / poetic phrase | `some wayward eon` is deliberately opaque verse. `아득한 시대` is plausible, but the key does not establish whether this is a time, realm, or figurative afterlife. |
| `41847` | Meaning / institution | `the order` may mean an organization; Japanese refers to a college, while Korean says `교단`. The row alone does not identify the institution, so retain the current wording provisionally. |
| `41864` | Name / place | `Wending` and `the Spire` may be named destinations or local common references. Korean pairs Wending but renders Spire as `첨탑`; exact place-name scope is not established by this line. |
| `41869` | Source discrepancy | English addresses the listener as `Mortal`, while Japanese says `では` (“well then”). Korean follows English with `필멸자여`; retain that source-supported reading without inferring why the Japanese differs. |
| `41876` | Name / referent | `the Weaver` may be a named figure or a descriptive title. The standalone sculpture label does not provide enough context to determine whether English pairing or a lore-specific term is required. |
| `41918` | Place-name discrepancy | English says `Convict's Cavern`; Japanese instead says White Stone Prison. Korean follows English. Keep the location as written until the quest context resolves the source mismatch. |
| `41935` | Name / referent | English capitalizes `Scale`, Japanese calls it the Great Scale, and Chinese says `天平`; Korean uses `저울`. The line does not establish whether this is a named place/object or an ordinary scale. |
| `41957` | Source discrepancy | English `brothers in arms` means comrades, whereas Japanese says younger brothers. Korean `전우들` follows English; retain it rather than importing the unsupported family relation. |
| `41976` | Lore / referent | `the Sorrows` is rendered as `슬픔의 힘`; Japanese says “power of lament,” while Chinese suggests sorrowful spirits. Keep the current phrase provisional because the entity's nature is unresolved. |
| `41989` | Terminology / role | `tenders` may mean caretakers or attendants of the hollow. Japanese and Chinese differ in how they characterize them; `관리인` is plausible but should not be normalized globally from this key alone. |
| `41798` | Meaning / wordplay | The source title's plural `Deserts` may be intentional wordplay. The literal Korean preserves the desert sense but not a possible joke; do not invent a pun without surrounding title context. |
| `41999` | Meaning / chronology | English describes a deal still to be struck but says its figures and signatures are complete; Japanese describes an agreement already made, while Chinese mixes prospective and completed wording. Korean's completed-agreement tense is plausible but cannot be resolved from these sources alone. |

## Rechecked Findings

- All 63 existing ledger fingerprints in this range match the current
  four-language rows. Existing candidates `41813`, `41905`, `41977`, `41994`,
  and `41995` were rechecked and retained.
- The legacy candidate at `41926` was rechecked: its current `Orison` form is
  consistent with the established term and does not warrant a new correction.
  The existing ledger row is left byte-for-byte unchanged under the
  append-only rule, so its historical candidate status remains visible.
- Existing ledger dispositions for `41757`, `41798`, `41826`, `41869`,
  `41918`, and `41921` are also preserved byte-for-byte. This pass records
  newer evidence-limited holds for the first five and a current correction
  candidate for `41798` and `41921`. The historical catalog therefore
  continues to expose their earlier dispositions, while this report is the
  current adjudication for the range.
- Fifty-eight exact-English duplicate groups (1,397 corpus rows) touch this
  range. Korean text matches within every group; no translation was unified
  merely because English is identical.
- Four multiline rows contain ten embedded Korean line breaks. All four
  languages have matching per-row line-break counts; the Korean breaks and
  runtime/control markers are preserved.
- Of 250 IDs, 199 have indexed asset associations; 136 of the 187 newly
  recorded IDs are linked. Asset membership does not establish an individual
  speaker, branch, addressee, or playback order. Unsupported attribution and
  order remain unknown.

## Range Result

- The range has 17 current correction-candidate IDs and 16 evidence-limited
  holds; `41798` and `41999` have both. The remaining 219 IDs have no
  supported finding.
- The ledger covers 48,082 of 65,135 unique `default` IDs (73.82%), leaving
  17,053. Reviewed IDs with indexed asset links total 39,039; 9,043 have no
  indexed asset link. Sequential coverage reaches `41999`; next is
  `42000`-`42249`.
- Four-language fingerprints, regenerated catalogs, nine related index
  tests, and the line-ending-aware diff check must pass before this batch is
  considered recorded. Translation CSVs remain unchanged.
