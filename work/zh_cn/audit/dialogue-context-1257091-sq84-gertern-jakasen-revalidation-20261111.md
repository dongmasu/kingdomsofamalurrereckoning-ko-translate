# SQ84 / Gertern Asker and Jakasen Quest Revalidation

- Date: 2026-11-11.
- Scope: all 72 `default` IDs linked to `1257091.quest_bxml`.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Seventeen IDs have correction candidates. Four rows have evidence-limited
  questions; the batch wording at `46789` remains a separate unresolved issue.
  No translation CSV or extracted game asset was changed.

## Grouping Evidence and Limits

The asset has explicit quest ID `SQ84`, 72 distinct localization keys, NPC
symbols `NPC_YSA_ALM_GerternAsker` and `NPC_YSA_SEE_Jakasen`, and 33 serialized
`dialog_line_*` handlers. Its quest targets include talking to Jakasen,
testing his potion, harvesting Bristletongue, and returning to Gertern Asker.
The localized target at `12765` says `Harvest Bristletongue`, while an
asset-readable target string says `Harvest Brightongue`; this spelling
difference is recorded, not normalized from the asset string alone. The
evidence supports grouping the asset with the Asker brothers' Bristletongue
quest.
The two NPC symbols, quest targets, and handler names do not map an individual
key to a speaker, callback, branch, addressee, or playback position. Per-key
speaker attribution and dialogue order remain unknown.

All 72 rows were compared across English, Japanese, Chinese, and active
Korean. There are no exact-English duplicate groups within the asset and no
embedded line breaks, runtime placeholders, or markup in these rows.

The review checked terms against related rows outside this asset where useful.
ID `6072` already uses `팅크제와 영약 관리인(Steward of Tinctures and
Elixirs)`, and `57870` uses `빅터의 양조주(Victor's Brew)`. Those are useful
consistency anchors, not evidence that the surrounding lines share a speaker.
The established person form `게르턴 애스커(Gertern Asker)` is retained.

## Correction Candidates

| ID(s) | Dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `1312`, `24349` | Terminology / format / speech level | The same title, `Steward of Tinctures and Elixirs`, is translated three ways across the references: `팅크와 엘릭서 담당 관리인`, `팅크처와 영약 담당관`, and the established `팅크제와 영약 관리인` at ID `6072`. Align the two SQ84 rows with `팅크제와 영약 관리인(Steward of Tinctures and Elixirs)`. At `1312`, also pair the distinct role `Fontmaster` in English rather than leaving it as only `샘 관리인`. The Japanese self-introduction uses plain speech, while the Korean switches to `저는`/`입니다`; consider a consistent plain rendering such as `여긴 샘(The Font)의 위엄을 기리고 그 힘을 관리하는 곳이야. 나는 자카센(Jakasen)이야. 샘 관리인(Fontmaster)의 제자이자 팅크제와 영약 관리인이지.` This register finding is row-local. | High |
| `1312`, `10974`, `19677`, `24693`, `25058`, `47256` | Format / terminology | These rows refer to the named magical spring `The Font` but render it only as `샘`; elsewhere in this same asset, `The Font` is already paired as `샘(The Font)` (`24349`, `45462`, `53176`). Add the established bilingual form in these occurrences without changing the surrounding syntax. At `10974`, this is only a name-format finding; the sentence interpretation remains on hold below. | High |
| `19677` | Terminology | `Asker brothers` is `애스커 형제` here but `아스커 형제` in the already-corrected `32354`; the Japanese also uses the same family name form. Align this occurrence with `아스커 형제(Asker brothers)` while retaining the established personal name `게르턴 애스커(Gertern Asker)`. | Medium-high |
| `21338`, `32511` | Terminology / consistency | Both rows refer to the capitalized named drink `Victor's Brew`. Their Korean forms vary (`빅터의 맥주`, `빅터의 술`), while the same asset's label at `57870` and the comparison at `46789` use `빅터의 양조주(Victor's Brew)`. Align the named-drink references to that form. | High |
| `32511` | Terminology | `Asker's Alley` is `애스커 골목(Asker's Alley)` at `24693` and `59561`, but `아스커 골목(Asker's Alley)` here. Align this occurrence with the established in-asset place-name form; this finding concerns spelling only, not whether `Alley` denotes a street or tavern. | Medium-high |
| `46685` | Objective style | `Test the potion` is the only SQ84 objective rendered as a bare noun (`물약 시험`); the parallel objectives use `-하기` (`자카센과 대화하기`, `브리슬텅 채집하기`). Consider `물약 시험하기`. | High |
| `46789` | Meaning / terminology | `Asker's Draught` is a family ale/drink, as confirmed by the parallel source rows and the established `아스커의 약주(Asker's Draught)` at `32354` and `53785`. `애스커의 영약` incorrectly identifies it as a potion/elixir and also varies the family-name spelling. Consider `아스커의 약주(Asker's Draught)`. | High |
| `51399` | Meaning / speech act | English `I'm looking for Bristletongue?`, Japanese `ブリッスルタングを探している`, and Chinese `我在找鬃舌草` are first-person statements; Korean `브리슬텅을 찾고 있어?` turns it into a question addressed to the player. Use a statement such as `브리슬텅(Bristletongue)을 찾고 있어.` | High |
| `50284` | Speech level / naturalness | Japanese `こっちに来い` is a plain imperative and the line elsewhere uses plain speech, while Korean switches to `자네`, `오게`, and `-이네`. Consider a consistent conversational form such as `그래? 언더스타일(The Understyle)에 필멸자라니... 이거 참 보기 드문 일이군. 가까이 와. 펠타운(Felltown)에서 이렇게 멀리 떨어진 곳에서 너 같은 이를 보는 건 드물어.` This is a row-level finding, not a speaker assignment. | Medium-high |
| `53176` | Naturalness | The literal passive `브리슬텅 향신료는 ... 식생에서 생산되고 있다` is awkward for a plant that grows on vegetation. Preserve the source's distinction between where the spice occurs and where it is currently found, for example: `브리슬텅(Bristletongue)은 시들어 가는 특정 식물에서만 얻을 수 있어. 지금은 도시의 마법 원천인 샘(The Font) 근처의 식물에서 자라고 있지.` | Medium-high |
| `53785` | Naturalness | `고전 술` is an unnatural collocation for the grandmother's favorite classic family drink. Japanese describes it as a staple, and the same named drink is rendered `아스커의 약주(Asker's Draught)` elsewhere. Consider `할머니가 가장 좋아하던 전통주, 아스커의 약주(Asker's Draught)를 다시 내놓는 거야.` | High |
| `59318` | Naturalness / meaning | `Gertern Asker and his brother` is rendered `게르턴 애스커와 형제는`, which reads as an awkward or incomplete pairing. Make the relation explicit: `게르턴 애스커(Gertern Asker)와 그의 형제는 오래된 가문의 조리법에 적힌 마법 시약을 넣어 수제 에일에 풍미를 더하고 싶어 한다.` The rest of the entry should be checked for sentence flow when this is applied. | High |
| `16368` | Naturalness | `시간과 자원이 있다면` is a literal rendering of `time and resources`; Japanese uses “time and means.” A more conversational phrasing such as `날 도울 시간과 여건이 된다면, 그만큼 보답할 금화도 있어.` preserves the offer without implying a supply of physical resources. | Medium |

## Evidence-Limited Holds

| ID(s) | Dimension | Evidence and disposition |
| --- | --- | --- |
| `10974` | Meaning | The unusual English phrase `a mockingbird with the Font's only yield` is unclear as written. Japanese and Chinese also diverge in how they connect the mockingbird and the Font's yield; the asset confirms the Bristletongue topic but does not resolve the metaphor. Retain the current sentence meaning pending stronger context. |
| `12765` | Meaning / source conflict | The localized English row says `Harvest Bristletongue`, but an asset-readable quest-target string says `Harvest Brightongue`. The Japanese, Chinese, and Korean localized rows agree on Bristletongue; the asset string may be an internal typo or distinct label. Keep the localized translation pending direct display/context evidence. |
| `14069` | Format / sentence boundary | English ends the row with `They will treat you like my own,`, while Japanese and Chinese complete the thought and Korean preserves a trailing comma. This may be an intentional continuation fragment or source punctuation error. Do not add a full stop or invent a continuation without dialogue-node evidence. |
| `51227` | Meaning | English `useful derelicts`, Japanese `有能な怠け者`, Chinese `有用的废弃物`, and Korean `쓸 만한 낙오자` differ in whether the people are idlers, derelicts, or outcasts. The quest context does not identify the intended group or settle the speaker's insult. Retain provisionally. |
| `46789` | Naturalness / measure word | The earlier naturalness review left `a batch of Asker's Draught` unresolved: `한 묶음 만들겠어` is awkward, but the prior proposed `한 차례 만들겠어` does not clearly convey a production batch. This review resolves the drink identity, not the best Korean measure for `a batch`; retain that wording question separately. |

## Retained Text

The other rows were retained after four-language comparison. In particular,
the short greetings, refusals, and replies were not combined into a shared
speaker voice merely because they occur in the same asset. The named drink
and ale terms were checked against their English capitalization and related
entries; ordinary references to a drink were not automatically converted
into proper names.

## Complete Reviewed ID Set

`1312`, `3650`, `4296`, `5168`, `5595`, `6791`, `7071`, `7226`, `9183`,
`9464`, `9575`, `10974`, `12765`, `14069`, `16368`, `16439`, `16550`,
`17725`, `17825`, `19119`, `19563`, `19677`, `19907`, `21338`, `24031`,
`24349`, `24693`, `25058`, `27260`, `27751`, `29675`, `32354`, `32511`,
`32680`, `33174`, `33762`, `36511`, `38029`, `38512`, `39314`, `39876`,
`40423`, `41139`, `41447`, `42726`, `43994`, `44210`, `45462`, `45584`,
`45761`, `46685`, `46789`, `47256`, `47379`, `47571`, `50284`, `51227`,
`51399`, `51597`, `53058`, `53176`, `53404`, `53525`, `53785`, `55148`,
`57530`, `57870`, `59318`, `59561`, `60099`, `61435`, `64097`.

All 72 IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
