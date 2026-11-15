# Dialogue Context Metadata

The dialogue-context metadata is the maintainable bridge from localization
IDs to reviewable quest and character context. Dialogue rows live in the
`default` resource; `base` is a separate resource family and is not included
in this dialogue index.

## Current Coverage Checkpoint (2026-11-13)

The sequential four-language revalidation of `default` is complete through
ID `65134`: the ledger covers all 65,135 / 65,135 unique IDs (100%). The
final four ranges, `64250`-`65134`, rechecked 885 IDs, preserved 246 existing
ledger rows, and appended the 639 previously unrecorded IDs. New entries
record 624 `not-issue` results, 13 evidence-limited holds, and two correction
candidates (`64412` and `64706`). Twenty existing candidate rows and four
existing holds were also rechecked; their append-only records were preserved.
The unresolved items are not silently treated as errors or approvals to edit.
No translation CSV was changed for these ranges.

Exact-English duplicate checks across the four ranges covered 212 groups and
3,635 corpus rows; Korean agreed within each group. All logical line-break
counts and runtime-marker/formatting skeletons matched across languages.
Korean embedded CRLF separators were preserved. The range reports record the
per-batch counts and asset associations; asset links do not establish
per-key speakers or playback order:
[`64250`-`64499`](dialogue-context-default-64250-64499-revalidation-20261113.md),
[`64500`-`64749`](dialogue-context-default-64500-64749-revalidation-20261113.md),
[`64750`-`64999`](dialogue-context-default-64750-64999-revalidation-20261113.md),
and
[`65000`-`65134`](dialogue-context-default-65000-65134-revalidation-20261113.md).
All ledger fingerprints, regenerated index/catalog checks, nine related
tests, and the CRLF-aware diff check passed.

## Candidate Application Reconciliation (2026-11-15)

The hold at `51806` is resolved using its already accepted
`먼지의 아이(Child of the Dust)` terminology; only that row and fingerprint
changed. `46403`, `47508`, and `48231` remain held because the available
language/context evidence does not establish the requested alternate
readings. See the
[`51806 hold-resolution follow-up`](dialogue-context-hold-resolution-51806-20261115.md).

### Coverage Accounting Correction

The later running figure `3,518 / 4,026` (`87.38%`) with `508 remaining`
counts cumulative newly-counted candidates, not all candidates with a recorded
disposition. Reconciliation against the current ledger and ID-scoped reports
found 3,996 decisions in candidates' own numeric ranges and 29 additional
cross-range linked-row decisions. The remaining legacy ledger flag at `14325`
is explicitly not a current candidate in its range report. Thus all 4,025
current candidates have a documented disposition; the 508 figure is not an
unreviewed backlog. Evidence-limited holds remain open where sources are
insufficient. See
[`candidate coverage accounting`](dialogue-context-candidate-coverage-accounting-20261115.md)
for the candidate IDs, evidence, and method.

The follow-up review of eight evidence-limited rows in `64250`-`64499` resolved
the arena label at `64276`, the dark-humor phrase at `64353`, Didenhil's
`Warden` title at `64490`, and the `Page` title at `64492`. Four distinct
source/context holds (`64252`, `64258`, `64341`, `64458`) and the separate
stain/blotter wordplay at `64353` remain unresolved. Only four Korean text
fields and their ledger fingerprints changed; see
the [evidence-hold follow-up](dialogue-context-64250-64499-evidence-hold-followup-20261115.md)
and [edit manifest](dialogue-context-final-edits-followup-64250-64499-20261115.json).

The `60500`-`60749` pass reconciled nine new candidates; `60675` had already
been reconciled with exact-source duplicate `43317`. Seven of the nine were
corrected and two were already supported. Three older candidates and two
report-only objectives were also corrected. The `Templar` term question at
`60614` remains scoped and unresolved. Twelve changed IDs' fingerprints were
refreshed. Candidate reconciliation is `3,392 / 4,026` (`84.25%`), with
`634` remaining. See
[`60500`-`60749`](dialogue-context-60500-60749-candidate-reconciliation-20261115.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-60500-60749-20261115.json).

The `60250`-`60499` pass reconciled all nine new candidates: eight were
corrected and one was already supported. Two of seven earlier candidates
were corrected; five were already reflected in the CSV. The existing
`60442` plural Troll pairing is also already correct, and seven new
evidence-limited holds remain. Ten changed IDs' fingerprints were refreshed.
Candidate reconciliation is `3,383 / 4,026` (`84.03%`), with `643` remaining.
See
[`60250`-`60499`](dialogue-context-60250-60499-candidate-reconciliation-20261115.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-60250-60499-20261115.json).

The `60000`-`60249` pass reconciled all 12 new candidates: eight were
corrected and four were already supported. Three older candidates were also
already correct. The previously reported corrections at `60108` and `60134`
are present; three report-only ambiguities remain held. Eight changed IDs'
fingerprints were refreshed. Candidate reconciliation is
`3,374 / 4,026` (`83.81%`), with `652` remaining. See
[`60000`-`60249`](dialogue-context-60000-60249-candidate-reconciliation-20261115.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-60000-60249-20261115.json).

The `59750`-`59999` pass reconciled all ten new candidates: eight were
corrected and two were already supported by the active CSV. Five of nine
earlier candidates were corrected, and two report-only findings were also
fixed (`59863`, `59904`). Four evidence-limited issues remain held:
`59763`, `59785`, `59789`, and `59959`. Fifteen changed IDs' fingerprints
were refreshed. Candidate reconciliation is `3,362 / 4,026` (`83.51%`),
with `664` remaining. See
[`59750`-`59999`](dialogue-context-59750-59999-candidate-reconciliation-20261115.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-59750-59999-20261115.json).

The `59500`-`59749` pass reconciled all 15 new candidates: seven were already
reflected in the active CSV and eight were corrected. It rechecked nine
earlier candidates, corrected two, withdrew the misattributed urn finding at
`59576`, and added the report-only title pairing at `59659`. `59556`,
`59689`, and the conflicting section heading at `59722` remain held. The
sequential report's summary says 14 new candidates, but its table and ledger
contain 15; the `59722` source-conflict hold is separate. Candidate
reconciliation is `3,352 / 4,026` (`83.26%`), with `674` remaining. See
[`59500`-`59749`](dialogue-context-59500-59749-candidate-reconciliation-20261115.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-59500-59749-20261115.json).

The `59250`-`59499` pass reconciled all ten new candidates. Eight already
matched the supported wording; two were corrected. Seven rows were edited
across those candidates, earlier findings, and report-only follow-ups,
including the full Mitharan item name, the Fae Mound, dialogue register, and
the Farraglen title. The tally is `3,337 / 4,026` (`82.89%`), with `689`
remaining. See
[`59250`-`59499`](dialogue-context-59250-59499-candidate-reconciliation-20261115.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-59250-59499-20261115.json).

The `59000`-`59249` pass reconciled all 15 new candidates. Eleven were
already reflected in the current CSV; four were corrected. Eight rows were
edited across these candidate follow-ups and reopened findings, including
the `Bull in a China Shop` wording and the contraband locker at `59235`.
One previous `Glass` ambiguity remains held. Candidate reconciliation is
`3,327 / 4,026` (`82.64%`), with `699` remaining. See
[`59000`-`59249`](dialogue-context-59000-59249-candidate-reconciliation-20261115.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-59000-59249-20261115.json).

The `58750`-`58999` pass reconciled 14 of 15 new candidates. Seven were
already correctly reflected in the current text, and seven were corrected;
`58787` remains held because its isolated `Fast` UI label lacks context. Seven
edited IDs' fingerprints were refreshed. The tally is `3,312 / 4,026`
(`82.27%`), with `714` remaining. The Quays pairing at `58942` is grounded in
`default:2561` and `default:22127`; `base:2561` is an unrelated rivet item.
See
[`58750`-`58999`](dialogue-context-58750-58999-candidate-reconciliation-20261115.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-58750-58999-20261115.json).

The `58500`-`58749` pass rechecked 13 active ledger candidates. Twelve
already had supported dispositions reflected in the active CSV; `58515`
remains held because the sources disagree about `the red`. No translation or
fingerprint changed. The tally remains `3,298 / 4,026` (`81.92%`), with
`728` unresolved. See
[`58500`-`58749`](dialogue-context-58500-58749-candidate-reconciliation-20261115.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-58500-58749-20261115.json).

The `58250`-`58499` pass rechecked 16 active ledger candidates. Fifteen
already had supported dispositions reflected in the current CSV; `58270`
remains held because the source languages disagree about Anella's action.
No text or fingerprint changed. Progress remains `3,298 / 4,026` (`81.92%`),
with `728` unresolved. See
[`58250`-`58499`](dialogue-context-58250-58499-candidate-reconciliation-20261115.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-58250-58499-20261115.json).

The open `58055` English-name proposal was resolved as
`동부 하수도 헨지(Eastern Sewers Henge)`; its physical classification remains
undetermined. The `58143` `quarry` ambiguity remains held. Progress is
`3,298 / 4,026` (`81.92%`), with `728` remaining. See
[`58055` follow-up](dialogue-context-58000-58249-candidate-reconciliation-20261115.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-58000-58249-20261115.json).

The `52000`-`57999` follow-up rechecked the prior application findings against
the current four-language rows. It resolved five candidates (`54189`, `55264`,
`57501`, `57597`, and linked duplicate `59142`), corrected the same-asset
place-name pairing at `913`, and retained holds at `54422` and `56405`. The
identical English rows `57501` and `59142` now use the same Korean. The tally
is `3,297 / 4,026` (`81.89%`), with `729` remaining. See the
[`52000`-`57999` report](dialogue-context-52000-57999-followup-revalidation-20261115.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-52000-57999-20261115.json).

The `51750`-`51999` pass rechecked seven candidates, all already reconciled
in the earlier `46000`-`51999` application. Their supported wording remains;
no CSV or fingerprint change was needed. Fourteen evidence-limited holds
remain open. The candidate tally stays at 3,292 / 4,026 (81.77%), with 734
remaining. See
[`51750`-`51999`](dialogue-context-51750-51999-candidate-reconciliation-20261115.md)
and its
[`manifest`](dialogue-context-final-edits-followup-51750-51999-20261115.json).

The `51500`-`51749` pass rechecked 13 candidates, all explicitly reconciled
in the earlier `46000`-`51999` application. Their supported current wording
remains; no CSV or fingerprint change was needed. Holds at `51568` and `51702`
remain open. The candidate tally stays at 3,292 / 4,026 (81.77%), with 734
remaining. See
[`51500`-`51749`](dialogue-context-51500-51749-candidate-reconciliation-20261115.md)
and its
[`manifest`](dialogue-context-final-edits-followup-51500-51749-20261115.json).

The `51250`-`51499` pass rechecked 19 candidates. Eighteen had already been
handled in the earlier `46000`-`51999` application; it reopened `51348` for a
more natural rendering of “lair” and resolved the previous hold at `51421`
using the direct English/Japanese wording. Both rows were corrected, with
fingerprints refreshed; three other evidence-limited holds remain. These
reopened findings do not increase the candidate-pool tally, which stays at
3,292 / 4,026 (81.77%), with 734 remaining. See
[`51250`-`51499`](dialogue-context-51250-51499-candidate-reconciliation-20261115.md)
and its
[`manifest`](dialogue-context-final-edits-followup-51250-51499-20261115.json).

The `51000`-`51249` pass rechecked 17 candidates already covered by the earlier
`46000`-`51999` application. Sixteen remain supported; `51162` was reopened
because its current text contradicted the earlier “already applied” record,
then corrected to express the approaching impact naturally. The reopened
correction is outside the candidate-pool tally. Six evidence-limited holds
remain. Reconciliation stays at 3,292 / 4,026 (81.77%), with 734 remaining. See
[`51000`-`51249`](dialogue-context-51000-51249-candidate-reconciliation-20261115.md)
and its
[`manifest`](dialogue-context-final-edits-followup-51000-51249-20261115.json).

The `50750`-`50999` pass reconciled 11 new active candidates; `50951` was
already counted. It corrected `50765` and exact-source duplicate `58929`,
keeping their Korean poems identical and preserving 12 embedded line breaks,
and reopened `50844` to identify Sigra as the invoice distributor. Three
Korean rows changed and only their fingerprints were refreshed; historical
ledger dispositions were preserved. Progress is 3,292 / 4,026 (81.77%), with
734 remaining. See
[`50750`-`50999`](dialogue-context-50750-50999-candidate-reconciliation-20261115.md)
and its
[`manifest`](dialogue-context-final-edits-followup-50750-50999-20261115.json).

The `43000`-`43249` pass rechecked all 28 in-range candidates and found one
linked exact-English mismatch at `43207`/`47222`. Both Korean labels now read
`실(Syl)` without assigning an identity to the name. All other supported
range corrections were already present. The linked row `47222` was
reclassified from uncertain to candidate. Candidate reconciliation now
covers 2,882 / 4,028 IDs (71.55%), with 1,146 remaining. See
[`43000`-`43249`](dialogue-context-43000-43249-candidate-reconciliation-20261115.md)
and its
[`manifest`](dialogue-context-final-edits-followup-43000-43249-20261115.json).

The `43500`-`43749` pass reconciled 25 current in-range candidates plus
eight linked candidates. It corrected the register at `43585` and aligned
the repeated `The Humbled` title inside `44258`; linked title and objective
groups were also checked. Two Korean rows changed and eight stale
fingerprints were refreshed. The malformed ledger row was restored, and
`12779` remains held rather than counted as a candidate. Reconciliation was
2,935 / 4,028 (72.86%), with 1,093 remaining. See
[`43500`-`43749`](dialogue-context-43500-43749-candidate-reconciliation-20261115.md)
and its
[`manifest`](dialogue-context-final-edits-followup-43500-43749-20261115.json).

The `43750`-`43999` pass reconciled 18 current in-range candidates plus linked
candidate `60899`. It corrected the remaining marked register at `43811`,
`43873`, and `43954`, revised the direct address at `43918`, and aligned the
Fire Sprite type and objective across `43984`/`60899`. The `Infrequent`
wording at `43919` already matches previously reconciled `14967`. Six Korean
rows changed; all six ledger fingerprints were refreshed. The current
65,135-ID ledger, catalog/index checks, 11 CSV-preservation tests, nine
context-index tests, CSV row/order/BOM/newline checks, and CRLF-aware diff
check passed. Candidate reconciliation is now 2,954 / 4,028 (73.34%), with
1,074 remaining. See
[`43750`-`43999`](dialogue-context-43750-43999-candidate-reconciliation-20261115.md)
and its
[`manifest`](dialogue-context-final-edits-followup-43750-43999-20261115.json).

The `44000`-`44249` pass reconciled 27 new unique candidates from the
28-candidate range list; `44006` had already been counted as a linked
candidate. It corrected unsupported marked speech at `44073`, `44118`, and
`44215`. The title pairing at `44014` matches exact-source duplicate `27284`;
`44143` follows the established Sandstone Villa `개량` group. `44223` remains
held, while the earlier `44238` duplicate hold is cleared after checking the
different Japanese wording. Three fingerprints were refreshed. Candidate
reconciliation is now 2,981 / 4,028 (74.01%), with 1,047 remaining. See
[`44000`-`44249`](dialogue-context-44000-44249-candidate-reconciliation-20261115.md)
and its
[`manifest`](dialogue-context-final-edits-followup-44000-44249-20261115.json).

The `44250`-`44499` pass reconciled 22 new unique candidates; `44258` had
already been counted as a linked title candidate. It corrected the intimate
address at `44347`, the register at `44360` to match parallel reward line
`37913`, and the marked speech at `44495`. The `Fennwrac`, Fontmaster,
Sandstone, and equipment terms were checked against established uses.
`44380`, `44458`, `44462`, and the hollow meaning at `44477` remain held.
Three fingerprints were refreshed. Candidate reconciliation is now
3,003 / 4,028 (74.55%), with 1,025 remaining. See
[`44250`-`44499`](dialogue-context-44250-44499-candidate-reconciliation-20261115.md)
and its
[`manifest`](dialogue-context-final-edits-followup-44250-44499-20261115.json).

The `44500`-`44749` pass reconciled 20 range candidates; linked candidate
`44580` had already been counted with exact-source counterpart `43364`.
It corrected address/register and naturalness at `44558`, `44585`, `44608`,
`44741`, and `44742`. The seven evidence-limited holds remain open.
`23436` retains its context-supported FFQ03 wording rather than being forced
to match other identical-English rows. Five fingerprints were refreshed.
Candidate reconciliation is now 3,023 / 4,028 (75.05%), with 1,005
remaining. See
[`44500`-`44749`](dialogue-context-44500-44749-candidate-reconciliation-20261115.md)
and its
[`manifest`](dialogue-context-final-edits-followup-44500-44749-20261115.json).

The `44500`-`44749` post-handoff verification has now passed: all 65,135
four-language ledger fingerprints, index and both catalog reproductions, 20
combined regression tests, CSV structure and mixed-newline checks, and the
CRLF-aware diff check. The active CSV remains at 71,839 CRLF, 242 LF-only,
and zero bare-CR endings.

The `44750`-`44999` pass reconciled all 40 range candidates and newly found
exact-source counterpart `30142` for `44968`. The identical English,
Japanese, and Chinese title pair now has matching Korean at both IDs:
`결투의 조력자(A Second to a Duel)`. Other supported edits pair `Toxic
Residue`, the full `Troll Matriarch` type, and `Sagecrafter`, and replace the
marked imperative at `44887`. Six Korean rows changed, and the linked
candidate increased the pool to 4,029. Progress is 3,064 / 4,029 (76.05%),
with 965 remaining. Five evidence-limited holds remain. The full ledger,
index/catalog, 20 regression tests, CSV structure/newline, and CRLF-aware
diff checks passed. See
[`44750`-`44999`](dialogue-context-44750-44999-candidate-reconciliation-20261115.md)
and its
[`manifest`](dialogue-context-final-edits-followup-44750-44999-20261115.json).

The `45250`-`45499` pass reconciled all 12 current candidates. It corrected
the `Yours, Ruby` sign-off at `45314` to `너의 루비(Ruby)` and added the
missing `Nil the White` pairing at `45341`; ten other candidates were already
resolved or acceptable in the current CSV. The 13 evidence-limited holds
remain open. Two Korean rows changed and only their ledger fingerprints were
refreshed. Candidate reconciliation now covers 3,102 / 4,029 IDs (76.99%),
with 927 remaining. All 65,135 ledger fingerprints, index/catalog
reproducibility, 20 regression tests, CSV order/BOM/mixed-newline checks, and
the CRLF-aware diff check passed. See
[`45250`-`45499`](dialogue-context-45250-45499-candidate-reconciliation-20261115.md)
and its
[`manifest`](dialogue-context-final-edits-followup-45250-45499-20261115.json).

The `45500`-`45749` pass reconciled seven new candidates; `45625` had already
been counted and reconciled as a linked candidate. All eight current
findings are already reflected in the active CSV, so no translation or
fingerprint change was needed. The six evidence-limited holds remain open.
Candidate reconciliation now covers 3,109 / 4,029 IDs (77.17%), with 920
remaining. All 65,135 ledger fingerprints, index/catalog reproducibility,
20 regression tests, CSV structure and mixed-newline checks, and the
CRLF-aware diff check passed. See
[`45500`-`45749`](dialogue-context-45500-45749-candidate-reconciliation-20261115.md)
and its
[`manifest`](dialogue-context-final-edits-followup-45500-45749-20261115.json).

The `43250`-`43499` pass reconciled the 19 candidate IDs currently recorded
in the ledger. It cleared the mis-mapped `43340`, identified `44580` as a
new candidate linked to already-correct `43364`, and aligned exact-source
objective pairs `43317`/`60675` and `43364`/`44580`. ID `43379` was also
revised to match the source's conversational narration. Three Korean rows
changed; the `43460` wording already present in the active CSV was retained.
The ledger, generated index/catalogs, both regression suites, CSV
structure/newline inventory, exact-source comparisons, and CRLF-aware diff
check passed. Candidate reconciliation now covers 2,902 / 4,028 IDs
(72.05%), with 1,126 remaining. See
[`43250`-`43499`](dialogue-context-43250-43499-candidate-reconciliation-20261115.md)
and its
[`manifest`](dialogue-context-final-edits-followup-43250-43499-20261115.json).

The `42750`-`42999` pass rechecked all 26 in-range candidates and three
linked rows: exact-source pairs `27747`/`42851` and `42812`/`54691`, plus
the remaining `Ticneri` spelling at `34443`. Four Korean rows were corrected
or aligned (`27747`, `34443`, `42899`, `54691`), and three linked IDs were
added to the candidate pool. Seven evidence-limited holds remain unchanged.
Candidate reconciliation now covers 2,853 / 4,027 IDs (70.85%), with 1,174
remaining. See
[`42750`-`42999`](dialogue-context-42750-42999-candidate-reconciliation-20261115.md)
and its
[`manifest`](dialogue-context-final-edits-followup-42750-42999-20261115.json).

The `42500`-`42749` pass rechecked all 35 in-range candidates and found two
previously unflagged exact-source objective mismatches:
`25302`/`42694` (`Talk to Audra`) and `42639`/`49115`
(`Stop Tirnoch's Release`). The two source-language groups are identical,
and both Korean pairs now match. The linked IDs were added to the candidate
pool. ID `42675` was changed from an unsupported honorific exclamation to
plain conversational speech. Three Korean rows changed and their
four-language fingerprints were refreshed. Seven evidence-limited holds
remain; `42738`'s sentence correction is accepted while its `The Plains`
referent remains unresolved. Reconciliation now covers 2,824 / 4,024
candidates (70.18%), with 1,200 remaining. The full ledger, index/catalog,
both test suites, CSV structure/newline checks, exact-source checks, and
CRLF-aware diff check passed. See
[`42500`-`42749`](dialogue-context-42500-42749-candidate-reconciliation-20261115.md)
and its
[`manifest`](dialogue-context-final-edits-followup-42500-42749-20261115.json).

The `42250`-`42499` pass rechecked all 26 in-range candidates and found two
unflagged Korean mismatches in exact-source objective pairs:
`16532`/`42307` (`Kill the Crudok`) and `15833`/`42371`
(`Destroy the Prismere Chantries`). English, Japanese, and Chinese are
identical within each pair; both Korean pairs now use matching `-하기`
objectives. The two previously unflagged IDs were added to the candidate
pool. The material-name pairing at `42450`, rhetorical question at `42456`,
and servants/advisors appositive at `42489` were also corrected.
`42447`'s title is paired, but its conflicting meaning remains held. Five
Korean rows changed and their four-language fingerprints were refreshed.
Twenty-two other in-range candidates already had supported wording.
Reconciliation now covers 2,787 / 4,022 candidates (69.29%), with 1,235
remaining. The full ledger, index/catalog checks, both test suites, CSV
structure and newline checks, exact-source checks, and CRLF-aware diff check
passed. See
[`42250`-`42499`](dialogue-context-42250-42499-candidate-reconciliation-20261115.md)
and its
[`manifest`](dialogue-context-final-edits-followup-42250-42499-20261115.json).

The `42000`-`42249` pass reconciled 28 unique candidate IDs: the 26 IDs in
the prior application manifest, the separately held candidate `42176`, and
`42063` from the later missing-candidate follow-up. The follow-up's source
comparison superseded the earlier release of `42063`; its correction was
already applied. `42031` now uses the base-supported `연 방패`, and `42198`
matches the six-line poem at exact-source duplicate `320`. Twenty-one
supported corrections were already reflected, four rows were retained, and
the separate `42176` nuance remains held. Two rows changed in this pass and
their fingerprints were refreshed. Candidate reconciliation now covers
2,759 / 4,020 IDs (68.63%), with 1,261 remaining. The complete ledger,
index/catalog checks, 20 tests, CSV structure/newline checks, poem duplicate
check, and CRLF-aware diff check passed. See the
[`42000`-`42249 report`](dialogue-context-42000-42249-candidate-reconciliation-20261115.md)
and
[`manifest`](dialogue-context-final-edits-followup-42000-42249-20261115.json).

The `41750`-`41999` pass rechecked 17 in-range candidates and reconciled
three linked candidate IDs (`47041`, `47200`, `59258`) through the
cross-occurrence `The Big Hunt` review. `29900` was already counted in its
earlier range and was not double-counted. The five references now use
`빅 헌트(The Big Hunt)`; `29900`, `41905`, and `59258` were updated, and
their fingerprints were refreshed. Two evidence-limited holds remain at
`41798` and `41999`, with 14 other holds preserved. Candidate reconciliation
now covers 2,731 / 4,020 IDs (67.94%), with 1,289 remaining. See the
[`41750`-`41999 report`](dialogue-context-41750-41999-candidate-reconciliation-20261115.md),
[`Big Hunt addendum`](dialogue-context-big-hunt-name-consistency-followup-20261115.md),
and
[`manifest`](dialogue-context-final-edits-followup-41750-41999-20261115.json).

The `41500`-`41749` pass rechecked 11 in-range candidates and reconciled
linked exact-source duplicate `43268` with `41671`; both IDs were included.
All supported correction text was already present in the active Korean, so
the CSV was not changed. The existing `41650` revision's fingerprint was
refreshed. The separate `41648` UI-term hold remains unresolved.
Reconciliation now covers 2,711 / 4,020 candidate IDs (67.44%), with 1,309
remaining. The full ledger, index/catalog, both test suites, CSV
structure/newline checks, and CRLF-aware diff check passed. See
[`41500`-`41749 report`](dialogue-context-41500-41749-candidate-reconciliation-20261115.md)
and
[`manifest`](dialogue-context-final-edits-followup-41500-41749-20261115.json).

The `41250`-`41499` pass reconciled 20 new unique candidates; linked
candidate `41471` had already been counted with exact-source duplicate
`39868`. Fifteen proposed corrections were already present in the active
Korean, and `41367` now uses `코호시(Cohosh)`, matching the same plant term
at `21648`. All 26 exact-source `Argine, Queen of Staves` labels retain the
established split title/name pairing. Unsupported proposals at `41271`,
`41375`, and `41418` were cleared; `41418` retains the established
`제일검(First Sword)` form instead of `제1검`. The separate `41271`
role-meaning hold remains. Six evidence-limited holds remain overall in the
range. Only `41367` changed and its fingerprint was refreshed. Candidate
reconciliation now covers 2,699 / 4,020 IDs (67.14%), with 1,321 remaining.
All ledger fingerprints, regenerated index/catalog checks, 20 tests, CSV
structure/newline checks, exact-source checks, and CRLF-aware diff checks
passed. See
[`dialogue-context-41250-41499-candidate-reconciliation-20261115.md`](dialogue-context-41250-41499-candidate-reconciliation-20261115.md)
and
[`dialogue-context-final-edits-followup-41250-41499-20261115.json`](dialogue-context-final-edits-followup-41250-41499-20261115.json).

The `41000`-`41249` pass rechecked the 27 valid in-range candidates. It
cleared the mis-mapped `41051` proposal (the row already correctly pairs
Brother Fallon) and found a missed exact-source title discrepancy between
`4025` and `41180`; both now use `여사제 자신다(Priestess Jacinda)`. One
Korean row changed and its fingerprint was refreshed. The candidate pool
added `4025` and removed the false-positive `41051`, remaining at 4,020
unique candidates. Candidate reconciliation now covers 2,679 / 4,020 IDs
(66.64%), with 1,341 remaining. All ledger fingerprints, index/catalog
checks, 20 tests, CSV structure/newline checks, exact-source checks, and the
CRLF-aware diff check passed. See
[`dialogue-context-41000-41249-candidate-reconciliation-20261115.md`](dialogue-context-41000-41249-candidate-reconciliation-20261115.md)
and
[`dialogue-context-final-edits-followup-41000-41249-20261115.json`](dialogue-context-final-edits-followup-41000-41249-20261115.json).

The `40750`-`40999` pass rechecked all 15 in-range candidates and found one
additional exact-source discrepancy: `43233` is identical to `40791` in
English, Japanese, and Chinese, but shared its omitted soldier/officer sense
in Korean. Both rows now match, and `40927` uses the approved `샘(The Font)`
form. The 21 evidence-limited holds remain open. Three Korean rows changed;
their fingerprints were refreshed, and `43233` was reclassified as a
candidate. Candidate reconciliation now covers 2,651 / 4,020 IDs (65.95%),
with 1,369 remaining. All ledger fingerprints, index/catalog checks, 20
tests, CSV structure/newline checks, exact-source checks, and the CRLF-aware
diff check passed. See
[`dialogue-context-40750-40999-candidate-reconciliation-20261115.md`](dialogue-context-40750-40999-candidate-reconciliation-20261115.md)
and
[`dialogue-context-final-edits-followup-40750-40999-20261115.json`](dialogue-context-final-edits-followup-40750-40999-20261115.json).

The `40500`-`40749` pass rechecked all 31 range candidates and linked
candidate `24673`. That linked row had already been counted in the
`24500`-`24749` pass. The 29 source-supported correction texts in the
existing application manifest were confirmed in the active CSV; `40558`
was already correctly paired. The container label at `40652` now reads
`수수께끼의 상자(Mysterious Case)`. Exact-source comparison found one
additional omission: `38472` and `40575` have identical English, Japanese,
and Chinese text, but only `40575` included `Templar` in the title pairing.
The Korean rows now match exactly. This previously uncounted finding adds
one candidate to the pool; `38472`'s separate prior context hold remains
open. Five evidence-limited holds remain in the range. The pass reconciled
32 new unique candidate IDs and changed only `38472` and `40652`; their
fingerprints were refreshed. Cumulative progress is 2,635 / 4,019 (65.56%),
with 1,384 remaining. All ledger fingerprints, index/catalog checks, 11
CSV-preservation tests, nine dialogue-context tests, CSV structure and
newline checks, exact-source checks, and the CRLF-aware diff check passed.
See
[`dialogue-context-40500-40749-candidate-reconciliation-20261114.md`](dialogue-context-40500-40749-candidate-reconciliation-20261114.md)
and
[`dialogue-context-final-edits-followup-40500-40749-20261114.json`](dialogue-context-final-edits-followup-40500-40749-20261114.json).

The `40250`-`40499` reconciliation rechecked all 25 candidates against
English, Japanese, Chinese, the active Korean CSV, and prior scoped
decisions. The source-supported revisions were already present except for
the shared `Mystic Hammer` sentence at `40384`; it now matches the identical
English sentence at `61804`. The current `Argine, Queen of Staves` wording
at `40340` was retained: it pairs both title and name, and the Korean is
identical across all 26 exact-source label rows. Three candidates
(`40293`, `40355`, `40382`) were already resolved. `40387` had been counted
in the earlier `37000`-`37249` pass with exact four-language duplicate
`37115`, so it was not counted twice. The four evidence-limited holds
(`40255`, `40352`, `40395`, and `40473`) remain open. This pass adds 24
unique reconciled candidates, bringing cumulative progress to 2,603 / 4,018
(64.78%), with 1,415 remaining. Only `40384` changed; its fingerprint was
refreshed. All ledger fingerprints, index/catalog checks, 11
CSV-preservation tests, nine dialogue-context tests, CSV structure and
newline checks, exact-source checks, and the CRLF-aware diff check passed.
See
[`dialogue-context-40250-40499-candidate-reconciliation-20261114.md`](dialogue-context-40250-40499-candidate-reconciliation-20261114.md)
and
[`dialogue-context-final-edits-followup-40250-40499-20261114.json`](dialogue-context-final-edits-followup-40250-40499-20261114.json).

The `40000`-`40249` pass rechecked 19 existing candidates and identified
`40025` as an additional exact-source discrepancy with `33884`. The two
English, Japanese, and Chinese rows are identical, and both Japanese rows
use `末裔`; `40025` was changed from `후계자` to `후손`. The already-counted
`33884` was not counted twice. The pass adds 20 unique reconciled
candidates, bringing cumulative coverage to 2,579 / 4,018 (64.19%), with
1,439 remaining. Five evidence-limited issues remain, including separate
location/name questions at `40052` and `40176`. Only the changed row's
fingerprint was refreshed; ledger, index/catalog, regression, CSV structure
and newline, exact-source, and CRLF-aware diff checks passed. See
[`dialogue-context-40000-40249-candidate-reconciliation-20261114.md`](dialogue-context-40000-40249-candidate-reconciliation-20261114.md)
and
[`dialogue-context-final-edits-followup-40000-40249-20261114.json`](dialogue-context-final-edits-followup-40000-40249-20261114.json).

The `39750`-`39999` pass rechecked 27 existing candidates and found one
missed Sorrows-term occurrence (`39849`). Exact-source follow-up found the
remaining register mismatch at `59331` in the `39895` farewell group; linked
candidate `41471` was also verified with `39868`. These 30 unique IDs were
reconciled without double counting. The two new candidate IDs were added to
the pool, correcting its total from 4,015 to 4,017. `39849` now uses
`비탄의 힘(The Sorrows)`, and all six farewell rows now use
`그럼 나중에 봐요.`. The nine evidence-limited holds remain open. Candidate
reconciliation covers 2,559 / 4,017 (63.70%), with 1,458 remaining. Two
Korean rows changed; all ledger fingerprints, index/catalog checks, 20
regression tests, CSV structure/newline checks, exact-source duplicate
checks, and the CRLF-aware diff check passed. See the
[`39750`-`39999 report`](dialogue-context-39750-39999-candidate-reconciliation-20261114.md)
and
[`manifest`](dialogue-context-final-edits-followup-39750-39999-20261114.json).

The `39500`-`39749` pass rechecked all 26 in-range candidates. `39557` had
already been reconciled with exact-source duplicate `21252`; linked candidate
`53799` was newly reviewed with `39582`, bringing this pass to 26 newly
counted candidates. Supported wording and title-pairing corrections were
applied, including the exact-source greeting alignment. The trophy referent,
Children of Dust rendering, Private rank, God Storm variants, Rhyderk blade
capitalization, Voices of the Isle number, and shared Fatesworn/Warsworn
renderings remain unresolved. Candidate reconciliation now covers 2,529 /
4,015 (62.99%), with 1,486 remaining. Sixteen Korean rows changed. All
65,135 ledger fingerprints, index/catalog checks, 20 regression tests, CSV
structure/newline checks, exact-source duplicate checks, and the CRLF-aware
diff check passed. See the
[`39500`-`39749 report`](dialogue-context-39500-39749-candidate-reconciliation-20261114.md)
and
[`manifest`](dialogue-context-final-edits-followup-39500-39749-20261114.json).

The `39250`-`39499` pass rechecked all 17 in-range candidates. Five
candidate rows needed correction; the others were already supported by the
active translation. `Jollienne` now matches the established
`졸리엔(Jollienne)` form, the complete Bisarane and Idylla titles and the
`Master of the Lykeios` title are paired, and `Ysa` is paired in its poem.
Exact-source poem IDs `39481` and `40183` now match with all four lines and
three embedded breaks preserved. The `Worship Circle` interpretation at
`39465` remains held. Candidate reconciliation is 2,503 / 4,015 (62.34%),
with 1,512 remaining. Six Korean rows changed, and only their ledger
fingerprints were refreshed. All 65,135 fingerprints, index/catalog checks,
20 regression tests, CSV structure/newline checks, and the CRLF-aware diff
check passed. See
[`dialogue-context-39250-39499-candidate-reconciliation-20261114.md`](dialogue-context-39250-39499-candidate-reconciliation-20261114.md)
and
[`dialogue-context-final-edits-followup-39250-39499-20261114.json`](dialogue-context-final-edits-followup-39250-39499-20261114.json).

The `39000`-`39249` pass rechecked all 23 in-range candidates. `39122` had
already been counted with `36748`; linked candidate `60527` was reviewed with
the Bloodseeker component series and newly counted. Fourteen in-range rows
were corrected and nine already matched supported wording. Exact-source
duplicates and base component terminology were aligned across the linked
groups. Twenty Korean rows changed, and only their ledger fingerprints were
refreshed. Cumulative reconciliation is 2,486 / 4,015 (61.92%), with 1,529
remaining. All ledger fingerprints, index/catalog checks, 11
CSV-preservation tests, nine dialogue-context tests, CSV structure/newline
checks, and the CRLF-aware diff check passed. See
[`dialogue-context-39000-39249-candidate-reconciliation-20261114.md`](dialogue-context-39000-39249-candidate-reconciliation-20261114.md)
and
[`dialogue-context-final-edits-followup-39000-39249-20261114.json`](dialogue-context-final-edits-followup-39000-39249-20261114.json).

The `38750`-`38999` pass rechecked all 27 in-range candidates. `38893` was
already reconciled with `36982`, so this range adds 26 unique candidates.
It corrected the repeated thought construction, source labels and titles,
casual register, objective, race-checkpoint wording, `Coln`/`Culn` distinction,
armor condition, and the neutral `Skoria Miner` label. Exact-English
duplicates and linked Weod name references were also aligned. The separate
gallows wordplay at `38799` remains held. Candidate reconciliation now covers
2,463 / 4,015 (61.34%), with 1,552 remaining. Twenty-seven Korean rows
changed, and all ledger fingerprints, index/catalog checks, 20 regression
tests, CSV structure/newline checks, and CRLF-aware diff validation passed.
See
[`dialogue-context-38750-38999-candidate-reconciliation-20261114.md`](dialogue-context-38750-38999-candidate-reconciliation-20261114.md)
and
[`dialogue-context-final-edits-followup-38750-38999-20261114.json`](dialogue-context-final-edits-followup-38750-38999-20261114.json).

The `38500`-`38749` pass rechecked all 21 in-range candidates. Nineteen were
newly counted; `38609` and `38694` were already reconciled with linked
groups. Sixteen candidate rows were corrected, and the exact-English
duplicates `12219`/`38513` and `9368`/`38705` were aligned as well. The 18
changed-row fingerprints were refreshed; all 65,135 ledger fingerprints,
index/catalog reproduction, 20 regression tests, CSV structure/newline
checks, and CRLF-aware diff validation passed. Candidate reconciliation now
covers 2,437 / 4,015 (60.70%), with 1,578 remaining. See
[`dialogue-context-38500-38749-candidate-reconciliation-20261114.md`](dialogue-context-38500-38749-candidate-reconciliation-20261114.md)
and
[`dialogue-context-final-edits-followup-38500-38749-20261114.json`](dialogue-context-final-edits-followup-38500-38749-20261114.json).

The `38250`-`38499` pass rechecked all 12 in-range candidates. Two linked
IDs (`38319`, `38453`) had already been reconciled, so this range adds ten
unique candidates. Seven Korean rows were corrected or refined; six
evidence-limited holds remain unresolved. Candidate reconciliation now
covers 2,418 / 4,015 (60.22%), with 1,597 remaining. The seven changed
fingerprints are limited to those edited IDs. See
[`dialogue-context-38250-38499-candidate-reconciliation-20261114.md`](dialogue-context-38250-38499-candidate-reconciliation-20261114.md)
and
[`dialogue-context-final-edits-followup-38250-38499-20261114.json`](dialogue-context-final-edits-followup-38250-38499-20261114.json).

The `37750`-`37999` pass reconciled all 19 in-range candidates. Ten rows
were corrected and nine were already supported. The exact-source duplicate
at `6347` was updated with `37830`, without double-counting it. Cumulative
candidate reconciliation is 2,394 / 4,015 (59.63%), with 1,621 remaining.
The 65,135-row ledger fingerprint check, index/catalog reproduction, 11
CSV-preservation tests, nine dialogue-context tests, CSV structure/newline
checks, and CRLF-aware diff check passed. See
[`dialogue-context-37750-37999-candidate-reconciliation-20261114.md`](dialogue-context-37750-37999-candidate-reconciliation-20261114.md)
and
[`dialogue-context-final-edits-followup-37750-37999-20261114.json`](dialogue-context-final-edits-followup-37750-37999-20261114.json).

The `37500`-`37749` pass rechecked 20 in-range candidates and three newly
counted linked surveyor candidates (`38319`, `50723`, and `52797`).
`44458` had already been dispositioned and was not counted twice. The
sewer-inspection role is now consistently `조사관` across the linked group;
its separate speaker/register uncertainty at `44458` remains held. Other
supported changes corrected conversational register, objective form, proper
names, and Korean phrasing. Nineteen Korean rows changed. Candidate
reconciliation is 2,375 / 4,015 (59.15%), with 1,640 remaining. All ledger
fingerprints, index/catalog checks, 20 regression tests, CSV structure and
newline checks, and the CRLF-aware diff check passed. See
[`dialogue-context-37500-37749-candidate-reconciliation-20261114.md`](dialogue-context-37500-37749-candidate-reconciliation-20261114.md)
and
[`dialogue-context-final-edits-followup-37500-37749-20261114.json`](dialogue-context-final-edits-followup-37500-37749-20261114.json).

The `37250`-`37499` candidate pass rechecked all 23 in-range candidates and
the linked candidate `41418`. It corrected the contract-journal register,
objective forms, proper-name pairings, and awkward Korean phrasing, while
aligning the linked `First Sword`, `Storyteller`, and `Notice of Duty`
terminology. The uncertain `gorta` spelling and the title/meaning questions
at `37274` and `37404` remain held. Twenty-five Korean rows changed, and the
25 corresponding ledger fingerprints were refreshed. Candidate
reconciliation is 2,352 / 4,015 (58.58%), with 1,663 remaining. The complete
ledger, index/catalog reproduction, 20 regression tests, CSV structure and
line endings, and CRLF-aware diff check passed. See
[`dialogue-context-37250-37499-candidate-reconciliation-20261114.md`](dialogue-context-37250-37499-candidate-reconciliation-20261114.md)
and
[`dialogue-context-final-edits-followup-37250-37499-20261114.json`](dialogue-context-final-edits-followup-37250-37499-20261114.json).

The latest `37000`-`37249` pass rechecked ten in-range candidates and two
newly counted linked candidates (`40387`, `59562`); linked candidates
`1349`, `18874`, and `31375` were already reconciled. Four Korean rows were
corrected: the parallel family objectives at `37117` and `59562`, the
Stowaway Troll objective at `37189`, and the complete Sun/Frost artifact
labels at `37217`. The `37047` poem remains held because the source languages
do not resolve the nuance of `light`. Cumulative candidate reconciliation is
2,328 / 4,015 (57.98%), with 1,687 remaining. The full ledger fingerprints,
catalogs, 20 regression tests, CSV structure/newline checks, and CRLF-aware
diff validation passed. See
[`dialogue-context-37000-37249-candidate-reconciliation-20261114.md`](dialogue-context-37000-37249-candidate-reconciliation-20261114.md)
and
[`dialogue-context-final-edits-followup-37000-37249-20261114.json`](dialogue-context-final-edits-followup-37000-37249-20261114.json).

The latest `36750`-`36999` pass rechecked 14 in-range candidates and four
newly counted out-of-range linked candidates. `36916` had earlier terminology
review but was counted only once as an in-range candidate; `36982` and
`38893` had already been reconciled together. Six Korean rows were corrected
for naturalness, source meaning, unsupported sibling ages, and the
established Executioner title. Candidate reconciliation now covers 2,316 /
4,015 (57.68%), with 1,699 remaining. All ledger fingerprints, catalogs, 20
regression tests, CSV structure/newline checks, and the CRLF-aware diff check
passed. See
[`dialogue-context-36750-36999-candidate-reconciliation-20261114.md`](dialogue-context-36750-36999-candidate-reconciliation-20261114.md)
and
[`dialogue-context-final-edits-followup-36750-36999-20261114.json`](dialogue-context-final-edits-followup-36750-36999-20261114.json).

The latest `36500`-`36749` pass rechecked 18 in-range candidates and three
newly counted linked candidates (`39122`, `44006`, and `58806`). It unified
the exact-English `Confront Adept Ignas` rows at `30681` and `36563`, and
removed an unsupported hesitation at `36728`; the already-reconciled `30681`
was not double-counted. The other findings were confirmed or retained with
their evidence limits. Candidate reconciliation now covers 2,299 / 4,015
(57.26%), with 1,716 remaining. All ledger fingerprints, catalogs, 20
regression tests, CSV structure/newline checks, and the CRLF-aware diff check
passed. See
[`dialogue-context-36500-36749-candidate-reconciliation-20261114.md`](dialogue-context-36500-36749-candidate-reconciliation-20261114.md)
and
[`dialogue-context-final-edits-followup-36500-36749-20261114.json`](dialogue-context-final-edits-followup-36500-36749-20261114.json).

The `7750`-`7999` candidate follow-up reconciled all ten current candidates:
three corrections and seven retained as already supported by the active
Korean. It corrected the material names at `7813`, Niahm's self-introduction
at `7875`, and the Fate-permission wording at `7943`. The related Gravehal
materials at `8257` and `50541` were aligned as well. Seasteel references
preserve source-local capitalization, following the recorded terminology
decision. Five changed-row fingerprints were refreshed. Sequential candidate
reconciliation is 418 / 4,015 (10.41%), with 3,597 not yet reconciled. See
[`dialogue-context-07750-07999-candidate-reconciliation-20261114.md`](dialogue-context-07750-07999-candidate-reconciliation-20261114.md)
and its decision manifest.

The `8000`-`8249` follow-up reconciled all 16 candidates in the range and two
linked `SQ01` candidates (`50475`, `64633`). It corrected the awkward
`meat-birds` renderings according to whether the line describes chicken as
food or an animal to catch, and clarified the House of Valor team warning at
`8228`. Four changed-row fingerprints were refreshed; the `8146` fingerprint
was already current. The full ledger, index/catalog reproduction, both test
suites, CSV structure/BOM/newline inventory, and CRLF-aware diff check passed.
Candidate reconciliation is 436 / 4,015 (10.86%), with 3,579 not yet
reconciled. See
[`dialogue-context-08000-08249-candidate-reconciliation-20261114.md`](dialogue-context-08000-08249-candidate-reconciliation-20261114.md)
and its decision manifest.

The prior checkpoint completed `32250`-`32499` and `32500`-`32749`. The latter
checked 19 in-range candidates plus linked exact-source candidate `47165`;
it retained `32734` because its linked proposal referred to another source
line and held `32700` pending a `Templar` term decision. Candidate
reconciliation at that checkpoint was 1,933 / 4,015 (48.17%). See
[`dialogue-context-32500-32749-candidate-reconciliation-20261114.md`](dialogue-context-32500-32749-candidate-reconciliation-20261114.md)
and
[`dialogue-context-final-edits-followup-32500-32749-20261114.json`](dialogue-context-final-edits-followup-32500-32749-20261114.json).

The continuation reconciled `32750`-`32999`, `33000`-`33249`, and
`33250`-`33499` against their four-language revalidation and current edit
reports. The three ranges contributed 14, 19, and 30 newly counted in-range
candidates, respectively; one in-range candidate at `33194` had already been
counted with `16617`. Linked candidate groups added 11 previously
unreconciled IDs across the Warsworn credential, Aster-family, Commodore
Garrick, and Acyone reviews; IDs already counted in earlier ranges were not
counted again. `26805` was checked as a related Aster reference but is
`not-issue`, not a candidate. The active Korean CSV already contained the
supported edits, so this reconciliation made no further CSV changes.
Candidate reconciliation now covers 2,007 / 4,015 (49.99%), with 2,008
remaining. See the
[`32750`-`32999`](dialogue-context-32750-32999-candidate-reconciliation-20261114.md),
[`33000`-`33249`](dialogue-context-33000-33249-candidate-reconciliation-20261114.md),
and
[`33250`-`33499`](dialogue-context-33250-33499-candidate-reconciliation-20261114.md)
reports and their decision manifests.

The `33500`-`33749` reconciliation checked all 33 current candidate rows.
`33619` was already counted with exact-English duplicate `32241`, so this
range adds 32 unique candidates. The current application and follow-up
reports already contain the supported Korean; no further CSV edit was
needed. The later `33645` stammer correction supersedes the earlier retained
entry. Candidate reconciliation now covers 2,039 / 4,015 (50.78%), with
1,976 remaining. See
[`33500`-`33749`](dialogue-context-33500-33749-candidate-reconciliation-20261114.md)
and its decision manifest.

The `33750`-`33999` reconciliation checked all 29 current candidates.
`33861` and `33892` had already been counted with linked candidate groups,
so 27 new in-range candidates were added. The exact four-language duplicate
`Before The Talk` at `36075` was also reconciled with `33820`, bringing this
pass to 28 newly counted candidates. It refined `33927` and added the full
title pairing at `36075`; the other supported corrections were already in
the active Korean. Candidate reconciliation now covers 2,067 / 4,015
(51.48%), with 1,948 remaining. See
[`33750`-`33999`](dialogue-context-33750-33999-candidate-reconciliation-20261114.md)
and its decision manifest.

The `34000`-`34249` reconciliation checked the 28 IDs currently marked
`overall=candidate`; the older sequential report's 34-candidate tally includes
five IDs later dispositioned `not-issue` and `34047`, which remains uncertain
overall. `34152` was already counted with the Aster family, while linked
candidates `45625`, `53754`, and `55233` add three IDs. The supported
`Scaith` pairing was corrected at `34047` without resolving `the First`.
The following `34250`-`34499` reconciliation checked 16 current candidates
and linked Krast-brothers candidate `30331`; `26414` was already counted.
Fifteen in-range candidates and `30331` are supported by the active Korean;
`34387` remains held because the source languages differ on the faith question.
It also paired `Sorrows` at `34291` and `63068` without resolving its lore
meaning. Candidate reconciliation now covers 2,114 / 4,015 (52.65%), with
1,901 not yet adjudicated. See
[`34000`-`34249`](dialogue-context-34000-34249-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-34000-34249-20261114.json).
See also
[`34250`-`34499`](dialogue-context-34250-34499-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-34250-34499-20261114.json).

The subsequent `34500`-`34749` pass rechecked all 22 current candidates
against the four language tables and prior edits. It corrected the mixed
register at `34567`; the other current wording was confirmed. Candidate
reconciliation now covers 2,136 / 4,015 (53.20%), with 1,879 not yet
adjudicated. All ledger fingerprints, catalog reproduction checks, 20
regression tests, and the CRLF-aware diff check passed. See
[`34500`-`34749`](dialogue-context-34500-34749-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-34500-34749-20261114.json).

The following `34750`-`34999` pass rechecked 21 current candidate IDs.
`34765` and `34912` were already counted in linked reconciliations, leaving 19
newly counted candidates and a total of 2,155 / 4,015 (53.67%), with 1,860
remaining. Five supported corrections addressed conversational wording and
English pairings while leaving unresolved entity and location meanings held.
Ledger and catalog checks, 20 regression tests, and CRLF-aware diff validation
passed. See
[`34750`-`34999`](dialogue-context-34750-34999-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-34750-34999-20261114.json).

The subsequent `35000`-`35249` pass rechecked 20 current candidates.
`35070` was already reconciled with the 20-row `Irion, King of Cups` group,
leaving 19 newly counted IDs. Three rows were refined, and the Shard grade
meanings remain held despite adding their English labels. Candidate
reconciliation now covers 2,174 / 4,015 (54.17%), with 1,841 remaining.
Ledger, catalog, 20-test, and CRLF-aware diff checks passed. See
[`35000`-`35249`](dialogue-context-35000-35249-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-35000-35249-20261114.json).

The next `35250`-`35499` pass rechecked 35 current candidates against all
four language tables and prior edit decisions. `35478` had already been
reconciled with `24660`, so the range adds 34 newly counted candidates. The
proposed corrections were already present; the prior `35465` wording was
retained after its explicit follow-up review. No CSV or fingerprint change
was needed. Candidate reconciliation now covers 2,208 / 4,015 (54.99%), with
1,807 remaining. See
[`35250`-`35499`](dialogue-context-35250-35499-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-35250-35499-20261114.json).

The following `35500`-`35749` pass rechecked 38 candidates. The shared-source
findings at `35580` and `35655` had already been reviewed, leaving 36 newly
counted candidates. It corrected the questioning response at `35565` and
clarified the flesh-and-blood Anokatos contrast at `35594`; the remaining
supported wording was confirmed, while eight evidence-limited holds remain
open. Candidate reconciliation now covers 2,244 / 4,015 (55.89%), with 1,771
remaining. All ledger fingerprints, catalogs, 20 tests, CSV structure/newline
checks, and the CRLF-aware diff check passed. See
[`35500`-`35749`](dialogue-context-35500-35749-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-35500-35749-20261114.json).

The following `35750`-`35999` pass rechecked 12 candidates. It restored
`첫째 스케이스(First Scaith)` at `35959` according to the previously accepted
D-19835 decision; the other supported corrections were already present.
Five separate meaning/context holds remain open. Candidate reconciliation
now covers 2,275 / 4,015 (56.66%), with 1,740 remaining. All ledger
fingerprints, catalogs, 20 tests, CSV structure/newline checks, and the
CRLF-aware diff check passed. See
[`35750`-`35999`](dialogue-context-35750-35999-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-35750-35999-20261114.json).

The latest `36250`-`36499` pass rechecked all three current candidates, adding
three new IDs. It aligned `36279` to the established `실라리타(Syllareta)`
form and refined `36433` to the source-supported covert-agent meaning,
superseding earlier retentions. The `36268` 주문 term was already correct;
its separate location conflict remains held, as do register holds at `36427`
and `36460`. Candidate reconciliation now covers 2,278 / 4,015 (56.74%),
with 1,737 remaining. See
[`36250`-`36499`](dialogue-context-36250-36499-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-36250-36499-20261114.json).

The preceding `36000`-`36249` pass rechecked 21 candidates. `36075` and
`36231` were already reconciled, leaving 19 newly counted IDs. Fourteen rows
were corrected for missing English labels, established terminology, and
conversational or sentence-level naturalness. The pre-existing `36017` edit
was confirmed and its fingerprint refreshed. Holds `36226` and `36235`
remain unresolved for insufficient register and referent evidence.
All 65,135 ledger fingerprints, catalog reproduction checks, 20 regression
tests, CSV structure/newline checks, and CRLF-aware diff validation passed.
See
[`36000`-`36249`](dialogue-context-36000-36249-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-36000-36249-20261114.json).

## Regional Asset Review (2026-11-14)

The candidate-application summary initially marked `default:49259` as already
matching its approved proposal, but the current Korean row still lacked the
reported Aster-family English pairings and used a literal succession phrase.
The name-format and naturalness issues were corrected after direct
four-language comparison. The testament already had quotation marks, so that
format candidate was not changed. Eight embedded line breaks were preserved;
only the ID's source fingerprint was refreshed. See
[`default:49259`](dialogue-context-49259-followup-20261114.md).
The same cross-check corrected the missing `Arne` pairing at `default:49795`
and naturalized the trader's offer at `default:49851`. The separate uncertain
canonical-spelling question at `49795` remains open. See
[`default:49795` and `default:49851`](dialogue-context-49795-49851-followup-20261114.md).
The next candidate-range cross-check corrected conversational wording at
`default:50014` and `default:50016`; other candidates in that range already
matched their supported proposals. See
[`default:50014` and `default:50016`](dialogue-context-50014-50016-followup-20261114.md).
The following range required three further corrections at `default:50284`,
`50342`, and `50497`, covering conversational register, the established
`피해 증폭` crafting modifier, and the accepted `테스타먼트(The Testament)`
form. Separate item-subtype and faction-identity questions remain unresolved.
See
[`default:50284`, `50342`, and `50497`](dialogue-context-50284-50342-50497-followup-20261114.md).
The next source cross-check confirmed the complete `Circlet of Arkes` label
was already present at `default:50508` and refreshed its fingerprint.
At `50533`, it aligned the Korean location with established usage while
retaining the exact source spelling `Hurvar's Doorsil`; direct comparison
with `base:2774` and the other `Hurvar's Doorsill` references resolved the
earlier format hold. See
[`default:50508` and `default:50533`](dialogue-context-50508-50533-followup-20261114.md).

The targeted `SQ57` follow-up applied supported corrections at
`default:36838`, `38426`, `39444`, `51665`, and `59610` among candidates
previously recorded for `1253016.quest_bxml`. This is not a full review of all
767 linked IDs. Six older ledger links omit `.quest_bxml` and remain
unchanged; the asset association supports grouping only, not per-line
speakers or playback order. The five changed IDs' source fingerprints were
refreshed and validated. See
[`dialogue-context-1253016-sq57-translation-followup-20261114.md`](dialogue-context-1253016-sq57-translation-followup-20261114.md).

The `1604643.quest_bxml` and `570082.quest_bxml` reviews are recorded above in
the audit README. The latest pass revalidated all 111 IDs linked to
`528134.quest_bxml` (`SQ18`) and applied 13 source-supported corrections.
Seven exact-English duplicate groups (20 rows) have matching Korean, and all
four-language line-break and brace-token signatures match. The nine NPC
symbols and 40 handlers establish quest-level association only, not
individual speakers or playback order. One historical asset-link suffix
discrepancy was preserved. The full ledger, index/catalog reproduction, 20
tests, CSV structure and newline inventory, and CRLF-aware diff check pass;
see the SQ18 report in the audit README.

The latest pass revalidated all 108 IDs linked to
`2005688.quest_bxml` (`DLC1_PH04b`). It applied supported English-pairing
corrections at `default:28751` and `default:43309`; existing wording at
`28144`, `52582`, and `64193` was retained after rechecking. Five
exact-English duplicate groups (16 rows) had matching Korean, and no
four-language line-break or runtime/layout-token mismatch was found.

The asset contains one Deirdre Gwint NPC symbol and 35 handlers, but no
per-key handler mapping. Individual speakers and playback order therefore
remain unassigned/unknown. The generated catalog links 108 IDs but reports
only 106 exact ledger links because existing rows `47501` and `47611` use
`2005688` without `.quest_bxml`; their old ledger metadata was preserved.
The full ledger and generated catalogs validate, 20 related tests pass, and
the CSV row count, BOM, newline inventory, and CRLF-aware diff check are
preserved. See
[`2005688.quest_bxml`](dialogue-context-2005688-dlc1-ph04b-deirdre-revalidation-20261114.md).

The latest pass revalidated all 471 asset-linked IDs across
`587818.quest_bxml`, `545731.quest_bxml`, and `639212.quest_bxml`. Eleven
supported corrections were applied at `default:5195`, `12243`, `13748`,
`17377`, `42583`, `45358`, `1002`, `9336`, `20937`, `33482`, and `41492`.
Existing ledger judgments were preserved; only the 11 edited IDs'
`source_fingerprint` values were refreshed. Four-language line-break and
runtime-token checks found no mismatches, and exact-English duplicate groups
across these linked IDs have matching Korean. Existing asset-link gaps and
uncertain source readings remain documented. The NPC symbols and dialog
handlers are asset-level evidence only and do not establish individual
speakers or playback order. See
[`587818.quest_bxml`](dialogue-context-587818-cadoroc-revalidation-20261114.md),
[`545731.quest_bxml`](dialogue-context-545731-faitir-revalidation-20261114.md),
and
[`639212.quest_bxml`](dialogue-context-639212-bisarane-revalidation-20261114.md).

The next asset pass revalidated all 108 IDs linked to `518702.quest_bxml`
(`SQ15`). The quest ID and two Enconeg Holn NPC symbols establish quest-level
association only, not per-line speakers or order. Five missing pairings for
the capitalized quest label `Nymph` were added at `default:6769`, `13350`,
`45454`, `48234`, and `65022`; existing `19467` was retained. Generic
lowercase uses were not changed. The prior correction at `26939` was already
present, the fish-related wording at `27012` was retained, and `62077` remains
held because its exact kinship relation is not established for that line.
The five edited fingerprints were refreshed without changing other ledger
fields. Duplicate, line-break, and runtime-token checks found no mismatch.
See
[`518702.quest_bxml`](dialogue-context-518702-sq15-enconeg-revalidation-20261114.md).

The next asset pass revalidated all 110 IDs linked to
`1966401.quest_bxml` (`DLC2_SQ09`). Its four NPC symbols support the quest
grouping only, not line-level speakers or order. Previously approved fixes
at `default:43941` and `default:44930` are present. The quest context resolves
the earlier `30718` question as a reference to the person Hystis; the current
Korean remains unchanged. `52546` retains the supported bilingual form while
the title-versus-address distinction remains unresolved, and `63960` already
has both source names paired. Three asset-link suffix discrepancies are
documented without changing the ledger. Eight duplicate-English groups and
format signatures validate; no CSV or fingerprint change was needed. See
[`1966401.quest_bxml`](dialogue-context-1966401-dlc2-sq09-revalidation-20261114.md).

## Post-review Translation Edits (2026-11-14)

The latest continuation applied supported corrections for `32000`-`32249`
and `32250`-`32499`: 25 and 13 unique `default` IDs, respectively, including
directly related duplicate and terminology rows. The combined total is 38
unique changed IDs. Uncertain findings remain held, and already-correct
translations were retained.
The ledger, index/catalog checks, 20 tests, CSV structure, and CRLF-aware diff
check pass. Candidate-application totals still use unreconciled historical
baselines, so no overall completion percentage is claimed. See
[`32000`-`32249`](dialogue-context-edit-batch-20261114-32000-32249.md) and
[`32250`-`32499`](dialogue-context-edit-batch-20261114-32250-32499.md).

The `32500`-`32749` application then corrected 15 in-range IDs and four
related rows, including the Lady's Children title and the exact-source
duplicate at `32711` / `47165`. Eight `Mudhold Fasting` rows in `default`
and `base:1353`, variant `11`, were verified as already updated; their
findings and fingerprints are now reconciled. Twenty-seven `default`
fingerprints validate, as do the full ledger, index/catalog reproducibility,
20 tests, CSV structure, and CRLF-aware diff check. A Templar naming question
and evidence-limited holds remain open; `32734` was not changed because its
linked proposal does not match that ID's English source. See
[`32500`-`32749`](dialogue-context-edit-batch-20261114-32500-32749.md).

The `32750`-`32999` batch rechecked its candidates against all four language
tables and applied nine in-range corrections plus four linked Warsworn
credential corrections at `22955`, `26414`, `38609`, and `42785`. `32891`
already had the Amaldor and Mel Senshir pairings; its malformed
`Ancient-of -War` title remains held. Thirteen text rows changed, and 14
reviewed fingerprints validate. CSV structure and mixed line endings,
the complete ledger, index/catalog checks, 20 tests, and the CRLF-aware diff
check pass. See
[`32750`-`32999`](dialogue-context-edit-batch-20261114-32750-32999.md).

The `33000`-`33249` batch reconciled 23 Korean rows, including seven linked
rows outside the range. It completed the 20-row `Irion, King of Cups` title
group, unified both `The Road Patrol` labels, and aligned six `Aster family`
references to `애스터(Aster) 가문`. Exact duplicate dialogue at
`16617`/`33194` now matches. Five evidence-limited holds remain open. All 23
fingerprints, the complete ledger, CSV structure, index/catalogs, 20 tests,
and the CRLF-aware diff check validate. See
[`33000`-`33249`](dialogue-context-edit-batch-20261114-33000-33249.md).
The `33250`-`33499` batch reconciled 24 in-range IDs and eight linked rows,
including the `Acyone` objectives and the repeated `Commodore Garrick` title.
Already-correct name pairings were retained; five evidence-limited holds
remain open. The 32 reviewed fingerprints, full ledger, index/catalogs, 20
tests, CSV BOM/order/newline inventory, and CRLF-aware diff check validate.
See
[`33250`-`33499`](dialogue-context-edit-batch-20261114-33250-33499.md).
The previously assigned `33500`-`33749` range was subsequently completed as
part of the `33500`-`35999` batch. The later candidate-application status
and remaining evidence-limited holds are summarized in
[`dialogue-context-final-application-20261114.md`](dialogue-context-final-application-20261114.md);
do not resume at `33500`.

Following the user's direction to apply source-supported findings, the
translation-edit batches have proceeded through `5000`-`5999`: 31
`default` IDs in `0`-`999`, 70 rows while adjudicating `1000`-`1999`, 52
rows in `2000`-`2999`, 98 rows in `3000`-`3999`, and 22 rows in
`4000`-`4999`, plus 21 rows in `5000`-`5999`. Decisions were checked against the current English,
Japanese, Chinese, and Korean rows; exact-English duplicates and
context-related term groups were reviewed across their occurrences.
Uncertain findings remain held rather than guessed. The decision log and
ID-scoped application manifests are in
[`dialogue-context-edit-batch-20261113.md`](dialogue-context-edit-batch-20261113.md)
and the range-specific reports
[`3000`-`3999`](dialogue-context-edit-batch-20261113-3000-3999.md),
and
[`4000`-`4999`](dialogue-context-edit-batch-20261113-4000-4999.md) and
[`5000`-`5999`](dialogue-context-edit-batch-20261113-5000-5999.md), with
manifests for
[`2000`-`2999`](dialogue-context-edit-batch-20261113-2000-2999.json),
[`3000`-`3999`](dialogue-context-edit-batch-20261113-3000-3999.json), and
[`4000`-`4999`](dialogue-context-edit-batch-20261113-4000-4999.json) and
[`5000`-`5999`](dialogue-context-edit-batch-20261113-5000-5999.json).
For each batch, only fingerprints corresponding to edited Korean rows were
refreshed; all other ledger fields and row order were preserved. The ledger
validates against all four language tables; index/catalog reproduction, nine
context-index tests, 11 CSV-preservation tests, and the CRLF-aware diff check
pass. The active `default` CSV retains its BOM and 71,845 CRLF / 244 LF-only
newline inventory. At this checkpoint, the first six batches had adjudicated
165 of approximately 3,155 candidate IDs (about 5.2%).

Three later translation-edit batches continued sequentially:

- `6000`-`6999`: 45 candidates adjudicated and 76 unique rows changed.
- `7000`-`7999`: 42 candidates adjudicated and 60 unique rows changed.
- `8000`-`8999`: 46 candidates adjudicated and 59 unique rows changed.

The latest batch rechecked each candidate against all four language rows and
aligned directly related terminology or repeated text where supported. It
corrected 42 candidates, recognized three as already resolved by earlier
edits, and held `8992` because English and Japanese differ in nuance. The
full report is
[`dialogue-context-edit-batch-20261113-8000-8999.md`](dialogue-context-edit-batch-20261113-8000-8999.md).
Candidate adjudication now covers 292 of approximately 3,155 IDs (about
9.3%); later candidates remain in progress.

The next two source-based editing batches are complete. IDs `9000`-`9999`
adjudicated 62 candidates (58 corrections and four already-resolved
pairings), changing 80 unique rows. IDs `10000`-`10999` adjudicated 51 new
candidates and completed the prior `10945` finding; the manifest has 72
ID-scoped applications across 59 unique rows, including seven related rows
outside the range. Evidence-limited findings remain unresolved. The latter
batch's saved CSV reverses exactly to its manifest input hash, and its 59
rows preserve line-break and token signatures. Full ledger validation,
index/catalog reproducibility, nine index tests, 11 CSV-preservation tests,
and CRLF-aware diff checks passed. Candidate adjudication now covers 405 of
approximately 3,155 (about 12.8%). See
[`9000`-`9999`](dialogue-context-edit-batch-20261113-9000-9999.md) and
[`10000`-`10999`](dialogue-context-edit-batch-20261113-10000-10999.md).
The next sequential range is `11000`-`11999`.

IDs `11000`-`11999` are now adjudicated: all 17 new candidates were
rechecked against English, Japanese, Chinese, and Korean, and 21 supported
ID-scoped operations changed 19 unique rows. Related `Epic Gem` labels were
aligned at `167`, `11125`, and `38457`; `reagents` uses the manual's `시약`
at `11069`; and the `11599` mining job terms were aligned to `19029` and
`14767` while its other technical terms remain held. The `11907` label now
uses established `Cureseeker`. The manifest reverses exactly to its input
hash; all 65,135 ledger fingerprints, index/catalog reproduction, nine index
tests, 11 CSV-preservation tests, and CRLF-aware diff checks passed. Candidate
adjudication now covers 422 of approximately 3,155 (about 13.4%). See
[`11000`-`11999`](dialogue-context-edit-batch-20261113-11000-11999.md).
The `12000`-`12999` batch adjudicated all 35 candidates: 34 received
source-supported corrections, and `12766` was already resolved. It applied
80 guarded operations to 79 unique rows, including linked Irion, Hermit
Smith, Testament, Ordination Tome, and Ambassador Kulder groups. The
four-language ledger, index/catalog checks, nine context-index tests, 11
CSV-preservation tests, and CRLF-aware diff check passed. Evidence-limited
findings remain held. Candidate adjudication now covers 457 of approximately
3,155 (about 14.5%). See
[`12000`-`12999`](dialogue-context-edit-batch-20261113-12000-12999.md).
The `13000`-`13999` batch adjudicated all 37 candidates: 33 were corrected,
three were already resolved, and one was retained. It applied 115 guarded
text-fragment operations to 112 unique rows, including related Grian Shane,
Master's Tallow, Hurvar's Doorsill, Lupoku, The Burn, ash-urn, and `dreg`
groups. The 65,135-ID ledger, index/catalog checks, 11 preservation tests,
and CRLF-aware diff check passed; evidence-limited findings remain held.
Candidate adjudication now covers 494 of approximately 3,155 (about 15.7%).
See
[`13000`-`13999`](dialogue-context-edit-batch-20261113-13000-13999.md)
and its
[manifest](dialogue-context-edit-batch-20261113-13000-13999.json).

The `14000`-`14999` batch adjudicated all 59 candidates: 50 were corrected,
seven were already resolved, one was retained, and one remains held. It
applied 98 guarded operations to 90 unique rows. The `15000`-`15999` batch
adjudicated all 56 candidates: 50 corrections, four already-resolved items,
and two retained items; 103 operations changed 98 unique rows. The
`16000`-`16999` batch adjudicated all 36 current candidates: 30 corrections,
three already-resolved items, and three retained items; 50 operations changed
49 unique rows. Directly related SQ122 notice terminology and several
source-name groups were checked across their full IDs. The active CSV retains
its BOM, 65,135 ordered records, and 71,845 CRLF / 244 LF-only record
endings. The corresponding 15k and 16k reports record output hashes,
fingerprint updates, and verification details. Ledger validation,
index/catalog reproduction, nine context-index tests, 11 preservation tests,
and CRLF-aware diff checks passed. Candidate adjudication now covers 636 of
approximately 3,155 (about 20.2%); work continues with `17000`-`17999`.
See
[`14000`-`14999`](dialogue-context-edit-batch-20261113-14000-14999.md),
[`15000`-`15999`](dialogue-context-edit-batch-20261113-15000-15999.md),
and
[`16000`-`16999`](dialogue-context-edit-batch-20261113-16000-16999.md).

The `17000`-`17999` batch re-adjudicated 34 ledger candidates: 31 were
corrected, two were already resolved, and one was retained. Related groups
were checked and 56 unique CSV rows changed; two Kiftal particles were
corrected after application. See the
[batch report](dialogue-context-edit-batch-20261114-17000-17999.md).
The older approximate candidate denominator has not been reconciled with
the ledger's 4,015 candidate rows, so no new cumulative percentage is
claimed. Continue with `18000`-`18999`.

The `18000`-`18999` candidate batch subsequently considered all 32 ledger
candidates: 25 corrected, three already resolved, one retained, and three
held. Related entries bring the CSV edits to 33 unique IDs. Its
[report](dialogue-context-edit-batch-20261114-18000-18999.md) records the
decisions and checks. Continue with `19000`-`19999`; the wider work remains
incomplete.

The `19000`-`19999` batch is in progress: `19000`-`19249` has nine
corrections, two already resolved, and two held; `19250`-`19499` has 17
corrections with four candidates not yet adjudicated. Current hashes and
checks are in the [in-progress report](dialogue-context-edit-batch-20261114-19000-19999.md).
Resume with `19311`, `19320`, `19431`, and `19466`, then `19500`-`19999`.

Subsequently the four remaining `19250`-`19499` candidates were corrected,
along with three related flower labels; all 21 candidates in that subrange
have now been addressed. The latest checkpoint and hashes are in the same
in-progress report. Continue with `19500`-`19999`.

Five `19500`-`19749` action objectives were subsequently corrected. The
remaining IDs, current hashes, and verification are recorded in the same
in-progress report; the rest of this subrange and `19750`-`19999` remain.

Candidate application has since continued through `27000`-`27999`. In that
range, 54 current candidates were adjudicated: three translations were
corrected, 50 already reflected their supported findings, and the `Templar`
title at `27767` remains pending a glossary decision. A cross-corpus
Silkfarmer review also standardized five related rows to `비단 채집꾼`,
while retaining `비단 채취` for the activity. Validation exposed 186 stale
source fingerprints on Korean rows already changed in the worktree; only
those fingerprint fields were refreshed, after which all 65,135 ledger
fingerprints validated. See
[`dialogue-context-edit-batch-20261114-27000-27999.md`](dialogue-context-edit-batch-20261114-27000-27999.md).
The candidate denominator remains unreconciled, so no cumulative
application percentage is claimed. Continue with `28000`-`28249`.

The preceding sequential revalidation, `63750`-`63999`, compared all 250
active Korean rows with English, Japanese, and Chinese, rechecked 73 existing
fingerprints, and appended 177 IDs. The new rows record 45 evidence-limited
holds and 132 `not-issue` results; 21 further hold questions on existing IDs
remain report-only. The ledger covered 64,313 / 65,135 IDs (98.74%), leaving
822; sequential coverage reached `63999`. Fifty-seven exact-English
duplicate groups touched the range (59 range IDs; 1,225 corpus rows). The
only Korean mismatch was the already-recorded `25576`/`58994`/`63906` group,
whose existing candidate remains supported. Each language had five
multiline rows and 30 embedded breaks; the Korean's embedded CRLF separators
were preserved against LF source separators. Placeholder order at `63818`
and localized-label order at `63868` remain unresolved; the supported order
at `63931` and Japanese-template order at `63998` are preserved. Of 250 IDs,
194 had indexed asset associations (200 links across 124 assets), and 56 had
none. Of the 177 new IDs, 121 were linked (126 links across 64 assets), and
56 were unlinked. Asset associations do not establish per-key speakers or
playback order. See
[`dialogue-context-default-63750-63999-revalidation-20261113.md`](dialogue-context-default-63750-63999-revalidation-20261113.md).
All ledger fingerprints, regenerated index/catalog checks, nine related
tests, and the CRLF-aware diff check passed. No translation CSV was modified.

The preceding sequential revalidation, `63500`-`63749`, compared all 250
active Korean rows with English, Japanese, and Chinese, rechecked 73 existing
fingerprints, and appended 177 IDs. The new rows recorded 39 evidence-limited
holds and 138 `not-issue` results; 12 further hold questions on existing IDs
remain report-only, alongside eight previously recorded context candidates
that were rechecked without rewriting their rows. The ledger covered 64,136 /
65,135 IDs (98.47%), leaving 999; sequential coverage reached `63749`.
Sixty-two exact-English duplicate groups touched the range (65 range IDs;
1,362 corpus rows), with matching Korean in every group. Each language had
five multiline rows and 60 embedded breaks; the Korean's embedded CRLF
separators were preserved against LF source separators. Runtime-marker
skeletons and order matched. Of 250 IDs, 195 had indexed asset associations
(200 links across 138 assets), and 55 had none. Of the 177 new IDs, 122 were
linked (126 links across 73 assets), and 55 were unlinked. Asset associations
do not establish per-key speakers or playback order. See
[`dialogue-context-default-63500-63749-revalidation-20261113.md`](dialogue-context-default-63500-63749-revalidation-20261113.md).
All ledger fingerprints, regenerated index/catalog checks, nine related
tests, and the CRLF-aware diff check were verified. No translation CSV was
modified.

The preceding sequential revalidation, `63250`-`63499`, compared all 250
active Korean rows with English, Japanese, and Chinese, rechecked 64 existing
fingerprints, and appended 186 IDs. Twelve new correction candidates and 17
new evidence-limited rows are recorded; four further questions on existing
rows remain report-only. The ledger covered 63,959 / 65,135 IDs (98.19%),
leaving 1,176; sequential coverage reached `63499`. Forty-seven exact-English
duplicate groups touched the range (48 range IDs; 1,005 corpus rows), with
matching Korean in every group. English and Chinese had ten multiline rows
and 30 embedded breaks; Japanese and Korean had nine rows and 29 breaks.
ID `63429` accounts for the sole logical break-count difference. All nine
Korean embedded separators remain CRLF while source separators are LF; they
were preserved. Of 250 IDs, 187 had indexed asset associations (191 links
across 129 assets), and 63 had none. Of the 186 new IDs, 123 were linked
(126 links across 76 assets), and 63 were unlinked. Asset associations do
not establish per-key speakers or playback order. See
[`dialogue-context-default-63250-63499-revalidation-20261113.md`](dialogue-context-default-63250-63499-revalidation-20261113.md).
All ledger fingerprints, regenerated index/catalog checks, related tests,
and the CRLF-aware diff check were verified. No translation CSV was modified.

The preceding sequential revalidation, `63000`-`63249`, compared all 250
active Korean rows with English, Japanese, and Chinese, rechecked 62 existing
fingerprints, and appended 188 IDs. Seven correction candidates, eight
evidence-limited meaning/format holds, and 12 embedded-line-ending/layout
holds are recorded. The ledger covered 63,773 / 65,135 IDs (97.91%), leaving
1,362; sequential coverage reached `63249`. Sixty exact-English duplicate
groups touched the range (63 range IDs; 1,284 corpus rows), with matching
Korean in every group. Eleven multiline rows contain 34 embedded breaks in
English, Japanese, and Korean; Chinese has one additional separator at
`63217`. Korean embedded separators are CRLF while source separators are LF,
so they were held without normalization. Of 250 IDs, 191 have indexed asset
associations (195 links across 126 assets), and 59 have none. Of the 188 new
IDs, 129 are linked (133 links across 72 assets), and 59 are unlinked. Asset
associations do not establish per-key speakers or playback order. See
[`dialogue-context-default-63000-63249-revalidation-20261113.md`](dialogue-context-default-63000-63249-revalidation-20261113.md).
All ledger fingerprints, regenerated index/catalog checks, related tests,
and the CRLF-aware diff check are verified. No translation CSV was modified.

The preceding sequential revalidation, `62250`-`62499`, compared all 250
active Korean rows across four languages, rechecked 67 existing fingerprints,
and appended 183 IDs. Five new correction candidates and one evidence-limited
meaning hold were recorded; six embedded-line-ending holds are recorded
separately. The ledger covered 63,210 / 65,135 IDs (97.05%), leaving 1,925;
sequential coverage reached `62499`. Forty-nine exact-English duplicate
groups touched the range (51 range IDs; 742 corpus rows), with matching
Korean in every group. Six multiline rows contained 28 embedded breaks in
each language; all Korean embedded separators were CRLF while the source
separators were LF. Of 250 IDs, 196 had indexed asset associations (200
links across 119 assets), and 54 had none. Of the 183 new IDs, 129 were
linked (132 links across 69 assets), and 54 were unlinked. Asset associations
do not establish per-key speakers or playback order. See
[`dialogue-context-default-62250-62499-revalidation-20261113.md`](dialogue-context-default-62250-62499-revalidation-20261113.md).

The preceding sequential revalidation, `62000`-`62249`, compared all 250
active Korean rows across four languages, rechecked 79 existing fingerprints,
and appended 171 IDs. Nine new correction candidates and five
evidence-limited meaning/register holds were recorded; seven embedded
line-ending holds were recorded separately, with two overlapping candidates.
The ledger covered 63,027 / 65,135 IDs (96.77%), leaving 2,108; sequential
coverage reached `62249`. Sixty-three exact-English duplicate groups
touched the range (67 range IDs; 1,746 corpus rows), with matching Korean
in every group. Seven multiline rows contained 30 embedded breaks in each
language; all Korean embedded separators were CRLF while source separators
were LF. Of 250 IDs, 197 had indexed asset associations (198 links across
136 assets), and 53 had none. Of the 171 new IDs, 118 were linked (119 links
across 67 assets), and 53 were unlinked. Asset associations do not establish
per-key speakers or playback order. See
[`dialogue-context-default-62000-62249-revalidation-20261113.md`](dialogue-context-default-62000-62249-revalidation-20261113.md).

The preceding sequential revalidation, `61750`-`61999`, compared all 250
active Korean rows across four languages, rechecked 80 existing fingerprints,
and appended 170 IDs. Eight new correction candidates and nine
evidence-limited ledger holds were recorded; five existing candidates and
six existing holds were rechecked without changing their append-only rows.
The ledger covered 62,856 / 65,135 IDs (96.50%), leaving 2,279; sequential
coverage reached `61999`. Fifty-one exact-English duplicate groups touched
the range (55 range IDs; 1,391 corpus rows), with matching Korean in every
group. Eight multiline rows contained 32 embedded breaks in each language;
all Korean embedded separators were CRLF while the source separators were
LF. Of 250 IDs, 203 had indexed asset associations (206 links across 137
assets), and 47 had none. Of the 170 new IDs, 123 were linked (126 links
across 72 assets), and 47 were unlinked. Asset associations do not establish
per-key speakers or playback order. See
[`dialogue-context-default-61750-61999-revalidation-20261113.md`](dialogue-context-default-61750-61999-revalidation-20261113.md).

The preceding sequential revalidation, `61500`-`61749`, compared all 250
active Korean rows across four languages, rechecked 63 existing fingerprints,
and appended 187 IDs. Seven new correction candidates and 11 evidence-limited
holds were recorded; five existing candidates and one existing
speech-level hold were rechecked without changing their append-only rows.
The ledger covers 62,686 / 65,135 IDs (96.24%), leaving 2,449; sequential
coverage reaches `61749`, next is `61750`-`61999`. Fifty-seven exact-English
duplicate groups touch the range (59 range IDs; 1,266 corpus rows), with
matching Korean in every group. Nine multiline rows contain 24/18/24/24
embedded breaks across English/Japanese/Chinese/Korean; `61578` is the only
logical break-count mismatch. Nine Korean fields use embedded CRLF where
the sources use LF, and are held without normalization. Of 250 IDs, 189 have
indexed asset associations (190 links across 122 assets), and 61 have none.
Of the 187 new IDs, 126 are linked (126 links across 74 assets), and 61 are
unlinked. Asset associations do not establish per-key speakers or playback
order. See
[`dialogue-context-default-61500-61749-revalidation-20261113.md`](dialogue-context-default-61500-61749-revalidation-20261113.md).

The latest sequential revalidation, `61250`-`61499`, compared all 250 active
Korean rows across four languages, rechecked 71 existing fingerprints, and
appended 179 IDs. Seven new correction candidates and one evidence-limited
hold were recorded; six existing candidates and one existing hold were
rechecked without changing their append-only rows. The ledger covers 62,499 /
65,135 IDs (95.95%), leaving 2,636; sequential coverage reaches `61499`, next
is `61500`-`61749`. Fifty-five exact-English duplicate groups touch the range
(57 range IDs; 694 corpus rows). Korean matches within every group except
`Die, mortal!` (`54719`, `61482`), where Japanese also differs in register.
Three multiline rows contain seven embedded breaks in each language, with
matching per-row counts and blank-paragraph structure. Of 250 IDs, 202 have
indexed asset links (205 links across 127 assets), and 48 have none. Of the
179 new IDs, 131 are linked (134 links across 72 assets), and 48 are
unlinked. Asset associations do not establish per-key speakers or playback
order. See
[`dialogue-context-default-61250-61499-revalidation-20261113.md`](dialogue-context-default-61250-61499-revalidation-20261113.md).
All 62,499 ledger fingerprints validate; regenerated index/catalog checks,
related tests, and the CRLF-aware diff check pass. No translation CSV was
modified.

The preceding sequential revalidation, `61000`-`61249`, compared all 250
active Korean rows across four languages, rechecked 44 existing fingerprints,
and appended 206 IDs. Eleven new correction candidates and 17 evidence-limited
holds were recorded; three existing candidates were rechecked without
changing their append-only rows. Three additional findings remain
report-only. The ledger covered 62,320 / 65,135 IDs (95.68%), leaving 2,815;
sequential coverage reached `61249`. See
[`dialogue-context-default-61000-61249-revalidation-20261113.md`](dialogue-context-default-61000-61249-revalidation-20261113.md).

The preceding sequential revalidation, `60750`-`60999`, compared all 250
active Korean rows across four languages, rechecked 60 existing fingerprints,
and appended 190 IDs. Seven new correction candidates and four new holds were
recorded; five existing candidates and two existing holds were rechecked
without changing their append-only rows. The ledger covered 62,114 / 65,135
IDs (95.36%), leaving 3,021; sequential coverage reached `60999`. See
[`dialogue-context-default-60750-60999-revalidation-20261113.md`](dialogue-context-default-60750-60999-revalidation-20261113.md).

The preceding sequential revalidation, `60250`-`60499`, compared all 250
active Korean rows across four languages, rechecked 65 existing fingerprints,
and appended 185 IDs. Nine new-row correction candidates and seven new holds
were recorded; seven existing candidates and one existing hold were
rechecked without changing their append-only rows. One finding at an existing
ID remains report-only. The ledger covered 61,745 / 65,135 IDs (94.79%),
leaving 3,390; sequential coverage reached `60499`, next was `60500`-`60749`.
Fifty-nine exact-English duplicate groups touch the range (1,178 rows across
those groups); 59 IDs participate, with matching Korean in every group.
Three multiline rows contain 19 embedded breaks in each language, with
matching per-row counts and runtime-token/markup sequences. Of 250 IDs, 215
have indexed asset links (221 links across 136 assets), and 35 have none.
Of the 185 new IDs, 150 are linked (154 links across 79 assets), and 35 are
unlinked. Asset associations do not establish per-key speakers or playback
order. See
[`dialogue-context-default-60250-60499-revalidation-20261113.md`](dialogue-context-default-60250-60499-revalidation-20261113.md).
All 61,745 ledger fingerprints validate; regenerated index/catalog checks,
nine related tests, and the CRLF-aware diff check passed. No translation CSV
was modified.

The preceding sequential revalidation, `60000`-`60249`, compared all 250
active Korean rows across four languages, rechecked 58 existing fingerprints,
and appended 192 IDs. Twelve new-row correction candidates and 15 new ledger
holds were recorded; three existing candidates and five prior `not-issue`
rows were rechecked without changing their append-only rows. Five findings
at existing IDs remain report-only. The ledger covered 61,560 / 65,135 IDs
(94.51%), leaving 3,575; sequential coverage reached `60249`, next was
`60250`-`60499`. Fifty-three exact-English duplicate groups touched the
range (1,147 rows across those groups); 57 IDs participated, with matching
Korean in every group. Ten multiline rows contained 60/60/61/60 embedded
breaks across English/Japanese/Chinese/Korean; Chinese alone had one extra
source break at `60101`, while Korean matched English/Japanese. At `60016`,
Korean marker order matched English/Japanese, while Chinese differed. Of 250
IDs, 188 had indexed asset links (191 links across 123 assets), and 62 had
none. Of the 192 new IDs, 130 were linked (132 links across 72 assets), and
62 were unlinked. Asset associations do not establish per-key speakers or
playback order. Fingerprint validation, regenerated index/catalog checks,
nine related tests, and the CRLF-aware diff check passed. No translation CSV
was modified. See
[`dialogue-context-default-60000-60249-revalidation-20261113.md`](dialogue-context-default-60000-60249-revalidation-20261113.md).

The latest sequential revalidation, `59750`-`59999`, compared all 250 active
Korean rows across four languages, rechecked 60 existing fingerprints, and
appended 190 IDs. Ten new-row correction candidates and three new holds were
recorded; nine existing candidates were rechecked without changing their
append-only rows. Three new findings at existing IDs remain report-only.
The ledger covers 61,368 / 65,135 IDs (94.22%), leaving 3,767; sequential
coverage reaches `59999`, next is `60000`-`60249`. Fifty-two exact-English
duplicate groups touch the range (978 rows across those groups); 54 IDs
participate, with matching Korean in each group. Six multiline rows contain
34 embedded breaks in each language. Marker identities match; the
language-specific argument-order difference at `59961` is preserved. Of 250
IDs, 200 have indexed asset links (207 links across 128 assets), and 50 have
none. Of the 190 new IDs, 140 are linked (146 links across 76 assets), and
50 are unlinked. Asset associations do not establish per-key speakers or
playback order. Fingerprint validation, regenerated index/catalog checks,
nine related tests, and the CRLF-aware diff check passed. No translation CSV
was modified. See
[`dialogue-context-default-59750-59999-revalidation-20261113.md`](dialogue-context-default-59750-59999-revalidation-20261113.md).

The preceding sequential revalidation, `59500`-`59749`, compared all 250
active Korean rows across four languages, rechecked 69 existing fingerprints,
and appended 181 IDs. Fourteen new-row correction candidates and one new
hold were recorded; nine existing candidates and two holds were rechecked
without changing their append-only rows. Three findings at existing IDs
remain report-only. See
[`dialogue-context-default-59500-59749-revalidation-20261113.md`](dialogue-context-default-59500-59749-revalidation-20261113.md).

The preceding sequential revalidation, `59250`-`59499`, covered 60,997 /
65,135 IDs (93.65%) after adding 183 IDs. Its report records the batch
findings, holds, and validation:
[`dialogue-context-default-59250-59499-revalidation-20261113.md`](dialogue-context-default-59250-59499-revalidation-20261113.md).

## Previous Coverage Checkpoint (2026-11-13)

The preceding sequential revalidation, `59000`-`59249`, compared all 250
active Korean rows across four languages, rechecked 74 existing fingerprints,
and appended 176 IDs. Fifteen new-row candidates and three new ledger holds
were recorded; ten existing candidates and two existing holds were rechecked.
Three further candidates and one evidence-limited question at existing IDs
remain report-only. The ledger covered 60,814 / 65,135 IDs (93.37%), leaving
4,321; sequential coverage reached `59249`. Sixty exact-English duplicate
groups touched the range (1,551 rows); Korean differs only for `56137` /
`59183`, where Japanese also differs in register. ID `59100` has eleven
embedded breaks in each language. Of 250 IDs, 202 have indexed asset links
(206 links across 129 assets); 48 have none. No translation CSV was modified.
See
[`dialogue-context-default-59000-59249-revalidation-20261113.md`](dialogue-context-default-59000-59249-revalidation-20261113.md).

The latest sequential revalidation, `58750`-`58999`, compared all 250
active Korean rows across four languages, rechecked 69 existing fingerprints,
and added 181 IDs. Fifteen new-row correction candidates and eight new ledger
holds are recorded; eleven evidence-limited questions are documented in
total, including three report-only findings at existing IDs. Eight existing
candidates and one existing hold were rechecked without changing their
append-only ledger rows. The ledger covers 60,638 / 65,135 IDs (93.10%),
leaving 4,497; sequential coverage reaches `58999`, next is
`59000`-`59249`. Sixty-one exact-English duplicate groups touch the range
(1,449 rows); Korean differs only in the group containing `25576`, `58994`,
and `63906`. Eleven multiline rows contain 40/39/40/40 embedded breaks
across English/Japanese/Chinese/Korean; Japanese omits one paragraph break
at `58933`. At `58903`, Korean's display-marker order matches English and
Chinese, while Japanese differs. Of 250 IDs, 185 have indexed asset
associations (187 links across 123 assets), and 65 have none. Of 181 new
IDs, 117 are linked (118 links across 69 assets), and 64 are unlinked. Asset
associations do not establish per-key speakers or playback order. No
translation CSV was modified. See
[`dialogue-context-default-58750-58999-revalidation-20261113.md`](dialogue-context-default-58750-58999-revalidation-20261113.md).

The preceding sequential revalidation, `58250`-`58499`, compared all 250
active Korean rows across four languages, rechecked 56 existing fingerprints,
and added 194 IDs. Ten new-row correction candidates and nine evidence-limited
questions were recorded. Four findings at existing IDs (`58252`, `58409`,
`58462`, and `58497`) remain report-only; six existing candidates were
rechecked, and the candidate at `58408` was already reflected in the current
text. That checkpoint covered 60,260 / 65,135 IDs (92.52%). See
[`dialogue-context-default-58250-58499-revalidation-20261113.md`](dialogue-context-default-58250-58499-revalidation-20261113.md).

The preceding sequential revalidation, `57500`-`57749`, compared all 250
active Korean rows across four languages, rechecked 64 existing fingerprints,
and added 186 IDs. Fourteen new correction candidates are documented; six
existing candidate/hold rows were rechecked. The ledger covered 59,690 /
65,135 IDs (91.64%), leaving 5,445; sequential coverage reached `57749`.
Forty-six exact-English duplicate groups touched the range (1,057 rows),
with identical Korean wording in every group. Six multiline rows contained
30/32/30/30 embedded breaks across English/Japanese/Chinese/Korean; Japanese
had two additional breaks at `57728`. Korean display-marker order differed
from English/Japanese at `57551`; at `57708`, Japanese alone had an
additional `{LINE_SPACE}` marker while Korean matched English and Chinese.
Of 250 IDs, 204 had indexed asset associations (210 links across 140 assets),
and 46 had none. Asset associations do not establish per-key speakers or
playback order. No translation CSV was modified. See
[`dialogue-context-default-57500-57749-revalidation-20261113.md`](dialogue-context-default-57500-57749-revalidation-20261113.md).

The preceding sequential revalidation, `57250`-`57499`, compared all 250
active Korean rows across four languages, rechecked 73 existing fingerprints,
and added 177 IDs. Ten new-row correction candidates and two further
proposals at existing IDs `57391` and `57448` are documented; four existing
candidates and three evidence-limited holds were rechecked. The ledger
covered 59,504 / 65,135 IDs (91.35%), leaving 5,631; sequential coverage
reached `57499`. Fifty-nine exact-English duplicate groups touched the range
(897 rows); one Korean variation is supported by Japanese register variants.
Four multiline rows contain six embedded breaks in each language, and
runtime/display/layout marker identities and order match. Of 250 IDs, 190
have indexed asset associations (193 links across 135 assets), and 60 have
none. Asset associations do not establish per-key speakers or playback
order. No translation CSV was modified. See
[`dialogue-context-default-57250-57499-revalidation-20261113.md`](dialogue-context-default-57250-57499-revalidation-20261113.md).

The preceding sequential revalidation, `57000`-`57249`, compared all 250
active Korean rows across four languages, rechecked 65 existing fingerprints,
and added 185 IDs. Eight new correction candidates and six evidence-limited
holds were recorded; six existing candidates and two evidence-limited holds
were rechecked without rewriting their rows. That recheck corrected the
earlier candidate at `57248`: the accepted `로포쿠(Lopoku)` form is valid
despite the English variant `Lupoku`; the append-only ledger row remains
unchanged. The ledger then covered 59,327 / 65,135 IDs (91.08%), leaving
5,808; sequential coverage reached `57249`. Sixty-eight exact-English
duplicate groups touched the range (1,368 rows); Korean matched in all
groups. Two multiline rows contained eight embedded breaks in each language,
and runtime/display markers matched. Of 250 IDs, 203 had indexed asset
associations (206 links across 127 assets), and 47 had none. Asset
associations do not establish per-key speakers or playback order.
Regenerated index/catalog checks, all 59,327 ledger fingerprints, nine
related tests, and line-ending-aware diff checks passed. No translation CSV
was modified. See
[`dialogue-context-default-57000-57249-revalidation-20261113.md`](dialogue-context-default-57000-57249-revalidation-20261113.md).

The preceding sequential revalidation, `56750`-`56999`, compared all 250
active Korean rows across four languages, rechecked 68 existing fingerprints,
and added 182 IDs. Nine new correction candidates and ten evidence-limited
holds were recorded; the existing candidate at `56837` and source-conflict
holds at `56757` and `56758` were rechecked without rewriting their rows. The
ledger then covered 59,142 / 65,135 IDs (90.80%), leaving 5,993; sequential
coverage reached `56999`. Seventy exact-English duplicate groups touched
that range (1,315 rows); three Korean differences were supported by Japanese
source variants. Six multiline rows contained 28 embedded breaks in each
language, and runtime/display markers matched. Of 250 IDs, 182 had indexed
asset associations (185 links across 123 assets), and 68 had none. Asset
associations do not establish per-key speakers or playback order. See
[`dialogue-context-default-56750-56999-revalidation-20261113.md`](dialogue-context-default-56750-56999-revalidation-20261113.md).

The preceding sequential revalidation, `56500`-`56749`, compared all 250
active Korean rows across four languages, rechecked 66 existing fingerprints,
and added 184 IDs. Five new correction candidates and two evidence-limited
holds were recorded; candidates at existing IDs `56512`, `56642`, and `56700`
were rechecked without rewriting their rows. The ledger then covered 58,960 /
65,135 IDs (90.52%), leaving 6,175. Sixty-one exact-English duplicate groups
touched that range (1,253 rows); Korean differed only in one `Hello?` group,
where the difference is supported by Japanese/Chinese. Six multiline rows
contained 29/29/28/29 embedded breaks in English/Japanese/Chinese/Korean.
Of 250 IDs, 199 had indexed asset associations (206 links across 130 assets),
and 51 had none. Asset associations do not establish per-key speakers or
playback order. See
[`dialogue-context-default-56500-56749-revalidation-20261113.md`](dialogue-context-default-56500-56749-revalidation-20261113.md).

The preceding sequential revalidation, `56250`-`56499`, compared all 250
active Korean rows across four languages, rechecked 66 existing fingerprints,
and added 184 IDs. It recorded five correction candidates and six
evidence-limited holds on new rows; a candidate at existing ID `56431` and a
question at `56266` were documented without rewriting their rows. Eight of
nine existing candidates remain supported, while the proposal at `56416` is
already reflected in the current text. The ledger covered 58,776 / 65,135
IDs (90.24%), leaving 6,359. Sixty exact-English duplicate groups touched
the range (911 rows), and Korean matched within all of them. Four multiline
rows contained 18 embedded breaks in each language. Of 250 IDs, 191 had
indexed asset associations (198 links across 129 assets), and 59 had none.
Asset associations do not establish per-key speakers or playback order. See
[`dialogue-context-default-56250-56499-revalidation-20261113.md`](dialogue-context-default-56250-56499-revalidation-20261113.md).

The preceding sequential revalidation, `56000`-`56249`, compared all 250
active Korean rows across four languages, rechecked 61 existing fingerprints,
and added 189 IDs. It recorded ten new correction candidates and two new
evidence-limited holds. Seven existing candidates were rechecked; a new
source-interpretation question at existing ID `56044` is documented without
rewriting its append-only ledger row. The ledger then covered 58,592 /
65,135 IDs (89.95%), leaving 6,543. Sixty-one exact-English duplicate groups
touched the range (1,246 rows); two groups had different Korean wording,
each supported by a Japanese register difference. Four multiline rows
contained 17 embedded breaks in each language. Of 250 IDs, 201 had indexed
asset associations (207 links across 133 assets), and 49 had none. Asset
associations do not establish per-key speakers or playback order. See
[`dialogue-context-default-56000-56249-revalidation-20261113.md`](dialogue-context-default-56000-56249-revalidation-20261113.md).

The preceding sequential revalidation, `55750`-`55999`, compared all 250
active Korean rows across four languages, rechecked 68 existing fingerprints,
and added 182 IDs. It reconfirmed existing candidates at `55900`, `55961`,
and `55981`; the earlier candidate at `55832` is already reflected in the
current Korean text. A further format candidate at existing ID `55896` and
the source-conflict hold at existing ID `55784` are documented without
rewriting their append-only ledger rows. The ledger covered 58,403 / 65,135
IDs (89.66%), leaving 6,732; sequential coverage reached `55999`. One
exact-English duplicate group touched the range (`55783` / `55935`,
“Hello.”), and Korean matched. Five multiline rows contained 75 embedded
breaks in each language. Of 250 IDs, 200 had indexed asset links and 50 did
not; among the 182 newly recorded IDs, 132 were linked and 50 were
unlinked. Asset associations do not establish per-key speakers or playback
order. See
[`dialogue-context-default-55750-55999-revalidation-20261113.md`](dialogue-context-default-55750-55999-revalidation-20261113.md).

The preceding sequential revalidation, `55500`-`55749`, compared all 250
active Korean rows across four languages, rechecked 66 existing fingerprints,
and added 184 IDs. It recorded two new correction candidates and three new
evidence-limited holds; a current candidate at existing ID `55717` and a
source question at existing ID `55514` are documented without changing their
append-only ledger rows. Five earlier candidates and three holds were
rechecked and preserved. The ledger covered 58,221 / 65,135 IDs (89.39%),
leaving 6,914; sequential coverage reached `55749`. Sixty-six exact-English
duplicate groups touched that range and covered 1,250 rows; Korean wording
matched within every group. Four multiline rows contained 26/20/31/26
embedded breaks across English/Japanese/Chinese/Korean. Of 250 IDs, 191 had
indexed asset links (193 links across 129 assets), and 59 had none. Of the
184 new IDs, 125 were linked through 127 links across 80 assets, and 59
were unlinked. Asset associations do not establish per-key speakers or
playback order. See
[`dialogue-context-default-55500-55749-revalidation-20261113.md`](dialogue-context-default-55500-55749-revalidation-20261113.md).

The latest sequential revalidation, `55250`-`55499`, compared all 250 active
Korean rows across four languages, rechecked 61 existing fingerprints, and
added 189 IDs. It recorded one new correction candidate (`55313`) and eight
new evidence-limited holds. A separate source discrepancy at existing ID
`55301` is documented without changing its append-only ledger row. The ledger
covers 58,037 / 65,135 IDs (89.10%), leaving 7,098; sequential coverage
reaches `55499`, next is `55500`-`55749`. Sixty-four exact-English duplicate
groups across the corpus touch the range, covering 1,287 rows; Korean wording
matches within each. Three multiline rows contain nine embedded breaks per
language. ID `55251` has a Chinese-only layout-marker difference; Korean
matches English and Japanese. Of 250 IDs, 197 have indexed asset links
(207 links across 132 assets), and 53 have none. See
[`dialogue-context-default-55250-55499-revalidation-20261113.md`](dialogue-context-default-55250-55499-revalidation-20261113.md).

The latest sequential revalidation, `55000`-`55249`, compared all 250 active
Korean rows across four languages, rechecked 63 existing ledger fingerprints,
and added 187 IDs. Three new correction candidates, six rechecked candidates,
and a new evidence-limited hold at existing ID `55023` are documented; the
existing hold at `55029` remains. The ledger covers 57,848 / 65,135 IDs
(88.81%), leaving 7,287; 45,921 reviewed IDs have indexed asset links and
11,927 do not. Sequential coverage reaches `55249`; next is
`55250`-`55499`. Sixty exact-English duplicate groups touch the range and
cover 1,010 target rows; one group's Korean wording differs at `31562` /
`55044`, despite identical English and Chinese. Five multiline rows contain
28 embedded breaks in each language. Of 250 IDs, 196 have indexed asset
associations, represented by 198 links across 133 assets; 54 have no indexed
asset. Asset links do not establish per-key speakers or playback order. See
[`dialogue-context-default-55000-55249-revalidation-20261113.md`](dialogue-context-default-55000-55249-revalidation-20261113.md).
Regenerated catalogs, all 57,848 ledger fingerprints, nine related tests,
and line-ending-aware diff checks passed. No translation CSV was modified.

The latest sequential revalidation, `54750`-`54999`, compared all 250 current
Korean rows across four languages. It rechecked 77 existing records and added
173. Three new correction candidates and two evidence-limited holds are
recorded; two candidates are on new ledger rows, while the finding at existing
ID `54779` is documented without changing its append-only ledger row. Four
pre-existing candidate records were rechecked and preserved.
The ledger covers 57,661 / 65,135 IDs (88.53%), leaving 7,474; 45,788 reviewed
IDs have indexed asset links and 11,873 do not. Sequential coverage reaches
`54999`; next is `55000`-`55249`. Fifty-six exact-English duplicate groups
touch the range and cover 1,083 target rows; Korean wording matches within
every group. Five multiline rows contain 23 embedded breaks in each language.
Of 250 IDs, 203 have indexed asset associations, represented by 206 links
across 140 assets; 47 have no indexed asset. Asset links do not establish
per-key speakers or playback order. See
[`dialogue-context-default-54750-54999-revalidation-20261113.md`](dialogue-context-default-54750-54999-revalidation-20261113.md).

The latest sequential revalidation, `54500`-`54749`, compared all 250 current
Korean rows across four languages. It rechecked 63 existing records and added
187. Sixteen new correction candidates are recorded (13 on newly added
ledger rows and three on preserved existing rows); seven earlier candidates
and the hold at `54647` were rechecked and retained. The ledger
covers 57,488 / 65,135 IDs (88.26%), leaving 7,647; 45,662 reviewed IDs have
indexed asset links and 11,826 do not. Sequential coverage reaches `54749`;
next is `54750`-`54999`. Sixty-three exact-English duplicate groups touch
the range and cover 786 target rows. Eight multiline rows contain 50/50/49/50
embedded breaks across English/Japanese/Chinese/Korean. Of 250 IDs, 192 have
indexed asset associations, represented by 195 links across 127 assets; 58
have no indexed asset. Asset links do not establish per-key speakers or
playback order. See
[`dialogue-context-default-54500-54749-revalidation-20261113.md`](dialogue-context-default-54500-54749-revalidation-20261113.md).
Catalog reproduction, all 57,488 ledger fingerprints, nine related tests,
and line-ending-aware diff checks passed. No translation CSV was modified.

The preceding sequential revalidation, `54250`-`54499`, compared all 250 current
Korean rows across four languages. It rechecked 54 existing records and added
196. Fifteen current correction candidates are recorded, including three
rechecked findings and 12 new findings; one prior proposal is already
reflected in the active Korean text. One terminology case remains on hold.
The ledger covers 57,301 / 65,135 IDs (87.97%), leaving 7,834; 45,533
reviewed IDs have indexed asset links and 11,768 do not. Sequential coverage
reaches `54499`; next is `54500`-`54749`. Fifty-six exact-English duplicate
groups touch the range and cover 889 target rows; the sole Korean wording
difference is supported by a Japanese register difference. Six multiline
rows contain 30 embedded breaks in each language. Of 250 IDs, 139 have
indexed asset associations, represented by 142 links across 82 assets; 57
have no indexed asset. Asset links do not establish per-key speakers or
playback order. See
[`dialogue-context-default-54250-54499-revalidation-20261113.md`](dialogue-context-default-54250-54499-revalidation-20261113.md).
The regenerated catalogs, all 57,301 ledger fingerprints, nine related
tests, and line-ending-aware diff checks passed. No translation CSV was
modified.

The preceding `54000`-`54249` revalidation compared all 250 current Korean
rows across four languages, rechecked 47 existing records, and added 203.
Nine current correction candidates were recorded, including three rechecked
findings; five new evidence-limited holds were added, and the existing
register hold at `54031` was retained. The ledger then covered 57,105 /
65,135 IDs (87.66%), leaving 8,030; 45,394 reviewed IDs had indexed asset
links and 11,711 did not. Sequential coverage reached `54249`; next was
`54250`-`54499`. Sixty exact-English duplicate groups touched that range and
covered 1,359 target rows; the sole Korean wording difference was supported
by a Japanese wording difference. Six multiline rows contained 35/39/36/35
embedded breaks across English/Japanese/Chinese/Korean. Of 250 IDs, 192 had
indexed asset associations, represented by 196 links across 120 assets; 58
had no indexed asset. Of the 203 new IDs, 145 were linked through 149 links
across 79 assets. Asset links do not establish per-key speakers or playback
order. See
[`dialogue-context-default-54000-54249-revalidation-20261113.md`](dialogue-context-default-54000-54249-revalidation-20261113.md).

The preceding range, `53750`-`53999`, compared all 250 current Korean rows
across four languages. It rechecked 67 existing records and added 183.
Seventeen current correction candidates were recorded, including 11
rechecked from existing ledger entries; two existing evidence-limited holds
were rechecked and retained. ID `53858` retains an earlier unresolved
title-term hold. The ledger covered 56,902 / 65,135 IDs (87.36%), leaving
8,233; a regenerated catalog confirms 45,249 reviewed IDs had indexed asset
links and 11,653 did not. Sequential coverage reached `53999`. Forty-eight
exact-English duplicate groups touched the range and covered 49 target rows;
the sole Korean wording difference was supported by a Japanese register
difference. Two multiline rows contained 12 embedded breaks per language.
Of 250 IDs, 198 had indexed asset associations, represented by 202 links
across 129 assets; 52 had no indexed asset. Of the 183 new IDs, 132 were
linked through 134 links across 75 assets. Asset links do not establish
per-key speakers or playback order.
See
[`dialogue-context-default-53750-53999-revalidation-20261113.md`](dialogue-context-default-53750-53999-revalidation-20261113.md).

The preceding range, `53500`-`53749`, compared all 250 current Korean rows
across four languages. It rechecked 64 existing records and added 186. Nine
current correction candidates and five evidence-limited holds were recorded.
The ledger then covered 56,719 / 65,135 IDs (87.08%), leaving 8,416; 45,118
reviewed IDs had indexed asset links and 11,601 did not. Sequential coverage
reached `53749`. Sixty-eight exact-English duplicate groups touched the
range and covered 69 target rows; Korean wording matched within every group.
Seven multiline rows contained 32 embedded breaks per language. The Japanese
source at `53555` is Chinese text, recorded as a source anomaly. Of 250 IDs,
194 had indexed asset associations, represented by 195 links across 125
assets; 56 had no indexed asset. Of the 186 new IDs, 130 were linked across
74 assets. Asset links do not establish per-key speakers or playback order.
See
[`dialogue-context-default-53500-53749-revalidation-20261113.md`](dialogue-context-default-53500-53749-revalidation-20261113.md).
Index/catalog reproduction, all 56,719 ledger fingerprints, nine related
tests, and `git diff --check` passed. No translation CSV was modified.

The preceding `53250`-`53499` pass compared all 250 current Korean rows
across four languages. It rechecked 68 existing records and added 182. Two
current correction candidates were rechecked from existing ledger records;
248 IDs had no current finding. The ledger then covered 56,533 / 65,135 IDs
(86.79%), leaving 8,602; 44,987 reviewed IDs had indexed asset links and
11,546 did not. Sequential coverage reached `53499`. Sixty-four exact-English
duplicate groups touched the range and covered 65 target rows; Korean wording
matched within every group. Five multiline rows contained 16 embedded breaks
per language. The Japanese source at `53265` is Chinese text; this is a
source anomaly, not a Korean correction. Of 250 IDs, 197 had indexed asset
associations, represented by 204 links across 129 assets; 53 had no indexed
asset. Of the 182 new IDs, 129 were linked across 72 assets. Asset links do
not establish per-key speakers or playback order. See
[`dialogue-context-default-53250-53499-revalidation-20261113.md`](dialogue-context-default-53250-53499-revalidation-20261113.md).
Catalog/index reproduction, all ledger fingerprints, nine related tests,
and line-ending-aware diff checks passed. No translation CSV was modified.

The latest `53000`-`53249` pass compared all 250 current Korean rows across
four languages. It rechecked 77 existing records and added 173. The range
has ten current correction candidates and two evidence-limited holds; 238
IDs have no current finding. The ledger covers 56,351 / 65,135 IDs (86.51%),
leaving 8,784; 44,858 reviewed IDs have indexed asset links and 11,493 do
not. Sequential coverage reaches `53249`; next is `53250`-`53499`.
Seventy-four exact-English duplicate groups touch the range, covering 77
target rows; Korean wording matches within every group. Three multiline rows
contain 15 embedded breaks per language. Runtime/display structure matches,
with the source-specific `{1}`/`{2}` ordering difference at `53154`
preserved. Of 250 IDs, 209 have indexed asset associations, represented by
215 ID-asset links across 134 assets; 41 have no indexed asset. Of the 173
new IDs, 132 have indexed associations and 41 do not. Asset links do not
establish per-key speakers or playback order. See
[`dialogue-context-default-53000-53249-revalidation-20261113.md`](dialogue-context-default-53000-53249-revalidation-20261113.md).
Catalog/index reproduction, all ledger fingerprints, nine related tests,
and line-ending-aware diff checks passed. No translation CSV was modified.

The preceding `52750`-`52999` pass compared all 250 current Korean rows
across four languages. It rechecked 59 existing records and added 191. The
range had eight current correction candidates and five evidence-limited
holds; 237 IDs had no current finding. The ledger then covered 56,178 /
65,135 IDs (86.25%), leaving 8,957; 44,726 reviewed IDs had indexed asset
links and 11,452 did not. Sequential coverage reached `52999`. Fifty-nine
exact-English duplicate groups touched that range, covering 59 target rows;
Korean wording matched within every group. One multiline row contained one
embedded break per language, and the display-marker structure matched after
normalizing localized wrapper text. Of 250 IDs, 208 had indexed asset
associations, represented by 211 ID-asset links across 128 assets; 42 had no
indexed asset. Of the 191 new IDs, 149 had indexed associations and 42 did
not. Asset links do not establish per-key speakers or playback order. See
[`dialogue-context-default-52750-52999-revalidation-20261113.md`](dialogue-context-default-52750-52999-revalidation-20261113.md).
Catalog/index reproduction, all ledger fingerprints, nine related tests,
and line-ending-aware diff checks passed. No translation CSV was modified.

The preceding `52500`-`52749` pass compared all 250 current Korean rows
across four languages. It rechecked 69 existing records and added 181. The
range had 11 current correction candidates and eight evidence-limited holds;
231 IDs had no current finding. The ledger then covered 55,987 / 65,135 IDs
(85.96%), leaving 9,148; 44,577 reviewed IDs had indexed asset links and
11,410 did not. Sequential coverage reached `52749`. Forty-four exact-English
duplicate groups touched that range, covering 47 target rows; Korean wording
matched within every group. Nine multiline rows contained 53 embedded
breaks per language, and runtime/display token sequences matched. Of 250
IDs, 184 had indexed asset associations, represented by 190 ID-asset links
across 123 assets; 66 had no indexed asset. Of the 181 new IDs, 116 had
indexed associations and 65 did not. Asset links do not establish per-key
speakers or playback order. See
[`dialogue-context-default-52500-52749-revalidation-20261113.md`](dialogue-context-default-52500-52749-revalidation-20261113.md).
Catalog/index reproduction, all ledger fingerprints, nine related tests,
and line-ending-aware diff checks passed. No translation CSV was modified.

The preceding `51750`-`51999` pass compared all 250 current Korean rows across
four languages. It rechecked 72 existing records and added 178. The range
had seven current correction candidates and 14 evidence-limited holds; 229
IDs had no current finding. The ledger then covered 55,438 / 65,135 IDs
(85.11%), leaving 9,697; 44,187 reviewed IDs had indexed asset links and
11,251 did not. Sequential coverage reached `51999`; the next range was
`52000`-`52249`. Sixty-five exact-English duplicate groups touched the
range, covering 65 target rows; Korean wording matched within every group.
Five multiline rows contained 37 embedded breaks per language. The Korean
marker sequence at `51803` followed English; Japanese and Chinese differed,
and no Korean marker correction was proposed. Of 250 IDs, 192 had indexed
asset associations, represented by 197 ID-asset links across 129 assets; 58
had no indexed asset. Of the 178 new IDs, 120 had indexed associations and
58 did not. Asset links do not establish per-key speakers or playback order.
See
[`dialogue-context-default-51750-51999-revalidation-20261113.md`](dialogue-context-default-51750-51999-revalidation-20261113.md).
Catalog/index reproduction, all ledger fingerprints, nine related tests,
and line-ending-aware diff checks passed. No translation CSV was modified.

The preceding `51250`-`51499` pass compared all 250 current Korean rows
across four languages. It rechecked 54 existing records and added 196. The
range had 19 current correction candidates and three evidence-limited holds;
228 IDs had no current finding. The ledger then covered 55,090 / 65,135 IDs
(84.59%), leaving 10,045; 43,943 reviewed IDs had indexed asset links and
11,147 did not. Sequential coverage reached `51499`; the next range was
`51500`-`51749`. Fifty-five exact-English duplicate groups touched the
range across the corpus, covering 57 target rows; Korean matched within
every group. Eight multiline rows contained 54 embedded breaks per
language, and runtime/display marker identities and order matched. Of 250
IDs, 186 had indexed asset associations, represented by 188 ID-asset links
across 123 assets; 64 had no indexed asset. Of the 196 new IDs, 132 had
indexed associations and 64 did not. Asset links do not establish per-key
speakers or playback order. See
[`dialogue-context-default-51250-51499-revalidation-20261113.md`](dialogue-context-default-51250-51499-revalidation-20261113.md).
Catalog/index reproduction, all ledger fingerprints, nine related tests,
and line-ending-aware diff checks passed. No translation CSV was modified.

The preceding `51000`-`51249` pass compared all 250 current Korean rows
across four languages. It rechecked 61 existing records and added 189. The
range had 17 current correction candidates and six evidence-limited holds;
227 IDs had no current finding. The ledger then covered 54,894 / 65,135 IDs
(84.28%), leaving 10,241; 43,811 reviewed IDs had indexed asset links and
11,083 did not. Sequential coverage reached `51249`. Fifty-one exact-English
duplicate groups touched the range, covering 53 target rows; the sole Korean
wording difference was supported by a Japanese register difference. Three
multiline rows contained ten embedded breaks per language, and
runtime/display marker identities and order matched. Of 250 IDs, 211 had
indexed asset associations, represented by 214 ID-asset links across 133
assets; 39 had no indexed asset. Of the 189 new IDs, 150 had indexed
associations and 39 did not. Asset links do not establish per-key speakers
or playback order. See
[`dialogue-context-default-51000-51249-revalidation-20261113.md`](dialogue-context-default-51000-51249-revalidation-20261113.md).
Catalog/index reproduction, all ledger fingerprints, nine related tests,
and line-ending-aware diff checks passed. No translation CSV was modified.

The preceding `50750`-`50999` pass compared all 250 current Korean rows
across four languages. It rechecked 60 existing records and added 190. The
range had 14 current correction candidates and four evidence-limited holds;
232 IDs had no current finding. The ledger then covered 54,705 / 65,135 IDs
(83.99%), leaving 10,430; 43,661 reviewed IDs had indexed asset links and
11,044 did not. Sequential coverage reached `50999`; the next range was
`51000`-`51249`. Fifty-nine exact-English duplicate groups touched the
range across the corpus, covering 59 target rows; Korean matched within
every group. Seven multiline rows contained 26 embedded breaks per
language, and runtime/display marker identities and order matched. Of 250
IDs, 194 had indexed asset associations, represented by 196 ID-asset links
across 120 assets; 56 had no indexed asset. Of the 190 new IDs, 134 had
indexed associations and 56 did not. Asset links do not establish per-key
speakers or playback order. See
[`dialogue-context-default-50750-50999-revalidation-20261113.md`](dialogue-context-default-50750-50999-revalidation-20261113.md).
Catalog/index reproduction, all 54,705 ledger fingerprints, nine related
tests, and line-ending-aware diff checks passed. No translation CSV was
modified.

The preceding `50500`-`50749` pass compared all 250 current Korean rows
across four languages. It rechecked 64 existing records and added 186. The
range had 11 current correction candidates and eight evidence-limited holds;
231 IDs had no current finding. The ledger then covered 54,515 / 65,135 IDs
(83.70%), leaving 10,620; 43,527 reviewed IDs had indexed asset links and
10,988 did not. Sequential coverage reached `50749`; the next range was
`50750`-`50999`. Fifty-two exact-English duplicate groups touched the range
across the corpus, covering 54 target rows; Korean matched within every
group. Three multiline rows contained seven embedded breaks per language,
and runtime/display marker identities and order matched. Of 250 IDs, 200 had
indexed asset associations, represented by 203 ID-asset links; 50 had no
indexed asset. Of the 186 new IDs, 136 had indexed associations and 50 did
not. Asset links do not establish per-key speakers or playback order. See
[`dialogue-context-default-50500-50749-revalidation-20261113.md`](dialogue-context-default-50500-50749-revalidation-20261113.md).
Catalog/index reproduction, all 54,515 ledger fingerprints, nine related
tests, and line-ending-aware diff checks passed. No translation CSV was
modified.

The preceding `50250`-`50499` pass compared all 250 current Korean rows
across four languages. It rechecked 82 existing records and added 168. The
range had 13 current correction candidates and 13 evidence-limited holds,
with four IDs in both groups; 228 IDs had no current finding. The ledger
then covered 54,329 / 65,135 IDs (83.41%), leaving 10,806; 43,391 had
indexed asset links and 10,938 did not. Sequential coverage reached `50499`;
the next range was `50500`-`50749`. Fifty-seven exact-English duplicate
groups touched the range across the corpus, with matching Korean within
each; the only repeat wholly inside the range, `50261`/`50453`, also
matched. Nine multiline rows contained 42 English, 42 Japanese, 41 Chinese,
and 42 Korean breaks. The count difference was isolated to malformed source
formatting at `50448`; the 12-break layout at `50466` matched in all
languages. Of 250 IDs, 198 had indexed asset associations, represented by
206 ID-asset links across 132 assets; 52 had no indexed asset. Of the 168
new IDs, 116 had indexed associations and 52 did not. Asset links do not
establish per-key speakers or playback order. See
[`dialogue-context-default-50250-50499-revalidation-20261113.md`](dialogue-context-default-50250-50499-revalidation-20261113.md).
Catalog/index reproduction, all 54,329 ledger fingerprints, nine related
tests, and line-ending-aware diff checks passed. No translation CSV was
modified.

The preceding `50000`-`50249` pass compared all 250 current Korean rows
across four languages. It rechecked 69 existing records and added 181. The
range had 18 current correction candidates; 232 IDs had no current finding.
The ledger then covered 54,161 / 65,135 IDs (83.15%), leaving 10,974; 43,275
had indexed asset links and 10,886 did not. Three exact-English duplicate
pairs (`50027`/`50145`, `50100`/`50137`, and `50205`/`50235`) matched in
Korean. Five multiline rows contained 20 embedded line breaks in English,
Chinese, and Korean and 24 in Japanese because of `50178`. Of 250 IDs, 204
had indexed asset associations, represented by 211 ID-asset links across
132 assets; 46 had no indexed asset. Of the 181 new IDs, 135 had indexed
associations and 46 did not. Links do not establish per-key speaker or
playback order. See
[`dialogue-context-default-50000-50249-revalidation-20261113.md`](dialogue-context-default-50000-50249-revalidation-20261113.md).
Catalog/index reproduction, all 54,161 ledger fingerprints, nine related
tests, and line-ending-aware diff checks passed. No translation CSV was
modified.

The preceding `49500`-`49749` pass compared all 250 current Korean rows
across four languages. It rechecked 77 existing records and added 173. The
range had 12 current correction candidates and 13 evidence-limited holds;
225 IDs had no current finding. The ledger then covered 53,797 / 65,135 IDs
(82.59%), leaving 11,338; 43,018 had indexed asset links and 10,779 did not.
Sequential coverage reached `49749`. The exact-English duplicate group
(`49639`/`49724`) matched in Korean. Two rows contained six embedded line
breaks per language with matching four-language counts; Korean embedded
separators remained CRLF. ID `49608` had five `{*1...}` wrappers; Korean
order matched English while Japanese/Chinese placed the game title first.
Of 250 IDs, 194 had indexed asset associations, represented by 197 ID-asset
links across 138 assets; 56 had no indexed asset. See
[`dialogue-context-default-49500-49749-revalidation-20261113.md`](dialogue-context-default-49500-49749-revalidation-20261113.md).
No translation CSV was modified.

The preceding `49250`-`49499` pass compared all 250 current Korean rows
across four languages. It rechecked 59 existing records and added 191. The
range had 11 current correction candidates and four evidence-limited holds;
235 IDs had no current finding. The ledger then covered 53,624 / 65,135 IDs
(82.33%), leaving 11,511; 42,901 had indexed asset links and 10,723 did not.
Sequential coverage reached `49499`. One meaningful exact-English duplicate
group matched in Korean. Two rows contained nine embedded line breaks per
language with matching four-language counts; runtime/display marker
identities and order also matched. Of 250 IDs, 188 had indexed asset
associations, represented by 191 ID-asset links across 128 assets; 62 had no
indexed asset. Links do not establish per-key speaker or playback order. See
[`dialogue-context-default-49250-49499-revalidation-20261113.md`](dialogue-context-default-49250-49499-revalidation-20261113.md).
No translation CSV was modified.

The preceding `49000`-`49249` pass compared all 250 current Korean rows
across four languages. It rechecked 63 existing records and added 187. The
range had nine current correction candidates and three evidence-limited
holds; 238 IDs had no current finding. The ledger then covered 53,433 /
65,135 IDs (82.03%), leaving 11,702; 42,772 had indexed asset links and
10,661 did not. Sequential coverage reached `49249`. Two exact-English
duplicate groups matched in Korean. Four rows contained 36 embedded line
breaks per language with matching four-language counts; runtime/display
marker identities and order also matched. Of 250 IDs, 196 had indexed asset
associations, represented by 202 ID-asset links across 132 assets; 54 had no
indexed asset. Links do not establish per-key speaker or playback order. See
[`dialogue-context-default-49000-49249-revalidation-20261113.md`](dialogue-context-default-49000-49249-revalidation-20261113.md).
Catalog/index reproduction, all 53,433 ledger fingerprints, nine related
tests, and line-ending-aware diff checks passed. No translation CSV was
modified.

The preceding `48750`-`48999` pass compared all 250 current Korean rows across
four languages. It rechecked 65 existing records and added 185. The range had
17 current correction candidates and eight evidence-limited holds; 225 IDs
had no current finding. The ledger then covered 53,246 / 65,135 IDs (81.75%),
leaving 11,889; 42,640 had indexed asset links and 10,606 did not.
Sequential coverage reached `48999`. Five exact-English duplicate groups
matched in Korean. Two rows contained 13 embedded line breaks with matching
four-language counts; checked runtime/display marker identities and order
also matched. Of 250 IDs, 204 had indexed asset associations, represented by
208 ID-asset links across 129 assets; 46 had no indexed asset. Links do not
establish per-key speaker or playback order. See
[`dialogue-context-default-48750-48999-revalidation-20261113.md`](dialogue-context-default-48750-48999-revalidation-20261113.md).
Catalog/index reproduction, all 53,246 ledger fingerprints, nine related
tests, and line-ending-aware diff checks passed. No translation CSV was
modified.

The preceding `48500`-`48749` pass compared all 250 current Korean rows
across four languages. It rechecked 77 existing records and added 173. The
range had ten correction candidates and seven evidence-limited holds; 233
IDs had no current finding. The ledger then covered 53,061 / 65,135 IDs
(81.46%), leaving 12,074; 42,501 had indexed asset links and 10,560 did not.
Sequential coverage reached `48749`. Two exact-English duplicate groups
matched in Korean. No rows contained embedded line breaks; checked
runtime/display marker identities and order matched. Of 250 IDs, 213 had
indexed asset associations, represented by 219 ID-asset links across 135
assets; 37 had no indexed asset. Links do not establish per-key speaker or
playback order. See
[`dialogue-context-default-48500-48749-revalidation-20261113.md`](dialogue-context-default-48500-48749-revalidation-20261113.md).
Catalog/index reproduction, ledger fingerprints, nine related tests, and
line-ending-aware diff checks passed. No translation CSV was modified.

The preceding `48250`-`48499` pass compared all 250 current Korean rows across
four languages. It rechecked 81 existing records and added 169. The range has
20 current correction candidates and nine evidence-limited holds; `48309`
has both, while 222 IDs have no current finding. The ledger covers 52,888 /
65,135 IDs (81.20%), leaving 12,247; 42,364 have indexed asset links and
10,524 do not. Sequential coverage reaches `48499`; next is `48500`-`48749`.
Three exact-English duplicate groups match in Korean. Seven multiline rows
contain 55 breaks per language with matching four-language counts; checked
runtime/layout marker identities and order also match. Of 250 IDs, 196 have
indexed asset associations, represented by 202 ID-asset links across 130
assets; 54 IDs have no indexed asset. Links do not establish per-key speaker
or playback order. See
[`dialogue-context-default-48250-48499-revalidation-20261113.md`](dialogue-context-default-48250-48499-revalidation-20261113.md).
Catalog/index reproduction, all 52,888 ledger fingerprints, nine related
tests, and line-ending-aware diff checks remain to be run. No translation CSV
was modified.

The preceding `48000`-`48249` pass compared all 250 current Korean rows across
four languages. It rechecked 59 existing records and added 191. The range has
14 current correction candidates and six evidence-limited holds; `48053` has
both, while 231 IDs have no current finding. The ledger covers 52,719 /
65,135 IDs (80.94%), leaving 12,416; 42,249 have indexed asset links and
10,470 do not. Sequential coverage reaches `48249`; next is `48250`-`48499`.
One exact-English duplicate group matches in Korean. Nine multiline rows
contain 23 English/Korean breaks and 22 Japanese/Chinese breaks because of
`48223`. Marker review found no Korean order issue; at `48208` the Korean
sequence matches English. Of 250 IDs, 193 have indexed asset associations,
represented by 198 ID-asset links across 125 assets; 57 have no indexed
asset. Links do not establish per-key speaker or playback order. See
[`dialogue-context-default-48000-48249-revalidation-20261113.md`](dialogue-context-default-48000-48249-revalidation-20261113.md).
Catalog/index reproduction, all 52,719 ledger fingerprints, nine related
tests, and line-ending-aware diff checks remain to be run. No translation
CSV was modified.

The preceding `47500`-`47749` pass compared all 250 current Korean rows across
four languages. It rechecked 56 existing records and added 194. The range had
13 current correction candidates and two evidence-limited holds; 235 IDs had
no current finding. The ledger then covered 52,346 / 65,135 IDs (80.37%),
leaving 12,789; 41,981 had indexed asset links and 10,365 did not. Sequential
coverage reached `47749`. Three exact-English duplicate groups matched in
Korean. Six multiline rows contained 44 breaks with matching four-language
layouts, and marker identities/order matched. Of 250 IDs, 194 had indexed
asset associations, represented by 200 ID-asset links across 118 assets; 56
had no indexed asset. Links do not establish per-key speaker or playback
order. See
[`dialogue-context-default-47500-47749-revalidation-20261113.md`](dialogue-context-default-47500-47749-revalidation-20261113.md).
No translation CSV was modified.

The latest `47250`-`47499` pass compared all 250 current rows across four
languages. It rechecked 55 existing records and added 195. The range has 14
current correction candidates and three evidence-limited holds; 233 IDs have
no current finding. The ledger covers 52,152 / 65,135 IDs (80.07%), leaving
12,983; 41,843 have indexed asset links and 10,309 do not. Sequential
coverage reaches `47499`; next is `47500`-`47749`. Three exact-English
duplicate groups touch the range and all match in Korean. Three multiline
rows contain 11 breaks with matching four-language layouts; `47277` has a
Korean marker-order candidate. Of 250 IDs, 195 have indexed asset
associations, represented by 202 ID-asset links across 124 assets; seven IDs
link to multiple assets. Links do not establish per-key speaker or playback
order. See
[`dialogue-context-default-47250-47499-revalidation-20261112.md`](dialogue-context-default-47250-47499-revalidation-20261112.md).
Catalog/index reproduction, all 52,152 ledger fingerprints, nine related
tests, and line-ending-aware diff checks passed. No translation CSV was
modified.

The preceding `47000`-`47249` pass compared all 250 current rows across four
languages. It rechecked 66 existing records and added 184. The range had ten
current correction candidates and four evidence-limited holds; the other 236
IDs had no current finding. The ledger then covered 51,957 / 65,135 IDs
(79.77%), leaving 13,178; 41,703 had indexed asset links and 10,254 did not.
Sequential coverage reached `47249`. Sixty exact-English duplicate groups
touched the range; one Korean difference occurred in the `14591`/`47146`
group. Six multiline rows contained 15 Korean breaks; `47165` had two more
breaks than the source locales. Of 250 IDs, 201 had indexed asset
associations, represented by 203 ID-asset links across 132 assets. See
[`dialogue-context-default-47000-47249-revalidation-20261112.md`](dialogue-context-default-47000-47249-revalidation-20261112.md).
No translation CSV was modified.

The preceding `46750`-`46999` pass compared all 250 current rows across four
languages. It rechecked 73 existing records and added 177. The range had six
current correction candidates and 11 evidence-limited holds; `46789` had
both dimensions, while 234 IDs had no current finding. The ledger then
covered 51,773 / 65,135 IDs (79.49%), leaving 13,362; 41,568 had indexed
asset links and 10,205 did not. Sequential coverage reached `46999`. Fifty-
nine exact-English duplicate groups touched the range and covered 1,183 rows;
two Korean differences followed Japanese register distinctions. Six
multiline rows contained 44 breaks with matching four-language counts;
Korean embedded separators were CRLF and were preserved. Of 250 IDs, 190
had indexed asset associations, including 117 newly recorded IDs; links do
not establish per-key speaker or playback order. See
[`dialogue-context-default-46750-46999-revalidation-20261112.md`](dialogue-context-default-46750-46999-revalidation-20261112.md).
No translation CSV was modified.

The preceding `46500`-`46749` pass compared all 250 current rows across four
languages. It rechecked 62 existing records and added 188. The range had nine
supported correction candidates and seven evidence-limited holds; `46732`
had a separate name-form hold despite its historical ledger disposition,
while 234 IDs had no current finding. The ledger then covered 51,596 / 65,135
IDs (79.22%), leaving 13,539; 41,451 had indexed asset links and 10,145 did
not. Sequential coverage reached `46749`. Sixty exact-English duplicate
groups touched the range and covered 1,333 rows, with matching Korean within
every group. Seven multiline rows contained 24 Korean breaks with matching
four-language counts; embedded Korean separators were CRLF and were
preserved. Of 250 IDs, 200 had indexed asset associations, including 138
newly recorded IDs. See
[`dialogue-context-default-46500-46749-revalidation-20261112.md`](dialogue-context-default-46500-46749-revalidation-20261112.md).
No translation CSV was modified.

The preceding `46250`-`46499` pass compared all 250 current rows across four
languages. It rechecked 60 existing records and added 190. The range had six
supported correction candidates and three evidence-limited holds; ID `46314`
had both a correction candidate and a separate title hold, while 242 IDs had
no current finding. The ledger then covered 51,408 / 65,135 IDs (78.93%),
leaving 13,727; 41,313 had indexed asset links and 10,095 did not. Sequential
coverage reached `46499`. Sixty exact-English duplicate groups touched the
range and covered 1,092 rows, with matching Korean within every group. Four
multiline rows contained 13 Korean breaks with matching four-language
counts; embedded Korean separators were CRLF and were preserved. Of 250 IDs,
205 had indexed asset associations, including 145 newly recorded IDs; links
do not establish per-key speaker or playback order. Catalog reproduction,
all 51,408 ledger fingerprints, nine related index tests, and the
line-ending-aware diff check passed. See
[`dialogue-context-default-46250-46499-revalidation-20261112.md`](dialogue-context-default-46250-46499-revalidation-20261112.md).
No translation CSV was modified in that batch.

The preceding `46000`-`46249` pass compared all 250 current rows across four
languages. It rechecked 78 existing records and added 172. The range had 20
current correction candidates and two evidence-limited holds; ID `46241` had
both a formatting candidate and a separate meaning hold, while 229 IDs had no
current finding. The ledger then covered 51,218 / 65,135 IDs (78.63%), leaving
13,917; 41,168 had indexed asset links and 10,050 did not. Sequential coverage
reached `46249`. Sixty-three exact-English duplicate groups covered 1,188
rows, with matching Korean within every group. Two multiline rows contained
14 Korean breaks with matching four-language counts and preserved CRLF
separators. Of 250 IDs, 194 had indexed asset associations, including 116
newly recorded IDs. See
[`dialogue-context-default-46000-46249-revalidation-20261112.md`](dialogue-context-default-46000-46249-revalidation-20261112.md).

## Previous Checkpoint

The preceding `45750`-`45999` pass compared all 250 current rows across four
languages. It rechecked 54 existing records and added 196. The range had 20
current correction candidates and five evidence-limited holds; 225 IDs had
no current finding. The ledger then covered 51,046 / 65,135 IDs (78.37%),
leaving 14,089; 41,051 had indexed asset links and 9,995 did not. Sequential
coverage reached `45999`. Fifty-eight exact-English duplicate groups touched
the range and covered 935 rows, with matching Korean within every group. Three
multiline rows contained seven Korean breaks with matching four-language
counts; embedded Korean separators were CRLF and were preserved. Of 250 IDs,
189 had indexed asset associations, including 135 newly recorded IDs; links
do not establish per-key speaker or playback order. Catalog reproduction, all
ledger fingerprints, nine related index tests, and the line-ending-aware diff
check passed. No translation CSV was modified in that batch. See
[`dialogue-context-default-45750-45999-revalidation-20261112.md`](dialogue-context-default-45750-45999-revalidation-20261112.md).

## Previous Checkpoint

The preceding `45500`-`45749` pass compared all 250 current rows across four
languages. It rechecked 63 existing records and added 187. The range had
eight current correction candidates and six evidence-limited holds; 236 IDs
had no current finding. The ledger then covered 50,850 / 65,135 IDs (78.07%),
leaving 14,285; 40,916 had indexed asset links and 9,934 did not. Sequential
coverage reached `45749`. Sixty-seven exact-English duplicate groups touched
the range and covered 1,026 rows, with matching Korean within every group.
Seven multiline rows contained 27 Korean breaks with matching four-language
counts; embedded Korean separators were CRLF and were preserved. Of 250 IDs,
193 had indexed asset associations, including 131 newly recorded IDs. See
[`dialogue-context-default-45500-45749-revalidation-20261112.md`](dialogue-context-default-45500-45749-revalidation-20261112.md).

## Earlier Checkpoint

The preceding `45250`-`45499` pass compared all 250 current rows across four
languages. It rechecked 77 existing records and added 173. The range has 12
current correction candidates and 13 evidence-limited holds; 225 IDs have no
current finding. The ledger then covered 50,663 / 65,135 IDs (77.78%),
leaving 14,472; 40,785 had indexed asset links and 9,878 did not. Sequential
coverage reached `45499`. Fifty-six exact-English duplicate groups touch the
range and cover 1,027 rows, with matching Korean within every group. Five
multiline rows contain 33 Korean breaks with matching four-language counts;
embedded Korean separators are CRLF and were preserved. Of 250 IDs, 193
have indexed asset associations, including 116 newly recorded IDs; links do
not establish per-key speaker or playback order. Catalog reproduction, all
ledger fingerprints, nine related index tests, and the line-ending-aware
diff check passed. No translation CSV was modified in that batch. See
[`dialogue-context-default-45250-45499-revalidation-20261112.md`](dialogue-context-default-45250-45499-revalidation-20261112.md).

## Earlier Checkpoint

The `44750`-`44999` pass compared all 250 current rows across four
languages. It rechecked 49 existing records and added 201. The range had 40
current correction-candidate IDs and five evidence-limited holds; `44964`
carried both dimensions, while 206 IDs had no current finding. The ledger
then covered 50,312 / 65,135 IDs (77.24%), leaving 14,823; 40,549 had
indexed asset links and 9,763 did not. Sequential coverage reached `44999`.
Sixty-two exact-English duplicate groups touched the range, covering 874
corpus rows; Korean matched within every group. Eight multiline rows
contained 77 Korean breaks with matching English and Chinese layouts, while
Japanese had one fewer break at `44827`. Of 250 IDs, 195 had indexed asset
associations, including 146 newly recorded IDs; links do not establish
per-key speaker or playback order. Catalog reproduction, all 50,312 ledger
fingerprints, nine related index tests, and the line-ending-aware diff check
passed. No translation CSV was modified in that batch. See
[`dialogue-context-default-44750-44999-revalidation-20261112.md`](dialogue-context-default-44750-44999-revalidation-20261112.md).

## Previous Checkpoint

The preceding `44000`-`44249` pass compared all 250 current rows across four
languages. It rechecked 66 existing records and added 184. The range had 28
current correction candidates and one evidence-limited hold; 221 IDs had
no supported finding. A prior hold at `44238` was cleared after verifying
that its Japanese source differs from duplicate-English ID `27910`, matching
the distinction already present in Korean; the older ledger row remains
unchanged as historical evidence. The ledger then covered 49,758 / 65,135
IDs (76.39%), leaving 15,377; 40,145 had indexed asset links and 9,613 did
not. Sequential coverage reached `44249`. Sixty exact-English duplicate
groups touched the range, covering 1,207 corpus rows. In the eight-row
`I'll be back tomorrow.` group, Japanese and Korean both split into matching
polite and plain variants; a previous register hold was cleared. Five
multiline rows contained 15 Korean breaks with matching four-language
counts; embedded Korean separators were CRLF and were preserved. Of 250 IDs,
189 had indexed asset associations, including 123 newly recorded IDs; links
do not establish per-key speaker or playback order. Catalog reproducibility,
all 49,758 ledger fingerprints, nine related index tests, and the
line-ending-aware diff check passed. No translation CSV was modified in this
batch. See
[`dialogue-context-default-44000-44249-revalidation-20261112.md`](dialogue-context-default-44000-44249-revalidation-20261112.md).

## Earlier Checkpoints

The latest `43750`-`43999` pass compared all 250 current rows across four
languages. It rechecked 70 existing records and added 180. The range has 19
current correction candidates and five evidence-limited holds; 226 IDs have
no supported finding after a subsequent Japanese/Korean duplicate-register
recheck. The ledger then covered 49,574 / 65,135 IDs (76.11%), leaving
15,561. Sequential coverage reached `43999`. See
[`dialogue-context-default-43750-43999-revalidation-20261112.md`](dialogue-context-default-43750-43999-revalidation-20261112.md).

The preceding `43500`-`43749` pass compared all 250 current rows across four
languages. It rechecked 72 existing records and added 178. The range had 28
current correction candidates and 11 evidence-limited holds; 211 IDs had no
supported finding. The ledger then covered 49,394 / 65,135 IDs (75.83%),
leaving 15,741; 39,895 had indexed asset links and 9,499 did not. Sequential
coverage reached `43749`. Forty-eight exact-English duplicate groups
covered 1,066 corpus rows, with matching Korean within every exact group.
Two multiline rows contained eight Korean breaks, and all four languages
matched their per-row counts. Of 250 IDs, 197 had indexed asset associations,
including 125 newly recorded IDs. See
[`dialogue-context-default-43500-43749-revalidation-20261112.md`](dialogue-context-default-43500-43749-revalidation-20261112.md).

The preceding `43250`-`43499` pass compared all 250 current rows across four
languages. It rechecked 59 existing records and added 191. The range had 19
current correction candidates and three evidence-limited holds; 228 IDs had
no supported finding. The ledger then covered 49,216 / 65,135 IDs (75.56%),
leaving 15,919; 39,770 had indexed asset links and 9,446 did not. Sequential
coverage reached `43499`. Fifty-one exact-English duplicate groups covered
490 corpus rows, with matching Korean within every exact group. Seven
multiline rows contained 18 Korean breaks, and all four languages matched
their per-row counts. Of 250 IDs, 198 had indexed asset associations,
including 139 newly recorded IDs. See
[`dialogue-context-default-43250-43499-revalidation-20261112.md`](dialogue-context-default-43250-43499-revalidation-20261112.md).
[`dialogue-context-default-43250-43499-revalidation-20261112.md`](dialogue-context-default-43250-43499-revalidation-20261112.md).

The preceding `42500`-`42749` pass compared all 250 current rows across four
languages. It rechecked 66 existing records and added 184. The range had 35
current correction candidates and seven evidence-limited holds; `42738` had
both dispositions, while 209 IDs had no supported finding. The ledger then
covered 48,649 / 65,135 IDs (74.69%), leaving 16,486; 39,384 had indexed
asset links and 9,265 did not. Fifty-six exact-English duplicate groups
(1,475 corpus rows) touched the range. Eight multiline rows contained 64
embedded Korean breaks, with matching four-language break counts and
runtime/control-token signatures. Of 250 IDs, 192 had indexed asset
associations. See
[`dialogue-context-default-42500-42749-revalidation-20261112.md`](dialogue-context-default-42500-42749-revalidation-20261112.md).

The preceding `42250`-`42499` pass rechecked 51 existing records and added
199. It had 26 correction candidates and six evidence-limited holds;
`42447` had both dispositions, while 219 IDs had no supported finding. The
ledger then covered 48,465 / 65,135 IDs (74.40%). See
[`dialogue-context-default-42250-42499-revalidation-20261112.md`](dialogue-context-default-42250-42499-revalidation-20261112.md).

The preceding `42000`-`42249` pass compared all 250 current rows across four
languages. It rechecked 66 existing records and added 184. The range had 27
current correction candidates and nine evidence-limited holds; `42176` had
both dispositions, while 215 IDs had no supported finding. The ledger then
covered 48,266 / 65,135 IDs (74.10%), leaving 16,869; 39,171 had indexed
asset links and 9,095 did not. Sequential coverage reached `42249`. Sixty-one
exact-English duplicate groups (1,010 corpus rows) touched the range, with
matching Korean in every group. Nine multiline rows contained 46 embedded
Korean breaks; eight matched the four-language counts, while `42198` had one
extra Korean break. Of 250 IDs, 198 had indexed asset associations. See
[`dialogue-context-default-42000-42249-revalidation-20261112.md`](dialogue-context-default-42000-42249-revalidation-20261112.md).

The preceding `41750`-`41999` pass compared all 250 current rows across four
languages. It rechecked 63 existing records and added 187. The range had 17
current correction candidates and 16 evidence-limited holds; `41798` and
`41999` had both dispositions, while 219 IDs had no supported finding. The
ledger then covered 48,082 / 65,135 IDs (73.82%), leaving 17,053; 39,039 had
indexed asset links and 9,043 did not. Sequential coverage reached `41999`.
Fifty-eight exact-English duplicate groups (1,397 corpus rows) touched the
range, with matching Korean in every group. Four multiline rows had matching
four-language break counts (10 embedded Korean breaks). Of 250 IDs, 199 had
indexed asset associations. See
[`dialogue-context-default-41750-41999-revalidation-20261112.md`](dialogue-context-default-41750-41999-revalidation-20261112.md).

The preceding `41500`-`41749` pass compared all 250 current rows across four
languages. It rechecked 67 existing records and added 183, with 11
correction candidates, one evidence-limited hold, and 238 IDs with no
supported finding. The ledger then covered 47,895 / 65,135 IDs (73.53%),
leaving 17,240. Sixty-seven exact-English duplicate groups (1,051 corpus
rows) touched the range, and Korean matched within every group. Six multiline
rows had matching four-language break counts (20 embedded Korean breaks).
Of the 250 IDs, 201 had indexed asset associations. See
[`dialogue-context-default-41500-41749-revalidation-20261112.md`](dialogue-context-default-41500-41749-revalidation-20261112.md).

The preceding `41250`-`41499` pass compared all 250 current rows across four
languages. It rechecked 74 existing records and added 176. The range had 21
correction candidates and six evidence-limited holds; `41271` had both a
candidate and a separate hold, and 224 IDs had no supported finding. The
ledger then covered 47,712 / 65,135 IDs (73.25%), leaving 17,423; 38,769 had
indexed asset links and 8,943 did not. Sequential coverage reached `41499`.
Fifty-one exact-English duplicate groups (956 corpus rows) touched the
range; Korean differed only in `30574`, `33784`, and `41405`, where Japanese
greetings supported the distinct wording. Seven multiline rows had matching
four-language break counts (21 embedded Korean breaks). Of the 250 IDs, 210
had indexed asset associations. See
[`dialogue-context-default-41250-41499-revalidation-20261112.md`](dialogue-context-default-41250-41499-revalidation-20261112.md).

The preceding `41000`-`41249` pass compared all 250 current rows across four
languages. It rechecked 59 existing records and added 191. The range has 27
correction candidates and six evidence-limited holds; `41178` has both a
candidate and a separate hold, and 217 IDs have no finding. The ledger then
covered 47,536 / 65,135 IDs (72.98%), leaving 17,599; 38,633 had indexed
asset links and 8,903 did not. Fifty-nine exact-English duplicate groups
(1,182 corpus rows) touched the range, and Korean matched within every group.
Five multiline rows had matching four-language break counts (17 embedded
Korean breaks). All 250 IDs had indexed asset associations. See
[`dialogue-context-default-41000-41249-revalidation-20261112.md`](dialogue-context-default-41000-41249-revalidation-20261112.md).

The preceding `40750`-`40999` pass compared all 250 current rows across four
languages. It rechecked 67 existing records and added 183. The range had 15
correction candidates, 21 evidence-limited holds, and 214 IDs with no
finding. The ledger then covered 47,345 / 65,135 IDs (72.68%), leaving 17,790;
38,442 had indexed asset links and 8,903 did not. Sequential coverage reached
`40999`. Fifty-four exact-English duplicate groups (1,435 corpus rows)
touched the range; one group's Korean wording differed because Japanese
distinguishes accepting a request from completing it. The three multiline
entries had matching four-language break counts (eight embedded Korean CRLF
breaks). At `40814`, Korean followed the English/Japanese control order while
Chinese placed its localized dodge label later. Translation CSVs remain
unchanged. See
[`dialogue-context-default-40750-40999-revalidation-20261112.md`](dialogue-context-default-40750-40999-revalidation-20261112.md).

The preceding `40500`-`40749` pass compared all 250 current rows across four
languages. It rechecked 67 existing records and added 183. The range had 31
correction candidates and five evidence-limited holds; 214 IDs had no
finding. The ledger then covered 47,162 / 65,135 IDs (72.41%), leaving 17,973;
38,303 had indexed asset links and 8,859 did not. Sequential coverage reached
`40749`. Fifty-seven exact-English duplicate groups (1,646 corpus rows)
matched in Korean. All five multiline entries had matching four-language
break counts (16 embedded Korean CRLF breaks). At `40544`, Japanese orders
the placeholders differently from English, Chinese, and Korean; localized
wrapper payloads at `40546` remain intact. See
[`dialogue-context-default-40500-40749-revalidation-20261112.md`](dialogue-context-default-40500-40749-revalidation-20261112.md).

The preceding `40250`-`40499` pass compared all 250 current rows across four
languages. It rechecked 75 existing records and added 175. The range had 25
correction candidates and four evidence-limited holds; `40395` and `40473`
each had both a candidate and a separate hold. The other 223 IDs had no
finding. The ledger then covered 46,979 / 65,135 IDs (72.13%), leaving
18,156; 38,166 had indexed asset links and 8,813 did not. Sequential coverage
reached `40499`. Four exact-English duplicate groups (eight range rows)
matched in Korean. All six multiline entries had matching four-language
break counts. At `40303`, Korean, English, and Japanese retained the same
placeholder order; Chinese differed. See
[`dialogue-context-default-40250-40499-revalidation-20261112.md`](dialogue-context-default-40250-40499-revalidation-20261112.md).

The preceding `40000`-`40249` pass compared all 250 current rows across four
languages. It rechecked 69 existing records and added 181. The range has 19
correction candidates and five evidence-limited holds; `40052` has both a
name-format candidate and a separate location hold. The other 227 IDs have
no new finding. The ledger then covered 46,804 / 65,135 IDs (71.86%), leaving
18,331; 38,038 had indexed asset links and 8,766 did not. Sequential coverage
reached `40249`. Fifty-seven exact-English duplicate groups (1,133 corpus
rows) touched the range; the only Korean wording difference is supported by
Japanese distinguishing `Mine` as a mine versus a landmine. All four-language
line-break counts matched, and the parameter order at `40191` was preserved.
See
[`dialogue-context-default-40000-40249-revalidation-20261112.md`](dialogue-context-default-40000-40249-revalidation-20261112.md).

The preceding `39500`-`39749` pass compared all 250 current rows across four
languages. It rechecked 73 existing records and added 177. The range had 26
correction candidates, 26 evidence-limited holds, and 202 IDs with no
finding. The ledger covered 46,430 / 65,135 IDs (71.28%), leaving 18,705;
37,777 had indexed asset links and 8,653 did not. Sequential coverage reached
`39749`. Sixty exact-English duplicate groups (1,287 corpus rows) touched the
range, and Korean matched within every group. All line-break counts and
runtime-token/markup signatures matched. See
[`dialogue-context-default-39500-39749-revalidation-20261112.md`](dialogue-context-default-39500-39749-revalidation-20261112.md).
Catalog, fingerprint, test, and diff checks passed, and no translation CSV
was changed.

An earlier `39000`-`39249` pass compared all 250 current rows across four
languages. It rechecked 56 existing records and added 194. The range has 23
overall candidates and five uncertain IDs. The ledger covered 46,075 /
65,135 IDs (70.74%), leaving 19,060; 37,533 had indexed asset links and
8,542 did not. Sequential coverage reached `39249`.
Sixty-one duplicate-English groups touched the range; the only Korean wording
variation was supported by a Japanese register difference. Two multiline
rows had matching line-break counts and token/markup structure matched.
All ledger fingerprints and catalogs validated, nine related tests passed,
and no translation CSV was changed. See
[`dialogue-context-default-39000-39249-revalidation-20261112.md`](dialogue-context-default-39000-39249-revalidation-20261112.md).

The preceding `38750`-`38999` pass compared all 250 current rows across four
languages. It rechecked 62 existing records and added 188. The range had 27
overall candidates and 11 overall uncertain IDs; `38799` also had a separate
meaning hold while its overall disposition remained candidate. The ledger
then covered 45,881 / 65,135 IDs (70.44%), leaving 19,254; 37,392 had
indexed asset links and 8,489 did not. Sequential coverage reached `38999`.
See
[`dialogue-context-default-38750-38999-revalidation-20261112.md`](dialogue-context-default-38750-38999-revalidation-20261112.md).

The preceding `38500`-`38749` pass compared all 250 current rows across four
languages. It rechecked 69 existing records and added 181. The range had 21
candidate and two uncertain statuses. The ledger then covered 45,693 /
65,135 IDs (70.15%), leaving 19,442; 37,273 had indexed asset links and 8,420
did not. Sequential coverage reached `38749`; next was `38750`-`38999`.
Fingerprints validated, nine related tests passed, and no translation CSV was
changed. See
[`dialogue-context-default-38500-38749-revalidation-20261112.md`](dialogue-context-default-38500-38749-revalidation-20261112.md).

The preceding `38250`-`38499` pass compared all 250 current rows across four
languages. It rechecked 54 recorded IDs and added 196. The range has 12
candidate and six uncertain statuses. The ledger then covered 45,512 / 65,135
IDs (69.87%), leaving 19,623; 37,145 had indexed asset links and 8,367 did not.
Sequential coverage reached `38499`; next was `38500`-`38749`. Fingerprints
validate, nine related tests pass, and no translation CSV was changed. See
[`dialogue-context-default-38250-38499-revalidation-20261112.md`](dialogue-context-default-38250-38499-revalidation-20261112.md).

The preceding `38000`-`38249` pass compared all 250 current rows across four
languages. It rechecked 69 recorded IDs and added 181; 14 range IDs have
candidate status and five have uncertain status, including two with separate
format candidates. At `38114`, the current name pairing already resolves the
older candidate. The ledger then covered 45,316 / 65,135 IDs (69.57%), leaving
19,819; 37,008 had indexed asset links and 8,308 did not. Sequential coverage
reached `38249`; next was `38250`-`38499`. The source fingerprints and review
tests validate, and no translation CSV was changed. See
[`dialogue-context-default-38000-38249-revalidation-20261112.md`](dialogue-context-default-38000-38249-revalidation-20261112.md).

The preceding `37750`-`37999` pass compared all 250 IDs across English, Japanese,
Chinese, and active Korean; it rechecked 75 existing ledger entries and added
175. It records 19 candidate IDs and four evidence-limited holds; seven
existing candidates and one hold were retained, three existing entries were
promoted to candidates, and two to holds. Sixty-nine exact-English duplicate
groups (1,210 corpus rows) touch the range; Korean differs in two groups, and
Japanese also differs in both. Four embedded-break rows contain 17 breaks in
English, Chinese, and Korean and 19 in Japanese; the extra two Japanese
breaks are at `37797`. Runtime-token and markup inventories match, with
Japanese reversing the two placeholders at `37980`. The ledger then covered
45,135 / 65,135 IDs (69.29%), leaving 20,000. Sequential coverage reached
`37999`; next was `38000`-`38249`. See
[`dialogue-context-default-37750-37999-revalidation-20261112.md`](dialogue-context-default-37750-37999-revalidation-20261112.md).
The 530-asset and 65,135-ID catalogs reproduce exactly; all 45,135 ledger
fingerprints validate, nine related index tests pass, and the scoped diff
check passes. The ledger covers 36,886 IDs with indexed asset links and 8,249
without. Translation CSVs remain unchanged.

The preceding `37500`-`37749` pass compared all 250 IDs across English,
Japanese, Chinese, and active Korean; it rechecked 61 existing ledger entries
and added 189. It records 20 candidate IDs and three evidence-limited holds;
four candidates and one hold were already in the ledger and were rechecked.
Sixty-one exact-English duplicate groups (1,138 corpus rows) touch the range,
with the only Korean wording difference supported by a Japanese source
difference. Five embedded-break rows have matching four-language counts (11
per locale), and normalized runtime-token/markup inventories match. The
ledger then covered 44,960 / 65,135 IDs (69.03%), leaving 20,175. Sequential
coverage reached `37749`; next was `37750`-`37999`. See
[`dialogue-context-default-37500-37749-revalidation-20261112.md`](dialogue-context-default-37500-37749-revalidation-20261112.md).
The catalogs, ledger fingerprints, nine related index tests, and scoped diff
check passed; translation CSVs remained unchanged.

The preceding `37250`-`37499` pass compared all 250 IDs across English,
Japanese, Chinese, and active Korean; it rechecked 71 existing ledger entries
and added 179 in-range IDs. It records 23 correction-candidate IDs and 11
evidence-limited holds; `37274` and `37404` each have both dimensions, while
218 other in-range IDs have no new finding. Three exact-English duplicate
groups (six rows) touch the range, with matching Korean in all groups. Four
embedded-break rows have matching four-language counts (14 per locale), and
normalized runtime-token/markup signatures match. The ledger then covered
44,771 / 65,135 IDs (68.74%), leaving 20,364. Sequential coverage reached
`37499`; next was `37500`-`37749`. See
[`dialogue-context-default-37250-37499-revalidation-20261112.md`](dialogue-context-default-37250-37499-revalidation-20261112.md).
All catalogs and ledger fingerprints validated, nine related index tests
passed, and the scoped diff check passed; translation CSVs remained unchanged.

The preceding `37000`-`37249` pass compared all 250 IDs across English,
Japanese, Chinese, and active Korean; it rechecked 65 existing ledger entries
and added 185 in-range IDs plus cross-range duplicate ID `40387`. It recorded
ten in-range correction candidates and four evidence-limited holds; 236 other
in-range rows had no new finding. Forty exact-English duplicate groups (564
corpus rows) touched the range, with matching Korean across all groups. Five
embedded-break rows had matching four-language counts (22 per locale), and
normalized runtime-token/markup signatures matched. The ledger then covered
44,592 / 65,135 IDs (68.46%), leaving 20,543; sequential coverage reached
`37249`.
See
[`dialogue-context-default-37000-37249-revalidation-20261112.md`](dialogue-context-default-37000-37249-revalidation-20261112.md).
The 530-asset and 65,135-ID catalogs reproduced exactly; all 44,592 ledger
fingerprints, nine related index tests, and the scoped diff check passed.
Reviewed asset-linked coverage was 36,482 IDs and unlinked coverage was
8,110. Translation CSVs remain unchanged.

The latest `36750`-`36999` pass compared all 250 IDs across English, Japanese,
Chinese, and active Korean; it rechecked 64 existing ledger entries and added
186 in-range IDs. It records 14 candidate IDs and three in-range
evidence-limited holds; 233 other rows have no new in-range finding. Five
cross-range IDs were added for directly related terminology, and three
existing related records were linked or updated. Sixty exact-English
duplicate groups (1,503 corpus rows) touch the range; Korean differences are
retained where Japanese also differs. Twelve embedded-break rows have
matching four-language counts (48 per locale). The ledger now covers 44,406 /
65,135 IDs (68.18%), leaving 20,729; 36,356 reviewed IDs have indexed asset
links and 8,050 do not. Sequential coverage reaches `36999`.
See
[`dialogue-context-default-36750-36999-revalidation-20261112.md`](dialogue-context-default-36750-36999-revalidation-20261112.md).
All 530-asset and 65,135-ID catalogs reproduce exactly, all 44,406 ledger
fingerprints validate, nine index tests pass, and the scoped diff check passes;
translation CSVs remain unchanged.

The preceding `36500`-`36749` pass compared all 250 IDs across English,
Japanese, Chinese, and active Korean; it rechecked 64 existing ledger entries
and added 186 in-range IDs. It records 18 correction candidates and two
evidence-limited holds; 230 other rows have no new finding. Sixty-seven
exact-English duplicate groups (1,384 corpus rows) touch the range, and Korean
matches within every full-string group. Seven embedded-break rows have
matching four-language counts (34 per locale). Exact-English title follow-ups
added cross-range ID `58806`. The ledger reached 44,215 / 65,135 IDs (67.88%),
leaving 20,920; sequential coverage reached `36749`. See
[`dialogue-context-default-36500-36749-revalidation-20261112.md`](dialogue-context-default-36500-36749-revalidation-20261112.md).
All catalogs, ledger fingerprints, nine index tests, and the scoped diff check
passed; translation CSVs remain unchanged.

The preceding `36250`-`36499` pass compared all 250 IDs across English,
Japanese, Chinese, and active Korean; it rechecked 55 existing ledger entries
and added 195. It retained three correction candidates and two
evidence-limited holds; `36268` has a candidate plus a separate location hold.
Fifty-nine exact-English duplicate groups (1,588 corpus rows) touch the range,
with matching Korean within each full-string group. Embedded line breaks and
normalized runtime-token/markup signatures match across all four languages.
The ledger reached 44,028 / 65,135 IDs (67.60%), leaving 21,107; sequential
coverage reached `36499`. See
[`dialogue-context-default-36250-36499-revalidation-20261112.md`](dialogue-context-default-36250-36499-revalidation-20261112.md).
All catalogs, ledger fingerprints, nine index tests, and the scoped diff check
passed; translation CSVs remain unchanged.

The preceding `36000`-`36249` pass compared all 250 rows in English, Japanese,
Chinese, and active Korean; it rechecked 68 existing ledger entries and added
182. It records 21 candidate IDs and two evidence-limited holds, with three
previously `not-issue` rows gaining separate English-pairing candidates.
Sixty-one exact-English duplicate groups (1,509 corpus rows) touch the range,
with matching Korean throughout each group. Six embedded-break rows have
matching four-language line counts and normalized runtime-token/markup
signatures. The ledger reached 43,833 / 65,135 IDs (67.30%), leaving 21,302;
sequential coverage reached `36249`. See
[`dialogue-context-default-36000-36249-revalidation-20261112.md`](dialogue-context-default-36000-36249-revalidation-20261112.md).
The catalog checks, all ledger fingerprints, nine index tests, and scoped diff
check passed; translation CSVs remain unchanged.

The preceding `35750`-`35999` pass compared all 250 rows in English, Japanese,
Chinese, and Korean; it rechecked 71 existing ledger records and added 179.
It records 12 candidate IDs and five evidence-limited holds, with `35864`
having separate candidate and hold dispositions. The prior `35865` candidate
was cleared because its current full faction term and `death cult` wording
already match the proposed forms. The prior `35937` candidate was reclassified
as a hold because English/Japanese support `관 덮개` while Chinese and a later
review support `수의`. Fifty-seven exact-English duplicate groups (1,353
corpus rows) touch the range; Korean matches within all groups. Seven rows
contain embedded line breaks; counts and normalized brace-token/markup
signatures match across all four languages. See
[`dialogue-context-default-35750-35999-revalidation-20261112.md`](dialogue-context-default-35750-35999-revalidation-20261112.md).

The latest `35500`-`35749` pass rechecked 55 existing entries and added 195
in-range IDs. It records 38 candidate IDs, eight evidence-limited holds, and
205 with no finding; one ID has both a candidate and a separate hold.
Forty-nine exact-English duplicate groups (1,100 corpus rows) touch the
range, with matching Korean within each full-string group. No cross-language
line-break-count mismatch was found. Korean token order matches Japanese and
Chinese; English differs at `35513` in localized skill-wrapper placement.
Historical questions at `35663` and `35741` were rechecked. See
[`dialogue-context-default-35500-35749-revalidation-20261112.md`](dialogue-context-default-35500-35749-revalidation-20261112.md).
The catalogs, ledger fingerprints, nine related tests, and audit-scoped diff
check passed; translation CSVs remain unchanged.

The full-corpus `default` re-review then had 43,472 of 65,135 IDs recorded
(66.74%), leaving 21,663. Asset-linked coverage is separate from the
full-corpus progress denominator. The generated ID catalog reports 35,711
reviewed IDs with an indexed asset link and 7,761 without one; 51,080 total
IDs have an asset link, including IDs not yet reviewed. Sequential coverage
reaches ID `35749`; the next range is `35750`-`35999`.
The preceding `35250`-`35499` pass rechecked 63 existing entries and added
187 in-range IDs. Two out-of-range IDs were added to trace the exact-English
`Okay then.` group. It records 35 candidate IDs, four uncertain IDs, and 211
with no finding; two prior candidates were cleared. Sixty exact-English
duplicate groups (1,478 corpus rows) touch the range. The only Korean
variations are `Okay then.` (held for conflicting source/context readings)
and `Defeat the First Sword` (candidate for consistent naming and objective
form). Two rows contain embedded line breaks, with matching counts and
normalized runtime-token/markup signatures across all four languages. See
[`dialogue-context-default-35250-35499-revalidation-20261112.md`](dialogue-context-default-35250-35499-revalidation-20261112.md).
The catalogs and ledger fingerprints were validated, nine related tests
passed, and translation CSVs remain unchanged.
The preceding `35000`-`35249` pass rechecked 57 existing entries and added 193
in-range IDs. Eight out-of-range IDs were also recorded for the exact-English
`Irion, King of Cups` duplicate group. The range has 20 overall candidates,
four uncertain entries, and 226 not flagged; the title-meaning hold at
`35103` is independent of its format candidate. Five previously unflagged
members of the duplicate group were promoted for the missing English title
pairing. Fifty-one exact-English duplicate groups (513 corpus rows) touch the
range; the sole Korean wording difference is supported by Japanese and
Chinese differences. Six rows contain embedded line breaks, with matching
counts and normalized runtime-token/markup signatures across all four
languages. See
[`dialogue-context-default-35000-35249-revalidation-20261112.md`](dialogue-context-default-35000-35249-revalidation-20261112.md).
The catalogs were regenerated and translation CSVs remain unchanged.
The latest `34750`-`34999` pass rechecked 72 existing entries and added 178.
It identified 20 new correction candidates and six new evidence-limited
holds, with three overlaps among the newly reviewed IDs. Two prior
candidates were cleared; the findings at `34866` and `34952` also received
separate holds. The range has 21 overall candidates, eight uncertain entries,
and 221 not flagged. Fifty-four exact-English duplicate groups (1,203 corpus
rows) touch the range; both Korean wording differences are supported by
Japanese differences. The 23 embedded line breaks and normalized runtime
token/markup signatures match across all four languages. See
[`dialogue-context-default-34750-34999-revalidation-20261112.md`](dialogue-context-default-34750-34999-revalidation-20261112.md).
The catalogs were regenerated and translation CSVs remain unchanged.
The preceding `34250`-`34499` pass rechecked 67 existing entries and added 183
IDs. It recorded 13 new correction candidates, promoted two existing
`not-issue` rows, and retained five existing candidates. Sixteen
evidence-limited holds were added and one prior hold retained; the hold at
`34251` was cleared. Two rows each have a formatting proposal alongside a
separate meaning/context hold. The range has 18 overall candidates, 17 holds,
and 215 entries not flagged. One exact-English duplicate group (three rows)
has matching Korean text. Embedded line breaks and normalized runtime-token
and markup inventories match across all four languages. See
[`dialogue-context-default-34250-34499-revalidation-20261112.md`](dialogue-context-default-34250-34499-revalidation-20261112.md).
The catalogs were regenerated; translation CSVs remain unchanged.
The preceding `34000`-`34249` pass rechecked 76 existing entries and added 174
in-range IDs plus five cross-range name references. It recorded 21 new
correction candidates, five new evidence-limited holds, and promoted six
existing `not-issue` rows; existing candidates and holds were retained. The
range has 34 candidate IDs, eight holds, and 208 entries not flagged.
Fifty-eight exact-English duplicate groups (951 corpus rows) touch the range;
Korean text matches within every group. Embedded line breaks and normalized
runtime-token and markup inventories match across all four languages. See
[`dialogue-context-default-34000-34249-revalidation-20261112.md`](dialogue-context-default-34000-34249-revalidation-20261112.md).
The catalogs were regenerated; translation CSVs remain unchanged.
The latest `33750`-`33999` pass rechecked 63 existing entries and added 187
in-range IDs. It recorded 18 new correction candidates and three
evidence-limited holds; four existing `not-issue` rows were promoted and
three existing candidates were retained. Ten additional
`Argine, Queen of Staves` IDs and five out-of-range `Lupoku` IDs were added;
their in-range occurrences `33892` and `33899` are included in the 187. The
identical `Before The Talk` entry at `36075` was grouped with `33820`, while
prior unrelated findings and holds were preserved. The range has 29
candidate IDs, three holds, and 218 entries not flagged. Sixty-nine
exact-English duplicate groups (1,660 corpus rows) touch the range; the sole
Korean wording variation also differs in Japanese. Embedded line breaks and
normalized runtime-token and markup inventories match across all four
languages. See
[`dialogue-context-default-33750-33999-revalidation-20261112.md`](dialogue-context-default-33750-33999-revalidation-20261112.md).
The catalogs were regenerated; translation CSVs remain unchanged.
The latest `33500`-`33749` pass rechecked 77 existing records and added 173
IDs. It records 24 correction candidates and three new evidence-limited
holds; nine existing candidates and three holds were retained, and three
existing `not-issue` rows (`33528`, `33688`, `33700`) were promoted. Sixty-two
other existing entries remain not flagged. Sixty-three exact-English
duplicate groups (1,278 corpus rows) touch the range; one Korean variation
also has a Japanese source variation. All four languages match in embedded
line breaks and normalized placeholder, layout-token, and markup signatures.
See
[`dialogue-context-default-33500-33749-revalidation-20261112.md`](dialogue-context-default-33500-33749-revalidation-20261112.md).
The catalogs were regenerated; translation CSVs remain unchanged.
The latest `33250`-`33499` pass rechecked 67 existing records and added 183
IDs. It recorded 25 new correction candidates and four new evidence-limited
holds; five existing candidates and the hold at `33445` remain. Fifty-two
exact-English duplicate groups (1,199 corpus rows) match in Korean; line
break and token signatures match across all four languages. See
[`dialogue-context-default-33250-33499-revalidation-20261112.md`](dialogue-context-default-33250-33499-revalidation-20261112.md).
The catalogs were regenerated; translation CSVs remain unchanged.
The `33000`-`33249` pass rechecked 49 existing records and added 201 IDs.
Thirteen new correction candidates were recorded; four holds were added on
new IDs, and existing `33096` was promoted to a hold. Seven existing
candidates and the hold at `33002` remain. Fifty-seven exact-English
duplicate groups (1,031 corpus rows) match in Korean. Korean line-break
counts match English and Japanese; Chinese alone has one fewer break at
`33089`. See
[`dialogue-context-default-33000-33249-revalidation-20261112.md`](dialogue-context-default-33000-33249-revalidation-20261112.md).
The catalogs were regenerated; translation CSVs remain unchanged.
The `32750`-`32999` pass rechecked 77 existing records and added 173 IDs.
Nine new correction candidates and four evidence-limited holds were recorded,
with `32891` overlapping both; five prior candidates and three prior holds
were rechecked and retained. Forty-seven exact-English duplicate groups
(1,309 corpus rows) match in Korean. Korean line-break counts match English
and Japanese except for the Chinese-only missing break at `32891`. At
`32999`, localized marker payloads vary, while the three wrappers and Korean
order remain intact. See
[`dialogue-context-default-32750-32999-revalidation-20261112.md`](dialogue-context-default-32750-32999-revalidation-20261112.md).
The catalogs were regenerated; translation CSVs remain unchanged.
The `32500`-`32749` pass rechecked 65 existing records and added 185 IDs.
Nine new in-range correction candidates and two evidence-limited holds were
recorded; all prior findings in the range were rechecked. Sixty exact-English
duplicate groups (760 corpus rows) touch the range. The sole Korean variation,
at `32613`, is supported by a Japanese phrasing difference. Korean alone adds
two embedded line breaks at `32711`; other line-break counts match. The
`fastings` descriptions at `32740` and `54487` support revisiting the prior
`32325` hold: consider `머드홀드 지하 통로(Mudhold Fasting)`, consistent with
the other named fastings. Findings remain proposals, not translation edits.
See
[`dialogue-context-default-32500-32749-revalidation-20261112.md`](dialogue-context-default-32500-32749-revalidation-20261112.md).
The catalogs were regenerated; translation CSVs remain unchanged.

The `32250`-`32499` pass rechecked 43 existing records and added 207 IDs.
Eight new in-range correction candidates were recorded; `22272` was promoted
alongside exact-English duplicate `32376`, and related card-name row `38453`
was added. Two new evidence-limited holds were recorded; three existing
candidates and three existing holds remain supported, while the other 37
existing records remain not flagged. Forty-eight exact-English duplicate
groups (1,030 corpus rows) touch the range, with matching Korean. Per-row
line-break counts match across all four languages; seven entries contain 23
Korean embedded breaks. Runtime-marker and markup structures match; Chinese
alone reverses the last two localized marker labels at `32470`. See
[`dialogue-context-default-32250-32499-revalidation-20261112.md`](dialogue-context-default-32250-32499-revalidation-20261112.md).
The catalogs were regenerated; translation CSVs remain unchanged. The total
includes the related follow-up at `38453`.
The `32000`-`32249` pass rechecked 55 existing records and added 195 IDs.
Eleven new correction-candidate IDs were recorded; pre-existing `not-issue`
entries `32241` and `33619` were promoted together as exact-English
duplicates. Six existing candidates and three evidence-limited holds were
retained; the other 45 existing records remain not flagged. Fifty-six exact-English
duplicate groups (1,002 corpus rows) touch the range. The only Korean
variation is `27293` / `32079`, where Japanese also differs. Per-row
line-break counts match across all four languages; 33 embedded Korean breaks
were preserved. Chinese alone reverses `{1}` and `{2}` at `32156`; Korean
matches English and Japanese. See
[`dialogue-context-default-32000-32249-revalidation-20261112.md`](dialogue-context-default-32000-32249-revalidation-20261112.md).
The catalogs were regenerated; translation CSVs remain unchanged.
The `31750`-`31999` pass rechecked 66 existing records and added 184 IDs.
Eighteen additional candidates were identified: 14 on new IDs and four
pre-existing `not-issue` entries promoted to candidates. One new
evidence-limited hold was recorded; five existing candidates and two existing
holds remain. Sixty-three exact-English duplicate groups (1,223 corpus rows)
touch the range, with no divergent Korean text. Per-row line-break counts
match across all four languages; Korean matches the English and Chinese
placeholder order at `31992`, while Japanese reorders those arguments.
Fifty-three embedded Korean line breaks were preserved. See
[`dialogue-context-default-31750-31999-revalidation-20261112.md`](dialogue-context-default-31750-31999-revalidation-20261112.md).
The catalogs were regenerated; translation CSVs remain unchanged.
The `31500`-`31749` pass rechecked 71 existing records and added 179 IDs.
Nine new correction candidates and two evidence-limited holds were recorded;
four existing candidates and one hold remain. Sixty-four exact-English
duplicate groups (1,206 corpus rows) touch the range. The only Korean
variation is `31562` / `55044`, where Japanese also differs. Newline and
normalized runtime/layout-token and markup checks match across all four
languages; 14 embedded Korean CRLF breaks were preserved. See
[`dialogue-context-default-31500-31749-revalidation-20261112.md`](dialogue-context-default-31500-31749-revalidation-20261112.md).
The `31250`-`31499` pass rechecked 71 existing records and added 179 IDs.
It identified 13 additional candidates: 11 on new IDs and two pre-existing
`not-issue` entries promoted to candidates; eight earlier candidates and two
evidence-limited holds remain open. Fifty-seven exact-English
duplicate groups (1,141 corpus rows) touch the range; the only Korean
variation is `Later.` at `31385`, `38762`, and `48513`, where Japanese also
differs. Per-row newline counts and normalized runtime/layout-token and
markup sequences match across all four languages. See
[`dialogue-context-default-31250-31499-revalidation-20261112.md`](dialogue-context-default-31250-31499-revalidation-20261112.md).
The catalogs were regenerated; translation CSVs remain unchanged.
The `31000`-`31249` pass rechecked 79 existing records and added 171 IDs.
It records 11 candidates among the new IDs and one evidence-limited hold;
existing `31002` and `31060` were promoted to candidates, and the `31085`
candidate was cleared. The range ends with 21 candidates and one hold.
Sixty-nine exact-English duplicate groups (1,402 corpus rows) match in Korean,
and per-row newline counts and normalized runtime/layout-token sequences
match across all four languages. See
[`dialogue-context-default-31000-31249-revalidation-20261112.md`](dialogue-context-default-31000-31249-revalidation-20261112.md).
The catalogs were regenerated; translation CSVs remain unchanged.
The `30750`-`30999` pass rechecked 74 existing records and added 176 IDs.
Thirteen correction candidates and four evidence-limited holds are recorded;
existing candidates `30778`, `30806`, `30807`, `30852`, `30902`, `30922`,
and `30936` remain open. Eighty exact-English duplicate groups (993 corpus
rows) match in Korean. Source conflicts at `30794`, `30843`, and `30993` and
the cryptic inscription at `30920` are documented in
[`dialogue-context-default-30750-30999-revalidation-20261112.md`](dialogue-context-default-30750-30999-revalidation-20261112.md).
The catalogs were regenerated; translation CSVs remain unchanged.
The `30500`-`30749` pass rechecked 69 existing records and added 181 IDs.
Fourteen correction candidates and two evidence-limited holds were recorded;
four earlier candidates remain. Exact-English duplicates, title/name pairing,
and the Japanese/Chinese-only line-break discrepancy are documented in
[`dialogue-context-default-30500-30749-revalidation-20261112.md`](dialogue-context-default-30500-30749-revalidation-20261112.md).
The catalogs were regenerated; translation CSVs remain unchanged.
The `30250`-`30499` pass rechecked 86 existing records and added 164 IDs.
Eight correction candidates and three evidence-limited holds were recorded;
13 prior candidates and one prior hold remain. Exact-English duplicate groups,
source conflicts, terminology consistency, and the Japanese-only line-break
discrepancy are documented in
[`dialogue-context-default-30250-30499-revalidation-20261112.md`](dialogue-context-default-30250-30499-revalidation-20261112.md).
The catalogs were regenerated; translation CSVs remain unchanged.
The `30000`-`30249` pass rechecked 58 existing records and added 192 IDs.
Twelve correction candidates and two evidence-limited holds were recorded;
nine earlier candidates remain. Exact-English duplicate groups, source
conflicts, and marker/line-break checks are documented in
[`dialogue-context-default-30000-30249-revalidation-20261112.md`](dialogue-context-default-30000-30249-revalidation-20261112.md).
The catalogs were regenerated; translation CSVs remain unchanged.
The `29750`-`29999` pass rechecked 60 existing records and added 190 IDs.
Seventeen correction candidates and one evidence-limited hold were recorded;
eight prior candidates remain. Exact-English duplicates, the Japanese source
name discrepancy at `29839`, and the Chinese-only line-break discrepancy at
`29868` are documented. The catalogs were regenerated; translation CSVs
remain unchanged. See
[`dialogue-context-default-29750-29999-revalidation-20261112.md`](dialogue-context-default-29750-29999-revalidation-20261112.md).
The `29500`-`29749` pass rechecked 62 existing records and added 188 IDs.
Eight correction candidates and three evidence-limited holds were recorded;
five prior candidates and three prior holds remain. Exact-English duplicates
match in Korean, and normalized token signatures and newline counts match
across all four languages. The catalogs were regenerated; no translation CSV
changed. See
[`dialogue-context-default-29500-29749-revalidation-20261112.md`](dialogue-context-default-29500-29749-revalidation-20261112.md).
The `29250`-`29499` pass rechecked 69 existing records and added 181 IDs.
Seven correction candidates and two evidence-limited holds were recorded;
the existing `29366` candidate and `29490` hold remain. Exact-English
duplicates match in Korean, and normalized token signatures and newline
counts match across all four languages. The catalogs were regenerated; no
translation CSV changed. See
[`dialogue-context-default-29250-29499-revalidation-20261112.md`](dialogue-context-default-29250-29499-revalidation-20261112.md).
The `28750`-`28999` pass rechecked 75 existing records and added 175 IDs.
It records six new correction candidates and four evidence-limited holds;
two prior candidates and four holds remain. Normalized token signatures and
newline counts match across the four languages. The catalogs were regenerated
and translation CSVs remain unchanged. See
[`dialogue-context-default-28750-28999-revalidation-20261112.md`](dialogue-context-default-28750-28999-revalidation-20261112.md).
The `26500`-`26749` pass rechecked 66 existing records and added 184 IDs.
Ten correction candidates were recorded (seven newly flagged and three
reclassified from `not-issue`), and one existing row was reclassified as an
evidence-limited hold. Four prior candidates and one prior hold were retained.
Exact-English duplicates, line breaks, localized markup, and the source
conflict at `26689` are documented in
[`dialogue-context-default-26500-26749-revalidation-20261112.md`](dialogue-context-default-26500-26749-revalidation-20261112.md).
The catalogs and all 36,806 four-language fingerprints were regenerated and
validated; translation CSVs remain unchanged.
The preceding `26350`-`26499` pass rechecked 38 entries and added 112 IDs,
recording ten new candidates and one new hold, reclassifying two existing
entries as holds, and retaining three candidates. See
[`dialogue-context-default-26350-26499-revalidation-20261112.md`](dialogue-context-default-26350-26499-revalidation-20261112.md).
The `26250`-`26349` pass rechecked 20 existing records and added 80 IDs,
recording eight new candidates and two holds; one existing entry was
reclassified as a candidate. See
[`dialogue-context-default-26250-26349-revalidation-20261112.md`](dialogue-context-default-26250-26349-revalidation-20261112.md).
The `26200`-`26249` pass rechecked 11 records and added 39 IDs, recording two
new candidates and two holds; one existing entry was reclassified as a
candidate. The `26100`-`26199` pass rechecked 28 records and added 72 IDs,
with ten new candidates and two holds. See
[`dialogue-context-default-26200-26249-revalidation-20261112.md`](dialogue-context-default-26200-26249-revalidation-20261112.md)
and
[`dialogue-context-default-26100-26199-revalidation-20261112.md`](dialogue-context-default-26100-26199-revalidation-20261112.md).
The `26000`-`26099` partial pass rechecked 23 existing records and added 77
new IDs, recording six correction candidates and three holds. Four earlier
candidates remain pending. See
[`dialogue-context-default-26000-26099-revalidation-20261112.md`](dialogue-context-default-26000-26099-revalidation-20261112.md).
The `25750`-`25999` range checked 66 existing records and added 184 new IDs,
with 21 correction candidates and two evidence-limited holds. Five existing
candidates and two holds were retained. Its 65 exact-English duplicate
groups (1,214 corpus rows) have matching Korean; the line-break mismatch at
`25915` is documented and normalized runtime markers are intact. No
translation CSV changed.
The `25500`-`25749` range checked 59 existing records and added 191 new IDs,
with eight correction candidates and one evidence-limited hold. Six existing
candidates and two holds were retained; one out-of-range duplicate candidate
was also recorded at `58994`. Its 59 exact-English duplicate groups (1,288
corpus rows) have two Korean variation groups documented; line-break and
normalized brace-token signatures match across all four languages. No
translation CSV changed.
The preceding `25250`-`25499` range checked 62 existing records and added
188 new IDs, with 20 correction candidates and two evidence-limited holds.
Nine existing candidates and three holds were retained. Its exact-English
duplicate group matches in Korean, and four-language structure checks pass.
No translation CSV changed.
The `25000`-`25249` range checked 64 existing records and added 186 new ones,
recording 20 correction candidates and one evidence-limited hold. Two
resolved findings were cleared, four existing candidates and one hold were
retained. Sixty exact-English duplicate groups (1,260 corpus rows) match in
Korean; the line-layout mismatch at `25208` is documented. No translation
CSV changed.
The `24750`-`24999` range checked 69 existing records and added 181 new ones,
recording ten correction candidates and one evidence-limited hold. Four
existing candidates were retained, two resolved findings were cleared, and
both existing holds were retained. Its 54 exact-English duplicate groups
(1,134 corpus rows) match in Korean; line-break and normalized
control-token signatures match across all four languages. No translation CSV
changed.
The `24750`-`24999` range checked 69 existing records and added 181 new ones,
recording ten correction candidates and one evidence-limited hold. Four
existing candidates were retained, two resolved findings were cleared, and
both existing holds were retained. Its 54 exact-English duplicate groups
(1,134 corpus rows) match in Korean; line-break and normalized
control-token signatures match across all four languages. No translation CSV
changed.
The `24250`-`24499` range checked 60 existing records and added 190 new ones,
with ten new correction candidates and five evidence-limited holds; eight
existing candidates were retained. The 64 exact-English duplicate groups
(808 corpus rows) match in Korean, and normalized line-break/control-token
signatures match across all four languages. No translation CSV changed.
The `24000`-`24249` range checked 57 existing records and added 193 new ones,
with 15 new candidates and one evidence-limited hold. It retained existing
candidates `24050` and `24206` and reclassified `24136` as a format
candidate. The source-supported differences between duplicate
`Here we are.` lines remain. The latest six earlier ranges checked 402
existing records and added 1,098 new ones:
`23750`-`23999` records fifteen new candidates, retains five prior
candidates, and clears `23919` and `23959`; `23500`-`23749` records ten new
candidates and two holds, clears the prior candidates at `23508` and `23648`,
and retains/reopens `23635` and `23662`;
`23250`-`23499` records ten new candidates, four evidence-limited holds,
nine retained candidates, and clears the context-resolved finding at `23436`;
`23000`-`23249` records ten new candidates and five evidence-limited holds,
while retaining four prior candidates;
`22500`-`22749` records 21 candidate IDs and 19 hold IDs (one overlap);
`22750`-`22999` records 24 candidate IDs and 20 hold IDs (three overlaps).
Source-backed duplicate distinctions, untranslated UI display-label questions,
earlier unresolved findings, and later approved terminology are preserved.
The catalogs and all 36,242 current four-language fingerprints were regenerated
and validated; 20 index/preservation-tool regression tests passed.
The preceding range,
`22000`-`22249`, added 185 records after checking 65 existing records.
Seven candidate IDs and four new evidence-limited holds were recorded; the
prior hold at `22080` was retained. Fifty-nine exact-English duplicate groups
(949 corpus rows) match in Korean; per-row line breaks match, and the
token-order exception at `22040` is documented. The preceding range,
`21750`-`21999`, added 183 records after checking 67 existing records.
Fourteen candidate IDs and one new evidence-limited hold were recorded; the
existing hold at `21937` was retained and the candidate at `21794` was
cleared. Forty-five exact-English duplicate groups (1,116 corpus rows) match
in Korean, and per-row line breaks and normalized control markers match
across all four languages. The preceding range,
`21500`-`21749`, added 181 records after checking 69 existing records. Ten
candidate IDs and eleven evidence-limited hold IDs were recorded, with two
IDs overlapping; four exact-English duplicate groups (eight rows) match in
Korean, and per-row line breaks and normalized control markers match across
the four languages. The preceding range,
`21250`-`21499`, added 189 records after checking 61 existing records,
retained five existing correction candidates, cleared one, and recorded 17
new correction findings plus six evidence-limited holds affecting six IDs.
The preceding `21000`-`21249` range added 192 records after checking 58
existing records, reclassified one existing row as a candidate, and recorded
17 correction findings affecting 18 IDs plus three evidence-limited holds
(one overlapping a candidate).
Overall, 285 of 426 linked assets have complete ledger coverage, 141 are
partially covered, and 104 assets have no linked IDs. Translation CSVs remain
unchanged during this review.

## Files

- `dialogue-context-default-32250-32499-revalidation-20261112.md` records
  207 new sequential IDs after checking 43 existing records, eight new
  in-range candidates, two new holds, one exact-English duplicate promoted
  with its in-range counterpart, and one related card-name follow-up. It
  documents duplicate-English, four-language line-break and markup checks,
  retained findings, and the source conflict at `32325`.
- `dialogue-context-default-26500-26749-revalidation-20261112.md` records
  184 newly entered IDs after checking 66 existing records, ten correction
  candidates (seven new, three reclassified), one reclassified hold, and the
  retained prior candidates and hold. It documents duplicate-English,
  four-language line-break and markup checks, and the source conflict at
  `26689`.
- `dialogue-context-default-26350-26499-revalidation-20261112.md` records
  112 newly entered IDs after checking 38 existing records, ten new
  candidates, one new hold, two reclassified holds, and three retained
  candidates.
- `dialogue-context-default-25750-25999-revalidation-20261112.md` records
  184 new IDs after checking 66 existing records, 21 correction candidates,
  two evidence-limited holds, and retained findings; it documents the exact-
  English duplicate, line-break, and runtime-token checks.
- `dialogue-context-default-25500-25749-revalidation-20261112.md` records
  191 new IDs after checking 59 existing records, eight in-range correction
  candidates, one evidence-limited hold, six retained candidates, two retained
  holds, and a duplicate-source follow-up at `58994`.
- `dialogue-context-default-25250-25499-revalidation-20261112.md` records
  188 new IDs after checking 62 existing records, 20 correction candidates,
  two evidence-limited holds, and nine retained candidates and three holds.
- `dialogue-context-default-25000-25249-revalidation-20261112.md` records
  186 new IDs after checking 64 existing records, 20 correction candidates,
  one evidence-limited hold, two cleared findings, and the retained existing
  candidates and hold. It documents duplicate-English and four-language
  structure checks.
- `dialogue-context-default-24750-24999-revalidation-20261112.md` records
  181 new IDs after checking 69 existing records, ten correction candidates,
  one evidence-limited hold, two cleared findings, and the retained existing
  candidates and holds. It documents duplicate-English and four-language
  structure checks.
- `dialogue-context-default-24250-24499-revalidation-20261112.md` records
  190 new IDs after checking 60 existing records, ten new candidates, five
  evidence-limited holds, and eight retained existing candidates. It documents
  duplicate-English, four-language structure, and unresolved-source checks.
- `dialogue-context-default-24000-24249-revalidation-20261112.md` records
  193 new IDs after checking 57 existing records, 15 correction candidates,
  one hold, and the retained/reclassified findings at `24050`, `24136`, and
  `24206`. Duplicate-English and four-language structure checks are
  documented.
- `default-quest-asset-index.tsv` has one row per exact 8-byte localization
  key and quest-asset association. An ID can appear more than once when its
  key occurs in multiple assets.
- `dialogue-context-asset-catalog.tsv` has one row for each of the 530
  extracted quest assets, including quest/NPC/handler clues, matched-ID and
  ledger counts, a conservative grouping tier, and review coverage.
- `dialogue-context-id-catalog.tsv` has one row for each of the 65,135
  `default` IDs, including linked assets, asset-level clues, and whether an
  ID has a review-ledger record. This includes IDs with no matched quest asset.
- `dialogue-context-review-ledger.tsv` has one row per reviewed
  `(resource, ID)`, with group membership, evidence links, and separate
  dispositions for meaning, naturalness, speech level, address, honorifics,
  and format. It stores a SHA-256 fingerprint over that ID's English,
  Japanese, Chinese, and active Korean text so changed source rows can be
  identified as stale.
- `dialogue-context-default-23250-23499-revalidation-20261112.md` records
  176 new IDs after checking 74 existing records, ten new candidates, and
  four evidence-limited holds. Nine existing candidates remain open; the
  prior candidate at `23436` was cleared using its already established FFQ03
  referent.
- `dialogue-context-default-23500-23749-revalidation-20261112.md` records
  188 new IDs after checking 62 existing records, ten correction candidates,
  and two evidence-limited holds. Two prior candidates were cleared and two
  were retained/reopened; duplicate-English, line-break, and marker checks
  are documented.
- `dialogue-context-default-23750-23999-revalidation-20261112.md` records
  178 new IDs after checking 72 existing records and fifteen correction
  candidates. Five prior candidates were retained and two were cleared;
  poem line layout, localized marker payloads, and duplicate-English groups
  are documented.
- `dialogue-context-default-23000-23249-revalidation-20261112.md` records
  183 new IDs after checking 67 existing records, ten new candidates, and
  five evidence-limited holds. Four prior candidates remain open; Japanese-
  supported duplicate differences and the `23185` line layout are documented.
- `dialogue-context-default-22250-22499-revalidation-20261112.md` records
  184 new IDs after checking 66 existing records, 13 candidate IDs, and
  11 hold IDs. The contract duplicate's Japanese accept/complete distinction
  and the Japanese-only blank line at `22497` are documented.
- `dialogue-context-default-22500-22749-revalidation-20261112.md` records
  193 new IDs after checking 57 existing records, 21 candidate IDs, and
  19 hold IDs (one overlap). All 68 duplicate-English groups match in Korean;
  logical breaks and normalized control-marker sequences match.
- `dialogue-context-default-22750-22999-revalidation-20261112.md` records
  180 new IDs after checking 70 existing records, 24 candidate IDs, and
  20 hold IDs (three overlaps). Two of 46 duplicate-English groups retain
  source-supported Korean register differences; the Chinese line-layout
  exception at `22963` is documented without altering the five-line Korean.
- `dialogue-context-default-21750-21999-revalidation-20261112.md` records
  183 new IDs after checking 67 existing records, fourteen candidates, one
  new hold, and the retained hold at `21937`; the previous candidate at
  `21794` was cleared. Forty-five exact-English duplicate groups (1,116
  corpus rows) match in Korean, with per-row line breaks and normalized
  control markers matching across all four languages.
- `dialogue-context-default-22000-22249-revalidation-20261112.md` records
  185 new IDs after checking 65 existing records, seven candidates, four new
  holds, and the retained hold at `22080`. Fifty-nine exact-English
  duplicate groups (949 corpus rows) match in Korean; per-row line breaks
  match, and the locale-specific `{1}` / `{2}` order at `22040` is documented.
- `dialogue-context-default-21000-21249-revalidation-20261112.md` records
  192 new IDs, 17 correction findings affecting 18 IDs, three new holds
  (one overlapping a candidate), and the retained findings rechecked in the
  range. Fifty-nine exact-English duplicate groups (1,088 corpus rows) have
  matching Korean; logical line breaks match across the four languages.
- `dialogue-context-default-21250-21499-revalidation-20261112.md` records
  189 new IDs, 17 new correction findings, six holds affecting six IDs,
  five retained candidates, and one cleared candidate. Fifty-nine
  exact-English duplicate groups (1,112 corpus rows) have matching Korean;
  per-row line-break counts match across all four languages, with the
  Japanese marker-order exception at `21488` documented.
- `dialogue-context-default-21500-21749-revalidation-20261112.md` records
  181 new IDs after checking 69 existing records, ten candidate IDs, and
  eleven holds (two overlapping candidate IDs). Four exact-English duplicate
  groups (eight rows) match in Korean; all four languages have matching
  per-row line breaks and normalized control-marker sequences.
- `dialogue-context-default-16500-16749-revalidation-20261111.md` records
  184 newly reviewed IDs, five new correction candidates, one existing
  candidate reclassification, ten new evidence-limited holds, three existing
  rows reclassified as holds, and full-range duplicate/format checks.
- `dialogue-context-default-16750-16999-revalidation-20261111.md` records
  190 newly reviewed IDs, seven correction candidates, six evidence-limited
  holds, and full-range duplicate/format checks.
- `dialogue-context-default-17000-17249-revalidation-20261111.md` records
  181 newly reviewed IDs, six correction-candidate findings, two
  evidence-limited holds, and full-range duplicate/format checks. It also
  reopens the `The Great General` pairing at IDs `473` and `2163`.
- `dialogue-context-default-17250-17499-revalidation-20261111.md` records
  185 newly reviewed IDs, five new correction candidates, ten new
  evidence-limited holds, two existing rows reclassified as candidates, five
  existing rows reclassified as holds, and full-range duplicate/format checks.
- `dialogue-context-default-17500-17749-revalidation-20261111.md` records
  185 newly reviewed IDs, two new correction candidates, six
  evidence-limited holds, six retained existing candidates, and full-range
  duplicate/format checks. The sequential ledger stands at 30,139 of 65,135
  IDs (46.27%).
- `dialogue-context-default-17750-17999-revalidation-20261111.md` records
  183 newly reviewed IDs, one new correction candidate, six evidence-limited
  holds, two retained existing candidates, and full-range duplicate/format
  checks. The sequential ledger stands at 30,322 of 65,135 IDs (46.54%).
- `dialogue-context-default-18000-18249-revalidation-20261111.md` records
  187 newly reviewed IDs, four retained correction candidates, 13
  evidence-limited holds, and full-range duplicate/format checks. The
  sequential ledger stands at 30,509 of 65,135 IDs (46.83%).
- `dialogue-context-default-18250-18499-revalidation-20261111.md` records
  190 newly reviewed IDs, six retained correction candidates, 17
  evidence-limited holds, and full-range duplicate/format checks, including
  the Japanese-only line-break and marker-order exceptions. The sequential
  ledger stands at 30,699 of 65,135 IDs (47.13%).
- `dialogue-context-default-18500-18749-revalidation-20261111.md` records
  188 newly reviewed IDs, six retained correction candidates, one cleared
  candidate, one new candidate, and 27 new evidence-limited holds. Sixty-three
  exact-English duplicate groups (914 corpus rows) match in Korean; the
  Japanese-only line-break and marker-order exceptions are documented. The
  sequential ledger stands at 30,887 of 65,135 IDs (47.42%).
- `dialogue-context-default-18750-18999-revalidation-20261111.md` records
  181 newly reviewed IDs, 15 correction candidates, and five
  evidence-limited holds. Fifty-eight exact-English duplicate groups
  (1,319 corpus rows) were checked; two Korean differences are supported by
  Japanese source distinctions. The sequential ledger stands at 31,068 of
  65,135 IDs (47.70%).
- `dialogue-context-default-19000-19249-revalidation-20261111.md` records
  173 newly reviewed IDs, eight retained candidates, five new candidates,
  and six holds. Fifty-two duplicate-English groups match in Korean;
  Japanese-only blank lines and the conflict between prior user title-order
  instructions and unapproved later proposals are documented. The ledger
  stands at 31,241 of 65,135 IDs (47.96%).
- `dialogue-context-default-19250-19499-revalidation-20261111.md` records
  196 newly reviewed IDs, four retained and seventeen new candidates, and
  twelve holds. Fifty-two duplicate-English groups were checked; one Korean
  split is supported by Japanese. Meaning, journal voice, Seelie spelling,
  and the source-layout difference at `19431` are documented. The ledger
  stands at 31,437 of 65,135 IDs (48.26%).
- `dialogue-context-default-19750-19999-revalidation-20261112.md` records
  179 newly reviewed IDs, seven retained and twelve new correction
  candidates, and five evidence-limited holds (one overlapping a candidate).
  Sixty-five duplicate-English groups have matching Korean; line-break and
  normalized control checks match. The ledger stands at 31,784 of 65,135
  IDs (48.80%).
- `dialogue-context-default-20000-20249-revalidation-20261112.md` records
  196 newly reviewed IDs, three retained candidates, fifteen new correction
  candidates, and five evidence-limited holds. Fifty-seven exact-English
  duplicate groups have matching Korean; Japanese meaning differences in
  repeated short prompts, line breaks, and runtime-token checks are
  documented. The ledger stands at 31,980 of 65,135 IDs (49.10%).
- `dialogue-context-default-20250-20499-revalidation-20261112.md` records
  167 newly reviewed IDs, six retained candidates, one cleared candidate,
  sixteen new correction candidates, and four evidence-limited holds.
  Fifty-six exact-English duplicate groups have matching Korean; line-break
  and runtime-token checks match. The ledger stands at 32,147 of 65,135 IDs
  (49.35%).
- `dialogue-context-default-20500-20749-revalidation-20261112.md` records
  195 newly reviewed IDs after checking 55 existing records, nine new
  correction candidates, and six evidence-limited holds. Fifty-nine
  exact-English duplicate groups have matching Korean; line-break and
  runtime-token checks match. The ledger stands at 32,342 of 65,135 IDs
  (49.65%).
- `dialogue-context-default-20750-20999-revalidation-20261112.md` records
  190 newly reviewed IDs after checking 60 existing records, eleven new
  correction candidates, two existing rows reclassified as candidates, and
  three evidence-limited holds. Fifty-three exact-English duplicate groups
  have matching Korean; line-break and runtime-token checks match. The ledger
  stands at 32,532 of 65,135 IDs (49.95%).
- `dialogue-context-default-19500-19749-revalidation-20261111.md` records
  168 newly reviewed IDs, three retained candidates, three reopened
  records, nineteen new candidates, and six holds. Sixty-three
  duplicate-English groups were checked, with one Japanese-supported
  Korean action distinction. Layout/control checks match; the ledger
  stands at 31,605 of 65,135 IDs (48.52%).
- `dialogue-context-amphora-fingerprint-followup-20261111.md` records the
  four-language recheck and fingerprint refresh for 13 rows updated with the
  requested English pairing; prior dispositions were retained.
- `litany-term-and-default-41412-review-20261111.md` records the `연도문` /
  `기도문` distinction across `base` and `default`, confirms no remaining
  `연도서`, and documents the conversational register correction at
  `default:41412`.
- `dialogue-context-default-16250-16499-revalidation-20261111.md` records
  180 newly reviewed IDs, seven correction candidates, twelve
  evidence-limited holds, and full-range duplicate/format checks. It also
  resolves conflicting `Fastings` recommendations for ID `16478` against
  related corpus entries.
- `dialogue-context-default-16000-16249-revalidation-20261111.md` records
  193 newly reviewed IDs, five retained candidates, seven evidence-limited
  holds, and duplicate/format checks for the range.
- `dialogue-context-default-09750-09999-revalidation-20261111.md` records
  186 newly re-reviewed IDs, thirteen correction candidates, nine
  evidence-limited holds, and duplicate/format checks for the range.
- `dialogue-context-default-10000-10249-revalidation-20261111.md` records
  182 newly re-reviewed IDs, thirteen correction candidates, seven
  evidence-limited holds, and duplicate/format checks for the range.
- `dialogue-context-default-10250-10499-revalidation-20261111.md` records
  182 newly re-reviewed IDs, seventeen correction candidates, eight
  evidence-limited holds, and duplicate/format checks for the range.
- `dialogue-context-default-10500-10749-revalidation-20261111.md` records
  188 newly re-reviewed IDs, twelve correction candidates, ten
  evidence-limited holds, and duplicate/format checks for the range.
- `dialogue-context-default-11000-11249-revalidation-20261111.md` records
  185 newly re-reviewed IDs, five correction candidates, and 37
  evidence-limited findings (three IDs overlap).
- `dialogue-context-default-11250-11499-revalidation-20261111.md` records
  189 newly re-reviewed IDs, four correction candidates, eight
  evidence-limited findings, and duplicate/format checks for the range.
- `dialogue-context-default-06000-06249-revalidation-20261111.md` records
  186 newly re-reviewed IDs, five correction candidates, four evidence-limited
  holds, and duplicate/format checks for the range.
- `dialogue-context-default-06250-06499-revalidation-20261111.md` records
  184 newly re-reviewed IDs, five correction candidates, one evidence-limited
  hold, and duplicate/format checks for the range.
- `dialogue-context-default-06500-06749-revalidation-20261111.md` records
  183 newly re-reviewed IDs, sixteen correction candidates, three
  evidence-limited holds, and duplicate/format checks for the range.
- `dialogue-context-default-07000-07249-revalidation-20261111.md` records
  187 newly re-reviewed IDs, nineteen correction candidates (three with
  evidence-limited dimensions), three holds, and duplicate/format checks.
  It also updates the direct self-identification evidence for `7013` and
  records the repeated House of Ballads pairing at `7141`.
- `dialogue-context-default-08000-08249-revalidation-20261111.md` records
  179 newly re-reviewed IDs, eight correction candidates, three
  evidence-limited holds, and duplicate/format checks.
- `dialogue-context-default-08500-08749-revalidation-20261111.md`,
  `dialogue-context-default-08750-08999-revalidation-20261111.md`, and
  `dialogue-context-default-09000-09249-revalidation-20261111.md` record 557
  newly reviewed IDs, 44 correction candidates, and 29 evidence-limited
  findings (three IDs overlap). Translation CSVs were not changed.
- `dialogue-context-default-08250-08499-revalidation-20261111.md` records
  170 newly re-reviewed IDs, five correction candidates, one
  evidence-limited hold, and duplicate/format checks.
- `dialogue-context-521918-sq13-antelope-revalidation-20261111.md` records
  all 97 linked IDs, 15 correction candidates, and two holds.
- `dialogue-context-default-00000-00249-revalidation-20261111.md` records
  the latest sequential full-corpus pass: 178 newly reviewed IDs from
  `0`-`249`, four correction candidates, and seven evidence-limited holds
  (ID `95` overlaps).
- `dialogue-context-default-00250-00499-revalidation-20261111.md` records
  185 newly reviewed IDs, four correction candidates, and seven
  evidence-limited holds from the next sequential range.
- `dialogue-context-default-00500-00749-revalidation-20261111.md` records
  196 newly reviewed IDs, one correction candidate, and three
  evidence-limited holds.
- `dialogue-context-default-00750-00999-revalidation-20261111.md` records
  185 newly reviewed IDs, four correction candidates, and three
  evidence-limited holds.
- `dialogue-context-default-01000-01249-revalidation-20261111.md` records
  184 newly reviewed IDs, ten correction candidates, and seven
  evidence-limited holds (one ID overlaps).
- `dialogue-context-default-01250-01499-revalidation-20261111.md` records
  180 newly reviewed IDs, 16 correction candidates, and three
  evidence-limited holds.
- `dialogue-context-default-01500-01749-revalidation-20261111.md` records
  187 newly reviewed IDs, 15 correction candidates, and three
  evidence-limited holds.
- `dialogue-context-default-01750-01999-revalidation-20261111.md` records
  187 newly reviewed IDs, ten correction candidates, and one
  evidence-limited hold.
- `dialogue-context-default-02000-02249-revalidation-20261111.md` records
  184 newly reviewed IDs, seven correction candidates, and two
  evidence-limited holds.
- `dialogue-context-default-02750-02999-revalidation-20261111.md` records
  183 newly reviewed IDs, seven correction candidates, five evidence-limited
  holds, and the full-corpus exact-English duplicate check for that range.
- `dialogue-context-default-03000-03249-revalidation-20261111.md` records
  179 newly reviewed IDs, 16 correction candidates, one evidence-limited
  hold, and the full-corpus exact-English duplicate check for that range.
- `dialogue-context-default-03250-03499-revalidation-20261111.md` records
  196 newly reviewed IDs, seven correction candidates, seven evidence-limited
  holds, and the full-corpus duplicate and structural checks for that range.
- `dialogue-context-default-03500-03749-revalidation-20261111.md` records
  188 newly reviewed IDs, six correction candidates, nine evidence-limited
  holds, and the full-corpus duplicate and structural checks for that range.
- `dialogue-context-default-03750-03999-revalidation-20261111.md` records
  170 newly reviewed IDs, seven correction candidates, one evidence-limited
  hold, and the full-corpus duplicate and structural checks for that range.
- `dialogue-context-default-04000-04249-revalidation-20261111.md` records
  183 newly reviewed IDs, one correction candidate, one evidence-limited
  hold, and the full-corpus duplicate and structural checks for that range.
- `dialogue-context-611613-sq66-lost-squad-revalidation-20261111.md` records
  all 97 linked IDs, 26 correction candidates, and five overlapping holds.
- `dialogue-context-731979-menetyre-revalidation-20261111.md` records all
  98 linked IDs, six correction candidates, and four holds. Explicit
  `SQ46` and the regional handler prefix are recorded separately.
- `dialogue-context-507502-sa08-revalidation-20261111.md` records all
  100 linked IDs, 19 correction candidates, and three holds, one overlapping.
- `dialogue-context-1262645-sq77-building-bridges-revalidation-20261111.md`
  records all 101 linked IDs, ten correction candidates, and eight holds,
  one overlapping.
- `dialogue-context-2026652-dlc1-ph07b-ollie-training-revalidation-20261111.md`
  records all 102 linked IDs, seven correction candidates, and three holds,
  one overlapping.
- `dialogue-context-576353-sq46-master-touch-revalidation-20261111.md`
  records all 102 linked IDs, 23 correction candidates, and three holds.
- `dialogue-context-1382473-sq114-brun-revalidation-20261111.md` records
  all 103 linked IDs, 14 correction candidates, and four holds.
- `dialogue-context-1695875-sq152-under-watch-revalidation-20261111.md`
  records 92 IDs, 11 correction candidates, and 16 IDs with unresolved
  findings for the SQ152 handler-prefix candidate asset.
- `dialogue-context-529073-sq11-culn-revalidation-20261111.md` records
  94 SQ11 IDs, three correction candidates, four register holds, and
  textual self-identification of Lord Cras at `23836`.
- `dialogue-context-1458189-sq122-tidings-war-revalidation-20261111.md`
  records 97 SQ122 IDs, 15 correction candidates, three holds, and textual
  self-identification of Ruhnir Wesnon at `30490`.
- `dialogue-context-501490-tr07-missives-revalidation-20261111.md`
  records 97 TR07 handler-prefix candidate IDs, 13 correction candidates,
  and six IDs with unresolved findings.
- `dialogue-context-583289-hv07-arena-revalidation-20261111.md` records all
  89 IDs linked to the multi-NPC `HV07` handler-prefix candidate asset,
  including 11 correction candidates; no per-key speaker is inferred.
- `dialogue-context-1993963-dlc1-sq08-tari-holstig-revalidation-20261111.md`
  records all 89 IDs linked to the `DLC1_SQ08` handler-prefix candidate asset,
  including seven correction candidates and one evidence-limited hold.
- `dialogue-context-1521231-sq127-malicious-practices-revalidation-20261111.md`
  records all 89 IDs linked to the `SQ127` handler-prefix candidate asset,
  including seven correction candidates and three evidence-limited hold IDs.
- `dialogue-context-1632212-sq149-mixing-business-revalidation-20261111.md`
  records all 89 IDs linked to `SQ149`, including eight correction
  candidates, three evidence-limited holds, and explicit self-identification
  evidence for Gwalchmai at ID `2835`.
- `dialogue-context-630966-sq65-maura-ordo-revalidation-20261111.md`
  records all 87 IDs linked to the `SQ65` handler-prefix candidate asset,
  including 18 correction candidates, one evidence-limited hold, and the
  explicit first-person self-identification evidence for two speakers.
- `dialogue-context-525551-sq17-canneroc-webwood-revalidation-20261111.md`
  records all 83 IDs linked to `SQ17` / Canneroc-Webwood asset
  `525551.quest_bxml`.
- `dialogue-context-2009109-dlc1-ph05b-gravehal-paintings-revalidation-20261111.md`
  records all 85 IDs linked to the Gravehal paintings asset.
- `dialogue-context-439722-sq08-headsman-revalidation-20261111.md` records all
  86 IDs linked to the multi-NPC `SQ08` asset.
- `dialogue-context-747925-ffq24-death-notices-revalidation-20261111.md`
  records all 86 IDs linked to the multi-NPC `FFQ24` asset.
- `dialogue-context-440729-sq04-flowering-revalidation-20261111.md` records
  all 86 IDs linked to the `SQ04` handler-prefix / Flowering-topic asset.
- `dialogue-context-571972-hv03-house-of-valor-revalidation-20261111.md`
  records all 83 IDs linked to the House of Valor asset.
- `dialogue-context-2603901-ao-sq-re-005-maisies-luck-revalidation-20261111.md`
  records the 53-ID `ao_sq_re_005` / Maisie's Luck review.
- `dialogue-context-2604801-hunting-party-revalidation-20261111.md` records
  the 55-ID Mithros Hunting Party topic review.
- `dialogue-context-2605200-ao-sq-ch-006-invasive-species-revalidation-20261111.md`
  records the 56-ID `ao_sq_ch_006` / Invasive Species review.
- `dialogue-context-510295-ffq04-ring-reprisal-revalidation-20261111.md`
  records the 83-ID `FFQ04` / Ring and Reprisal review.
- `dialogue-context-600351-revalidation-20261111.md` records the latest
  78-ID four-language review.
- `dialogue-context-1600024-sq144-lyra-ommer-revalidation-20261111.md`
  records the 79-ID `SQ144` review.
- `dialogue-context-523508-sq12-revalidation-20261111.md` records the
  80-ID Nanne Hanri / Karth topic review.
- `dialogue-context-next-five-unrecorded-assets-revalidation-20261111.md`
  records the five-asset review batch preceding the latest one.
- `dialogue-context-five-gravehal-restoration-assets-revalidation-20261111.md`
  records the five-asset Gravehal restoration revalidation.
- `dialogue-context-group-index-and-revalidation-20261110.md`,
  `dialogue-context-regroup-and-review-20261110.md`, and
  `dialogue-context-tr01-revalidation-20261110.md`,
  `dialogue-context-ffq80-revalidation-20261110.md`,
  `dialogue-context-sq87-revalidation-20261110.md`,
  `dialogue-context-ffq64-revalidation-20261110.md`,
  `dialogue-context-ffq67-revalidation-20261110.md`,
  `dialogue-context-ffq116-revalidation-20261110.md`,
  `dialogue-context-1292772-revalidation-20261110.md`,
  `dialogue-context-1443829-revalidation-20261111.md`,
  `dialogue-context-599193-revalidation-20261111.md`,
  `dialogue-context-1772558-revalidation-20261111.md`,
  `dialogue-context-1164089-1272808-revalidation-20261111.md`,
  `dialogue-context-two-npc-assets-revalidation-20261111.md`,
  `dialogue-context-five-pending-assets-followup-revalidation-20261111.md`,
  `dialogue-context-next-five-expanded-assets-followup-revalidation-20261111.md`,
  `dialogue-context-next-five-assets-iddyla-turin-apotyre-ariad-eathe-revalidation-20261111.md`,
  `dialogue-context-next-three-smallest-assets-revalidation-20261111.md`,
  `dialogue-context-744464-sq96-motus-mining-revalidation-20261111.md`,
  `dialogue-context-760709-760711-1333132-revalidation-20261111.md`,
  `dialogue-context-1611923-747916-598316-revalidation-20261111.md`,
  `dialogue-context-1339422-sq81-completion-20261111.md`,
  `dialogue-context-1937439-dlc1-mq03-brattigan-revalidation-20261111.md`,
  `dialogue-context-596269-sq59-feride-experiment-revalidation-20261111.md`,
  `dialogue-context-1944009-dlc2-sq07-evenroot-revalidation-20261111.md`,
  `dialogue-context-small-quest-text-assets-revalidation-20261111.md`,
  `dialogue-context-unmapped-dialogue-assets-revalidation-20261111.md`,
  `dialogue-context-small-dialogue-and-evenroot-assets-revalidation-20261111.md`,
  `dialogue-context-chaos-quest-assets-revalidation-20261111.md`,
  `dialogue-context-lorestone-and-small-assets-revalidation-20261111.md`,
  `dialogue-context-small-quest-assets-revalidation-20261111.md`,
  `dialogue-context-four-sparse-assets-revalidation-20261111.md`,
  `dialogue-context-five-small-assets-revalidation-20261111.md`,
  `dialogue-context-five-more-assets-revalidation-20261111.md`,
  `dialogue-context-four-quest-text-assets-revalidation-20261111.md`,
  `dialogue-context-five-assets-revalidation-20261111.md`,
  `dialogue-context-1962515-dlc1-sq06-revalidation-20261111.md`,
  `dialogue-context-2012226-dlc1-mq06-cillian-revalidation-20261111.md`,
  `dialogue-context-1962959-dlc2-mq06-secandra-revalidation-20261111.md`,
  `dialogue-context-next-five-assets-followup-revalidation-20261111.md`,
  `dialogue-context-remaining-five-assets-revalidation-20261111.md`,
  `dialogue-context-next-five-expanded-assets-revalidation-20261111.md`,
  `dialogue-context-next-five-assets-revalidation-20261111.md`,
  `dialogue-context-sq126-revalidation-20261110.md`,
  `dialogue-context-ffq35-revalidation-20261110.md`,
  `dialogue-context-sq79-revalidation-20261110.md`,
  `dialogue-context-sq102-revalidation-20261110.md`,
  `dialogue-context-sq93-revalidation-20261110.md`,
  `dialogue-context-sq100-revalidation-20261110.md`,
  `dialogue-context-sq108-revalidation-20261110.md`,
  `dialogue-context-sq116-revalidation-20261110.md`,
  `dialogue-context-sq117-revalidation-20261110.md`,
  `dialogue-context-sq118-revalidation-20261110.md`,
  `dialogue-context-ffq60-revalidation-20261110.md`,
  `dialogue-context-ffq66-revalidation-20261110.md`,
  `dialogue-context-sq80-revalidation-20261110.md`,
  `dialogue-context-ffq71-revalidation-20261110.md`,
  `dialogue-context-sq140-revalidation-20261110.md`,
  `dialogue-context-sq143-revalidation-20261110.md`,
  `dialogue-context-sq131-revalidation-20261110.md`,
  `dialogue-context-sq145-revalidation-20261110.md`,
  `dialogue-context-sq68-revalidation-20261110.md`,
  `dialogue-context-trsq01-revalidation-20261110.md`,
  `dialogue-context-trsq02-revalidation-20261110.md`,
  `dialogue-context-sq150-revalidation-20261110.md`,
  `dialogue-context-sasq01-revalidation-20261110.md`,
  `dialogue-context-sasq02-revalidation-20261110.md`,
  `dialogue-context-sasq03-revalidation-20261110.md`,
  `dialogue-context-m0-sq06-revalidation-20261110.md`,
  `dialogue-context-sq01-revalidation-20261110.md`,
  `dialogue-context-sq02-revalidation-20261110.md`,
  `dialogue-context-hm01-revalidation-20261110.md`,
  `dialogue-context-kv03-revalidation-20261110.md`,
  `dialogue-context-kv07-revalidation-20261110.md`,
  `dialogue-context-kvsq02-revalidation-20261110.md`,
  `dialogue-context-hp02-revalidation-20261110.md`,
  `dialogue-context-ffq26-revalidation-20261110.md`,
  `dialogue-context-ffq03-revalidation-20261110.md`,
  `dialogue-context-sq15-revalidation-20261110.md`,
  `dialogue-context-sq69-revalidation-20261110.md`,
  `dialogue-context-u03-revalidation-20261110.md`,
  `dialogue-context-ffq17-revalidation-20261110.md`,
  `dialogue-context-tr03-revalidation-20261110.md`,
  `dialogue-context-mq05-revalidation-20261110.md`,
  `dialogue-context-sq54-revalidation-20261110.md`,
  `dialogue-context-mq09-revalidation-20261110.md`,
  `dialogue-context-mq14-revalidation-20261110.md`,
  `dialogue-context-sq59-revalidation-20261110.md`,
  `dialogue-context-sq53-revalidation-20261110.md`,
  `dialogue-context-sq58-revalidation-20261110.md`,
  `dialogue-context-sq55-revalidation-20261110.md`,
  `dialogue-context-mq01-revalidation-20261110.md`, and
  `squire-brio-dialogue-voice-review-20261110.md` retain the full evidence,
  explanations, and proposed Korean text.

## Index Semantics

`default-quest-asset-index.tsv` is generated from the English 8-byte key table
and the read-only extracted `*.quest_bxml` corpus:

```sh
python3 work/zh_cn/audit/build_dialogue_context_index.py
python3 work/zh_cn/audit/build_dialogue_context_index.py --check
python3 work/zh_cn/audit/build_dialogue_context_index.py --check-review-ledger
```

`--check` verifies the reverse index and both generated catalogs. The
asset-catalog counts distinguish full ledger coverage, partial coverage, no
ledger coverage, and assets with no matching `default` IDs. A `reviewed` ID
means a four-language review record exists; it does not mean every question
was resolved or approved for editing.

`quest_ids`, `npc_symbols`, and `dialog_handler_count` describe the containing
asset, not an individual localization row. An exact key match proves only
that the key occurs in that asset. It does not prove dialogue status, speaker,
callback mapping, branch, addressee, or playback order. These remain
`not_mapped_to_key` or `unknown` unless separate evidence establishes them.
The current `QUEST_ID` extractor accepts uppercase values only. The lowercase
BXML values `ao_sq_re_005` (`2603901.quest_bxml`) and `ao_sq_ch_006`
(`2605200.quest_bxml`) are therefore documented from the read-only assets in
their review reports but are not represented in the generated quest-ID
catalog.
The scan is not a complete BXML parser and does not modify extracted assets.
If a serialized handler prefix or runtime-variable name contains a different
quest ID than the asset's explicit `QUEST_ID`, record both in the linked
review report; do not silently replace the explicit quest ID or infer a
key-to-handler mapping from the prefix.

The review ledger is curated. Use `not_flagged`, `candidate`, `uncertain`, or
`n/a` for each review dimension; `overall` is `not-issue`, `candidate`, or
`uncertain`. The validation command checks IDs, duplicate rows, dimension
statuses, and four-language fingerprints. Update the fingerprint only after
rechecking a changed source row. Do not convert a candidate into an approved
edit in the ledger. The Editor applies only accepted findings through the
project's guarded CSV editing workflow. Keep source text and long rationale in
the linked review record rather than duplicating entire translations in the
index.

## Current Seed

The seeded review groups are Squire Brio, `TR06` / Grim Onwig, `TR01` /
Grim's rescue quest, `FFQ80` / Bera Grastar, `SQ87` / Adessa Prison letter,
`FFQ64` / Agraivin Hand, `FFQ67` / Vulgar Donnoh, `FFQ116` / Kreger the
Devout, `SQ126` / Gwenna Hand, `FFQ35` / Menri Togh, `SQ79` / Terenia,
`SQ102` / Aluck's quest, `SQ93` / the Font and Sacred Pools quest, `SQ100` /
Esha's quest, `SQ108` / Decanus Paige's quest, and `SQ116` / Drewn Ansilla's
quest, `SQ117` / Malthon's quest, `SQ118` / Zanvil Whit's quest, and
`FFQ60` / Brit Codgan's quest, `FFQ66` / Harriset Donnel's quest,
`SQ80` / Gorem Kane's quest, `FFQ71` / Knave of Pride quest,
`SQ140` / Colm and Giran Alba, `SQ143` / Galette treasure,
`SQ131` / Bronwen Senn arena, `SQ145` / Lila Janick, and
`SQ68` / Liordran-associated war context, `TRSQ01` / Star Camp initiation,
`TRSQ02` / Moon Camp and Maire Ganan, `SQ150` / Lina Ardeen,
`SASQ01` / Idris Theonen, `SASQ02` / Telemachus Rasp, and
`SASQ03` / Jorum Quintus, `M0_SQ06` / Ratofer's sale quest,
`SQ01` / Ainmhi, `SQ02` / Kells Cafferty, `HM01` / the House of Ballads
contest, `KV03` / Ost Ordura, `KV07` / Gwyn Anwy, and `KVSQ02` / Khamazandu's
gift quest, `HP02` / Erion Raff's staff quest, `FFQ26` / Ruin Imas's
Culminite quest, `FFQ03` / Murdoc Hain's fire-potion quest, and
`SQ15` / Enconeg Holn's Ettinmere quest, `SQ69` / Captain Keloran's Shadow
Pass campaign, `U03` / the Coilsbain Cavern quest associated with Thaddeus
Holn's asset, `FFQ17` / Elrod Edman's refugee-spy quest, and `TR03` / the
Master's Pick quest associated with Eloren Criet's asset, and `MQ05` /
Glianal's main quest asset, `SQ54` / the Family Rivalry quest for Steg
Darkvari and Hrindi Zungar, `MQ09` / General Tilera's quest, `MQ14` / the
Dannestar Island quest associated with Cydan's asset, `SQ59` / Feride Ouet's
research quest, `SQ53` / Aetill Algar's Skoria mine quest, `SQ58` / Parwen
Well's quest, `SQ55` / Aergase's quest, and `MQ01` / Encel's main quest asset.
All 56 priority assets now have a linked review report and ledger coverage.
In
`616680.quest_bxml`, the index extracts
`QUEST_ID ACTOR` while serialized handlers and identifiers use the `U03`
prefix; the linked report records both without treating them as a confirmed
per-key mapping. Each quest asset's NPC symbol and dialogue handlers are
asset-level evidence; localization keys are not mapped to individual
handlers. Rows are separately classified as dialogue, player choice, or
quest/UI text where supported by content. Specific speaker-at-key mapping and
playback order remain unknown unless the linked review record says otherwise.

The asset and ID catalogs extend coverage accounting beyond that 56-asset
priority filter. At the latest November 11 checkpoint, the catalogs enumerate
530 assets and all 65,135 IDs; 51,080 IDs match at least one of 426 quest
assets. The full-corpus re-review ledger contains 31,068 IDs (47.70% of the
65,135 `default` IDs), leaving 34,067 IDs unreviewed. Of the recorded IDs,
26,964 have an indexed asset link and 4,104 have none. Asset-link counts can include
the same ID in multiple assets and are not disjoint ID totals. Of 426 assets
with linked IDs, 285 have complete ledger coverage and 141 have partial
coverage; another 104 assets have no matched `default` key. Asset membership
does not imply that every matched row is dialogue. Step 4 remains in progress.

Sequential full-corpus re-review now reaches ID `18999`. The latest
`18750`-`18999` batch checked 69 existing records and added 181 new records.
Ten existing candidates were retained, one candidate was reclassified as an
evidence-limited hold, one existing row was reclassified as a format
candidate, one existing hold was retained, four new candidates and three new
holds were recorded. The current report documents two Japanese-supported
translation differences in exact-English duplicate groups. Earlier ranges
`8500`-`17499` compare 9,500 IDs, checking 2,352 existing records and adding
6,648 previously unrecorded records.
The newest `14000`-`14249` batch adds 180 IDs, with eight correction
candidates added or reopened and two evidence-limited holds added or reopened.
Seventy existing records were fingerprint-verified; the already-applied
correction at `14146` was cleared from the candidate status. The preceding
`13750`-`13999` batch added 183 IDs, with four correction candidates and six
evidence-limited findings.
The newest `14250`-`14499` batch adds 183 IDs and records nine new correction
candidates and 13 evidence-limited holds; two existing ledger records were
reclassified as candidates. Forty exact-English duplicate groups (601 rows)
were checked, and all logical line-break and runtime/layout-token signatures
match across the four languages.
The newest `14750`-`14999` batch adds 176 IDs, records eight correction
candidates and one evidence-limited hold, and reopens two existing
`not-issue` records. Its 64 exact-English duplicate groups (1,042 rows) match
in Korean; line-break and runtime/layout-token signatures match across all
four languages.
The `15000`-`15049` batch checked 15 existing fingerprints and added 35
records, with two correction candidates and three evidence-limited holds.
The `15050`-`15099` batch checked 16 existing fingerprints and added 34
records, with seven correction candidates and six evidence-limited holds;
`15055` was cleared because the active Korean already reflects the supported
correction. Across both batches, all 100 IDs were compared in four languages,
including line breaks and runtime/layout markers.
The `15100`-`15249` batch checked 41 existing fingerprints and added 109
records, with four correction candidates and three evidence-limited holds.
Existing ID `15190` was reclassified in place as a naturalness candidate.
Thirty-four exact-English duplicate groups (593 corpus rows) match in Korean;
13 groups have Japanese or Chinese source-local differences. Line breaks
match across all four languages; the Chinese marker order differs at `15164`,
while Korean matches English and Japanese.
The `15250`-`15499` batch checked 63 existing fingerprints and added 187
records, with four new correction candidates and four evidence-limited holds.
Existing candidate `15326` remains documented in its asset-context report.
The `15500`-`15749` batch checked 59 existing fingerprints and added 191
records. It recorded seven new correction candidates, reclassified existing
ID `15577` in place as a format candidate, carried forward the card-name
consistency candidate at `15632`, and added one evidence-limited hold.
Sixty-three exact-English duplicate groups (1,400 corpus rows) match in
Korean; the 26 existing Korean embedded CRLF breaks were preserved.
The latest `15750`-`15999` batch checked 56 existing fingerprints and added
194 records, with two correction candidates and 17 evidence-limited holds.
Existing IDs `15794`, `15846`, and `15902` were reclassified in place.
Fifty-six exact-English duplicate groups (641 corpus rows) were checked; one
Korean difference is supported by ID-specific FFQ03 context. Line breaks and
runtime/layout-token signatures match across all four languages, and 25
existing embedded CRLF breaks were preserved. No translation CSV changed.
The `16000`-`16249` batch checked 57 existing fingerprints and added 193
records, retaining five candidates and recording seven evidence-limited holds.
All 51 exact-English duplicate groups (360 corpus rows) match in Korean.
The latest `16250`-`16499` batch checked 70 existing fingerprints and added
180 records, with seven new candidates and twelve evidence-limited holds. All
65 exact-English duplicate groups (1,301 corpus rows) match in Korean;
logical line breaks and runtime/layout-marker signatures match across the four
languages, and 27 existing Korean embedded CRLF breaks were preserved. This
pass also reconciles the conflicting `Fastings` proposals at `16478` in favor
of the established `패스팅(Fastings)` term. No translation CSV changed.
The preceding `16500`-`16749` batch checked 66 existing fingerprints and added
184 records, with five new correction candidates, one existing candidate
reclassification, ten new evidence-limited holds, and three existing rows
reclassified as holds. All 56 exact-English duplicate groups (1,049 corpus
rows) match in Korean; line-break and runtime/layout-marker signatures match
across the four languages, and 20 existing Korean embedded CRLF breaks were
preserved. No translation CSV changed.
The `16750`-`16999` batch checked 60 existing fingerprints and added 190
records, with seven new correction candidates and six evidence-limited holds.
Fifty exact-English duplicate groups (771 corpus rows) were checked; one
Korean difference is supported by Japanese context. Runtime/layout tokens
match across all four languages, with one Japanese-only line-break difference
in the Carver poem; 42 existing Korean embedded CRLF breaks were preserved.
The `17000`-`17249` batch checked 69 existing fingerprints and added 181
records, with six new correction-candidate findings and two evidence-limited
holds. Its sole exact-English duplicate group (`Quest Complete`, IDs
`17170`, `17178`, `17228`) matches in Korean, and logical line-break
signatures match across all four languages. A separate Amphora follow-up
rechecked 13 changed fingerprints, retaining existing dispositions. No
translation CSV changed.
The `17250`-`17499` batch checked 65 existing fingerprints and added 185
records, with five new correction candidates and ten new evidence-limited
holds. Two existing rows were reclassified as candidates and five as holds;
five prior candidates and two holds were retained. Three exact-English
duplicate groups match in Korean, and line-break/markup signatures were
checked across all four languages. No translation CSV changed.
Across the batches, speakers are identified only where supported by direct
evidence, and no playback order is inferred. No translation CSV was changed.
The latest report is
[`dialogue-context-default-17250-17499-revalidation-20261111.md`](dialogue-context-default-17250-17499-revalidation-20261111.md).
At that earlier checkpoint the next sequential range was `17500`-`17749`.
The current next range is `21500`-`21749`.
Reports:
[`8500`-`8749`](dialogue-context-default-08500-08749-revalidation-20261111.md),
[`8750`-`8999`](dialogue-context-default-08750-08999-revalidation-20261111.md),
[`9000`-`9249`](dialogue-context-default-09000-09249-revalidation-20261111.md),
[`9250`-`9499`](dialogue-context-default-09250-09499-revalidation-20261111.md),
[`9500`-`9749`](dialogue-context-default-09500-09749-revalidation-20261111.md),
[`9750`-`9999`](dialogue-context-default-09750-09999-revalidation-20261111.md),
[`10000`-`10249`](dialogue-context-default-10000-10249-revalidation-20261111.md),
[`10250`-`10499`](dialogue-context-default-10250-10499-revalidation-20261111.md),
[`10500`-`10749`](dialogue-context-default-10500-10749-revalidation-20261111.md),
[`10750`-`10999`](dialogue-context-default-10750-10999-revalidation-20261111.md),
[`11000`-`11249`](dialogue-context-default-11000-11249-revalidation-20261111.md),
[`11250`-`11499`](dialogue-context-default-11250-11499-revalidation-20261111.md),
[`11500`-`11749`](dialogue-context-default-11500-11749-revalidation-20261111.md),
[`11750`-`11999`](dialogue-context-default-11750-11999-revalidation-20261111.md),
[`12000`-`12249`](dialogue-context-default-12000-12249-revalidation-20261111.md),
[`12250`-`12499`](dialogue-context-default-12250-12499-revalidation-20261111.md),
[`12500`-`12749`](dialogue-context-default-12500-12749-revalidation-20261111.md),
[`12750`-`12999`](dialogue-context-default-12750-12999-revalidation-20261111.md),
[`13000`-`13249`](dialogue-context-default-13000-13249-revalidation-20261111.md),
[`13250`-`13499`](dialogue-context-default-13250-13499-revalidation-20261111.md),
[`13500`-`13749`](dialogue-context-default-13500-13749-revalidation-20261111.md),
[`13750`-`13999`](dialogue-context-default-13750-13999-revalidation-20261111.md),
[`14000`-`14249`](dialogue-context-default-14000-14249-revalidation-20261111.md),
[`14250`-`14499`](dialogue-context-default-14250-14499-revalidation-20261111.md),
[`14500`-`14749`](dialogue-context-default-14500-14749-revalidation-20261111.md),
[`14750`-`14999`](dialogue-context-default-14750-14999-revalidation-20261111.md),
[`15000`-`15049`](dialogue-context-default-15000-15049-revalidation-20261111.md),
[`15050`-`15099`](dialogue-context-default-15050-15099-revalidation-20261111.md),
[`15100`-`15249`](dialogue-context-default-15100-15249-revalidation-20261111.md),
[`15250`-`15499`](dialogue-context-default-15250-15499-revalidation-20261111.md),
[`15500`-`15749`](dialogue-context-default-15500-15749-revalidation-20261111.md),
[`15750`-`15999`](dialogue-context-default-15750-15999-revalidation-20261111.md),
[`16000`-`16249`](dialogue-context-default-16000-16249-revalidation-20261111.md),
[`16250`-`16499`](dialogue-context-default-16250-16499-revalidation-20261111.md), and
[`16500`-`16749`](dialogue-context-default-16500-16749-revalidation-20261111.md).

The preceding sequential full-corpus batch reviewed IDs `8250`-`8499`, adding 170
previously unrecorded rows; the other 80 IDs already had current ledger
entries. It recorded five correction candidates and one evidence-limited
hold. Forty-one exact-English duplicate groups touch the range (1,017 rows
across the corpus), and all groups have matching Korean translations.
Logical line-break counts and runtime/layout-token identities matched across
the four languages. Four Korean strings contain 13 existing CRLF embedded
breaks. Of the new IDs, 114 have indexed quest-asset links and 56 do not. No
translation CSV was changed. See
[`dialogue-context-default-08250-08499-revalidation-20261111.md`](dialogue-context-default-08250-08499-revalidation-20261111.md).

The preceding sequential full-corpus batch reviewed IDs `8000`-`8249`, adding
179 previously unrecorded rows; the other 71 IDs already had current ledger
entries. It recorded eight correction candidates and three evidence-limited
holds. Sixty-five exact-English duplicate groups touch the range (1,547 rows
across the corpus), and all groups have matching Korean translations.
Logical line-break counts and runtime/layout-token identities matched across
the four languages; placeholder positions vary as expected at `8077` and
`8127`. Six Korean strings contain 21 existing CRLF embedded breaks. Of the
new IDs, 127 have indexed quest-asset links and 52 do not. No translation CSV
was changed. See
[`dialogue-context-default-08000-08249-revalidation-20261111.md`](dialogue-context-default-08000-08249-revalidation-20261111.md).

The preceding sequential full-corpus batch reviewed IDs `7750`-`7999`,
adding 187 previously unrecorded rows; the other 63 IDs already had current
ledger entries. It recorded five correction candidates and four
evidence-limited holds. Forty-one exact-English duplicate groups touch the
range (666 rows across the corpus), and all groups have matching Korean
translations. Logical line-break counts and runtime-variable/layout-wrapper
signatures matched across the four languages; localized ability names inside
the wrappers at `7807` vary as expected. Two Korean strings contain 13
existing CRLF embedded breaks. No translation CSV was changed. See
[`dialogue-context-default-07750-07999-revalidation-20261111.md`](dialogue-context-default-07750-07999-revalidation-20261111.md).

The preceding sequential full-corpus batch reviewed IDs `7500`-`7749`, adding
181 previously unrecorded rows; the other 69 IDs already had current ledger
entries. It recorded twelve correction candidates and three evidence-limited
holds. Fifty-six exact-English duplicate groups touch the range (791 rows
across the corpus), and all groups have matching Korean translations.
Line-break counts and runtime-variable/layout-wrapper structure matched
across the four languages; the localized label inside the display wrapper at
`7582` varies as expected. Five Korean strings contain 12 existing CRLF
embedded breaks. No translation CSV was changed. See
[`dialogue-context-default-07500-07749-revalidation-20261111.md`](dialogue-context-default-07500-07749-revalidation-20261111.md).

The preceding sequential full-corpus batch reviewed IDs `7250`-`7499`,
adding 181 previously unrecorded rows; the other 69 IDs already had current
ledger entries. It recorded six correction candidates and five
evidence-limited dimensions, with one ID in both groups. Sixty-eight
exact-English duplicate groups touch the range (1,531 rows across the
corpus); one group's Korean translations differ at `7332` and `11660`, with
the latter already recorded as a candidate in its asset review.
Runtime-variable and layout-control wrappers and their order matched.
ID `7257` has three logical line breaks in English, Chinese, and Korean but
two in Japanese. Three Korean strings contain 12 existing CRLF embedded
breaks. No translation CSV was changed. See
[`dialogue-context-default-07250-07499-revalidation-20261111.md`](dialogue-context-default-07250-07499-revalidation-20261111.md).

The preceding sequential full-corpus batch reviewed IDs `7000`-`7249`, adding
187 previously unrecorded rows; the other 63 IDs already had current ledger
entries. It recorded nineteen correction candidates, including three
evidence-limited dimensions. Fifty-nine exact-English duplicate groups
touching the range (1,383 rows across the corpus) matched in Korean.
Runtime-variable and layout-control wrappers and their order matched, as did
logical line-break counts. Six Korean strings contain 30 existing CRLF
embedded breaks where the other locales use LF. No translation CSV was
changed. See
[`dialogue-context-default-07000-07249-revalidation-20261111.md`](dialogue-context-default-07000-07249-revalidation-20261111.md).

The preceding sequential full-corpus batch reviewed IDs `6750`-`6999`, adding
179 previously unrecorded rows; the other 71 IDs already had current ledger
entries. It recorded nineteen new correction candidates and three new
evidence-limited holds. Fifty-seven exact-English duplicate groups touching
the range (1,214 rows across the corpus) matched in Korean. Runtime-variable,
layout-control, and logical line-break signatures matched. Two Korean
strings contain three existing CRLF embedded breaks where the other locales
use LF. No translation CSV was changed. See
[`dialogue-context-default-06750-06999-revalidation-20261111.md`](dialogue-context-default-06750-06999-revalidation-20261111.md).

The preceding sequential full-corpus batch reviewed IDs `6500`-`6749`, adding
183 previously unrecorded rows; the other 67 IDs already had ledger entries.
It recorded sixteen correction candidates and three evidence-limited holds.
Thirty-four exact-English duplicate groups touching the range (690 rows
across the corpus) matched in Korean. Logical line-break counts matched.
Two Japanese/Chinese marker-order differences occur at `6562` and `6583`;
Korean matches English at `6562` and English/Chinese at `6583`. Seven Korean
strings contain 29 existing CRLF embedded breaks where the other locales use
LF. No translation CSV was changed. See
[`dialogue-context-default-06500-06749-revalidation-20261111.md`](dialogue-context-default-06500-06749-revalidation-20261111.md).

The preceding sequential full-corpus batch reviewed IDs `6250`-`6499`,
adding 184 previously unrecorded rows; the other 66 IDs already had ledger
entries. It recorded five correction candidates and one evidence-limited
hold. Fifty-two exact-English duplicate groups touching the range (853 rows
across the corpus) matched in Korean. Runtime-variable, layout-control, and
logical line-break signatures matched. Two Korean strings contain 11 existing
CRLF embedded breaks where the other locales use LF. No translation CSV was
changed. See
[`dialogue-context-default-06250-06499-revalidation-20261111.md`](dialogue-context-default-06250-06499-revalidation-20261111.md).

The preceding sequential full-corpus batch reviewed IDs `6000`-`6249`,
adding 186 previously unrecorded rows; the other 64 IDs already had ledger
entries. It recorded five correction candidates and four evidence-limited
holds. Fifty-six exact-English duplicate groups touching the range (933 rows
across the corpus) matched in Korean. Runtime-variable and layout-control
signatures matched; ID `6032` is the only logical line-break-count
difference. Five Korean strings contain 22 existing CRLF embedded breaks
where the other locales use LF. No translation CSV was changed. See
[`dialogue-context-default-06000-06249-revalidation-20261111.md`](dialogue-context-default-06000-06249-revalidation-20261111.md).
The preceding sequential full-corpus batch reviewed IDs `5500`-`5749`,
adding 181 previously unrecorded rows; the other 69 IDs already had ledger
entries. It recorded four correction candidates and two evidence-limited
holds. Forty-five exact-English duplicate groups touching the range
(923 rows) matched in Korean. Logical line-break counts and
runtime/layout-token signatures match across all four languages; four Korean
strings contain 22 CRLF embedded breaks where the other locales use LF.
No translation CSV was changed. See
[`dialogue-context-default-05500-05749-revalidation-20261111.md`](dialogue-context-default-05500-05749-revalidation-20261111.md).
The preceding sequential full-corpus batch reviewed IDs `5250`-`5499`,
adding 185 previously unrecorded rows; the other 65 IDs already had ledger
entries. It recorded three correction candidates and seven
evidence-limited holds. Forty-nine exact-English duplicate groups touching
the range (588 rows) matched in Korean. Logical line-break counts and
runtime/layout-token signatures match across all four languages; five Korean
strings contain 20 CRLF embedded breaks where the other locales use LF.
No translation CSV was changed. See
[`dialogue-context-default-05250-05499-revalidation-20261111.md`](dialogue-context-default-05250-05499-revalidation-20261111.md).
The preceding sequential full-corpus batch reviewed IDs `5000`-`5249`,
adding 192 previously unrecorded rows; the other 58 IDs already had ledger
entries. It recorded ten correction-candidate IDs and 23
evidence-limited holds, with three IDs appearing in both categories.
Thirty-two exact-English duplicate groups touching the range (508 rows)
matched in Korean. Line-break counts match except at ID `5204`, where Chinese
has one fewer break. Eight Korean embedded breaks use CRLF while the other
locales use LF, and ID `5243` has a Chinese marker-order difference. No
translation CSV was changed. At that checkpoint, the next range was
`6000`-`6249`. See
[`dialogue-context-default-05000-05249-revalidation-20261111.md`](dialogue-context-default-05000-05249-revalidation-20261111.md).
The preceding sequential full-corpus batch reviewed IDs `4750`-`4999`,
adding 198 previously unrecorded rows; the other 52 IDs already had ledger
entries. It recorded eight correction-candidate IDs and 15 evidence-limited
holds, with two IDs appearing in both categories. Forty-four exact-English
duplicate groups touching the range (893 rows) matched in Korean. Logical
line-break counts match except at ID `4819`, where Japanese has additional
paragraph breaks. Nine Korean embedded breaks use CRLF while the other
locales use LF; these byte-level differences remain on hold. No translation
CSV was changed. See
[`dialogue-context-default-04750-04999-revalidation-20261111.md`](dialogue-context-default-04750-04999-revalidation-20261111.md).
The preceding range `4500`-`4749` added 176 IDs, with one candidate and four
format holds; see
[`dialogue-context-default-04500-04749-revalidation-20261111.md`](dialogue-context-default-04500-04749-revalidation-20261111.md).
The preceding sequential full-corpus batch reviewed
IDs `4000`-`4249`, adding 183 previously unrecorded rows; the other 67 IDs
already had ledger entries. It recorded one correction candidate and one
evidence-limited hold. Fifty-four exact-English duplicate groups touching
the range (911 rows) matched in Korean, and embedded line-break counts match
across the four languages. Runtime and layout markers were retained; the
Chinese `{LINE_LEFT}` variation at ID `4171` differs from the English,
Japanese, and Korean `{LINE_INDENT}`. See
[`dialogue-context-default-04000-04249-revalidation-20261111.md`](dialogue-context-default-04000-04249-revalidation-20261111.md).
The preceding sequential range `3750`-`3999` added 170 rows with seven
candidates and one hold; ID `3770` has a localized-marker content candidate
with its wrapper preserved. See
[`dialogue-context-default-03750-03999-revalidation-20261111.md`](dialogue-context-default-03750-03999-revalidation-20261111.md).
The preceding sequential range `3500`-`3749` added 188 rows with six
candidates and nine holds; ID `3592` has a held line-break discrepancy
because the four references use different segmentation. See
[`dialogue-context-default-03500-03749-revalidation-20261111.md`](dialogue-context-default-03500-03749-revalidation-20261111.md).
The preceding sequential range `3250`-`3499` added 196 rows with seven
candidates and seven holds; the Korean line-break discrepancy at ID `3330`
remains documented in
[`dialogue-context-default-03250-03499-revalidation-20261111.md`](dialogue-context-default-03250-03499-revalidation-20261111.md).
The preceding range
[`3000`-`3249`](dialogue-context-default-03000-03249-revalidation-20261111.md)
added 179 rows, 16 candidates, and one hold.
The preceding range `2750`-`2999` added 183 IDs, seven candidates, and five
holds; see
[`dialogue-context-default-02750-02999-revalidation-20261111.md`](dialogue-context-default-02750-02999-revalidation-20261111.md).
The preceding range `2500`-`2749` added 195 IDs, 13 candidates, and five
holds; see
[`dialogue-context-default-02500-02749-revalidation-20261111.md`](dialogue-context-default-02500-02749-revalidation-20261111.md).
The preceding `2250`-`2499` range added 178 IDs, six candidates, and four
holds; its line-break discrepancy at ID `2372` is documented in
[`dialogue-context-default-02250-02499-revalidation-20261111.md`](dialogue-context-default-02250-02499-revalidation-20261111.md).
The preceding batch reviewed IDs `2000`-`2249`, adding 184 previously
unrecorded rows, with seven candidates and two evidence-limited holds.
See
[`dialogue-context-default-02000-02249-revalidation-20261111.md`](dialogue-context-default-02000-02249-revalidation-20261111.md).
The preceding range `1750`-`1999` added 187 rows, ten candidates, and one
hold; see
[`dialogue-context-default-01750-01999-revalidation-20261111.md`](dialogue-context-default-01750-01999-revalidation-20261111.md).
The preceding range `1500`-`1749` added 187 rows, 15 candidates, and three
holds; see
[`dialogue-context-default-01500-01749-revalidation-20261111.md`](dialogue-context-default-01500-01749-revalidation-20261111.md).
The preceding range `1250`-`1499` added 180 rows, 16 candidates, and three
holds; see
[`dialogue-context-default-01250-01499-revalidation-20261111.md`](dialogue-context-default-01250-01499-revalidation-20261111.md).
The preceding range `1000`-`1249` added 184 rows, ten candidates, and seven
holds; see
[`dialogue-context-default-01000-01249-revalidation-20261111.md`](dialogue-context-default-01000-01249-revalidation-20261111.md).
The preceding batch is
[`dialogue-context-default-00750-00999-revalidation-20261111.md`](dialogue-context-default-00750-00999-revalidation-20261111.md).
Earlier ranges `500`-`749` and `250`-`499` added 196 and 185 IDs,
respectively; see
[`dialogue-context-default-00500-00749-revalidation-20261111.md`](dialogue-context-default-00500-00749-revalidation-20261111.md)
and
[`dialogue-context-default-00250-00499-revalidation-20261111.md`](dialogue-context-default-00250-00499-revalidation-20261111.md).
Supplemental IDs are `1691`, `18005`, `31283`, and `47041`. The last's
`no_quest_asset_match` sentinel is not a filename or an indexed asset link;
coverage uses actual reverse-index membership, not a nonempty field.
The catalog extractor now recognizes
both `NPC_...` and
`DLC#_NPC_...` symbols; the latter form was found in 30 assets. These remain
asset-level clues, not per-key speaker assignments.

The preceding asset-group continuation records all 103 IDs in
`1382473.quest_bxml`, with 14 correction candidates and four holds.

The preceding continuation recorded all 102 IDs in `576353.quest_bxml`,
with 23 correction candidates and three holds.

The preceding continuation recorded all 102 IDs in `2026652.quest_bxml`,
with seven correction candidates and three holds (one overlap).

The preceding continuation recorded all 101 IDs in `1262645.quest_bxml`,
with ten correction candidates and eight holds (one overlap).

The preceding continuation recorded all 100 IDs in `507502.quest_bxml`,
with 19 correction candidates and three holds (one overlap).

The preceding continuation recorded all 292 IDs across `521918.quest_bxml`,
`611613.quest_bxml`, and `731979.quest_bxml`, with 47 correction candidates
and 11 IDs with unresolved findings (five overlap). No translation CSV was
changed.

The preceding continuation recorded all 380 IDs across `1695875.quest_bxml`,
`529073.quest_bxml`, `1458189.quest_bxml`, and `501490.quest_bxml`, with
42 correction-candidate IDs and 29 IDs with unresolved findings (four
overlap). No translation CSV was changed.

An earlier review covers all 86 IDs in `440729.quest_bxml`, adding them to the
ledger. It records 13 correction-candidate IDs and 12 evidence-limited holds,
with six IDs in both groups. Its `SQ04` handler prefix is only a quest clue;
there is no explicit quest ID or NPC symbol, and no per-key speaker or
dialogue order was inferred. Two exact-English duplicate groups matched in
Korean, and four-language format signatures passed. No translation CSV was
changed. See
[`dialogue-context-440729-sq04-flowering-revalidation-20261111.md`](dialogue-context-440729-sq04-flowering-revalidation-20261111.md).

The preceding review covers all 86 IDs in `747925.quest_bxml` (`FFQ24`), adding
them to the ledger and recording 16 correction candidates. Four exact-English
duplicate groups matched in Korean, and four-language format signatures
passed. Its six NPC symbols and 42 handlers do not establish per-key speakers
or dialogue order. No translation CSV was changed. See
[`dialogue-context-747925-ffq24-death-notices-revalidation-20261111.md`](dialogue-context-747925-ffq24-death-notices-revalidation-20261111.md).

The preceding review covers all 171 IDs across `2009109.quest_bxml`
(`DLC1_PH05b`) and `439722.quest_bxml` (`SQ08`), adding all 171 to the
ledger. The first asset has four correction candidates; the second has 28
candidate IDs and two evidence-limited holds, with ID `44477` in both groups.
The lowercase `b` in `DLC1_PH05b` is not captured by the catalog's
uppercase-only quest-ID extractor, so the explicit BXML value is preserved in
the report. The assets' NPC symbols and handlers do not establish per-key
speakers or playback order. Exact-English duplicate groups and four-language
format signatures passed. No translation CSV was changed. See
[`dialogue-context-2009109-dlc1-ph05b-gravehal-paintings-revalidation-20261111.md`](dialogue-context-2009109-dlc1-ph05b-gravehal-paintings-revalidation-20261111.md)
and
[`dialogue-context-439722-sq08-headsman-revalidation-20261111.md`](dialogue-context-439722-sq08-headsman-revalidation-20261111.md).

The preceding review covers all 83 IDs in `571972.quest_bxml` (`HV03`). Four
correction candidates and one evidence-limited hold were recorded. Its seven
NPC symbols and 48 dialogue handlers do not map individual speakers or
playback order. Ten exact-English duplicate groups had identical Korean, and
four-language format signatures matched. No translation CSV was changed. See
[`dialogue-context-571972-hv03-house-of-valor-revalidation-20261111.md`](dialogue-context-571972-hv03-house-of-valor-revalidation-20261111.md).

The preceding review covers all 83 IDs in `525551.quest_bxml` (`SQ17`). Four
correction candidates and one evidence-limited hold were recorded. The two
NPC symbols and 40 dialogue handlers establish only asset-level context; they
do not map individual keys to speakers or playback order. Six exact-English
duplicate pairs have identical Korean, and all four-language format
signatures match. No translation CSV was changed. See
[`dialogue-context-525551-sq17-canneroc-webwood-revalidation-20261111.md`](dialogue-context-525551-sq17-canneroc-webwood-revalidation-20261111.md).

The latest revalidation covers all 78 IDs linked to `600351.quest_bxml`. One
line-level register candidate was recorded at ID `44618`; its `FP02` handler
prefix and shared House of Sorrows topic do not establish the speaker or
dialogue position. The two exact-English duplicates have matching Korean,
and four-language format signatures match across all IDs. No translation CSV
was changed. See
[`dialogue-context-600351-revalidation-20261111.md`](dialogue-context-600351-revalidation-20261111.md).

The preceding revalidation covers all 421 IDs across
`1991492.quest_bxml`, `1993117.quest_bxml`, `1993119.quest_bxml`,
`1993121.quest_bxml`, and `1993123.quest_bxml`. It records 31 correction
candidates and one evidence-limited hold. Forty-five exact-English duplicate
groups covering 167 rows have matching Korean; format signatures match across
all four languages. The `DLC1_PH02a` through `DLC1_PH06a` handler prefixes
and the fifth asset's explicit `DLC1_MQ03` identifier remain asset-level
clues only; no per-key speaker or dialogue order was inferred. No translation
CSV was changed. See
[`dialogue-context-five-gravehal-restoration-assets-revalidation-20261111.md`](dialogue-context-five-gravehal-restoration-assets-revalidation-20261111.md).

The preceding revalidation covers all 385 IDs across
`1944003.quest_bxml`, `1646483.quest_bxml`, `2023654.quest_bxml`,
`590984.quest_bxml`, and `589931.quest_bxml`. Six correction candidates and
three evidence-limited holds were recorded. Handler prefixes support topic
grouping only; no individual speaker or dialogue order was inferred. Twenty
exact-English duplicate groups covering 54 rows have matching Korean, and
line-break/token/markup checks passed for all 385 IDs. No translation CSV or
extracted asset was changed. See
[`dialogue-context-next-five-unrecorded-assets-revalidation-20261111.md`](dialogue-context-next-five-unrecorded-assets-revalidation-20261111.md).

The preceding revalidation covers all 213 IDs across
`1310318.quest_bxml`, `1320107.quest_bxml`, and `1335981.quest_bxml`. Seven
correction candidates and one evidence-limited speech-level hold were
recorded. The `SQ91`, `SQ95`, and `SQ109` handler prefixes support topic
grouping only; no individual speaker or dialogue order was inferred.
Seventeen exact-English duplicate groups have no Korean divergence, and
line-break/token/markup checks passed for all rows. The ledger contains current
four-language fingerprints; no translation CSV or extracted asset was
changed. See
[`dialogue-context-three-quest-assets-sq91-sq95-sq109-revalidation-20261111.md`](dialogue-context-three-quest-assets-sq91-sq95-sq109-revalidation-20261111.md).

The latest pass revalidated 207 IDs across `1364459.quest_bxml`,
`1961287.quest_bxml`, and `482304.quest_bxml` (`MQ17`). Eleven
correction-candidate IDs and one evidence-limited speech-level hold were
recorded. The three assets contain 23 exact-English duplicate groups without
Korean divergence, and all 207 IDs pass line-break/token/markup checks.
Twenty-one clear crime action labels are classified as player-choice text.
No per-key speakers or playback order were inferred. The ledger rows include
current four-language fingerprints; no translation CSV or extracted asset
was changed. See
[`dialogue-context-next-three-smallest-assets-revalidation-20261111.md`](dialogue-context-next-three-smallest-assets-revalidation-20261111.md).

The preceding pass revalidated all 66 IDs in `744464.quest_bxml` (`SQ96`). Four
correction-candidate IDs and one evidence-limited speech-level hold were
recorded. Explicit self-identifications support assigning Vincent Helvern to
three rows and Bor Anjar to one; 14 unambiguous first-person lines are
classified as player choices. The asset does not map the remaining keys to
speakers or establish branch placement or playback order. The ledger rows
include current four-language fingerprints; no translation CSV or extracted
asset was changed. See
[`dialogue-context-744464-sq96-motus-mining-revalidation-20261111.md`](dialogue-context-744464-sq96-motus-mining-revalidation-20261111.md).

The preceding pass revalidated all 309 IDs across five previously unrecorded
assets: `345823.quest_bxml`, `1352899.quest_bxml`, `1568843.quest_bxml`,
`1965163.quest_bxml`, and `557095.quest_bxml`. It records 35
correction-candidate IDs and three evidence-limited speech-level holds, with
one overlap. The assets do not establish per-key speakers or playback order.
The ledger rows were added with four-language fingerprints; the translation
CSV and extracted assets were not changed. See
[`dialogue-context-next-five-smallest-assets-followup-revalidation-20261111.md`](dialogue-context-next-five-smallest-assets-followup-revalidation-20261111.md).

The preceding pass revalidated all 273 IDs across five previously unrecorded
assets: `1987402.quest_bxml`, `528652.quest_bxml`, `2601300.quest_bxml`,
`1759742.quest_bxml`, and `1577264.quest_bxml`. It recorded 37
correction-candidate IDs and seven evidence-limited speech-level holds,
without changing translation CSVs or extracted assets. Exact-English
duplicate translations and line-break/token/markup checks passed. Asset and
handler clues support conservative topic grouping only; they do not establish
per-key speakers or dialogue order. See
[`dialogue-context-next-five-assets-iddyla-turin-apotyre-ariad-eathe-revalidation-20261111.md`](dialogue-context-next-five-assets-iddyla-turin-apotyre-ariad-eathe-revalidation-20261111.md).
The preceding pass revalidated all 423 IDs across five previously unrecorded
assets: SQ47, SQ78, SQ97, SQ100, and SQ103. It recorded 13
correction-candidate IDs and six evidence-limited register holds, without
changing translation CSVs or extracted assets. See
[`dialogue-context-next-five-sq47-sq78-sq97-sq100-sq103-revalidation-20261111.md`](dialogue-context-next-five-sq47-sq78-sq97-sq100-sq103-revalidation-20261111.md).
The preceding expanded pass revalidated all 252 IDs across five assets:
SQ49, SQ86, SQ82, SQ112, and FFQ84. See
[`dialogue-context-next-five-expanded-assets-followup-revalidation-20261111.md`](dialogue-context-next-five-expanded-assets-followup-revalidation-20261111.md).

The preceding asset-level revalidation covers all 107 IDs linked to
`522638.quest_bxml` (`SQ16`). It records the Canneroc/Webwood quest involving
Garaner Vernt and Barten, six correction candidates, and five
evidence-limited holds. Its two NPC symbols, 45 handlers, and outcome-state
names do not establish per-key speakers or playback order. No translation
CSV was changed. See
[`dialogue-context-522638-sq16-canneroc-webwood-revalidation-20261111.md`](dialogue-context-522638-sq16-canneroc-webwood-revalidation-20261111.md).
The preceding asset-level revalidation covers all 47 IDs linked to
`522390.quest_bxml`. Its `SQ19` handler prefix and quest-target text support
an SQ19 / Sihtric Vorm / Rundamir-Crudok topic grouping, but there is no
explicit quest ID or NPC symbol and no per-key speaker or order mapping.
Nine correction candidates were recorded without changing the translation
CSV. See
[`dialogue-context-522390-sq19-sihtric-vorm-revalidation-20261111.md`](dialogue-context-522390-sq19-sihtric-vorm-revalidation-20261111.md).

An earlier priority quest-group pass revalidated all 67 IDs in
`1962515.quest_bxml` (`DLC1_SQ06`, asset-level NPC
`DLC1_NPC_GAL_VAR_AlderMalloi`); it records three correction candidates and
two evidence-limited holds without changing the translation CSV. The
single-NPC asset association does not establish per-key speaker or playback
order. See
[`dialogue-context-1962515-dlc1-sq06-revalidation-20261111.md`](dialogue-context-1962515-dlc1-sq06-revalidation-20261111.md).
The latest expanded asset pass revalidated all 369 IDs in
`1937439.quest_bxml` (`DLC1_MQ03`, asset-level NPC
`DLC1_NPC_GAL_DOK_Brattigan`, 184 serialized dialogue handlers). It recorded
seven correction candidates and four evidence-limited holds; no translation
CSV was changed. Per-key speakers and playback order remain unknown. See
[`dialogue-context-1937439-dlc1-mq03-brattigan-revalidation-20261111.md`](dialogue-context-1937439-dlc1-mq03-brattigan-revalidation-20261111.md).
The next completed `SQ59`-associated asset pass revalidated all 46 IDs in
`596269.quest_bxml`. The explicit quest ID and content support grouping it
with Feride's experiment, but the asset has no NPC symbol and its 15 dialogue
handlers do not establish per-key speakers or order. Five correction
candidates and one evidence-limited terminology hold were recorded; no
translation CSV was changed. See
[`dialogue-context-596269-sq59-feride-experiment-revalidation-20261111.md`](dialogue-context-596269-sq59-feride-experiment-revalidation-20261111.md).
The latest asset pass revalidated 47 IDs in `1944009.quest_bxml`. No explicit
`QUEST_ID` or NPC symbol is present; conditional handler names carry the
`DLC2_SQ07` prefix. Three correction candidates and four evidence-limited
holds were recorded without changing the translation CSV. The handler prefix
does not establish per-key speakers or order. See
[`dialogue-context-1944009-dlc2-sq07-evenroot-revalidation-20261111.md`](dialogue-context-1944009-dlc2-sq07-evenroot-revalidation-20261111.md).
An earlier pass revalidated all 132 IDs in `2012226.quest_bxml`
(`DLC1_MQ06`, Cillian Keen's beast-training context). It corrected two
inconsistent translations of “Bugs collected”; per-key speakers and playback
order remain unknown. See
[`dialogue-context-2012226-dlc1-mq06-cillian-revalidation-20261111.md`](dialogue-context-2012226-dlc1-mq06-cillian-revalidation-20261111.md).
An earlier DLC2 pass revalidated all 163 IDs in `1948054.quest_bxml`
(`DLC2_MQ03`, Anokatos context), recording seven correction candidates
without changing the translation CSV. Per-key speaker attribution and
dialogue order remain unknown. See
[`dialogue-context-1948054-dlc2-mq03-anokatos-revalidation-20261111.md`](dialogue-context-1948054-dlc2-mq03-anokatos-revalidation-20261111.md).
The latest pass revalidated all 196 IDs in `1962959.quest_bxml`
(`DLC2_MQ06`, asset-level NPC symbol `DLC2_NPC_TON_KOL_Secandra`), recording
15 correction candidates and four evidence-limited holds without changing
the translation CSV. Per-key speaker attribution and dialogue order remain
unknown. See
[`dialogue-context-1962959-dlc2-mq06-secandra-revalidation-20261111.md`](dialogue-context-1962959-dlc2-mq06-secandra-revalidation-20261111.md).
An earlier pass revalidated all 108 IDs in `1241289.quest_bxml` (`SQ41`),
recording 16 correction candidates and six evidence-limited IDs without
changing the translation CSV. Per-key speaker attribution and dialogue
order remain unknown. See
[`dialogue-context-1241289-sq41-adar-revalidation-20261111.md`](dialogue-context-1241289-sq41-adar-revalidation-20261111.md).
An earlier pass revalidated all 101 IDs in `1251244.quest_bxml` (`SQ50`),
recording 16 correction candidates and one evidence-limited hold without
changing the translation CSV. Per-key speaker attribution and dialogue
order remain unknown. See
[`dialogue-context-1251244-sq50-nareen-farm-revalidation-20261111.md`](dialogue-context-1251244-sq50-nareen-farm-revalidation-20261111.md).
The preceding pass revalidated 224 IDs across `1862841.quest_bxml`,
`1962117.quest_bxml`, `1272546.quest_bxml`, `734524.quest_bxml`, and
`1386000.quest_bxml`; it records four correction candidates and one
evidence-limited hold without changing the translation CSV. In
`1962117.quest_bxml`, explicit `DLC1_SQ08` and two `DLC1_NPC_...` symbols
coexist with `DLC1_SQ05` handler prefixes; the mismatch is documented rather
than interpreted as a key-to-handler mapping. See
[`dialogue-context-next-five-expanded-assets-revalidation-20261111.md`](dialogue-context-next-five-expanded-assets-revalidation-20261111.md).
The preceding pass revalidated 214 IDs across `1308608.quest_bxml`,
`1568849.quest_bxml`, `1431131.quest_bxml`, `527393.quest_bxml`, and
`710522.quest_bxml`; it records eight correction candidates and one
evidence-limited hold without changing the translation CSV. The assets'
handler prefixes and topics do not establish per-key speaker or playback
order. See
[`dialogue-context-remaining-five-assets-revalidation-20261111.md`](dialogue-context-remaining-five-assets-revalidation-20261111.md).
The preceding pass covers 100 IDs across `760713.quest_bxml` and
`1762903.quest_bxml`; it records four correction candidates and three
evidence-limited holds without changing the translation CSV. The asset-level
NPC symbols and handler names do not establish per-key speaker or playback
order. See
[`dialogue-context-two-npc-assets-revalidation-20261111.md`](dialogue-context-two-npc-assets-revalidation-20261111.md).
The preceding pass covers 165 IDs across five assets plus supplemental ID
`31283`; it records 33 correction candidates and seven register holds, while
the supplemental urn-reference question remains unresolved. See
[`dialogue-context-five-pending-assets-followup-revalidation-20261111.md`](dialogue-context-five-pending-assets-followup-revalidation-20261111.md).
The preceding pass covers 158 IDs across `2606201.quest_bxml`,
`533430.quest_bxml`, `1700657.quest_bxml`, `1704224.quest_bxml`, and
`2604701.quest_bxml`. It records seven correction candidates and three
evidence-limited holds without changing the translation CSV. See
[`dialogue-context-2606201-533430-1700657-1704224-2604701-revalidation-20261111.md`](dialogue-context-2606201-533430-1700657-1704224-2604701-revalidation-20261111.md).
The preceding pass covers 145 IDs across `1859132.quest_bxml`,
`2606401.quest_bxml`, `790086.quest_bxml`, `1974695.quest_bxml`, and
`1523728.quest_bxml`, plus the cross-asset `Big Hunt` checks at IDs `29900`
and `47041`. It records three correction candidates and four evidence-limited
holds without changing the translation CSV. See
[`dialogue-context-1859132-2606401-790086-1974695-1523728-revalidation-20261111.md`](dialogue-context-1859132-2606401-790086-1974695-1523728-revalidation-20261111.md).
The preceding 109-ID pass covers `734522.quest_bxml`, `717566.quest_bxml`,
`557394.quest_bxml`, `1825868.quest_bxml`, and `1747110.quest_bxml`; it
records 11 correction candidates and ten evidence-limited holds without
changing the translation CSV. See
[`dialogue-context-734522-717566-557394-1825868-1747110-revalidation-20261111.md`](dialogue-context-734522-717566-557394-1825868-1747110-revalidation-20261111.md).
The preceding 65-ID pass covers `2028142.quest_bxml`, `534119.quest_bxml`,
`662564.quest_bxml`, `725343.quest_bxml`, and `843163.quest_bxml`; it records
six correction candidates and one evidence-limited hold without changing the
translation CSV. See
[`dialogue-context-next-five-assets-followup-revalidation-20261111.md`](dialogue-context-next-five-assets-followup-revalidation-20261111.md).
The preceding 88-ID pass covers `1540101.quest_bxml`, `1743353.quest_bxml`,
`1875838.quest_bxml`, `1963060.quest_bxml`, and `1985675.quest_bxml`; it
records seven correction candidates and one evidence-limited hold without
changing the translation CSV. See
[`dialogue-context-next-five-assets-revalidation-20261111.md`](dialogue-context-next-five-assets-revalidation-20261111.md).
The preceding 73-ID pass covers `1304720.quest_bxml`, `1370376.quest_bxml`,
`1375390.quest_bxml`, `1375392.quest_bxml`, and `1476188.quest_bxml`. It
records six correction candidates and two evidence-limited holds without
changing the translation CSV. See
[`dialogue-context-next-five-small-assets-revalidation-20261111.md`](dialogue-context-next-five-small-assets-revalidation-20261111.md).
The earlier 196-ID pass covers `425982.quest_bxml`, `449611.quest_bxml`,
`461580.quest_bxml`, `484880.quest_bxml`, and `508141.quest_bxml`. It records
20 correction candidates and three evidence-limited holds without changing
the translation CSV. See
[`dialogue-context-five-pending-assets-revalidation-20261111.md`](dialogue-context-five-pending-assets-revalidation-20261111.md).
The preceding 57-ID pass covers `FFQ23_A/B/C`, `KVSQ06`, and `DLC2_SQ14` assets,
with 12 correction candidates and no holds or translation CSV edits. See
`dialogue-context-five-assets-revalidation-20261111.md`. The preceding
36-ID pass covered four quest-text assets and recorded seven candidates.
Earlier same-day batches reviewed 37 IDs across four sparse assets, 50 IDs
across five small assets, and 53 IDs across five additional assets; their
findings are recorded in the linked reports above.

The first three additional quest-text assets, `760709.quest_bxml` (`FFQ31`),
`760711.quest_bxml` (`FFQ32`), and `1333132.quest_bxml` (`FFQ53`), add 39
reviewed IDs without dialogue handlers. The next batch reviewed 15 IDs in
`1611923.quest_bxml` (`SQ147`), 35 in the multi-quest
`747916.quest_bxml` (`FFQ23_A/B/C`), and 41 in the multi-NPC
`598316.quest_bxml` (`SQ60`). The three-asset pass recorded three correction
findings affecting four IDs and five evidence-limited holds. Its report is
[`dialogue-context-1611923-747916-598316-revalidation-20261111.md`](dialogue-context-1611923-747916-598316-revalidation-20261111.md).
None of these reviews establishes a per-key speaker, callback, or playback
order, and no translation CSV was changed.

The `SQ81` completion report revalidated the 110 keys not included in the
earlier Brio pilot, bringing `1339422.quest_bxml` to complete coverage of all
122 linked keys. The asset contains five NPC symbols, so its shared quest
context does not establish per-key speakers or playback order.

The small quest-text pass revalidated 25 IDs across five assets:
`1619339`, `1695866`, `1698817`, `1698819`, and `1913467`. It recorded three
translation/naturalness candidates and no evidence-limited holds. None of
these assets contains an explicit quest ID, NPC symbol, or dialogue handler;
they were classified as quest/journal/UI text rather than assigned speakers.
No Korean CSV was changed. See
[`dialogue-context-small-quest-text-assets-revalidation-20261111.md`](dialogue-context-small-quest-text-assets-revalidation-20261111.md).

A further pass revalidated 12 dialogue-like rows in four assets
(`1392303`, `580435`, `592788`, and `695920`) that contain serialized
dialogue handlers but no quest ID or NPC symbol. It recorded one wording
candidate and one vocalization hold. Handler presence does not establish a
per-key speaker or order; no translation CSV was changed. See
[`dialogue-context-unmapped-dialogue-assets-revalidation-20261111.md`](dialogue-context-unmapped-dialogue-assets-revalidation-20261111.md).

The next small-asset pass reviewed 19 IDs across
`1379398.quest_bxml` (alchemy dialogue), `1963058.quest_bxml` (Wild Evenroot),
and `462518.quest_bxml` (unmapped dialogue). It recorded two correction
candidates and one evidence-limited hold. Handler presence does not establish
individual speakers or order; no Korean CSV was changed. See
[`dialogue-context-small-dialogue-and-evenroot-assets-revalidation-20261111.md`](dialogue-context-small-dialogue-and-evenroot-assets-revalidation-20261111.md).

The Chaos and druid armor pass completed four more small quest-text assets
(`2604102`, `2607900`, `2608000`, and `2608200`), with 19 unique
asset-linked IDs and one supplemental `Chaos Scholar` reference. The generic
`Quest Complete` ID is shared by 44 assets and was recorded once with all
links. Eleven correction-candidate IDs were recorded; no translation CSV
was changed. See
[`dialogue-context-chaos-quest-assets-revalidation-20261111.md`](dialogue-context-chaos-quest-assets-revalidation-20261111.md).

The expanded review has begun with `1292772.quest_bxml`, an asset with one
NPC symbol and 87 dialogue-handler names but no explicit `QUEST_ID`. Its 70
matched IDs have been reviewed and recorded. The asset does not establish
per-key speaker or callback mapping; four translation/naturalness proposals
and two register holds remain pending, and no CSV edit was made.

The second expanded pass covers all 138 keys linked to
`1443829.quest_bxml`. The asset has no explicit `QUEST_ID`; its 53 handlers
contain an `SQ124` prefix and it has the asset-level symbol
`NPC_DET_SEE_Aergase`, but neither establishes per-key speakers or order.
Thirteen correction candidates and seven holds were recorded; two reviewed
rows were retained without changes. No CSV edit was made. See
[`dialogue-context-1443829-revalidation-20261111.md`](dialogue-context-1443829-revalidation-20261111.md).

Two further expanded passes reviewed 30 keys in `599193.quest_bxml` and 169
keys in `1772558.quest_bxml`. Both assets contain multiple NPC symbols,
including Aergase, so neither supports assigning all rows to that character.
The 30-key pass recorded two holds; the 169-key pass recorded nine correction
candidates and two holds. Their records are in
[`dialogue-context-599193-revalidation-20261111.md`](dialogue-context-599193-revalidation-20261111.md)
and
[`dialogue-context-1772558-revalidation-20261111.md`](dialogue-context-1772558-revalidation-20261111.md).

Two small quest-text assets add another 20 reviewed IDs:
`1164089.quest_bxml` (`FFQ36`) and `1272808.quest_bxml` (`SQ89`). Neither has
dialogue handlers. The records distinguish the Syllareta spelling proposal,
the Hospitalis place-name proposal, and the `Hair of the Dog` title hold; see
[`dialogue-context-1164089-1272808-revalidation-20261111.md`](dialogue-context-1164089-1272808-revalidation-20261111.md).

## Candidate Application Completion (2026-11-14)

The final application pass classified all 551 candidate IDs in
`40000`-`45999`: 445 edits, 84 retained, and 36 evidence-limited holds, with
14 IDs carrying separate dispositions for distinct issues. Of the edit rows,
308 already matched the active Korean CSV and 137 were applied through the
byte-preserving editor. No candidate remains unclassified. Three prior
register holds were changed to edits after direct same-ID source comparison;
the existing Aster-family form at `45816` was retained because it already
matches the approved `애스터(Aster) 가문` pairing. The CSV remains 65,135
ordered rows with its UTF-8 BOM, 71,838 CRLF sequences, 244 LF-only sequences,
and no bare CR. Ledger fingerprints, index and catalogs, 11 preservation
tests, nine index tests, and the CRLF-aware diff check pass. See
[`dialogue-context-final-application-20261114.md`](dialogue-context-final-application-20261114.md)
and the final edit manifest.

The same source cross-check found six linked omissions in the `Dreadscale`
set: two `default` equipment names and four `base` variant-`11` item labels
were updated with `(Dreadscale)`. Already paired `Dreadscale` items were
retained; generic armor-category wording was left unchanged. The follow-up is
documented in
[`dialogue-context-dreadscale-pairing-20261114.md`](dialogue-context-dreadscale-pairing-20261114.md).

A later reconciliation against the active ledger found 16 candidate IDs in
`40000`-`45999` missing from the final application manifests. Four-language
revalidation assigned three edits, 11 retentions, and two evidence-limited
holds. It applied `default:41926`, `42063`, and `43026`; the earlier
`42063` “released” judgment was superseded after direct comparison showed
that Korean omitted the source's lack of intent to stop the visitors. See
[`missing-candidate follow-up`](dialogue-context-40000-45999-missing-candidate-followup-20261114.md)
and its
[ID manifest](dialogue-context-missing-candidates-40000-45999-20261114.json).

## Asset Revalidation: `2001870.quest_bxml` (2026-11-14)

Revalidated all 162 linked IDs across the four languages. The asset identifies
`DLC1_PH06b`, a Zefwyn NPC symbol, the `DLC1_Shipwrecks` topic, and 54
dialog-line handlers; it does not map individual IDs to a speaker or playback
order. Six supported label fixes were applied: `Dvergan Raider` was
standardized at IDs `9062`, `12508`, and `16940`; `Gnomish Trireme` at
`41266` and `55925` was aligned with `43734`; and `59373` gained the missing
`Keep Courtyard` pairing. ID `27459` remains held because Japanese and Chinese
register evidence conflicts and the speaker is not established. The six
changed rows' ledger fingerprints were refreshed without rewriting other
ledger fields. See
[`dialogue-context-2001870-dlc1-ph06b-zefwyn-revalidation-20261114.md`](dialogue-context-2001870-dlc1-ph06b-zefwyn-revalidation-20261114.md).

The subsequent `457555.quest_bxml` check covered its 129 linked IDs and
reopened all eight linked candidate/uncertain findings. Six concerns are
already reflected in the active text; two remain held because the source
meaning is unresolved. Its `SA01` handler names and Ciara NPC symbol do not
establish per-line speaker or order. No CSV or ledger change was made. See
[`dialogue-context-457555-sa01-ciara-revalidation-20261114.md`](dialogue-context-457555-sa01-ciara-revalidation-20261114.md).

The next check covered 189 key matches for `482242.quest_bxml` and reopened
13 linked findings. IDs `7527` and `22691` received supported naturalness
corrections; `20052` and `61424` already reflected their findings. Nine
evidence-limited questions remain held. The asset has 96 `KV05` handlers and
an Oneth NPC symbol, neither of which establishes a per-line speaker or
order. The catalog/ledger association gap for `47715` is documented without
rewriting its existing row. See
[`dialogue-context-482242-kv05-oneth-revalidation-20261114.md`](dialogue-context-482242-kv05-oneth-revalidation-20261114.md).

The next check covered 135 key matches for `555901.quest_bxml` and reopened
eight linked findings. The `Children of Dust` pairing at `37115` was aligned
with its exact duplicate at `40387`; the other clear findings were already
reflected or retained as evidence-limited holds. The catalog/ledger asset-link
gaps at `47725` and `47983` remain documented without rewriting ledger rows.
The asset has 56 `MQ04` handlers and an Agarth NPC symbol, not per-line
speaker/order evidence. See
[`dialogue-context-555901-mq04-agarth-revalidation-20261114.md`](dialogue-context-555901-mq04-agarth-revalidation-20261114.md).

## Candidate Application Reconciliation (2026-11-14)

The first 1,000 `default` IDs have now been reconciled against the current
`overall=candidate` ledger rows: 35 of the current 4,015 candidates (0.87%).
This includes the 21 candidates in `0`-`499`, four in `500`-`749`, and ten in
`750`-`999`. The 750-999 cross-check applied the remaining wording correction
at `853` and aligned exact-source poem duplicate `60106` with `952`; the other
eight candidates were already reflected in the active text. Only the two
changed IDs' fingerprints were refreshed. This is candidate adjudication
progress, not completion of the remaining candidate pool. See
[`dialogue-context-00750-00999-candidate-reconciliation-20261114.md`](dialogue-context-00750-00999-candidate-reconciliation-20261114.md)
and its machine-readable decisions.

The next candidate reconciliation covered IDs `1000`-`1249`: all 20 current
candidates were adjudicated, with six source-supported corrections, 12
already-resolved rows retained, and two evidence-limited holds. The
Ratofer-family charter term and the exact 26-row Argine title group were
cross-checked across related IDs. The edit batch changed 29 unique rows,
including supported related references outside the interval. The full ledger
fingerprint check, index tests, CSV-preservation tests, row/order/BOM/newline
checks, and CRLF-aware diff check passed. Candidate reconciliation now covers
55 of 4,015 current candidates (1.37%); the remaining candidates are still
open. See
[`1000`-`1249`](dialogue-context-01000-01249-candidate-reconciliation-20261114.md)
and its decision manifest.

The `5500`-`5749` follow-up reconciled all four current candidates; their
supported wording was already present, so no CSV edit or fingerprint update
was needed. Sequential candidate reconciliation reached 292 of 4,015
(7.27%), with 3,723 unreconciled. See
[`dialogue-context-05500-05749-candidate-reconciliation-20261114.md`](dialogue-context-05500-05749-candidate-reconciliation-20261114.md)
and its decision manifest.

The `5750`-`5999` follow-up reconciled all ten current candidates: three
corrections (`5752`, `5766`, `5971`) and seven retained findings already
resolved in the active Korean. Related rows `15624` and `19594` confirmed
that `village stores` refers to food storage/supplies. Three edited-row
fingerprints were refreshed. The full 65,135-ID ledger, index/catalog
reproduction, 11 CSV-preservation tests, nine context-index tests, CSV row
order, BOM, and newline inventory passed. Cumulative candidate reconciliation
is 302 / 4,015 (7.52%), with 3,713 unreconciled. See
[`dialogue-context-05750-05999-candidate-reconciliation-20261114.md`](dialogue-context-05750-05999-candidate-reconciliation-20261114.md)
and its decision manifest.

The `4250`-`4499` follow-up reconciled all ten current candidates. Six rows
were corrected: the Brother Til book-quest title at `4293`, conversational
register at `4315`, caretaker terminology at `4383`, title pairing at `4390`,
the `Idris Theonen` annotation at `4426`, and the separated Almain/Alard
pairing at `4480`. Four other findings were already resolved in prior edits.
The related `Idris Theonen` row `60012` was aligned as well; `61986` and
`53189` already matched their in-range counterparts. Seven changed-row
fingerprints were refreshed. The full ledger, index/catalog checks, both
test suites, CSV structure and newline inventory, and CRLF-aware diff check
passed. Reconciliation now covers 247 of 4,015 candidates (6.15%), with
3,768 unreconciled. See
[`dialogue-context-04250-04499-candidate-reconciliation-20261114.md`](dialogue-context-04250-04499-candidate-reconciliation-20261114.md)
and its decision manifest.

The `4500`-`4749` follow-up reconciled all four current candidates. Three
source-supported corrections were applied: the missing space at `4539`, the
morning ride detail at `4564`, and the seer's intent at `4671`. The proposed
`Main Hall` correction at `4521` was already present. Only the three changed
IDs' fingerprints were refreshed. Reconciliation now covers 251 of 4,015
candidates (6.25%), with 3,764 unreconciled. See
[`dialogue-context-04500-04749-candidate-reconciliation-20261114.md`](dialogue-context-04500-04749-candidate-reconciliation-20261114.md)
and its decision manifest.

The `4750`-`4999` follow-up reconciled all 12 current candidates. Three
source-supported corrections were applied: the `Witch Knights` compound at
`4778`, the `염주` particle at `4867`, and the complete `Wild Evenroot`
pairing at `4943`. Nine prior corrections were already reflected in the
active Korean. Only the three changed IDs' fingerprints were refreshed.
Reconciliation now covers 263 of 4,015 candidates (6.55%), with 3,752
unreconciled. See
[`dialogue-context-04750-04999-candidate-reconciliation-20261114.md`](dialogue-context-04750-04999-candidate-reconciliation-20261114.md)
and its decision manifest.

The next reconciliation covered all 24 current candidates in `1250`-`1499`:
ten source-supported corrections, 14 retained as already resolved, and the
three earlier evidence-limited holds left unresolved outside this candidate
set. Four related IDs outside the range were also aligned. The 14 edited
fingerprints, full ledger, CSV structure and newline inventory, 11
preservation tests, nine context-index tests, and CRLF-aware diff check
passed. Candidate reconciliation now covers 79 of 4,015 current candidates
(1.97%); the remaining candidates are still open. See
[`dialogue-context-01250-01499-candidate-reconciliation-20261114.md`](dialogue-context-01250-01499-candidate-reconciliation-20261114.md)
and its decision manifest.

The next reconciliation covered all 17 current candidates in `1500`-`1749`:
two source-supported corrections (`1560`, `1683`) and 15 retained as already
consistent. The exact `Turn in the Contract` objective was aligned at
`1683`. The two edited fingerprints, full ledger, CSV structure and newline
inventory, 11 preservation tests, nine context-index tests, and CRLF-aware
diff check passed. Candidate reconciliation now covers 96 of 4,015 current
candidates (2.39%); the remaining candidates are still open. See
[`dialogue-context-01500-01749-candidate-reconciliation-20261114.md`](dialogue-context-01500-01749-candidate-reconciliation-20261114.md)
and its decision manifest.

The `1750`-`1999` reconciliation addressed all 18 current candidates: seven
source-supported corrections and 11 already-consistent items retained. Six
related rows outside the interval were also aligned, for 13 changed IDs total.
Their fingerprints were refreshed; full-ledger validation, 11 preservation
tests, nine context-index tests, CSV structure/newline checks, and
CRLF-aware diff validation passed. Candidate reconciliation now covers
114 of 4,015 current candidates (2.84%). Continue with `2000`-`2249`; this
does not mean the remaining candidate pool is complete. See
[`dialogue-context-01750-01999-candidate-reconciliation-20261114.md`](dialogue-context-01750-01999-candidate-reconciliation-20261114.md)
and its decision manifest.

The `2000`-`2249` reconciliation addressed all 12 current candidates: six
source-supported corrections and six already-consistent items retained. One
related parallel line, `23635`, was aligned with `2064`. Seven changed IDs'
fingerprints were refreshed; full-ledger validation, both regression suites,
index/catalog reproduction, CSV structure/newline checks, and CRLF-aware
diff validation passed. Candidate reconciliation now covers 126 of 4,015
current candidates (3.14%). Continue with `2250`-`2499`; the remaining
candidate pool is incomplete. See
[`dialogue-context-02000-02249-candidate-reconciliation-20261114.md`](dialogue-context-02000-02249-candidate-reconciliation-20261114.md)
and its decision manifest.

The `2250`-`2499` reconciliation addressed all 12 current candidates: six
source-supported corrections and six already-consistent items retained. The
parallel objective at `7588` was aligned with the established `-기` form.
Seven changed IDs' fingerprints were refreshed; full-ledger validation, both
regression suites, index/catalog reproduction, CSV structure/newline checks,
and CRLF-aware diff validation passed. Candidate reconciliation now covers
138 of 4,015 current candidates (3.44%). Continue with `2500`-`2749`; the
remaining candidate pool is incomplete. See
[`dialogue-context-02250-02499-candidate-reconciliation-20261114.md`](dialogue-context-02250-02499-candidate-reconciliation-20261114.md)
and its decision manifest.

The `2500`-`2749` follow-up reconciled all 19 in-range candidates and six
related candidates. Five in-range corrections and two related title
corrections were applied; 18 other candidate decisions retained current
wording. Seven rows changed, with only their source fingerprints refreshed.
The ledger, index/catalog checks, both regression suites, CSV structure and
newline inventory, and CRLF-aware diff check passed. Cumulative reconciliation
reached 163 of 4,015 candidates (4.06%). See
[`dialogue-context-02500-02749-candidate-reconciliation-20261114.md`](dialogue-context-02500-02749-candidate-reconciliation-20261114.md)
and its decision manifest.

The `2750`-`2999` follow-up reconciled all 12 current candidates: three
source-supported corrections and nine already-correct translations retained.
The identical objective at `34720` was aligned with `2945`, for four changed
rows total. Only those four fingerprints were refreshed. The full ledger,
index/catalog checks, both regression suites, CSV structure and newline
inventory, and CRLF-aware diff check passed. Cumulative reconciliation reached
175 of 4,015 candidates (4.36%); the remaining candidates are still open. See
[`dialogue-context-02750-02999-candidate-reconciliation-20261114.md`](dialogue-context-02750-02999-candidate-reconciliation-20261114.md)
and its decision manifest.

The `3000`-`3249` follow-up reconciled all 23 in-range candidates: three
source-supported corrections and 20 retained. Three related rows outside the
interval were also corrected: `56854` now matches the paired Spear of Light
epithet at `3075`, and `36982`/`38893` restore the two-bug count in the exact
`Boggart (2 Bugs)` label. This supersedes the earlier erroneous retention of
the two count omissions. Six changed rows' fingerprints were refreshed; the
full ledger, index/catalog checks, both regression suites, CSV structure and
newline inventory, and CRLF-aware diff check passed. Sequential reconciliation
now covers 198 of 4,015 current candidates (4.93%); the candidate pool remains
incomplete. See
[`dialogue-context-03000-03249-candidate-reconciliation-20261114.md`](dialogue-context-03000-03249-candidate-reconciliation-20261114.md)
and its decision manifest.

The `3250`-`3499` candidate follow-up checked all 12 current candidates
against the four language tables. Four supported corrections were applied
and eight already-consistent translations were retained. A global
`Banshaen`-pairing search also corrected `default:52239`; that row's separate
lore-relationship question remains unresolved. Five changed rows'
fingerprints were refreshed. The complete ledger, index/catalog checks, both
regression suites, CSV structure and newline inventory, and CRLF-aware diff
check passed. Cumulative candidate reconciliation is 210 / 4,015 (5.23%),
with 3,805 unreconciled candidates remaining. See
[`dialogue-context-03250-03499-candidate-reconciliation-20261114.md`](dialogue-context-03250-03499-candidate-reconciliation-20261114.md)
and its decision manifest.

The `3500`-`3749` candidate follow-up checked all ten current candidates.
Nine were already reflected in the active Korean and were retained; `3707`
remains held because the sources do not settle whether `wood` means forest
or tree. No CSV or fingerprint change was needed. The 65,135-ID ledger,
generated index/catalog checks, both regression suites, and CRLF-aware diff
check passed. Cumulative candidate reconciliation is 220 / 4,015 (5.48%),
with 3,795 unreconciled and one held item still open. See
[`dialogue-context-03500-03749-candidate-reconciliation-20261114.md`](dialogue-context-03500-03749-candidate-reconciliation-20261114.md)
and its decision manifest.

The `3750`-`3999` candidate follow-up reviewed all 11 current candidates:
three corrections and eight retentions. It fixed the Gwynedd particle error,
matched the Japanese-supported casual register at `3926`, and paired the
`Stowaway` title at `3971` and its exact duplicate `28829`. The related
objective at `37189` was also paired and changed to the established `-하기`
form; it will be counted when that later numeric interval is reconciled.
Five fingerprints were refreshed. The complete ledger, index/catalog checks,
both test suites, CSV structure and newline inventory, and CRLF-aware diff
check passed. Sequential candidate reconciliation is 231 / 4,015 (5.75%),
with 3,784 unreconciled. See
[`dialogue-context-03750-03999-candidate-reconciliation-20261114.md`](dialogue-context-03750-03999-candidate-reconciliation-20261114.md)
and its decision manifest.

The `4000`-`4249` follow-up reconciled all six current candidates. It corrected
the familiar address in `4135` and its exact duplicate `62969`, and smoothed
the time-thread metaphor at `4177`; four other findings were already resolved
or retained under established terminology. Three changed-row fingerprints
were refreshed. The full ledger, index/catalog checks, both test suites, CSV
structure and newline inventory, and CRLF-aware diff check passed.
Reconciliation now covers 237 of 4,015 candidates (5.90%), with 3,778
unreconciled. See
[`dialogue-context-04000-04249-candidate-reconciliation-20261114.md`](dialogue-context-04000-04249-candidate-reconciliation-20261114.md)
and its decision manifest.

The `5000`-`5249` candidate follow-up reconciled all 14 current candidates:
three source-supported corrections (`5046`, `5189`, `5225`) and 11 findings
whose supported wording or terminology was already reflected in the active
Korean. The connected Nuala Ignas occurrence at `61266` was also checked and
already canonical. Only the three changed IDs' fingerprints were refreshed.
The full ledger, CSV-preservation and context-index checks, CSV structure and
newline inventory, and CRLF-aware diff check passed. Sequential candidate
reconciliation now covers 277 of 4,015 candidates (6.90%), with 3,738
unreconciled. See
[`dialogue-context-05000-05249-candidate-reconciliation-20261114.md`](dialogue-context-05000-05249-candidate-reconciliation-20261114.md)
and its decision manifest.

The `5250`-`5499` follow-up reconciled all 11 current candidates: seven
source-supported corrections and four already-resolved findings retained.
The shared Menri Togh account was aligned at `5313`/`53623`, preserving each
row's distinct ending; Plagueshield parcel wording was aligned at
`5371`/`33076`. Nine changed IDs' fingerprints were refreshed. The full
ledger, both regression suites, index/catalog checks, CSV structure and
newline inventory, and CRLF-aware diff check passed. Sequential candidate
reconciliation now covers 288 of 4,015 candidates (7.17%), with 3,727
unreconciled. See
[`dialogue-context-05250-05499-candidate-reconciliation-20261114.md`](dialogue-context-05250-05499-candidate-reconciliation-20261114.md)
and its decision manifest.

The `6000`-`6249` follow-up reconciled all eight current candidates: four
corrections (`6013`, `6044`, `6239`, `6243`) and four already-resolved
findings. The complete 26-ID `Argine, Queen of Staves` exact-source group
now uses one Korean title form. Twenty-nine fingerprints were refreshed;
the full ledger, index/catalog reproduction, 11 preservation tests, nine
context-index tests, and CSV structure/newline checks passed. Cumulative
candidate reconciliation is 310 / 4,015 (7.72%), with 3,705 remaining.
See
[`dialogue-context-06000-06249-candidate-reconciliation-20261114.md`](dialogue-context-06000-06249-candidate-reconciliation-20261114.md)
and its decision manifest.

The `6250`-`6499` follow-up reconciled all eight current candidates: two
corrections (`6316`, `6327`) and six already-resolved findings. Two edited
row fingerprints were refreshed. The full ledger, index/catalog
reproduction, 11 preservation tests, nine context-index tests, and CSV
structure/newline checks passed. Cumulative candidate reconciliation is
318 / 4,015 (7.92%), with 3,697 remaining. See
[`dialogue-context-06250-06499-candidate-reconciliation-20261114.md`](dialogue-context-06250-06499-candidate-reconciliation-20261114.md)
and its decision manifest.

The `6500`-`6749` reconciliation checked all 20 current candidates. It
corrected the interrupted vocative at `6672` and refined the full journal
entry at `6734`; 18 findings were already resolved in the active Korean.
Only the two edited-row fingerprints were refreshed. The full ledger,
index/catalog reproduction, 11 preservation tests, nine context-index tests,
CSV structure, BOM, and newline inventory passed. Sequential candidate
reconciliation now covers 338 of 4,015 candidates (8.42%), with 3,677
remaining. See
[`dialogue-context-06500-06749-candidate-reconciliation-20261114.md`](dialogue-context-06500-06749-candidate-reconciliation-20261114.md)
and its decision manifest.

The `6750`-`6999` reconciliation checked all 21 current candidates. Ten
required corrections and eleven were already resolved. In addition to the
rank, dialogue, objective, and item fixes, explicit Eventide `clan`
references were standardized to `씨족`; repeated lines at `5258`/`23049` and
`6878`/`57663` now match exactly in Korean. Three separate evidence-limited
holds remain. Nine newly changed IDs' fingerprints were refreshed, including
all linked terminology rows; the full ledger, generated index/catalogs,
regression suites, CSV structure/BOM/newline inventory, and CRLF-aware diff
check passed. Candidate reconciliation is 359 / 4,015 (8.94%), with 3,656
remaining. See
[`dialogue-context-06750-06999-candidate-reconciliation-20261114.md`](dialogue-context-06750-06999-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-06750-06999-20261114.json).

The `7000`-`7249` candidate follow-up reconciled all 24 current findings:
six corrections, 16 resolved/retained findings, and two evidence-limited
holds. It standardized all 19 identical `Maire, Queen of Cups` rows, aligned
the two `peasant clothes` occurrences, and corrected the remaining supported
book-name and naturalness issues. Twenty-five changed-row fingerprints were
refreshed. The full ledger, index/catalog reproduction, 11 preservation
tests, nine context-index tests, CSV structure/BOM/newline inventory, and
CRLF-aware diff check passed. Candidate reconciliation is 383 / 4,015
(9.54%), with 3,632 not yet reconciled. See
[`dialogue-context-07000-07249-candidate-reconciliation-20261114.md`](dialogue-context-07000-07249-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-07000-07249-20261114.json).

The `7250`-`7499` candidate follow-up reconciled all 10 current findings:
one artifact-name correction, eight already-resolved/retained items, and one
evidence-limited hold. The incomplete Sun/Storm/Frost Stone names at `7472`
were completed; only its fingerprint was refreshed. The full ledger,
index/catalog reproduction, 11 preservation tests, nine context-index tests,
CSV structure/BOM/newline inventory, and CRLF-aware diff check passed.
Candidate reconciliation is 393 / 4,015 (9.79%), with 3,622 not yet
reconciled. See
[`dialogue-context-07250-07499-candidate-reconciliation-20261114.md`](dialogue-context-07250-07499-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-07250-07499-20261114.json).

The `7500`-`7749` candidate follow-up reconciled all 15 current findings.
Most proposed corrections were already reflected in Korean; the identical
Khamazandu offer was aligned across seven entries, and the Warsworn leader
wording at `7589` was matched to `21922`. Two fingerprints were refreshed.
The full ledger, index/catalog reproduction, 11 preservation tests, nine
context-index tests, CSV structure/BOM/newline inventory, and CRLF-aware diff
check passed. Candidate reconciliation is 408 / 4,015 (10.16%), with 3,607
not yet reconciled. See
[`dialogue-context-07500-07749-candidate-reconciliation-20261114.md`](dialogue-context-07500-07749-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-07500-07749-20261114.json).

The `10500`-`10749` candidate reconciliation checked all 20 current findings.
Five remaining wording, register, and naturalness issues were corrected;
the other 15 were already reflected in the active Korean. It normalized the
halting line at `10566`, corrected the plain-register dialogue at `10539` and
`10618`, and aligned the repeated `And finally` passage at `10708` with
`41402` and `43547`. The prayer-bead, Savant-rank, Lupoku, and Troll-subtype
forms were confirmed against their related rows. Five edited-row fingerprints
were refreshed; the full ledger, catalogs, both test suites, and CSV row/BOM/
newline checks passed. Sequential candidate reconciliation is 657 / 4,015
(16.36%), with 3,358 remaining. See
[`10500`-`10749`](dialogue-context-10500-10749-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-10500-10749-20261114.json).

The `10750`-`10999` candidate reconciliation checked all 18 current findings.
Seven remaining corrections were applied, and 11 already-reflected findings
were confirmed. It corrected the delivery direction at `10778`, completed the
`Captain Drefan` title pairing, refined the appeasement wording at `10927`,
and completed the camp and epithet pairings. The ambiguous metaphor at `10974`
remains held even though its supported `샘(The Font)` pairing was added.
Seven fingerprints were refreshed; the full ledger, catalogs, both test
suites, CSV structure/newline checks, and CRLF-aware diff check passed.
Sequential reconciliation is 675 / 4,015 (16.81%), with 3,340 remaining.
See
[`10750`-`10999`](dialogue-context-10750-10999-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-10750-10999-20261114.json).

The `11000`-`11249` reconciliation checked all ten in-range candidates.
Four remaining errors were corrected; five were already reflected in Korean,
and the 26-row `Argine, Queen of Staves` group was confirmed identical with
both English title components paired. The linked `Onarach` candidate at
`11619` was corrected alongside `11022`. Five fingerprints were refreshed;
the full ledger, catalogs, both test suites, CSV structure/newline inventory,
and CRLF-aware diff check passed. Cumulative reconciliation is 686 / 4,015
(17.09%), with 3,329 remaining. See
[`11000`-`11249`](dialogue-context-11000-11249-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-11000-11249-20261114.json).

The `11250`-`11499` candidate reconciliation checked all eight current
findings: seven supported corrections and one already-correct translation.
It reverified the four edits already present, corrected the Fae line at
`11359`, changed `11365` to the established objective form, and made
`11438`'s directive conversational. A full exact-source scan also aligned
three related `Headsman` entries; all 26 occurrences now use
`처형인(Headsman)`. Six fingerprints were refreshed. The full ledger, index
and catalogs, both test suites, CSV order/BOM/newline inventory, and
CRLF-aware diff check passed. Sequential candidate reconciliation is now
694 / 4,015 (17.29%), with 3,321 remaining. See
[`11250`-`11499`](dialogue-context-11250-11499-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-11250-11499-20261114.json).

The `11500`-`11749` reconciliation reviewed all 11 not-yet-reconciled
candidates; `11619` was already handled in the preceding range and was not
recounted. Six remaining corrections were applied, three previously applied
corrections were verified, and two candidates already matched the evidence.
Related checks aligned the exact-English Winter-cousin pair, the Sandstone
Villa and Bera quest terminology, and the Adar prison-circle wording.
Evidence-limited mining details at `11599` remain held. Ten fingerprints were
refreshed; the full ledger, catalogs, both test suites, CSV structure/newline
inventory, and CRLF-aware diff check passed. Sequential candidate
reconciliation is 705 / 4,015 (17.56%), with 3,310 remaining. See
[`11500`-`11749`](dialogue-context-11500-11749-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-11500-11749-20261114.json).

The `11750`-`11999` reconciliation checked all 15 candidates: six additional
corrections were applied, five previously applied edits were verified, and
four candidates already matched the evidence. The corrections address
conversational register, the interrupted accusation, recognition vs.
empathy, shroud terminology, the objective form, and three parallel bounty
completion records. The Motus handbook and alchemical-formula term groups
were also checked and found consistent. Eight fingerprints were refreshed;
the full ledger, catalogs, both test suites, CSV structure/newline inventory,
and CRLF-aware diff check passed. Sequential candidate reconciliation is
720 / 4,015 (17.93%), with 3,295 remaining. See
[`11750`-`11999`](dialogue-context-11750-11999-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-11750-11999-20261114.json).

The `12000`-`12249` reconciliation checked all eight current candidates.
Seven already-applied corrections were verified, and the `12173` reference to
the named book *The Missives* was retained after comparison with English,
Japanese, and Chinese. The exact-English `Irion, King of Cups` group was
checked across all 20 occurrences, and the nine `Hermit Smith` references
remain consistently paired. Twenty-one fingerprints were refreshed; the full
ledger, index/catalog reproduction, 20 related tests, CSV structure/newline
inventory, and CRLF-aware diff check passed. No new CSV edit was needed.
Sequential candidate reconciliation is 728 / 4,015 (18.13%), with 3,287
remaining. See
[`12000`-`12249`](dialogue-context-12000-12249-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-12000-12249-20261114.json).

The `12250`-`12499` reconciliation checked all ten candidates. Nine
previously applied corrections were confirmed; the informal dialogue at
`12434` was further refined for naturalness while preserving the thanks to
Akara and the tree-seed gesture. The related `The Testament` and
`Ordination Tome` labels were checked against established forms. The edited
row's fingerprint, full ledger, index/catalog reproduction, 20 related tests,
CSV structure/newline inventory, and CRLF-aware diff check passed. Sequential
candidate reconciliation is 738 / 4,015 (18.38%), with 3,277 remaining. See
[`12250`-`12499`](dialogue-context-12250-12499-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-12250-12499-20261114.json).

The `12500`-`12749` reconciliation checked all eight candidates; every
correction was already present in the current Korean. It confirmed the
age-neutral sibling references, Kulder's title order, the acceptance tone,
the strict `over 10,000` threshold, the ballad-title pairings, and
`로어스톤(Lorestone)`. No CSV or fingerprint change was needed. The full
ledger, index/catalog reproduction, 20 tests, CSV structure/newline inventory,
and CRLF-aware diff check passed. Cumulative reconciliation is 746 / 4,015
(18.58%), with 3,269 remaining. See
[`12500`-`12749`](dialogue-context-12500-12749-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-12500-12749-20261114.json).

The `12750`-`12999` reconciliation confirmed all nine candidates as already
corrected in the active Korean. It rechecked the journal name pairing, the
`Great House` family sense, the `The Testament` form, conversational phrasing,
and the source's qualifiers and idioms. No CSV or fingerprint change was
needed. The full ledger, index/catalog reproduction, 20 tests, CSV
structure/newline inventory, and CRLF-aware diff check passed. Cumulative
reconciliation is 755 / 4,015 (18.80%), with 3,260 remaining. See
[`12750`-`12999`](dialogue-context-12750-12999-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-12750-12999-20261114.json).

The `13000`-`13249` reconciliation checked all nine candidates and aligned
the eight Gallery references and 19 `Maire, Queen of Cups` labels. The
previously applied corrections were confirmed except for `13140`, where the
sister relationship had been dropped while removing an unsupported age
distinction. That line was corrected using the age-neutral sibling form.
The edited fingerprint, full ledger, index/catalog reproduction, 20 tests,
CSV structure/newline inventory, and CRLF-aware diff check passed. Cumulative
reconciliation is 764 / 4,015 (19.03%), with 3,251 remaining. See
[`13000`-`13249`](dialogue-context-13000-13249-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-13000-13249-20261114.json).

The `13250`-`13499` reconciliation confirmed all eight current candidates as
already corrected in the active Korean. It rechecked the `Master's Tallow` and
`Hurvar's Doorsill` groups, the sibling reference and plain register, the
`Kandrian Keep` and `Helmgard Keep` pairings, `Parry`, the exact-English
contract-failure copy, and the named *Missives of Sable*. The separate
`master-at-arms` question at `13436` remains outside the place-name correction.
No CSV or fingerprint change was needed. Cumulative reconciliation is 772 /
4,015 (19.23%), with 3,243 remaining. See
[`13250`-`13499`](dialogue-context-13250-13499-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-13250-13499-20261114.json).

The `13500`-`13749` reconciliation covered all ten candidates. Nine prior
corrections were confirmed; `13591` was refined to a more conversational
expression of hope. A full `default` Lupoku spelling scan also found the
missed `default:25713`, which was corrected; all 21 English `Lupoku`
references now match, while `default:2009` correctly retains the source's
spelling `Lopoku`. All 20 `Irion, King of Cups` labels were confirmed
consistent. The `base:1940` spelling discrepancy was recorded but left
untouched because this review is limited to `default`. Two fingerprints were
refreshed; the full ledger, both regression suites, manifest, and CRLF-aware
diff check passed. Cumulative reconciliation is 782 / 4,015 (19.48%), with
3,233 remaining. See
[`13500`-`13749`](dialogue-context-13500-13749-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-13500-13749-20261114.json).

The `13750`-`13999` reconciliation confirmed all ten candidates as already
corrected. It rechecked the full `The Burn` place-name group, the English
pairing of `Augur`, the arena and Chaos Matter wording, the ash-urn count,
and the bounded `dreg` terminology group without inferring shared speakers.
No CSV or fingerprint change was needed. The full ledger, both regression
suites, manifest, and CRLF-aware diff check passed. Cumulative reconciliation
is 792 / 4,015 (19.73%), with 3,223 remaining. See
[`13750`-`13999`](dialogue-context-13750-13999-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-13750-13999-20261114.json).

The `14000`-`14249` reconciliation reviewed all twelve candidates. Eleven
prior edits were confirmed; `14079` was refined to use natural wish phrasing
and the established `운명의 직조` term for `the Weave`. The Venris
reconnaissance-document and Malgar name groups were checked. The related
`master-at-arms` scan caught the remaining inconsistent `무술 교관` at
`default:65048`, now aligned to `무기 교관`. Two fingerprints were refreshed;
the full ledger, both regression suites, manifest, and CRLF-aware diff check
passed. Cumulative reconciliation is 804 / 4,015 (20.02%), with 3,211
remaining. See
[`14000`-`14249`](dialogue-context-14000-14249-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-14000-14249-20261114.json).

The `14250`-`14499` reconciliation covered all fourteen current ledger
candidates. Thirteen prior corrections were confirmed; `14335` was refined
for natural, solemn phrasing of Aurela's service statement. The Lady Oleyn
labels were checked as a related consistency group. One fingerprint was
refreshed; the full ledger, catalogs, both regression suites, manifest, and
CRLF-aware diff passed. Cumulative reconciliation is 818 / 4,015 (20.37%),
with 3,197 remaining. See
[`14250`-`14499`](dialogue-context-14250-14499-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-14250-14499-20261114.json).

The `14500`-`14749` reconciliation covered all sixteen current candidates.
Fourteen prior corrections were confirmed; `14577` was refined for natural
dialogue, and the unresolved `Templar` title at `14729` remains held. Argine,
Priestess Seranon, Motus Mining, Maisie's Luck, and the identical-source
sentence group were checked for consistency. One fingerprint was refreshed;
the full ledger, catalogs, both regression suites, manifest, and CRLF-aware
diff passed. Cumulative reconciliation is 834 / 4,015 (20.77%), with 3,181
remaining. See
[`14500`-`14749`](dialogue-context-14500-14749-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-14500-14749-20261114.json).

The `14750`-`14999` reconciliation covered all sixteen current candidates.
Twelve prior corrections were confirmed; four rows (`14818`, `14824`,
`14894`, `14991`) were refined for natural plain speech and sentence flow
after four-language comparison. Related `Hermit Smith`, Captain Brattigan,
House of Valor arena, and Teeth of Naros urn terminology was checked as
bounded consistency groups. The four changed-row fingerprints, full ledger,
index/catalog reproducibility, both regression suites, CSV structure and
line-ending inventory, and CRLF-aware diff check passed. Cumulative
reconciliation is 850 / 4,015 (21.17%), with 3,165 remaining. See
[`14750`-`14999`](dialogue-context-14750-14999-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-14750-14999-20261114.json).

The `15000`-`15249` reconciliation covered all eighteen current candidates.
Sixteen prior corrections were confirmed; `15073` was refined for the work
and military-group relationship, and `15090` for natural debt wording.
Khamazandu's repeated offer, the Brad and Cergren Traders title, Ambassador
Keen, `작은 자여`, and the prayer-beads wording were cross-checked across
their related IDs. The two changed-row fingerprints, full ledger,
index/catalog reproducibility, both regression suites, CSV structure and
line-ending inventory, and CRLF-aware diff check passed. Cumulative
reconciliation is 868 / 4,015 (21.62%), with 3,147 remaining. See
[`15000`-`15249`](dialogue-context-15000-15249-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-15000-15249-20261114.json).

The `15250`-`15499` reconciliation covered all ten current candidates.
Eight already-applied corrections were confirmed, including the Gravehal
gallery, `Smiler`, the `Missives of Sable`, and `Tinehil` references.
`15473` was refined to preserve the future sense of those who will help, and
`15499` was corrected to compare the addressee with the speaker rather than
the speaker's lifetime deeds; this supersedes an earlier retain decision.
The already-present `Nil Kern` pairing at `15474` was confirmed. A separate
Chrysalae spelling question at `15342` remains under its existing
evidence-limited hold and is not counted among this range's ten candidates.
Fingerprints were refreshed for `15419`, `15473`, and `15499`; all ledger
fingerprints, index/catalog reproduction, both test suites, CSV structure and
line-ending inventory, and the CRLF-aware diff check passed. Candidate
reconciliation is now 870 / 4,015 (21.67%), with 3,145 remaining. See
[`15250`-`15499`](dialogue-context-15250-15499-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-15250-15499-20261114.json).

The `15500`-`15749` reconciliation covered all sixteen current candidates.
Fourteen prior corrections were confirmed, `15532` was refined to use the
established `Sativa Fibers` name, and `15581` was retained as a natural
written past-tense statement without inferring a speaker. The directly
related SQ145 journal candidate at `63566` was also corrected to report style
and the same harvest term. The standalone singular item label at `28236` was
kept source-specific. The six card names, Irion's title, Initiates, Eventide
clan, and related `Beasts killed` lines were checked against their bounded
reviews. Fingerprints for `15532` and `63566`, all ledger entries, index and
catalog reproduction, both test suites, CSV structure and line endings, and
the CRLF-aware diff check passed. Including the linked candidate,
reconciliation is 887 / 4,015 (22.09%), with 3,128 remaining. See
[`15500`-`15749`](dialogue-context-15500-15749-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-15500-15749-20261114.json).

The `15750`-`15999` reconciliation reviewed all eleven current candidates.
Every translation was already supported by the four-language evidence, so no
CSV edit or fingerprint refresh was needed. The `Missives of Sable`, divine
`Authority`, Chaos Critters, Headsman/Betheli, Omnibus Arcana, and the
affectionate description of Geoff were rechecked. Evidence-limited meanings
remain held. The ledger and generated catalogs validate, both related test
suites pass, and the CRLF-aware diff check is clean. Cumulative candidate
reconciliation is 898 / 4,015 (22.37%), with 3,117 remaining. See
[`15750`-`15999`](dialogue-context-15750-15999-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-15750-15999-20261114.json).

The `16000`-`16249` range rechecked all five current candidates. The
material-versus-coin meaning of `silver`, the rhetorical parallel, the
Scholia Arcana `입문자` term, forced arena match, and `Chosen` English pairing
are all already correct in the active translation. No CSV edit or
fingerprint refresh was required. The ledger/catalog validation and both
regression suites passed; cumulative candidate reconciliation is 903 / 4,015
(22.49%), with 3,112 remaining. See
[`16000`-`16249`](dialogue-context-16000-16249-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-16000-16249-20261114.json).

The `16250`-`16499` range reconciled eleven current candidates after
four-language comparison. Ten existing corrections were confirmed; `16389`
was refined to separate the armor's acquisition from the blood-painted
plates and clarify that the armor drinks the spilled blood. Only that row's
fingerprint was refreshed. The complete ledger, index/catalog checks, both
regression suites, CSV structure/newline inventory, and CRLF-aware diff check
passed. Cumulative candidate reconciliation is 914 / 4,015 (22.77%), with
3,101 remaining. See
[`16250`-`16499`](dialogue-context-16250-16499-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-16250-16499-20261114.json).

The `16500`-`16749` range reconciled nine in-range candidates and the linked
exact-English duplicate at `33194`. All ten were already supported by the
current four-language rows; no translation or fingerprint change was
required. The duplicate training line and all six `Cliffbreak Fasting`
references were confirmed consistent, and the poem at `16719` retains its
line structure. Ledger, index/catalog, regression, CSV-structure, newline,
and CRLF-aware diff checks passed. Cumulative candidate reconciliation is
924 / 4,015 (23.01%), with 3,091 remaining. See
[`16500`-`16749`](dialogue-context-16500-16749-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-16500-16749-20261114.json).

The `16750`-`16999` reconciliation checked all eleven current candidates and
the linked SQ108 candidate at `63399`. Ten existing corrections were
confirmed; `16921` was refined from `재배치` to source-supported `전근`, in
line with the verified transfer wording at `52118`. The Lupoku source
spellings, Red "the Dead" Idward, Chosen titles, Sagecraft altar, and
quest-specific urns were cross-checked. One fingerprint was refreshed; the
full ledger, index/catalog reproduction, regression tests, CSV structure,
newline inventory, manifest, and CRLF-aware diff check passed. Cumulative
candidate reconciliation is 936 / 4,015 (23.31%), with 3,079 remaining. See
[`16750`-`16999`](dialogue-context-16750-16999-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-16750-16999-20261114.json).

The `17000`-`17249` reconciliation confirmed all ten current corrections
were already reflected in the Korean CSV. The Beckoned meaning, Maura's
home, the House of Sorrows, and the inexperienced apprentice were checked
against all language rows; the Great General title matches both exact-English
copies. No CSV edit or fingerprint refresh was needed. Cumulative
reconciliation is 946 / 4,015 (23.56%), with 3,069 remaining. See
[`17000`-`17249`](dialogue-context-17000-17249-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-17000-17249-20261114.json).

The `17250`-`17499` reconciliation confirmed eleven corrections and retained
the source-specific short `Toothpicks` name at `17474`, supported by its
identical quest copies. The Glass of Ambient mirror references, Fae-farming
passage, and Castle Ansilla refuse-pipe wording were checked across related
IDs. No CSV or fingerprint update was needed. Cumulative reconciliation is
958 / 4,015 (23.86%), with 3,057 remaining. See
[`17250`-`17499`](dialogue-context-17250-17499-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-17250-17499-20261114.json).

The `17500`-`17749` reconciliation confirmed all nine current corrections.
The Leechwood term and harvest objective, the shared Ysa-defense passage,
Skyblossom, The Testament, Horace, and Selinia's pronouns were cross-checked
against their related rows. No CSV edit or fingerprint refresh was needed.
Cumulative reconciliation is 967 / 4,015 (24.08%), with 3,048 remaining.
See
[`17500`-`17749`](dialogue-context-17500-17749-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-17500-17749-20261114.json).

The `17750`-`17999` reconciliation confirmed all three current corrections:
the cave reading at `17901`, the conversational dismissal at `17936`, and
the standardized `키프탈 사부(Master Kiftal)` title at `17937`. No CSV edit
or fingerprint refresh was needed. Cumulative reconciliation is 970 / 4,015
(24.16%), with 3,045 remaining. See
[`17750`-`17999`](dialogue-context-17750-17999-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-17750-17999-20261114.json).

The `18000`-`18249` reconciliation confirmed four current candidates and the
linked SQ126 candidate at `48994`. The objective at `18005`, Headsman title
at `18118`, paired Stones at `18134`, and shared Dokkalfar payment sentence
at `18242`/`48994` are already correct in the active Korean. No CSV or
fingerprint changed. Cumulative reconciliation is 975 / 4,015 (24.28%),
with 3,040 remaining. See
[`18000`-`18249`](dialogue-context-18000-18249-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-18000-18249-20261114.json).

The `18250`-`18499` reconciliation confirmed six current candidates and three
linked SQ01 candidates at `21389`, `48830`, and `56054`. The existing Korean
already preserves the polite register at `18293`, conversational voice at
`18315`, the magical Well terminology at `18322`, the affirmative response
at `18371`, natural phrasing at `18398`, and conversational relief at
`18433`. The linked Well references were checked across languages; earlier
linked candidates `5329` and `5790` were not counted twice. No CSV or
fingerprint changed. Cumulative reconciliation is 984 / 4,015 (24.51%),
with 3,031 remaining. See
[`18250`-`18499`](dialogue-context-18250-18499-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-18250-18499-20261114.json).

The `18500`-`18749` reconciliation confirmed six corrections already present
and refined `18704` after comparing “pillars of character” with the Japanese
and Chinese readings of virtues/core qualities. It now reads
`우리를 이루는 덕목을 되새기러`; only `18704`'s Korean text and fingerprint
changed. The earlier hold on this metaphor is superseded. Cumulative
reconciliation is 991 / 4,015 (24.69%), with 3,024 remaining. See
[`18500`-`18749`](dialogue-context-18500-18749-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-18500-18749-20261114.json).

The `18750`-`18999` reconciliation checked 15 current candidates and linked
candidates `28142` and `47293`. It refined `18873` for natural meaning and
consistent plain speech; the other supported wording and name pairings were
already present. `18796` remains held because the choice's speech level lacks
direct context, and `18919` remains held pending runtime placeholder values.
Only `18873`'s Korean text and fingerprint changed. Cumulative reconciliation
is 1,008 / 4,015 (25.11%), with 3,007 remaining. See
[`18750`-`18999`](dialogue-context-18750-18999-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-18750-18999-20261114.json).

The `19000`-`19249` reconciliation checked 13 current candidates and linked
candidates `48309` and `53833`. The `Red` signature at `19089` now uses
`레드(Red)`, preserving both paragraph breaks. The other supported names,
terms, and wording were already present. `19022` remains held because the
intended sense of “culling” is unresolved; separate gender and Latin-spelling
questions at `19051`/`48309` remain unassigned. Cumulative reconciliation is
1,023 / 4,015 (25.48%), with 2,992 remaining. See
[`19000`-`19249`](dialogue-context-19000-19249-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-19000-19249-20261114.json).

The `19250`-`19499` reconciliation confirmed all 21 current candidates and
the linked `Century Flower 1` candidate at `57783`. The objective names,
dialogue wording, `Runere` pairing, letter signature, and multilingual place
and lore references are already correct in the current CSV. The related
`Century Flower` entries at `7989` and `9545` were reconciled earlier and
were not counted twice. No CSV or fingerprint changed. Cumulative
reconciliation is 1,045 / 4,015 (26.03%), with 2,970 remaining. See
[`19250`-`19499`](dialogue-context-19250-19499-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-19250-19499-20261114.json).

The `19500`-`19749` reconciliation checked all 25 current candidates and
rechecked six linked Khamazandu journal rows; all six had already been
reconciled in earlier batches and were not counted again. It changed the
shout at `19621` to `거기 서, 도적!`; the other supported corrections were
already present. `19561`'s `telling` and `19635`'s `barghest-tipping` remain
held as separate meaning questions. The later decision to distinguish
`Warden Bridge` from `Warden's Bridge` supersedes the older proposed Korean
wording at `19738`. Existing context holds at `19512`, `19590`, `19648`, and
`19658` remain open. The ledger fingerprint was refreshed only for `19621`.
Cumulative candidate reconciliation is 1,070 / 4,015 (26.65%), with 2,945
remaining. See
[`19500`-`19749`](dialogue-context-19500-19749-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-19500-19749-20261114.json).

The `19750`-`19999` reconciliation checked all 19 in-range candidates and
four linked `vagrants` candidates. The wording at `19779` was naturalized and
the missing `Beckry` pairing was added at `19811`; only those two fingerprints
were refreshed. `19766`'s `magical ordinance` remains held, as do the
evidence-limited items `19839`, `19897`, `19900`, and `19996`. Cumulative
candidate reconciliation is 1,093 / 4,015 (27.23%), with 2,922 remaining.
See
[`19750`-`19999`](dialogue-context-19750-19999-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-19750-19999-20261114.json).

The `20000`-`20249` reconciliation confirmed all 18 in-range candidates and
five linked candidates for `Blood Doge` and `Freehold`; all supported wording
was already present, so the CSV and fingerprints did not change. The 18
occurrences of `Freehold` consistently use `프리홀드(Freehold)`. Cumulative
candidate reconciliation is 1,116 / 4,015 (27.80%), with 2,899 remaining.
See
[`20000`-`20249`](dialogue-context-20000-20249-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-20000-20249-20261114.json).

The `20250`-`20499` reconciliation checked all 22 current candidates and the
linked candidate `42743`. `20258` had already been counted in the previous
range and was not counted twice; `20444` had been included in an earlier
duplicate-group check but not in the cumulative candidate tally, so it is
formally counted here. No CSV or fingerprint changed. Cumulative candidate
reconciliation is 1,138 / 4,015 (28.34%), with 2,877 remaining. See
[`20250`-`20499`](dialogue-context-20250-20499-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-20250-20499-20261114.json).

The `20500`-`20749` reconciliation checked all 10 current candidates.
Nine corrections were already present; `20671` was retained after English
and Japanese confirmed the current reading. `사그렐 부인(Lady Sagrell)`
remains distinct from the Hartwen-specific `여사` decision. No CSV or
fingerprint changed. Cumulative candidate reconciliation is 1,148 / 4,015
(28.59%), with 2,867 remaining. See
[`20500`-`20749`](dialogue-context-20500-20749-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-20500-20749-20261114.json).

The `20750`-`20999` reconciliation checked all 19 current candidates and
revisited four evidence-limited holds. Supported wording was already present
in the active Korean, including the Nanne formula terminology, the corrected
Kandrian forms, and the full `Maid of Windemere` title. `20866` remains
unchanged because the recorded `여사` decision is scoped to Hartwen rather
than a global translation for `Lady`. Candidate `20880` was previously
reviewed as a linked exact duplicate of `3099`, but was not included in the
candidate-ID tally. No CSV or fingerprint changed. Cumulative candidate
reconciliation is 1,167 / 4,015 (29.07%), with 2,848 not yet reconciled. See
[`20750`-`20999`](dialogue-context-20750-20999-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-20750-20999-20261114.json).

The `21000`-`21249` candidate reconciliation rechecked all 21 current
candidates and three separate evidence-limited holds. It verified the 18
earlier corrections and refined `default:21011` from `마법의 주인` to
`마법의 여왕`, supported by Japanese `魔法の女王`; only that ID's
fingerprint was refreshed. The 19 exact-English `Maire, Queen of Cups`
entries share one Korean title/name form. `21039` (`specimen`) and `21129`
(`The Watch`) remain held for insufficient context. Candidate reconciliation
is 1,188 / 4,015 (29.59%), with 2,827 not yet reconciled. See
[`21000`-`21249`](dialogue-context-21000-21249-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-21000-21249-20261114.json).

The `21250`-`21499` reconciliation rechecked 22 candidates, including the
previously counted `21389`. The active CSV contradicted the earlier edit
report for the Argine labels and Krast objectives; this pass corrected
26 Argine labels and both Krast objectives and refreshed only their
28 fingerprints. All 65,135 ledger fingerprints and 20 regression tests
passed. Candidate reconciliation is 1,209 / 4,015 (30.11%), with 2,806
remaining; the six separate evidence-limited holds remain open. See the
[`reconciliation report`](dialogue-context-21250-21499-candidate-reconciliation-20261114.md)
and [`decision manifest`](dialogue-context-final-edits-followup-21250-21499-20261114.json).

The `21500`-`21749` reconciliation checked all ten candidates. It corrected
the completed-action meaning at `21541` and clarified the attempted group
escape at `21589`; only those two ledger fingerprints were refreshed. The
rank `Private` and other evidence-limited questions remain open. Cumulative
candidate reconciliation is 1,219 / 4,015 (30.36%), with 2,796 remaining.
See the
[`reconciliation report`](dialogue-context-21500-21749-candidate-reconciliation-20261114.md)
and [`decision manifest`](dialogue-context-final-edits-followup-21500-21749-20261114.json).

The `21750`-`21999` candidate reconciliation checked 14 rows against the
active four-language tables and confirmed the previously applied corrections;
no new CSV edit was needed. The `22000`-`22249` range checked seven
candidates and likewise confirmed the current translations. Cumulative
reconciliation is 1,240 / 4,015 (30.86%), with 2,775 remaining. Evidence-
limited holds are documented separately. See the
[`21750`-`21999 report`](dialogue-context-21750-21999-candidate-reconciliation-20261114.md),
[`21750`-`21999 manifest`](dialogue-context-final-edits-followup-21750-21999-20261114.json),
[`22000`-`22249 report`](dialogue-context-22000-22249-candidate-reconciliation-20261114.md),
and [`22000`-`22249 manifest`](dialogue-context-final-edits-followup-22000-22249-20261114.json).

The `22250`-`22499` reconciliation checked 14 candidates and made two
follow-up edits. ID `22278` now follows the user's `base` weapon terms
(`장검, 대검, 망치`), correcting the older report's conflicting wording;
`22302` received a full-sentence naturalness correction. Only those two
fingerprints were refreshed. Cumulative reconciliation is 1,254 / 4,015
(31.26%), with 2,761 remaining; 11 evidence-limited holds remain separate.
See the
[`reconciliation report`](dialogue-context-22250-22499-candidate-reconciliation-20261114.md)
and [`decision manifest`](dialogue-context-final-edits-followup-22250-22499-20261114.json).

The `22500`-`22749` reconciliation verified all 21 candidates against the
active four-language tables and prior accepted edits; no additional CSV
change was needed. It also recorded the discrepancy between the older
`22579` edit report and the exact English title currently paired in the CSV.
Cumulative reconciliation is 1,275 / 4,015 (31.76%), with 2,740 remaining.
See the
[`reconciliation report`](dialogue-context-22500-22749-candidate-reconciliation-20261114.md)
and [`decision manifest`](dialogue-context-final-edits-followup-22500-22749-20261114.json).

The `22750`-`22999` reconciliation checked all 24 candidates against the
active four-language tables. The 22 supported prior corrections remain in
the CSV; `22815` and `22834` were already correct. No new edit or
fingerprint refresh was needed. Cumulative reconciliation is 1,299 / 4,015
(32.34%), with 2,716 remaining. See the
[`reconciliation report`](dialogue-context-22750-22999-candidate-reconciliation-20261114.md)
and [`decision manifest`](dialogue-context-final-edits-followup-22750-22999-20261114.json).

The `23000`-`23249` reconciliation verified all 14 candidates against the
active four-language tables and prior edits. `23199` had already been
counted in a linked-location review, so 13 new IDs were added without
double-counting. No new edit or fingerprint refresh was needed. Cumulative
reconciliation is 1,312 / 4,015 (32.69%), with 2,703 remaining. See the
[`reconciliation report`](dialogue-context-23000-23249-candidate-reconciliation-20261114.md)
and [`decision manifest`](dialogue-context-final-edits-followup-23000-23249-20261114.json).

The `23250`-`23499` reconciliation rechecked 19 candidates, ten of which
were newly counted; nine had been accounted for in previous linked reviews.
It refined `23499`'s father-to-son inheritance sentence and refreshed only
that fingerprint. Cumulative reconciliation is 1,322 / 4,015 (32.95%), with
2,693 remaining. See the
[`reconciliation report`](dialogue-context-23250-23499-candidate-reconciliation-20261114.md)
and [`decision manifest`](dialogue-context-final-edits-followup-23250-23499-20261114.json).

The `23500`-`23749` reconciliation confirmed all 12 active candidate rows.
Ten were newly counted; earlier candidate findings at `23635` and `23662`
were verified as resolved and not counted twice. No new edit was required.
Cumulative reconciliation is 1,332 / 4,015 (33.20%), with 2,683 remaining.
See the
[`reconciliation report`](dialogue-context-23500-23749-candidate-reconciliation-20261114.md)
and [`decision manifest`](dialogue-context-final-edits-followup-23500-23749-20261114.json).

The `23750`-`23999` reconciliation checked 20 candidates, counting 15 new
ones and excluding five previously counted IDs. It corrected `23942` after
finding that the active sentence still ambiguously said “his own name”;
only that ID's fingerprint was refreshed. Cumulative reconciliation is
1,347 / 4,015 (33.52%), with 2,668 remaining. See the
[`reconciliation report`](dialogue-context-23750-23999-candidate-reconciliation-20261114.md)
and [`decision manifest`](dialogue-context-final-edits-followup-23750-23999-20261114.json).

The `25250`-`25499` reconciliation checked all 29 candidate IDs against the
current English, Japanese, Chinese, and Korean rows and the existing
edit-batch report. Twenty candidates were newly counted; nine linked
candidates had already been counted. The active Korean contains the
supported corrections, including the linked `Chrysalae`, `Maisie's Luck`,
`Stowaway`, `great chamber`, Cloudcrest, Hollow, heartvine, and Sable
findings; the two evidence-limited items remain held. No CSV edit or
fingerprint refresh was needed. Cumulative reconciliation is 1,434 / 4,015
(35.74%), with 2,581 remaining. See
[`dialogue-context-25250-25499-candidate-reconciliation-20261114.md`](dialogue-context-25250-25499-candidate-reconciliation-20261114.md)
and [`dialogue-context-final-edits-followup-25250-25499-20261114.json`](dialogue-context-final-edits-followup-25250-25499-20261114.json).

The `25500`-`25749` reconciliation checked all 13 in-range candidates and
the linked duplicate candidate `58994`. It found that `25713` and `25742`
did not yet match their source-supported corrections, so both Korean rows
were fixed and only their fingerprints refreshed. `25595` was checked with
its three exact-English copies; the polite `37899` remains distinct from
the three casual versions. `58994` now agrees with `25576` and `63906`.
Thirteen new IDs were counted, bringing cumulative reconciliation to
1,447 / 4,015 (36.04%), with 2,568 remaining. See
[`dialogue-context-25500-25749-candidate-reconciliation-20261114.md`](dialogue-context-25500-25749-candidate-reconciliation-20261114.md)
and [`dialogue-context-final-edits-followup-25500-25749-20261114.json`](dialogue-context-final-edits-followup-25500-25749-20261114.json).

The `28500`-`28749` reconciliation checked all 13 current candidates.
Twelve were newly counted; `28676` had already been reconciled as a linked
`Hermit Smith` candidate. The previously applied corrections at `28570` and
`28650` were verified in the active CSV. The `28750`-`28999` reconciliation
checked eight candidates; seven were newly counted, while `28839` had
already been counted with the same linked title group. No additional CSV or
fingerprint edits were needed. Cumulative candidate reconciliation is now
1,668 / 4,015 (41.54%), with 2,347 not yet reconciled. See
[`28500`-`28749`](dialogue-context-28500-28749-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-28500-28749-20261114.json),
and
[`28750`-`28999`](dialogue-context-28750-28999-candidate-reconciliation-20261114.md)
with its
[`decision manifest`](dialogue-context-final-edits-followup-28750-28999-20261114.json).

The `29000`-`29249` reconciliation checked 17 candidates, including the
source-local Lupoku wording at `29213`; its earlier terminology scan had not
counted that candidate disposition. The prior correction at `29220` was
confirmed in the active CSV. The `29250`-`29499` reconciliation checked
eight additional candidates; all were already source-supported. No new CSV
or fingerprint edits were needed. Cumulative candidate reconciliation is
1,693 / 4,015 (42.17%), with 2,322 not yet reconciled. See
[`29000`-`29249`](dialogue-context-29000-29249-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-29000-29249-20261114.json),
and
[`29250`-`29499`](dialogue-context-29250-29499-candidate-reconciliation-20261114.md)
with its
[`decision manifest`](dialogue-context-final-edits-followup-29250-29499-20261114.json).

The `29500`-`29749` reconciliation checked all 13 candidates; their supported
wording was already present. The `29750`-`29999` reconciliation checked 26
candidates and confirmed the saved corrections at `29774`, `29808`, and
`29809`. The separate hold at `29826` remains unresolved. No new CSV or
fingerprint edits were needed. Cumulative candidate reconciliation is now
1,732 / 4,015 (43.14%), with 2,283 not yet reconciled. See
[`29500`-`29749`](dialogue-context-29500-29749-candidate-reconciliation-20261114.md)
and its
[`decision manifest`](dialogue-context-final-edits-followup-29500-29749-20261114.json),
and
[`29750`-`29999`](dialogue-context-29750-29999-candidate-reconciliation-20261114.md)
with its
[`decision manifest`](dialogue-context-final-edits-followup-29750-29999-20261114.json).

The candidate-level application/reconciliation follow-up has now been
recorded sequentially through `32250`-`32499`, reaching 1,913 / 4,015
candidates (47.65%) with 2,102 remaining. This is distinct from the
65,135-ID Stage 4 coverage: a full-corpus pass does not mean every
candidate has been source-adjudicated. The `31750`-`31999` pass counted 23
new candidates, `32000`-`32249` counted 19 including linked duplicate
`33619`, and `32250`-`32499` counted 13 including linked candidate `38453`.
Existing edit batches already contained the supported translations, so
these passes required no additional CSV edits. Reports and manifests are
linked in the audit README.

For the active `default` CSV, direct byte inspection found 71,838 CRLF,
244 LF-only, and zero bare-CR newline bytes. This does not match the
71,842-CRLF figure recorded in earlier edit-batch reports; the current
inventory was measured without rewriting the CSV. The review-ledger
fingerprint check, index/catalog reproduction checks, 11 CSV-preservation
tests, nine context-index tests, and CRLF-aware diff check passed.

Candidate-level reconciliation resumed at `46000` and now reaches
`47249`. The five sequential ranges `46000`-`46249`, `46250`-`46499`,
`46500`-`46749`, `46750`-`46999`, and `47000`-`47249` were compared against
the active Korean CSV and English, Japanese, and Chinese sources. This
reconciled 20, 7, 9, 7, and 12 new valid candidates respectively; five
cross-range items were not counted twice. Two misattributed false positives
(`46850`, `46998`) were cleared from the ledger, reducing the candidate pool
from 4,029 to 4,027. One Korean edit was required: `47052` now pairs the
welcome line with the established `별 야영지(Star Camp)` name. The cumulative
result is 3,183 / 4,027 (79.04%), with 844 remaining. Holds concerning
unsupported referents, name classification, and source conflicts remain
open. See the five reconciliation reports linked in the audit README.

Candidate reconciliation then covered `47250`-`47499`: all 14 current
candidate IDs were rechecked against the active four-language rows and prior
findings. Thirteen were newly counted; `47293` had already been counted as
a linked candidate. The full-sentence meaning at `47293` and item description
at `47447` were refined; the other supported candidate wording was already
present. Holds at `47280`, `47300`, and `47496` remain separate. Two Korean
rows and only their ledger fingerprints changed. The cumulative tally is
3,196 / 4,027 (79.36%), with 831 remaining. See the
[`reconciliation report`](dialogue-context-47250-47499-candidate-reconciliation-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-47250-47499-20261115.json).
The current CSV byte inventory is 71,839 CRLF, 242 LF-only, and zero bare-CR
separators; this supersedes the earlier 71,838/244 inventory above. The
two edits contain no embedded line breaks, and the preservation tool keeps
all bytes outside their target fields unchanged. No newline normalization
was performed.

The next candidate reconciliation covered `47500`-`47749`. Ten unique
candidates were newly counted and five linked candidates were not double
counted. It corrected `47742` to `브루누아스 동굴(Brunuath Hollow)` and
cleared the stale `47729` proposal because the current text already says the
assassin is weakened by battle. Holds `47508` and `47542` remain open. One
Korean row and its source fingerprint changed. The cumulative tally is
3,206 / 4,027 (79.61%), with 821 remaining. See the
[`reconciliation report`](dialogue-context-47500-47749-candidate-reconciliation-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-47500-47749-20261115.json).

The `47750`-`47999` reconciliation checked 20 current ledger candidates.
Ten were newly counted; ten linked candidates had already been reconciled.
All ten newly reviewed rows already contained the source-supported meaning,
name pairing, register, or objective form, so no translation or fingerprint
edit was needed. The old `47752` proposal is stale because the current row
already pairs `Arkes` and its ledger status is `not-issue`. Holds `47801` and
`47958` remain evidence limited. Candidate reconciliation now covers
3,216 / 4,027 IDs (79.86%), with 811 remaining. See the
[`reconciliation report`](dialogue-context-47750-47999-candidate-reconciliation-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-47750-47999-20261115.json).

The `48000`-`48249` pass rechecked 12 current ledger candidates; all were
already reconciled in the `46000`-`51999` application or linked-context
review, so none were counted twice. The source-supported translations
remain in the active CSV. `48231` stays held because the available languages
do not establish whether “The Messenger” is a name or a generic role.
Separate holds at `48015`, `48029`, `48053`, `48067`, and `48184` also
remain open. No translation or fingerprint edit was needed, and cumulative
reconciliation remains 3,216 / 4,027 (79.86%), with 811 remaining. See the
[`reconciliation report`](dialogue-context-48000-48249-candidate-reconciliation-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-48000-48249-20261115.json).

The `48250`-`48499` pass rechecked 16 current ledger candidates, all already
reconciled in prior application or linked-context reviews. Their supported
translations remain present, and no candidate was counted twice. The
`vagrants` wording at `48443` remains held for a group-level terminology
decision; other independent evidence-limited holds also remain open. No
translation or fingerprint edit was needed, so cumulative reconciliation
remains 3,216 / 4,027 (79.86%), with 811 remaining. See the
[`reconciliation report`](dialogue-context-48250-48499-candidate-reconciliation-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-48250-48499-20261115.json).

The `48500`-`48749` pass checked eight current candidates. Seven previously
reconciled translations remain supported. The `48700` Gryamar proposal was
cleared as a false positive because the exact source names Anela and Virki,
both already paired in Korean; only its ledger disposition changed. The
candidate pool is now 4,026, with 3,216 reconciled (79.88%) and 810
remaining. No translation or fingerprint changed. See the
[`reconciliation report`](dialogue-context-48500-48749-candidate-reconciliation-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-48500-48749-20261115.json).

The `48750`-`48999` pass rechecked 13 active candidates, all previously
reconciled in application or linked-context reviews. Four additional
sequential-review proposals are already `not-issue` in the ledger. The
supported names and terms are present, and the `48816` list layout remains
intact. No CSV or fingerprint change was needed; cumulative reconciliation
remains 3,216 / 4,026 (79.88%), with 810 remaining. See the
[`reconciliation report`](dialogue-context-48750-48999-candidate-reconciliation-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-48750-48999-20261115.json).

The `49000`-`49249` pass rechecked eight active candidates. All were
previously reconciled, and their supported translations remain present.
`49146` and `49196` are separately verified as corrected `not-issue` rows;
holds at `49018`, `49195`, and `49246` remain open. No CSV or fingerprint
change was needed, and the cumulative tally remains 3,216 / 4,026 (79.88%),
with 810 remaining. See the
[`reconciliation report`](dialogue-context-49000-49249-candidate-reconciliation-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-49000-49249-20261115.json).

The `49250`-`49499` pass newly reconciled eight candidates; `49479` was
already counted in the linked Sandstone Villa review. The current Korean
already contains the supported text, including the previously applied
`49259` follow-up, so no translation, ledger, or fingerprint edit was needed.
The tally is 3,224 / 4,026 (80.08%), with 802 remaining. See the
[`reconciliation report`](dialogue-context-49250-49499-candidate-reconciliation-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-49250-49499-20261115.json).

The `49500`-`49749` pass reconciled 12 new candidates; `49642`, `49700`, and
`49701` had already been counted in the earlier `46000`-`51999` application.
It corrected `49608`, reopened and corrected the source-meaning issue at
`49652`, and aligned `49692` with the confirmed Anira name/title form. Three
ledger fingerprints were refreshed. Progress is 3,236 / 4,026 (80.38%), with
790 remaining; the reopened `49652` is tracked separately because its prior
ledger disposition was `not-issue`. See the
[`reconciliation report`](dialogue-context-49500-49749-candidate-reconciliation-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-49500-49749-20261115.json).

The `49750`-`49999` pass reviewed all 21 sequential proposals. Fifteen
active candidates were newly reconciled; `49766` and `49949` were already
counted in linked reviews, and four proposals are already `not-issue`. All
supported wording remains present, including the 20 identical Irion title
labels. No CSV or fingerprint changed. Progress is 3,251 / 4,026 (80.75%),
with 775 remaining. See the
[`reconciliation report`](dialogue-context-49750-49999-candidate-reconciliation-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-49750-49999-20261115.json).

The `50000`-`50249` pass checked all 18 sequential-review proposals.
Fourteen active candidates were newly reconciled; `50073` had already been
counted in the linked Litany terminology review, while four proposals are
already `not-issue`. Current Korean contains the supported wording and
layout; no translation or fingerprint changed. Progress is 3,265 / 4,026
(81.10%), with 761 remaining. See the
[`reconciliation report`](dialogue-context-50000-50249-candidate-reconciliation-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-50000-50249-20261115.json).

The `50250`-`50499` pass rechecked all 13 sequential-review proposals and
newly reconciled ten active candidates. `50270`, `50445`, `50460`, and
`50475` were already counted in earlier linked reviews. Corrections at
`50342` and `50426` were applied after four-language comparison; other
supported wording was already present. Only those two rows' fingerprints
were refreshed, while unresolved crafting, voice, source-conflict, and lore
questions remain held. Progress is `3,275 / 4,026` (`81.35%`), with `751`
remaining. See the
[`reconciliation report`](dialogue-context-50250-50499-candidate-reconciliation-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-50250-50499-20261115.json).

The `50500`-`50749` pass rechecked all 11 sequential-review proposals.
Six active candidates were newly reconciled; `50572` and `50723` were
already counted, while `50506`, `50508`, `50710`, and `50725` are already
`not-issue`. The isolated place label at `50533` was aligned with the
established `허바르의 문턱(Hurvar's Doorsill)` spelling; only that row's
fingerprint changed. Evidence-limited holds remain open. Progress is
`3,281 / 4,026` (`81.50%`), with `745` remaining. See the
[`reconciliation report`](dialogue-context-50500-50749-candidate-reconciliation-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-50500-50749-20261115.json).

The `64000`-`64249` candidate reconciliation newly handled six candidates;
`64085` and `64167` were already reconciled and were not counted again.
Current Korean retains the previously applied corrections at `64054`,
`64074`, `64110`, `64193`, and `64240`, while `64234` already uses
`무기 교관`. A full `default` scan of the exact English role
`master-at-arms` found six inconsistent Korean renderings. IDs `17267`,
`19483`, `29235`, `31502`, `49162`, and `60558` were aligned to the
established `무기 교관`; their six ledger fingerprints were refreshed.
The full review ledger validates all 65,135 IDs, the index and catalogs
reproduce, 11 preservation tests and nine index tests pass, and the CSV
retains its BOM, row order, and existing CRLF/LF distribution. Candidate
reconciliation is `3,503 / 4,026` (`87.01%`), with `523` remaining. See the
[`candidate report`](dialogue-context-64000-64249-candidate-reconciliation-20261115.md).

The final four ranges contained 22 candidates: seven had already been
rechecked, and the other 15 are now reconciled. Six Korean rows changed:
`58374`, `64447`, `64722`, `64911`, `65109`, and `65134`. The player-choice
responses `58374` and `65109` now match `49860` as `돈을 낼게`, preserving
their runtime variable; `58374` was reopened because all three source
languages are identical, but was not counted twice. `64706` remains
`순회 대회`, supported by the fighters and Chinese tournament-circuit
wording. `64412` remains held because its referent is uncertain. Candidate
reconciliation's historical newly-counted tally was `3,518 / 4,026`
(`87.38%`); the `508` were not all unreviewed. The subsequent coverage audit
found documented dispositions for all 4,025 current candidates, with the
legacy `14325` flag excluded. See the
[`coverage accounting`](dialogue-context-candidate-coverage-accounting-20261115.md)
and the
[`final-range follow-up`](dialogue-context-candidate-reconciliation-followup-64250-65134-20261115.md).

A separate translation follow-up revalidated the earlier `64177` control
instruction change and retained its coordinated polite wording. At `64213`,
the title was corrected to the established `전쟁의 고대자(Ancient of War)`
and the full sentence was made more natural. Only `64213`'s Korean text and
ledger fingerprint changed; the existing ledger dispositions were preserved.
The 11 CSV-preservation tests, nine context-index tests, all 65,135 ledger
fingerprints, catalog checks, and CRLF-aware diff check passed. See the
[`translation follow-up`](dialogue-context-translation-followup-64177-64213-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-64177-64213-20261115.json).

The terminology follow-up rechecked `64033`, `64093`, `64107`, `64125`, and
`64231` against the source rows and established project terminology; their
current paired forms were retained. ID `64218` was clarified against all
three source languages: `Damalroc` and the repeated power-name `Sorrows` now
have English pairings, and “former members” clearly modifies the people, not
the House. Only its text and ledger fingerprint changed. All 65,135 ledger
fingerprints, both test suites, catalog reproduction, CSV line endings, and
the CRLF-aware diff check passed. See the
[`terminology follow-up`](dialogue-context-terminology-followup-64033-64231-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-64033-64231-20261115.json).

The remaining evidence follow-up confirmed the existing `Oathblade` rank
rendering (`64258`), preserved the source-supported Geoff/cape joke (`64341`),
and retained the stain/blotter wordplay in `64353`. `Higher` at `64252` remains
unresolved without its comparison target, and the antecedent in `64458` still
differs across the language sources. No text or ledger fingerprint changed;
these dispositions remain held where evidence is insufficient. See the
[`evidence-hold follow-up`](dialogue-context-evidence-hold-followup-64252-64458-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-64252-64458-20261115.json).

The `64001`-`64029` follow-up removed the unsupported “boast” implication at
`64018` (`sailor's yarn` → `뱃사람들의 이야기`) and revalidated the adjacent
holds against all language sources. `64017` remains held because its English
and Japanese leave the text untranslated while Chinese translates it; the
runtime/UI function is unknown. The other reviewed wording was retained where
the sources supported it or preserved ambiguity. Only `64018`'s text and
fingerprint changed; the ledger and catalog checks, both test suites, and
line-ending checks passed. See the
[`translation follow-up`](dialogue-context-translation-followup-64001-64029-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-64001-64029-20261115.json).

The next bounded pass corrected `64189` by pairing `Cranalt` and clarified
that the subjects believe their madness is related to the wizard's experiments.
At `64219`, `포룸` was aligned to the established `포럼(Forum)` and the journal
sentence was smoothed. Other source-comparable wording was retained; `64095`
remains held because the UI operation is unknown. Only IDs `64189` and
`64219` and their fingerprints changed. See the
[`translation follow-up`](dialogue-context-translation-followup-64047-64219-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-64047-64219-20261115.json).

ID `64117` also had its explicit `cousin` vocative restored as `사촌`. The
same English address at `54460` is rendered as `사촌` in Korean, with
Japanese and Chinese preserving a kinship/familiar address. The correction
does not infer a literal family relation, speaker, or order. Only `64117`'s
text and fingerprint changed; corpus validation passed. See the
[`translation follow-up`](dialogue-context-translation-followup-64117-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-64117-20261115.json).

The remaining findings from `64128`-`64246` were rechecked against all four
language rows. Existing terminology and sentence structure were retained
where supported; `64150`, `64151`, `64242`, and `64246` remain held because
the honorific, descriptive terms, credit context, or UI operation is not
settled by the sources. No translation, fingerprint, or ledger disposition
changed. See the
[`translation follow-up`](dialogue-context-translation-followup-64128-64246-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-64128-64246-20261115.json).

A later UI-context cross-check resolved the item-noun question at `64246`.
The Salvageable Items label now uses `분해 가능한 아이템`, matching its
Japanese source and the same term in the related salvage-screen instructions.
Only that Korean text and its `source_fingerprint` changed; the ledger's
prior disposition fields were preserved. See the
[`64246 translation follow-up`](dialogue-context-translation-followup-64246-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-64246-20261115.json).

A full-sentence review reopened `64458`: English and Japanese support that the
Fae are real in stories, while Chinese phrases it as their being right about
the matter. The Korean was changed from `이야기 속에서는 진실해` to
`이야기 속에서는 실재해`, with the source difference documented. Only this
row and its `source_fingerprint` changed. See the
[`64458 translation follow-up`](dialogue-context-translation-followup-64458-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-64458-20261115.json).

The honorific question at `64150` was rechecked across direct-address uses of
`Your Grace`: 44 of 55 Korean occurrences use `각하`; the English title and
Chinese `陛下` support retaining it here. This is usage evidence, not a global
normalization rule. The text, ledger, and fingerprint were unchanged. See the
[`64150 honorific follow-up`](dialogue-context-honorific-followup-64150-20261115.md).

A targeted reconciliation of stale final-edit manifests confirmed that
`40340`, `41255`, and `47099` retain the shared bilingual form used by all 26
exact-source `Argine, Queen of Staves` labels; `49692` retains the later
approved `마녀 기사 아니라(Anira)` form; and `65048` retains the selected
`무기 교관` rendering established by the 15-row `master-at-arms` scan. No
translation or ledger fingerprint changed. The contradictory `47099`
description in its range report was corrected. See the
[`manifest-conflict reconciliation`](dialogue-context-final-edit-manifest-conflicts-20261115.md).
