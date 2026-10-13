# Preliminary Language Scan: `default` IDs 4300-4349

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 4300-4349.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled historical questions by resource type and checked lore names,
  objectives, register, numeric effects, and ability markup.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 4300 | 신비한 망치(Mystic Hammer)의 잔해를 최초의 맹세자(Firstsworn)의 대장간으로 가져왔다. 이곤(Eagonn)은 이 무기로 마법사 파를랑(Fahrlang)을 쓰러뜨렸다. 새로 벼려 내면 베신(Besin)이 파를랑의 계획을 완수하는 걸 막을 수 있을지도 모른다. | Standardize the Firstsworn forge and Mystic Hammer names with prior quest entries, preserving that the remains must be remade to stop Besin. | English, Japanese, and Chinese agree on the weapon's history and the plan to remake it. Korean preserves the causal chain and proper-name traceability; terms should align with earlier mentions such as IDs 4081 and 4342. | Medium |
| 4301 | 칭호란 무엇인가? | Determine whether `titles` means social ranks, forms of address, or game title text in this UI/tutorial context. | English is generic; Japanese says title/honorific, and Chinese says title. Korean uses `칭호`, plausible but not conclusive without the UI context. | Medium |
| 4307 | 운이 좋다고 느낀다 | Determine whether this is a dialogue prompt, status label, or an unfinished phrase. | English is a bare phrase; Japanese calls it a feeling of luck and Chinese phrases it as a question. Korean turns it into a complete declarative status. | Medium |
| 4310 | 우리는 모든 겨울 페이(Winter Fae)가 의지하는 토대다. 우리를 공격한 투아사는 이로써 자기 동족에게 완전히 등을 돌렸다. | Preserve the claim that Winter Fae rely on “us” and that the Tuatha have turned against their own kin. | English, Japanese, and Chinese support the faction-level statement. Korean retains it and uses `겨울 페이` as a named group. | Low |
| 4315 | 네가 도착한 것도, 우리가 만난 것도 우연이 아니야. 아노카토스(Anokatos)의 배신과 아르케스(Arkes)를 찾은 일도 마찬가지지. 이 일들은 누군가 의도적으로 꾸민 거였어. 이제야 알겠군. | Preserve the list of events as deliberately orchestrated; clarify whether `finding Arkes` is a discovery or a search. | English contains the malformed `crafted intent`; Japanese/Chinese interpret events as intentionally arranged. Korean resolves the source error as deliberate orchestration, a supported reading. | Low |
| 4318 | 브래티건(Brattigan) 선장은 칼래머티(The Calamity)호 난파 사고의 생존자가 더 있을까 걱정하고 있다. 아직 살아 있는 사람이 있는지 찾아 스커틀 해변(Scuttle Beach) 일대를 조사해 달라고 했다. | Preserve that the Captain requested an exploration of Scuttle Beach to locate any additional survivors. | English, Japanese, and Chinese agree; Korean retains the request and location. | Low |
| 4319 | 불패 중대 | Determine whether `Company` is a military unit, fellowship, or named group and standardize the title accordingly. | English and Chinese suggest a company/unit; Japanese reads it as comrades. Korean's `중대` commits to a military company, which is plausible but may not fit the named faction. | Medium |
| 4321 | 윈더미어의 시녀(The Maid of Windemere)가 내게 도전했으니, 이제 어떻게 해야 할지 할럼(Hallam)에게 물어봐야겠다. 할럼은 내가 떠났던 그 자리에 하우스 오브 발라드(House of Ballads)에 있을 것이다. | Preserve that Hallam is at the place in the House of Ballads where the speaker left him. | English says “where I left him in the House”; Japanese says he is in the same place. Korean's `내가 떠났던 그 자리에` can mean where the speaker departed from rather than where Hallam was left. | Medium |
| 4325 | 대사제를 모함하기 | Keep `Frame` as falsely implicate, not as a physical frame, and standardize the Hierophant title. | English uses the verb `frame`; Japanese/Chinese say entrap/implicate. Korean's `모함하기` captures false accusation and is semantically supported. | Low |
| 4328 | 자칭 예언자(Augur)라는 자야. 운명에서 벗어나 텔로그루스(Telogrus)에게 헌신하라고 설교하지. 혼돈이 우리 삶을 더 낫게 해 주기라도 한다는 듯이. | Preserve the speaker's skeptical voice and distinguish the Augur's preaching from an endorsed doctrine. | English and Japanese describe preaching freedom from Fate and devotion to Telogrus; Chinese agrees. Korean retains the sarcasm and named entities. | Low |
| 4334 | 미안하오, 나그네여. 마을 재건을 맡게 된 사람이 바로 나인 것 같소. 앞으로 몇 달간의 일정을 정리해야 하오. | Preserve the speaker's apology, responsibility for rebuilding, and need to organize several months of work. | English and Chinese agree; Japanese is shorter. Korean uses a formal register suitable for the speaker and retains the schedule detail. | Low |
| 4336 | 그것들은 번개와 불, 얼음이야. 귀중한 것들이지. 이 황량한 땅에서 마법의 힘이 약해졌어도 여전히 소중하니 돌려받아야 해. | Identify the antecedent of `They` and whether these are elements, objects, or powers; retain the need to return them. | English/Japanese/Chinese all omit the antecedent but agree on lightning, fire, ice, their weakened magic, and return. Korean preserves that uncertainty. | Medium |
| 4338 | 부탁은 이제 그만 들어줄래. | Restore the source's firm declaration that the speaker is done hearing requests; the current Korean can sound like asking someone to stop requesting favors. | English and Japanese make the speaker's decision final; Chinese is mistranslated as finishing interrogation. Korean turns it into a question/request and shifts who is acting, weakening the refusal. | High |
| 4340 | 무자비한 공격(Relentless Assault)이 활성화된 동안: / 체력 22 흡수 확률 +20% | Preserve the active-condition line, 20% proc chance, and 22 Health steal; align with the manual's `Health` = `체력` terminology. | English explicitly says `+20% Chance to Steal 22 Health`; Japanese/Chinese also describe health stealing. Korean preserves the condition and values. The stat ordering should be checked against other Korean ability text for readability. | Medium |
| 4348 | `{*1크로스파이어(Crossfire)}` ... / `{*1탈론 스트라이크(Talon Strikes)}` ... | Preserve both named ability markers, their repeated marker identity, the blank paragraph break, attack types, and guaranteed critical hit timing. | English has Crossfire (Daggers) and Talon Strikes (Faeblades), each inside `{*1...}`. Korean retains both marker identities, the blank line, weapons, delay, and effects. | Low |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 4300, 4304, 4313, 4319,
  4321, 4325, 4336, 4338, 4340, and 4348 against active Korean and matching
  source rows.
- Same-numbered historical questions for `base` items, including IDs 4312,
  4327, and 4347, remain separate from these `default` entries; no
  cross-resource finding was merged.
- No historical disposition was treated as approval.

## Other Checks

- ID 4340 retains the two-line condition/effect record and `+20%` / `22`
  values.
- ID 4348 retains both `{*1...}` markers and the blank line between abilities.
- IDs 4300-4349 map to the same active `default` IDs; no CSV structure changed.

## Batch Status

IDs 4300-4349 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits by
themselves. Historical questions for IDs 4304 and 4313 were also carried
forward. The working dispositions and two accepted edits are recorded in
[`disposition-batch-default-04300-04349-20261009.md`](disposition-batch-default-04300-04349-20261009.md).
