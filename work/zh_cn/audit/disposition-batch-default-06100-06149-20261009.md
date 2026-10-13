# Disposition and Edit Batch: `default` IDs 6100-6149

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and applicable historical questions for
  `default` IDs 6100-6149.
- Compared immutable English, Japanese, and Chinese rows with active Korean.
  English governed meaning; Japanese informed voice/register; Chinese was a
  supporting cross-check.
- Eighteen findings were dispositioned: four accepted, seven `not an issue`,
  and seven uncertain. Four accepted `Texto` cells were changed.
- This is a working disposition, not independent final linguistic approval.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 6100 | Scholia Arcana organization/name | Defer the Korean display name and bilingual-marking convention; the references call it an organization, academy, or school. | D-1635: uncertain. |
| 6104 | Nested `{*2{1} {2}}` marker | Preserve the identical marker sequence in all four locales. | D-1636: not an issue. |
| 6107 | Belmaid / `love of King Wencen` | Keep `연인`; all references support a romantic relationship without asserting marriage. | D-1637: not an issue. |
| 6108 | `Flawless Mitharan Bloodseeker's Hilt` | Defer the set/component relation and canonical Mitharan/name terms. | D-1638: uncertain. |
| 6109 | `No questions asked` | Broaden the overly specific provenance question to the source's general refusal to ask questions. | D-1639: accepted. |
| 6117 | Den / Detyre | Defer the named venue and place-name conventions. | D-1640: uncertain. |
| 6119 | Tower visibility / `You could not be overlooked` | Keep the English's shift to direct address; the Korean is a supported rendering and does not resolve the source's rhetorical relation. | D-1641: not an issue. |
| 6122 | Forum | Defer plaza versus council/assembly-center identity; the same term remains unresolved at ID 5842. | D-1642: uncertain. |
| 6125 | Sleight of hand / uncle's footlocker | Remove the literal foot-location misreading; render the storage trunk and avoid the male-speaker-specific `형`. | D-1643: accepted. |
| 6127 | Cutthroats / cretins | Keep the contemptuous contrast and aspiration meaning supported by all references. | D-1644: not an issue. |
| 6129 | Night Barghest | Defer the creature's canonical Korean name. | D-1645: uncertain. |
| 6130 | Faeblades / Primal Damage test label | Keep the concise developer/test description; no semantic correction is established. | D-1646: not an issue. |
| 6131 | `FAIL LINE` | Keep the raw QA placeholder, matching English, Japanese, and Korean. | D-1647: not an issue. |
| 6132 | Century Flowers objective | Replace the unnatural `세기꽃` compound with the reference-supported Korean `백년꽃`. | D-1648: accepted. |
| 6137 | Moon Camp | Defer normalization among the active `달 캠프`, `달 야영지`, `달빛 야영지`, and `문 캠프` forms. | D-1649: uncertain. |
| 6143 | Vekreth's `My might is my right` slogan | Keep the force/right slogan and the proud, disciplined, casually brutal characterization. | D-1650: not an issue. |
| 6146 | Traveler Lina / poisoning cover-up | Defer whether `Traveler` is a formal group/title and the canonical display form; the Korean preserves implication in a cover-up, not direct poisoning. | D-1651: uncertain. |
| 6148 | `beneath the finery and heavy pockets` | Replace the physical-image calque with the supported contrast between outward wealth and the man's criminal nature. | D-1652: accepted. |

## Applied Corrections

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 6109 | `출처는 묻지 않아.` | `아무것도 묻지 않아.` | D-1639: preserve the general “no questions asked” meaning. |
| 6125 | `재주라고 할 만하지. 손재주를 부리는 기술인데, 형이 삼촌의 발밑 궤짝에서 맥주를 훔치려고 가르쳐 줬어. 여기서는 꽤 쓸모가 있지.` | `손재주라고 할 만하지. 오빠가 삼촌의 개인용 궤짝에서 맥주를 훔치려고 가르쳐 준 거야. 여기서는 꽤 쓸모가 있지.` | D-1643: correct `footlocker`; use the female-coded older-brother address supported by the Japanese voice. |
| 6132 | `세기꽃 피우기` | `백년꽃 피우기` | D-1648: use natural Korean for Century Flowers, matching the Japanese and Chinese readings. |
| 6148 | `모르겠어? 화려한 옷차림과 두둑한 주머니 밑바닥을 보면, 그는 평범한 범죄자야. 부하들과 다를 바 없는 깡패라고.` | `모르겠어? 화려한 옷차림과 두둑한 주머니에 가려졌을 뿐, 그는 속까지 평범한 범죄자야. 부하들과 다를 바 없는 깡패라고.` | D-1652: express the concealed criminal nature rather than a literal pocket-bottom image. |

## Historical Audit Reconciliation

- Rechecked applicable historical questions for IDs 6100, 6104, 6107-6109,
  6117, 6119, 6122, 6125, 6127, 6129-6132, 6137, 6143, 6146, and 6148
  against active Korean and matching source rows.
- `Forum` at 6122 remains uncertain, consistent with the unresolved
  classification at ID 5842. `Moon Camp`, `Scholia Arcana`, the Night
  Barghest, and the Traveler display/name conventions remain open.
- Historical candidate wording remains evidence and does not authorize any
  correction beyond the four accepted edits above.

## Structural Verification

- English, Japanese, Chinese, and Korean each contain 65,135 `default` rows
  with identical ordered IDs; IDs 6100-6149 are present in matching order.
- The nested `{*2{1} {2}}` marker at ID 6104 is unchanged and identical in all
  four locales.
- No accepted edit changes a runtime marker, explicit line break, or numeric
  value in this batch.
- The Korean CSV retains its UTF-8 BOM, semicolon delimiter, CRLF record
  endings, and zero bare LF/CR bytes.
- Only the approved `Texto` cells at IDs 6109, 6125, 6132, and 6148 changed.
- Active Korean `default` CSV SHA-256:
  `9610ae109791097c2f13096fb93c50ce6e25dee42d5a318e0cd54aac0b661db1`
- Cumulative dispositions: 300 accepted, 463 `not an issue`, and 889
  uncertain. Resume at `default` ID 6150; 58,985 rows remain.

Findings are working dispositions, not independent linguistic approval.
Corpus-wide terminology, combined-name consistency, and integrated voice
review remain open.
