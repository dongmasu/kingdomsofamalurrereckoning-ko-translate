# Sequential `default` Revalidation: IDs `15250`-`15499`

- Date: 2026-11-11.
- Scope: compare active Korean with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- All 250 IDs were checked across the four language tables. Sixty-three
  existing ledger rows had current fingerprints; 187 new rows were added.
- Four new correction candidates and four evidence-limited holds are recorded.
- No translation CSV, source resource, extracted game asset, or localization
  binary was changed.

## Correction Candidates

These findings are review proposals, not authorization to edit the active
translation CSV.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `15290` | Meaning / tense | English asks whether the player is enjoying the current exploration; Japanese is also present-tense. Korean `즐거웠나?` asks about a completed past experience. Consider `리케이오스(Lykeios)를 둘러보는 건 즐거워?`. The English source's `your` is a typo and does not change the intended question. | High |
| `15316` | Meaning / naturalness | English `united once again`, Japanese `再び会えた`, and Chinese `再次相聚` describe Caelrod and the speaker meeting/reuniting. `다시 하나가 되어` can instead suggest becoming one entity or joining forces. Consider `케일로드(Caelrod)와 다시 만나게 되어 기뻐.` | High |
| `15400` | Naturalness | `필멸자들은 ... 상대하고도 남을 만큼 질리도록 상대했어` repeats `상대` and is awkward. Preserve the hyperbole that the speaker has dealt with mortals for more than several lifetimes; for example, `사막 바람의 속삭임이나 듣게 내버려 둬. 필멸자라면 여러 생을 살아도 질릴 만큼 상대했어.` | Medium-high |
| `15499` | Meaning / naturalness | English compares the child to the speaker as a hero (`ten times the hero I've ever been`); Japanese and Chinese also compare the child with the speaker. Korean `내가 평생 해 온 것보다` compares the child with the speaker's lifetime actions. Consider `얘야, 넌 나보다 열 배는 더 훌륭한 영웅이야.` and retain the following encouragement and fatigue. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `15301` | Meaning / title | `Captain` is rendered as `선장`; Japanese supports the nautical sense, while Chinese uses a leader/captain sense. The isolated name label does not resolve the rank. Retain pending context. |
| `15318` | Meaning | English and Chinese say `rock`, while Japanese says `island`. Korean `바위섬` combines the readings and may be contextually valid, but this row alone does not establish the intended landform. |
| `15397` | Terminology / rank | `Adept Fel` remains unresolved: Japanese uses `魔道師`, Chinese uses `侍者`, and Korean uses `숙련자`. Do not establish a canonical rank translation or add a title pairing from this row alone. |
| `15461` | Meaning | The English sentence is an incomplete fragment (`The pitiful creature wanted, and that is not our nature.`); Japanese and Chinese construe its first clause differently. Korean supplies an unspecified object. Hold until surrounding text resolves the fragment. |

## Existing Findings Rechecked

- All 63 existing records in the range have fingerprints matching the current
  English, Japanese, Chinese, and Korean rows. Their prior dispositions were
  retained without duplicate ledger rows.
- The existing `15326` name/format candidate remains documented in
  `dialogue-context-three-handler-assets-kvsq01-sq27-dlc1sq03-revalidation-20261111.md`;
  it was not counted again here.
- IDs `15263` and `15395` share the exact English `Quest Complete` string.
  Their Korean translations both read `퀘스트 완료`.

## Source and Structural Checks

- All 250 IDs are present in matching order in the four language tables.
  Logical line-break counts match across all four languages.
- Runtime arguments, layout tokens, and display-wrapper structure match
  across the four languages; localized wrapper labels are not treated as
  structural differences.
- Nine Korean strings contain 25 existing embedded CRLF breaks; they were
  preserved.
- Of the 187 new IDs, 132 have indexed asset links and 55 do not; one ID
  links to multiple assets. These are context clues only. IDs `15256` and
  `15327` explicitly self-identify as Cydan the Outcast and Telogrus,
  respectively. No other speaker or playback order was inferred from asset
  membership, NPC symbols, handlers, or row order.

The ledger now contains 28,456 of 65,135 IDs (43.69%), leaving 36,679
unreviewed. Four-language fingerprints and per-ID dispositions are recorded
in [`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
