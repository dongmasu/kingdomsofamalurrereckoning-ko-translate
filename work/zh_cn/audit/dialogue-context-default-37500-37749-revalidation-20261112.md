# Sequential `default` Revalidation: IDs `37500`-`37749`

- Date: 2026-11-12.
- Compared all 250 IDs in English, Japanese, Chinese, and active Korean; all
  four resources have the same ordered ID set.
- Rechecked 61 existing ledger entries and reviewed the other 189 in-range
  IDs. Existing fingerprints match the current four-language rows.
- Findings are review proposals, not approval to edit translation CSVs.
  No translation CSV, extracted game asset, or game binary was modified.

## Correction Candidates

| ID(s) | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `37508` | Speech level | Retain the existing candidate. Japanese uses a plain, masculine assertion (`立派に遂行したな`), while Korean `치렀소` shifts to marked deferential speech. Consider a plain ending such as `용맹의 의식(Rite of Valor)을 훌륭히 치렀군.` No speaker is inferred from the asset. | Medium-high |
| `37514` | Meaning | English explicitly says to kill a few before checking their stomachs; Korean `몇 마리 잡아` can read as merely catching them. Consider making the killing explicit without importing the Chinese-only identification of crabs. | High |
| `37540`, `38319`, `44458`, `50723`, `52797` | Terminology | Retain the existing cross-range candidate. These refer to the same sewer-inspection surveyor and her report, but Korean uses `조사원`, `측량사`, and `조사관`; Japanese consistently uses `検査官`. Consider the already proposed context-appropriate `조사관` across these five rows. | High |
| `37551`, `37733` | Speech level | Both address the player as `Beckoned`; Korean uses marked 하오체 (`좋소`, `반갑소`) while Japanese uses casual greetings and Chinese uses ordinary conversational forms. Consider natural conversational Korean, without treating asset association as proof of a shared speaker. | Medium |
| `37554` | Speech level | Japanese uses plain speech (`しないでくれ`) and Chinese a direct conversational prohibition, while Korean uses a sustained 하오체 sequence (`마시오`, `대변자요`, `아니오`). Consider a less archaic conversational register; individual speaker attribution remains unknown. | Medium |
| `37560` | Format | This is a quest objective, but `살육의 현장을 습격하라` uses an imperative rather than the established `-하기` objective form. Consider `살육의 현장 습격하기`. | High |
| `37566` | Naturalness | The ring description is otherwise accurate, but `이니셜이 띠에 긁어 새겨진` is awkward and `띠` is unclear for a ring band. Consider `반지 테에 "DC"라는 이니셜이 긁혀 새겨진 소박한 황동 반지`. | High |
| `37613` | Name / format | `Motus Mining` is part of this named job-board title but is not paired in Korean. Consider `모투스 광업(Motus Mining) 의뢰 게시판`. | High |
| `37619` | Meaning / naturalness | In `We each have a person we want to see us`, Korean shifts the object to singular `나를` after a plural `우리`. Consider `우리 각자에게는 누구보다 우리를 봐 주길 바라는 사람이 한 명씩 있어.` Preserve the two-paragraph structure and the narrator's uncertainty. | High |
| `37631` | Naturalness / address | Retain the existing candidate. In the informal reassurance, `그대` is elevated and less direct than English `dove`; the full sentence is also less direct than `I know the feeling all too well`. The prior context review proposed the conversational `친구` address and `나도 그런 기분 잘 알아`. | Medium-high |
| `37643` | Name / format | The English names the `Attwater twins`; Korean gives only `애트워터 쌍둥이`. Add the full English name, e.g. `애트워터 쌍둥이(Attwater twins)`, without inferring either twin's gender. | High |
| `37644` | Name / format | Only `Katarina` is paired, while the source identifies `Katarina Hoffman`. Pair the complete name, e.g. `카타리나 호프먼(Katarina Hoffman)`. | High |
| `37674` | Name / format | The standalone group label `Dunnmen` is transliterated as `던멘` without its source form. Consider `던멘(Dunnmen)`. | High |
| `37685` | Meaning | English `heavy-duty blade`, Japanese `重いブレード`, and Chinese `重型刀` describe a weighty blade; Korean `튼튼한 칼날` shifts this to durability. Consider `묵직한 칼날` while retaining the two-handed use. | Medium-high |
| `37693` | Meaning / format | The second sentence calls the projectile a `stray arrow`, but Korean says `유탄` (a stray bullet). Use an arrow term consistently. English says only `his sister`; Korean `여동생` adds an age relation not stated in English or Japanese. Use age-neutral wording and pair the full named references, including Emperor Morus, Sophia, Bloodbringer, and the Dark Ages of Novarre. Preserve the paragraph break and chronology. | High |
| `37706` | Name / format | `Hellbane` is a named longsword but is not paired in this sentence. Add its English name, e.g. `헬베인(Hellbane)`. Keep `장검`, which matches the established `base` weapon term. | High |
| `37726` | Name / format | The source title is `Mistress Fel`, while Korean pairs only `Fel`. Pair the complete title and name, e.g. `펠 부인(Mistress Fel)`. | High |
| `37728` | Name / format | The named institution `St. Eadric's Perpetual Mission` is translated but lacks the English pairing. Pair the complete institution name while retaining the current provisional Korean rendering; the locale sources do not settle whether `Mission` is best understood as a mission or monastery. | Medium-high |
| `37731` | Name / format | Retain the existing candidate. `The Leaf` is the proper short name of the Luminary Leaf bookstore; Korean `리프` omits its English form. Consider `리프(The Leaf)` as proposed in the linked asset review. | High |

## Evidence-Limited Holds

| ID | Dimension | Reason |
| ---: | --- | --- |
| `37511` | Meaning | English `crash`, Japanese only says she may still be alive, and Chinese specifies a shipwreck. Korean `추락 사고` chooses a particular kind of accident that the evidence does not establish. Keep the event type unresolved. |
| `37543` | Meaning | English and Chinese say Father Marsh requested the prayer-bead return, while Japanese names Brother Udo. Preserve the current English-led reading provisionally; the source conflict does not establish a correction. |
| `37577` | Meaning / referent | English lowercase `font`, Japanese `泉` (spring), and Chinese `圣水器` (holy-water vessel) do not establish whether this is a generic spring, ritual font, or the specifically named `The Font`. Do not force the approved `샘(The Font)` form onto it without context. |

## Earlier Findings Rechecked

- Existing candidates at `37508`, `37540`, `37631`, and `37731` remain
  supported. The five-row surveyor terminology finding remains linked to its
  existing ledger records and prior report.
- Existing hold `37543` remains unresolved; new holds are recorded at
  `37511` and `37577`.
- No speaker, addressee, branch, or playback order was inferred from asset
  membership, handler names, or ID order.

## Repeated Sources And Structure

- Sixty-one exact-English duplicate groups (1,138 corpus rows) touch this
  range. The only Korean wording difference is `37711` / `38993`, both
  `Come to Telogrus.`; Japanese also differs (`来い` / `来なさい`), so the
  Korean register variation is retained rather than mechanically unified.
- Five rows contain embedded line breaks: `37599` (4), `37619` (2), `37662`
  (1), `37679` (3), and `37693` (1). Counts match across all four locales,
  totaling 11 breaks per locale.
- Normalized runtime-token and markup inventories match across all 250 IDs.
  At `37662`, localized `[Passive]` contents differ inside the same
  `{*1...}` wrapper. At `37699`, Japanese orders `{2}` before `{1}`, while
  Korean follows English; the token inventory is intact and this is not
  treated as a structural error.

## Range Result

- The range contains 20 candidate IDs and three evidence-limited holds; the
  other 227 IDs have no new finding. Four candidates were already present in
  the ledger and were rechecked; 16 candidate IDs and two holds are new to
  this range review.
- The 189 newly recorded IDs bring the ledger to 44,960 of 65,135 unique
  `default` IDs (69.03%), leaving 20,175. Sequential coverage reaches
  `37749`; next is `37750`-`37999`.
- The catalogs cover all 530 quest assets and all 65,135 IDs. Asset links
  remain grouping clues, not proof of speaker or playback order. Catalog,
  fingerprint, test, and scoped diff results are recorded after regeneration.
  Translation CSVs remain unchanged.
