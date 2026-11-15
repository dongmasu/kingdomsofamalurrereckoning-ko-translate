# Sequential `default` Revalidation: IDs `58750`-`58999`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 69 pre-existing ledger fingerprints and preserved those rows.
  Added the other 181 IDs in ascending order.
- Fifteen new-row correction candidates and eleven evidence-limited
  questions are recorded. Eight existing candidates and one existing hold
  were rechecked without rewriting their ledger rows. Seven new findings at
  existing IDs remain report-only.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `58787` | Format | The standalone label is `Fast`; Korean `빠르게` is adverbial, unlike Japanese `速い`. Consider an adjective/attribute form such as `빠름`, subject to the UI context. | Medium |
| `58789` | Name / format | English names the `Sorrows Tree`, but Korean only says `비탄의 나무`. Pair the named tree as `비탄의 나무(Sorrows Tree)` without changing the material comparison. | Medium-high |
| `58790` | Title / format | The source title is `Ambassador Odvar`; Korean reverses it as `오드바르 대사(Odvar Ambassador)`. Use the established combined order `오드바르 대사(Ambassador Odvar)` and retain the epithet. | High |
| `58811` | Name / format | The named title `Vekreth's Cruelty` appears only as `베크레스의 잔혹함`. Add the complete English title, e.g. `베크레스의 잔혹함(Vekreth's Cruelty)`. | Medium-high |
| `58825` | Format | Korean repeats the title in `'어비스' 실험("Abyss" experiment)`. Use a single bilingual name, e.g. `어비스(Abyss) 실험에 관한 기록`. | High |
| `58830` | Name / format | The full loading label is `Concourse Central`, but Korean pairs only `Concourse` as `중앙 콩코스(Concourse)`. Pair the complete label as `중앙 콩코스(Concourse Central)`. | High |
| `58838` | Name / format | `Maun` is the named author of the note but appears only as `마운`. Pair as `마운(Maun)`; do not infer the relationship between this name and other characters. | High |
| `58845` | Name / format | English names the place `Eryie Peak`; Japanese and Chinese also treat the full phrase as a place name. Pair the translated label as `에리예 봉우리(Eryie Peak)`. | Medium-high |
| `58903` | Meaning | The source says to select the equipment item that should receive a gem. Korean instead says to select the gem. Consider `보석을 추가할 항목을 선택하세요.` Preserve all three display markers; Japanese alone orders their localized payloads differently. | High |
| `58906` | Name / format | `Longinous` is rendered only as `롱기누스`. Add `(Longinous)` while retaining the source's appositive description of the world-piercing spear. | High |
| `58914` | Format | The reagent amounts are spaced consistently except `하늘꽃(Sky Blossom)(2)`. Use `하늘꽃(Sky Blossom) (2)` and preserve all quantities and four embedded breaks. | High |
| `58928` | Speech level / naturalness | `말해 보게` introduces marked 하게체, while the rest of the question and the Japanese are conversational. Recast the full line in one register, such as `기쁘군! 말해 봐. 다음 상황에서 힘을 가장 효과적으로 과시하는 방법은 무엇일까?` | Medium-high |
| `58942` | Name / format | `the Quays` is a named destination but Korean has only generic `부두`. Pair it as `부두(The Quays)` while retaining the paired captain name and escort instruction. | High |
| `58952` | Name / format | The standalone person name is left untranslated as `Daniel`, unlike the Chinese transliteration. Consider the established Korean-name pattern `대니얼(Daniel)`. | Medium |
| `58992` | Terminology / format | `Shieldbrother` and `Shieldsister` are capitalized role terms but Korean `방패형제, 방패자매` is unpaired. Pair each term at first mention: `방패형제(Shieldbrother)` and `방패자매(Shieldsister)`. | Medium-high |

The preliminary candidate at `58832` was withdrawn during final verification:
the current Korean already pairs the name as `말라드루스(Maladrus)`.
At `58790`, the line explicitly identifies its speaker as Ambassador Odvar;
the ledger records that direct self-identification, while dialogue order
remains unknown.

## Rechecked Existing Findings

| ID | Current finding and disposition |
| ---: | --- |
| `58764` | The existing name-pairing candidate remains supported: `Ram` appears as `램` without `(Ram)`. |
| `58765` | The existing meaning/naturalness candidate remains supported: `저주받을 놈` describes a cursed person rather than directly cursing the addressee; retain pending bark context. |
| `58772` | The existing address candidate remains supported: `그 애` adds an unsupported age/diminutive implication for Aery, and `시킨 대로` strengthens “suggested.” |
| `58806` | The existing company-name candidate remains supported. This exact heading occurs at `11917`, `15183`, `36628`, and `58806`; the current Korean omits English and differs from the established proposal `브래드 앤 서그렌 상회(Brad and Cergren Traders)`. |
| `58835` | The existing hold remains: the short `Elrod` reference cannot be assigned to Elrod Edman from asset association alone. Do not add the surname or infer alias identity. |
| `58868` | The existing naturalness candidate remains supported: `여기 땜장이야` is a literal reading of the self-introduction `Tinkerer here`; consider `난 땜장이야.` |
| `58889` | The existing name candidate remains supported: use the attested `베셀리(Betheli)`, not `베텔리`. |
| `58975` | The existing meaning candidate remains supported: `마법 생물` adds “magical,” while the sources describe dangerous creatures / demented trees. |
| `58994` | The existing duplicate-consistency candidate remains supported: English, Japanese, and Chinese match IDs `25576` and `63906`, but Korean `테스타먼트(Testament)` differs from `벨렌의 성약단(Belen's Testament)`. |

## Additional Report-Only Findings at Existing IDs

These findings concern IDs already present in the ledger. Keep their existing
rows unchanged; these notes do not authorize translation edits.

| ID | Dimension | Finding and disposition |
| ---: | --- | --- |
| `58876` | Speech level | Korean `고맙네` / `자네` / `헛되지 않을 걸세` uses marked 하게체, while Japanese uses plain conversational wording. Record for line-level voice review; asset association does not identify the speaker. |
| `58880` | Name / format | Capitalized `The Fallen Son` is translated as `타락한 아들` without its English form. Consider pairing the epithet; retain the existing row. |
| `58898` | Meaning / name | `Pit` may name the Gladiator Pit, but Japanese says a waiting area while English/Chinese/Korean use a pit. Keep the existing row and wording pending location context. |
| `58925` | Name / format | `Altar of Regression` is a named altar but Korean has only `퇴행의 제단`. Consider `퇴행의 제단(Altar of Regression)`; retain the existing row. |

## Evidence-Limited Questions

| ID | Question and disposition |
| ---: | --- |
| `58809` | `the Watch` may be a named guard organization or a generic patrol. Japanese says city police; Chinese says guards. Do not map it to Rathir's `City Watch` without key-specific evidence. |
| `58815` | English/Chinese/Korean describe Khleran as having a refuge full of Jottun mercenaries; Japanese instead says Jottun mercenaries protect him. Keep the relationship unresolved. |
| `58836` | English's aside `as much as a Traveler can` limits the speaker's promise, while Japanese/Chinese can make belief in Travelers a condition. Preserve the ambiguity and current translation. |
| `58851` | English `station` and the aligned references do not establish whether Didenhil means a recruiting station, military post, or garrison. Korean `주둔지` is plausible but unconfirmed. |
| `58858` | `the Burn` is capitalized, but Japanese and Chinese render a burned/charred harbor or place while Korean transliterates `번`. Keep its place-name status open. |
| `58882` | `Once pure they have left the land` has an unclear antecedent. Korean selects formerly pure people; Japanese appears to make the land the subject. Preserve the current stanza pending lore context. |
| `58894` | English says the boots have not been worn, Japanese says they are not damaged, and Korean says they are not being worn. Keep the equipment condition unresolved. |
| `58901` | The UI category `Lore` is rendered `지식`; the three-part help text is clear, but the exact established UI term for collectible Lore remains unsettled. |
| `58939` | `the order` may refer to a specific institution or an organization in general. Japanese says university and Chinese specifies arcane study; retain `교단` pending context. |
| `58943` | `dust-grubbers` is a contemptuous social description, but the references differ on its exact image. Korean preserves the speaker's disdain; do not conflate this phrase with `Dustling`. |
| `58989` | `Fatelessness` and the image of rewriting the Weave are abstract setting terms; Japanese describes absence of fate and Chinese escape from fate. Hold `운명 없음` pending the intended lore sense. |

The questions at `58815`, `58836`, and `58851` concern IDs already present in
the ledger. They are report-only and do not change those rows' existing
dispositions.

The earlier candidates at `58872` and `58917` are reflected in the current
text: both pieces of information at `58872` are heard, and `58917` includes
the speaker's father among the town's fools and hypocrites. The previously
reviewed card-game wording at `58829` and `58850` is also retained.

## Repeated English and Structure

- Sixty-one exact-English duplicate groups across the full corpus touch this
  range, covering 1,449 rows. Korean differs only in the group
  `25576` / `58994` / `63906`; the existing candidate at `58994` remains
  supported by the matching English, Japanese, and Chinese sources.
- `58929` is an exact four-language duplicate of `50765`. The English,
  Japanese, and Chinese source strings match exactly, and the Korean
  translation also matches after normalizing CRLF to LF, including all 13
  displayed lines. No change is proposed.
- Eleven rows contain embedded line breaks: `58781` (2), `58801` (1),
  `58806` (4), `58819` (6), `58882` (2), `58888` (2), `58914` (4),
  `58929` (12), `58931` (2), `58933` (1), and `58934` (4). Totals are
  40/39/40/40 breaks across English/Japanese/Chinese/Korean; Japanese omits
  the paragraph break at `58933`.
- At `58903`, English, Chinese, and Korean order the localized display
  payloads as equipment → socket → gem; Japanese orders socket → weapon/
  armor → gem. All three markers are present, and Korean follows English
  and Chinese.
- Of 250 IDs, 185 have indexed asset associations, represented by 187
  ID-to-asset links across 123 assets; 65 have none. Of the 181 newly
  recorded IDs, 117 are linked through 118 links across 69 assets, and 64
  are unlinked. Asset associations do not establish per-key speakers or
  playback order.

## Range Result

- All 69 pre-existing ledger rows remain unchanged; 181 new IDs were appended
  in ascending order. Fifteen new-row correction candidates and eight new
  ledger holds are recorded. Eleven evidence-limited questions are documented
  in total, including three report-only findings at existing IDs. Four
  additional findings at existing IDs are also report-only.
- The ledger covers 60,638 of 65,135 unique `default` IDs (93.10%), leaving
  4,497 unrecorded IDs. Sequential coverage reaches `58999`; next is
  `59000`-`59249`.
- Candidate findings are proposals, not approval to edit translation CSVs.
  No translation CSV was changed.

## Verification

- English, Japanese, Chinese, and Korean each contain IDs `58750`-`58999`
  once and in identical ascending order; each full `default` file contains
  65,135 records with matching key order.
- The four-language fingerprint check passes for all 60,638 ledger IDs.
- The generated quest-asset index and catalogs reproduce byte-for-byte; all
  nine `test_build_dialogue_context_index.py` tests pass.
- The audit-only, CRLF-aware diff check is clean. Translation CSVs were not
  modified.
