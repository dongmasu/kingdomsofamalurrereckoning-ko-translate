# Preliminary Language Scan: `default` IDs 47401-47450

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 47401-47450 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 47409 | aggregate information / `취합해 분석합니다` | Confirm whether Korean should describe aggregation only or also analysis. | English says the speakers aggregate information; Korean adds that they analyze it. Japanese and Chinese describe collecting/aggregating the gathered information without an explicit analysis step. | Medium |
| 47413 | “Keep your nose clean” / `조심하게` | Preserve the idiom's sense of staying out of trouble, rather than reducing it to a general warning. | English uses an idiom meaning to avoid wrongdoing/trouble. Korean says “be careful”; Japanese says not to get involved in strange things, which is closer to the contextual warning. | Medium |
| 47415 | Revival / `리바이벌` | Keep the name-vs-description question linked to IDs 47322 and 47370. | English uses `In Revival` for the community that cares for one another; Korean treats it as a place/name. The historical notes flag the refugee camp's name, and this use supports but does not conclusively prove that reading. | Medium |
| 47419 | Weeping King's Hollow / `비탄왕의 골짜기`; “Not for your end goal” | Clarify the relation between the location and the speaker's “end goal” while retaining that both people know the Hollow. | Korean preserves the two claims but `최종 목표를 위한 건 아니야` leaves the source's elliptical relation unresolved. The historical note explicitly flags this line. | Medium |
| 47426 | broken source punctuation / `아직 돈은 내셔야 해요, 흠!` | Preserve the likely meaning that payment is still required, but do not treat the source's broken word order as authoritative. | English has disfluent punctuation and order (`still, hm! be paid for`); Japanese and Chinese recast it as a direct payment statement. Korean follows that likely reading and retains a hesitation. | Medium |
| 47430 | squire / `종자`; intense relationship innuendo | Check the role/register of `squire` and retain the deliberately suggestive exchange. | The English asks the addressee to be a squire, then implies an intense relationship and many moonlit evenings. Korean preserves both the retainer sense and innuendo; the exact rank/term remains open. | Medium |
| 47433 | “dead as an old stone” / `오래된 돌처럼 죽어 버렸어` | Verify whether this is an intentional idiom or a source-specific metaphor and retain the speaker's grief for a dear friend. | Korean follows the unusual image literally. Japanese paraphrases the friend's death and Chinese also keeps the stone comparison; the source wording may be intentionally odd. | Medium |
| 47434 | Special Delivery Acquired / `특급 배송품 획득` | Confirm whether this is a player-facing item/UI notification and what `Special Delivery` names. | The isolated title-like English string does not establish whether this is an achievement, quest notification, or item acquisition. The historical log leaves its UI role open. | Medium |
| 47443 | “Or, we did” / `아니, ... 전까진 그랬지` | Preserve the fragment's corrective/self-revising tone and clarify the antecedent of “did.” | The English starts with a fragment and then refers to the scav infestation; Korean uses `아니` (“no”) and maintains the before/after contrast. The preceding context is needed to settle the exact antecedent. | Medium |
| 47445 | `#NAMED_ICON_JUSTFRAME#` | Determine whether the unchanged sentinel is intentional game text or a test/debug artifact. | All four locales retain this exact token-like string. The historical audit already flags it as a likely test/debug string; it is preserved without interpretation. | High |

IDs 47401-47408, 47410-47412, 47414, 47416-47418, 47420-47425,
47427-47429, 47431-47432, 47435-47442, 47444, and 47446-47450 generally
retain the English meaning on this first reading. Proper names and gameplay
terms remain subject to integrated review.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs 47350-47449. It flags
  canonical names, `Dverga`, the `Widow` label, `Hierophant Shrine`,
  `squire`, “dead as an old stone,” the UI role of `Special Delivery
  Acquired`, source punctuation at 47426, the interrupted line at 47381,
  the announcer line at 47382, Weeping King's Hollow, and
  `#NAMED_ICON_JUSTFRAME#` at 47445.
- The historical notes identify `Israel` at 47364 and `United States of
  America` at 47425 as source strings whose intentional use remains open.
  Their Korean forms are retained literally.
- ID 47445 is identical in all four locales and was not treated as a
  translation correction target.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 47401-47450 once
  and in identical ascending order.
- No embedded line breaks, brace-style runtime tokens, or special hidden
  whitespace occur in this batch.
- ID 47445's `#NAMED_ICON_JUSTFRAME#` sentinel is identical across all four
  locales. No structural exception was found.
- Source names, the `+`/level notation in neighboring entries, and the
  existing `Sky Blossom`, `Revival`, `Lykeios`, `Ljosalfar`, and `Camp
  Moondown` forms remain subject to corpus-wide terminology review.
- No translation CSV or immutable source file was edited.

## Batch Status

IDs 47401-47450 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 47451.
