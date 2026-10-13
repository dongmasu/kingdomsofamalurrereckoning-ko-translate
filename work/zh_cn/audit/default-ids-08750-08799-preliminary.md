# Preliminary Language Scan: `default` IDs 8750-8799

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 8750-8799.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, and applicable historical questions in
  `from-ja_jp/open-questions.md`.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 8752 | Coriana verse fragment | Preserve the conditional, unfinished structure and clarify the relation between her flourishing house and the speaker's withering soul. | English repeats an incomplete `If...` construction. Korean turns the first clause into a past assertion and recasts the final conditional; Japanese and Chinese also differ in how they attach the final clauses, so retain the source ambiguity for context review. | Medium |
| 8754 | `interested in you` → `널 찾는 사람` | Check whether Korean should convey interest rather than actively searching for the player; verify Jorielle's feminine reference without forcing an unnatural pronoun. | English and Japanese say Jorielle is interested in the player, while Korean says she is looking for them. Chinese also says she is interested. | High |
| 8760 | `Domus Politico` → `정무원` | Confirm the institution's official Korean name and whether the source title should remain traceable in parentheses. | English supplies the Latin-like institution name; Japanese and Chinese localize it differently. The Korean gloss is plausible but not established by these references. | Medium |
| 8761 | `sanctified buttress`; Lyria passage | Check the logical relation in `If I am a liar...` and whether `buttress` names a literal support or the sacred grounds; preserve the verse's lineation. | English says “If I am a liar, there is no truth under Lyria,” while Korean reverses/reframes this as “if there is no truth under Lyria, this too is a lie.” The closing image is rendered literally as `신성한 버팀벽`; Chinese interprets it as a sanctuary and Japanese as a retaining wall. Four embedded line breaks match all locales. | High |
| 8773 | `Cowl of the Maiden` → `시녀의 두건`; `You're a Traveler` | Verify whether `Maiden` is a title/name or a young woman, and whether the Korean wording accidentally attaches the Traveler identity to a guild. | English distinguishes being a Traveler from stealing the Cowl of the Maiden. The Korean phrase `트래블러스고 시녀의 두건` is difficult to parse and appears to introduce a Travelers' Guild relation not stated here; Japanese says “maiden's hood,” while Chinese uses “maiden's cloak.” | Medium |
| 8779 | `Don't make a moment a day` | Confirm the intended impatience and whether the Korean paraphrase should retain the “don't make this take all day” image. | The Korean `빨리 끝내` communicates urgency, but changes the unusual source idiom. Japanese and Chinese independently convey waiting no longer / not wasting time. | Medium |
| 8780 | `Scholia Arcana` → `아르카나 학회` | Reconcile the institution's Korean name and transliteration across the corpus before standardizing. | The same draft also uses `아르카나 학회`, `숄리아 아르카나`, and `스콜리아 아르카나`; Japanese reads “Arcana University” and Chinese “Arcane Academy.” This row is a consistency question, not an approved replacement. | High |
| 8786 | `Compliance QA Testers` retained in English | Determine whether this is an internal QA string or visible player-facing text; retain traceability until classified. | English and Japanese retain the exact English label, while Chinese translates it. The active Korean's unchanged English is plausible for a development string but not confirmed as intended runtime behavior. | Medium |
| 8795 | `Ragnall's Heroon` → `라그날의 영웅 사당` | Verify the site's name and whether `Heroon` should be transliterated or described as a shrine/tomb. | Japanese says “Ragnall's monument,” Chinese says “Ragnall's tomb,” and the English term can designate a hero's shrine or tomb. The isolated row does not settle the site's function. | Medium |

## Historical Audit Reconciliation

- Rechecked historical questions for IDs 8752, 8760, 8761, 8779, 8786, and
  8795 against all four active language rows. Their uncertainty remains open.
- Added current-row concerns for IDs 8754, 8773, and 8780 after direct
  comparison with English, Japanese, Chinese, and related Korean terminology.
- Historical candidates remain evidence only; none authorizes a translation
  edit.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean, with
  identical keys and order.
- Actual CSV record line-break counts match across all four locales. ID 8761
  has four embedded line breaks in each.
- Runtime-marker IDs and order match across all four locales; no marker or
  named-icon exception was found in this range.
- `work/zh_cn/locatexts_zh_cn.koalocatext_default.csv` remains at the
  checkpoint SHA-256 recorded in `preliminary-work-20261007.md`.
- Official Korean manual terminology was not independently searchable in
  this environment; do not treat the name questions above as settled.

## Batch Status

IDs 8750-8799 received one preliminary reading. Findings are candidates and
open questions only; they are not confirmed review dispositions and do not
authorize edits.
