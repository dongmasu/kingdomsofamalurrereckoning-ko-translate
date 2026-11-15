# Sequential `default` Revalidation: IDs `52000`-`52249`

- Date: 2026-11-13.
- Compared all 250 current Korean rows with English, Japanese, and Chinese.
  English anchors meaning; Japanese is the primary reference for voice,
  register, and layout; Chinese is supporting evidence.
- Rechecked 65 existing ledger rows without changing them; appended the other
  185 IDs. All 65 existing four-language fingerprints match the current CSVs.
- Recorded eight current correction candidates and 27 evidence-limited holds;
  215 IDs have no current finding. These ID-level categories do not overlap.
- Findings are proposals, not approval to edit translation CSVs. No
  translation CSV, immutable source CSV, or extracted game asset was changed.

## Correction Candidates

These ID-scoped proposals require separate approval before any translation
CSV edit.

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `52065` | Naturalness | `그들이 숲을 발견했을 때 모습 그대로 보전하고 건드리지 않는 한` is cumbersome. Consider `그들이 숲을 처음 본 그대로 두고 건드리지 않는 한, 우린 그들에게 악의를 품지 않아.` Preserve the condition and the speaker's lack of ill will. | Medium-high |
| `52078` | Naturalness / text type | This is a first-person quest-journal entry, but `찾았어`, `마셔야 해`, and `내 목숨은 짧아질 테니까` read like spoken explanation. Consider journal prose such as `이상한 영혼 결속(Soulbind) 저주의 치료제를 찾았다. 이제 마셔야 한다. 망설일수록 내게 남은 시간은 줄어든다.` Keep the increasing time pressure. | High |
| `52081` | Naturalness | `네 주위에서 보여` is an awkward rendering of `I can see it, all around you`; Japanese also describes something surrounding the addressee. Consider `네 주위를 둘러싼 게 보여.` Do not specify what `it` is. | High |
| `52096` | Meaning | `king on high` is rendered as `지상의 왕`, reversing the elevated sense; Japanese and Chinese both support a high-king reading. Consider `폭풍이 내려보낸 지고왕이네`, preserving the existing verse lineation. The obscure `gray-dusk fastings` and `bright-tide` imagery remains unresolved; this proposal is limited to the clear title error. | High |
| `52118` | Naturalness | `raise a glass to the creature's demise` is a toast, echoed by the following joke about drinking too much. Korean `죽음을 축하하고 싶지만` loses that connection. Consider `그 괴물의 죽음에 축배를 들고 싶지만, 술을 너무 많이 마신 게... 내가 탈라레인(Tala-Rane)으로 전근 온 이유 중 하나거든.` | High |
| `52135` | Terminology | This Teeth of Naros quest uses the same ash-filled urns rendered `유골함` elsewhere, while this row says `항아리`. Use `유골함` here too, adapting particles and grammar; do not apply it to unrelated pottery. The separate accepted correction to `wreak havoc` is already present and is not reopened. | High |
| `52211` | Speech level / consistency | `난 ... 왔소` mixes the colloquial contraction `난` with the archaic/formal `-소`; Japanese uses polite narration. Consider one consistent polite register: `저는 저 먼 북쪽에서 왔습니다. 전선에서는 멀리 떨어져 있지만, 알파르(Alfar)와의 전쟁은 우리 모두의 전쟁입니다.` | Medium-high |
| `52245` | Naturalness | `자신을 우선 돈벌이꾼, 그 다음에야 경쟁자로 여겨` follows the English wording too mechanically. Consider `그는 사나운 전사지만, 무엇보다 돈벌이를 중시하고 경쟁은 뒷전이지. 투기장을 완전히 구경거리로 만들어 놨어.` Preserve the contrast between profit and competition. | Medium |

## Evidence-Limited Holds

| ID(s) | Dimension | Evidence and disposition |
| --- | --- | --- |
| `52011` | Meaning / referent | The English possessive `stored in the Grand Bursar's` is incomplete. Japanese and Chinese support a room or office reading, but the exact location is not established. |
| `52024`, `52031`, `52051` | Terminology | `Neophyte`, `Adept`, and `Savant` are retained as formal rank/category labels; their canonical Korean forms and exact institutional roles remain unsettled. |
| `52041` | Meaning / tone | The mayor/Whitestone line may be a slogan, figurative incitement, or literal threat. The current Korean preserves the English image, but the intended force is unresolved across the references. |
| `52042` | Meaning / text type | `Entry III` may be a numbered entry or section. Japanese and Chinese do not establish the same document/UI type as Korean `제3부`. |
| `52045` | Terminology | The 10-second stagger-immunity effect is preserved, but the canonical Korean combat term for `parrying` is not settled. |
| `52047` | Terminology / title | `프리모스(Primos)의 맹세` follows the English wording, but whether `Primos` is a person, group, or formal title remains unresolved. |
| `52060` | Meaning | English `refugees were lost` is ambiguous; Japanese says they died while Chinese says they went missing. Do not choose between those outcomes. |
| `52067` | Terminology | The Gravedigger, Running Man, and Beast may be formal card names. The current bilingual labels preserve the images, but their canonical titles and lore meaning are unknown. |
| `52071` | Meaning | English `celebrate with others` is broader than the welcoming sense in Japanese and Korean. The public-house context suggests hospitality but does not prove it. |
| `52074` | Meaning / terminology | `unbeliever` and the Amulet of Rithen are understandable as written, but the religious/faction nuance and canonical item/name forms are not established here. |
| `52076`, `52084` | Meaning / terminology | The references vary between Lyria as a faith and as a deity-like presence. Preserve the current readings pending stronger lore evidence. |
| `52088` | Meaning / referent | `Hireling` may be a formal rank, and the antecedent of plural `them` after a singular attacker is not established. |
| `52090` | Meaning / referent | The object of `you will share` is omitted in English. Korean's `털어놓겠지` assumes a confession or disclosure without decisive context. |
| `52091` | Terminology | Capitalized `Destiny` may name a gameplay category/system. The current `운명` conveys the word, but this row alone does not settle its UI naming convention. |
| `52093` | Meaning / text type | `Refuse Pile` may be an ordinary refuse heap or a named container/UI category. |
| `52095` | Form / literary meaning | The verse's rhyme, `cups call King` image, and title-like references need broader literary/lore context. Its compact line layout is retained. |
| `52112` | Terminology | `순환` conveys `cycle`, but this line does not establish whether it names the formal seasonal Cycle. |
| `52130` | Terminology / structure | `Master Mitharan Mystic Rivets` is preserved, but the relation and ordering of the craft grade, material, and item type remain unclear. |
| `52132` | Meaning / lore | The relation between Mitharu as the world's order, a deity, and a guiding faith is not settled by the locale references. |
| `52164` | Meaning / text type | The Flowering is called a Ballad in English, a rite in Japanese, and a song in Chinese. Whether this names the story, ceremony, or both remains open. |
| `52177` | Meaning | `solicitation` may mean requests, improper demands, or incitement; Korean `부당 요구` selects a negative reading that the references do not fully resolve. |
| `52226` | Meaning / referent | English and Chinese say Hall of the Firstsworn; Japanese says shrine. The exact destination type remains unresolved. |
| `52239` | Meaning / lore | The syntax and alliance relation among the banshaen, client Murghan clans, and Tuatha Deohn are lore-specific; retain the current reading pending stronger context. |
| `52249` | Terminology | Lowercase `veil` may be a generic veil or the setting's formal Veil concept; the line alone does not settle capitalization or canonical naming. |

## Rechecked Findings and Structure

- Prior ledger records were preserved byte-for-byte. The old `52000` Master
  Belne candidate now matches the proposed `마스터 벨른(Master Belne)` form;
  `52054` already uses the proposed `처형인(Headsman)` form. The `52065`,
  `52078`, `52081`, `52118`, and `52135` candidates remain active; at
  `52118`, this is the new toast/idiom finding, and at `52135` it concerns
  the separate urn term, not the accepted `wreak havoc` correction.
- The existing `52118` ledger row remains unchanged as `not-issue`; this
  pass records the toast/idiom problem as a new candidate in this report
  rather than adding a duplicate ID.
- The existing `52104` ledger disposition is also preserved. This pass did
  not reopen it: `개화 의식(The Flowering)` is supported by the Japanese
  description, while the remaining title/event question does not establish a
  Korean error in this row.
- Three exact-English duplicate groups touch the range, covering seven rows:
  `Yes?` (`52026`, `52122`), `Quest Complete` (`52062`, `52100`, `52142`),
  and `Greetings.` (`52152`, `52199`). Korean matches within every group.
- Five entries contain embedded line breaks: `52037` (1), `52068` (1),
  `52096` (7), `52129` (English 3; Japanese, Chinese, and Korean 2), and
  `52185` (1). Total embedded breaks are 13 in English and 12 in each other
  language. At `52129`, English has an additional hard wrap splitting `the
  webs`; Korean follows Japanese and Chinese and has no sentence-internal
  break. The localized `{*1[...]}` labels at `52068` and `52185` preserve
  marker identity and order.
- Of 250 IDs, 203 have indexed asset associations, represented by 208
  ID-asset links across 132 assets; 47 have no indexed asset. Of the 185 new
  IDs, 138 have indexed associations and 47 do not, represented by 141 links
  across 78 assets. Asset links do not establish per-key speakers or
  playback order; unsupported speaker and order values remain unknown.

## Range Result

- The range has eight current correction-candidate IDs and 27
  evidence-limited holds; 215 IDs have no current finding.
- After appending 185 IDs, the ledger covers 55,623 of 65,135 unique
  `default` IDs (85.40%), leaving 9,512. Sequential coverage reaches
  `52249`; next is `52250`-`52499`.
- The findings are proposals requiring separate approval. No translation CSV
  was changed.
