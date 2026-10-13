# Preliminary Language Scan: `default` IDs 48001-48050

- Review date: 2026-10-08
- Scope: all 50 active `default` rows, IDs 48001-48050 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, quantities, and hidden formatting.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 48002 | ancestral cradle / `선조의 요람` | Preserve the Tuatha's desecration and the possible permanent change; check whether the “cradle” is a formal place name. | Korean retains the ancestral place, mortal bodies, and uncertain permanence. Chinese adds a Gallows Tree referent not present in English; English remains primary. | Medium |
| 48004 | fate/path/profit | Preserve the source's contrast between fate being unalterable and those who discern its path early profiting most. | Korean keeps both propositions without introducing a new subject. English is aphoristic and its subject is compressed; Japanese supports the same general reading. | Medium |
| 48005-48006 | Cradle of Summer / the Well | Confirm whether both capitalized place/object terms are formal names and keep “the Well” distinct from a generic well. | Korean uses `여름의 요람` and `우물`, preserving entry into a protected place and the urgent attempt to slow its energy and shut it down. The historical log flags the formal-name question. | Medium |
| 48011 | `Morsus Cani Imperius` / `모르수스 카니 임페리우스` | Confirm the canonical Latin spelling, title meaning, and consistency with other Morsus titles. | Korean transliterates the announced title and preserves the ceremonial declaration. Japanese interprets it as a “tyrant mad dog,” while Chinese also renders a meaning rather than the Latin. The historical log specifically flags the title/name distinction. | Medium |
| 48021 | thieves' name / `도적 떼가 ... 붙인 이름` | Clarify the name's referent and preserve the person-versus-name contrast in the threat. | Korean retains that a group of scoundrels adopted the name to glorify theft, that a name outlives a person and breeds fear, and that killing its users is a start. The historical log leaves the exact referent open. | Medium |
| 48022 | Health warning / runtime markers | Preserve both `{LINE_CENTER}` wrappers, `{LINE_SPACE}`, `{1}`, and the localized potion wrapper. | English, Chinese, and Korean retain two `{LINE_CENTER}` markers, `{LINE_SPACE}`, `{1}`, and the potion marker in that order. Japanese omits both `{LINE_CENTER}` markers; Korean matches English/Chinese and has no marker loss. | High |
| 48023 | Gray Gunnar / Kaharine illness | Clarify what `it` refers to and preserve that the speaker is less ill than the named patients. | Korean makes the illness explicit (`병을 앓았지만`) and retains Gray Gunnar and Kaharine being laid up. English is context-dependent; Chinese and Japanese likewise use an illness/recovery reading. | Medium |
| 48025 | “She gave all a place in Rathir” | Clarify the scope of `all` and the implied object/place; preserve that she provided a place for people in Rathir. | Korean interprets this as giving everyone a place to live in Rathir. English omits the object after `gave`; Japanese uses “a place in Rathir,” while Chinese describes having a place there. Do not infer a more specific group without context. | Medium |
| 48027 | wooing the fool / parchment | Preserve the sequence of courtship, false promises, and willingness to die or kill for the parchment. | Korean retains all actions and the speaker's determined tone. `Wooing` may be courtship or persuasion; the exact relationship is not established in the row. | Medium |
| 48029 | Castellan / Ancient of War | Confirm canonical Korean titles and retain the explanation of his rank above the other Castellans. | Korean preserves both roles and the leadership relationship. The institutional title `Ancient of War` remains a terminology candidate. | Medium |
| 48037 | Going Primal / `야성 발현` | Confirm the established skill/title rendering against other occurrences. | Korean uses the existing concise skill-like form. The historical log flags this title for consistency with other `Going Primal` entries. | Medium |
| 48040 | scourge / `재앙` | Clarify whether `the scourge` is a person, creature, plague, or general calamity. | Korean keeps the plea for the Beckoned's divine intervention but chooses the broad “calamity” sense. The source gives insufficient context to resolve the entity. | Medium |
| 48047 | Gallows End / The Calamity / `교수대 끝`, `재앙호` | Confirm canonical place and ship names, preserving that survivors of the ship are sought before supplies and Dead Kel. | Korean retains the arrival, survivors, supplies, and pirate hunt. Both English terms are capitalized proper names; current Korean uses a literal place name and a translated ship name. | Medium |

Other names and terms in this range, including Taggart House, Cloudcrest,
Cedd Gartyn, Bisarane, Gray Gunnar, Kaharine, Rathir, Flanagan, Keen,
Scholia Arcana, and Mace Darkken, remain subject to corpus-wide terminology
review. Existing Korean forms were preserved.

IDs 48001, 48003, 48007-48010, 48012-48020, 48024, 48026,
48028, 48030-48036, 48038-48039, 48043-48046, and 48048-48050 generally
retain the English meaning on this first reading. Names, idioms, and lore
terminology remain subject to integrated review.

## Historical Audit Reconciliation

- Rechecked the historical entry for IDs 47950-48049, including the
  Morsus title, the old thieves' name, Gray Gunnar/Kaharine, the omitted
  object in `She gave all a place`, `Cradle of Summer`/`the Well`,
  `Going Primal`, `South Korea`, `scourge`, Gallows End, and The Calamity.
- Checked boundary ID 48050 against the next historical entry for
  IDs 48050-48149; the UI status text is included once.
- The historical marker note at 48022 is supported for Korean: its two
  `{LINE_CENTER}` wrappers and other markers are intact. Japanese alone
  omits the two center markers.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 48001-48050 once
  and in identical ascending order.
- ID 48042 has one embedded line break in all four locales.
- At ID 48020, `60%` and `22%` are retained; at 48042, `+40%` and `15%`
  are retained.
- The `$VMC_NQD.cost$` variable at ID 48041 is present in all four locales.
- Korean ID 48022 preserves the full marker sequence present in English and
  Chinese. Japanese omits both `{LINE_CENTER}` markers; this locale-specific
  structural difference is recorded without editing any CSV.
- No hidden format/control characters were found in the batch.
- No translation CSV edit was made.

## Batch Status

IDs 48001-48050 received one preliminary reading. The later working
disposition is recorded in
[`disposition-batch-default-48001-48050-20261010.md`](disposition-batch-default-48001-48050-20261010.md).
That disposition does not convert this preliminary scan into independent
final linguistic approval. Continue at `default` ID 48051.
