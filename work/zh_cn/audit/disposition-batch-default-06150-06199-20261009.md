# Disposition and Edit Batch: `default` IDs 6150-6199

- Decision date: 2026-10-09.
- Scope: direct preliminary findings and applicable historical questions for
  `default` IDs 6150-6199.
- Compared immutable English, Japanese, and Chinese rows with active Korean.
  English governed meaning; Japanese informed voice/register; Chinese was a
  supporting cross-check.
- Fifteen findings were dispositioned: two accepted, four `not an issue`,
  and nine uncertain. Two accepted `Texto` cells were changed.
- This is a working disposition, not independent final linguistic approval.

## Decisions

| ID | Finding | Disposition | Decision |
| ---: | --- | --- | --- |
| 6150 | Gwyn Anwy spelling | Defer alignment of `그윈 앤위` and `그윈 안위` until the character's Korean name is decided corpus-wide. | D-1653: uncertain. |
| 6151 | Loans / property development / investment oversight | Keep the financial-services pitch and its polite service register. | D-1654: not an issue. |
| 6152 | Cape Solace / Akara will provide | Defer the place-name form; the Korean preserves the welcome, safety, and provision without inventing a specific object. | D-1655: uncertain. |
| 6156 | House of Valor | Defer normalization of `용맹의 집` versus `용맹의 전당`; related rows remain inconsistent. | D-1656: uncertain. |
| 6162 | Scholia / Rathir and Ysa chapters | Defer the institution's canonical Korean name and the shortened `스콜리아` form. | D-1657: uncertain. |
| 6167 | Invoices / Warsworn fortress | Keep the source-supported invoice count and delivery sequence; defer the faction's Korean name. | D-1658: uncertain. |
| 6172 | Hanged Men / Frostbreak | Defer whether `Hanged Men` is a proper pirate-gang name and its Korean form. | D-1659: uncertain. |
| 6175 | `a hand both delicate and deadly` | Render `a hand` as a needed assistant rather than a literal or manner-of-touch `손길`. | D-1660: accepted. |
| 6178 | Delvers | Defer the formal role/group identity and the conflicting Korean renderings. | D-1661: uncertain. |
| 6184 | `commune with the sorrows` | Defer whether lowercase `sorrows` means spirits, a named force, or an abstract concept. | D-1662: uncertain. |
| 6185 | Abilities / destiny / Destinies markers | Keep the localized visible labels and preserve each style marker and `{LINE_SPACE}` control token. | D-1663: not an issue. |
| 6188 | `it could be exploited` | Remove the unsupported explicit `힘` and preserve the source's unspecified pronoun. | D-1664: accepted. |
| 6192 | Singing Nell / dowry | Keep the speaker's claim that Nell has a dowry and saved gold, including the false start. | D-1665: not an issue. |
| 6195 | the Well / Prismere / Alabastra | Defer whether `the Well` should be expanded and choose no corpus-wide Prismere spelling from this row alone. | D-1666: uncertain. |
| 6196 | `They must be anchored in Esharra` | Keep the unresolved plural pronoun and the anchoring requirement without guessing its antecedent. | D-1667: not an issue. |

## Applied Corrections

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 6175 | `교묘하면서도 기발하군. 섬세하면서도 치명적인 손길이 필요하겠어.` | `교묘하면서도 기발하군. 섬세하면서도 치명적인 조력자가 필요하겠어.` | D-1660: use the person/help sense of `a hand`. |
| 6188 | `하지만 그 힘을 이용할 수 있을 줄은 꿈에도 몰랐어...` | `하지만 그게 이용될 수 있을 줄은 꿈에도 몰랐어...` | D-1664: retain the English/Japanese-unspecified referent rather than infer “power.” |

## Historical Audit Reconciliation

- Rechecked applicable historical questions for IDs 6151-6152, 6156, 6162,
  6167, 6172, 6175, 6178, 6184-6185, 6188, 6192, and 6195-6196 against the
  active Korean and matching source rows.
- `House of Valor`, Scholia Arcana, Cape Solace, Warsworn, Delvers, Hanged
  Men, the Sorrows, the Well, and Prismere remain terminology/context
  questions; uncertain rows were not edited.
- `{*1능력}`, `{*1운명}`, and `{LINE_SPACE}` at 6185 are preserved in source
  order. The change at 6188 keeps its surrounding clause and punctuation.
- Historical candidate wording remains evidence and does not authorize any
  correction beyond the two accepted edits above.

## Structural Verification

- English, Japanese, Chinese, and Korean each contain 65,135 `default` IDs
  in identical order; IDs 6150-6199 are present in matching order.
- The accepted edits at IDs 6175 and 6188 change no runtime marker, explicit
  line break, or numeric value.
- The Korean CSV retains its UTF-8 BOM, semicolon delimiter, CRLF record
  endings, and zero bare LF/CR bytes.
- Only the approved `Texto` cells at IDs 6175 and 6188 changed.
- Active Korean `default` CSV SHA-256:
  `108afdf9ad942fb7bcc4296682a6aee3d2a473a4bcb3600775a8a04051299dde`
- Cumulative dispositions: 302 accepted, 467 `not an issue`, and 898
  uncertain. Resume at `default` ID 6200; 58,935 rows remain.

Findings are working dispositions, not independent linguistic approval.
Corpus-wide terminology, combined-name consistency, and integrated voice
review remain open.
