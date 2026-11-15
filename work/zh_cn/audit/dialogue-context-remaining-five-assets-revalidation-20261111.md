# Five Remaining Asset Revalidations

- Date: 2026-11-11.
- Scope: all 214 previously unrecorded `default` IDs linked to five assets:
  43, 43, 44, 42, and 42 IDs respectively.
- English anchors meaning; Japanese is the primary style/register reference;
  Chinese supports the comparison.
- Eight correction-candidate IDs and one evidence-limited hold are recorded.
  No translation CSV or extracted game asset was changed.

## Grouping Evidence and Limits

`1308608.quest_bxml` has no explicit `QUEST_ID` or `NPC_` symbol. Its 15
serialized dialogue handlers use the `SQ09` prefix. Its keys concern the
Connovar bounty, Corporal Ivar, and the Kandrian Guard. This is an asset-level
quest clue, not a per-key speaker, handler, branch, or playback-order map.

`1568849.quest_bxml` has no explicit `QUEST_ID` or `NPC_` symbol. Its 12
serialized dialogue handlers use the `SQ138` prefix. Its keys concern
Witchknight Anira, Master Farraglen, and the rare Prismere gem. The prefix
does not establish which character speaks any key.

`1431131.quest_bxml` has no explicit `QUEST_ID` or `NPC_` symbol. Its 14
serialized dialogue handlers use the `SQ68` prefix. Its keys concern
Liordran, Alleia, Rahnil, and the Cycle. They do not map keys to a specific
speaker or turn.

`527393.quest_bxml` has no explicit `QUEST_ID` or `NPC_` symbol. Its 14
serialized dialogue handlers use the `SQ21` prefix. Its keys concern
surveyor Stellan Reitan, his journal, and Horace Despero. The handler prefix
is not proof of per-key dialogue ownership or order.

`710522.quest_bxml` has no explicit `QUEST_ID` or `NPC_` symbol. Its 17
serialized dialogue handlers use the `FFQ15` prefix. Its keys concern scholar
Odwald Bynothas, historical notes, the Godstorm, and the Withering War. The
prefix does not map keys to speakers, branches, or playback positions.

All 214 rows were compared in English, Japanese, Chinese, and active Korean.
The 14 exact-English repeat groups within this set already have matching
Korean translations. No embedded line breaks, runtime placeholders, or
markup occur in the set. Dialogue-like lines, quest titles, objectives,
journal entries, and status text were judged by text type; asset membership
was not treated as proof of a common speaker or conversational stage.

## Correction Candidates

| ID(s) | Asset / dimension | Finding and proposed direction | Confidence |
| --- | --- | --- | --- |
| `10978` | `1568849` / format | `Child of Dust` is used as a capitalized epithet and appears with an English pairing in several other active rows. Consider `먼지의 자식(Child of Dust)이여` here. This is a local pairing candidate, not a claim that every use of the epithet is consistently paired. | Medium |
| `5225` | `710522` / naturalness | `어쩐 일로 이런 예우를 받는지요?` makes the visitor's courtesy sound like deference paid to the speaker. English asks what occasion brings the visitor, and Japanese reduces it to asking the visitor's business. Consider `이렇게 찾아와 주시다니, 무슨 일로 오셨는지요?` | Medium-high |
| `47905` | `1568849` / meaning and naturalness | `나처럼 재능 있고 제대로 훈련받은 사람만 이걸 만들어 줄 수 있지` reads as a general class of talented and trained people. Preserve the boast that the speaker alone has the talent and training, e.g. `이건 특별한 보석이야. 나처럼 재능 있는 데다 제대로 훈련까지 받은 사람만 만들어 줄 수 있지.` | High |
| `60998` | `1308608` / meaning | `slaving` is rendered as `노예 사냥`, narrowing the activity to hunting people. Japanese explicitly says slave trading and Chinese says enslavement. Consider `노예 매매` or `노예 거래` in this account of Connovar's crimes. | High |
| `17749`, `22719`, `32802`, `43609` | `527393` / name consistency | The same related character `Horace` is rendered `호레이스` at `17749`, `22719`, `32802`, and `43609`, while the other active occurrences use `호러스`. Consider aligning these four to `호러스(Horace)`; retain the full-name form `호러스 데스페로(Horace Despero)` where the source gives it. The exact-English duplicate pair `17749` / `22719` is already text-identical. | High |

## Evidence-Limited Hold

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `19292` | Meaning | English `That's water under the bow` idiomatically suggests a past matter, which the Korean reflects. Japanese instead says the prospect is slim; Chinese is literal. The language sources disagree on the intended reading, so retain the current Korean pending stronger context. |

## Retained Text

The other 205 IDs were retained after four-language comparison. In
particular, ID `36326` now naturally says that the speaker works for an eastern
mining company and recorded the gathered data in the journal. The previously
requested revision was rechecked against English, Japanese, and Chinese.

Exact-English duplicate groups and their matching Korean were checked by ID:
`597`/`3021`; `5621`/`38777`; `10862`/`54878`; `11224`/`16844`/`39375`/
`45037`/`64149`; `18192`/`20175`; `20350`/`39092`; `23546`/`25620`/
`37391`/`52429`/`56673`; `43968`/`56172`; `10665`/`24449`; `17749`/
`22719`; `26489`/`5427`/`41086`; `54499`/`56119`; `54994`/`56656`; and
`55045`/`56708`. No translation normalization was needed for these groups.

The bounded corpus search for `Horace` found the four inconsistent spellings
listed above in this batch; the other active occurrences use `호러스`. The
search does not authorize changes outside the reviewed IDs.

## Complete Newly Reviewed ID Sets

- `1308608.quest_bxml` (`SQ09` handler-prefix clue; 43 IDs): `2122`, `4019`,
  `5621`, `6205`, `7201`, `10862`, `12820`, `14567`, `16254`, `16372`,
  `16844`, `18154`, `20712`, `22413`, `24653`, `24972`, `25491`, `25620`,
  `27026`, `27779`, `29133`, `30575`, `36942`, `38655`, `38777`, `38784`,
  `43863`, `43968`, `47645`, `50465`, `50677`, `50845`, `51596`, `51740`,
  `52244`, `52308`, `52495`, `56172`, `58660`, `60311`, `60998`, `61220`,
  `61431`.
- `1568849.quest_bxml` (`SQ138` handler-prefix clue; 43 IDs): `1546`,
  `1767`, `4468`, `4474`, `6052`, `8288`, `10081`, `10978`, `11013`,
  `11862`, `13729`, `16696`, `17632`, `18192`, `20175`, `22228`, `23123`,
  `23546`, `24304`, `29150`, `29816`, `31566`, `35210`, `36619`, `39375`,
  `40656`, `46269`, `47905`, `50440`, `52158`, `52381`, `53801`, `54499`,
  `54756`, `54994`, `56119`, `56656`, `56849`, `58020`, `59483`, `60616`,
  `63183`, `64510`.
- `1431131.quest_bxml` (`SQ68` handler-prefix clue; 44 IDs): `1744`, `2856`,
  `4362`, `4664`, `4828`, `6757`, `6983`, `7170`, `7882`, `9288`, `9668`,
  `13056`, `13484`, `15024`, `17044`, `19757`, `22097`, `26489`, `26539`,
  `26609`, `31153`, `31770`, `32529`, `32619`, `33666`, `33845`, `36130`,
  `37391`, `38458`, `41115`, `41526`, `42037`, `45037`, `46793`, `48340`,
  `48925`, `50644`, `54278`, `54639`, `54878`, `55007`, `56783`, `61900`,
  `64798`.
- `527393.quest_bxml` (`SQ21` handler-prefix clue; 42 IDs): `625`, `865`,
  `1921`, `2080`, `3063`, `4283`, `5214`, `6709`, `6768`, `7385`, `10665`,
  `11593`, `11594`, `16474`, `17749`, `19292`, `19614`, `20350`, `21582`,
  `22719`, `23502`, `24449`, `32802`, `34610`, `34739`, `36326`, `39092`,
  `41086`, `41100`, `42631`, `43609`, `43755`, `43777`, `46001`, `48804`,
  `51670`, `54548`, `56673`, `57059`, `61301`, `64149`.
- `710522.quest_bxml` (`FFQ15` handler-prefix clue; 42 IDs): `597`, `1612`,
  `2319`, `3021`, `4005`, `5225`, `5427`, `6378`, `7056`, `8541`, `11224`,
  `13918`, `16113`, `16395`, `19390`, `21923`, `21955`, `23598`, `23953`,
  `30597`, `31663`, `34582`, `40453`, `43130`, `43613`, `43916`, `47094`,
  `47852`, `48427`, `49952`, `50060`, `52429`, `55045`, `55428`, `56384`,
  `56708`, `57678`, `60476`, `61896`, `63892`, `64704`, `64907`.

All 214 newly reviewed IDs have four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
