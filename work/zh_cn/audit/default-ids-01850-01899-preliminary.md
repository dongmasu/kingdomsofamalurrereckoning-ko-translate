# Preliminary Language Scan: `default` IDs 1850-1899

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 1850-1899.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  checked sibling locales for disputed source wording and reconciled
  historical `default` questions only.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 1852 | ... 여기서 벌어진 진실을 알게 되는 자는 내가 직접 입을 막을 거야. | Preserve the likely intended threat but verify the English source error (`I will silence myself`) against context. | Japanese, Chinese, German, Spanish, French, Italian, and Russian all say the speaker will silence anyone who learns the truth; English alone says “silence myself.” Korean follows the cross-language/contextual reading and is likely right, but the source discrepancy must remain documented. | High |
| 1860 | 다시 돌아온 윈더미어의 시녀 | Check whether the English fragment is a series/title label and avoid adding a return-event meaning unless context supports it. | English says `Again the Maid of Windemere`; Japanese renders a dramatic epithet plus “again,” and other locales use a return/title construction. Korean `다시 돌아온` is natural prose but may turn a title fragment into a completed return event. | Medium |
| 1866 | ... 그리고 헥스(hex)가 있어. 카드 여섯 장을 모두 섞었지. | Retain `hex` provisionally and determine whether it is a special card, source error, or deliberate wordplay. | English explicitly says `hex`; Japanese transliterates it, while Chinese/Spanish/French/Italian/Russian make it a six. German retains `Hex`. The historical audit correctly leaves the discrepancy open; do not silently replace it with “six.” | High |
| 1877 | ... 귀부인의 지갑보다 연지를 훔치는 걸 더 좋아하는 것 같아. | Confirm that `rouge` means literal cosmetics and that `연지` is appropriate in this speaker's register. | English explicitly contrasts makeup with a purse; Japanese/Chinese and German/Spanish/Italian support cosmetics. French converts the line into a general appearance joke. Korean's `연지` is semantically supported but may sound archaic against the casual dialogue. | Medium |
| 1884 | 신들이시여, 정말 높군! | Check whether `high` means an expensive price rather than physical height. | English is ambiguous in isolation; Japanese, Spanish, French, and Italian explicitly interpret the line as a high price/cost. Korean's `높군` can be read as literal height and omits the likely price context. | High |
| 1885 | 안녕하세요. 이제 제 얘기를 들어주실 시간 있으세요? | Align the greeting and register with the speaker's voice. | English is informal and Japanese says roughly “Hey, can you listen for a moment?”; Chinese and European versions are polite. Korean uses formal polite speech and adds a more deferential greeting, so the character register needs context. | Medium |
| 1890 | {*1수감}되었습니다... {*1잠자기} 또는 {*1탈옥}으로 나갈 수 있습니다... | Verify the exact jail UI actions and the experience penalty wording. | The source distinguishes sleeping/serving time from escaping; Japanese, Chinese, and European versions differ in whether sleep is framed as an action or completing the sentence. Korean preserves all three markers and the stated penalty, but the UI/action wording remains a historical question. | Medium |
| 1893 | 잠든 상태입니다. 8시간이 지났습니다. 생명력과 힘이 회복되었습니다. | Determine whether English `Power` is the Mana resource and align its Korean name with gameplay terminology. | English says `Health and Power`; Japanese and French say Mana, Chinese/Russian use a broader power/strength term, and the remaining locales vary. Korean `힘` may be mistaken for the Might attribute rather than a replenished resource. | Medium |
| 1894 | ... 세 곳의 여행자 야영지를 모두 방문 ... 태양 야영지와 ... 달 야영지다. | Preserve the source's three-camps/two-named-camps discrepancy pending world-map context. | English and Japanese/Chinese all say three camps but name only Sun and Moon; sibling locales likewise do not supply a third. Korean retains the mismatch instead of inventing a location, as the historical audit recommends. | High |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 1852, 1866, 1877, 1879,
  1890, 1894, and 1898 against the active Korean and source locales. The
  source error, `hex`, cosmetics, named blur, jail mechanic, camp count, and
  shield-role questions remain open or provisionally resolved as summarized
  above.
- The historical audit also has separately keyed `base` questions in this
  numeric interval. Those were not applied to these `default` rows.

## Other Checks

- ID 1875 preserves the 25% damage reduction; ID 1890 preserves the source
  marker order and `{LINE_SPACE}` token.
- ID 1899 `짝수` matches English `Even` and Japanese; the conflicting Chinese
  `平局` appears to be a source-locale discrepancy, not support for changing
  the Korean.
- The remaining inspected dialogue, quest, item, and UI rows preserve their
  main meaning and principal voice.

## Batch Status

IDs 1850-1899 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
