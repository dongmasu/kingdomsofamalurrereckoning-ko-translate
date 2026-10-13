# Preliminary Language Scan: `default` IDs 33051-33100

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 33051-33100 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical questions, line breaks, runtime
  markers, values, and recurring terms.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 33055 | `심장` for figurative `heart` | Check whether this emotional metaphor should use `마음` rather than the bodily `심장`; preserve the image of a heart frozen by accumulated winters. | English uses `heart`, while Japanese and Chinese use their ordinary emotional-heart terms. Korean retains the freezing image but may sound anatomical. | Medium |
| 33057 | `복수의 가문` for `House of Vengeance` | Determine whether `House` is the named Fae faction and align this form with other House names. | English capitalizes the House; Korean uses a generic clan/house rendering. Historical audits repeatedly leave the formal faction name open. | Medium |
| 33061 | `흐느끼는 눈(Crying Eyes)` / `그걸 찾아야 해` | Preserve whether the named challenge denotes multiple eyes and whether the following pronoun refers to them collectively. | English says “find them”; Korean names the plural entity but follows with singular-form `그걸`. Japanese also treats the challenge as plural in its name. | Medium |
| 33066 | `그 법황` for `that one` | Confirm the identity before retaining the specific title `법황`; otherwise keep the English referent unspecified. | The English only says `that one`. Japanese supplies the same specific office, but neither the English row nor the Chinese translation identifies the person. This matches the unresolved historical question. | High |
| 33070 | `네 진짜 모습` for `your true state` | Keep open whether `state` means identity, condition, or physical form; do not settle the lore interpretation from this isolated challenge. | Korean selects “true appearance/form”; Chinese explicitly says “form,” while Japanese interprets the duel as a test of truth. The English phrase remains ambiguous and is already flagged historically. | Medium |
| 33071 | `다음 라운드` for `future rounds` | Preserve the possibility of benefits in later rounds without narrowing it to only the immediately next round. | English says benefits in future rounds; Korean says the next round. Japanese and Chinese retain the broader future-round scope. | Medium |
| 33075 | `도시 입장권` for `entrance to the city` | Check whether this means earning admission/access to the city rather than obtaining a literal ticket. | English says the addressee had to earn their own entrance; Japanese and Chinese describe admission/qualification. Korean's `입장권` can denote a physical ticket and may narrow the sense. | High |
| 33079 | Omitted opening `Well!` | Check whether the opening interjection should be represented to retain the speaker's abrupt, conversational reaction. | English opens with `Well!`; Chinese retains an affirmative exclamation, while Korean starts directly with the account. Japanese also omits it, so this is a voice/register candidate rather than a clear semantic loss. | Low |
| 33089 | Four-stanza gate inscription | Preserve all four verse lines, the separate attribution, and the Durek/mortal/Order/Chaos imagery; retain the unresolved poetic syntax. | English, Japanese, and Korean have five newline characters, including the blank separation before attribution. Chinese has four and lacks that blank separator. Korean follows English/Japanese structure; no source line is missing from Korean. | Medium |
| 33095 | `슬픔` for capitalized `The Sorrows` | Confirm whether `Sorrows` names a faction/entity or an abstract force, and standardize only after that distinction is established. | English capitalizes the plural name; Japanese and Chinese also use a named/collective form. Korean renders it as ordinary “sorrow.” The historical audit explicitly leaves its entity status open. | Medium |
| 33096 | `학회` for `the Circle` | Identify which Circle is meant and whether the Korean term should denote a formal order or scholarly society. | English leaves the organization as `Circle`; Japanese says a circle/order and Chinese uses a religious sect. Korean selects an academic society, which may be more specific than the source. | Medium |
| 33097 | `{*5Level {1} of {2}}` | Verify whether the localized marker payload should remain in English or use a Korean level label; preserve wrapper, nested values, and order exactly. | Korean matches the English payload verbatim. Japanese and Chinese localize the word “Level” while retaining the marker form and `{1}`/`{2}` values. This is a payload-localization question, not a wrapper-structure mismatch. | Medium |
| 33100 | `+{1}% {2} {3}` | Preserve the three values and English token order; check the display spacing in the integrated UI pass. | English, Chinese, and Korean order `{1}`, `{2}`, `{3}` identically; Japanese alone moves `{1}` to the end. Korean retains the English space after `%`; Chinese omits it. | High |

IDs 33051-33054, 33056, 33058-33060, 33062-33065, 33067-33069,
33072-33074, 33076-33078, 33080-33088, 33090-33094, 33098-33099 generally
retain the English meaning on this first reading. Name spellings, faction
terms, register, and source-context questions remain integrated-pass
candidates; no other distinct wording concern was identified.

## Historical Audit Reconciliation

- The source-keyed historical entry for IDs 33000-33099 was checked against
  the active rows. The `that one` referent at 33066, `true state` at 33070,
  Crafter-lot insult at 33079, Durek inscription at 33089, and Sorrows
  referent at 33095 remain unresolved as previously recorded.
- The historical entry for IDs 33100-33199 was checked for ID 33100. Korean
  follows the English marker order; Japanese alone reorders the numeric
  placeholder.
- The 33097 marker payload is still a terminology/localization question.
  The wrapper and nested value sequence remain intact in Korean.
- No historical question was treated as authorization to edit the CSV.
  Findings remain candidates for integrated review.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 33051-33100 once
  and in identical order.
- Embedded line-break counts match except ID 33089: English, Japanese, and
  Korean have five newline characters; Chinese has four.
- The nested marker at ID 33097 is preserved as `{*5Level {1} of {2}}` in
  Korean. At ID 33100, Korean preserves `{1}`, `{2}`, `{3}` in English order.
- Active Korean CSV hashes remain at their recorded checkpoint values.
- No CSV text or source file was edited.

## Batch Status

IDs 33051-33100 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue with `default`
ID 33101.
