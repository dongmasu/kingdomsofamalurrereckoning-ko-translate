# SQ59 / Feride Ouet Quest Context Revalidation

- Date: 2026-11-10.
- Scope: all 191 `default` keys associated with `591256.quest_bxml` (`SQ59`).
- After the user's approval, all 11 correction-candidate IDs below were
  corrected and rechecked against the four locale rows. Five unresolved
  readings remain unchanged.
- No extracted game asset was modified.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison. All four locales were checked at every ID.

## Grouping Evidence

The asset contains `QUEST_ID SQ59`, the asset-level symbol
`NPC_ADE_GNO_FerideOuet`, and 57 serialized `dialog_line_*` handlers. Its
content concerns Feride Ouet's research and experiment, the Sandstone Villa
and Allestar, letters and observers, and the Hospitalis Quarters, alongside
dialogue, player choices, quest updates, objectives, titles, and UI text.

The NPC symbol and handler count do not map each localization key to Feride,
another speaker, a callback, a branch, or a playback position. The serialized
handler order is not evidence of dialogue order. Speaker attribution and
playback order therefore remain unknown at the key level.

## Correction Candidates

These source-checked corrections were approved and applied. The table retains
the evidence and proposed wording that guided the ID-specific edits.

| ID(s) | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `5589` | Terminology consistency | Both this line and `1367` use the capitalized, parenthesized `Isles`; Japanese treats it as the named アイルズ and Chinese uses 群岛. Korean varies between `섬들(Isles)` and `제도(Isles)`. Align this occurrence to `오늘 제도(Isles)에는 중요한 인물들이 여럿 와 있어. 그들의 안전을 위해 만전을 기해야 해.` | Medium |
| `10414`, `11785`, `23513`, `24118`, `26118` | Terminology consistency | These all refer to the same storyline's `observers`; Korean varies among `관측자`, `관찰자`, and `감시자`. Japanese repeatedly uses 監視者, and the exact title `Mysterious Observers` is already consistently `수수께끼의 감시자들` at `42127` and `43837`. Use `감시자` consistently in these five rows while preserving each sentence. | High |
| `24118` | Naturalness / terminology | `studies` refers to Feride's scholarly research in the Adessa Laboratories; Japanese explicitly uses 研究, and this same quest describes his work as research. Replace `그의 공부를 도와야겠다` with `그의 연구를 도와야겠다.` | High |
| `35040` | Naturalness | `their authors` refers to the people who wrote the letters just presented. In this correspondence context, `저자` is stilted. Consider `그래, 여기 있어. 편지를 쓴 사람 중 누구와든 이야기하면 올바른 방향을 찾을 수 있을 거야.` Japanese explicitly says 手紙の差出人; Chinese supports the authors of the letters. | Medium-high |
| `40784` | Meaning / naturalness | English, Japanese, and Chinese thank the gods that the player has arrived. `신들이시여, 와 주셔서 감사합니다` can instead read as thanking the gods for coming. Consider `당신이... 정말 오셨군요! 샌드스톤 저택(Sandstone Villa)의 새로운 손님이시죠! 와 주셨다니 신들께 감사드려야겠군요.` | High |
| `42366` | Naturalness | In `my business is genuine`, `business` means the speaker's purpose or request, not sincerity as a property of the errand. `내 용건은 진심` is an awkward collocation. Consider `어떻게든 네 관심을 끌어야 했어. 속인 건 사과할게. 하지만 내가 부탁하려는 일은 진짜라고 장담할게.` | Medium-high |
| `49664` | Meaning | `keep us segregated` does not say that humans and Alfar are separated from each other. Korean `우리를 서로 떼어 놓는` adds that reciprocal relation; the English and Chinese leave the separation's other side implicit. Consider `아데사(Adessa)에서 인간과 알파르(Alfar)를 위한 일을 맡고 있는 건 사실이야. 하지만 노움들은 우리를 격리해 두는 법은 잘 알지.` | Medium-high |
| `60068` | Naturalness | `Adessa's sphere` means the city's social or political circles; Japanese describes a high position in Adessa and Chinese a respected place in its circles. `아데사의 세력권에서 입지를 다졌어` is an unnatural literal construction. Consider `난 아데사(Adessa)에서 입지를 다졌어. 네가 수수께끼 같은 후원자들과 연락하도록 도와줄 수도 있지.` | Medium-high |

## Holds

| ID | Dimension | Evidence and disposition | Confidence |
| --- | --- | --- | --- |
| `4243` | Meaning | `rise of magic` could mean its emergence, growth, or spread. Japanese supports spread while Chinese supports rise; retain the current reading pending stronger evidence. | Uncertain |
| `34114` | Meaning | English and Japanese differ on whether people come to Courdan for letters or to ask him to write them. The correspondence context does not settle that exact action; retain the current line. | Uncertain |
| `47233` | Meaning | `The one I sent to Sandstone Villa` leaves `one` unspecified; Japanese and Chinese also use a neutral referent. Do not change Korean `그 사람` to a letter or another object without stronger context. | Uncertain |
| `63857` | Meaning | The antecedent of `that` in `incidentally exposed to that` is not identified by the row, and the key is not mapped to a preceding line. Retain the current generic reference. | Uncertain |
| `65107` | Naturalness | All source languages describe costly specimens sent or brought in. The repeated `들여` is noticeable, but the earlier review did not find `큰돈을 주고 들여온` clearly better than the current wording. Keep the existing hold rather than reopening it as a confirmed correction. | Uncertain |

The earlier unresolved readings at `19163`, `19710`, `27205`, `33612`,
`45205`, and `48288` were rechecked against the grouped source context; this
pass found no sufficiently supported correction. The earlier proposal at
`7321` remains not an issue: `got a nibble` is an intentional response/bite
metaphor, and the current Korean preserves that wordplay.

## Consistency and Format Checks

Ten exact-English duplicate groups occur within this asset, covering 25 rows;
all groups already have matching Korean. The groups are `6190` / `22058`;
`9135` / `30583` / `33612` / `39215` / `42166` / `43824`;
`19433` / `32350`; `20567` / `26119` / `27849`; `23238` / `35649`;
`28780` / `31177`; `30685` / `32349`; `30950` / `59468`;
`35547` / `38737`; and `42127` / `43837`.

All 191 IDs were checked for meaning, Korean naturalness, register,
address/honorifics, terminology and names, repeated English, runtime markers,
markup, and line breaks. No embedded line breaks, runtime markers, or markup
were found in any of the four locales. Eight correction findings affecting
11 unique IDs and five unresolved readings were recorded. All 11
correction-candidate IDs were applied and rechecked; the unresolved readings
remain on hold.

The complete sorted ID set is:

`59`, `66`, `363`, `703`, `715`, `1367`, `1933`, `2773`, `3030`, `4243`,
`4367`, `4419`, `4623`, `4665`, `4699`, `5589`, `6011`, `6190`, `6352`,
`6868`, `7321`, `7429`, `8353`, `8754`, `9135`, `9303`, `9448`, `9670`,
`9767`, `9862`, `10414`, `10926`, `11785`, `12297`, `12552`, `13519`,
`14179`, `14457`, `16037`, `16479`, `16813`, `17649`, `17842`, `18409`,
`18635`, `19017`, `19163`, `19433`, `19497`, `19501`, `19598`, `19710`,
`19886`, `20283`, `20567`, `20588`, `20591`, `20633`, `20677`, `20751`,
`20981`, `21294`, `21423`, `21436`, `22058`, `22117`, `22287`, `22334`,
`22917`, `22939`, `23238`, `23513`, `24118`, `24412`, `24560`, `24776`,
`25194`, `26063`, `26118`, `26119`, `26838`, `27205`, `27849`, `28780`,
`28799`, `30550`, `30583`, `30609`, `30685`, `30865`, `30915`, `30950`,
`31177`, `31231`, `31476`, `31483`, `32349`, `32350`, `32656`, `32995`,
`33026`, `33612`, `34114`, `34221`, `34418`, `35040`, `35325`, `35451`,
`35508`, `35547`, `35649`, `35850`, `36357`, `37060`, `37524`, `38500`,
`38737`, `39215`, `39516`, `39772`, `40710`, `40784`, `42058`, `42068`,
`42127`, `42166`, `42366`, `42776`, `43176`, `43265`, `43415`, `43824`,
`43837`, `44145`, `44663`, `45205`, `45564`, `45987`, `46059`, `46072`,
`46522`, `46555`, `46894`, `47233`, `47311`, `48288`, `48613`, `48674`,
`48844`, `49452`, `49664`, `49771`, `50250`, `50529`, `50920`, `50936`,
`52072`, `52529`, `52741`, `52951`, `53755`, `54818`, `54829`, `55697`,
`56015`, `56861`, `57298`, `58338`, `58418`, `58672`, `59042`, `59339`,
`59468`, `59630`, `59664`, `60041`, `60068`, `60463`, `61210`, `61265`,
`61328`, `61457`, `61461`, `62414`, `63135`, `63857`, `63874`, `64270`,
`64851`, `64927`, `65107`.

The linked review ledger records all 191 IDs and their four-language source
fingerprints. The held rows were not changed.
