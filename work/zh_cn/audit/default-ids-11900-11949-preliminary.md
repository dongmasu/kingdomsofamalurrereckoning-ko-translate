# Preliminary Language Scan: `default` IDs 11900-11949

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 11900-11949.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 11906 | Long Naros history entry begins `.에틴` | Check the leading period and preserve the English/Japanese paragraph structure; verify the names and the source's “baited breath” phrase. | Korean carries a literal leading period from the English source's `.With`; the opening punctuation is likely a source artifact. The translation preserves the narrative and paragraph breaks. English has the typo-like `baited breath`; Japanese and Korean convey breathless anticipation. Historical notes already flag the names and opening punctuation. | High |
| 11913 | `dog-face` → `멍청아` | Determine whether this is a direct insult, familiar address, or a nonhuman/racial insult; preserve the speaker's abrasive tone. | English explicitly uses `dog-face`; Korean substitutes a generic “idiot.” Japanese rewrites the insult, while Chinese uses a military/address term, so the exact force is unsettled. Historical notes already flag this. | Medium |
| 11917 | Brad and Cergren contract / 443 pikes / 50 rounds of cheese | Verify that this is a witnessed trade agreement and clarify the unit and contract phrasing without changing its quantities. | Korean preserves the parties, 443 guard pikes, 50 Kandri cheeses, 12 wine casks, and balancing gold. The English is compressed and grammatically rough; Japanese and Chinese smooth it differently. Historical notes already flag the document form and cheese unit. | Medium |
| 11922 | `Compliance Testing` → `규정 준수 테스트` | Determine whether this is a player-facing UI label or an internal test string before deciding whether the literal translation is appropriate. | English and Japanese leave the label in English; Chinese translates it and Korean renders it literally. The isolated row provides no visibility/context. | Low |
| 11923 | `Manic Pixie Dream Elf` | Confirm whether to retain the English pop-culture parody alongside the Korean-script rendering. | Korean transliterates the phrase and includes its English spelling in parentheses. Japanese retains the English phrase; Chinese translates it more freely. Historical notes already flag the display choice. | Medium |
| 11931 | `Right now? No.` | Clarify the fragment's implied question while retaining the reassurance that the player may have saved both speakers. | Korean keeps the abrupt question-and-answer form and the probable meaning. Japanese and Chinese also leave the implied question unresolved. Historical notes already flag it. | Medium |
| 11932 | `Flawless Mitharan Illuminator's Handle` | Verify the item-name components and established Korean forms for Mitharan Illuminator. | Korean preserves the item relation and includes the English name, but the isolated row does not establish the canonical transliteration. Historical notes already flag it. | Medium |
| 11942 | `catch the Well` → `샘을 찾아야 한다` | Determine whether “catch” means locate, reach, or capture the Wandering Well; keep the bark-to-water objective distinct from finding the Well. | English says `catch the Well`, while Japanese and Chinese paraphrase this as finding the spring. Korean follows the supported locate/find reading. Historical notes already flag the ambiguity. | Medium |
| 11947 | `Helmgard humbly welcomes you` → `겸손한 마음으로 그대를 환영하오` | Check whether the humility belongs to Helmgard/the speaker's humble welcome or is intended as a manner adverb; align register with the speaker. | Korean is understandable but the modifier can sound like the act of welcoming is humble. Japanese has a deferential welcome and Chinese implies welcoming someone to a humble home; the references do not settle the exact construction. | Low |

## Historical Audit Reconciliation

- Rechecked archived questions at IDs 11906, 11913, 11917, 11923, 11931,
  11932, and 11942 against the active Korean and all three source locales.
  They remain open; historical notes were treated as evidence, not approval.
- Name spellings in the long ID 11906 passage remain provisional. This batch
  does not establish canonical bilingual-display rules for proper names.
- No translation change is authorized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain all 50 IDs in
  identical order. Each full `default` file contains 65,135 rows.
- Parsed CSV-record line-break counts and runtime-token sequences match
  across all four locales in this range. No structural exception was found.
- Proper names use mixed selective English-parenthetical marking in the
  active Korean; this is recorded as a consistency question, not a request
  for global normalization.
- Official Korean manual terminology could not be independently searched
  during this pass. Active Korean CSV hashes match the recorded baseline;
  no active CSV was edited.

## Batch Status

IDs 11900-11949 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 11950-11999.
