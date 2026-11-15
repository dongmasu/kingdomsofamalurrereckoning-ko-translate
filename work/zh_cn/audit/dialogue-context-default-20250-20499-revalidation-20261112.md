# Sequential `default` Revalidation: IDs `20250`-`20499`

- Date: 2026-11-12.
- Compared all 250 active Korean rows with same-ID English, Japanese, and
  Chinese for meaning, naturalness, register, terminology, and format.
- Rechecked 83 existing ledger records and added 167 previously unrecorded
  IDs.
- Retained six existing correction candidates, cleared one existing
  candidate, and recorded 16 new candidate IDs and four evidence-limited
  holds.
- No translation CSV, immutable source, extracted asset, or localization
  binary changed.

## Correction Candidates

These findings are proposals for separate review, not approval to edit the
translation CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `20258` | Meaning / terminology | `Blood Doge` is rendered `피의 지도자 각하`, while the active title form at `54182` is `피의 총독(Blood Doge)`. Related introductions at `20141` and `47675` also differ. Consider using `피의 총독` here; review out-of-range occurrences in their own batches. | High |
| `20265` | Meaning | `Blessed with this armor by Gaea` is translated as Gaea blessing the armor. Japanese says Olley received the armor from Gaea, and Chinese also describes it as Gaea's gift/blessing. Consider `가이아(Gaea)에게서 이 갑옷을 하사받았지만`; retain the later death and inferred disappointment. | High |
| `20273` | Naturalness / register | `이해하리라 믿어` sounds more literary than the conversational English and Japanese `わかってくれるよな`. Consider `이해해 주겠지` while retaining the speaker's hesitation and messy schedule. | Medium-high |
| `20301` | Name pairing | The creature label `Snow Antelope` appears as `눈영양` without English pairing. Consider `눈영양(Snow Antelope)` without inferring a special species beyond the source. | Medium |
| `20339` | Naturalness / UI instruction | `Press Start to Enter` is rendered `시작을 눌러 입장`, which omits the button and reads as a clipped command. Consider `시작 버튼을 눌러 입장하기` or the UI's established concise prompt form. | High |
| `20344` | Name pairing | The title-like label `The Ardent Lover` is translated as `열정적인 연인` without its English title. Consider pairing it as `열정적인 연인(The Ardent Lover)`; do not infer a specific card or book type. | Medium-high |
| `20348` | Name pairing | The named title-and-person label `Captain Mys` is rendered `마이스 선장` without English. Consider `마이스 선장(Captain Mys)`. | High |
| `20359` | Terminology | `Great House` is the established institutional term `대가문`; Korean `유력 가문` differs from that decision. Consider `대가문` while preserving the claim that poisoned gifts have not been a concern for a long time. | High |
| `20376` | Name pairing | Capitalized `The First` is rendered `퍼스트` without English pairing. Consider `퍼스트(The First)` while leaving its exact rank or entity type unspecified. | Medium |
| `20377` | Name pairing | The standalone label `Forstid` is transliterated as `포스티드` without English pairing; English, Japanese, and Chinese retain the source spelling. Consider `포스티드(Forstid)` without assigning a person/place category. | Medium-high |
| `20427` | Name pairing | `Tuatha de Deohn` is only partially paired as `투아사(Tuatha) 데 데온`. Consider pairing the complete source name, e.g. `투아사 데 데온(Tuatha de Deohn)`, without changing the rest of the sentence. | High |
| `20444` | Name pairing | The label names `Irion, King of Cups`; Korean pairs only `이리온(Irion)` and leaves the complete title unpaired. Consider including `King of Cups` in the same English parenthetical, while preserving `컵의 왕`. | Medium-high |
| `20453` | Name pairing | `Capstan Odvar` is rendered `캡스턴 오드바르` without English pairing. Consider `캡스턴 오드바르(Capstan Odvar)`; the row does not establish whether Capstan is a personal name or title. | High |
| `20465` | Name pairing | The named `Lapidus` is rendered without English pairing. Consider `라피두스(Lapidus)`; retain the question about whether the listener has it. | Medium-high |
| `20467` | Objective form | `Escape Allestar Tower` is an action objective but appears as `알레스타 탑(Allestar Tower) 탈출`. Consider the established action form `알레스타 탑(Allestar Tower) 탈출하기`. | High |
| `20491` | Naturalness | `그 야수를 죽일 가능성은 네가 누구보다 높아` is understandable but awkwardly makes the addressee the subject of a probability comparison. Consider `네가 그 야수를 죽일 가능성이 가장 커`, preserving urgency and the speaker's confidence in the addressee. | Medium-high |

## Rechecked Existing Findings

- `20274` remains a candidate: `불길한 징조` adds a portent not stated in
  English or Japanese, and `-로군` shifts abruptly before casual speech.
- `20347` remains a candidate: `입 벌리고 앉아 있을` is a literal,
  unnatural rendering of refusing to sit idle in surprise.
- `20416` remains a candidate: the same champion is called `용사` and then
  `기사`, leaving the story's actor less clear.
- `20428` remains a terminology candidate: `master-at-arms` varies in Korean;
  the wider Gravehal review supports `무기 교관` for this role.
- `20434` remains a candidate: `반갑습니다, 나그네여` mixes polite speech
  with a literary vocative.
- `20473` remains a candidate: the Korean says `발라드의 집 챔피언`,
  while the related hunting-party context identifies Tyr Magnus as the House
  Champion of the House of Valor.
- `20294` is cleared. `Litanies Found` is a compact tracker label, and the
  now-approved `연도문` term makes `연도문 발견` an adequate Korean label;
  no remaining meaning or naturalness error is supported.

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `20268` | Text type / meaning | `Digital Publishing` may be a department, profession, or generic industry label. Japanese leaves it in English and Chinese translates it; the row does not establish whether Korean transliteration or translation is intended. |
| `20310` | Meaning / context | `I'm done hearing requests` can mean ending an audience for requests or refusing to take further requests. Korean follows the latter reading, but the row and asset association alone do not establish the scene function. |
| `20493` | Text type / register | English and Japanese state a no-loitering rule, while Korean is an imperative warning. Both can fit a guard interaction; the row does not establish whether this is a sign, UI rule, or spoken line. |
| `20498` | Meaning | `Aye?` is rendered `응?`, supported by English and Chinese, but Japanese `じゃ` has a different sense. Preserve the Korean provisionally rather than guessing which locale is anomalous. |

## Duplicate And Structural Checks

- All four language tables contain the 250 IDs in the same order. The range
  touches 56 exact-English duplicate groups (1,182 corpus rows); Korean is
  identical within each group.
- Japanese variations in `Yes?`, `Bye.`, `See you.`, `Very well. Let's see
  what the dice show.`, `Lower, you say?`, `Now you've done it!`,
  `Greetings, Champion.`, `Fight with me.`, and `Your best hunting ground...`
  were checked. They do not establish speaker identity or playback order.
- The translated `What kind of shield?`, the Adessa/Delvers labels, and the
  named `Irion, King of Cups` were compared with their language variants;
  no Korean wording was forced to match English alone where Japanese or
  Chinese supplied a meaningful distinction.
- Logical line-break counts and detected runtime/localized-wrapper token
  sequences match across all four languages for all 250 rows. The poem at
  `20365` retains its three logical lines; the structured instruction at
  `20405` retains its placeholders and indentation marker.
- Asset associations and serialized order were not used to assign speakers
  or playback order.

The ledger now contains 32,147 of 65,135 IDs, leaving 32,988. The next
sequential range is `20500`-`20749`.
