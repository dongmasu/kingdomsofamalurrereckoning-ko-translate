# Sequential `default` Revalidation: IDs `7500`-`7749`

- Date: 2026-11-11.
- Scope: compare the active English, Japanese, Chinese, and Korean rows for
  IDs `7500`-`7749`; add only IDs without a current review-ledger record.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- All 250 IDs were checked. The 69 existing records had current four-language
  fingerprints and their prior dispositions were retained. The other 181 IDs
  were reviewed and recorded.
- Twelve new IDs have correction candidates. Three IDs have
  evidence-limited dimensions.
- Meaning, Korean naturalness, register where assessable, terminology, names,
  and structure were checked. UI, objective, item, and other non-dialogue text
  was assessed according to its type.
- No translation CSV or extracted game asset was changed. Candidates are
  proposals, not approval to edit.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `7510` | Meaning / naturalness | `벨렌께 바칠 준비를 한다` reads like a detached description and obscures the direct threat. English and Japanese say the addressee will be offered to Belen; consider `널 벨렌(Belen)께 바치겠다`. | High |
| `7527` | Meaning / naturalness | `가능한 한 멀리까지 가서` reads as physical distance, while Japanese and Chinese express finding them by any means / doing one's utmost. Consider `최대한 그들을 찾아본 뒤 라시르(Rathir)에서 그윈(Gwyn)과 합류해`. | High |
| `7567` | Naturalness | `그가 부름받은 자를 안다니 몰랐네` is awkward and makes the relationship hard to parse. Consider `그가 부름받은 자(Beckoned)와 아는 사이라니 몰랐네`, preserving the surprised tone. | High |
| `7577` | Speech level | `안녕하시오, 전사여` uses 하오체, unlike the Japanese greeting and the project's conversational-dialogue guidance. Consider `안녕하세요, 전사님`. | High |
| `7598` | Format | The formal Scholia Arcana rank `Savant` is correctly rendered `사반트`, but the full label `Savant Goyen Reen` lacks its English pairing. The established rank decision at D-18268 supports pairing the complete title and name: `사반트 고옌 린(Savant Goyen Reen)`. | High |
| `7612` | Naturalness | `위대한 순환이 모든 투아사를 다시 투아사로 되돌려 보내지` is cumbersome and can suggest sending them somewhere. Japanese explicitly describes resurrection. Consider `위대한 순환은 모든 투아사를 다시 투아사로 되살려 내`. | High |
| `7667` | Format | The source label includes the title `Queen of Staves`, but Korean pairs only Argine's name. Consider `아르진, 지팡이의 여왕(Argine, Queen of Staves)` if following the complete name-and-title pairing used elsewhere. | Medium |
| `7683` | Speech level | Japanese `やあ` is a casual greeting, while `안녕하십니까` shifts to highly formal Korean. Consider `안녕, 주인님`, retaining the respectful address without changing the greeting's register. | High |
| `7714` | Meaning | English `the one` does not specify the addressee's gender; Korean `그자` can imply a man. Consider a gender-neutral `네가 바로 그 사람이구나`, keeping the following question intact. | Medium |
| `7720` | Format | In this single sentence, English pairings are present for Grian and Breid but absent for Borri, Hanrik, and Gwyn. Check whether the latter names have already been introduced; if not, align their first-use pairing without changing the teasing tone. | Medium |
| `7730` | Meaning | `Been a friend to me` repeats the friendship claim, but `내게도 잘해 줬지` weakens it to having treated the speaker well. Consider preserving the emphasis with `나한테도 늘 친구처럼 대해 줬지`. | Medium |
| `7733` | Naturalness | `우리 백색의 할람` is an awkward possessive construction for `our own Hallam the White`. Consider `우리 종족에게는 새로운 형태의 마법이야. 같은 종족인 백색의 할람(Hallam the White)이 만들어 냈지`, retaining the established title. | High |

## Evidence-Limited Holds

| ID | Reason |
| ---: | --- |
| `7532` | English, Chinese, and Korean say one part ore per ten parts of refuse; Japanese says one per thirty. Korean matches English and Chinese. Preserve it pending resolution of the source-language conflict. |
| `7553` | English leaves `how long` without an explicit object. Japanese asks how long the Plagueshield will help, while Chinese asks how long the patient will live; Korean follows the latter reading. The row and asset association do not resolve the referent. |
| `7748` | `A Rude Awakening` can mean an unpleasant realization or a sudden awakening. Japanese and Chinese emphasize awakening, while Korean `불쾌한 각성` follows the English adjective literally. Without the title's context, do not impose a revised reading. |

## Duplicate and Structural Checks

- Fifty-six exact-English duplicate groups touch the range (791 rows across
  the corpus). Korean text matches in every group.
- Line-break counts and runtime-variable/layout-wrapper structure match across
  the four languages for all 181 new IDs. At `7582`, the localized contents
  inside the `{*1[...]}` display wrapper differ by language as expected.
- Five Korean strings contain 12 existing CRLF embedded breaks: ID `7518`
  (4), `7532` (2), `7582` (1), `7615` (4), and `7693` (1). They were
  preserved.
- Of the 181 new IDs, 140 have indexed quest-asset links and 41 have none.
  Asset membership does not establish a speaker, handler mapping, branch, or
  dialogue order.

Four-language source fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
