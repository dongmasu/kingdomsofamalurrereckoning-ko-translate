# Sequential `default` Revalidation: IDs `14750`-`14999`

- Date: 2026-11-11.
- Scope: compare active Korean with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Seventy-four existing ledger records were fingerprint-checked; all match
  the current four-language sources. Two earlier `not-issue` dispositions
  were reopened based on this pass.
- The other 176 IDs were reviewed and added to the ledger. Eight correction
  candidates and one evidence-limited hold were recorded.
- Of the 176 new IDs, 125 have indexed quest-asset links and 51 do not; five
  link to multiple assets. Asset associations do not establish an individual
  speaker or playback order.
- No translation CSV, source resource, extracted game asset, or localization
  binary was changed.

## Correction Candidates

These findings are review proposals, not authorization to edit the active
translation CSV.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `14831` | Speech level / naturalness | The first two clauses use conversational plain endings (`사과하지`, `예상 밖이었어`), but `토론해 보세` abruptly shifts to 하게체. Japanese `討論を始めよう` is a plain invitation. Consider `토론해 보자` to keep the same conversational register. The linked asset has handlers but no NPC symbol or per-key speaker mapping; this is a row-internal register finding, not a speaker attribution. | High |
| `14840` | English pairing | `Llyrgryf` is rendered as `릴리르그리프` without the source name, while other active rows pair this shop/name with English. Consider adding `(Llyrgryf)` to this occurrence. Korean renderings elsewhere vary (`리르그리프`, `릴그리프`, `릴르그리프`), so this proposal does not choose a canonical Korean transliteration. | Medium-high |
| `14841` | Speech level / naturalness | The Korean moves from `성가시구나` to `짜증거리야` within one utterance. Japanese expresses the same disdain in a consistent conversational voice. Consider smoothing the sentence endings into one register without assigning the line to a particular NPC; its linked asset contains multiple NPC symbols and does not map this key to a speaker. | Medium |
| `14850` | Speech level | `감명받았다는 건 아니야. 아니` is conversational plain style, but `더 정확하겠군` shifts to 하게체. Japanese `好奇心というほうが近いな` remains plain. Consider `호기심이 생겼다는 말이 더 정확하겠지.` | High |
| `14903` | Speech level / naturalness | Reopened from the earlier `not-issue` disposition. The passage otherwise uses conversational endings (`많아졌어`, `없어`, `보상이야`), but `미안하네` and `일해야겠군` shift to 하게체. Japanese keeps a conversational masculine plain style throughout. Consider smoothing those two clauses to the surrounding plain register; no individual speaker is inferred from the linked asset. | Medium-high |
| `14922` | Honorific / English pairing | Reopened from the earlier `not-issue` disposition. The English label is `Ambassador Keen`; the active Korean `킨 대사(Keen Ambassador)` reverses the title/name order inside the parenthetical. The established form is `킨 대사(Ambassador Keen)`. | High |
| `14967` | Terminology / naturalness | `Infrequent` is rendered `비일반`, which is awkward and conflicts with the same salvage screen at `43919` (`비흔한`) and the rarity explanation at `35567` (`흔하지 않음`). Consider using the established `흔하지 않음` tier and inflecting it naturally in this sentence, e.g. `{*4흔하지 않은} 아이템`. Preserve the `{*4}` wrapper and its localized content. | Medium-high |
| `14991` | English pairing / source scope | English abbreviates the reference to `the House`, while Japanese explicitly says `ハウス・オブ・バラッド` and Chinese says the family territory. Korean uses `발라드의 집` but omits English. If retaining the full faction rendering supported by the Japanese and story context, consider `발라드의 집(House of Ballads)`; do not treat the English wording alone as spelling out the full name. | Medium |

## Evidence-Limited Hold

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `14795` | Meaning / unit | English says the lockpicking skill increases `by 3` without naming a unit; Japanese specifies three levels, while Chinese says three points. The current unit-neutral `3 상승` avoids choosing between conflicting references. Retain pending stronger evidence. |

## Source and Structural Checks

- Sixty-four exact-English duplicate groups touch the range, covering 1,042
  rows across the corpus. Korean text matches in every group.
- Runtime arguments, named variables, layout tokens, and display-wrapper
  identities and order match across all four locales. Localized text inside
  display wrappers differs where expected, including the rarity label at
  `14967`.
- Logical line-break counts match across all four locales for all 176 new
  IDs. Five Korean rows contain 16 existing CRLF breaks: `14774` (5),
  `14842` (4), `14941` (3), `14986` (3), and `14990` (1). Their line breaks
  were not changed.
- Speaker attribution and playback order remain unknown unless separately
  supported by direct evidence. No asset association or handler was treated
  as per-key speaker or order evidence.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
