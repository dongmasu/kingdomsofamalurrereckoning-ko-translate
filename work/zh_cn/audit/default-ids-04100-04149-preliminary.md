# Preliminary Language Scan: `default` IDs 4100-4149

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 4100-4149.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled historical questions by resource type and checked dialogue
  voice, idioms, titles, named lore, and runtime variables.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 4103 | 맹세의 칼날(Oathblade) 커비(Kirby) | Determine whether `Oathblade` is a weapon/title or Kirby's mercenary rank; align with the identical term at ID 4086. | English/Chinese place Oathblade before the name; Japanese reads it as a rank. Korean retains the weapon/title reading, but the name string itself does not settle the role. | Medium |
| 4106 | 정말 재미있는 헛소리로군! 네가 떠나고 나면 뭘 해야 할지 모르겠어, 전사여. 다시 내기에서 이기기 시작해야겠군. 자, 준비해! | Preserve the playful sarcasm and the joke that the speaker may resume winning bets after the warrior leaves. | English and Japanese make the bet-winning line a joke; Korean captures it, though `정말 재미있는 헛소리` can sound sincere before the sarcastic turn. | Low |
| 4107 | 젊은 견습생과 그를 끔찍이 아끼는 스승, 그리고 혼돈으로 세상을 다시 빚으려 한 신의 이야기지. | Preserve `doting master` as affectionate/indulgent rather than frightening. | English and Chinese say the master dotes on the apprentice; Japanese calls the master indulgent. Korean `끔찍이 아끼는` normally means “dearly,” but can also evoke “terribly,” making the tone slightly ambiguous. | Low |
| 4113 | 아첨과 거짓말을 들이켜는 왕좌 위의 꼭두각시 왕. | Keep the poetic fragment and clarify that the king consumes/feeds on flattery and lies. | English and Japanese use drinking/imbibing imagery; Chinese says enjoying flattery and lies. Korean preserves the image, but `들이켜는` is awkward when the objects are abstract. | Medium |
| 4115 | 거기 서 봐. 어디 좀 보자. 더럽고, 지치고, 외로워 보이는군. 하지만 특별해. 그건 확실하지. 화이트스톤에서 너 같은 사람은 좀처럼 볼 수 없거든. | Preserve the short diagnostic beats and the final positive/uncanny turn. | English uses sentence fragments (“Filthy. Weary. Lonely. But special.”); Japanese/Chinese similarly segment the assessment. Korean retains the sequence, though it adds `보이는군` and smooths the fragments. | Low |
| 4122 | 너 같은 모험가가 필요해. 나와 선원 몇 명이 여기서 남쪽에 있는 새 땅으로 원정을 떠날 참이야. | Preserve that the speaker and a crew are preparing an expedition to a new land south of here. | English, Japanese, and Chinese agree. Korean conveys the plan; `선원 몇 명` adds a crew composition that is contextually implied but not explicitly specified as sailors in the English. | Low |
| 4129 | 포위망은 뚫렸으니 경계를 풀고, 끝이 보인다고 감히 희망할 수 있다면 얼마나 좋을까. 하지만 투아사 왕은 아직도 한참 멀리 있어. 아주 멀리. | Preserve the repeated `leagues` as emphasis and distinguish the siege ending from the distant Tuatha king. | English and Japanese both repeat the distance; Korean keeps the repetition, while `한참 멀리` is less concrete than the source's deliberate measurement idiom. | Low |
| 4130 | 이제 마무리해야 할 일이 남았어. 특히 아르진(Argine)을 따라가다 얕은 무덤에 묻힐 뻔한 그 바보들 말이야... | Retain the incomplete, malformed English clause as uncertain rather than inventing the exact fate of Argine's followers. | English has a grammar error (`what that would've followed`); Japanese paraphrases those who shared Argine's fate, Chinese says they may have followed him to a shallow grave. Korean follows the apparent shallow-grave image but the “nearly buried” wording is inferential. | Medium |
| 4135 | 다음은 숨겨진 길로 이루어진 미로, 어둠의 미로야. 그대가 직접 빠져나갈 길을 찾아야 해. | Confirm whether `Dark Maze` is a proper location and whether `dove` is an endearment that should be retained. | English directly addresses `dove`; Japanese omits it, while Korean substitutes formal `그대`. Korean keeps the location idea but does not establish its title styling. | Medium |
| 4140 | 그 항아리들을 부숴 줘서 고마워. 테스타먼트(Testament)가 그걸로 무슨 짓을 했을지 누가 알겠어. | Keep `Testament` consistent with the unresolved Testament/Belen Covenant naming conflict. | English/Japanese identify the Testament; Chinese uses Belen Covenant. Korean follows English and preserves uncertainty rather than silently changing the faction name. | Medium |
| 4145 | 운명의 베틀에 엮인 네 실이 보여. 네가 누구인지, 뭘 해 왔는지, 어떤 길을 걷게 될지... | Preserve the “thread in the weave of fate” metaphor consistently with other Tapestry/weave lines. | English and Japanese explicitly refer to fate; Chinese uses a thread of time. Korean says `운명의 베틀` and retains the fate sense, unlike the related preliminary line at 4177, which shifts to time. Reconcile the repeated metaphor project-wide. | Medium |
| 4146 | 크라운홀드에서 라스크(Rask)와 함께 일했다고 들었어. 좀 자기희생을 마다 않는 녀석이지만, 그래도 훌륭한 감시관이지. | Preserve the idiomatic sense of `a bit of a martyr` as self-sacrificing and confirm `Warden` as a formal rank. | English uses an idiom; Japanese says self-sacrificing and Chinese literally says martyr. Korean chooses the idiomatic trait and retains the unresolved `감시관` title. | Medium |
| 4149 | 마법의 궁정(Court of Enchantments)에 있는 형제, 패러라(Farrara) 경을 도우러 왔네. 이제 그의 ‘피투성이 뼈의 발라드(Ballad of Bloody Bones)’를 들을 시간이야. | Standardize `Court of Enchantments`, Farrara, and `Telling`/the Ballad of Bloody Bones as formal lore/performance terms. | English says the speaker is a brother in the Court and that it is time for Farrara's telling of the Ballad; Japanese/Chinese use divergent Court/title terms. Korean renders it as listening to the ballad, a plausible but potentially narrower event. | Medium |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 4103, 4109, 4127, 4130,
  4135, 4140-4141, 4145-4146, and 4149 against active Korean and matching
  source rows.
- Same-numbered historical questions for `base` items, including IDs 4105,
  4110-4112, 4114, 4116, 4119-4120, 4122, 4124, 4127, 4132, 4135-4137,
  4143, remain separate from these `default` rows; no cross-resource finding
  was merged.
- No historical disposition was treated as approval.

## Other Checks

- ID 4134 preserves `$NQD_City_Adessa.investment_amount$` and its position.
- ID 4141 preserves `{*1...}` and the source line break.
- IDs 4100-4149 map to the same active `default` IDs; no CSV structure changed.

## Batch Status

IDs 4100-4149 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
