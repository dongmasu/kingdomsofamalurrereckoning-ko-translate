# Preliminary Language Scan: `default` IDs 17550-17599

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 17550-17599.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, historical open questions, and recurring names.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 17552 | Beckoned / tribute to the gods | Preserve the address and explanatory reason for proper conduct in Idylla. | Korean retains both parts and the formal imperative; Japanese omits the title while English and Chinese retain it. | Low |
| 17556 | Undying / exotic Ice beasts | Verify whether Undying is a named people/group and standardize capitalization/terminology. | Korean retains the limited knowledge and indirect book references; locale terms vary between immortal beings and undead. | Medium |
| 17558 | `+3% Chance to Steal 5 Health` | Preserve the chance, percentage, and five-health amount with unambiguous word order. | Korean includes `+3%`, health stealing, and `5`, but the trailing number's relation to the effect is awkward/unclear. | High |
| 17562 | The Telling | Determine whether this is a named institution, event, or lore/prophetic concept. | Korean uses `전승`; English capitalization, Japanese `伝承`, and Chinese “epic” leave the specific sense unsettled. | Medium |
| 17563 | Sagecraft help text / localized markers | Preserve marker order and layout; check one Chinese-only extra marker. | English, Japanese, and Korean have one `{LINE_LEFT}` before the Shards heading; Chinese has two. Localized `{*...}` labels differ as expected, while section order and the other markers align. | High |
| 17566 | amulet / ownership / prize | Preserve the blunt distinction between ownership and intent to claim the prize. | Korean retains both clauses and the speaker's possessive tone; references agree on the core meaning. | Low |
| 17569 | “more of a game than usual” | Preserve the speaker's implied contrast while leaving the referent of “game” unstated. | Korean keeps the indirect, conversational phrase; Japanese gives a different “not really a game” reading, so context remains necessary. | Medium |
| 17570 | Outlanders / “glad to see the back of him” | Keep the plural group reference distinct from the later singular “he,” as in the source. | Korean uses plural “Outlanders” then singular “he”; this apparent number shift is present in English too. | Low |
| 17577 | fate / War / `it` lasting a thousand years | Retain the conditionals and leave the referent of `it` implicit. | Korean preserves the conditional survival and thousand-year duration without inventing what will endure. | Medium |
| 17583 | Basilica Gnostra | Standardize the institution's Korean form. | Korean has `바실리카 노스트라`; earlier rows use variants for Basilica Gnostra, so this is a corpus consistency question. | Medium |
| 17591 | Wildfrold / Summer and Winter Courts | Verify the historian's spelling and align Court terminology. | Korean preserves that these notes are a partial account of the only conflict; name and faction forms vary. | Medium |
| 17597 | “subtlety to decay” | Preserve the range of darker natural truths without replacing subtlety with a different trait. | Korean uses `교활함` (“cunning”) for `subtlety`; English/Japanese/Chinese point more generally to subtlety/subtle nature. Potential meaning shift. | Medium |
| 17599 | prismere side effect / basin shape | Retain the speaker's tentative alternatives and trailing denial. | Korean preserves both hypotheses and the unfinished ending; English/Japanese/Chinese leave the same uncertainty. | Low |

## Historical Audit Reconciliation

- Rechecked historical open questions at IDs 17552, 17556, 17562-17563,
  17566, 17569-17570, 17577, 17583, 17591, and 17597-17599 against the
  active four-locale rows. They remain preliminary questions; no historical
  note authorizes a translation edit.
- The Chinese-only extra `{LINE_LEFT}` at 17563 is recorded as a structural
  source difference, not silently normalized.

## Other Checks

- Active Korean, English, Japanese, and Chinese each contain IDs 17550-17599
  in identical order.
- Line-break counts match. At 17563, Chinese has one extra `{LINE_LEFT}`
  marker before the Shards heading; localized marker payloads are not treated
  as structural mismatches.
- The official Korean manual could not be text-searched in this environment;
  terminology candidates remain unverified against it.

## Batch Status

IDs 17550-17599 received one preliminary reading. Findings are candidates
and open questions only, not confirmed review dispositions. Continue with
`default` IDs 17600-17649.
