# Sequential `default` Revalidation: IDs `41250`-`41499`

- Date: 2026-11-12.
- Compared all 250 active rows across English, Japanese, Chinese, and Korean.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 74 existing ledger records and added 176 newly reviewed IDs.
- Recorded 21 correction-candidate IDs and six evidence-limited holds.
  `41271` has both a format candidate and a separate meaning hold; 224 IDs
  have no supported finding.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `41255` | Full-name format | `Argine, Queen of Staves` is rendered `지팡이의 여왕 아르진(Argine)`, pairing only the personal name. Pair the complete epithet/name, e.g. `아르진, 지팡이의 여왕(Argine, Queen of Staves)`. | High |
| `41256` | Naturalness | `그는 그녀의 사람이 되고, 그녀는 그의 사람이 될 수 있었다` is unevenly framed and can imply possession. Consider a reciprocal expression such as `서로의 사람이 될 수 있었다`, retaining the source's intimate tone and paragraph breaks. | Medium-high |
| `41262` | Naturalness | `전체에 걸쳐 에너지를 맥동시킨다` is an unnatural Korean construction. Prefer `지팡이 전체에 에너지가 맥동한다` or an equivalent that keeps the staff as the subject of the pulsing energy. | High |
| `41271` | Title format | `master-at-arms` is a role/title in the source but is not paired in Korean. Pair the title in this occurrence. The exact Korean role meaning remains a separate hold below; `Dregshore` itself is already paired. | High |
| `41281` | Naturalness | `거기 당신!` is stiff in this urgent call for help. Consider a natural attention-getter such as `저기요!`, retaining the polite request. | Medium-high |
| `41289` | Naturalness | `이 일을 끝까지 마치면` is redundant for completing the undertaking. Japanese and Chinese support a concise completion condition; consider `이 일을 무사히 마치면`. | Medium-high |
| `41315` | Name format | The named landmark `Wall of Saga` is rendered as `'사가의 벽'` without English. Pair the full name as `사가의 벽(Wall of Saga)`. | High |
| `41318` | Name format | The named item `Rose of Shadows` is rendered `그림자의 장미` without English pairing. Pair the complete item name. | High |
| `41333` | Name format | The standalone ability/item label `Divine Grasp` is rendered `신성한 손아귀` without English pairing. Add the source name in parentheses. | High |
| `41345` | Name format | `Lyra` is a named character in this sentence but is not paired. Add `리라(Lyra)` while retaining the already paired `Ommer Vogard`. | High |
| `41367` | Name format | The plant name `Cohosh` is left without English pairing in the journal entry. Pair the name and preserve the four-paragraph layout. | High |
| `41375` | Naturalness | The explanatory dialogue ends with written-sounding `마법을 만들었다`. Japanese presents the explanation in plain spoken style; consider a conversational ending such as `마법을 만들어 냈어`. This is a row-level naturalness proposal, not a claim about a confirmed speaker. | Medium |
| `41376` | Title format | The standalone title `On Creating Demand` is rendered `수요 창출에 관하여` without its English title. Pair the complete title. | High |
| `41395` | Name format | The form of address `Child of Dust` appears as `먼지의 자식` without English pairing. Pair it as `먼지의 자식(Child of Dust)` and retain the ellipsis and vocative. | High |
| `41418` | Title format | The role/title `First Sword` is rendered `제1검` without English pairing. Pair the title as `제1검(First Sword)`; do not infer additional rank details. | Medium-high |
| `41420` | Name format | The character `Askel` is not paired in this line. Add `아스켈(Askel)`; the remaining sentence is supported by the English and Japanese sources. | High |
| `41439` | Title format | The standalone title `Maid's Army` is rendered `시녀의 군대` without English pairing. Pair the full title. | High |
| `41455` | Meaning / naturalness | `finest mixtures` describes quality, while `내가 아끼는` can mean personally cherished. Prefer a quality-based phrase such as `내 최고급 혼합물`, retaining the rhetorical challenge. | Medium-high |
| `41471` | Objective format | The objective `Travel to the Field of Huber` lacks the established action-label ending and leaves the named place unpaired. Consider `휴버 평원(Field of Huber)으로 이동하기`. | High |
| `41474` | Place-name format | `Adessa's Isles` is rendered `아데사(Adessa) 군도` without pairing the full named place. Pair the complete place name, e.g. `아데사 군도(Adessa's Isles)`, while retaining the two distinct references to the experiment. | Medium-high |
| `41485` | Objective format | The objective `Kill Angharad Glyndowr` ends in `처치` rather than the established concise `-하기` form. Consider `앙가라드 글린도어(Angharad Glyndowr) 처치하기`. | High |

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `41264` | Meaning / source fragment | Every locale ends mid-sentence after “It would be a small matter to”. The continuation is unavailable in this key. Preserve the incomplete fragment; do not invent its object or completion. |
| `41271` | Meaning / title | The role `master-at-arms` is rendered `병기 담당관`, while Japanese describes a former security chief and Chinese a patrol chief. The exact institutional role is not established; retain the Korean meaning provisionally rather than substituting a trainer/armorer role. The missing English title pairing is recorded separately as a format candidate. |
| `41275` | Meaning / label | English contains only `Break`, Japanese repeats `Break`, Chinese says `pause`, and Korean says `파괴`. The isolated key does not establish whether this is a UI action, a break in dialogue, or a destructive verb. Hold a replacement pending UI/context evidence. |
| `41319` | Terminology / referent | `Plagueshield` is rendered as a countable preparation that can run out; Japanese and Chinese support a stock/supply sense but do not establish whether this is a potion, protective effect, or named item. Keep `역병 방호제` provisional. |
| `41426` | Material | English identifies a rare golden `wax`; Japanese says `脂`, while Korean `밀랍` specifically suggests beeswax. Existing quest context calls the material `Master's Tallow`, but the sources do not settle its composition. Retain the current wording pending stronger evidence. |
| `41492` | Name / referent | `the Sorrows` may refer to the named force/container, while Japanese and Chinese describe sorrowful entities or power differently. Korean `비탄의 힘` is plausible, but the exact referent and name form remain unresolved. |

## Rechecked Findings

- Seventy-four existing ledger fingerprints match the current four-language
  rows. Existing candidates `41255`, `41281`, `41289`, and `41375` were
  rechecked and retained. The role meaning at `41271` remains uncertain, with
  its missing title pairing recorded separately.
- The prior naturalness candidate at `41402` is released: IDs `41402` and
  `43547` have the same English, Japanese, Chinese, and Korean text, so there
  is no ID-specific Korean wording or tone inconsistency to correct.
- Existing material hold `41426` remains unresolved. Existing rows `41439`
  and `41455` are now recorded as candidates, and `41474` is promoted from
  not-issue to a full place-name format candidate.
- Fifty-one exact-English duplicate groups (956 corpus rows) touch this
  range. Korean matches within every group except `30574`, `33784`, and
  `41405`; the Japanese greetings differ, supporting the ID-specific Korean
  greetings rather than forced unification.
- Seven multiline rows contain 21 embedded Korean line breaks. Each row has
  the same line-break count across all four languages; the active Korean
  paragraph breaks are preserved.
- The 176 newly recorded IDs include 136 with indexed asset links and 40
  without. Across the full range, 210 IDs have indexed asset associations.
  Asset membership does not establish a key's speaker, branch, addressee, or
  playback order; unsupported attribution and sequence remain unknown.

## Range Result

- Rechecked 74 existing ledger records and added 176 new records. The range
  has 21 candidate IDs and six evidence-limited holds; `41271` has both
  dimensions. The remaining 224 IDs have no supported finding.
- The ledger covers 47,712 of 65,135 unique `default` IDs (73.25%), leaving
  17,423. Reviewed IDs with indexed asset links total 38,769; 8,943 have no
  indexed asset link. Sequential coverage reaches `41499`; next is
  `41500`-`41749`.
- Four-language fingerprints, generated catalogs, nine related index tests,
  and scoped diff checks must pass before this batch is considered recorded.
  Translation CSVs remain unchanged.
