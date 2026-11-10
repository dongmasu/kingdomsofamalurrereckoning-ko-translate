# TRSQ02 / Moon Camp and Maire Ganan Context Revalidation

- Date: 2026-11-10.
- Scope: all 110 `default` keys in `1633037.quest_bxml` (`TRSQ02`).
- No translation CSV or extracted asset was modified.
- English anchors meaning; Japanese guides style/register; Chinese supports
  the comparison. All four locales were checked at every ID.

## Grouping Evidence

The asset contains `QUEST_ID TRSQ02`, the asset-level symbol
`NPC_KLU_Ljo_MaireGanan`, and 40 serialized `dialog_line_*` handlers. The
quest combines Irion and Maire's marriage, a theft assignment from the
Hierophant, Ebsol Wyvyrn-Gifre, Veinrich, and player choices, labels, and
journal text. The NPC symbol is not a complete speaker map and does not
prove callback links or playback order.

## Correction Candidates

These are read-only reviewer findings, not accepted edits. Listed dimensions
also define the per-ID ledger statuses; unflagged dimensions remain
`not_flagged`.

| ID(s) | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `12893` | meaning | English `The ring, in the Great House of Wyvyrn Gifre` uses the established Great House/family sense. Japanese `有力一族ワイヴァーン＝ギフ家` and Chinese `维弗恩吉弗瑞高等家族` corroborate a noble house, not necessarily a mansion. Current `와이번-기프르(Wyvyrn-Gifre) 대저택` converts the social institution into a physical building. Prefer `반지는 상층 도시의 와이번-기프르(Wyvyrn-Gifre) 대가문에 있어.` | High |
| `20206` | naturalness | English `the stress of this life has finally taken its toll`, Japanese `慣れない暮らしが堪えた`, and Chinese describe the strain becoming too much. Current `이런 삶의 고단함이 끝내 한계를 넘었어` is a literal, awkward combination. Prefer `하지만 최근엔 이런 생활의 고단함도 결국 한계에 이르렀어. 그녀는 나와 야영지를 떠나 리리아의 사원(Temple of Lyria)으로 피신했지.` | Medium-high |
| `21039` | naturalness | English calls the player `this specimen`, while Japanese naturally asks `君は一体？`; Chinese also literalizes `样品`. Current `내 앞에 있는 이 표본은 대체 뭐지?` sounds like the player is a laboratory sample. Preserve the speaker's dismissive surprise without that accidental scientific reading: `내 앞에 있는 자는 대체 누구지? 대사제(Hierophant)가 유능한 사람이 찾아올 거라고 했는데, 자네가 그 사람인 모양이군.` | Medium-high |
| `26042` | format, naturalness | English `the patriarch, Ebsol` explicitly names the house patriarch; Japanese `当主のエブソル` corroborates. Current `가주 에브솔` omits English pairing and diverges from `엡솔` in the full name at `424`. Prefer `가주 엡솔(Ebsol)은 사람들과 어울리길 좋아해. 남의 눈을 피해 그에게서 반지를 훔쳐 와야 해.` | High |
| `29808` | format | English names `Wyvyrn-Gifres`, one of Rathir's Great Houses; Japanese `ワイヴァーン＝ギフ家` and Chinese `维弗恩-吉弗瑞高等家族` identify the same family. Current `와이번-기프레 가문` lacks English and differs from the established `와이번-기프르` spelling in `2204`, `26494`, and `49468`. Prefer `라시르(Rathir)의 대가문 중 하나인 와이번-기프르(Wyvyrn-Gifres) 가문의 인장 반지다.` Preserve the English inflected form and descriptive sentence ending. | High |
| `35164` | speech_level | Player choice `I'll buy it`, Japanese `買い取ろう`; the current `구매하겠습니다` introduces an unsupported customer-service honorific register. Other aligned player options in this group are plain. Prefer `이걸 사겠어. ($TRSQ02.cowl_price$ 골드)` and preserve the variable. | High |
| `35784` | naturalness | English idiom `Give me no cause to anger` and Japanese `私を怒らせない方がいいわ` mean not to provoke the Hierophant. Current `날 화나게 할 이유를 만들지 마` is an awkward calque. Prefer the sentence ending `날 화나게 하지 마.` | High |
| `50710` | format | The complete English item `Cowl of the Maiden` appears once. Korean duplicates the parenthetical title as `처녀의 두건(Cowl of the Maiden)(Cowl of the Maiden)`, unlike the standalone correct label at `34233`/`61462`. Remove the duplicated gloss: `... 처녀의 두건(Cowl of the Maiden)이다. 가는 길에 ...` | High |
| `61750` | naturalness | English `Moon Camp's Hierophant Shrine` names the place; the existing glossary form is `대사제의 성소(Hierophant Shrine)`. Current `달 야영지(Moon Camp)의 대사제의 성소` stacks possessives awkwardly. Prefer `그는 대사제(Hierophant)의 인도를 구하라며 나를 달 야영지(Moon Camp)에 있는 대사제의 성소(Hierophant Shrine)로 보냈다.` | High |

## Holds and Preserved Differences

| ID | Dimensions | Evidence and disposition | Confidence |
| --- | --- | --- | --- |
| `5269` | meaning, address | English uses lower-case `shade` as a direct address; Japanese omits it and Chinese translates it as `影子`. Current `그림자여, 그대였군` is markedly literary but may preserve a deliberate in-world epithet. The asset alone does not settle whether `shade` is an epithet, species, or poetic vocative. Hold rather than deleting or pairing it as a proper name. | Uncertain |

The exact-English duplicate `I have seen the items...` at `10188`/`27371`
and `You should forgive Irion.` at `34667`/`44025` have identical Korean.
No embedded line breaks, runtime brace tokens, or markup occur in these 110
rows in any of the four locales. Existing complete item labels such as
`Chalice of Forced Vintage`, `Cowl of the Maiden`, and
`Wyvyrn-Gifre Signet Ring` are correctly paired except for the duplicated
annotation at `50710`.

## Coverage

All 110 rows were reviewed for meaning, naturalness, speech level, address,
honorifics, terminology, duplicates, and structure. Per-ID source fingerprints
and review statuses are in `dialogue-context-review-ledger.tsv`.
Speaker-at-key, callback mapping, branch flow, and playback order remain
unknown.

`65`, `331`, `424`, `701`, `1146`, `2174`, `2204`, `3813`, `4200`, `5269`,
`5781`, `7357`, `7565`, `7591`, `8654`, `8773`, `8803`, `9212`, `10094`,
`10188`, `10273`, `10617`, `11070`, `11178`, `11258`, `12819`, `12893`,
`13775`, `13945`, `16837`, `18499`, `18789`, `19337`, `19878`, `20206`,
`20397`, `21039`, `21077`, `21091`, `21567`, `21646`, `22402`, `22954`,
`23064`, `23117`, `24558`, `24955`, `26026`, `26042`, `26494`, `27371`,
`28337`, `29254`, `29593`, `29808`, `34233`, `34350`, `34667`, `34893`,
`35164`, `35784`, `37136`, `37800`, `38955`, `39684`, `39784`, `39929`,
`41027`, `41457`, `41632`, `42163`, `43061`, `44025`, `44430`, `45065`,
`45292`, `46987`, `47118`, `47757`, `48320`, `48546`, `48682`, `49468`,
`49914`, `50578`, `50710`, `51306`, `51443`, `52590`, `54114`, `54718`,
`55355`, `56623`, `58194`, `58737`, `59098`, `59228`, `59271`, `59291`,
`59548`, `61113`, `61462`, `61750`, `61788`, `61985`, `62692`, `63831`,
`64105`, `64390`, `64970`.
