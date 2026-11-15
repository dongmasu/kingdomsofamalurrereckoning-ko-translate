# Sequential `default` Revalidation: IDs `40000`-`40249`

- Date: 2026-11-12.
- Scope: compare all 250 current rows across English, Japanese, Chinese, and
  active Korean. English anchors meaning; Japanese is the primary reference
  for voice, register, and layout; Chinese supports the comparison.
- Rechecked 69 existing ledger records and reviewed 181 previously unrecorded
  IDs. Findings are proposals, not authorization to edit translation CSVs.
- The range has 19 correction-candidate IDs and five evidence-limited holds;
  ID `40052` has both a name-format candidate and a separate location hold.
  The other 227 IDs have no new finding.
- Asset links remain grouping clues, not proof of a specific speaker or
  dialogue order. Unsupported speaker and order values remain unknown.
- No translation CSV, immutable source CSV, or extracted game asset was
  changed.

## Correction Candidates

These are ID-scoped review proposals, not approval to edit the translation
CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `40002` | Meaning / naturalness | `Just wait till I show her` refers to proving the speaker's sister wrong after finding the dolls. The Korean can sound like a challenge. Recast it as the speaker's resolve to show her what was found. | High |
| `40009` | Naturalness | The literal `그게 거기 있다는 건 확실하고, 멀지도 않아` is stiff. Keep the referent unknown and express that the voices establish it is nearby, e.g. `목소리가 들렸으니, 틀림없이 가까이 있어.` | Medium-high |
| `40034` | Name / item consistency | The named ring `Maisie's Luck` appears as `메이시의 행운`, while related quest references use `메이지의 행운`. Align the spelling and pair the full item name, e.g. `메이지의 행운(Maisie's Luck)`. | High |
| `40041` | Name format | `Hama Pot-Helm` is unpaired, and `Fortenmar` is also missing its English form while only `Jottun` is paired. Add the English forms for both names, consistent with `포르텐마르(Fortenmar)` elsewhere. | High |
| `40052` | Name format | `Nil Kern` appears as `닐 케른` without English, unlike the established `닐 컨(Nil Kern)`. Align the spelling and pair the name. The distinct location ambiguity remains on hold below. | High |
| `40074` | Terminology | `cremate` is rendered as the broader `불태워`. Use the established, more precise `화장해` while retaining the sentence structure. | High |
| `40095` | Name format | The named Witch Knight `Malwyn` is not paired with English, although the other named people and places in this journal entry are. Add `말윈(Malwyn)` without changing the surrounding account. | High |
| `40100` | Speech level / consistency | The utterance shifts from `그렇다네` to `바라던 결과였어`. Keep the clauses in one register; do not assign a speaker from the asset association. | Medium |
| `40105` | Terminology / consistency | `Master's Tallow` has several competing renderings in the corpus. The earlier review established `장인의 동물성 지방`; consider `장인의 동물성 지방(Master's Tallow)` here. | High |
| `40127` | Meaning / naturalness | `창고는 건물 날개 중 한쪽에 있어` is awkward, and `안쪽 자물쇠` does not express `down there`. Recast the location and say to pick locks below until the old ledger is found, retaining the casual register. | High |
| `40149` | Meaning | `If we are crushed before we can escape` becomes `탈출하기도 전에 우리가 무너지면`, which says the group collapses rather than is crushed. Preserve the danger of being crushed without adding an unsupported outcome. | High |
| `40176` | Name format | The source-local names `Sativa` and `Molly` are both unpaired. Add `사티바(Sativa)` and pair both mentions of `몰리(Molly)`; do not expand `Sativa` into a distinct plant or fiber label. | High |
| `40179` | Name / spell format | `Circle of Holding` is the capitalized name of a spell, but the Korean `구속의 원 주문` omits the English name. Pair the named spell, e.g. `구속의 원(Circle of Holding) 주문`. | Medium-high |
| `40204` | Meaning / naturalness | In this choice, `Never mind, I need more time` is rendered `신경 쓰지 마. 시간이 더 필요해`, which sounds like telling someone not to worry. Japanese supports declining for now; consider `됐어. 시간이 더 필요해.` | High |
| `40213` | Name format | `Hanrik` is named but unpaired in this journal entry; other references use `한릭(Hanrik)`. Add the source-local pairing. | High |
| `40215` | Name / consistency | `Gryamar` appears as `그리야마르` here, while `그리아마르(Gryamar)` is established elsewhere. Align the spelling and pair the name. | High |
| `40231` | Name consistency / English pairing | `Froma` and `Nag` are unpaired, and the established forms are `프로마(Froma)` and `나그(Nag)`. Align both short-name references; retain the already reviewed `안레드 앰패스트(Anred Amfast)` consistency finding. | High |
| `40237` | Meaning | English and Japanese say `lecture` / `講義`; Korean `설교` means a sermon. Use a lecture/talk reading while retaining the dry, teasing question. | High |
| `40246` | Name / title format | `Cydan the Outcast` is rendered `추방자 사이단(Cydan)`, leaving the epithet unpaired. Include the full epithet in the English pairing; keep the separate `prince in exile` information. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `40025` | Meaning | `Scion` can mean a descendant or an heir/successor. Japanese supports the descendant sense, but the line alone does not settle the intended lineage nuance; retain the existing hold. |
| `40051` | Meaning | English `evil`, Japanese `災厄` (“calamity”), and Chinese `作的恶` do not identify the same precise event or concept. Keep the current wording provisional rather than choosing a more specific reading. |
| `40052` | Meaning / location | English places Adar `behind the jail`, while Japanese and Chinese place him in the jail. Korean follows English. Do not resolve this spatial difference without map or scene evidence. This is separate from the name-format candidate above. |
| `40089` | Terminology / referent | `Pledgeshield` is rendered `서약방패병`, Japanese says `二等傭兵` (“second-rank mercenary”), and Chinese says `誓言之盾` (“shield of the oath”). The row does not establish whether this is a rank, title, or descriptive name; retain it pending context. |
| `40132` | Meaning / source conflict | English `Mine` is ambiguous; Japanese `地雷` means a land mine, while Chinese `矿井` means a mine. Korean `지뢰` follows Japanese, but the isolated label does not resolve the source conflict. Keep distinct from `광산` at ID `4710`; do not force identical Korean wording. |

## Rechecked Context And Structure

- Nine existing correction candidates were rechecked against the current
  four-language text and retained. The three previous uncertain records were
  also rechecked; `40052` additionally has the name-format candidate above.
- Fifty-seven exact-English duplicate groups (1,133 corpus rows) touch this
  range. Korean matches within 56 groups. The only differing group is
  `Mine` (`4710` / `40132`); Japanese distinguishes `鉱山` from `地雷`, so
  the Korean `광산` / `지뢰` distinction is supported.
- The four multiline rows (`40039`, `40101`, `40183`, and `40219`) have
  matching line-break counts across all four locales. The Korean CSV stores
  its embedded breaks as CRLF.
- Runtime tokens and markup are preserved. At `40191`, Japanese reverses
  `{1}` and `{2}` relative to English, Chinese, and Korean; the active Korean
  order matches English and Chinese, so no token-order edit is proposed.
- The range has indexed asset links for 193 IDs and no indexed match for 57;
  three IDs link to multiple assets. None of these associations establishes
  per-key speaker identity or playback order.
- ID `40150` retains `송장 목록`: the line specifically describes invoices
  for delivered goods. The separate `송장` / `청구서` terminology question
  remains context-dependent; no blanket normalization is proposed.

## Range Result

- Rechecked 69 existing ledger records and added 181 new records. Of the new
  records, 124 have indexed asset links and 57 do not.
- The ledger covers 46,804 of 65,135 unique `default` IDs (71.86%), leaving
  18,331. Sequential coverage reaches `40249`; next is `40250`-`40499`.
- Four-language fingerprints and generated catalogs are checked after the
  ledger update. Translation CSVs remain unchanged.
