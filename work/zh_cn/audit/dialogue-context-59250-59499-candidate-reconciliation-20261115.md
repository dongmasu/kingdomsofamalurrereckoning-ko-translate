# Candidate Reconciliation: IDs `59250`-`59499`

- Date: 2026-11-15.
- Rechecked all ten new correction candidates against the current Korean
  text and English, Japanese, and Chinese references.
- All ten candidates were reconciled: eight were already reflected in the
  current text, and two were corrected.
- Rechecked seven earlier candidates and two report-only findings. Four
  already match the supported wording; three additional rows were corrected.
- The rank at `59263` and the title question at `59480` remain unresolved;
  no unsupported rank or title convention was inferred.

## New Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `59284` | Already resolved | The standalone objective is already paired as `오드라(Audra)에게 돌아가기`. |
| `59314` | Corrected | The Korean label paired only the person's name, not the complete item name. Changed it to `명장 미타란의 기력 강화 리벳(Master Mitharan Energizing Rivets)` without duplicating the English name. |
| `59317` | Already resolved | The location is already paired as `세 바람의 버팀목(Three Winds Crutch)` and the sentence retains the approximate “near” relation. |
| `59323` | Already resolved | The complete standalone name and rank are already paired as `골시 에이다르 대위(Captain Golsey Eidar)`. |
| `59358` | Already resolved | The objective already pairs Orla as `오를라(Orla)`. |
| `59367` | Already resolved | Both direct forms of address already use `와인(Wine)`, distinguishing the person from the drink. |
| `59373` | Already resolved | The location is already paired as `성채 안뜰(Keep Courtyard)`. |
| `59387` | Already resolved | The complete item name is already paired as `사가드의 고급 수정(Sagard's Fine Crystals)`. |
| `59388` | Already resolved | The current line already says `첫 토론 상대를 꺾었다`, correctly identifying a debate rather than a physical fight. |
| `59435` | Corrected | Completed the named location and smoothed the Korean objective to `귀한 과일을 페이의 무덤(Fae Mound)으로 돌려보내기.` |

## Earlier Findings Rechecked

| ID | Disposition |
| ---: | --- |
| `59258` | The current `빅 헌트(The Big Hunt)` matches the establishment name used at other references. |
| `59260` | Replaced the stiff/role-like `발라드의 챔피언` with `발라드 속 용사`, supported by the same narrative's `champion` as `용사` at `20416` and the aligned Japanese/Chinese wording. |
| `59263` | Retained `개릭 제독(Commodore Garrick)`. The English rank is paired, but the exact Korean equivalent of Commodore remains unconfirmed. |
| `59282` | Replaced the elevated `그대여` with the established familiar address `친구`, preserving Grim's conversational voice and the weight-loss joke. |
| `59300` | Made the complete utterance consistently conversational plain style: `네 수고가 헛되지 않게 할게. 이 일을 맡아 주면 후하게 보상할게. 하지만 슬픔으로 가득한 긴 여정이 될 거야.` |
| `59318` | The current `게르턴 애스커(Gertern Asker)와 그의 형제` already makes the relationship explicit. |
| `59397` | The current row already uses `오지간을 처치한 자` and `사그렐 경(Sir Sagrell)`. |

The existing hold at `59480` remains unresolved because the evidence does
not settle the Korean equivalent of Herc Adwold's `Warden` title.

## Report-Only Findings Rechecked

| ID | Disposition |
| ---: | --- |
| `59432` | Rephrased the abstract `이 많은 죽음` as `이렇게 많은 사람이 죽었다니, 도무지 이해할 수 없어.` |
| `59483` | Combined the full title and name as `투아사 대가 파라글렌(Tuatha Master Farraglen)`; retained the separate later reference to the Tuatha people. |

No speaker or dialogue order was inferred from asset association.

## Applied Changes

- `59314`: paired the complete `Master Mitharan Energizing Rivets` item
  name.
- `59260`: clarified `champion in the ballad` as `발라드 속 용사`.
- `59282`: replaced `그대여` with the locally established familiar address
  `친구`.
- `59300`: aligned the full utterance to conversational plain style.
- `59432`: clarified that the speaker is reacting to the number of people
  who died.
- `59435`: paired the full `Fae Mound` location.
- `59483`: paired the complete source-order title and personal name.

## Result and Verification

- All ten new candidates were reconciled; eight were already correctly
  reflected in the current text.
- Candidate reconciliation is `3,337 / 4,026` (`82.89%`), with `689`
  remaining. Previously reconciled findings were not counted again.
- Only the seven edited IDs' `source_fingerprint` fields were refreshed.
- No source CSV, extracted game asset, or game binary was changed. No commit
  was made.
