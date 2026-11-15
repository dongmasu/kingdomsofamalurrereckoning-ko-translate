# Sequential `default` Revalidation: IDs `60750`-`60999`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 60 pre-existing ledger fingerprints and preserved those rows.
  The remaining 190 IDs are appended in ascending order.
- Seven new correction candidates and four evidence-limited holds are
  recorded. Five existing candidates and two existing holds were rechecked
  without rewriting their append-only rows. A repeated-source variation at
  existing ID `23436` remains report-only.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `60807` | Meaning / nuance | `beginning to master the magical arts` is stronger than merely starting to learn magic. Japanese says they are beginning to master it, and Chinese likewise says they are beginning to grasp it. Consider `위압적인 체격을 지녔지만, 콜로사이(Kollossae)는 마법에도 점차 능숙해지고 있어.` | Medium |
| `60860` | Format | `Niskaru` is paired twice in one short sentence. Consider pairing it once: `니스카루(Niskaru)였겠지. 난 니스카루가 싫어.` | Medium |
| `60887` | Objective style | `Talk to Cora Banick` is rendered as `...과 대화`, unlike the established action-form objective. Consider `코라 배닉(Cora Banick)과 대화하기`. | High |
| `60899` | Objective style | `Kill the Fire Sprite Champion` is rendered as `... 처치`, without the established action ending. Consider `불 정령 챔피언 처치하기`. | High |
| `60915` | Name / format | Japanese identifies the constructed Court as the Summer Court, while Korean says only `궁정`. Consider pairing the complete term: `여름 페이(Summer Fae)와 그들이 세운 여름 궁정(Summer Court)에 대한 대응으로`. | Medium |
| `60934` | Creature-name format | The source names a `Niskaru Lord`, but Korean pairs only `Niskaru`. The established complete form at `55488` is `니스카루(Niskaru) 군주(Niskaru Lord)`. | High |
| `60959` | Speech level | Korean uses marked `-오/-소` speech throughout, while Japanese uses rough plain first-person `俺` and Chinese is also plain. Consider conversational plain style, e.g. `난 전사일 뿐, 그 이상은 아니야. 명령받은 곳으로 갈 뿐이야. 방패벽에서 전우들과 피를 흘리며 싸우겠어. 내가 쓰러지거나 적이 모두 사라질 때까지.` | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Question and disposition |
| ---: | --- | --- |
| `60941` | Format | Embedded line-break count matches all three sources, but the Korean field uses one CRLF where English, Japanese, and Chinese use LF. The text is not normalized pending an explicit editing decision. |
| `60965` | Meaning | `the key to the Sorrows` does not establish whether this is a key belonging to the Sorrows or a key that leads to them. Japanese and Chinese phrase the relation differently; retain the current `비탄의 힘(Sorrows)의 열쇠` provisionally. |
| `60985` | Meaning | English `a blade ... that makes them authentic` leaves the referent of `them` unclear. Japanese emphasizes visitors wanting to buy the blade, while Chinese treats it as a genuine Fae blade. Retain the current reading pending stronger context. |
| `60993` | Format | All four languages have the same six paragraph breaks, but the Korean field uses CRLF for all six where the three sources use LF. Preserve the current bytes pending an explicit editing decision. |

## Rechecked Existing Findings

These IDs already have append-only ledger rows; the rows and dispositions
remain unchanged.

| ID | Current finding and disposition |
| ---: | --- |
| `60809` | The item is the named Mystic Hammer; `그 망치(Hammer)` still omits the established full name. Keep the existing candidate. |
| `60844` | `Gallery` terminology remains inconsistent with the Gravehal construction references, which favor `미술관`. Keep the existing candidate. |
| `60868` | The honorific choice for `Nyralim` remains insufficiently supported by the per-key context. Keep the existing hold. |
| `60945` | The Korean address/register remains uncertain without a mapped speaker. Keep the existing hold. |
| `60980` | The current `missing formula` wording uses `조제법`, the proposed scoped term. The broader quest consistency question remains in the earlier report; preserve its existing ledger row. |
| `60982` | Japanese makes the Hero the one who bloodied Balor; the Korean still reads as a fight with Balor. Keep the existing candidate. |
| `60998` | `slaving` is still narrowed to `노예 사냥`, while Japanese specifies slave trading. Keep the existing candidate. |

## Additional Report-Only Finding

| ID | Dimension | Finding and disposition |
| ---: | --- | --- |
| `60999` | Meaning / naturalness | `pull jobs` means committing thefts/criminal jobs in this context; Japanese explicitly says theft and Chinese says committing crimes. Korean `일할 때` obscures that meaning. Consider `도둑질할 때 쓰는 도구들이야. 제대로 된 트래블러(Traveler)라면 밥벌이에 필요한 도구 없이 도둑질하진 않지.` Its existing ledger row is `not-issue`; preserve that append-only disposition. |

## Additional Report-Only Finding

The exact-English group `Where can I find them?` (`15997`, `23436`, `44607`,
`60830`) has one Korean variation at `23436`; English, Japanese, and Chinese
are identical across the group. The in-range ID `60830` matches the other
three Korean rows. The variation at `23436` remains report-only because the
full dialogue context does not establish whether the wording difference is
intentional.

## Repeated English and Structure

- Fifty-six exact-English duplicate groups across the corpus touch this
  range, comprising 1,136 corpus rows; 56 IDs in the range participate.
  Three groups have Korean variants. The `All right then.` and
  `Mitharu keep you.` variants correspond to Japanese register/meaning
  differences; the `Where can I find them?` variant at `23436` does not.
- IDs `60941` and `60993` contain one and six embedded line breaks
  respectively in every language. The Korean embedded separators are CRLF;
  English, Japanese, and Chinese use LF.
- Runtime/display/layout marker identities and order match across the four
  languages. Localized display text inside markers is not compared literally.
- Of 250 IDs, 198 have indexed asset associations (201 links across 132
  assets), and 52 have none. Of the 190 new IDs, 138 are linked (141 links
  across 82 assets), and 52 are unlinked. Asset associations do not establish
  an individual speaker or playback order.

## Range Result

- All 60 pre-existing ledger rows remain unchanged; 190 new IDs are appended
  in ascending order. Seven correction candidates and four new holds are
  recorded. Five existing candidates and two existing holds were rechecked.
- The ledger covers 62,114 of 65,135 unique `default` IDs (95.36%), leaving
  3,021 unrecorded. Sequential coverage reaches `60999`; next is
  `61000`-`61249`.
- Candidate findings are proposals, not approval to edit translation CSVs.
  No translation CSV was changed.

## Verification

- English, Japanese, Chinese, and Korean each contain IDs `60750`-`60999`
  once and in identical ascending order; each full `default` file contains
  65,135 records with matching key order.
- All 62,114 ledger fingerprints validate, including the 60 rechecked and
  190 newly appended rows.
- The regenerated quest-asset index and catalogs reproduce exactly; all
  nine related tests and the CRLF-aware audit diff check pass.
