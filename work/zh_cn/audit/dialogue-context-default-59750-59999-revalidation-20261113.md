# Sequential `default` Revalidation: IDs `59750`-`59999`

- Date: 2026-11-13.
- Compared all 250 active Korean rows against English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked all 60 pre-existing ledger fingerprints and preserved those rows.
  Appended the remaining 190 IDs in ascending order.
- Ten new-row correction candidates and three new evidence-limited holds are
  recorded. Nine existing candidates were rechecked without rewriting their
  append-only rows. Three additional findings at existing IDs are report-only.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `59753` | Naturalness | The book is the object of the description, so `제본했고 ... 손으로 썼다` makes it sound as if the book bound and wrote itself. Japanese and Chinese describe its binding and handwriting. Consider `제본 솜씨가 뛰어나고, 글씨도 흠잡을 데 없이 깔끔하다.` | High |
| `59765` | Naturalness / number | The Korean says `이것들이` after describing one glowing artifact; English itself shifts from singular `an artifact` to plural `These`, while Chinese is singular and Japanese leaves the subject implicit. Avoid an unsupported plural referent, e.g. `동굴을 빠져나갈 단서가 담겨 있을지도 모른다.` | Medium |
| `59790` | Grammar | `노예상에 살인자라고` has an incorrect particle and coordination. Preserve the speaker's disbelief with `탈리보르 대장이 노예상이자 살인자라고?` | High |
| `59806` | Name / title format | The row names `Templar Jorielle`; the Korean pairs only `Jorielle`, unlike the full combined label used elsewhere. Preserve the current Korean role term and pair the complete name/title as `성전 기사 조리엘(Templar Jorielle)`. | High |
| `59812` | Item-name format | The standalone named item `Votive of Flame` is only `불꽃 봉헌물`. Consider `불꽃 봉헌물(Votive of Flame)`. | Medium |
| `59903` | Meaning / naturalness | `용맹의 집에서 추락한 우리` is an unnatural literal rendering of `the fallen of the House of Valor`. Japanese describes former members and Chinese describes the fallen of the house. Recast the group naturally, for example `용맹의 집(House of Valor)에서 몰락한 이들과 함께`, while retaining the source's uncertain nuance rather than asserting that they were expelled. | Medium-high |
| `59911` | Speech level / naturalness | `찾아오게` and `기다리겠네` impose marked 하게체 on a friendly address. Japanese is conversational and addresses the listener as a friend. Consider `고마워, 친구. 근처에 다시 와서 내 도움이 필요하면 들러. 뭐든 도와줄게.` | High |
| `59926` | Naturalness | `광부들에게 두 교대분의 일을 시켜` is stiff. Japanese explicitly refers to double shifts; consider a more natural rendering such as `광부들을 두 배로 일하게 해 손실을 만회하면 수익을 유지할 수 있다.` Keep the 1:30 ore-to-refuse ratio. | Medium |
| `59965` | Location-name format | This standalone location label is `Shrine of Ethene`, but only `Ethene` is paired. Consider pairing the complete label as `에테네의 성소(Shrine of Ethene)`. | Medium-high |
| `59975` | Naturalness / word order | `라시르 지부 회관의 그의 방` is an awkward possessive sequence. Preserve the intended destination and plural `us`, e.g. `대현자에게 돌아가 우리를 라시르 지부 회관에 있는 그의 방으로 보내 달라고 해야겠다.` | High |

## Rechecked Existing Candidates

| ID | Current finding and disposition |
| ---: | --- |
| `59795` | The naturalness candidate remains supported: `결승선을 통과하게 몬 영양` is awkward. A natural action such as `결승선까지 몰고 간 영양` preserves the herd-and-reward condition. |
| `59823` | The title-format candidate remains supported. The exact label is `Irion, King of Cups`; Korean pairs only `Irion`. Use the established full title form `컵의 왕(King of Cups) 이리온(Irion)`. |
| `59843` | The local terminology candidate remains supported: `Quarters` varies between `병동 구역` and `숙소 구역` in this quest, while related entries use `병원 구역`. Preserve this as a scoped consistency proposal, not a global alias decision. |
| `59868` | The naturalness candidate remains supported. `그건` treats the escaped person as an inanimate thing; use a person-referential form suited to the line. |
| `59891` | The organization-name candidate remains supported: standardize `Order of Mitharu` as `미사루 교단(Order of Mitharu)`, consistent with the related quest entries. |
| `59925` | The handbook terminology candidate remains supported. Related entries name the same Motus Mining handbook inconsistently; use the proposed `지점 업무 안내서` form where the referent is that item. |
| `59928` | The terminology / pairing candidate remains supported: this plural reference is `Sprites`, so pair it as `스프라이트(Sprites)` without applying it to generic fairies. |
| `59947` | The title-format candidate remains supported: pair the standalone quest title as `얽힌 거미줄(A Tangled Web)`. |
| `59953` | The title-format candidate remains supported: Japanese marks `Hermit Smith` as a distinctive epithet. Consider `은둔 대장장이(Hermit Smith)의 제자`. |

## Additional Report-Only Findings at Existing IDs

These findings concern IDs already present in the append-only ledger; their
existing rows are unchanged.

| ID | Dimension | Finding and disposition | Confidence |
| ---: | --- | --- | --- |
| `59785` | Meaning | English `breaking free of Mel Senshir` can be read as escaping the city or freeing it from a siege. Japanese explicitly says the siege was lifted, while Chinese and Korean read as leaving/escaping the city. Hold the intended direction pending stronger context. | Insufficient |
| `59863` | Item-name format | The standalone ring name `Band of Brother Monks` is rendered only as `수도사 형제단의 반지`. Consider pairing the full item name, e.g. `수도사 형제단의 반지(Band of Brother Monks)`. | Medium |
| `59904` | Text type / speech level | This is a quest failure/status entry, not NPC dialogue. Its polite `사망했습니다` / `이행할 수 없습니다` contrasts with the plain journal style in Japanese and comparable status text. Consider `계약 당사자 중 한 명이 사망했다. 이 계약은 더는 이행할 수 없다.` | High |

## Evidence-Limited Holds

| ID | Question and disposition |
| ---: | --- |
| `59763` | English says `solf leather`, likely a source typo, while Japanese says wolf skin and Chinese says a whole piece of leather. The intended material cannot be established safely; leave the Korean material unresolved. |
| `59789` | Japanese alone explicitly adds a toast (`乾杯`); English and Chinese only express a hope for the Arena's success. Korean follows Japanese with `건배`. Keep the difference on hold rather than either adding or deleting the toast without game-context evidence. |
| `59959` | `one of them` has no clear antecedent in this excerpt; Japanese also leaves the referent unstated and the other source does not resolve it. Do not identify the being or change the pronoun by guess. |

## Repeated English and Structure

- Fifty-two exact-English duplicate groups across the corpus touch this range,
  comprising 978 rows; 54 IDs in the range participate. Korean wording is
  identical within every group.
- `59760`, `59903`, `59926`, `59952`, `59959`, and `59963` contain embedded
  line breaks. Their break counts match across all four languages: 5, 4, 2,
  8, 6, and 9 respectively (34 total per language).
- Runtime, display, and layout marker identities match. At `59961`, the
  argument order is `{2},{3},{1},{2}` in English/Chinese and
  `{3},{2},{1},{2}` in Japanese/Korean. This language-specific ordering is
  preserved and is not treated as an error.
- Of 250 IDs, 200 have indexed asset associations, represented by 207 links
  across 128 assets; 50 have none. Of the 190 newly recorded IDs, 140 are
  linked through 146 links across 76 assets, and 50 are unlinked. Asset
  associations do not establish an individual speaker or playback order.

## Range Result

- All 60 pre-existing ledger rows remain unchanged; 190 new IDs are appended
  in ascending order. Ten new-row candidates and three new holds are
  recorded. Nine existing candidates were rechecked. Three new findings at
  existing IDs remain report-only.
- The ledger covers 61,368 of 65,135 unique `default` IDs (94.22%), leaving
  3,767 unrecorded. Sequential coverage reaches `59999`; next is
  `60000`-`60249`.
- Candidate findings are proposals, not approval to edit translation CSVs.
  No translation CSV was changed.

## Verification

- English, Japanese, Chinese, and Korean each contain IDs `59750`-`59999`
  once and in identical ascending order; each full `default` file contains
  65,135 records with matching key order.
- All 61,368 ledger fingerprints validate, including the 60 rechecked and
  190 newly appended rows. The original ledger byte prefix was preserved.
- The regenerated quest-asset index and catalogs reproduce exactly; all nine
  related tests and the CRLF-aware audit diff check passed.
