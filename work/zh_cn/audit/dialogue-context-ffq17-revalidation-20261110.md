# FFQ17 / Elrod Edman Context Revalidation

- Date: 2026-11-10.
- Scope: all 91 `default` keys associated with `710527.quest_bxml`
  (`FFQ17`).
- No translation CSV or extracted game asset was modified.
- English anchors meaning; Japanese guides style/register; Chinese supports
  the comparison. All four locales were checked at every ID.

## Grouping Evidence

The asset contains `QUEST_ID FFQ17`, the asset-level NPC symbol
`NPC_POE_ALM_ElrodEdman`, six serialized quest-target handlers, and 43
serialized `dialog_line_*` handlers. Its text concerns suspected Tuatha
spies among refugees, Elrod Edman's request, Anred, Froma, and Nag. The NPC
symbol and handler counts do not map individual localization keys to
speakers, callbacks, branches, or playback order. All 91 keys were absent
from the review ledger before this pass.

## Correction Candidates

These are read-only reviewer findings and proposed text, not permission to
edit the active translation CSV.

| ID(s) | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `11038` | naturalness | `난 악당에 겁쟁이지만` has an ungrammatical particle between the two predicates. Prefer `그래, 네 말이 맞아. 난 악당이자 겁쟁이지만, 너라도 똑같이 했을 거야.` | High |
| `14577` | meaning / tense | `The people of the Tywili Coast thank you` is present tense, while `고마워할 거야` says they will thank the player later. Japanese and Chinese also express their thanks as current. Prefer `먼 길을 왔구나, 친구. 온몸에 묻은 먼지가 임무를 훌륭히 해낸 걸 말해 주는구나. 고맙네. 타이윌리 해안(Tywili Coast) 사람들도 자네에게 고마워하고 있네.` | High |
| `35377`, `40231` | name consistency / English pairing | At `35377`, `Anred` is misspelled `앤레드` despite the established `안레드 앰패스트(Anred Amfast)` elsewhere, and `Nag` is `낵` despite the established `나그 펜다르(Nag Fendar)`. `Froma` and `Nag` lack English pairing in both rows. Prefer `안레드(Anred)`, `프로마(Froma)`, and `나그(Nag)` in the short-name references. | High |
| `38932` | meaning / terminology | The source says `Coln`, not `Culn`. Korean `컬른` conflates the two place names; `base:28112` already uses `콜른(Coln)`. Prefer `콜른(Coln) 난민 지도자 엘로드 에드먼(Elrod Edman)은 투아사(Tuatha)가 에라셀 평원(Plains of Erathell)에 스파이 세 명을 두었다고 믿는다. 그는 그들을 찾아 처리해 달라고 부탁했다. 물론 속임수를 멈추게 할 다른 방법이 있을지도 모른다. 엘로드(Elrod)의 말로는 두 명은 버림받은 평원(Forsaken Plain)에, 한 명은 에메어(Emaire) 마을에 있다.` | High |
| `39718` | meaning / tense | `sooner or later` expresses eventuality, while `머지않아` narrows it to the near future. Japanese `遅かれ早かれ` and Chinese `迟早` support `언젠가는 너에게도 닥칠 것이다.` | Medium-high |
| `54951` | title / English pairing | This standalone quest title is translated as `그들은 우리 사이에 섞여 산다` without the English title. For consistency and traceability, consider `그들은 우리 사이에 섞여 산다(They Walk Among Us)`. | Medium-high |

## Holds

| ID(s) | Dimension | Evidence and disposition |
| --- | --- | --- |
| `9637`, `14804`, `63221` | speech level | Korean and Japanese use different levels or degrees of formality. The key-to-dialogue-node mapping does not establish each line's speaker or conversational stage; retain these as review questions rather than imposing one voice from asset-level evidence. |
| `58835` | name reference | The line says `Elrod`, but does not give a surname. The asset association alone cannot prove that this short reference identifies Elrod Edman; keep the identity/alias unresolved rather than assigning the full-name entity. |

## Coverage

All 91 rows were checked for meaning, Korean naturalness, speech level,
address, honorifics, terminology, repeated English text, runtime markers,
markup, and line breaks. Six correction findings affect seven unique IDs;
four source/context questions remain unresolved. Four exact-English duplicate
groups already match across all four locales: `You're working for the
Tuatha.` (`1709` / `3836` / `5472`), `Admit you're a spy or die.` (`8352` /
`34697`), `Tell me about the Tuatha.` (`9979` / `17788` / `19690` / `22141` /
`24519` / `28904`), and `Never mind.` (`50115` / `55096` / `56690`). No
embedded line breaks, runtime placeholders, or markup were found.

Speaker attribution and dialogue order remain unknown at the localization-key
level. Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
No Korean CSV edit was applied.
