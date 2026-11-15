# Candidate Reconciliation: IDs `58750`-`58999`

- Date: 2026-11-15.
- Rechecked all 15 correction candidates from the four-language sequential
  review against the current Korean CSV and prior ID-scoped decisions.
- Fourteen candidates were resolved: seven were already correctly reflected
  in the current text, and seven required supported edits. `58787` remains
  held because its isolated UI label lacks enough interface context.
- Rechecked nine earlier candidate findings without changing their existing
  ledger judgments. Two remain held for missing context (`58765`, `58835`).

## Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `58787` | Held | `Fast` is an isolated UI label. Japanese `速い` and Chinese `快速` suggest an adjective, but the control or stat context is unavailable; do not guess between a label such as `빠름` and another UI form. |
| `58789` | Already resolved | The current row pairs both `에샤라(Esharra)` and `비탄의 나무(Sorrows Tree)`; no edit is needed. |
| `58790` | Already resolved | The current row uses the approved combined form `오드바르 대사(Ambassador Odvar)` and retains his epithet. |
| `58811` | Already resolved | The title is already paired as `베크레스의 잔혹함(Vekreth's Cruelty)`. |
| `58825` | Already resolved | The current note title pairs `어비스(Abyss)` once; no duplicate English title remains. |
| `58830` | Corrected | The full loading label is `Concourse Central`, so the current `중앙 콩코스(Concourse)` was incomplete. Added the missing `Central`. |
| `58838` | Already resolved | The author is already paired as `마운(Maun)`. |
| `58845` | Corrected | English, Japanese, and Chinese identify the full place name `Eryie Peak`; added `(Eryie Peak)` to the Korean place label. |
| `58903` | Already resolved | Korean already instructs the player to select the equipment item that will receive the gem, and preserves all three display markers. |
| `58906` | Corrected | The English appositive identifies Longinous as the world-piercing spear. Recast the Korean so the spear's name is clear and paired: `세상을 꿰뚫은 창 롱기누스(Longinous)를 본떠 만들었다.` |
| `58914` | Already resolved | All reagent quantities are already separated from their bilingual names by a space; all four embedded line breaks remain unchanged. |
| `58928` | Corrected | Replaced the isolated 하게체 `말해 보게` and stiff phrasing with one conversational plain-style question, consistent with Japanese `光栄だな！…何かな？`. |
| `58942` | Corrected | The destination is the named Quays district. Added `Quays`, matching the established label at `default:2561` and existing `default:22127` usage. The relevant reference is `default:2561`, not `base:2561` (`base:2561` is an unrelated rivet item). |
| `58952` | Corrected | The standalone person label was untranslated in Korean. Added the Korean name and source spelling: `대니얼(Daniel)`. |
| `58992` | Corrected | Paired both capitalized role terms and tightened the sentence to retain the direct sense of “we truly mean it.” |

## Earlier Findings Rechecked

| ID | Disposition |
| ---: | --- |
| `58764` | The existing `램(Ram)` pairing is present. |
| `58765` | Retained as held: `Curse you` is a generic bark, and the exact force of the current Korean cannot be settled without bark context. |
| `58772` | Current `에어리(Aery)` and `제안한 대로` preserve the source; the earlier concern about an added diminutive is not present in the current text. |
| `58806` | The company name is already paired as `브래드 앤 서그렌 상회(Brad and Cergren Traders)` at all four identified occurrences. |
| `58835` | Retained as held: asset association does not establish that the short `Elrod` reference means Elrod Edman. |
| `58868` | The current self-introduction `난 땜장이야.` is natural and concise. |
| `58889` | The current Korean uses the attested `베셀리(Betheli)` form. |
| `58975` | The Korean describes dangerous, demented trees without adding the unsupported modifier “magical.” |
| `58994` | The Korean already matches the same-source rows `25576` and `63906` as `벨렌의 성약단(Belen's Testament)`. |

No speaker or dialogue order was inferred from asset association.

## Applied Changes

- `58830`: `중앙 콩코스(Concourse)를 불러오는 중` →
  `중앙 콩코스(Concourse Central)를 불러오는 중`
- `58845`: `에리예 봉우리` → `에리예 봉우리(Eryie Peak)`
- `58906`: `세상을 꿰뚫은 창, 롱기누스의 형상을 본떠 만들었다.` →
  `세상을 꿰뚫은 창 롱기누스(Longinous)를 본떠 만들었다.`
- `58928`: `기쁘군! 말해 보게. 다음 상황에서 힘을 가장 효과적으로 과시하는 방법은 무엇일까?` →
  `기쁘네! 그럼 다음 상황에선 어떻게 해야 힘을 가장 효과적으로 보여 줄 수 있을까?`
- `58942`: Added `(Quays)` to the destination label `부두`.
- `58952`: `Daniel` → `대니얼(Daniel)`
- `58992`: Paired `Shieldbrother` and `Shieldsister` and revised the sentence for naturalness.

## Result and Verification

- Fourteen of the 15 new candidates were reconciled; `58787` remains held.
- Candidate reconciliation is `3,312 / 4,026` (`82.27%`), with `714`
  remaining. Previously reconciled findings were not counted again.
- Only the seven edited IDs' `source_fingerprint` fields were refreshed.
- The active Korean `default` CSV retains 65,135 ordered unique records, its
  UTF-8 BOM, and its existing line-ending inventory: 71,839 CRLF and 242
  LF-only separators, with no bare CR.
- All 65,135 review-ledger fingerprints validate. The generated asset index
  and catalogs reproduce exactly; all 20 preservation and context-index tests
  pass. The CRLF-aware diff check passes.
- No source CSV, extracted game asset, or game binary was changed. No commit
  was made.
