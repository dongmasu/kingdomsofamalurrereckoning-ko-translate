# Sequential `default` Revalidation: IDs `54250`-`54499`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 54 existing ledger fingerprints; all match and their rows
  remain unchanged. Appended the other 196 IDs in ascending order.
- Recorded 15 current correction candidates: 12 new findings and three
  supported findings rechecked from the existing ledger. One other existing
  candidate, `54396`, already has the proposed wording in the active Korean
  row. The prior `54422` terminology proposal remains evidence-limited and is
  treated as a hold in this report; its append-only ledger row is preserved.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Current Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `54254` | Naturalness | The commas in `마지막으로, 즐겨 택하는 수단` detach `마지막으로` from the phrase and weaken the deliberately paradoxical motto. Recast the whole clause so `last` and `joyous` clearly modify the choice of violence, e.g. `폭력은 앞날을 내다보지 못한 자가 마지막 수단으로 즐겁게 택하는 것이다.` | Medium |
| `54255` | Naturalness / speech level | The closing vocative `나의 자녀들이여` is awkwardly detached from the blessing, and `가거라` sounds more commanding than the Japanese blessing. Reorder the address and blessing into one reverent, natural utterance while retaining `my children` and Lyria's guidance. | Medium |
| `54278` | Speech level / naturalness | `놀라지 말게` shifts into marked `하게체`, then `난 적이 아니야` switches to casual speech. Use one conversational register throughout, e.g. `놀라지 마, 젊은이. 난 네 적이 아니야.` | High |
| `54283` | Objective style | The objective `Kill Finna and Arbos` is imperative `처치하라`, unlike the established compact `-하기` objective style. Consider `핀나(Finna)와 아르보스(Arbos) 처치하기`. | High |
| `54290` | Objective style | The objective `Kill Kolmir` is imperative. Consider `콜미르(Kolmir) 처치하기`. | High |
| `54328` | Naturalness / register | `낯선 이여` is literary and archaic for the plain greeting `Hello, stranger`; Japanese and Chinese use ordinary conversational greetings. Consider `안녕, 낯선 사람.` | Medium-high |
| `54366` | Speech level / naturalness | The first clause uses subject honorific `세상을 떠나셨어`, then shifts to casual `참 안된 일이야` and `반갑겠지`. Japanese is plain throughout. Use a consistent conversational line, e.g. `불쌍한 칸드리안 경(Lord Kandrian)이 잠든 사이 세상을 떠났어. 참 안됐지. 그래, 에리온 레이다른(Erion Rheidarn)이 새 칸드리안 경(Lord Kandrian)이 됐다는 소식은 반갑겠지.` | Medium-high |
| `54376` | Naturalness | `내 형제 기란의 책` is an awkward Korean possessive construction. Consider `내 형제인 기란(Giran)의 책이야`, without inferring the speaker's gender or age. | Medium |
| `54377` | Speech level / naturalness | `자네` is paired with otherwise casual sentence endings. Japanese uses plain conversational speech. Consider `내가 아는 한 포모러스 휴그(Fomorous Hugues)는 너를 피해 달아나고 있어.` | Medium |
| `54385` | Terminology consistency | Rechecked the existing Arena finding. The linked House of Valor context standardizes generic `Arena` as `투기장`; this row alone uses `아레나`. Retain the existing proposal to use `투기장` here. | High |
| `54388` | Objective style | The objective `Defeat Balor` is imperative `처치하라`. Consider `발로르(Balor) 처치하기`. | High |
| `54431` | Meaning | `their eggs` refers to the previously named Pteryx, but `짐승의 알` broadens the target. Name the species explicitly, e.g. `프테릭스(Pteryx)의 알`. | Medium-high |
| `54432` | Meaning / name format | `bag any banshaen` is translated as `잡다`, which may suggest capture, and the English pairing is lowercase. Japanese `始末した` and the established objective `밴션(Banshaen) 처치하기` support a hunt/kill reading and capitalized species name. Consider `밴션(Banshaen)은 좀 처치했어?` | Medium-high |
| `54443` | Meaning / naturalness | `I'll get my opportunity` is active and determined; Korean `기회가 오겠지` instead suggests waiting for an opportunity to arrive. Japanese `切符をつかんでみせる` supports actively seizing it. Consider `언젠가 영광을 거머쥘 기회를 잡을 거야. 모두에게 보여 주겠어.` | High |
| `54477` | Grammar / naturalness | `아풀레(Apule)이` uses the wrong subject particle after a vowel-final Korean name. Use `아풀레(Apule)가`. | High |

The three rechecked findings at `54385`, `54431`, and `54432` remain
supported. At `54396`, the active wording `놀랍군. 돌아왔구나.` already matches
the previously approved proposal, so this pass records no current Korean
issue for that ID; its earlier ledger row is not overwritten.

## Evidence-Limited Hold

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `54422` | Terminology | English `our order` could mean the Scholia Arcana organization, while Japanese `本学` and Chinese `我们学院` point toward an academy or institution. Korean `우리 교단` also differs from `우리 대학` and the previously proposed `우리 결사단`; existing project usage does not resolve which distinction is intended here. Retain the current wording pending a settled term decision. The earlier candidate ledger row remains unchanged. |

## Source Notes and Structure

- At `54309`, English `Eamonn Isle` differs from `Eamonn's Isle` at `54292`.
  Korean follows the current `54309` English spelling in its parenthetical;
  the evidence does not establish whether the English omission is an error.
  No Korean change is proposed.
- At `54429`, English and Chinese name Aurela, while the Japanese source says
  `コレロン` (Koreron). Korean follows English and Chinese; this is recorded
  as a source discrepancy, not a Korean correction.
- Fifty-six exact-English duplicate groups across the corpus touch this
  range, covering 889 target rows. The only Korean wording difference is the
  `I'll be back tomorrow.` group (`21693`, `36866`, `39132`, `43891`,
  `44058`, `54310`, `56999`, `57344`); its Japanese wording also differs
  between polite and plain forms, supporting the Korean distinction.
- Six rows contain embedded line breaks: `54337` (1), `54362` (6), `54405`
  (8), `54410` (1), `54490` (8), and `54495` (6), totaling 30 in each
  language. Korean retains CRLF inside those fields; English, Japanese, and
  Chinese use LF. The line-break counts and paragraph structure match.
- Runtime tokens at `54337` (`{1}`, `{2}`) and `54442`
  (`$TR_Shell.minn_wager$`) are preserved; token identity and order match
  across all four languages.
- Of 250 IDs, 139 have indexed asset associations, represented by 142 links
  across 82 assets; 57 have no indexed asset. Asset associations do not
  establish per-key speakers or playback order.

## Range Result

- The range has 15 current correction-candidate IDs and one evidence-limited
  hold. Of the 54 existing ledger IDs, three findings remain supported, one
  proposed correction is already present in the active Korean text, and one
  terminology finding remains on hold. The other 49 have no current finding.
- After adding 196 IDs, the ledger covers 57,301 of 65,135 unique `default`
  IDs (87.97%), leaving 7,834. Sequential coverage reaches `54499`; the next
  range is `54500`-`54749`.
- The ID catalog counts 45,533 reviewed IDs as asset-linked and 11,768 as
  unlinked. Of the 196 newly recorded IDs, 139 are linked through 142 links
  across 82 assets, and 57 are unlinked. Asset links do not establish
  per-key speakers or playback order.
- Existing ledger rows remain append-only. Findings require separate
  approval before any translation CSV edit; no translation CSV was changed.
