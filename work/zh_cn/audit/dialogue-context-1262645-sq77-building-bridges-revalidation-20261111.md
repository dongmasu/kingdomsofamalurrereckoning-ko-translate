# Asset Revalidation: `1262645.quest_bxml` (`SQ77`, Building Bridges)

- Date: 2026-11-11.
- Scope: all 101 linked `default` IDs, newly recorded.
- English controls meaning; Japanese supplies the primary voice/register
  and layout reference; Chinese is secondary meaning evidence.
- Ten correction-candidate IDs and eight evidence-limited hold IDs,
  including one ID with both a candidate and a hold.
- No translation CSV or extracted asset was changed. Candidates require
  separate approval and editing.

## Context Evidence and Limits

The asset explicitly contains `QUEST_ID` `SQ77`, NPC symbols for Herc Adwold
and Nanne Hanri, and 34 `SQ77`-prefixed serialized dialogue handlers. Its
texts also involve Aery, Iluvia, the Warsworn, and the House of Ballads.
These asset-level clues do not map particular localization IDs to NPCs,
handlers, branches, or playback order. No per-key speaker or order is inferred.
Content identifies some journal and objective entries independently of
speaker identity.

## Correction Candidates

| ID | Dimension | Evidence, finding, and proposed direction | Confidence |
| --- | --- | --- | --- |
| `2033` | Naturalness / text type | English and Japanese are quest-journal narration, while Korean ends `위태로워 ... 모르겠대 ... 했어` like spoken dialogue. Consider `페이(Fae) 아가씨가 공격당해 목숨이 위태롭다. 고어하트(Gorhart) 마을의 관리관 허크 애드월드(Herc Adwold)는 그녀를 살리고 싶어 하지만 상처를 어떻게 치료해야 할지 모른다. 마을 위에서 내려다보며 지내는 페이(Fae), 에어리(Aery)와 이야기해 보라고 했다.` The separate Warden title question remains on hold. | High |
| `11740` | Objective format | `Return to Herc Adwold` is a quest objective; Korean `돌아가라` is an imperative while other objectives here use noun forms. Consider `허크 애드월드(Herc Adwold)에게 돌아가기`. | High |
| `12836` | Naturalness | English `a bit ... untraditional` and Japanese `少し... 常識外れ` introduce an unusual idea, not necessarily a violation of formal custom. Consider `조금... 색다른 제안을 하나 하겠네`, retaining the explanation of Aery on the hill. | Medium |
| `33999` | Meaning | The English and Japanese describe tending an attacked, injured Fae, not a disease. Korean `처녀의 병을 돌보려는` implies illness. Consider `페이(Fae) 처녀를 돌보고 있는 허크 애드월드(Herc Adwold)에게 가져다줘야 한다`; retain the Gorhart Inn location. | High |
| `34895` | Meaning | English `it will not suffer the footsteps of men` uses `suffer` as tolerate, supported by Chinese `不再受人类荼毒`. Korean `발자취를 반기지 않을` weakens refusal to mere lack of welcome. Consider `인간의 발걸음은 용납하지 않을 테지. 페이(Fae)도 마찬가지야.` Japanese differs, so English controls this sense. | Medium-high |
| `38508` | Naturalness | `They will serve you well, as they have served me` describes the usefulness of the sword and buckler. Korean `오랫동안 나를 도왔듯 너도 잘 도울 거야` is awkward. Consider `내게 그랬듯 너에게도 큰 도움이 될 거야`, retaining the gift and the new compassionate community. | High |
| `48564` | Naturalness / referent | English says Aery thinks the villagers are unaware of her presence. Korean `우린 자기 존재를 모른다고 생각하겠지만` obscures the subject. Consider `그녀는 우리가 자기 존재를 모른다고 생각하겠지만, 우린 분명 알고 있어.` | High |
| `52065` | Naturalness | English `as long as they leave the forest undisturbed, as they found it` sets a condition. Korean `그들이 숲을 발견했을 때 모습 그대로 보전하고 건드리지 않는 한` is clumsy. Consider `그들이 숲을 처음 본 그대로 두고 건드리지 않는 한, 우린 그들에게 악의를 품지 않아.` Retain the message to Gorhart. | Medium-high |
| `55235` | Naturalness | English says the villagers remain directly responsible for recovery for as long as the injured Fae is there. Korean `회복을 직접 책임져야 하는 시간도 길어져` is cumbersome. Consider `이 페이가 여기 누워 있는 동안은 우리가 직접 회복을 책임져야 해.` Retain the urgency and do not add a claim of blame. | Medium |
| `58772` | Address / naturalness | English `she` and Japanese contain no diminutive or age claim; Korean `그 애가 시킨 대로` can sound patronizing and unnecessarily identifies Aery as a child. Consider `에어리(Aery)가 뭐라고 했지? 그 말대로 해야 해. 이 문제는 내가 감당하기엔 너무 커.` | Medium-high |

## Evidence-Limited Holds

| ID(s) | Dimension | Reason and disposition |
| --- | --- | --- |
| `2033`, `25392`, `55542`, `59480` | Warden title | All refer to Herc Adwold's English `Warden` office, but Korean has `관리관`, `경비대장`, and `감시관`. D-19635 previously accepted `관리관` specifically for Herc, while the later `38098` disposition says `감시관` matches an accepted office term. The corpus-level office decision and exact title convention conflict; hold unification pending reconciliation. The journal-style candidate at `2033` preserves its present title in the meantime. |
| `11747`, `16995`, `36427`, `57425` | Speech level | Korean uses formal or polite speech while Japanese is plain. The multi-character asset does not establish per-key speaker or relationship; formality can be situational. Hold normalization rather than assigning these to Herc or another character from topic alone. |

## Retained Decisions and Structural Checks

- The existing glossary confirms `허크 애드월드(Herc Adwold)`,
  `에어리(Aery)`, and `일루비아(Iluvia)`; no new global alias is inferred.
- `13430` and `28426` share a description but specify different directions
  and terrain in English. Retain the distinct east/meadow and
  northeast/forest details rather than replacing the full lines as duplicates.
- `59270` follows English and Chinese's entering the Great Cycle, while
  Japanese reads differently; do not turn this source conflict into a new
  lore claim.
- Two exact-English duplicate groups match in Korean: `3514`/`52110`, and
  `26199`/`41631`/`53666`.
- All 101 rows match across four languages in newline counts and extracted
  brace-token/angle-markup sequences. This is not a playback/display test.

## Complete Asset ID Set

`486`, `2033`, `2499`, `2508`, `2794`, `3514`, `4261`, `6462`, `9008`,
`9069`, `11264`, `11740`, `11747`, `11770`, `12836`, `12878`, `13430`,
`14656`, `14722`, `16749`, `16995`, `19060`, `19923`, `21327`, `25392`,
`25791`, `25805`, `26199`, `27964`, `28029`, `28426`, `28984`, `29397`,
`30083`, `30228`, `31795`, `32030`, `33504`, `33999`, `34450`, `34895`,
`35069`, `35817`, `36427`, `36574`, `36575`, `36739`, `37296`, `37668`,
`37972`, `38443`, `38508`, `38579`, `40301`, `40329`, `40970`, `41002`,
`41455`, `41631`, `41890`, `43251`, `45099`, `45547`, `46837`, `47016`,
`47124`, `47213`, `48564`, `48933`, `49330`, `49594`, `51993`, `52065`,
`52073`, `52110`, `52742`, `52993`, `53119`, `53666`, `53898`, `54110`,
`54595`, `54798`, `54828`, `54929`, `55235`, `55542`, `56141`, `56442`,
`57425`, `58772`, `59270`, `59480`, `60366`, `60460`, `61224`, `62092`,
`62266`, `62954`, `63823`, and `65121`.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
