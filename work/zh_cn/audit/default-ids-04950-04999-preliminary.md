# Preliminary Language Scan: `default` IDs 4950-4999

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 4950-4999.
- Compared matching English, Japanese, and Chinese rows with active Korean;
  reconciled historical `default` questions and checked meaning, markup,
  titles, names, and item terminology.
- Read-only; no translation CSV was edited.
- This is preliminary work, not an independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 4954 | {1} 필요 조건: {LINE_BULLET_INDENT} {*6{2} {3}} {LINE_BULLET_INDENT} {*6{4} {5}} {LINE_BULLET_INDENT} {*6{6} {7}} | Preserve all nested numeric placeholders, markup, bullet indentation, and spacing. | English, Japanese, Chinese, and Korean use the same nested token sequence. The surrounding UI determines what each requirement value means; do not translate or rearrange the placeholders. | High |
| 4958 | 전쟁군주 엑스페리오라티(Warlord Experiorati) | Determine whether `Experiorati` is a proper name, rank, or source-data artifact. | English presents a two-part title/name; Japanese reduces it and Chinese keeps only “warlord.” Korean transliterates the full string, but the proper boundary and role remain unknown. | Medium |
| 4961 | 컵의 왕 이리온(Irion) | Confirm whether `King of Cups` is a formal epithet, title, or tarot/card reference. | English/Japanese/Chinese all use a cups-king title. Korean retains the phrase and character name but its capitalization/association is unresolved. | Medium |
| 4963 | 이 집단은 다를 거라고 들었는데... 흔한 사기꾼들과는 다를 거라고. | Reassess `the usual racket`: it may mean a scam, disreputable operation, or racket rather than scammers as people. | English and Japanese refer to a usual racket/organization; Chinese is broader. Korean's `사기꾼들` changes the object from an operation/group to people, a plausible but narrower reading. | Medium |
| 4980 | 사람들은 세 바람 협곡의 재앙(Bane of Three Winds Crutch)이 죽었다고들 하지만, 그런 짐승은 쉽게 죽지 않아. 돌아올 거야. | Resolve the name boundaries in `Bane of Three Winds Crutch`. | English/Japanese/Chinese differ on whether Three Winds Crutch is a place or part of the creature's epithet. Korean uses `세 바람 협곡의 재앙`, a place-plus-bane reading that remains provisional. | High |
| 4982 | {1} {2}, {3}초 동안 {5} | Confirm how `over {3} seconds` relates to the effect and preserve each placeholder exactly. | English is an isolated formatted effect line; Korean expresses a duration. The numeric placeholders and order match all references, but the missing surrounding mechanic prevents a full grammatical interpretation. | Medium |
| 4983 | 리비아 페넌(Livia Fenan)의 자백은 수많은 수수께끼와 기만으로 이어지는 실마리를 열어 주었다. 파흘랑기(Fahrlangi) 마법사들은 매드 허스트(Mad Harst)라는 자의 밑에서 일하며 물건을 훔쳤다. 고대 워스원 금고에서 시분의 심장(Heart of Sibun)을 훔친 것도 그들이었다. 하지만 허스트는 다시 베신 경(Lord Besin)이라는 다른 자의 밑에서 일하고 있었다. 허스트는 베신이 이먼의 섬(Eamonn's Isle)으로 배를 타고 떠났다고 주장했고, 그윈 앤위(Gwyn Anwy)는 그곳까지 쫓아갈 작정인 듯하다. | Reconcile the named groups/places and preserve the chain of authority in the theft account. | English/Japanese/Chinese agree that Fahrlangi mages worked for Harst, who in turn worked for Besin; Harst says Besin sailed to Eamonn's Isle. Korean preserves this chain and the uncertainty (`주장했고`), while the many transliterations need a corpus-wide name pass. | Medium |
| 4985 | 그 알파르 말이야? 좀... 음흉해 보여. 그래도 괜찮은 편이지. 이런 놈들과 싸울 때 마법이 유용하다는 건 부정할 수 없고. | Resolve `wormy` from character context instead of fixing a single dictionary sense. | English's insult is ambiguous; Japanese suggests inscrutable/untrustworthy and Chinese reads obsequious. Korean chooses `음흉해`, a plausible suspicious-person reading that remains uncertain. | Medium |
| 4991 | {LINE_LEFT}{*2Ljosalfar-}{LINE_LEFT}북쪽의 얼어붙은 땅에 사는 자랑스럽고 유서 깊은 종족, 료스알브는 바람과 태양과 하늘 아래에서 신성한 권리를 판정할 자격이 자신들에게 있다고 여기며 공평무사한 정의를 실현한다.{LINE_SPACE}{LINE_LEFT}시작 보너스: | Localize the visible `Ljosalfar-` label inside the indexed span and resolve the obscure `divine right` clause; preserve the surrounding layout markers. | Japanese and Chinese localize the race name inside the same markup, while Korean leaves the visible English label untranslated. English's `judge themselves fit to divine right from under wind, sun and sky` is syntactically difficult; Korean's `신성한 권리를 판정할 자격` is one plausible reading. Markers remain in order. | High |
| 4995 | 증서는 어디 있지? | Confirm that `deed` means a legal/property document and whether a more specific term is warranted. | English/Japanese/Chinese indicate a document but do not identify its kind. Korean's `증서` is a broad, supported choice. | Low |

## Historical Audit Reconciliation

- Rechecked historical `default` questions for IDs 4954, 4958, 4961, 4963,
  4980, 4982-4983, 4985, 4991, and 4995 against active Korean and matching
  source rows.
- Same-numbered historical questions for `base` and `affix` remain separate;
  no cross-resource finding was merged.
- No historical disposition was treated as approval.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean.
- Control-marker sequences and explicit line-break counts match the English
  rows in all three references and active Korean.
- No active CSV structure or text was changed.

## Batch Status

IDs 4950-4999 received one preliminary reading against the stated references.
Findings remain candidates/questions only and do not authorize edits.
