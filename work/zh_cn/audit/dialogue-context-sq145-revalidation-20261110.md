# SQ145 / Lila Janick Context Revalidation

- Date: 2026-11-10.
- Scope: all 38 `default` keys in `1610759.quest_bxml` (`SQ145`).
- No translation CSV or extracted asset was modified.
- English, Japanese, Chinese, and active Korean were compared at every ID;
  English anchors meaning and Japanese guides style/register.

## Grouping Evidence

The index records `QUEST_ID SQ145`, `NPC_POE_LJO_LilaJanick`, and 18
serialized dialogue handlers. Content concerns Lila, her sister Molly,
Sativa Fiber, a spider nest, and the family's discounts. `27248` explicitly
self-identifies Lila, but the asset is not a key-to-speaker/handler map.
Player replies and journal/objective text remain distinct content types.

## Correction Candidates

Proposals require separate acceptance before editing. Table dimensions supply
ledger statuses; unflagged dimensions remain `not_flagged`.

| IDs | Dimensions | Evidence, current text, and proposed correction | Confidence |
| --- | --- | --- | --- |
| `3926` | speech_level, address, honorifics | English casual walking greeting, Japanese `私は散歩が好きよ。あなたは？ ...新鮮ね ...いられるわ`, Chinese similarly conversational. Current `안녕하세요. 저는 ... 좋아해요. 당신도 좋아하세요? ...` introduces polite/deferential forms absent from the Japanese line. Prefer `아, 안녕. 난 걷는 걸 좋아해. 너도 걷는 거 좋아해? 여기 공기가 참 상쾌하네. 하루 종일 들이마셔도 좋겠어.` This is a row-local style comparison, not a claim that all greetings have a proven common speaker. | High |
| `15532` | format, naturalness | English full `Lila Janick`, Japanese `リラ・ジャニック`, Chinese `莱拉·雅尼克`; current `라일라 재닉(Janick)` pairs only the surname to the full Korean name. Use established local `라일라 재닉(Lila Janick)`. Later bare `라일라` and `몰리` need source-short `라일라(Lila)` and `몰리(Molly)`. Current `사티바 섬유 ... 식물에 갈 수 있도록` is awkward; prefer `연금술사 라일라 재닉(Lila Janick)이 귀한 사티바 섬유(Sativa Fibers)를 채집하러 갈 수 있도록 도왔다. 고마움의 표시로 라일라(Lila)는 자기 상품과 여동생 몰리(Molly)의 훈련 비용을 할인해 주기로 했다.` The training context is explicit at `40176`. | High |
| `40176` | format | English short `Sativa` / Japanese `サティヴァ` / Chinese `亚麻`, and `Molly` / `モリー` / `莫莉` are bare `사티바` and two `몰리` mentions in Korean. Pair source-local `사티바(Sativa)` and both `몰리(Molly)` occurrences. Do not silently expand bare Sativa into the separately registered Fibers/Stalks/Road labels. | High |
| `41977`, `42131` | format | English short `Lila`, Japanese `リラ`, Chinese `莱拉` refer to the same alchemist as self-identification `27248`. Current `리라` differs from local `라일라` and lacks pairing. Use `라일라(Lila)` at both mentions in `41977` and at `42131`. No new global name alias is inferred. | High |
| `26562` | naturalness | English objective `Kill the spiders`, Japanese `蜘蛛を殺す`, Chinese `杀死蜘蛛`; current `거미 처치` should follow action-label `-하기`: `거미 처치하기`. | High |
| `29366`, `43516` | meaning | Exact duplicate English `That is your name, isn't it?`, Japanese `それがあなたの名前よね？`, Chinese `那就是你的名字，对吧？` deliberately have the eccentric speaker mistake “spider slayer” for the player's name. Current `그게 네 별명 맞지?` rationalizes the joke into an actual nickname. Prefer the closing `그게 네 이름 맞지?` in both rows, keeping their full text identical. | Medium-high |
| `63566` | naturalness | This is a journal entry, English `Alchemist ... wants to harvest ... If I can kill ...`, Japanese reported `...という ...はずだ`, Chinese objective narration. Current `채집하고 싶어 해 ... 못하고 있어 ... 있겠지` adopts direct conversational narration instead of the adjacent quest-log style. Prefer `연금술사 라일라 재닉(Lila Janick)이 여름의 요람(Cradle of Summer)에서 보기 드문 사티바 섬유(Sativa Fibers)를 채집하고 싶어 한다. 하지만 거미 둥지 때문에 근처에 있는 몇 포기에 접근하지 못하고 있다. 거미를 처치하면 마음 놓고 채집할 수 있을 것이다.` | High |

## Holds and Preserved Differences

| IDs | Dimensions | Evidence and disposition | Confidence |
| --- | --- | --- | --- |
| `63141` | speech_level | Current `모험가님도요` is polite, while Japanese `あなたもね、冒険者さん` has a plain ending with a courteous address. English `You too, adventurer` does not specify the preceding turn or addressee relationship. The asset does not establish the reply edge. Hold an across-line consistency claim rather than automatically removing the courteous address or inventing a farewell phrase. | Uncertain |

`3551` differs between English `Don't do it on my account` and Japanese
`あなたのためにもなるわよ`; Korean follows English, supported by Chinese.
Retain the English-led meaning rather than rewriting it from Japanese.
`52178` is a player question with underspecified Japanese register and is
not automatically changed just to make every row informal.

The established glossary explicitly permits canonical
`사티바 섬유(Sativa Fibers)` for source singular `Sativa Fiber`; it is not
flagged as a singular/plural error. Sister age is supported by Japanese
`妹` at `15532`; no new older/younger relation is invented from English alone.
Duplicate pairs `11875`/`52691` and `29366`/`43516` already match in Korean.
No embedded line breaks, runtime braces, or markup occur in the four-language
rows. No further clearly supported meaning, honorific, or format defect was
established in this pass.

## Coverage

All 38 IDs were checked for meaning, naturalness, speech level, address,
honorifics, terminology, and format, with per-ID fingerprints in the ledger.
Speaker-at-key, callback mapping, branches, and playback order remain unknown.

`2827`, `3551`, `3926`, `4239`, `6294`, `11875`, `12415`, `12588`,
`13125`, `15532`, `15847`, `20252`, `20796`, `21088`, `22289`, `26562`,
`26991`, `27248`, `29366`, `30318`, `33704`, `33812`, `33872`, `36214`,
`37439`, `40176`, `40564`, `41977`, `42131`, `43516`, `43853`, `50468`,
`52178`, `52482`, `52691`, `53539`, `63141`, `63566`.
