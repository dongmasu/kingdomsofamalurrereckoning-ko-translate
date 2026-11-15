# Sequential `default` Revalidation: IDs `62750`-`62999`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 65 pre-existing ledger rows and preserved them. Appended the
  remaining 185 IDs in ascending order.
- Fourteen new correction candidates and two embedded-line-ending holds
  are recorded. The holds do not authorize newline normalization.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `62755` | Name / format | The English names `Kezar Ten-Fingers` and `Varani` are rendered only with Korean forms. Add source-name pairing without deciding whether the epithet should be translated or transliterated; the earlier D-19552 review leaves that Korean-form choice unresolved. | Medium |
| `62779` | Terminology / name format | `Adept Fel` is rendered `마법사 펠(Fel)`, while the same title appears elsewhere as `수련자 펠(Adept Fel)` and `숙련자(Adept Fel)`. Reconcile the rank wording with those uses and pair the complete English title; do not claim the Korean rank has a settled corpus-wide form. | Medium |
| `62828` | Name / format | `King's Token` is rendered `왕의 징표` without its English name, unlike the paired form at IDs `7448` and `51129`. Consider `왕의 징표(King's Token)` while retaining the source's token/qualification meaning. | High |
| `62830` | Naturalness / address | The terse questions become `당신은 대체 무엇인가? ... 도무지 알 수가 없군.` Japanese and Chinese are also terse; `당신` plus the stiff question wording reads unnatural in Korean. Recast the address and questions concisely without inferring a speaker or changing the uncertainty. | Medium |
| `62839` | Name / format | The row pairs `Corthis` but leaves `Mardalla Hest`, `Raghosh`, and `Hironar` unpaired. Add their exact English forms to the existing Korean names; keep their entity roles and Korean spellings separate from the unrelated `Corthis` epithet question. | Medium |
| `62842` | Name / format | The named dice game `High Roll` appears only as `하이 롤`, although the same game is paired as `하이 롤(High Roll)` elsewhere, including ID `2902`. Add the English pairing and preserve the two-dice/highest-total rule. | High |
| `62869` | Name / format | `Balla Lach` appears only as `발라 라치`. Add `(Balla Lach)` while leaving the current Korean rendering intact; this finding does not settle the group's canonical Korean spelling. | High |
| `62873` | Name / format | The standalone `Roth and Beatrice` label is rendered `로스와 베아트리스` without the source names. Add the complete English pairing without deciding whether the label denotes a title or a generic reference. | Medium |
| `62882` | Naturalness | `그래서 이제 우린 여기 있는 거야` is a literal, over-explanatory rendering of `So now we are here`; Japanese is closer to “and so it comes to this.” Consider a more natural, concise transition while preserving the barrier's fall and the present encounter. | Medium |
| `62895` | Name / format | The named place `Freehold` is rendered only as `프리홀드`. Add `(Freehold)` as in established active uses, but do not globally choose among the corpus's competing Korean renderings (`프리홀드`, `자유 영지`, and `자유영지`). | High |
| `62930` | Name / format | The standalone title `Woodland Justice` appears only as `숲의 정의`. Add the exact English title in parentheses; this row alone does not establish whether it is a book, quest, or other UI label. | Medium |
| `62967` | Name / format | `Captain Gastyr` is rendered `개스티르 대장` without the English name/title. Chinese supports the English reading; Japanese instead describes service in Gastyr's unit. Pair the full English name/title without expanding the Korean sentence beyond the English/Chinese evidence. | Medium |
| `62990` | Name / format | `Pupil Ibita` is rendered `견습생 이비타` without its English title/name. Add the complete source label in parentheses, without treating `Pupil` as a confirmed formal rank. | Medium |
| `62998` | Tense / meaning | `And she has paid for it, day after day` is rendered in completed past tense (`그녀는 날마다 그 대가를 치렀어`). Chinese also describes an ongoing daily cost. Consider `그녀는 날마다 그 대가를 치르고 있어` or an equivalent that preserves the repeated, continuing consequence. | High |

## Rechecked Existing Findings

These IDs already have append-only ledger rows; their prior rows and
dispositions remain unchanged.

| ID | Recheck |
| ---: | --- |
| `62794` | The earlier `Master Makers` uncertainty is superseded by the accepted bounded term decision D-21773: the current `명장들(Master Makers)` is supported. Keep the historical ledger row intact; no new correction is needed for this phrase. |
| `62826` | `우리를 위해` remains potentially narrower than English `for our people`; Chinese says “our people,” while Japanese uses “us.” Preserve the existing meaning candidate pending context. |
| `62870` | The Syllareta spelling remains unsettled across English, Japanese, Chinese, and Korean. Preserve the existing name candidate; do not normalize the Korean transliteration here. |
| `62874` | This is a quest objective, but `...와 대화` reads as a label fragment rather than the project's action-objective form. Preserve the existing naturalness/format candidate. |
| `62917` | English has `Lupoku`, while the Korean parenthetical says `Lopoku`; Japanese and Chinese support the English name. Preserve the existing source-name candidate. |
| `62969` | English's familiar address `dove` is absent in Korean; Japanese omits it and Chinese gives a different interpretation. Preserve the existing address candidate without inventing an endearment. |

## Additional Cross-Checks

- Fifty-eight exact-English duplicate groups touch this range, comprising
  60 range IDs and 1,085 corpus rows. Korean matches within every group.
- Two rows contain embedded line breaks: ID `62867` has four and ID `62966`
  has seven in each language. Logical break counts and poem structure match.
  Korean stores all 11 embedded separators as CRLF while the other language
  fields use LF; preserve the bytes and do not normalize them.
- Runtime-marker identities and order match across all four languages.
- Of 250 IDs, 200 have indexed asset associations (207 links across 119
  assets), and 50 have none. Of the 185 new IDs, 135 are linked (141 links
  across 69 assets), and 50 are unlinked. Asset associations do not establish
  per-key speakers or playback order.

## Range Result

- All 65 pre-existing ledger rows remain unchanged; 185 new IDs are appended
  in ascending order. Fourteen new correction candidates and two
  embedded-line-ending holds are recorded.
- The ledger covers 63,585 of 65,135 unique `default` IDs (97.62%), leaving
  1,550 unrecorded. Sequential coverage reaches `62999`; next is
  `63000`-`63249`.
- Candidate findings are proposals, not approval to edit translation CSVs.
  No translation CSV was changed.

## Verification

- English, Japanese, Chinese, and Korean each contain IDs `62750`-`62999`
  once and in identical ascending order; each full `default` file contains
  65,135 records with matching key order.
- All ledger fingerprints validate, including the 65 rechecked and 185
  newly appended rows.
- The regenerated quest-asset index and catalogs reproduce exactly; related
  tests and the CRLF-aware audit diff check pass.
