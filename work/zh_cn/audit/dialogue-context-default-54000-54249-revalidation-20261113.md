# Sequential `default` Revalidation: IDs `54000`-`54249`

- Date: 2026-11-13.
- Compared all 250 active Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 47 existing ledger fingerprints; all match. Preserved those
  rows and appended the other 203 IDs in ascending order.
- Recorded nine current correction candidates: three rechecked from prior
  findings and six newly identified. Rechecked one existing evidence-limited
  register hold and recorded five new evidence-limited holds.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Current Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `54074` | Terminology / naturalness | `arcane` is rendered `신비학적인`, while the same magical field is rendered `비전` in related Arena lines (`14548`, `30431`, `42841`). Consider `비전술 면에서 넌 뭔가 특별해.` | High |
| `54076` | Meaning / consistency | The first sentence repeats at `7589`, `15148`, `19510`, `21922`, `64167`, and `64664`, with differing Korean wording. Align the shared sentence to `클라우드크레스트 산(Cloudcrest Mountain) 정상에서 니스카루(Niskaru) 군주 카마잔두(Khamazandu)는 이 세상에서 자신의 도구가 되어 준다면 선물을 주겠다고 제안했다.` Preserve the following, ID-specific sentence. | High |
| `54081` | Terminology consistency | The generic `Arena` is `투기장` in 215 matching English/Korean rows and `결투장` only here. Japanese `闘技場` and Chinese `竞技场` support the arena sense. Consider `흥분과 용맹한 활약이 펼쳐지는 투기장을 싫어할 이유가 어디 있겠어?` | Medium-high |
| `54132` | Meaning / speech level / naturalness | The self-introduction ends its first fragment in polite `-요` but continues in casual speech. Also, English says the Motus Mining friends told Bor they were helping the player open a site; Korean instead says they contacted Bor asking him to help. Consider `건축 장인 보르 안자르야. 모투스 광업(Motus Mining)의 자네 친구들이 이곳에 광산을 여는 일을 돕고 있다고 연락해 왔어.` | High |
| `54177` | Idiom / naturalness | `For Fate's sake` is an exasperated plea, supported by Japanese `頼む` and Chinese `看在老天的份上`; Korean `운명을 봐서라도` reads literally and awkwardly. Consider `제발 서둘러!` for the closing plea. | High |
| `54181` | Meaning | `you were here last` means the addressee was here previously, as Japanese `前はここにいたんだから` confirms. Korean instead says the addressee was the last person here. Consider `나보다 네가 더 잘 알겠지. 전에 여기에 와 봤으니까.` | High |
| `54189` | Naturalness / meaning | `The good doctor's responsible for more of these bodies than you might think` is awkward as `시신을 ... 만들어 냈어`. English and Japanese support the doctor having caused more deaths; Chinese can also be read as handling bodies, so retain that source difference. Consider `그 훌륭한 의사가 생각보다 많은 사람을 죽게 했어.` | Medium |
| `54208` | Speech level / naturalness | `받았노라` is markedly archaic beside the English address to “my children” and Japanese polite `幸せ者です`. Consider keeping the reverent address while using a natural spoken ending, e.g. `진실로, 자녀들이여, 우리는 리리아(Lyria)의 사랑과 축복을 받고 있어요.` No individual speaker is inferred from the multi-NPC asset. | Medium |
| `54226` | Speech level / naturalness | `하겠네` shifts to an older-sounding register within an otherwise casual utterance; Japanese uses plain conversational wording. Consider `해야 한다면 하겠어. 하지만 이제 이 노래에서 내 역할은 없는 것 같아. 우린 이미 익숙한 범위를 한참 벗어났어.` | Medium-high |

The three previously recorded findings at `54074`, `54076`, and `54177`
remain supported after comparison with the current four-language rows and
their earlier context reports. The other six candidates were identified in
this sequential pass.

## Evidence-Limited Holds

| ID | Dimension | Evidence and disposition |
| ---: | --- | --- |
| `54031` | Speech level / speaker | Rechecked the existing U03 hold. The Korean is casual while Japanese is polite, but the asset does not map this key to an individual speaker or dialogue stage. Retain the existing hold. |
| `54040` | Terminology | `Chausses` is a specialized leg garment. Japanese transliterates the term, Chinese uses a trouser-like term, and Korean uses `차우스(Chausses)`. Keep separate from the approved `Leggings = 레깅스` decision; the term remains unresolved in the existing equipment reviews. |
| `54058` | Meaning / terminology | The one-word label `Clouded` has incompatible readings across the locales: Japanese suggests a lower grade, Chinese suggests cloudy, and Korean says `혼미`. Without item/UI context, do not choose a sense. |
| `54116` | Meaning / terminology | `Handler` is rendered as auctioneer in Japanese, organizer in Chinese, and manager in Korean. The standalone label provides no context to choose among these roles. |
| `54143` | Speech level / referent | The line's capitalized collective `Our` and the shift to casual Korean may reflect a particular narrator or group voice. The linked asset has no NPC symbol or per-key speaker mapping; do not infer a voice or rewrite it without context. |
| `54214` | Meaning / naturalness | The source is fragmentary (`Caged. Murderous!`), and the locales differ on whether the ending describes cruelty or a murderous threat. Retain the Korean fragments pending context rather than supplying an unstated subject or event. |

## Rechecked Findings and Structure

- Sixty exact-English duplicate groups across the corpus touch this range,
  covering 1,359 target rows. Korean wording matches within all but the
  `22820` / `27084` / `32613` / `54185` / `58537` group for `What do you
  mean?`; the Korean distinction at `32613` follows its distinct Japanese
  wording.
- Six rows contain embedded line breaks: `54002` (3), `54015` (8), `54026`
  (7), `54048` (7), `54054` (8), and `54160` (2). Break counts total
  35/39/36/35 across English/Japanese/Chinese/Korean. The additional
  Japanese and Chinese breaks at `54015` are source-layout differences;
  Korean matches English and retains CRLF separators.
- Runtime/display tokens occur at `54075`, `54087`, `54090`, and `54142`.
  Token identity and values are preserved. At `54075`, Japanese and Chinese
  place the active-quest wrapper after `{1}`, while English and Korean place
  it before; at `54142`, Japanese reverses `{1}` and `{2}`, while English,
  Chinese, and Korean agree.
- At `54168`, Japanese says the speaker would rather not know, while English
  and Chinese say the speaker does know. Korean follows English and Chinese;
  no Korean change is proposed.
- Of 250 IDs, 192 have indexed asset associations, represented by 196 links
  across 120 assets; 58 have no indexed asset. Of the 203 newly recorded
  IDs, 145 are linked through 149 links across 79 assets, and 58 have no
  indexed asset. Asset links do not establish per-key speakers or playback
  order.

## Range Result

- The range has nine current correction-candidate IDs and five new
  evidence-limited holds; `54031` is one existing hold rechecked and
  retained. The other 192 newly recorded IDs have no current finding.
- After adding 203 IDs, the ledger covers 57,105 of 65,135 unique `default`
  IDs (87.66%), leaving 8,030. Sequential coverage reaches `54249`; the next
  range is `54250`-`54499`.
- The regenerated ID catalog counts 45,394 of the reviewed IDs as asset-linked
  and 11,711 as unlinked. This corrects a one-ID overcount in the preceding
  checkpoint: its 56,902 reviewed IDs were 45,249 linked and 11,653 unlinked,
  rather than the previously reported 45,250 and 11,652.
- Findings remain proposals requiring separate approval. Existing ledger
  rows were preserved; no translation CSV was changed.
