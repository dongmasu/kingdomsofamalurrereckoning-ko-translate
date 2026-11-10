# SQ131 / Bronwen Senn Arena Context Revalidation

- Date: 2026-11-10.
- Scope: all 80 `default` keys in `1583001.quest_bxml` (`SQ131`).
- Read-only review; no translation CSV or extracted asset was modified.
- Every row was compared in English, Japanese, Chinese, and current Korean.
  English anchors meaning; Japanese guides register; Chinese is supporting.

## Grouping Evidence

The index records `QUEST_ID SQ131`, `NPC_KLU_DOK_BronwenSenn`, and 29
serialized dialogue handlers. The text describes nonlethal arena challenges,
Bronwen's First Sword title, her sister Ragna, and the five challengers.
`1773` explicitly self-identifies Bronwen; the asset does not individually
map the remaining keys to speakers or callbacks. Objectives and player
replies are not assigned Bronwen's voice.

## Correction Candidates

Proposals are not accepted edits. Dimensions below supply the ledger
statuses; unflagged dimensions remain `not_flagged`.

| IDs | Dimensions | Evidence, current text, and proposed correction | Confidence |
| --- | --- | --- | --- |
| `18657`, `21254`, `30251`, `35478`, `39740`, `61480` | meaning, naturalness | English objectives say `Defeat`, Japanese `倒す`, Chinese `击败`. These are practice bouts with explicit rematches and post-bout rewards, not orders to kill. Current `처치`/`처치하라` is misleading. Use `세페드라 윌(Sephedra Wyll) 물리치기`, `타릭 스미스(Tarrick Smith) 물리치기`, `라그나 센(Ragna Senn) 물리치기`, `제일검(First Sword) 물리치기`, `에이드런 티르(Aedran Tyr) 물리치기`, and `에니온 가이우스(Enion Gaius) 물리치기`, respectively. | High |
| `1773`, `4994`, `35478`, `47151`, `49038`, `49150`, `64900` | format | English consistently names the rank `First Sword`, Japanese `ファーストソード`, Chinese `第一剑`. Korean alternates `제일검` and `퍼스트 소드`, with missing or mismatched title annotation. Propose one scoped title `제일검(First Sword)`; at `4994`, preserve the complete title/name pairing as `제일검 브론웬 센(First Sword Bronwen Senn)`. At `49038`, retain separate `제일검(First Sword) 브론웬 센(Bronwen Senn)`. This is a consistency proposal, not a claim of a previously approved global rank term. | High |
| `25504` | format | English `Xerastes`, Japanese `ゼラスタス`, Chinese `赛瑞斯特` identify the named Tuatha champion. Current bare `제라스테스` needs `제라스테스(Xerastes)`; do not expand this into a new biography. | High |
| `29947`, `39608` | format | Source explicitly names `Sephedra` (`スフェルドラ` / `赛菲德拉`), current Korean bare `세페드라`. Pair `세페드라(Sephedra)` without expanding the short name. | High |
| `32044` | format | Source `Ragna`, Japanese `ラグナ`, Chinese `拉格纳`, current `라그나`. Use source-short `라그나(Ragna)`. The younger-sister relation is supported by Japanese here and at `10277`. | High |
| `56491` | format | English `Tarrick`, Japanese `タリック`, Chinese `塔里克`; current bare `타릭` should be `타릭(Tarrick)`. | High |
| `57757` | format | English `Enion`, Japanese `エニオン`, Chinese `埃尼恩`; current bare `에니온` should be `에니온(Enion)`. | High |
| `1773` | naturalness | English first-person introduction, Japanese plain `私は...よ ... この手で倒した`, Chinese first-person statement. Current `나는 ...이다. 전장에서 태어나 내 손에 수백 명이 쓰러졌다.` sounds like a character dossier rather than her introduction. Prefer `나는 알파르(Alfar)의 제일검(First Sword), 브론웬 아우렐리아 센(Bronwen Aurelia Senn)이야. 전장에서 태어났고, 이 손으로 수백 명을 쓰러뜨렸어.` | Medium-high |
| `18338` | speech_level, address, honorifics | English `The Alfar honor you, champion`, Japanese `アルファーはあなたを称賛する ... 恐れんことを！` has a ceremonial wish but no Korean-style archaic deference. Current `그대를 기리나이다, 용사여` introduces an extreme elevation absent from Japanese and the informal victory remarks. Prefer `알파르(Alfar)가 네게 경의를 표해, 용사여. 투아사(Tuatha)가 네가 온다는 소식만으로도 두려워하기를!` Preserve the blessing rather than flattening it to ordinary chat. | Medium-high |
| `19015` | meaning, naturalness | English `didn't pull any punches`, Japanese `手加減しなかった`, Chinese is unreliable here (`没有...动过手`). Current `아주 제대로 손을 썼더군` can imply underhanded action rather than not holding back. Prefer `우리 대장장이를 조금도 봐주지 않았네. 내일도 망치를 들 수 있으면 좋겠어.` | High |
| `28397` | naturalness | English `if you don't mind hearing it from me`, Japanese `私から言わせてもらえば`, Chinese `我这样说你别介意`. Current `내게 그런 말을 들어도 괜찮다면` is an awkward literal condition. Prefer `기분 나쁘게 듣진 마. 세페드라(Sephedra)한테 완전히 망신당했네. 다시 한번 겨뤄 보는 게 어때?` | High |
| `52453` | naturalness | English `his demon pet` is a dismissive image for the demon he commanded (`18229`); Japanese `悪魔のペット`, Chinese `恶魔宠物` follow the metaphor. Current `그의 악마 애완동물` sounds like a literal animal companion. Prefer `경의를 표해, 챔피언. 네가 말윈(Malwyn)과 그가 부리던 악마에 맞서 싸우는 모습을 난 전선에서 지켜봤어.` Retain the battlefield vantage point, not Chinese's mistaken war chariot. | Medium-high |
| `52651` | naturalness | English describes Aedran in direct speech, Japanese `...兵士よ ...忍耐強い`, Chinese likewise descriptive speech. Current `살아남았다. 포기할 줄 모르는 군인이다. ... 끈질기지` mixes dossier-style statements and conversational endings within one row. Prefer `에이드런 티르(Aedran Tyr)는 부대원들이 한 명도 남김없이 쓰러진 뒤에도 세 번이나 홀로 살아남았어. 포기할 줄 모르는 군인이야. 두려움을 모르고 끈질기지.` | High |
| `54832` | naturalness | English `I hope you know what you're doing`, Japanese `分かっているでしょうね`, Chinese `希望你自己心里有数` express caution about the choice to fight again. Current `네가 무슨 일을 하는지 알고 있길 바라` is literal and stilted. Prefer the closing `잘 생각하고 결정한 거길 바라.` Preserve the preceding warning about Aedran. | Medium-high |
| `60338` | speech_level, address | English `You are worthy of honor, warrior. I have never faced your equal.`, Japanese `称賛に値するわ、戦士よ ...戦ったことがない` remains plain admiration, Chinese no new deferential register. Current `그대는 ... 있소 ... 없소` introduces a new haoche voice. Prefer `존경받아 마땅한 전사로군. 너만큼 뛰어난 상대와는 싸워 본 적이 없어.` | High |
| `61131` | speech_level, address, honorifics | English `You have earned great glory, and the respect of all Alfar`, Japanese `手にしたわね` stays conversational. Current `그대는 ... 얻었습니다` suddenly introduces formal polite narration. Prefer `넌 위대한 영광과 모든 알파르(Alfar)의 존경을 얻었어.` This finding is supported by the aligned row itself, not just an assumed same-NPC sequence. | High |

## Other Checks

All four exact-English duplicate pairs already match in Korean:
`5162`/`12818`, `10998`/`30829`, `37251`/`63665`, and `42356`/`52330`.
`13741` differs from `5162` in English punctuation; its equivalent Korean
word order is not a semantic contradiction. No forced extra rewrite is made.
`49172`'s `자멸` follows Japanese's idiomatic interpretation of falling on
one's sword. The literal misleading Chinese reading is not adopted.

No embedded line breaks, runtime brace tokens, or markup occur in any of
these 80 rows in the four locales. Other dialogue, choices, and quest text
were checked for meaning, style, address, honorifics, and structure without
a further clearly supported defect in this pass.

## Coverage

All 80 rows have per-dimension review statuses and four-language fingerprints
in `dialogue-context-review-ledger.tsv`. Speaker-at-key, callback mapping,
branch flow, and playback order remain unknown.

`1773`, `1990`, `4994`, `5162`, `8166`, `8356`, `10277`, `10998`,
`11836`, `12426`, `12455`, `12818`, `13061`, `13741`, `14327`, `14396`,
`14843`, `16409`, `18229`, `18335`, `18338`, `18657`, `19015`, `19223`,
`19503`, `19556`, `20201`, `20213`, `21254`, `25027`, `25504`, `27353`,
`27974`, `28397`, `29947`, `30251`, `30829`, `31706`, `32044`, `32137`,
`33868`, `35478`, `35527`, `36676`, `37251`, `37267`, `39608`, `39731`,
`39740`, `40499`, `42356`, `42888`, `46808`, `46967`, `47151`, `49038`,
`49150`, `49172`, `50581`, `52330`, `52453`, `52651`, `53939`, `54832`,
`55092`, `55418`, `55983`, `56491`, `57374`, `57757`, `60338`, `61131`,
`61480`, `62096`, `63346`, `63665`, `63935`, `64614`, `64900`, `64962`.
