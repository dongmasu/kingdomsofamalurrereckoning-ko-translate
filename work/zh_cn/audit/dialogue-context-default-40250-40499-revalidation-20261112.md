# Sequential `default` Revalidation: IDs `40250`-`40499`

- Date: 2026-11-12.
- Scope: compared all 250 current rows across English, Japanese, Chinese, and
  active Korean. English anchors meaning; Japanese is the primary reference
  for voice, register, and layout; Chinese is supporting evidence.
- Rechecked 75 existing ledger records and added 175 new records. Findings
  are proposals, not authorization to edit translation CSVs.
- The range has 25 correction-candidate IDs and four evidence-limited holds;
  `40395` and `40473` each have both a candidate and a separate hold. The
  other 223 IDs have no new finding.
- Asset links remain grouping clues, not proof of a specific speaker or
  dialogue order. Unsupported speaker and order values remain unknown.
- No translation CSV, immutable source CSV, or extracted game asset was
  changed.

## Correction Candidates

These are ID-scoped review proposals, not approval to edit the translation
CSV.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `40264` | Speech level / address | The Korean uses `자네` and then an informal command, while Japanese uses `お前` throughout. Use a consistent informal address, e.g. `네 친구이자 동료`. | High |
| `40278` | Name format | `Cranalt` is a named source location, but Korean `크래널트` lacks its English pairing. Add the exact source name without changing the sentence. | High |
| `40282` | Name format | `Serabel` is unpaired while `Arick` and `Lyria` are paired in the same sentence. Add `세라벨(Serabel)`. | High |
| `40291` | Name / place format | The named land `the Painted Orsks` is rendered as `색칠한 오르스크들` without its source form. Pair the complete name and preserve the speaker's joke about not knowing what an orsk is. | High |
| `40293` | Place-name format | `Field of Huber` is a named destination, rendered `휴버 들판` without English. Pair the complete place name. | High |
| `40318` | Naturalness / speech | The first-person introduction reads like a written profile (`수련했으며 ... 밝다 ... 없다`) despite Japanese's conversational phrasing. Recast it conversationally without assigning a speaker from the asset link. | Medium-high |
| `40332` | Meaning / naturalness | The modifier order makes it sound as though the Cradle itself is important “in the Great Cycle.” Japanese clarifies that the Cradle occupies an important place in the Cycle. Recast that relationship explicitly. | High |
| `40340` | Name / title format | `Argine, Queen of Staves` occurs as a complete label; Korean pairs only `Argine`. Pair the full title and name, consistent with the other recorded occurrences. | High |
| `40349` | Naturalness | The literal `조각상을 든 ... 조각상이 맞는 것 같아` is awkward for a statue that “seems right.” Prefer a natural equivalent such as `조각상을 든 엘로단 블러드굿의 동상은 잘 어울리는 것 같아.` | Medium-high |
| `40355` | Meaning / terminology | `travesties` means farces or shams here; Japanese and Chinese support that sense. Korean `만행` instead means atrocities. Reconsider the sentence without strengthening it into a crime or tragedy. | Medium-high |
| `40356` | Name / title format | `Private Ilver` is rendered `일버 일병` without the complete source pairing. Pair the titled name, e.g. `일버 일병(Private Ilver)`. | High |
| `40357` | Name format | `Herus` is named but unpaired. Add `헤루스(Herus)` without changing the offer of help. | High |
| `40370` | Item-title format | Only `Mitharan` is paired in `Flawless Mitharan Mending Lining`; the complete item label is not. Pair the full title rather than just its material/adjectival name. | High |
| `40382` | Name format | `Joanne` is unpaired in the report of her death. Add the source spelling as `조앤(Joanne)`; do not infer a speaker. | High |
| `40384` | Naturalness / consistency | This repeats the sentence at `61804`, but the Korean wording differs. Align both to the supported reading `그윈 안웨이(Gwyn Anwy)는 그곳에서 다시 벼려야 한다고 믿는다.` | High |
| `40387` | Name / group format | `Children of Dust` is the named group and is paired elsewhere, but omitted here. Add `(Children of Dust)` while retaining `먼지의 자손`. | High |
| `40395` | Name format | The source row spells the character `Bridget Malloi`; the Korean name is unpaired. Add the exact local source form, `브리짓 말로이(Bridget Malloi)`, without normalizing other rows. | High |
| `40396` | Meaning | `But you do` says the addressee can control how the tapestry is woven. `하지만 너는 다르지` only says the addressee is different. State the ability explicitly, e.g. `하지만 너는 그럴 수 있지.` | High |
| `40405` | Terminology | This `sigil stone` is `각인석`, while the same asset and other references use `인장석`. Align this occurrence to `인장석`. | High |
| `40418` | Format / naturalness | The English and Korean entry end with a dangling comma, while Japanese and Chinese end it as a complete sentence. Close the Korean sentence after `Sun Camp`; do not invent a third camp or continuation. | Medium-high |
| `40447` | Meaning / naturalness | `I've heard of something that could make them act that aggressively` becomes having heard what the cause is. Preserve that the speaker heard of something capable of making them aggressive. | Medium-high |
| `40473` | Name / title format | The long tale leaves several named entities unpaired, including Dorian, Ballegar, Ransevin, the Maid of the Arne, Dolve Arne, Tala-Rane, and Mitharu. Add source-local pairings while preserving the three-paragraph layout and the already paired names. The separate `Pledged of Shield` meaning remains on hold below. | High |
| `40478` | Speech level / consistency | The Korean shifts among `-거야`, `-이야`, and `-거다` within one warning. Keep the warning in one conversational register, consistent with Japanese. | Medium-high |
| `40490` | Speech level | `그대`, `-겠소`, and `-것이오` are markedly formal, while Japanese is plain and Chinese neutral. Use a consistent conversational rendering; do not assign the line to a particular NPC based only on the multi-NPC asset. | Medium |
| `40498` | Meaning / naturalness | `which I am and then some` emphasizes the speaker's involvement in the black market, not merely expertise. Korean `일가견이 있거든` shifts the punchline toward expertise. Consider a natural line that preserves active involvement without inventing a specific role. | Medium |

The existing candidates at `40264`, `40318`, `40332`, `40340`, `40355`,
`40382`, `40384`, `40387`, `40395`, `40405`, `40418`, `40447`, and `40490`
were checked against current English, Japanese, Chinese, and Korean text and
retained. The other new candidates are recorded above.

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `40255` | Meaning / referent | English `Master Makers`, Japanese `伝説の鍛冶師` (“legendary blacksmiths”), and Chinese `制作大师` do not establish whether this is a group/title or a descriptive label. Korean `명장들` is plausible; do not choose a more specific referent without context. |
| `40352` | Meaning / title | English and Chinese identify `Oathblade`, while Japanese renders `一等傭兵` (“first-rank mercenary”). The isolated label does not resolve whether it is a rank or a named blade; retain `맹세의 칼날` provisionally. |
| `40395` | Name / source conflict | Nearby rows use `Bridgette Malloi`, but this exact English source says `Bridget Malloi`. Keep the local pairing candidate above; do not decide whether the source spelling is an alias or typo, or normalize names globally. |
| `40473` | Meaning / title | `Pledged of Shield` is rendered literally as `방패의 서약`; Japanese says `二等傭兵` (“second-rank mercenary”), while Chinese describes a shield oath. Keep the role/title meaning unresolved rather than treating the literal Korean as confirmed. |

## Repeated Sources And Structure

- Four exact-English duplicate groups (eight range rows) were checked; Korean
  wording matches within every group.
- The six multiline rows (`40252`, `40290`, `40303`, `40327`, `40452`, and
  `40473`) have matching line-break counts across all four languages. The
  Korean CSV stores embedded breaks as CRLF.
- Runtime placeholders and markup are present. At `40303`, Korean, English,
  and Japanese use the same `{1}` through `{7}` order; Chinese places `{7}`
  before `{5}` and `{6}`. No Korean token loss or reordering is proposed.
- The range has indexed asset links for 203 IDs and no indexed match for 47.
  Asset associations do not establish per-key speaker identity or playback
  order.

## Range Result

- Rechecked 75 existing ledger records and added 175 new records; 25 IDs have
  correction-candidate status and four have a separate evidence-limited hold,
  with two IDs represented in both sets. The other 223 IDs have no finding.
- The ledger covers 46,979 of 65,135 unique `default` IDs (72.13%), leaving
  18,156. Sequential coverage reaches `40499`; next is `40500`-`40749`.
- Four-language fingerprints and generated catalogs were validated; nine
  related index tests pass. Translation CSVs remain unchanged.
