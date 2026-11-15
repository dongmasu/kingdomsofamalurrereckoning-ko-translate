# Sequential `default` Revalidation: IDs `50500`-`50749`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 64 existing four-language fingerprints; all match. Added the
  other 186 IDs to the review ledger without changing existing rows.
- Recorded 11 current correction-candidate IDs and eight evidence-limited
  holds. No IDs overlap; 231 IDs have no current finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Existing ledger entries remain unchanged as historical records.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `50503` | Terminology / format | The reagent list pairs `Cripplespore Caps`, `Scarwood Bark`, and `Essence of Fate` with English, but gives only `혈근초` for `Bloodroot`. The established item form is `혈근초(Bloodroot)`; add the missing pairing without changing the quantity or list layout. | High |
| `50506` | Terminology | In the Travelers' hierarchy, `a seer` is rendered `점쟁이`, which suggests a fortune-teller and is less fitting for the established role `선견자(Seer)`. Align the role term while preserving the criticism that people depend on the Seer's words to steal and earn a living. | High |
| `50508` | Name format | The named `circlet of Arkes` is rendered `아르케스의 서클릿` without its English form. Pair the named object, e.g. `아르케스의 서클릿(Circlet of Arkes)`, while retaining the instruction to find Secandra beneath the city. | High |
| `50533` | Terminology / name format | `Hurvar's Doorsil` is rendered `허바르의 문턱`, while the same named location elsewhere is `허바르(Hurvar)의 문지방(Hurvar's Doorsill)`. Reuse the established name and wording; note that this source row spells `Doorsil` without the final `l`. | High |
| `50541` | Terminology / consistency | This materials list still has `해변석`, `잿나무`, and lowercase `seasteel`, while related material rows establish `비치스톤(Beachstone)`, `엠버우드(Emberwood)`, and capitalized `Seasteel`. Align the materials and English pairings without changing the quantities. This carries forward the supported material-family finding in `dialogue-context-five-gravehal-restoration-assets-revalidation-20261111.md`. | High |
| `50684` | Terminology | The objective `Listening to Echoes` is still translated literally as `메아리에 귀 기울이기`, although its linked asset and related entries identify Colet and the Echoes as a musical group. Reuse a group-aware form such as `에코즈(Echoes) 공연 감상하기`. The prior source-supported finding remains open. | High |
| `50710` | Format | `처녀의 두건(Cowl of the Maiden)` is followed immediately by a second `(Cowl of the Maiden)`. Remove the duplicate parenthetical, preserving the item name and sentence structure. | High |
| `50711` | Meaning / naturalness | `언젠가 전설 속에서 다시 만나자` adds both “someday” and “again” to `I'll see you in the tales of legend`. Consider `친구여, 전설 속에서 만나자. 이제 가.` or another natural form that preserves the farewell without adding a prior meeting or a specific time. | Medium |
| `50723` | Terminology / consistency | This job-board title remains `실종된 측량사`, while the same Idylla sewer-inspection `surveyor` role is grouped with related titles using the proposed consistent term `조사관`. Recheck and align the title with the supported role terminology. The earlier asset-level finding remains open. | High |
| `50724` | Naturalness | `알라레인에 도달하기까지 네가 애쓴 얘기` is an awkward rendering of “your work in reaching Alarane.” Consider `알라레인(Alarane)을 찾아가는 데 네가 애썼다는 얘기는 들었다` while preserving the conditional approval and the reference to the King of Sorrows. | High |
| `50725` | Name format | `the Oracle` is the named/established role `신탁자(Oracle)` in the final-reward instruction, but Korean gives only `신탁자`. Add the English pairing without changing the journal objective or the completed-sacrifice meaning. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `50515` | Title / meaning | `Primos` remains paired, but the line does not establish whether it is a personal name, office, or title. Japanese transliterates it while Chinese reads it as a leader; retain the existing unresolved interpretation. |
| `50517` | Speech level / honorifics | Korean uses `자네` and honors Akara with `께서`/`축복하셨어`, while Japanese addresses the listener more casually. The asset does not map this key to a specific speaker or relationship; do not normalize the voice by guessing. |
| `50532` | Speech level / address | Korean `자네` and `-겠네` are more marked than the plain Japanese and Chinese wording. The linked quest asset does not establish the speaker's relationship to the listener; retain the register question. |
| `50589` | Meaning / naturalness | The ending `It is just one, to be sure` is an incomplete or unusual clarification. Japanese describes the reward as meager, while Chinese and English retain a “one” reading. Keep `물론, 하나뿐이지만` provisional until the reward context resolves the intended sense. |
| `50602` | Source discrepancy | English `Hm?`, Chinese `嗯？`, and Korean `응?` are interjections, but Japanese `では` means closer to “well then.” Retain the English-aligned Korean and record the locale discrepancy rather than forcing an unsupported change. |
| `50656` | Lore / source discrepancy | `The breaking of the Fae` is rendered as `페이의 분열`, consistent with Chinese, while Japanese says `フェイの侵入` (“the Fae's invasion/entry”). The event's intended meaning is not established by this fragment; retain the translation provisionally. |
| `50663` | Meaning / fragment | `Are you?` is an incomplete response whose force depends on the preceding exchange. `그래?` is plausible, but the fragment alone cannot establish a more precise Korean response. |
| `50703` | Meaning / referent | English “he's gone” and Chinese “he is no longer here” do not explicitly say that Etair died, while Japanese does. Korean follows the explicit Japanese death reading; keep this as a source/context hold rather than adding or removing the death claim in isolation. |

## Rechecked Findings and Structure

- The 64 pre-existing ledger fingerprints in this range match the current
  English, Japanese, Chinese, and Korean rows. Existing ledger entries were
  not overwritten.
- Earlier candidates at `50541`, `50684`, and `50723` remain supported by the
  current text and evidence. The earlier candidate at `50572` is cleared for
  this row: `보름(Vorm) 가문` already follows the established family-name
  wording; the historical ledger row remains unchanged.
- Fifty-two exact-English duplicate groups touch this range, covering 54
  target rows. Korean matches within every such group, including groups that
  also contain IDs outside this range.
- Three entries contain embedded line breaks: `50503` (five per language),
  `50526` (one per language), and `50643` (one per language). The total is
  seven in each language. Runtime/display marker identities and order match
  across the range.
- Of 250 IDs, 200 have indexed asset associations, represented by 203
  ID-asset links; 50 have no indexed asset. Of the 186 newly recorded IDs,
  136 have indexed associations and 50 do not. Asset links do not establish
  per-key speakers or playback order.

## Range Result

- This range has 11 current correction-candidate IDs and eight
  evidence-limited holds; 231 IDs have no current finding.
- After appending 186 IDs, the ledger covers 54,515 of 65,135 unique
  `default` IDs (83.70%), leaving 10,620. Sequential coverage reaches
  `50749`; next is `50750`-`50999`.
- Findings remain proposals requiring separate approval. No translation
  CSV was changed.
