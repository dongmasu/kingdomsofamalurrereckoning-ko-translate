# Sequential `default` Revalidation: IDs `36750`-`36999`

- Date: 2026-11-12.
- Compared all 250 IDs in English, Japanese, Chinese, and active Korean; all
  four resources have the same ordered ID set.
- Rechecked 64 existing ledger entries and reviewed the other 186 in-range
  IDs. Five additional cross-range IDs were recorded for directly related
  terminology findings.
- Findings are review proposals, not approved translation edits. No
  translation CSV, extracted game asset, or game binary was modified.

## Correction Candidates

| ID(s) | Dimension | Source evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `36783` | Naturalness | `Pleasant travels, berk.` is an informal farewell with an insult. `좋은 여행 되게` is awkward Korean. Retain the address while using a natural farewell such as `여행 잘 다녀와, 멍청아.` | Medium-high |
| `36828` | Meaning / naturalness | Japanese `よかった` expresses relief, unlike Korean `드디어 왔군` (“you finally came”). Use a relief-bearing opening such as `다행이야` before the remark about the Yolvan road. | Medium |
| `36831` | Meaning / warning | `Don't let me catch you making trouble again` warns against being caught causing trouble again; Korean `다시는 말썽 피우지 마` omits the catching/consequence. Restore the warning without inventing a specific punishment. | High |
| `36838` | Meaning | `few answerers` means that few people answer Mitharu's prayers. Korean `응답하는 이는 드물지` reverses this to “not rare.” Use `응답하는 이는 드물어` or an equivalent that preserves the scarcity. | High |
| `36854` | Terminology | The named `Notices of Duty` is rendered `임무 통지서`, unlike the established `복무 소집 통지서` in the related quest labels and item. Use the established term, with English pairing if appropriate. Keep Rhiad as the payer: English and Japanese both say Rhiad paid the courier. A previous proposal that made the player the recipient of payment is not supported and is not retained. | High |
| `36863` | Tone / meaning | `I will not deign to explain my life to you` conveys contemptuous refusal. Korean says only that the speaker has no intention of explaining. Restore the dismissive force without adding a new threat. | Medium-high |
| `36896` | Naturalness | `이익을 축하하며 건배하죠` is an awkward rendering of `raise a glass to profit`. Use a natural toast to the deal's profit, such as `일이 끝나면 이익을 자축하며 한잔하죠.` | Medium-high |
| `36916` | Terminology | These are the urns in the Teeth of Naros quest; Japanese uses `骨壷` and Chinese specifies ash containers. Align the quest-specific wording with `유골함`, as in the related entries, rather than treating them as generic pots. | High |
| `36922` | Address / consistency | `my liege` is currently `나리`, while related lines use the established `주군`. Consider `주군`, preserving the speaker's respectful but mildly exasperated tone. | High |
| `36929` | Meaning | English says `my sister` and `my brother` without specifying their ages. Korean `여동생` and `남동생` adds that both are younger. Remove the unsupported age distinctions while retaining the two siblings. | High |
| `36967` | Speech level / naturalness | The conversational farewell in English and Japanese `残念ね` is rendered with the stiff `아쉽군`. Use a conversational expression of regret; do not infer the speaker's identity from the asset association. | Medium |
| `36968` | Name / title format | This refers to the named vigilante known as `the Executioner`. Korean `처형자` differs from the established paired title `처형인(The Executioner)` at the title entries. Use the consistent name and pair the epithet, e.g. `처형인(The Executioner)이라 불리던 자경단원`. | High |
| `36982`, `38893` | Format | The exact English label `Boggart (2 Bugs)` occurs at both IDs, but both Korean rows omit the bug count. Preserve the count and the paired name consistently in both labels; Japanese and Chinese also retain the count. | High |
| `21777`, `36993`, `63303`, `64287` | Name / format | These rows refer to the coined entity `Mithrolith(s)`. Use the established Korean spelling `미스로리스` and add the English form where absent. `21777` already has a format candidate and remains open; `36993`, `63303`, and `64287` are added as cross-range candidates. | High |
| `36993`, `48675`, `64922` | Terminology / format | `Deep Gloam` is a named era, rendered variously here as `심연의 황혼기` and `깊은 황혼 시대` without English pairing. Related entries use `깊은 황혼(Deep Gloam)`. Align the term to that established form and pair the name, adjusting `시대` to the sentence. | Medium-high |

The prior `36854` finding was narrowed after checking all four sources: the
subject remains Rhiad and only the established `Notices of Duty` terminology
is proposed. The cross-range group findings extend the ledger to the directly
related keys rather than applying any global text replacement.

## Evidence-Limited Holds

| ID(s) | Dimension | Reason |
| ---: | --- | --- |
| `36754` | Meaning / title | The isolated title `The Rake` is ambiguous. Japanese reads `熊手` (“rake”), while Chinese `浪子` and Korean `난봉꾼` use the “rake/debauched man” sense. There is no indexed asset or surrounding context to resolve the intended sense; retain provisionally. |
| `35368`, `36815`, `39191` | Meaning / terminology | The exact label `Silkfarmers` is rendered `비단 농부들`. Japanese describes silk-harvesting artisans and Chinese silk reelers; other Korean lines vary among `양잠업자`, `비단 채집꾼`, and `비단 농사꾼`. The sources do not establish whether the group farms silkworms, gathers silk, or processes it. Keep the prior hold at `35368`, add the duplicate label at `36815` and `39191`, and do not force a term choice. |
| `36984` | Meaning / reference | Korean `내 형` specifies an older brother and a male speaker. English `my brother` and Chinese do not establish the age or speaker's gender, while Japanese does use `兄貴`. Keep the source discrepancy on hold rather than inferring a speaker attribute. |

## Repeated Sources And Structure

- Sixty exact-English duplicate groups (1,503 corpus rows) touch the range.
  Korean matches within each full-string group except `Be good.` and `I'll be
  back tomorrow.`; the Japanese rows also split into different phrasings or
  register, so the Korean differences are retained rather than mechanically
  unified.
- Twelve entries contain embedded line breaks: `36792` (1), `36835` (7),
  `36862` (1), `36871` (5), `36873` (9), `36880` (2), `36899` (1), `36903`
  (4), `36918` (5), `36932` (1), `36939` (8), and `36979` (4). The counts
  match across all four languages, totaling 48 breaks per locale.
- Runtime-token and localized-wrapper structures are preserved. At `36764`,
  `36964`, and `36991`, wrapper payloads are localized; the token structure
  remains intact. At `36799`, only Chinese has platform-specific
  `<ps3>`, `<xb360>`, and `<win32>` markup; English, Japanese, and Korean use
  the ESC continuation prompt. No Korean token loss was found.
- Asset membership remains grouping evidence only. No speaker, addressee,
  branch, or playback order is inferred from asset association or ID order.
- The range has 14 candidate IDs, three in-range holds, and 233 IDs without a
  new in-range finding. Five new cross-range IDs were added; existing related
  records at `21777`, `35368`, and `38893` were linked to this review.
- The 186 newly recorded in-range IDs plus five new cross-range references
  bring the ledger to 44,406 of 65,135 unique `default` IDs (68.18%), leaving
  20,729. Sequential coverage reaches `36999`; next is `37000`-`37249`.
- The 530-asset and 65,135-ID catalogs reproduce exactly; all 44,406
  four-language ledger fingerprints validate. Translation CSVs remain
  unchanged.
