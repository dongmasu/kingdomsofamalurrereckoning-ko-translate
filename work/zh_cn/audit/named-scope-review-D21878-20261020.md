# D-21878: Captain Ansilla Title Variant

Date: 2026-10-20

Reviewed the current paired-title variation for `Captain Ansilla` under the
existing `person:drewn` scope. Four accepted rows use `안실라 대위(Captain
Ansilla)` (`default:1319`, `45107`, `49350`, `58163`); `default:8759` uses
`안실라 대장(Captain Ansilla)` while asking whether the listener belongs to
the captain's company.

The English title is identical, while Japanese consistently uses
`アンシラ隊長` and Chinese `安西拉队长`; neither supplies a military-rank
distinction. In the company-membership question, `대장` is a plausible
contextual rendering of the unit leader, so the single variation is not a
clear name or content error. Preserve it rather than applying a global
Captain rule. D-21859 likewise established that Captain titles require
source-specific role context.

As a separate spelling heuristic, accepted person-index occurrences were
grouped by exact English label and compared by their final Korean name token.
Outside the Captain Ansilla title variation above, this screen found no
repeated one-character spelling pair where each form occurred at least
twice. This bounded heuristic does not establish that all name spellings
are correct.

No CSV, glossary, occurrence-index, or release-artifact change. This was a
focused content review; no full format or residual audit was run.
