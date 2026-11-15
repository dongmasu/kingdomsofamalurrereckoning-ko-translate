# Sequential `default` Revalidation: IDs `53000`-`53249`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 77 existing ledger fingerprints; all match and those rows
  remain unchanged. Added the other 173 IDs in ascending order.
- Recorded ten current correction candidates and two evidence-limited holds;
  238 IDs have no current finding. These groups do not overlap.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit. Existing candidates were rechecked against current source rows and
their linked reports; no individual speaker or playback order is inferred.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `53009` | Meaning | English says the writer is attending a colleague's research proposal; Japanese says they accompanied the colleague, and Chinese says they participated. Korean `연구 계획을 살펴보고 있어` instead reads as reviewing the plan. Consider wording that preserves attending or participating, without specifying a presentation not established by the sources. | Medium-high |
| `53065`, `53177` | Terminology / consistency | These rows have identical English and Korean text. The same Gravehal construction context uses several translations for `Gallery`, while its named `Gravehal Gallery` and `Art Gallery` are `그레이브홀 미술관` and `미술관`. Consider `미술관` consistently in both IDs. | High |
| `53104` | Naturalness | The observation `I see all Fates... but not... yours` is conversational in English and Japanese. Korean `나는 모든 운명을 본다` sounds declarative in isolation. Consider `모든 운명이 내게는 보여... 하지만... 네 운명은 보이지 않는군`, preserving the pauses without assigning a speaker. | Medium |
| `53121` | Speech level | Korean shifts into marked `-네/-걸세` (`반갑네`, `기뻐할 걸세`), while English and Japanese use conversational wording. Consider `다시 만나 반가워. 학자 네렌(Scholar Nerenne)도 네가 실험을 도와주면 무척 기뻐할 거야.` This is a row-level register proposal, not a speaker attribution. | Medium |
| `53161` | Meaning | English, Japanese, and Chinese state that the first Erran Gastyr arrived `generations ago`; Korean omits that time span. Consider adding `몇 세대 전` while preserving the sequence of the tower and Klurikon-tree images. | High |
| `53167` | Format / terminology | `Sagecraft Altar` is rendered `마법물품 제작 제단`, while the same full term is paired as `마법물품 제작 제단(Sagecraft Altar)` at `50880`. Consider adding the English pairing here. | High |
| `53176` | Naturalness | The literal passive `브리슬텅 향신료는 ... 식생에서 생산되고 있다` is awkward for a spice that grows on plants. Consider wording that distinguishes where Bristletongue occurs from where it is currently found, such as `브리슬텅(Bristletongue)은 시들어 가는 특정 식물에서만 얻을 수 있어. 지금은 도시의 마법 원천인 샘(The Font) 근처의 식물에서 자라고 있지.` | Medium-high |
| `53210` | Format / name consistency | The proper name `Hyperian` appears as `하이페리언` without its English pairing, although other active references use `하이페리언(Hyperian)`. Consider adding the pairing in `하이페리언(Hyperian)이 그 중심에 떠 있다.` | Medium-high |
| `53247` | Terminology / consistency | `Moderate increase to Mana` is `마나 중간 폭 증가`, while the parallel `Moderate increase to Health` at `27164` is `체력 중간 증가`; `Small` and `Large` Mana increases use `소폭` and `대폭` at `54971` and `31148`. Consider `마나 중간 증가` to match the parallel label pattern. | High |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `53057` | Meaning / gender | English calls the target `a man who came back from the dead`; Japanese and Chinese use gender-neutral wording, while Korean says `남자`. The line alone does not establish whether English `man` is specifically gendered or generic. Keep the Korean wording provisional rather than assigning or removing gender without stronger context. |
| `53200` | Meaning / place name | The English says `Souldeep`, while the linked entry elsewhere in the same asset names `Souldeep Fasting`. Japanese and Chinese do not establish whether this is a shortened proper name or a descriptive reference to the depths. Retain the current wording pending clearer context. |

## Rechecked Findings and Structure

- Three pre-existing candidates remain supported: `53065`, `53104`, and
  `53176`; the existing hold at `53200` remains unresolved. The new
  `53177` row duplicates `53065` exactly in English and Korean, so it shares
  the Gallery terminology candidate. Existing ledger rows and fingerprints
  were not changed.
- Seventy-four exact-English duplicate groups across the corpus touch this
  range, covering 77 target rows. Korean wording matches within every group;
  no duplicate translation mismatch was found.
- Three entries contain embedded line breaks: `53146` (2), `53150` (4), and
  `53175` (9). Per-ID break counts match across all four languages; Korean
  embedded separators are CRLF while the references use LF. Line structure
  is preserved.
- At `53154`, all four languages retain `{1}`, `{2}`, `{3}`, and `{4}`; the
  Japanese source places `{2}` before `{1}`, while English, Chinese, and
  Korean place `{1}` before `{2}`. This source-specific argument ordering is
  preserved. The layout and display-wrapper sequence at `53248` also matches
  after normalizing localized wrapper contents.
- Of 250 IDs, 209 have indexed asset associations, represented by 215 links
  across 134 assets; 41 have no indexed asset. Of the 173 new IDs, 132 have
  indexed associations (136 links across 76 assets) and 41 do not. Asset
  links do not establish per-key speaker or playback order.

## Range Result

- This range has ten current correction-candidate IDs and two
  evidence-limited holds; 238 IDs have no current finding.
- After adding 173 IDs, the ledger covers 56,351 of 65,135 unique `default`
  IDs (86.51%), leaving 8,784. Sequential coverage reaches `53249`; next is
  `53250`-`53499`.
- Findings remain proposals requiring separate approval. No translation CSV
  was changed.

## Append-Only Status Reconciliation

The re-review above raised findings for IDs already present in the
append-only ledger: candidates `53009`, `53121`, `53161`, and `53177`, plus
the evidence-limited hold at `53057`. Their existing ledger rows were not
overwritten, so the regenerated catalog still shows the earlier dispositions
for those IDs. The current re-review findings are the latest assessment and
do not add coverage. `53177` has the same four-language source and Korean
text as `53065`; its Gallery proposal is the same terminology question
already recorded for `53065`, not a separate wording discrepancy.
