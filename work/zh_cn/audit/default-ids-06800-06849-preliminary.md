# Preliminary Language Scan: `default` IDs 6800-6849

- Review date: 2026-10-07
- Scope: all 50 active `default` rows, IDs 6800-6849.
- Compared English, Japanese, and Chinese rows with active Korean and
  reconciled applicable historical questions.
- Read-only; no translation CSV was edited. This is preliminary work, not an
  independent Reviewer disposition.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 6807 | `purging your kind` → `너희 종족을 정화` | Confirm whether this threat means cleansing, exterminating, or deliberately uses both senses; `정화` may soften the hostile intent. | English says the Goddess will purge the addressee's kind; Japanese says wipe them out and Chinese uses purification. Korean follows the latter/euphemistic sense. | Medium |
| 6813 | `The Unbound` → `결박되지 않은 자들` | Align with existing project forms such as `결박을 벗어난 자들` after deciding the faction's standard Korean name. | English capitalization and all source locales indicate a named sect/group; active Korean forms vary. | Medium |
| 6815 | `ship of fools` → `네 바보들의 배` | Preserve the insult aimed at the crew while making clear this is an idiom/metaphor, not literally “your fools' ship.” | English/Japanese/Chinese use a sarcastic “ship of fools” expression; current Korean possessive phrasing is awkward and can change the relation. | High |
| 6817 | Walen's `second` → `보조인` | Confirm the duel-specific role and whether `보조인` sufficiently conveys a second/representative rather than an ordinary assistant. | The English uses the formal duel role `second`; Japanese says attendant, while Chinese says deputy. Korean uses a generic assistant. | Medium |
| 6829 | ceremonial `chausses` → `의식용 각반` | Verify the equipment category and official Korean armor term for this historical leg armor. | English names chausses; Japanese and Chinese interpret the item as waist/leg garments with different specificity. Korean's `각반` is plausible but may not identify the same armor piece. | Medium |
| 6848 | `FAIL LINE 2` → `실패 문자열 2` | Keep this likely debug/test string consistent with repeated `FAIL LINE 2` rows elsewhere unless there is a deliberate player-facing localization decision. | English and Japanese retain the exact test label; the same Korean corpus contains other unchanged `FAIL LINE 2` rows and ID 6131 `FAIL LINE`. This row alone translates it. | High |

## Historical Audit Reconciliation

- Rechecked applicable historical questions for IDs 6802-6803, 6807,
  6813, 6815, 6817, 6822, 6827, 6829, 6837, and 6843, 6846-6849.
- ID 6803 keeps the speaker's own visions as the source of the fates; ID 6822
  retains the cynical ceremonial-weapon scam; ID 6837 preserves the stark
  threat without specifying how the sacrifice occurs.
- The `Finesse` rendering at ID 6843 remains `재주`, consistent with the
  active draft's existing terminology.
- Historical candidate wording remains evidence only and does not authorize
  edits.

## Other Checks

- All 50 IDs exist in English, Japanese, Chinese, and active Korean.
- Explicit line-break counts and brace-delimited runtime-marker identities
  match across all four locales.
- Numeric values are semantically equivalent: two fortnights at ID 6827
  equal Japanese's four weeks; the solo fight at ID 6830 is also represented
  as one fighter in Japanese.
- No active CSV structure or text was changed.

## Batch Status

IDs 6800-6849 received one preliminary reading. Findings remain
candidates/questions only and do not authorize edits.
