# Disposition Batch: `default` IDs 31801-31850

- Decision date: 2026-10-10.
- Scope: preliminary findings and carried historical questions for IDs
  31801-31850, checked against English meaning, Japanese voice/register,
  Chinese supporting evidence, active Korean, historical notes, and recurring
  terminology.
- Decisions: one accepted, six `not an issue`, and eleven uncertain.
- CSV changes: ID 31838 only.

## Other Decisions

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 31804 | +30 Lightning Damage / +75% Lightning Damage | Not an issue: both values, lightning scope, blank line, and separate stat lines are preserved. |
| 31805 | Hierophant / Irion's loyalty checks after Grim's coup | Uncertain: event sequence is preserved; canonical rank terminology remains open. |
| 31812 | `humeral inbalance` source typo / seven-break journal | Uncertain: all findings and line breaks remain, but the intended medical phrase may be `humoral`, literal `humeral`, or a joke. |
| 31814 | `Dear` / `여보` | Uncertain: relationship is not established; Korean selects an intimate vocative while Japanese omits it. |
| 31817 | `Master Geologist` / `지질학 최고 전문가` | Uncertain: source may name a formal rank, occupation, or degree; former Director role is retained. |
| 31821 | Warsworn comrade Jory / unidentified `them` | Uncertain: Korean preserves an unspecified plural enemy and comrade reading; Chinese adds a battle context not explicit in English. |
| 31825 | Dominus of Onyx Tower / Magister of Rose Court | Uncertain: alliance is conveyed, but offices and institutions need canonical terminology. |
| 31833 | Speaker's claim that Akara does not exist | Uncertain: possible in-world belief conflicts with nearby Akara references; not a confirmed continuity error. |
| 31835 | `Tywili` / `타이윌리`; return over ten years ago | Uncertain: timeline is preserved, but canonical place-name spelling remains open. |
| 31838 | English payloads in `{*1Combat Mode}` and `{*1Main Menu}` | Accepted: localize as `{*1전투 모드}` and `{*1메인 메뉴}`, following Japanese/Chinese and established Korean UI terminology; preserve both wrapper identities and order. |
| 31844 | Recently killed Barghest's still-beating heart | Not an issue: Korean retains the explicit post-mortem beating and wave-like heat supported by English and Chinese. |
| 31845 | `Amphora` / `암포라` | Uncertain: it may be a named quest object or a generic vessel; locale forms differ. |
| 31847 | Rag-pickers / urchins / scamps and belonging | Not an issue: Korean retains both the stigmatizing labels and the group's defiant belonging claim. |
| 31849 | `Head up.` / `조심해` | Uncertain: English permits a warning to stay alert or a literal instruction to look up; Japanese and Chinese differ. |
| 31850 | `Fateless One` / `운명 없는 자` | Not an issue: Korean preserves the direct address using the established active-corpus rendering. |
| 31801-31850 | Four-locale row order, line breaks, runtime wrappers, and numeric values | Not an issue: IDs/order and structure match; seven line breaks at 31812, the 31804 blank line/values, and both 31838 wrappers are preserved. |
| Remaining ordinary text in IDs 31801-31850 | Dialogue / objectives / labels / ordinary prose | Not an issue: no additional supported wording defect was identified beyond the accepted localization and context-sensitive findings. |
| Other named terms in IDs 31801-31850 | Hierophant / Keening / Master Geologist / Dominus / Magister / Akara / Tywili / Amphora / Fateless One and related terms | Uncertain: names, rank/office status, theology, and UI terminology need integrated glossary/context review. |

## Verification

- English, Japanese, Chinese, and Korean source rows for the findings above
  were directly compared and reconciled with historical open questions.
- ID 31812 retains all seven line breaks and numbered claims. The apparent
  Akara discrepancy at 31833 remains a context question rather than an
  asserted continuity error.
- ID 31838 now reads:
  `축하합니다! {*1전투 모드} 잠금이 해제되었습니다. 다음에 {*1메인 메뉴}에 들어가면 이용할 수 있습니다.`
- Both `{*1}` wrapper identities and their order are preserved. UTF-8 BOM,
  72,046 CRLF endings, and 39 pre-existing bare-LF endings remain intact.
- Active default CSV SHA-256 is
  `54b5b9da10309a97acda11cc4bef6012b5093f68cac16953c6e45459895ca876`.
- Register totals after this batch: 963 accepted, 3,561 `not an issue`, and
  5,797 uncertain (10,321 counted dispositions), excluding duplicate rows
  D-5305 and D-5306.
- Resume at ID 31851; 33,284 `default` IDs remain.

These working dispositions are not independent linguistic approval.
