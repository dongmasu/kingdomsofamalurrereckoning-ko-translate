# Asset Revalidation: `2605200.quest_bxml` (`ao_sq_ch_006` / Invasive Species)

- Date: 2026-11-11.
- Scope: all 56 `default` IDs linked to this asset. Fifty-five were new to
  the ledger; shared UI ID `60633` had already been reviewed and already
  listed this asset among its 44 links.
- English was checked for meaning, Japanese was the primary voice/register
  reference, and Chinese was supporting evidence.
- Five correction candidates are recorded. No translation CSV or extracted
  game asset was changed.

## Context Evidence and Limits

The BXML contains the lowercase `QUEST_ID` value `ao_sq_ch_006`, three
`GOR_ID` values for the quest's Chaos Rifts, and stage labels for stopping the
poachers, killing the Critters, and returning to Michaela. Serialized handler
names include `michaela_vogel` and voice-topic labels, but do not map the
localization IDs to individual handlers. The asset supports an
`ao_sq_ch_006` / Invasive Species / Michaela farm topic grouping, not
per-key speaker attribution, turn order, or playback order. Speaker
attribution remains unassigned and dialogue order unknown.

The generated catalog omits the lowercase quest value because its current
extractor accepts uppercase `QUEST_ID` values only. This report records the
direct read-only BXML evidence; the extractor was not changed.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `10131` | Meaning / name and term consistency | The English row says `Michael Vogel`, but Japanese and Chinese identify Michaela, and this BXML's stage/handler strings explicitly name `Michaela`. Korean currently combines `미카엘라 포겔` with the mismatching English pairing `(Michael Vogel)`. Verify the English spelling as a source typo and align the paired name to `Michaela Vogel`. The same line renders the capitalized `Critter problem` as generic `작은 동물 문제`; the quest explicitly calls these Chaos Critters, so align that term with `혼돈 생물` as well. | High |
| `13544` | Meaning / naturalness | `I'll fix your poaching problem` is `밀렵 문제는 내가 해결할게`, which can sound like the problem is illegal hunting rather than the poachers. The BXML labels the objective `stop_the_poachers`; consider `밀렵꾼 문제는 내가 해결할게`. | High |
| `15886` | Terminology | Capitalized `Critters` is rendered `그 짐승들`, while this quest identifies the creatures as Chaos Critters (`혼돈 생물`). Consider `그 혼돈 생물들`. | Medium-high |
| `28650` | Terminology | Capitalized `Critters?` is rendered `동물들이라고?`; the JA/EN/zh context and quest stages refer to the same Chaos Critters. Use the established creature term while preserving the speaker's surprised repetition. | Medium-high |
| `48201` | Proper-name number consistency | `those Preordained scoundrels` is `그 예정된 자(Preordained)라는 악당들이`, while other rows in this group use the collective plural `예정된 자들`. Align the faction label's number/form without losing `scoundrels`. | Medium |

## Cross-Asset Terminology Follow-Up

A corpus search for capitalized `Chaos Critter(s)` found ID `16007` rendered
`혼돈의 괴물`, while ID `30129` and this quest's IDs `51941`, `52501`, and
`56263` use `혼돈 생물`. ID `16007` is not linked to this asset and is not
recorded as reviewed here; include it when its own asset is revalidated.

## Repeated Text and Structure

No exact-English duplicate groups occur among the 56 IDs. The four-language
line-break counts, runtime-token sequences, and detected markup signatures
match for every ID. No embedded line breaks, runtime placeholders, or markup
occur in these rows.

## Complete ID Set

`5109`, `6989`, `7632`, `9168`, `10131`, `10264`, `10549`, `13544`, `15886`,
`16654`, `18880`, `19054`, `21648`, `23640`, `23667`, `24102`, `24520`,
`25156`, `25734`, `26398`, `28098`, `28650`, `29375`, `31198`, `31580`,
`33250`, `34536`, `35992`, `36444`, `36898`, `39403`, `39479`, `41004`,
`42832`, `42905`, `44048`, `46268`, `48152`, `48201`, `49928`, `51589`,
`51759`, `51941`, `52360`, `52501`, `53729`, `54754`, `54945`, `55179`,
`56263`, `59124`, `60511`, `60633`, `60911`, `63503`, and `63798`.

The 55 new four-language source fingerprints and per-ID dispositions are
recorded in [`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
ID `60633` retains its existing shared-UI ledger record. These review findings
are not approval to edit the translation.
