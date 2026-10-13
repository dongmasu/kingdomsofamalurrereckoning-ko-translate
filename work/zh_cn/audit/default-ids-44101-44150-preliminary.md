# Preliminary Language Scan: `default` IDs 44101-44150

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 44101-44150 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring Korean terminology, historical audit
  notes, line breaks, runtime markers, numeric values, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 44103 | “Well met!” / `잘 만났네!` | Check whether a more idiomatic Korean greeting such as `반갑네` better preserves the source greeting and character voice. | English is a set greeting; Japanese uses a formal greeting and Chinese says “glad to meet you.” Korean is understandable but sounds unusually literal. | Medium |
| 44104 | Placeholder! / `자리표시자!` | Confirm whether this is visible game text or developer placeholder content before translating or retaining it. | English leaves `Placeholder!` literal; Japanese does too, while Chinese and Korean translate it. Historical audit groups this with placeholder-status questions. | High |
| 44107 | “They both” / `두 사람` | Preserve the English's unspecified relationship unless context confirms the people are the speaker's parents. | Japanese explicitly says “both parents,” while English and Chinese do not establish kinship. Korean's neutral `두 사람` avoids adding that relation. | Medium |
| 44110 | `squire` / `종자` | Confirm the established Korean title for the awarded rank and standardize `thresh` terminology. | Korean retains that a brave squire risked her life to save a noble's son and heir from a savage thresh; official rank and creature terms remain provisional. | Medium |
| 44121 | `Might/Fin./Sorc.` / `힘/재주/마법` | Check abbreviations against the game's established Korean attribute labels and UI width. | Korean expands three abbreviated English labels. The Japanese also expands them; Chinese uses full attribute names. | Medium |
| 44123 | “very crude iron” / `아주 거친 철` | Check whether `crude` means low-grade/impure iron rather than physically rough iron. | Japanese explicitly calls it low-quality iron; English can support that reading. Korean may be understood as texture, though the chakram and minor fire enchantment remain intact. | Medium |
| 44127 | “his brand of viciousness” / `그는 여전히 잔혹한 짓을 잊지 않았어` | Recheck the subject and sense of “has not forgotten his brand of viciousness”; a reading that he remains cruel may be intended. | English is awkward; Japanese and Chinese describe continuing cruelty. Korean can instead read as his not forgetting past cruel acts. | Medium |
| 44133 | localized `{*1...}` markers and `{1}` | Preserve each marker identity and localized payload; note the Japanese-only order difference. | English, Chinese, and Korean order the two localized markers before `{1}`. Japanese puts `{1}` first. All three Korean marker identities and payloads are retained; no value is lost. | High |
| 44134 | “How bad are the casualties?” / `사상자는 얼마나 심각해?` | Consider asking how many/how severe the casualties are in idiomatic Korean. | The source asks about the extent of casualties; the current Korean makes the casualties themselves “serious,” which is awkward and may blur count/severity. | Medium |
| 44139 | `Adept` / `숙련자 계급` | Keep the rank provisional and align it with the established `숙련자` candidate pending terminology review. | The English explicitly awards the rank after the report; Japanese and Chinese use different mage-rank labels. Korean preserves the promotion event without dropping the title. | Medium |
| 44141 | Blackened Hall Trials / `검게 그을린 전당의 시련` | Confirm the proper-name form and whether `Trials` is a named set of trials. | The source capitalizes the location/event title; the localized names differ. Korean preserves both the Hall and trial sense. | Medium |
| 44145 | “I need to make sure I'm provided for. So I've done just that.” / `내 몫이 보장돼야 하니, 그렇게 해 뒀지` | Check whether `provided for` means securing resources for the role or taking a personal share. | English is self-serving but does not specify a personal cut; Japanese diverges, and Chinese explicitly says ensuring adequate resources. Korean `내 몫` may over-specify a personal share. | Medium |
| 44146 | “fights ... are to the death” / `목숨을 걸고 싸워야` | Preserve the warning that Arena fights are to the death, not merely dangerous. | Korean says combat requires risking one's life; English states that the fights end in death. Japanese describes life-risking combat, while Chinese says combat is to the death. | Medium |

IDs 44101-44102, 44105-44106, 44108-44109, 44111-44120, 44122,
44124-44126, 44128-44132, 44135-44138, 44140, 44142-44144, and
44147-44150 generally retain the English meaning on this first reading.
Names, ranks, UI labels, and lore terminology remain subject to integrated
review.

## Historical Audit Reconciliation

- The source-keyed historical section for IDs 44050-44149 was checked for
  placeholder status; Tine Delfric, Boggart, squire/thresh, and Kandrian;
  `Pride and Sorrow return`; Drefan/Winter Court; Sons of Laz; dark sigils
  and wards; `{*2{1}}`; Aodh/Adept; Dvergan smiths; Blackened Hall; Aryllia;
  Sandstone Villa; Valor Arena; and Shalarein Forstid/Jakin.
- The historical log specifically leaves these names, entity relations,
  item categories, and placeholder status open. No unresolved relation or
  canonical name was silently promoted to a confirmed finding.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 44101-44150 once
  and in identical ascending order.
- All selected rows have zero embedded line breaks; no hidden formatting
  characters were detected.
- ID 44133 retains the three runtime markers and their localized payloads.
  Japanese alone reorders the generic `{1}` marker ahead of the two localized
  markers; Korean follows English and Chinese.
- The 50% fire-damage reduction at 44112 and +25% Elemental Damage at 44122
  are retained. No other numeric-value discrepancy was found in the range.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 44101-44150 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 44151.
