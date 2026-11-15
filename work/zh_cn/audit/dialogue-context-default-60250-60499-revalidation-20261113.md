# Sequential `default` Revalidation: IDs `60250`-`60499`

- Date: 2026-11-13.
- Compared all 250 active Korean rows against English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 65 pre-existing ledger fingerprints and preserved those rows.
  Appended the remaining 185 IDs in ascending order.
- Nine new-row correction candidates and seven new evidence-limited holds
  are recorded. Seven existing candidates and one existing hold were
  rechecked without rewriting their append-only rows. One newly noticed issue
  at an existing `not-issue` ID remains report-only.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `60304` | Meaning | `All here fear her foul moods` is rendered `그녀가 기분 나빠지는 걸 두려워하지`, which reverses the source's fear into not fearing. Consider `그녀가 심술을 부릴까 봐 여기 있는 사람들은 모두 두려워해.` | High |
| `60377` | Name / format | The standalone item label `Mitharan Prismere Brace` pairs the two modifiers individually but omits the complete English item name. Consider `미타란 프리즘미어 보호대(Mitharan Prismere Brace)`, retaining the established term spellings. | Medium |
| `60394` | Title / format | The standalone title `Going Rogue` is only `독자 행동`. Pair the complete title, e.g. `독자 행동(Going Rogue)`. | Medium |
| `60396` | Name / format | Capitalized `The House` is a named House in this ballad context; Japanese explicitly identifies the House of Ballads. Consider `발라드의 집(House of Ballads)은 멀지 않아.` | Medium-high |
| `60399` | Meaning / naturalness | `swarthy brutes` is expanded to `거뭇한 피부에 덩치가 크고`, adding a size claim not explicit in English or the aligned Japanese/Chinese. Retain the speaker's contempt without that extra detail, e.g. `거무스름한 피부의 사나운 자들이었어. 털도 많고 더러워서 생각만 해도 몸서리쳐.` | Medium |
| `60428` | Naturalness | `If it isn't Brigand Hall Caverns` is an English recognition idiom, but `여기가 바로 ...였군` is an awkward past-tense rendering. Consider `이런, 브리건드 홀 동굴(Brigand Hall Caverns)이잖아. 하필 그 더러운 굴에서 기어 나오다니...` | Medium-high |
| `60455` | Terminology / format | The line names Skald's forge, Sagecrafting, Chaos Gems, and Chaos beasts, but pairs only `Skald`. Consider pairing the complete named terms where retained in the Korean sentence, without changing the claim that the altar upgrade unlocked Chaos Gems and defeating the beasts proved the speaker's strength. | Medium |
| `60458` | Name / format | The standalone item label `Flawless Mitharan Magnifying Fulcrum` pairs only `Mitharan`. Consider pairing the complete item name, e.g. `완벽한 미타란 확대 지렛목(Flawless Mitharan Magnifying Fulcrum)`. | Medium-high |
| `60465` | Title / format | The standalone ability label `Fire Mine` is only `화염 지뢰`. Pair it as `화염 지뢰(Fire Mine)`. | Medium |

## Rechecked Existing Findings

These IDs already have append-only ledger rows; the rows and dispositions
remain unchanged.

| ID | Current finding and disposition |
| ---: | --- |
| `60271` | The uncertainty remains: the antecedent of `they` in `they mostly ignore us` is unclear. The Korean wording can be read as referring to the ancestors; do not supply a new antecedent from asset association alone. |
| `60282` | The terminology candidate remains supported: the Nareen Farm references to `vagrants` vary among `부랑자`, `방랑자`, and `떠돌이`. Keep this as a scoped consistency proposal, distinct from `refugees`. |
| `60290` | The naturalness candidate remains supported: `이 자산들을 살펴보고` sounds financial for the mine and operating office. `이 시설들을 둘러보고 개선할 방법을 찾아야겠다` remains a suitable direction. |
| `60384` | The naturalness candidate remains supported: `네게서 뭔가 빛이 나는 것 같았거든` can suggest literal light coming from the player, unlike the source's figurative `glow`. |
| `60389` | The local terminology candidate remains supported: the Sandstone Villa quest alternates among `개량`, `업그레이드`, and `개조` for home upgrades. |
| `60393` | The Testament terminology and pairing candidate remains supported. The current `벨렌의 테스타먼트(Testament)` does not pair the full faction name and differs from the proposed consistent faction/short-name forms. |
| `60408` | The naturalness candidate remains supported: `받을 자격이 있는 만큼 보상하지` is stiff. `네가 받아 마땅한 만큼 보상하지` preserves the meaning and conversational tone. |
| `60477` | The `dreg` terminology candidate remains supported as a cross-row consistency question; retain the insult's force and do not impose a global alias without context. |

## Additional Report-Only Finding at an Existing ID

| ID | Dimension | Finding and disposition |
| ---: | --- | --- |
| `60442` | Name / number format | English says `mountain trolls` and Korean has `산악 트롤(Mountain Troll)` followed by plural Korean `들이`. The complete plural pairing should be `산악 트롤(Mountain Trolls)`. Its pre-existing ledger row is `not-issue`; preserve that append-only record and leave this finding report-only. |

## Evidence-Limited Holds

| ID | Question and disposition |
| ---: | --- |
| `60275` | English `it` has no explicit antecedent. Korean leaves the object unstated, while the other locales differ in whether the speaker saw or fought it. Keep the referent and action provisional. |
| `60280` | English `darling` may be an affectionate address, but Korean `여보` can imply a spouse or intimate relationship; the Japanese drops the endearment and the speaker is not established. Preserve the wording pending context. |
| `60295` | `Frozen Fire` may be a named material; Japanese preserves a name-like form while Chinese is descriptive. Retain the current wording pending a source-supported terminology decision. |
| `60298` | This line explicitly describes `the Sorrows` as the House's inheritance and as magic collected and shaped over centuries, supporting the magical-force reading in Korean `비탄의 힘`. The status of capitalized `Delving` remains unresolved. This context does not establish the precise referent of `the key to the Sorrows` at `60075`; preserve that earlier hold. |
| `60318` | Capitalized `the Court` is not identified in English. Japanese names the Hero's Court and Chinese uses a different court term; Korean `궁정` remains broad. Retain pending clearer context. |
| `60335` | Capitalized `his Well` and `mine` may name a technical revival mechanism or place. Japanese and Chinese use ordinary well/spring terms; retain Korean `샘` without claiming a canonical term. |
| `60337` | English `latest outfit` can mean equipment or an operation/site; Japanese and Chinese support equipment, while Korean chooses `사업장`. The asset does not settle the source meaning, so keep this wording provisional. The spelling `비르(Foreman Vire)` itself matches the previously verified name correction. |

## Repeated English and Structure

- Fifty-nine exact-English duplicate groups across the corpus touch this
  range, comprising 1,178 corpus rows; 59 IDs in the range participate.
  Korean wording is identical within every group.
- Three rows contain embedded line breaks: `60360`, `60378`, and `60398`.
  Each language has 19 embedded breaks in total across the range; per-row
  break counts match.
- Runtime-token and detected markup sequences match across all four
  languages. No token-order exception was found.
- Of 250 IDs, 215 have indexed asset associations (221 links across 136
  assets), and 35 have none. Of the 185 newly recorded IDs, 150 are linked
  (154 links across 79 assets), and 35 are unlinked. Asset associations do
  not establish an individual speaker or playback order.

## Range Result

- All 65 pre-existing ledger rows remain unchanged; 185 new IDs are appended
  in ascending order. Nine correction candidates and seven new evidence-limited
  holds are recorded. Seven existing candidates and one existing hold were
  rechecked; the `60442` format finding remains report-only.
- The ledger covers 61,745 of 65,135 unique `default` IDs (94.79%), leaving
  3,390 unrecorded. Sequential coverage reaches `60499`; next is
  `60500`-`60749`.
- Candidate findings are proposals, not approval to edit translation CSVs.
  No translation CSV was changed.

## Verification

- English, Japanese, Chinese, and Korean each contain IDs `60250`-`60499`
  once and in identical ascending order; each full `default` file contains
  65,135 records with matching key order.
- All 61,745 ledger fingerprints validate, including the 65 rechecked and
  185 newly appended rows.
- The regenerated quest-asset index and catalogs reproduce exactly; all
  nine related tests and the CRLF-aware audit diff check pass.
