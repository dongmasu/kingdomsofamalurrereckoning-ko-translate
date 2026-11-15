# Sequential `default` Revalidation: IDs `11500`-`11749`

- Date: 2026-11-11.
- Scope: compare active Korean with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Sixty-three existing ledger records were retained after their
  four-language fingerprints were verified. The other 187 IDs were compared
  and added.
- Three newly recorded IDs have correction candidates. Four retain
  evidence-limited findings; ID `11599` appears in both groups because its
  terminology inconsistency is identifiable while several mining terms
  remain unresolved.
- Of the 187 new IDs, 136 have indexed quest-asset links and 51 do not.
  Five IDs link to multiple assets. Asset association does not establish an
  individual speaker or playback order.
- No translation CSV, source resource, or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `11572` | Meaning / naturalness | `I owe you my life` is rendered `내 목숨을 빚졌어`, which leaves the person owed implicit and sounds incomplete in Korean. Japanese paraphrases this as thanks for not being killed, and Chinese explicitly says the speaker owes the listener a life. Consider `네 덕분에 목숨을 건졌어` or `네게 목숨을 빚졌어`, preserving the relieved, informal tone. | Medium-high |
| `11599` | Terminology | The mining journal calls workers `groovers`, rendered `그루버`. The same English term at `default:19029` is rendered `홈 파는 광부`; consider aligning the role wording after confirming the intended mining job. The journal's `assayer` is rendered `분석사`, while `default:14767` uses `감정사` for the same occupation; consider consistent wording. These cross-reference rows were inspected for terminology but were not added to this batch. | Medium |
| `11678` | Naturalness | The opening sentence stacks possessives in `아포타이어(Apotyre)의 스코리아 가문(Skoria family)의 광산에 대한`. Consider recasting it as the official deed for the Skoria family mine in Apotyre, then keep the following sentence for Adath Skoria's ownership and the holder's rights. The facts and legal scope are otherwise represented. | High |

These are review proposals, not authorization to edit the translation CSV.

## Evidence-Limited Findings

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `11599` | Meaning / terminology | The journal uses specialized mining terms including `Sinker`, `stope`, `long wall shaft`, `stulls`, `pit eye`, `overburden`, `hewers`, `tailings`, and `banksman`. English, Japanese, and Chinese do not consistently resolve every role or feature. Preserve the current wording provisionally except for the cross-ID terminology candidates above; do not guess a unified technical glossary from this one entry. |
| `11683` | Meaning / title | The isolated `Oathblade.` is rendered literally in English and Chinese, while Japanese gives `一等傭兵` (“first-class mercenary”). Without surrounding dialogue or a verified title mapping, retain the current Korean form. |
| `11689` | Meaning / institution | English says `our order`; Japanese identifies a university, while Chinese says a sect. Korean's general `조직` avoids choosing among these readings. Keep the institutional identity unresolved. |
| `11743` | Meaning / imagery | The poem's `Opposition` and the clause about rewarding mysteries beneath “Her hidden vision” remain cryptic; Japanese and Chinese also differ in how they construe them. Preserve the existing wording and line layout rather than inventing a faction or doctrine. |

The Chinese source at `11573` says “draw/tie,” while English and Japanese
specify “even” and Korean says `짝수`; this is a source-locale discrepancy,
not a Korean correction candidate. ID `11691` directly identifies the
speaker as Sister Twayn (`Sister Twayn, I am called`). No other individual
speaker or playback order was assigned.

## Duplicate and Structural Checks

- Forty-three exact-English duplicate groups touch the 187 new IDs,
  comprising 665 rows across the corpus. Korean text matches in every group.
- Runtime placeholders, named variables, layout tokens, display-wrapper
  identifiers, brace balance, and logical line-break counts match across all
  four languages for all 187 new IDs.
- Six Korean strings contain 30 existing embedded CRLF breaks:
  `11599` (13), `11647` (1), `11654` (4), `11688` (2), `11735` (4), and
  `11743` (6). Their logical line-break counts match the language references;
  the existing bytes were preserved.
- Speaker evidence is recorded only for the direct textual self-identification
  at `11691`. Asset membership does not establish speakers or dialogue order.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
