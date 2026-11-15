# Sequential `default` Revalidation: IDs `57250`-`57499`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 73 pre-existing ledger fingerprints; all match. Preserved
  those rows and appended the other 177 IDs in ascending order.
- Ten correction candidates are recorded on new rows; two further candidates
  at existing IDs `57391` and `57448` are documented without rewriting their
  ledger rows. Four existing candidates and three evidence-limited holds
  were rechecked without rewriting their ledger rows. No new
  evidence-limited hold was identified.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `57265` | Name / format | The gnomish title `Templar` appears twice, but the Korean pairs only `Octienne` and `Jorielle`. Pair the title as well, e.g. `템플러(Templar) 옥티엔(Octienne)` and `다른 템플러(Templar)인 조리엘(Jorielle)`. | High |
| `57266` | Meaning / naturalness | `east wing` is translated `동쪽 동`, an unnatural and unclear construction. Japanese says `東棟` and Chinese `东厢房`; use a clear building/wing form such as `동쪽 건물` consistently in both mentions. | High |
| `57272` | Meaning / terminology | `Each impulse` and `per impulse` are rendered as `한 번 발동할 때마다` and `발동 1회당`. Japanese `波動` and Chinese `脉冲` support a pulse/wave, not an activation. Consider `파동마다` / `파동당`, preserving the existing line break and damage values. | High |
| `57325` | Name / format | `The Font` is a named spring in this setting. Korean `샘` omits its established English pairing; use `샘(The Font)`. | High |
| `57372` | Naturalness / terminology | The three named tasks are rendered as the awkward `체류의 여정을 하고, 봉사를 행하고, 나 자신을 선물로 바쳐`. Japanese identifies distinct rites, and the established cross-row labels are `순례(Sojourn)`, `봉사(Service)`, and `선물(Gift)` (e.g. ID `5527`). Recast the sentence naturally while retaining those task names and the meaning of giving of oneself. | Medium-high |
| `57391` | Name / format | The source names both `Camden` and `Gizela Wulflac`, but only Gizela's name is paired. Add the missing first-name pairing: `캠던(Camden)과 기젤라 울플랙(Gizela Wulflac)`. | High |
| `57399` | Meaning / naturalness | English and Japanese connect the last thought additively (`And` / `それに`), but Korean uses contrastive `하지만`. The final clause is also stiff. Prefer an additive transition such as `게다가`, and a natural equivalent of keeping the person in sight until an answer is obtained. | High |
| `57437` | Terminology / format | `The Testament` is the established Belen death-cult faction, not a generic transliteration `테스타먼트`. Use the established Korean faction term with a source-matched short-form English pairing, without adding `Belen's` to this English row. | High |
| `57438` | Terminology / format | This is the same faction as ID `57437`; standardize the short reference to the same Korean term and English pairing rather than `테스타먼트`. Preserve the speaker's curse and tone. | High |
| `57448` | Name / format | The complete place name is `Njordir's Font`. The established form at ID `13352` is `뇨르디르의 샘(Njordir's Font)`; use that complete label here instead of splitting the deity annotation from `샘`. | High |
| `57472` | Name / format | This lore passage omits English pairings for established names including `Alfaria`, `Fortenmar`, `Hironar`, `Seelie Court`, and `Faelandsh`; `Great Houses` is also rendered without its source label. Add source-matched pairings using the accepted Korean forms. Verify the existing `서부 패란즈` rendering against the exact source `western Faelandsh` rather than silently changing the name. | Medium-high |
| `57492` | Name / format | The named dice games `High Roll` and `Ranged Roll` are given only as `하이 롤` and `레인지 롤`. Add their exact English pairings and preserve the explanation that each uses two dice. | High |

## Rechecked Existing Findings

| ID(s) | Current finding and disposition |
| --- | --- |
| `57348` | The capitalization and Japanese/Chinese wording support the Font/spring reading, but the earlier review held the exact referent of `Font's yield` unresolved. No new scene or map evidence was found; preserve the hold rather than infer a place-name pairing. |
| `57368` | `드문 공석` remains an unnatural collocation for a rare vacancy. The existing candidate to use a natural phrase such as `흔치 않은 공석` remains supported. |
| `57373` | ID `7498` explicitly identifies Oraven in the same asset; both Japanese lines use plain conversational style, while this Korean line alone uses `-요`. The existing speech-level/naturalness candidate remains supported; asset order is not inferred. |
| `57384` | The title `The Blades and the Seal` refers to the Ansilla medallion, not an act of sealing. Japanese uses `紋章`, and the same quest consistently uses `인장` for `Seal`; the existing proposal `칼날과 인장(Blades and Seal)` remains supported. |
| `57390` | English and Chinese say `Aurela`; Japanese says `Corelon`. Korean follows English. The asset-level compound NPC symbol does not resolve the source conflict; keep the hold. |
| `57408` | The existing cross-row candidates remain supported: standardize the same `vagrants` group consistently, and use the established `아다루스 동굴(Adarus Hollow)` form when that complete place name is intended. |
| `57425` | Korean uses polite speech while Japanese is plain. The linked multi-character asset does not identify this line's speaker or relationship; keep the speech-level hold. |

## Additional Checks

- Fifty-nine exact-English duplicate groups across the corpus touch the range,
  covering 897 rows. Korean differs in one group for `I'll be back tomorrow.`;
  Japanese also varies between polite and plain forms, so retain the
  source-supported Korean difference.
- Four rows contain embedded line breaks: `57272` (1), `57331` (2), `57380`
  (2), and `57467` (1). Each language has six embedded breaks total, with
  matching per-ID counts.
- Runtime, display, and layout marker identities and order match after
  accounting for translated text inside display wrappers.
- Of 250 IDs, 190 have indexed asset associations, represented by 193
  ID-to-asset links across 135 assets; 60 have none. Of 177 newly recorded
  IDs, 117 are linked through 120 links across 71 assets, and 60 are
  unlinked. Asset associations do not establish per-key speakers or playback
  order.

## Range Result

- All 73 pre-existing ledger rows remain unchanged; 177 new IDs were appended
  in ascending order.
- The ledger covers 59,504 of 65,135 unique `default` IDs (91.35%), leaving
  5,631 unrecorded IDs. Sequential coverage reaches `57499`; next is
  `57500`-`57749`.
- The ten new-row candidates and the two findings at existing IDs are
  proposals only. Existing findings remain documented without rewriting
  their append-only ledger rows. No translation CSV was changed.
