# Preliminary Language Scan: `default` IDs 35351-35400

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 35351-35400 inclusive.
- Compared English meaning, Japanese register, Chinese supporting
  evidence, active Korean, and source-keyed historical questions.
- Read-only first reading, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 35355 | `{*1물약}`, `{LINE_SPACE}`, `{1}`, `{2}` | Confirm the displayed control/ability terminology and keep all runtime marker identities and order. | English, Japanese, Chinese and Korean retain the same wrapper/variable sequence; Korean localizes only the visible label. | Low |
| 35362-35363 | `그분`, `운명의 장벽` | Identify the unnamed `he` who asks the characters to travel together, and confirm fate-barrier as a gameplay term. | English leaves the speaker's identity open; Korean respectfully says `그분`, adding a register implication. Japanese also uses an unnamed person. | Medium |
| 35364 | `늑대 (고기 3개)` | Check whether this is an inventory/trade label, preserving the quantity three. | All four locales describe a wolf and three pieces of meat; the isolated label does not confirm the underlying transaction. | Low |
| 35368-35370 | `비단 농부`, `그나슈와 그 일족`, `스칼드` | Confirm whether Silkfarmers are silkworm growers or silk collectors, whether Gnarsh's `brood` means offspring rather than a broader clan, and Skald's name/title status. | Japanese renders silk collectors and brood as clan; English specifically says `her brood`; Korean uses a broad `일족`. Skald is explicitly female in English and Korean omits a gender marker. | Medium |
| 35373 | `검 메리` for `Melly the Sword` | Confirm whether Sword is a nickname/title for a swordswoman or a literal sword. | English uses a personal-name epithet, Japanese explicitly says swordswoman; Chinese says long-sword Melly. Korean bare `검 메리` may sound like the object is called Melly. | Medium |
| 35375 | `하이`, four-card outcome | Confirm the game's higher/lower bet label; preserve that a four means the player does not win on this draw. | English calls `Higher`, Japanese and Korean abbreviate it to High. Chinese uses a generic higher/big. | Low |
| 35376 | `그 요새는 그에게 넘겨도 돼` | Check who has the authority to grant Drewn the keep, rather than assuming a transfer by the speaker. | English says the last living heir `can have it`; Korean explicitly says someone may hand it over. Japanese describes eligibility to be castle lord. | Medium |
| 35377-35379 | Forsaken Plain, Emaire, Froma/Nag, `세이블의 서신들` | Check place and person spellings plus whether Sable is a person, epithet or color in the Missives title. | Japanese interprets Missives of Sable as a dark-crest book, whereas Chinese/Korean transliterate Sable. English alone does not determine ownership. Korean correctly retains refugee camps to the east, which Japanese makes plain camps. | Medium |
| 35380-35383 | Activity Test, `그림의 보석`, `올레인 여사` | Check whether the test label is internal; reconcile English Grim's Gem with Japanese's unrelated Tear of Mitharu; determine the formal rank implied by `Dame`. | Korean follows English on Grim's Gem. English `Dame` may be a title, while Japanese/Chinese use lady; `여사` should not be finalized without character context. | Medium |
| 35389 | `봉헌 의식` | Confirm Offering as a named rite and whether `approaches` describes an event, not an offering item. | English capitalizes `The Offering`; Korean treats it as a rite. Chinese uses sacrifice; Japanese uses offering. | Medium |
| 35391 | `난 자취를 감출 거야, 그대도` | Revisit the omitted affectionate `dove` address, as also flagged at 35148; preserve the warning to hide and the promise of a near reunion. | English explicitly addresses `dove`, while Japanese/Chinese omit or reinterpret it. Korean retains the meaning of hiding but not the recurring pet name. | Medium |
| 35396-35397 | political `장신구`, localized `{*1힘}`, `{*1재주}`, `{*1마법}` | Check what `they` denotes in the political-trinkets line and standardize Might/Finesse/Sorcery skill labels without altering marker structure. | English says Fae Heralds announce presence; Japanese specifies acquired titles. Korean follows presence and preserves the three marker identities and order. | Medium |

IDs 35351-35354, 35356-35361, 35365-35367, 35371-35372, 35374,
35381-35382 apart from the title question, 35384-35388, 35390,
35392-35395, 35398-35400 generally retain English meaning on this
first reading. Register and proper names remain integrated-pass questions.

## Historical Audit Reconciliation

- The source-keyed historical IDs 35200-35399 entry flags the team
  tournament, placeholder tutorial, unnamed `he`, wolf-meat label,
  Silkfarmers, Gnarsh/Skald, Melly, high-card wager, Drewn succession,
  refugees, Missives, Grim's Gem, Offering, `dove`, political trinkets
  and the Might/Finesse/Sorcery labels. The active Korean and all three
  reference locales were compared for these candidates.
- Japanese's Tear of Mitharu at 35381 does not override English Grim's
  Gem. None of these preliminary notes authorizes a CSV edit.

## Other Checks

- All four locale files have the same 50 IDs in the same order, with no
  embedded line breaks. Runtime tokens at 35355 and 35397 and the exact
  `{1} {2}` control order are retained.
- The `3` in the meat label, `four`/`4` in the card line, and seven
  centuries at 35395 retain their numeric meanings.
- Active Korean `default` CSV SHA-256 remains
  `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 35351-35400 received one preliminary reading. Findings remain
open candidates. Continue at `default` ID 35401.
