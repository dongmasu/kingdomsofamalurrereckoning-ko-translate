# Sequential `default` Revalidation: IDs `59000`-`59249`

- Date: 2026-11-13.
- Compared all 250 active Korean rows against English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked the 74 pre-existing ledger fingerprints and preserved those rows.
  Appended the remaining 176 IDs in ascending order.
- Fifteen new-row correction candidates and three new ledger holds are
  recorded. Ten existing candidates and two existing holds were rechecked
  without rewriting their append-only ledger rows. Three additional
  candidate findings and one evidence-limited question at existing IDs are
  report-only.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## New Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `59020` | Naturalness | `Fair enough. I'll be here if you change your mind` is rendered as the fragment-like `그렇군. 마음이 바뀌면 여기 있을 테니.` Consider a complete conversational close, such as `알겠어. 마음이 바뀌면 여기로 와.` | Medium-high |
| `59021` | Title / naturalness | The standalone title `Death's Cryptic Hand` is `죽음의 수수께끼 손`, which reads awkwardly and lacks the English title. Consider `죽음의 불가사의한 손(Death's Cryptic Hand)` or another established title form after checking its UI context. | Medium |
| `59032` | Naturalness | `회피하여 피하세요` redundantly expresses dodging and avoiding. Consider `발로르(Balor)의 발톱은 큰 피해를 줍니다. 공격을 회피하세요.` Preserve all three display markers and their order. | High |
| `59051` | Meaning / naturalness | `I should not have expected anything less` praises the result as fully expected; `당연히 이럴 줄 알았어야 했어` can sound regretful in Korean. Consider a line that conveys pleased certainty, such as `정말이지, 이보다 못했으면 오히려 이상했겠지!` | Medium |
| `59059` | Name / format | In the context of the faction identified in Japanese and Chinese as Belen's Testament, Korean `테스타먼트` has no English pairing. Consider the context-local `테스타먼트(The Testament)`; do not expand this shortened source reference into a global alias or silently add `Belen's`. | High |
| `59067` | Title / format | The standalone title `Freedom Beckons` is translated naturally as `자유가 부른다` but is unpaired. Consider `자유가 부른다(Freedom Beckons)`. | Medium |
| `59076` | Title / format | The standalone ability/title `Shadow Walk` is `그림자 걷기` without its English name. Consider `그림자 걷기(Shadow Walk)` while retaining the established Korean wording unless a glossary check supports a different term. | Medium |
| `59108` | Terminology / naturalness | `지속 시간 기반 주문의 지속 시간` is a stiff repetition of `duration`. Consider the concise stat label `지속형 주문의 지속 시간 +20%`, subject to the game's definition of duration-based spells. | Medium-high |
| `59118` | Meaning / title | `Bull in a China Shop` is reduced to `난폭한 자`. Japanese supports a rough person, while Chinese also conveys clumsiness. Consider a title that retains the careless, destructive idiom, with the English name paired. | Medium |
| `59180` | Naturalness | `천성상 우리는 서로 대립하는 적일지도 몰라` is stiff. Consider `타고난 성향 때문에 서로 적이 될지도 몰라. 그래도 힘을 합치면 트래블러(Travelers)를 황금기로 이끌 수 있다고 믿어.` | Medium-high |
| `59221` | Name / format | The standalone title `Proxy Seryth` is rendered `대리인 세리스` without the source form. Consider `대리인 세리스(Proxy Seryth)`. | High |
| `59222` | Name / format | The standalone name `Tanzania` is rendered only as `탄자니아`. Add `(Tanzania)`; do not infer from the label alone whether it denotes a person, place, or other entity. | High |
| `59223` | Name / format | The standalone name `Vas` is rendered only as `바스`. Add `(Vas)`; do not infer its entity type from the isolated label. | High |
| `59238` | Name / format | The named peoples/groups `Deinir` and `Rotelos` are rendered only as `데이니르족` and `로텔로스족`, while `Kollossae` is paired. Add `(Deinir)` and `(Rotelos)` without changing the contrast or the uncertainty in the final question. | High |
| `59239` | Terminology | `Tinctures` is rendered `팅크처`, while the established role and potion terminology uses `팅크제` (for example, `default:6072` and `default:19347`). Consider `팅크제` here; retain the separately supported `사랑의 묘약`, `연고`, and `향유` categories. | High |

## Additional Report-Only Findings at Existing IDs

These are newly surfaced findings on rows already present in the ledger.
Their ledger entries remain unchanged.

| ID | Dimension | Finding and disposition |
| ---: | --- | --- |
| `59093` | Title / format | The standalone title `Hearts of Chaos` is `혼돈의 심장` without its English form. Japanese and Chinese also use a singular heart; retain the Korean meaning and consider pairing the complete English title. |
| `59140` | Name / format | `Leechwood` is a named tree/wood term but lacks its English form. Consider `리치우드(Leechwood)` here; do not expand it to the separately registered `Leechwood Tree` unless context warrants it. |
| `59235` | Meaning / name / format | `Adessa Armory` is only `아데사 무기고`, and `contraband locker` is `압수품 보관함`. Japanese and Chinese identify a smuggled/prohibited-goods locker, not a seized-goods locker. Consider `아데사 무기고(Adessa Armory)의 밀수품 보관함` or another established term. |

## Rechecked Existing Findings

| ID | Current finding and disposition |
| ---: | --- |
| `59011` | The existing candidate remains supported: Korean adds `상징` to a direct analogy among Aodh, fire, Sedeas, ice, and this place. Keep the ledger row unchanged. |
| `59023` | The existing hold remains: `St. Eadric's` does not establish whether the place is the whole mission or a sanctuary. |
| `59052` | The existing name-pairing candidate for `Julia` remains; the current Korean still omits `(Julia)`. |
| `59057` | The earlier context review identifies the Glass as the Glass of Ambient, a magical mirror. The current `글래스` remains a supported terminology candidate; the prior ledger row is unchanged. |
| `59142` | The existing `the Pit` candidate remains: Japanese says a waiting area, and this line does not establish whether it is the same location as the Gladiator Pit. |
| `59152` | The existing `thumos` pairing candidate remains; the term is still `투모스` without `(thumos)`. |
| `59165` | The existing source-conflict hold remains: English/Chinese say `I hope he returns`, while Japanese says `I don't need anything in return`; Korean follows English/Chinese. |
| `59191` | The existing `Master's Tallow` terminology/pairing candidate remains supported; the row is unchanged. |
| `59197` | The existing `Officer's Hall` and `the Burn` pairing candidate remains; the current text still leaves both English labels absent. |
| `59200` | The existing alchemical-formula consistency candidate remains; this row still uses `제조법` rather than the quest-context proposal `조제법`. |
| `59217` | The existing `The Font` pairing candidate remains; this explicit named-source reference is still unpaired. |
| `59242` | The existing `Gastyr` spelling/pairing candidate remains. Keep the distinct person, house, and castle references separate and do not infer which one this line means. |

These checks do not rewrite historical ledger dispositions. They also do not
authorize translation edits.

## Evidence-Limited Questions

| ID | Question and disposition |
| ---: | --- |
| `59172` | English asks `What are they for?`, but the isolated key gives no referent. Japanese omits the pronoun and Chinese treats it as plural. Keep Korean `그건` provisional rather than guessing the referent or number. |
| `59225` | `The Oratory` is a named/standalone label, but Japanese says a prayer place and Chinese says a speech/oration. Korean transliterates `오라토리움`; hold the intended place/function and Korean label. |
| `59243` | English capitalizes `Wharf`, while Japanese and Chinese use a generic wharf/dock. Korean `부두` is plausible; hold whether this is a named district and whether to add English. |

The source-language question at existing ID `59144` is report-only: English
`the mayor's agenda`, Japanese `市長の計略` (scheme), and Chinese
`镇长政策` (policy) differ in nuance. Korean's `음모` selects the
Japanese-like scheme reading; retain pending quest context.

## Repeated English and Structure

- Sixty exact-English duplicate groups across the full corpus touch this
  range, covering 1,551 rows. Korean is consistent within every group except
  `56137` / `59183` (`Stay strong.`). Their Japanese lines also differ
  (`元気でな` / `お元気で`), and Korean's `힘내.` / `힘내세요.` preserves
  that register distinction; do not unify them.
- `59100` is the only row with embedded line breaks in this range. It has
  eleven breaks in each of the four languages, and the Korean poem/prose
  paragraph layout is retained.
- Runtime, display, and layout marker identities and order match. Localized
  payloads inside display markers naturally differ by language; at `59032`,
  `59055`, and `59129`, Korean preserves the marker sequence and placement.
- Of 250 IDs, 202 have indexed asset associations, represented by 206 links
  across 129 assets; 48 have none. Of the 176 new ledger IDs, 128 are linked
  through 131 links across 68 assets, and 48 are unlinked. Asset associations
  do not establish an individual speaker or playback order.

## Range Result

- The 74 pre-existing ledger rows remain unchanged; 176 new IDs are appended
  in ascending order. Fifteen new-row correction candidates and three new
  ledger holds are recorded. Ten existing candidates and two existing holds
  were rechecked; three additional findings and one question at existing IDs
  remain report-only.
- After the append, the ledger will cover 60,814 of 65,135 unique `default`
  IDs (93.37%), leaving 4,321 unrecorded. Sequential coverage reaches
  `59249`; next is `59250`-`59499`.
- Candidate findings are proposals, not approval to edit translation CSVs.
  No translation CSV was changed.

## Verification

- English, Japanese, Chinese, and Korean each contain IDs `59000`-`59249`
  once and in identical ascending order; each full `default` file contains
  65,135 records with matching key order.
- The existing 74 fingerprints and the 176 newly recorded fingerprints match
  the current four-language sources.
- The generated quest-asset index and catalogs, related tests, and
  line-ending-aware diff check passed after the ledger/catalog update.
