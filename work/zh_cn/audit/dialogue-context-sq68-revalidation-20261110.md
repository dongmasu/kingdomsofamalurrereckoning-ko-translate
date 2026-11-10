# SQ68 / Liordran-Associated Context Revalidation

- Date: 2026-11-10.
- Scope: all 40 `default` keys in `1621030.quest_bxml` (`SQ68`).
- No translation CSV or extracted resource was modified.
- English controls meaning; Japanese guides style/register; Chinese supports
  the comparison. All four locales were checked for every listed ID.

## Grouping Evidence

The index records `QUEST_ID SQ68`, `NPC_KLU_UNS_SQ68_Liordran`, and 24
serialized dialogue handlers. Content concerns the Keening, Balor's arrival,
Tuatha, Jottun, and the Alfar war. Both `Liordran` (`41470`) and
`Audra Firan` (`62638`) occur as labels. This is particularly unsafe to
flatten into one NPC voice merely because only one `NPC_` symbol was scanned.
Neither label establishes a speaker-at-key or reply/order mapping.

## Correction Candidates

Proposals require separate acceptance. Dimensions below supply ledger
statuses; other reviewed dimensions remain `not_flagged`.

| IDs | Dimensions | Evidence, current text, and proposed correction | Confidence |
| --- | --- | --- | --- |
| `1278`, `38015` | format | English `Greater Niskaru` is Japanese `グレートニスカル` / `グレーター・ニスカル`, Chinese `高等尼斯卡鲁`. Korean varies `상급 니스카루(Niskaru)` and `상위 니스카루(Niskaru)`, and neither gloss covers the type qualifier. Propose scoped `상급 니스카루(Greater Niskaru)` at `1278`; for the full compound at `38015`, `상급 니스카루 발로르(Greater Niskaru, Balor)`. This follows the Balor glossary's instruction to preserve source-specific full compounds. The choice of `상급` is a consistency proposal, not a claim of an already approved universal grade term. | High |
| `36742` | meaning | English `alongside my brethren`, Japanese `同胞と共に`, Chinese `弟兄们` refer to fellow Alfar combatants. Current `형제들과` can wrongly suggest biological male siblings. Prefer `수년간 동족들과 나란히 싸웠어. 이 전쟁은 절대 끝나지 않을 거라고 생각하기 시작한 바로 그때, 네가 나타났지.` | Medium-high |
| `43506` | speech_level, address | English greeting `Greetings, hero. It is an honor to talk with you.`, Japanese `ようこそ、英雄。話ができて光栄だわ` remains plain despite the respectful sentiment. Current `안녕하시오 ... 그대와 ... 영광이오` adds haoche diction not found in that aligned row. Prefer `반가워, 영웅. 너와 이야기할 수 있어 영광이야.` This is a row-local style candidate, not proof that all informal and formal rows belong to Liordran. | Medium-high |

## Other Checks

`52380`'s polite `이 늪엔 좋은 게 하나도 없어요` is supported by Japanese
`この沼にたいしたものはありませんよ`; do not normalize it to informal
speech just because nearby IDs use informal endings. The two named-person
labels and differing Japanese voices require speaker mapping before any
whole-character continuity claim.

`45456` follows Japanese's hopeful praise while retaining English gratitude.
`43504`'s spell reference is supported by all three sources, rather than
being silently changed into a purely figurative political conversion.
`52987` follows English's singular referent, Balor, not Japanese's plural
wording. `35746`'s parallel landscape description is acceptable as descriptive
plain prose; no speculative narration-to-dialogue rewrite is proposed.

Exact-English duplicate pairs `20411`/`31390` and `30230`/`31813` already
match in Korean. All 40 rows in the four locales lack embedded line breaks,
runtime braces, and markup. No other clearly supported meaning, naturalness,
address, honorific, or structure defect was established in this pass.

## Coverage

All 40 keys have per-dimension statuses and four-language fingerprints in
`dialogue-context-review-ledger.tsv`. Speaker-at-key, callback mapping,
branches, and playback order remain unknown.

`1278`, `2841`, `4253`, `4433`, `5673`, `6070`, `6139`, `6719`, `12393`,
`13685`, `14636`, `20411`, `22599`, `26147`, `28184`, `30230`, `31390`,
`31813`, `35047`, `35746`, `36742`, `38015`, `41470`, `43504`, `43506`,
`45387`, `45456`, `49276`, `50471`, `52242`, `52380`, `52987`, `53638`,
`56305`, `57142`, `57749`, `58946`, `61836`, `62217`, `62638`.
