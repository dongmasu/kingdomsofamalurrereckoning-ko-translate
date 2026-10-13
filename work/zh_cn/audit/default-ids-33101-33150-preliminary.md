# Preliminary Language Scan: `default` IDs 33101-33150

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 33101-33150 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 33105 | `감옥도 필요 없어요` for `have no need for it` | Keep the antecedent of `it` unresolved and check whether English actually identifies a prison; avoid adding that referent unless context supports it. | English refers back to an unstated `it`; Japanese explicitly supplies a prison, but Chinese leaves it general. Korean follows the Japanese interpretation. The sentence's `bar Galafor from all refugees` is itself unclear. | Medium |
| 33108 | `{*1chakrams}`, `{*1Chakrams}`, `{*1mages}` | Preserve all three wrappers and their order; verify whether the payload terms should be localized consistently with the surrounding Korean item/tutorial text. | Korean retains the English payloads exactly. Japanese and Chinese localize the payloads, and the visible Korean sentence translates chakrams and mages outside the markers. Marker count and sequence match. | Medium |
| 33117 | `바람의 성소` for `Air Shrine` | Check whether `Air` is the game's elemental term “Air” or ordinary wind, and standardize shrine/temple terminology. | English names an Air Shrine; Japanese and Chinese use air/sky sanctuary terms. Korean uses “wind,” which may be narrower or less consistent with elemental terminology. | Medium |
| 33130 | `몇 걸음` for `several yards`; `보름 안에` for `by fortnight's end` | Preserve the source's distance and two-week deadline without changing units or duration; retain the 18-paragraph joke/story structure and healer's-kiss double entendre. | Korean changes an unspecified distance of several yards to several steps. `Fortnight` means two weeks, while `보름` conventionally denotes about 15 days. The full story's 34 newline characters match across all four locales; names, magical terminology, source typos, and comic intent remain integrated-pass questions. | High |
| 33131 | `데드 켈이 자식으로 생겼지` for `Dead Kel for an offspring` | Resolve only with broader story context whether Dead Kel is described as the offspring or whether another relation is intended; do not infer family details from this fragment. | English is grammatically unclear. Korean chooses a child/offspring reading, as does Chinese, while Japanese instead says Dead Kel appeared. The historical question explicitly leaves this open. | High |
| 33137 | `여름 궁정` for `Summer Court` | Confirm the canonical display form and retain the group's self-description as embodiments of courage, honor, brightness, and pride. | Korean preserves the claim and list, but named Court terminology is a recurring glossary question. | Low |
| 33141 | `드베르가제 망치` for `Dvergan hammer` | Standardize Dvergan/Dverga and the Aster/Rathir name forms while retaining the gift's timing and unblemished condition. | Korean preserves the item's age and condition. The species/adjectival form and proper-name spellings remain inconsistent terminology candidates. | Medium |
| 33142 | `히에로판트` / `반대하는 자들을 모두 내쫓고 있다` | Preserve that the Hierophant is seizing power and dismissing opponents; confirm the character and office change from context without assigning a gender to singular `them`. | Korean's subject/object phrasing remains gender-neutral and does not resolve the referent. The historical log asks for the identity and office change; the active row itself does not settle them. | Medium |
| 33143 | `싸우고 나서야` for fragment `After fighting nearly all my life.` | Keep the speaker's lifelong-fighting reflection, but check whether `-고 나서야` adds an unintended “only after” culmination to the fragment. | English is a fragment followed by a separate sentence; Korean preserves the ellipsis but adds a “not until after” nuance. Japanese and Chinese also render it as a completed thought. | Low |
| 33146 | `대개 더 위험합니다` for `more dangerous than most` | Preserve the comparison with most enemies rather than turning it into a general-frequency statement. | English compares orange-name enemies with most others; Korean says they are generally more dangerous. Japanese and Chinese retain the comparison. | Medium |
| 33149 | `Cyprus` / `사이프러스 나무들`; ornate Lyria-Tirin prophecy | Check whether the source means cypress trees rather than Cyprus; preserve the rocky-spur, heavenly-mount, sea-spire imagery and all three verse sections without resolving malformed syntax by invention. | English capitalizes `Cyprus` in a tree context, while Japanese/Chinese use a cypress/Cyprus rendering. Korean chooses cypress. The English, Japanese, Chinese, and Korean rows all retain nine newline characters. This matches the historical question. | Medium |
| 33150 | `Scholia Arcana ... 라시르 지부` for `Rathir chapter house` | Determine whether this is the institutional branch or its chapterhouse building, and retain the summons to report to Archsage Jubal Caledus. | Korean renders the place as a branch; Chinese calls it a chapel, and Japanese describes a Rathir branch. Prior audits repeatedly leave `Chapter/Chapterhouse` as a branch-versus-building question. | Medium |

IDs 33101-33104, 33106-33107, 33109-33116, 33118-33129, 33132-33136,
33138-33140, 33144-33145, 33147-33148 generally retain the English meaning
on this first reading. Proper-name spellings, faction/rank terminology,
register, and context-sensitive nouns remain integrated-pass candidates; no
other distinct wording issue was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 33100-33199 was checked against
  this range. The Dead Kel offspring phrase at 33131, singular `they` and
  Hierophant referent at 33142, and Cyprus/cypress ambiguity at 33149 remain
  open as recorded.
- The historical question about the 18-paragraph tale at ID 33130 was
  checked. Korean retains all 34 newline characters and the overall story
  sequence; the distance and fortnight wording are additional comparison
  candidates.
- The Scholia Arcana chapter-house question at ID 33150 recurs in earlier
  historical ranges; those entries remain terminology evidence, not a
  disposition.
- At ID 33108, Korean preserves the wrapper count and order. Payload
  localization remains open and is not a wrapper-structure mismatch.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 33101-33150 once
  and in identical order.
- Embedded line-break counts match across all four locales throughout the
  range. ID 33130 has 34 newline characters; ID 33149 has nine.
- ID 33108 preserves three marker wrappers in the same order in every locale;
  payload text is localized in Japanese/Chinese but not in Korean.
- Active Korean CSV hashes remain at their recorded checkpoint values.
- No CSV text or source file was edited.

## Batch Status

IDs 33101-33150 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 33151.
