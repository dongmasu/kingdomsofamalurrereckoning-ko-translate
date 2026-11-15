# Sequential `default` Revalidation: IDs `6750`-`6999`

- Date: 2026-11-11.
- Scope: compare the active English, Japanese, Chinese, and Korean rows for
  IDs `6750`-`6999`; add only IDs without an existing review-ledger record.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- 179 IDs without a prior ledger record were reviewed and recorded. The other
  71 IDs already had records; their source fingerprints were current and their
  prior dispositions were retained.
- Nineteen new IDs have correction candidates. Three new IDs have
  evidence-limited holds.
- Meaning, Korean naturalness, register where assessable, names/terms, and
  structure were checked. UI, objective, item, book, and other non-dialogue
  text was assessed according to its type.
- No translation CSV or extracted game asset was changed. Candidates are
  proposals, not approval to edit.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `6758` | Terminology / format | `Savant` and `Adept` are both rank terms, but Korean uses a transliteration for the first and generic `숙련자` for the second; Japanese identifies both as mage ranks. Revisit them alongside the existing open Savant/Adept terminology questions. `Mel Aglir` is also paired twice in the same journal entry; consider retaining the English parenthetical only at first mention. | Medium |
| `6763` | Terminology | `Court of Enchantments` is rendered `마법의 궁정`, while another occurrence at `18263` uses `마법 궁정(Court of Enchantments)`. Review the canonical Korean form across the named institution's uses; no global replacement is proposed here. | Medium |
| `6766` | Name / format | `The Desert Runner` is a named epithet for Lyana in this passage, but Korean gives only `사막의 질주자`. Consider pairing the title on first mention as `사막의 질주자(The Desert Runner)`. Existing paragraph breaks and the two embedded Korean CRLF breaks are intentional data and were preserved. | Medium |
| `6780` | Name / format | The standalone capitalized label `Fire King` is rendered `불의 왕` without its English form. Consider `불의 왕(Fire King)` if this is a named title rather than a generic label; the referent is not established by the row alone. | Medium |
| `6783` | Meaning | English says `Your sister Molly` without specifying her age relative to the addressee. Korean `여동생` adds that Molly is younger; Japanese `妹` supports that reading, but English and Chinese do not establish it. Consider an age-neutral form unless other game evidence confirms the relationship. | Medium |
| `6805` | Meaning | `appointment` means the meeting/engagement just concluded; Korean `약속한 일` can imply a promise or agreed task not stated in English. Japanese frames it as the conversation ending. Consider wording such as `그럼 만남은 이쯤 마무리된 것 같군`. | Medium |
| `6817` | Terminology / naturalness | `Walen's second in a duel` is a designated assistant/attendant, as Japanese `介添人` confirms. `보조인` is vague; consider `결투에서 웨일런의 보조역` or an established term for a second. | Medium |
| `6829` | Terminology | English `chausses` names a specific leg-armor item, not necessarily `Leggings`. Korean `각반` may denote a different item; the standalone item label at `54040` uses `차우스(Chausses)`. Review and align the item term without applying the separate `Leggings` decision automatically. | High |
| `6834` | Naturalness / tone | `dear Alder` precedes `Poor, foolish man` and reads as ironic or wry. `사랑하는 앨더` can instead sound genuinely affectionate. Consider a less literal, contextually sardonic opening such as `우리 앨더가 환영 인사는 해 줬겠지?`. | Medium |
| `6855` | Naturalness | `Where is the future for me here?` is rendered as the stiff, literal `여기서 내 미래는 어디에 있지?`. Japanese is conversational. Consider `여기서 내게 무슨 미래가 있겠어?`. | Medium |
| `6870` | Name / format | The capitalized historical label `First Burning` is translated as `제1차 대화재` without the English name. Consider `제1차 대화재(First Burning)` if this is the named event. | Medium |
| `6893` | Naturalness / register | `소문만 한 게 없지` conveys the idea, but `입을 달래는 데는` is unnatural in this conversational idiom; `이리 오게` also shifts more formal than the surrounding casual line. Consider a consistent conversational rendering such as `이리 오게, 동료 트래블러(Traveler). 수다만큼 입 풀기 좋은 것도 없지, 안 그래?`. | Medium |
| `6907` | Name / format | `House of Ballads` is translated as `발라드의 집` without the English pairing, unlike the established paired form elsewhere. Consider `발라드의 집(House of Ballads)`. | High |
| `6909` | Name / format | The capitalized standalone title `God Under the Mountain` is rendered `산 아래의 신` without the English form. Consider `산 아래의 신(God Under the Mountain)` if it is a named title. | Medium |
| `6933` | Name / title format | `Mayor Eswin` is formatted as `에스윈(Eswin) 시장`, splitting the Korean name and title from the English name/title. Align with the project convention as `에스윈 시장(Mayor Eswin)`. | High |
| `6938` | Name / format | `House of Ballads` is rendered `발라드의 집` without its English pairing. Consider `발라드의 집(House of Ballads)`. | High |
| `6941` | Meaning / naturalness | `the woman I wore` refers to a woman whose body the speaker inhabited; Japanese explicitly says the speaker borrowed her body. `걸쳤던 여인의 몸` sounds like clothing. Consider `지난번 춤출 때 빌렸던 여인의 몸은 지금 이 몸만큼 강하지 않았어`. | High |
| `6976` | Naturalness | The playful correction in `my partner in... prayer. Eh?` is retained, but `기도... 동료 아닌가` sounds stiff. Consider a more idiomatic conversational phrase while preserving the pause and self-correction. | Medium |
| `6983` | Name / format | `Greater Niskaru, Balor` presents a creature class and its name, but the Korean encloses both in one parenthetical after `상급 니스카루 발로르`. Consider pairing them distinctly, e.g. `상급 니스카루(Greater Niskaru) 발로르(Balor)`. | Medium |

## Evidence-Limited Holds

| ID | Reason and disposition |
| ---: | --- |
| `6779` | The English label is `Dyth`, while Japanese gives `ダイス`, Chinese `迪丝`, and Korean `다이스`. The intended pronunciation or whether the English is a source typo is not established; retain the current form pending stronger evidence. |
| `6781` | `Hunter's Pit - East` is rendered literally as `사냥꾼의 구덩이 - 동쪽`; Japanese describes a hunter/tracker hideout and Chinese a cave. The source and language references do not establish the map feature well enough to choose among pit, cave, or hideout. |
| `6797` | `Keep the Sorrows` has conflicting readings: Japanese `悲しみと共に` suggests being with sorrow, while Chinese `保护好悲灵` suggests protecting beings called Sorrows. The row and asset index do not resolve whether this is an instruction, title, or named entity. |

## Duplicate and Structural Checks

- Fifty-seven exact-English duplicate groups touching the range (1,214 rows
  across the corpus) were checked; Korean text matched within every group.
- Runtime-variable, layout-control, and logical line-break signatures match
  across all four languages for the 179 new IDs.
- Korean embedded breaks use CRLF at ID `6766` (2 breaks) and ID `6947`
  (1 break), for 3 existing breaks total. They were preserved.
- Of the 179 new IDs, 132 have indexed quest-asset links and 47 do not.
  Asset membership does not establish an individual speaker, handler
  mapping, branch, or dialogue order.
- ID `6836` explicitly identifies the speaker in first person as Aubrey
  Gilcrest. No dialogue order is established by that self-identification.

Four-language source fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
