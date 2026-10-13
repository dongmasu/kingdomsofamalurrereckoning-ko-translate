# Preliminary Language Scan: `default` IDs 0-99

- Review date: 2026-10-07
- Active resource: `work/zh_cn/locatexts_zh_cn.koalocatext_default.csv`
- Meaning authority: matching `en_us` rows.
- Voice/register reference: matching `ja_jp` rows.
- Supporting meaning check: matching `zh_cn` rows.
- Scope: read-only first pass over all 100 active rows, including reconciliation
  of the historical IDs 0-49 and 50-99 reports.
- No translation CSV was edited.

## Preliminary Findings

| ID | Current Korean | Candidate wording / question | Evidence and rationale | Confidence | Preliminary status |
| ---: | --- | --- | --- | --- | --- |
| 4 | 다시 만나 반가워요. 지도 조각을 더 찾으면 꼭 따로 챙겨 둘게요. | 다시 만나서 반가워. 지도 조각을 더 찾으면 꼭 따로 챙겨 둘게. | Japanese `また会ったわね。また...取っておいてあげるから` uses a familiar, plain register. The Korean switches to polite `-요`; the English does not specify politeness. Check this character's other dialogue before settling the Korean voice. | Medium | Open |
| 10 | 검이 필요해. | 검을 원해. | English `I want a Sword`, Japanese `剣が欲しい`, and Chinese `我想要剑` all express wanting a sword. Korean `필요해` changes desire into necessity. | High | Candidate correction |
| 17 | 안녕하십니까. 저는 알마인(Almain)의 대사 컬더(Kulder)입니다. 이 지역에는 새로 왔지만, 페이(Fae)와 전쟁 문제에는 우리도 깊이 관여하고 있습니다. | Japanese voice is plain and casual (`やあ...大使だ`). Consider a plain Korean introduction, then compare with Kulder's other lines before choosing the exact wording. | Current Korean is markedly more formal than the Japanese voice reference. English identifies him as an ambassador but does not itself require honorific speech. | Medium | Open |
| 36 | 당신에게도 챙겨야 할 일이 있고, 저도 돌봐야 할 일이 있어요. 또 필요한 게 있나요? | 당신은 당신대로 챙길 일이 있고, 나도 돌볼 일이 있어. 또 뭐가 필요해? | Japanese `あなたにはあなたの...あるわ。それ以上何が必要なの？` is direct and plain. Korean uses polite `-요`, which softens the speaker's assertive voice. Confirm against the speaker's surrounding dialogue. | Medium | Open |
| 56 | 너 죽은 거야, 알아들어? 끝장이라고! 배를 갈라 내장을 끄집어내고, 네 내장으로 목을 졸라 죽여 주마! | 너 죽은 거야, 알아들어? 끝장이라고! 배를 갈라 내장을 끄집어내 네 목구멍에 처넣어 질식시켜 주마! | English says the speaker will choke the victim with the victim's own entrails. The current Korean instead says the entrails will be used to strangle the victim. This was already an accepted high-confidence finding in the historical review but was not present in the migrated active CSV. | High | Candidate correction; historical carry-forward |
| 66 | 죄송합니다, 주인님. 그렇지는 않습니다. 저는 대재무관(Grand Bursar)과 도무스 폴리티카(Domus Politica)의 지시로 이 저택에 시종으로 부임한 지 얼마 되지 않았습니다. | Is `Villa` a named property/title here, and should it be retained in Korean rather than generalized to `이 저택`? Reconcile the English `master` and Chinese `大人` with Japanese, which omits the address and uses plain forms. | The current translation may be contextually appropriate, but both the property name and register cues differ among sources. Do not settle from this row alone. | Low | Open |
| 83 | 이걸 가져오느라 고생했겠지만, 결국 파기되는 모습을 지켜봐야 하는군. 그래도 반드시 해야 해. 이해하겠지? | 내게 이걸 가져오느라 고생했는데, 결국 파기되는 걸 지켜봐야 하는군. 그래도 반드시 해야 해. 이해하겠지? | English describes effort already made; Japanese `苦労して届けてくれたが` supports that completed action. Current `고생했겠지만` weakens it to an inference. This was already an accepted high-confidence finding in the historical review but was not present in the migrated active CSV. | High | Candidate correction; historical carry-forward |

## Historical Questions Retained

The prior reports left IDs 1, 29, 32, 45, 46, 65, 89, and 95 uncertain.
Those questions remain open after this rereview:

- ID 1: the role/title `the Maid`; Japanese, English, and Chinese do not align.
- ID 29: `Lyria's Lost` may be a title, relic, or lost property.
- ID 32: `Kollossae` transliteration and developer/test-label context.
- ID 45: the appropriate Korean for `Bonnlach Courtier`.
- ID 46: what entity or place `the Crossing` denotes.
- ID 65: whether `Child of Lyria` is a religious title or literal lineage.
- ID 89: the title/identity `the Maid` and its Korean rendering.
- ID 95: the Korean transliteration of `Hugues`.

## Name-Marking Consistency Notes

The rows do not follow an established rule for `한글(English)`. For example,
ID 11 localizes `Templars` without the English spelling, ID 23 includes
`Tuatha`, and ID 70 translates the named group `The Unbound` without the
English spelling. These are consistency-review candidates, not individually
approved corrections; first establish whether names should be paired in every
string, only on first mention within a string, or only when ambiguous.

## Batch Status

All 100 rows received one preliminary reading against the stated references.
This is not an independent Reviewer disposition and does not approve any
change. All candidates and questions must be revisited in the later
consolidated assessment.
