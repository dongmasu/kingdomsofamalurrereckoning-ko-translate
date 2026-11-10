# SQ02 / Kells Cafferty Context Revalidation

- Date: 2026-11-10.
- Scope: all 213 `default` keys in `441938.quest_bxml` (`SQ02`).
- No translation CSV or extracted asset was modified.
- English anchors meaning; Japanese guides style/register; Chinese supports
  the comparison. All four locales were checked at every ID.

## Grouping Evidence

The asset contains `QUEST_ID SQ02`, the asset-level symbol
`NPC_POE_ALM_KellsCafferty`, and 85 serialized `dialog_line_*` handlers. Its
text concerns Kells Cafferty, the Amrynthian Band, the Seelie Fae, and
transactions involving gems. The asset symbol and handler count do not map
individual localization keys to speakers, callbacks, branches, or playback
order.

## Correction Candidates

These are read-only reviewer findings and proposed text, not permission to
edit the active translation CSV.

| ID(s) | Dimensions | Evidence and proposed Korean | Confidence |
| --- | --- | --- | --- |
| `9604`, `47815` | meaning / naturalness | The English short form `Band` refers to the Amrynthian Band, which this quest identifies as a crown; the Chinese source at `9604` also names the Amrynthian item, and the active Korean consistently calls it `암린시안 관(Amrynthian Band)` elsewhere in this group. `밴드` at `9604` and `일행` at `47815` misread the item. Prefer `그 관은 어떻게 복원하지?` and `잠깐만 기다려. 관을 복원해 볼게.` | High |
| `2064`, `23635` | speech_level / naturalness | These are parallel greetings from the same quest context. English and Japanese use theatrical plain imperatives; Korean `2064` shifts to formal `-오시오/-이요`, while `23635` mixes `다가오라` with polite `당신이군요/원하죠`. The asset does not establish a callback-level speaker mapping, so this is a line-level consistency finding. Prefer `다가오라. 운명의 지혜를 기다려라! 나는 위대한 켈스 카퍼티(Kells Cafferty), 맹세와 신념을 다해 운명의 자매들을 섬기는 자다!` at `2064`, and `다가오라. 운명의 지혜를 기다려라...! 아, 너였군. 무슨 일이지?` at `23635`. | High |
| `24314` | speech_level | English `take it` and Japanese `受け取りなさい` are direct plain-form instructions; current Korean `받으세요` introduces a polite ending unlike the source. Speaker attribution for this exact key is not established. Prefer `자, 여기. 축복을 담아 받아.` | Medium-high |
| `11022`, `11619` | meaning / naturalness | Both rows name `Onarach`, rendered elsewhere in this same localization as `오나락(Onarach)` (for example, `500` and `52736`), not `오나라흐(Onarach)`. At `11619`, the English and Japanese also describe visitors as uncommon; make that meaning natural without changing the casual question. Use `오나락(Onarach)` consistently; the full line can read `여기 오나락(Onarach)에는 손님이 잘 안 와... 무슨 일이지?` | High |
| `931` | meaning / naturalness | English calls Rialte Brocaire a particularly rare northern `vintage`; Japanese likewise uses the generic vintage term, while Chinese explicitly identifies it as wine. The Korean `빈티지` alone is unclear in this sentence. Prefer `그럼 우리에게 마실 것을 가져올 시간은 충분하겠군. 리알테 브로케어(Rialte Brocaire)를 들어 본 적 있나? 북부 지방의 아주 귀한 와인이라네.` | High |
| `31903`, `65134` | meaning / terminology / format | Both refer to the same Varani `blademaster`, Three Swords. The same quest already uses the established `검술 대가` at `6776` and `16414`; `검사` and `검술의 달인` split the title inconsistently. These rows also omit the English pairing for the named sword Hellbane, which is paired at `28656` and `32640` in the same asset. Use `검술 대가` and `헬베인(Hellbane)` in both full sentences: `다음 임무는 세 자루의 검(Three Swords)이라는 위대한 바라니(Varani) 검술 대가의 시신에서 헬베인(Hellbane)을 되찾아 오는 거야.` and `검술 대가 세 자루의 검(Three Swords)의 전설적인 무기를 찾았다. 더펠(Derfel)은 헬베인(Hellbane)을 다시 손에 쥐면 분명 기뻐할 거야.` | High |

## Holds

No additional source-conflict or insufficient-evidence hold was identified in
this bounded pass. Proposed edits remain unapplied.

## Coverage

All 213 rows were checked for meaning, Korean naturalness, speech level,
address, honorifics, terminology, repeated English text, runtime markers,
markup, and line breaks. Six correction findings affect ten IDs. Nine
exact-English duplicate groups (20 rows) have identical English, Japanese,
Chinese, and Korean text. The two runtime markers,
`$SQ02.bettergem_cost$` and `$SQ02.gem_cost$`, remain in their corresponding
rows in all four locales. No embedded line breaks or markup were found.
Speaker attribution and dialogue order remain unknown at the localization-key
level.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
No Korean CSV edit was applied.
