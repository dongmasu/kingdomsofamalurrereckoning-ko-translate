# Sequential `default` Revalidation: IDs `62250`-`62499`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 67 pre-existing ledger rows and preserved them. Appended the
  remaining 183 IDs in ascending order.
- Five new correction candidates and one evidence-limited meaning hold are
  recorded. Six rows also have an embedded-line-ending hold.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `62363` | Terminology / item format | `Flawless Mitharan Slaughtering Shaft` is rendered `학살 장창`, while other Mitharan `Shaft` items use `장대`, `자루`, and `축`. Establish one item-family term for `Shaft`; also consider pairing the complete named item label, not just `Mitharan`. | Medium-high |
| `62454` | Terminology | The test label `Scourge Damage [DO NOT USE]` is `재앙 피해`, while `Scourge Resistance [DO NOT USE]` at `62011` is `역병 저항`; Japanese uses the same plague term in both. Consider `역병 피해` to keep the pair consistent. | High |
| `62459` | Format / naturalness | `Your mortal ambassadors` is rendered `필멸자 대사(Ambassador)들은`, mixing a singular English title with a Korean plural suffix and leaving the full English phrase unpaired. Consider a natural, complete plural pairing such as `필멸자 대사들(Mortal Ambassadors)`. | Medium-high |
| `62474` | Meaning | `with the rest of Dolve Arne` refers to the place/estate left to decay, as supported by Japanese `Dolve Arneごと` and other rows identifying Dolve Arne as a stronghold. Korean instead adds `다른 ... 유물들`, suggesting other artifacts. Consider wording that leaves the staff and talisman to decay along with Dolve Arne. | High |
| `62486` | Format / terminology | The three formal gnomish castes are capitalized in English, but Korean pairs only `Templars` and `Praetorians`, not `Scholars`. Consider a parallel form such as `학자(Scholars), 템플러(Templars), 프레토리안 근위병(Praetorians)`. | Medium |

## Evidence-Limited Hold

| ID | Dimension | Question and disposition |
| ---: | --- | --- |
| `62496` | Meaning / kinship | English `my sister, Aara` does not specify an older or younger sister. Japanese says older sister (`姉`) while Chinese says younger sister (`妹妹`); Korean chooses `언니`. Do not resolve the age relationship without stronger evidence. |

## Rechecked Existing Findings

These IDs already have append-only ledger rows; their rows and prior
dispositions remain unchanged.

| ID | Recheck |
| ---: | --- |
| `62309` | English `You're better than this`, Japanese `you seem better than the other people`, and Chinese `you can do better` do not fully align. Retain the existing meaning hold. |
| `62312` | The reference to “a little fire” is rendered as `화염 물약`; Japanese explicitly supports a fire-attack potion, while English leaves the item implicit. Preserve the existing candidate. |
| `62319` | `애도하고 있어` is still unnatural for grieving that the speaker cannot perform the rite alone; the Japanese and Chinese express sorrow. Preserve the existing naturalness candidate. |
| `62327` | The line refers to sprites, but Korean leaves `스프라이트` unpaired. Preserve the existing terminology/English-pairing candidate. |
| `62380` | The speaker identifies himself as Sihtric Vorm, and Korean uses marked `환영하오` / `이오` against Japanese plain speech. Preserve the existing speech-level candidate without extending it to other lines. |
| `62402` | The utterance still shifts among `정말인가?`, `써 보지 못했어`, and `기다리겠네`; English and Japanese use conversational plain speech. Preserve the existing candidate. |

## Additional Cross-Checks

- Forty-nine exact-English duplicate groups touch this range, comprising 51
  range IDs and 742 corpus rows. Korean wording matches within every group.
- Six rows contain embedded line breaks, totaling 28 breaks in each language.
  Per-row logical break counts match; all embedded Korean separators are
  CRLF while English, Japanese, and Chinese use LF. Preserve the CSV bytes;
  do not normalize these separators during review.
- Runtime and display marker identities and order match. At `62397`, the
  content inside `{*1...}` is localized as `[지속 효과]`, corresponding to
  the source labels `[Passive]`, `[パッシブ]`, and `[被动]`; the marker
  wrapper itself is preserved.
- Of 250 IDs, 196 have indexed asset associations (200 links across 119
  assets), and 54 have none. Of the 183 newly recorded IDs, 129 are linked
  (132 links across 69 assets), and 54 are unlinked. Asset associations do
  not establish per-key speakers or playback order.

## Range Result

- All 67 pre-existing ledger rows remain unchanged; 183 new IDs are appended
  in ascending order. Five new correction candidates and one
  evidence-limited meaning hold are recorded. Six embedded line-ending
  holds are recorded separately.
- The ledger covers 63,210 of 65,135 unique `default` IDs (97.05%), leaving
  1,925 unrecorded. Sequential coverage reaches `62499`; next is
  `62500`-`62749`.
- Candidate findings are proposals, not approval to edit translation CSVs.
  No translation CSV was changed.

## Verification

- English, Japanese, Chinese, and Korean each contain IDs `62250`-`62499`
  once and in identical ascending order; each full `default` file contains
  65,135 records with matching key order.
- All ledger fingerprints validate, including the 67 rechecked and 183
  newly appended rows.
- The regenerated quest-asset index and catalogs reproduce exactly; related
  tests and the CRLF-aware audit diff check pass.
