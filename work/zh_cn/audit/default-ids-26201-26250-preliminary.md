# Preliminary Language Scan: `default` IDs 26201-26250

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 26201-26250 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 26201-26206, 26208, 26210, 26215, 26217 | Alabon / Bareth / Ciara Sydanus / Steg and Hrindi / Ayten / Eldric Orhelm / Bodine Borgue / Alserund / Detyre | Verify proper-name spellings and maintain consistent Korean-plus-English marking where the project's display convention calls for it. | Korean keeps the named characters and locations identifiable. At 26217, “it seems doubtful he ever found Borgue” and “most likely, he was unprepared” are two separate inferences; the Korean wording compresses them into a stronger “found him, let alone...” construction. Recheck against the English before any disposition. | Medium |
| 26202-26203, 26206, 26213, 26216, 26219-26220, 26228-26230, 26237, 26242-26244, 26247-26249 | Dialogue voice, politeness, and idiom | Recheck register against character/context, especially “principles of Adessa” (26203), “Dumb as a plank” (26210), “quick-like” (26242), and the abrupt recollection at 26244. | Korean generally preserves the conversational intent. At 26203, “원칙 그 자체” is a literal abstraction where English/Japanese/Chinese may refer to Adessa's foundational principles or guiding body; context is needed. Do not treat a smoother candidate as approved. | Medium |
| 26207, 26214, 26235, 26240-26241 | Hammer stats / skill label / Alchemy Workbench / controller instruction / venom attacks | Preserve numeric values, labels, and the complete named-icon token. | Korean retains +14 Physical Damage and +25% Damage with Hammers on separate lines. At 26240, all locales contain `#NAMED_ICON_360_A#`; the Korean control instruction keeps the token and meaning. | High |
| 26209 | Winter's Embrace | Inspect and remove or disposition the trailing invisible format character only in a separately approved editing pass. | Chinese text ends in U+FEFF after `冬之抱拥`; English, Japanese, and Korean do not show the same character. It is outside the Korean draft, but is recorded as a source-locale structural artifact. | High |
| 26217-26218, 26221-26222, 26225-26227, 26232-26239, 26243, 26245, 26248, 26250 | Names, quest labels, and short UI/dialogue | Align place, faction, and objective terms with established project forms; short strings need their UI/dialogue context retained. | Existing historical questions already inventory the names in this range, including the Togh Farm/business ambiguity, Hierophant, Dellach, and Gwyn Anwy. The preliminary pass does not resolve these glossary decisions. | Medium |
| 26222, 26231, 26233-26234 | Hierophant / Delvers / Adessa mining interest / Leanashe | Preserve lore sense and distinguish title, group, creature, and generic industry readings. | ID 26231 again uses the unresolved formal role `Delvers`; Korean transliterates it as `딜버`. The historical audit repeatedly flags this term and the nature of Sorrows, so it should be decided with those related entries rather than locally. ID 26233's “most powerful ... interest” is rendered as a large mining force, which may need contextual review. | High |
| 26224, 26246 | Two quoted verse/lore passages | Review imagery, poetic voice, quote encoding, and line/paragraph layout together. | At 26224, Korean contains literal `\\\"` sequences around the verse while the source uses ordinary quotation marks; verify whether the backslashes are intended runtime escapes or visible characters. ID 26246 preserves the five paragraph blocks and embedded stanza break; its English, Japanese, Chinese, and Korean quote glyphs differ by locale. | High |

## Historical Audit Reconciliation

- The preserved historical question log already groups IDs 26201-26206,
  26210, 26215, and 26217 for proper-name checks; IDs 26222, 26231-26234,
  26236-26237 for Hierophant/Delvers/Sorrows and related terms; and IDs
  26224 and 26246 for poetic review.
- The historical log also groups ID 26240 with controller-token checks and
  flags the token, names, and locations through IDs 26250-26252. This pass
  confirms the token identity at 26240 but does not make glossary decisions.
- Cross-checked recurring forms for Bareth, Steg, Hrindi, Ayten, Eldric
  Orhelm, Bodine Borgue, Alserund, Detyre, Delvers, Leanashe, Hierophant,
  Gwyn Anwy, and the House of Sorrows.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 26201-26250 exactly
  once and in identical order.
- Embedded line-break counts match across all four locales, including the
  quoted multi-paragraph entry at ID 26246.
- Extracted runtime-token signatures match. At ID 26240, the icon token is
  intact in every locale.
- Numeric values and ordering in the hammer bonus at ID 26207 are preserved.
- Chinese ID 26209 has a trailing U+FEFF. Korean ID 26224 has literal
  backslash-quote sequences; both are recorded for follow-up, not silently
  changed.
- Korean wording and all translation/source CSVs were not edited.

## Batch Status

IDs 26201-26250 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 26251.
