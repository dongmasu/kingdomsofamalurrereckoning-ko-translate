# Preliminary Language Scan: `default` IDs 2000-2049

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 2000-2049.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled historical `default` questions and checked dialogue voice,
  names, source alignment, and lineation.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 2003 | 소울딥 패스팅(Souldeep Fasting) | Keep this English-based place-name interpretation provisional until the location is identified. | Historical audit notes that both Japanese and Chinese interpret the phrase as an underground passage, unlike English `Souldeep Fasting`. Korean follows English and preserves the name, but the source conflict remains material. | Medium |
| 2004 | 수정 구체 표면을 먹빛의 검고 잿빛인 폭풍 구름이 휘감는다. 희미한 천둥이 메아리치고 빛줄기가 구름을 비춘다. | Check the image sequence and Korean modifier order for this dense description. | English and Japanese describe arcs of light illuminating the storm clouds; the Korean retains those details but opens with an awkwardly stacked “먹빛의 검고 잿빛인” phrase. | Medium |
| 2005 | 운명의 돌에 손을 얹어. 네가 운명의 태피스트리에서 어디쯤인지 봐 줄게. | Consider a natural Korean equivalent for `fate's weave` rather than the literal loanword `태피스트리`. | English and Japanese use a weaving metaphor; the current Korean preserves it but `운명의 태피스트리` may sound like an unexplained imported object rather than a poetic “weave.” | Medium |
| 2011 | 우리 야영지의 여행자들은 돈을 벌고, 질서를 지키며, 고분고분하지. | Preserve the speaker's self-description but verify whether `profitable` means commercially successful, useful, or profitable to the speaker. | English says the Travelers are `profitable`; Japanese calls them useful. Korean's `돈을 벌고` makes the Travelers themselves earn money and may shift the intended meaning. | Medium |
| 2014 | 더 늦게 나오면 네 엉덩이 가죽이 산 채로 벗겨질 거야. 이 노움들은 두 번 기회를 주지 않아. | Check the threat idiom and register; avoid an overly literal body-part construction if the intended force is simply a warning about being skinned. | English is crude and idiomatic; Japanese omits the explicit “arse” but retains the threat. Korean is forceful, though `엉덩이 가죽` sounds anatomically literal and awkward. | Medium |
| 2024 | 이 물약을 귀에 대면 미세하게 보글거리고 탁탁거리는 소리가 들린다. | Retain the English/Chinese reading provisionally and investigate the unrelated Japanese source before any correction. | The English and Chinese describe subtle fizzing/crackling sounds when held to the ear; Japanese instead describes a potion that increases Primal attack damage. Korean follows English/Chinese, so this is a source alignment conflict, not evidence of a Korean meaning error. | High |
| 2030 | [long anecdote about Artal, Lystrom, and the rooster prophecy] | Review the nested quotation, comic timing, and speaker voice as one passage; preserve all paragraph and line breaks. | This is a historical finding. Korean follows the English anecdote and Chinese, with the same key sequence and prophecy outcome; the text should not be split or normalized line-by-line. | Medium |
| 2033 | ... 고하트(Gorhart) 마을의 관리관 허크 애드월드(Herc Adwold) ... | Confirm whether `Warden` is a formal village office and keep it distinct from generic guards/wardens. | English/Japanese/Chinese all identify Herc as the village Warden. `관리관` is possible, but the office term should be aligned with other occurrences. | Medium |
| 2039 | 학습 곡선 | Determine whether `Learning Curve` is a title/label or the idiom “learning process.” | Japanese reads “still learning,” while English/Chinese retain a title-like noun phrase. Korean's literal `학습 곡선` may sound technical if this is dialogue or a named item. | Medium |
| 2044 | 시데(Sidhe) 안에 숨겨져 있어. | Resolve whether `Sidhe` is a named region, people, or general Fae realm; keep the proper-name decision consistent. | English/Chinese use `Sidhe`; Japanese reads it as “sea.” Korean follows English/Chinese and keeps the English spelling, but the referent is not established by this short response. | Medium |
| 2047 | 여기에 필멸자가? | Make the reaction sound like natural Korean while preserving the surprise at a mortal's presence. | English/Japanese express surprise that a mortal is here. Korean is understandable but the bare locative-question fragment sounds unfinished without intonation/context. | Medium |
| 2049 | 몰락의 전당(Fallen Hall)은 어디 있지? | Keep the English-based location name provisional and verify the intended place. | English/Chinese describe `Fallen Hall`; Japanese instead says “shrine of the dead.” Korean follows English/Chinese and preserves the name, but the source-locale disagreement remains unresolved. | Medium |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 2003, 2009, 2013, 2017,
  2030, 2033, and 2044 against the active Korean and source locales. The
  place-name conflict, official markup terms, stat interpretation, prophecy
  voice, village office, and `Sidhe` referent remain open or provisional.
- ID 2024 was additionally checked for source alignment; Korean agrees with
  English and Chinese, while Japanese contains unrelated potion-effect text.
- Same-numbered historical `base` findings were kept separate from these
  dialogue and quest rows.

## Other Checks

- ID 2009 preserves `Lopoku` and the `{*1 ...}` markup; ID 2030 preserves the
  anecdote's paragraph/line sequence. ID 2013 retains `+1` and the first two
  Finesse tiers.
- The remaining inspected dialogue retains its main meaning; no runtime
  markers, numeric values, or line breaks were changed.

## Batch Status

IDs 2000-2049 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
