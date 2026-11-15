# Sequential `default` Revalidation: IDs `39000`-`39249`

- Date: 2026-11-12. Compared all 250 current rows across English, Japanese,
  Chinese, and active Korean. English is the primary meaning source; Japanese
  informs voice and register, with Chinese as supporting evidence.
- Rechecked 56 existing ledger records and reviewed 194 previously unrecorded
  IDs. Findings are review proposals, not authorization to edit translation
  CSVs.
- The range has 24 overall candidates and five evidence-limited holds. One
  older candidate at `39142` is resolved by the wording already present in the
  current Korean; `39095`'s ellipsis formatting is also retained as supported.

## Correction Candidates

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `39028` | Naturalness / meaning | The spiders are said to corrupt a sunny place into a ruin. `바꾸고 있어` weakens the destructive force; consider `망가뜨리고 있어`, preserving the source's winding-ruin image. | Medium |
| `39042` | Name / title / format | `Ambassador Mandolph` is rendered `맨돌프 대사(Mandolph Ambassador)`. Use the established name-title form `맨돌프 대사(Ambassador Mandolph)`. | High |
| `39055` | Objective format | `Craft a piece of equipment with Blacksmithing` is the objective `대장기술로 장비 하나 제작`. Align the action label with the project's `-하기` form. | High |
| `39063` | Name / format | The location `Valenont` appears in `the village of Valenont` but is not paired in Korean. Pair the proper name while retaining the village wording. | High |
| `39072` | Name / title / format | `Sergeant Odi` is rendered `오디 중사` without the English name-and-title unit. Pair the complete source form. | High |
| `39076` | Name / title / format | `Mayor Finola Flanagan of Revival` pairs the personal name but omits the English title and affiliation. Pair the full source name/title and retain Revival's relation. | High |
| `39082` | Terminology / format | Capitalized `Ballads` denotes the Fae's history and magic, but Korean has only `발라드`. Pair the named lore concept, without changing the explanation. | Medium-high |
| `39090` | Meaning / naturalness | `What you want?` and Japanese `何が目的だ？` ask the addressee's purpose; `무슨 일이야?` can instead ask what happened. Consider a direct but natural question such as `무슨 볼일이지?`. | Medium |
| `39118` | Title / format | `The Ruin of Aodh` is rendered `아오드(Aodh)의 폐허`, pairing only the name and not the complete title. Pair the full title. | High |
| `39122` | Title / format | The exact-English duplicate `Sprite Infestation` at `36748` and `39122` is `스프라이트 창궐` in both rows. Pair the complete title consistently in both. | High |
| `39140` | Name / group | `The Scaith's` refers to a named family/group, but `스케이스 가문` has no English pairing. Pair `Scaith` and retain the family meaning. | High |
| `39144` | Name / group | The named `Wyvyrns` house is rendered `와이번 가문` without English pairing, while `Gifre` is paired. Pair the Wyvyrn house name without changing the marriage claim. | High |
| `39165` | Name / format | `Edwin` is one of the two named claimants but appears without English pairing; `Wane Emundas` is already paired. Pair Edwin only. | High |
| `39177` | Name / format | The named location `Hall of Flames` is rendered `불의 전당` without its English form. Pair the full location name. | High |
| `39185` | Speech level / naturalness | `즐거운 여행 되시길` adds Korean honorification absent from Japanese `良き旅路を`. Consider the neutral farewell `즐거운 여행 되길.` without assuming a speaker identity. | Medium |
| `39189` | Title / format | The book title `A Canneroc Primer` is rendered `캐너록(Canneroc) 입문서`, pairing only the place name. Pair the complete title. | High |
| `39204` | Name / format | `Bloody Bones` is a named figure in the ballad but is rendered without English pairing; `Famor` and `Ysa` are paired. Pair the complete name. | High |
| `39214` | Title / format | `Empire of Erathell` is rendered `에라셀(Erathell) 제국`, pairing only the place name. Pair the complete source title. | High |
| `39222` | Name / format | `Barten` is rendered `바튼` without English pairing. Pair the name while preserving the description of his swordsmanship and experience. | High |
| `39232` | Name / consistency | Standalone `Tilera` is rendered without English pairing, unlike the repeated name rows that use `틸레라(Tilera)`. Align this occurrence with that established form. | High |
| `39233` | Name / format | `Isak Thorn` appears as `아이작 손` without English pairing. Pair the complete name. | High |
| `39238` | Item title / format | `Flawless Mitharan Bloodseeker's Shaft` pairs `Mitharan` only; the full named component is not paired. Review the complete item-title form. | High |
| `39239` | Name / format | `The Crows` is paired, but `Remus Bloodhawk` is not. Pair the announcer's full named opponent without changing the match announcement. | High |

The earlier candidate at `39142` is no longer open: the current Korean already
uses the proposed consistent conversational form. At `39095`, the Korean
ellipsis matches the continuation style in Japanese; no structural formatting
change is indicated.

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `39128` | Meaning / location | `Quarters` is translated as `병원 구역`, while English and Japanese identify only a quarters/area and Chinese alone specifies a hospital district. The intended in-game location is not established by the row; do not silently retain or replace the specific interpretation. |
| `39159` | Meaning / UI label | English `Navigation Warning` and Chinese `偏航警告` suggest a navigation/off-course warning, while Japanese `中断の確認` means confirmation of interruption. The current `항해 경고` follows English; hold the cross-language discrepancy rather than guessing. |
| `39191` | Meaning / term | `Silkfarmers` is rendered `비단 농부들`; Japanese describes silk-gathering workers and Chinese refers to silk processing. The exact occupation is unresolved without context. |
| `39196` | Name / referent | Capitalized `the Isles` is translated generically as `섬`; Japanese transliterates the name, while Chinese uses a generic archipelago term. The row alone does not establish the intended place-name treatment. |
| `39197` | Meaning / source conflict | English `Here's my lucky break!`, Japanese `俺の運もここまでか！`, and Chinese's reference to escaping prison point in materially different directions. Korean follows the positive English reading; hold pending scene evidence. |

Existing candidates `39028`, `39090`, `39122`, and `39185` were rechecked and
retained. Existing hold `39191` remains unresolved. No speaker or playback
order was inferred from asset links or row proximity.

## Repeated Sources And Structure

- Sixty-one exact-English duplicate groups touch this range. The only group
  with differing Korean is `I'll be back tomorrow.` at `21693`, `36866`,
  `39132`, `43891`, `44058`, `54310`, `56999`, and `57344`. Japanese also
  distinguishes the polite and plain forms in the same pattern, so the Korean
  variants were retained rather than mechanically unified.
- Two entries contain embedded line breaks: `39068` and `39080`, each with
  eight breaks in all four locales.
- Runtime-variable and markup structure matches across all four locales.
  `39152` has the same variable and control-marker order; localized marker
  contents differ as expected.
- The range has indexed asset links for 197 IDs and no indexed asset match for
  53. Asset associations do not establish a specific speaker or playback
  order.
- No translation CSV, source CSV, or extracted game asset was modified.

## Range Result

- Rechecked 56 existing ledger records and added 194 records; 141 newly
  recorded IDs have indexed asset links and 53 do not.
- The range has 23 candidates, five uncertain IDs, and 222 not-issue IDs.
- The ledger covers 46,075 of 65,135 unique `default` IDs (70.74%), leaving
  19,060. Reviewed IDs with indexed asset links total 37,533; reviewed IDs
  without an indexed asset link total 8,542. Sequential coverage reaches
  `39249`; next is `39250`-`39499`.
- All four-language source fingerprints validate, generated association,
  asset, and ID catalogs reproduce exactly, and nine related index tests
  pass. Translation CSVs remain unchanged.
