# Dialogue Context Group Index and Revalidation

- Date: 2026-11-10.
- Scope: reverse-map metadata and expanded character/quest revalidation.
- The active Korean CSV contains only scoped changes documented in the linked
  reports; source CSVs and extracted game assets remain unchanged.
- English controls meaning; Japanese is the primary style/register reference;
  Chinese is supporting evidence.
- The maintainable index and per-ID review ledger are described in
  [`dialogue-context-metadata.md`](dialogue-context-metadata.md).

## Candidate Application Progress (2026-11-15)

The `43000`-`43249` reconciliation rechecked all 28 range candidates and
linked exact-source mismatch `47222` with `43207`. Both Korean labels now
read `실(Syl)` without assigning an identity. All other supported corrections
were already present; one existing ledger row was reclassified from
uncertain to candidate. Candidate reconciliation is 2,882 / 4,028 (71.55%),
with 1,146 remaining. See the
[`reconciliation report`](dialogue-context-43000-43249-candidate-reconciliation-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-43000-43249-20261115.json).

The `43500`-`43749` reconciliation checked 25 current in-range candidates
and eight linked candidates. It corrected the register at `43585` and aligned
the repeated `The Humbled` title at `44258`; two Korean rows changed and
eight stale fingerprints were refreshed. Reconciliation reached
2,935 / 4,028 (72.86%), with 1,093 remaining. See
[`reconciliation report`](dialogue-context-43500-43749-candidate-reconciliation-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-43500-43749-20261115.json).

The `43750`-`43999` pass reconciled 18 current in-range candidates and linked
candidate `60899`. Six Korean rows changed: three archaic register forms, the
direct address at `43918`, and the Fire Sprite type/objective at
`43984`/`60899`. The current `Infrequent` wording at `43919` already matches
previously reconciled `14967`. Candidate reconciliation is 2,954 / 4,028
(73.34%), with 1,074 remaining. See
[`reconciliation report`](dialogue-context-43750-43999-candidate-reconciliation-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-43750-43999-20261115.json).

The `42750`-`42999` reconciliation rechecked all 26 range candidates and
three linked rows. It aligned the exact-source groups `27747`/`42851` and
`42812`/`54691`, standardized the remaining `Ticneri` spelling at `34443`,
and corrected the title pairing at `42899`. Four Korean rows changed, and
three linked IDs were added to the candidate pool. Candidate reconciliation
is 2,853 / 4,027 (70.85%), with 1,174 remaining. Seven evidence-limited
holds remain open. See
[`reconciliation report`](dialogue-context-42750-42999-candidate-reconciliation-20261115.md)
and
[`decision manifest`](dialogue-context-final-edits-followup-42750-42999-20261115.json).

The final four ranges contained 22 candidates: seven had already been
rechecked, and the other 15 are now reconciled. Six Korean rows changed:
`58374`, `64447`, `64722`, `64911`, `65109`, and `65134`. The player-choice
responses `58374` and `65109` now match `49860` as `돈을 낼게`, preserving
their runtime variable; `58374` was reopened because all three source
languages are identical, but was not counted twice. `64706` remains
`순회 대회`, supported by the fighters and Chinese tournament-circuit
wording. `64412` remains held because its referent is uncertain. Progress is
`3,518 / 4,026` (`87.38%`), with `508` remaining. See
[`follow-up report`](dialogue-context-candidate-reconciliation-followup-64250-65134-20261115.md).

## Latest Checkpoint

As of the `64000`-`64249` pass on November 13, the ledger records 64,496 of
65,135 IDs (99.02%), leaving 639. Sequential review reaches `64249`; next
is `64250`-`64499`. This pass rechecked 67 recorded IDs and added 183; the
new rows contain 138 `not-issue` dispositions, 43 evidence-limited holds,
and two correction candidates (`64193`, `64240`). Sixty exact-English
duplicate groups touch the range, covering 63 range rows and 1,385 corpus
rows, with matching Korean throughout. Six multiline rows contain 20
embedded breaks in every language; Korean's embedded CRLF separators are
preserved against LF source separators. Runtime-marker skeletons and order
match. Of 250 IDs, 197 have indexed asset associations, represented by 200
ID-asset links across 136 assets; 53 have none. Of the 183 new IDs, 130 are
linked by 133 associations across 79 assets; 53 are unlinked. Asset links do
not establish per-key speakers or playback order. See
[`dialogue-context-default-64000-64249-revalidation-20261113.md`](dialogue-context-default-64000-64249-revalidation-20261113.md).
Catalog/index reproduction, all ledger fingerprints, nine related tests, and
line-ending-aware diff checks passed. No translation CSV was modified.

The preceding sequential checkpoint was the `63750`-`63999` pass on November
13. At that point, the ledger recorded 64,313 of 65,135 IDs (98.74%), leaving
822; sequential review reached `63999`. That pass rechecked 73 recorded IDs
and added 177, with 45 evidence-limited holds and 132 `not-issue` results.
Twenty-one further hold questions at existing IDs remained report-only. The
exact-English `25576`/`58994`/`63906` Korean mismatch remained covered by its
existing candidate at `58994`. Fifty-seven exact-English duplicate groups
touched the range (59 range IDs; 1,225 corpus rows). Five multiline rows
contained 30 embedded breaks in each language; Korean's 30 embedded CRLF
separators were preserved against LF source separators. Placeholder order at
`63818` and localized-label order at `63868` remained unresolved. The
supported order at `63931` and Japanese-template order at `63998` were
preserved. Of 250 IDs, 194 had indexed asset associations, represented by
200 ID-asset links across 124 assets; 56 had none. Of the 177 new IDs, 121
were linked by 126 associations across 64 assets; 56 were unlinked. Asset
links do not establish per-key speakers or playback order. See
[`dialogue-context-default-63750-63999-revalidation-20261113.md`](dialogue-context-default-63750-63999-revalidation-20261113.md).
Catalog/index reproduction, all 64,313 ledger fingerprints, nine related
tests, and line-ending-aware diff checks passed. No translation CSV was
modified.

As of the `61250`-`61499` pass on November 13, the ledger records 62,499 of
65,135 IDs (95.95%), leaving 2,636. Sequential review reaches `61499`; next
is `61500`-`61749`. This pass rechecked 71 recorded IDs and added 179; seven
new-row candidates and one evidence-limited hold were recorded. Six existing
candidates and one existing hold were rechecked without rewriting their
append-only rows. Fifty-five exact-English duplicate groups touch the range,
covering 57 range IDs and 694 corpus rows. Korean matches within every group
except `Die, mortal!` (`54719`, `61482`), where Japanese also differs in
register. Three multiline rows contain seven embedded breaks in each
language, with matching per-row counts and blank-paragraph structure. Of 250
IDs, 202 have indexed asset associations, represented by 205 ID-asset links
across 127 assets; 48 have no indexed asset. Of the 179 new IDs, 131 are
linked by 134 associations across 72 assets; 48 are unlinked. Asset links do
not establish per-key speakers or playback order. See
[`dialogue-context-default-61250-61499-revalidation-20261113.md`](dialogue-context-default-61250-61499-revalidation-20261113.md).
Catalog/index reproduction, all 62,499 ledger fingerprints, nine related
tests, and line-ending-aware diff checks passed. No translation CSV was
modified.

The preceding `61000`-`61249` checkpoint recorded 62,320 of 65,135 IDs
(95.68%), leaving 2,815. That pass rechecked 44 recorded IDs and added 206;
eleven new-row candidates and 17 evidence-limited holds were recorded. Three
existing candidates were rechecked without rewriting their append-only rows;
three additional findings remain report-only. Sixty-seven exact-English
duplicate groups touched the range, covering 70 range IDs, and Korean
matched within every group. Fourteen multiline rows contained 79/85/82/85
embedded breaks across English/Japanese/Chinese/Korean; Korean break counts
followed Japanese at the two source-layout variations. Of 250 IDs, 181 had
indexed asset associations, represented by 186 ID-asset links across 116
assets; 69 had no indexed asset. Of the 206 new IDs, 137 were linked by 141
associations across 74 assets; 69 were unlinked. Asset links do not establish
per-key speakers or playback order. See
[`dialogue-context-default-61000-61249-revalidation-20261113.md`](dialogue-context-default-61000-61249-revalidation-20261113.md).
Catalog/index reproduction, all 62,320 ledger fingerprints, nine related
tests, and line-ending-aware diff checks passed. No translation CSV was
modified.

The preceding `60750`-`60999` pass recorded 62,114 of 65,135 IDs (95.36%)
and added 190 after rechecking 60 rows. Seven new-row candidates and four
holds were recorded; five existing candidates and two holds were rechecked.
See
[`dialogue-context-default-60750-60999-revalidation-20261113.md`](dialogue-context-default-60750-60999-revalidation-20261113.md).

Earlier, the `59750`-`59999` pass on November 13 recorded 61,368 of 65,135
IDs (94.22%), leaving 3,767. Sequential review reached `59999`; that pass
rechecked 60 recorded IDs and added 190, with ten new-row candidates and
three evidence-limited holds. Nine existing candidates were rechecked
without rewriting their append-only rows; three findings at existing IDs
remained report-only. Fifty-two exact-English duplicate groups touched the
range, covering 978 corpus rows; 54 range IDs participated and Korean
matched within each group. Six multiline rows contained 34 total embedded
breaks in each language. Marker identities matched; the language-specific
argument order at `59961` was preserved. Of 250 IDs, 200 had indexed asset
associations, represented by 207 ID-asset links across 128 assets; 50 had
no indexed asset. Of the 190 new IDs, 140 had indexed associations across
76 assets, and 50 did not. Asset links do not establish per-key speakers or
playback order. See
[`dialogue-context-default-59750-59999-revalidation-20261113.md`](dialogue-context-default-59750-59999-revalidation-20261113.md).
Catalog/index reproduction, all 61,368 ledger fingerprints, nine related
tests, and line-ending-aware diff checks passed. No translation CSV was
modified.

The preceding `59500`-`59749` pass recorded 61,178 of 65,135 IDs (93.92%)
and added 181 after rechecking 69 rows. It documented fourteen new-row
candidates, one new hold, and three report-only findings at existing IDs.
Its report is
[`dialogue-context-default-59500-59749-revalidation-20261113.md`](dialogue-context-default-59500-59749-revalidation-20261113.md).

The preceding `59250`-`59499` pass recorded 60,997 of 65,135 IDs (93.65%)
and added 183 after rechecking 67 rows. Its report is
[`dialogue-context-default-59250-59499-revalidation-20261113.md`](dialogue-context-default-59250-59499-revalidation-20261113.md).

The preceding `59000`-`59249` pass recorded 60,814 of 65,135 IDs (93.37%)
and added 176 after rechecking 74 rows. Fifteen new-row candidates and three
holds were recorded; ten existing candidates and two holds were rechecked.
See
[`dialogue-context-default-59000-59249-revalidation-20261113.md`](dialogue-context-default-59000-59249-revalidation-20261113.md).

An earlier November 13 checkpoint, `58750`-`58999`, recorded 60,638 of
65,135 IDs (93.10%) and added 181 after rechecking 69. It included 15 new-row
candidates and eight holds. See
[`dialogue-context-default-58750-58999-revalidation-20261113.md`](dialogue-context-default-58750-58999-revalidation-20261113.md).

The preceding `58250`-`58499` pass recorded 60,260 of 65,135 IDs (92.52%)
and added 194 after rechecking 56 rows. It documented ten new-row
correction candidates and nine evidence-limited questions; findings at four
existing IDs remained report-only. See
[`dialogue-context-default-58250-58499-revalidation-20261113.md`](dialogue-context-default-58250-58499-revalidation-20261113.md).

As of the preceding `56250`-`56499` pass on November 13, the ledger recorded
58,776 of 65,135 IDs (90.24%), leaving 6,359. Sequential review reached
`56499`; the next range was `56500`-`56749`. That pass rechecked 66 records
and added 184, recording five correction candidates and six evidence-limited
holds on new rows. Sixty exact-English duplicate groups touched the range,
covering 911 rows; Korean matched within every group. Four multiline rows
contained 18 embedded breaks per language. Of 250 IDs, 191 had indexed
asset associations, represented by 198 links across 129 assets; 59 had no
indexed asset. Asset links do not establish per-key speakers or playback
order. See
[`dialogue-context-default-56250-56499-revalidation-20261113.md`](dialogue-context-default-56250-56499-revalidation-20261113.md).
Catalog/index reproduction, all ledger fingerprints, nine related tests,
and line-ending-aware diff checks were reported passing; no translation CSV
was modified.

As of the preceding `53500`-`53749` pass on November 13, the ledger recorded
56,719 of 65,135 IDs (87.08%), leaving 8,416. Sequential review reached
`53749`; the next range was `53750`-`53999`. That pass rechecked 64 recorded
IDs and added 186; it had nine current correction candidates and five
evidence-limited holds. Sixty-eight exact-English duplicate groups touched
that range across the corpus, covering 69 target rows; Korean matched within
each group. Seven multiline rows contained 32 embedded breaks per language.
Of 250 IDs, 194 had indexed asset associations, represented by 195 links
across 125 assets; 56 had no indexed asset. Of the newly recorded IDs, 130
had indexed associations across 74 assets. The ledger then had 45,118
asset-linked and 11,601 unlinked IDs. Asset links do not establish per-key
speakers or playback order. See
[`dialogue-context-default-53500-53749-revalidation-20261113.md`](dialogue-context-default-53500-53749-revalidation-20261113.md).
Catalog/index reproduction, all ledger fingerprints, nine related tests,
and line-ending-aware diff checks passed. No translation CSV was modified.

## Earlier Checkpoints

As of the `51250`-`51499` pass on November 13, the ledger recorded 55,090 of
65,135 IDs (84.59%), leaving 10,045. Sequential review reached `51499`; next
was `51500`-`51749`. This pass rechecked 54 recorded IDs and added 196; it had
19 current correction-candidate IDs and three evidence-limited holds, with
228 IDs having no current finding. Fifty-five exact-English duplicate groups
touched the range across the corpus, covering 57 target rows; Korean matched
within every group. Eight multiline rows contained 54 embedded breaks per
language, and runtime/display marker identities and order matched. Of 250
IDs, 186 had indexed asset associations, represented by 188 ID-asset links
across 123 assets; 64 had no indexed asset. Of the newly recorded IDs, 132
had indexed associations and 64 did not. Asset links do not establish
per-key speakers or playback order. The ledger then had 43,943 asset-linked
and 11,147 unlinked IDs. See
[`dialogue-context-default-51250-51499-revalidation-20261113.md`](dialogue-context-default-51250-51499-revalidation-20261113.md).
Catalog/index reproduction, all ledger fingerprints, nine related tests,
and line-ending-aware diff checks passed. No translation CSV was modified.

As of the preceding `51000`-`51249` pass on November 13, the ledger recorded
54,894 of 65,135 IDs (84.28%), leaving 10,241. Sequential review reached
`51249`; that pass rechecked 61 recorded IDs and added 189. It had 17 current
correction-candidate IDs and six evidence-limited holds, with 227 IDs having
no current finding. Fifty-one exact-English duplicate groups touched the
range, covering 53 target rows; the sole Korean wording difference was
supported by a Japanese register difference. Three multiline rows contained
ten embedded breaks per language, and runtime/display marker identities and
order matched. Of 250 IDs, 211 had indexed asset associations, represented
by 214 ID-asset links across 133 assets; 39 had no indexed asset. Of the new
IDs, 150 had indexed associations and 39 did not. Asset links do not
establish per-key speakers or playback order. The ledger had 43,811
asset-linked and 11,083 unlinked IDs. See
[`dialogue-context-default-51000-51249-revalidation-20261113.md`](dialogue-context-default-51000-51249-revalidation-20261113.md).
Catalog/index reproduction, all ledger fingerprints, nine related tests,
and line-ending-aware diff checks passed. No translation CSV was modified.

As of the preceding `50750`-`50999` pass on November 13, the ledger recorded
54,705 of 65,135 IDs (83.99%), leaving 10,430. Sequential review reached
`50999`; the next range was `51000`-`51249`. That pass rechecked 60 recorded
IDs and added 190; it had 14 current correction-candidate IDs and four
evidence-limited holds, with 232 IDs having no current finding. Fifty-nine
exact-English duplicate groups touched the range across the corpus, covering
59 target rows; Korean matched within every group. Seven multiline rows
contained 26 embedded breaks per language, and runtime/display marker
identities and order matched. Of 250 IDs, 194 had indexed asset associations,
represented by 196 ID-asset links across 120 assets; 56 had no indexed
asset. Of the newly recorded IDs, 134 had indexed associations and 56 do
not. Asset links do not establish per-key speakers or playback order. The
ledger had 43,661 asset-linked and 11,044 unlinked IDs. See
[`dialogue-context-default-50750-50999-revalidation-20261113.md`](dialogue-context-default-50750-50999-revalidation-20261113.md).
Catalog/index reproduction, all 54,705 ledger fingerprints, nine related
tests, and line-ending-aware diff checks passed. No translation CSV was
modified.

As of the preceding `50500`-`50749` pass on November 13, the ledger recorded
54,515 of 65,135 IDs (83.70%), leaving 10,620. Sequential review reached
`50749`; the next range was `50750`-`50999`. That pass rechecked 64 recorded
IDs and added 186; it had 11 current correction-candidate IDs and eight
evidence-limited holds, with 231 IDs having no current finding. Fifty-two
exact-English duplicate groups touched the range across the corpus, covering
54 target rows; Korean matched within every group. Three multiline rows
contained seven embedded breaks per language, and runtime/display marker
identities and order matched. Of 250 IDs, 200 had indexed asset associations,
represented by 203 ID-asset links; 50 had no indexed asset. Of the newly
recorded IDs, 136 had indexed associations and 50 did not. Asset links do
not establish per-key speakers or playback order. The ledger had 43,527
asset-linked and 10,988 unlinked IDs. See
[`dialogue-context-default-50500-50749-revalidation-20261113.md`](dialogue-context-default-50500-50749-revalidation-20261113.md).
Catalog/index reproduction, all 54,515 ledger fingerprints, nine related
tests, and line-ending-aware diff checks passed. No translation CSV was
modified.

As of the preceding `50250`-`50499` pass on November 13, the ledger recorded
54,329 of 65,135 IDs (83.41%), leaving 10,806. Sequential review reached
`50499`; the next range was `50500`-`50749`. That pass rechecked 82 recorded
IDs and added 168; it had 13 current correction-candidate IDs and 13
evidence-limited holds, with four IDs in both groups and 228 IDs having no
current finding. Fifty-seven exact-English duplicate groups touched the
range across the corpus, with matching Korean within each; the only repeat
wholly in range (`50261`/`50453`) matched. Nine multiline rows contained 42
English, 42 Japanese, 41 Chinese, and 42 Korean breaks; malformed English
formatting at `50448` accounted for the one-break difference. Of 250 IDs,
198 had indexed asset associations, represented by 206 ID-asset links across
132 assets; 52 had no indexed asset. Of the newly recorded IDs, 116 had
indexed associations and 52 did not. Asset links do not establish per-key
speakers or playback order. The ledger had 43,391 asset-linked and 10,938
unlinked IDs. See
[`dialogue-context-default-50250-50499-revalidation-20261113.md`](dialogue-context-default-50250-50499-revalidation-20261113.md).
Catalog/index reproduction, all 54,329 ledger fingerprints, nine related
tests, and line-ending-aware diff checks passed. No translation CSV was
modified.

## Historical Checkpoints

As of the preceding `50000`-`50249` pass on November 13, the ledger recorded
54,161 of 65,135 IDs (83.15%), leaving 10,974. Sequential review reached
`50249`; the next range was `50250`-`50499`. That pass rechecked 69 recorded
IDs and added 181, with 18 current correction candidates and 232 IDs having
no current finding. Three exact-English duplicate pairs matched in Korean.
Five multiline rows contained 20 breaks in English, Chinese, and Korean and
24 in Japanese because of `50178`. Of 250 IDs, 204 had indexed asset
associations, represented by 211 ID-asset links across 132 assets; 135 of
the new IDs were linked. The ledger then had 43,275 asset-linked and 10,886
unlinked IDs. See
[`dialogue-context-default-50000-50249-revalidation-20261113.md`](dialogue-context-default-50000-50249-revalidation-20261113.md).
No translation CSV was modified.

As of the `48250`-`48499` pass on November 13, the ledger records 52,888 of
65,135 IDs (81.20%), leaving 12,247. Sequential review reaches `48499`; next
is `48500`-`48749`. This pass rechecked 81 recorded IDs and added 169; the
range has 20 current correction-candidate IDs and nine evidence-limited
holds, with `48309` in both groups and 222 IDs having no current finding.
Three exact-English duplicate groups touch the range and all match in Korean.
Seven multiline rows contain 55 breaks per language with matching
four-language counts; runtime/layout marker identities and order also match.
Of 250 IDs, 196 have indexed asset associations, represented by 202 ID-asset
links across 130 assets. Of the newly recorded IDs, 115 have indexed
associations and 54 do not; these links do not establish per-key speakers or
playback order. The ledger has 42,364 asset-linked and 10,524 unlinked IDs.
See
[`dialogue-context-default-48250-48499-revalidation-20261113.md`](dialogue-context-default-48250-48499-revalidation-20261113.md).
Catalog/index reproduction, all 52,888 ledger fingerprints, nine related
tests, and line-ending-aware diff checks remain to be run. No translation CSV
was modified.

As of the `47250`-`47499` pass on November 12, the ledger records 52,152 of
65,135 IDs (80.07%), leaving 12,983. Sequential review reaches `47499`; next
is `47500`-`47749`. This pass rechecked 55 recorded IDs and added 195; the
range has 14 current correction-candidate IDs and three evidence-limited
holds, while 233 IDs have no current finding. Three exact-English duplicate
groups touch the range and all match in Korean. Three multiline rows contain
11 breaks with matching four-language layouts; `47277` has a Korean
marker-order candidate. Of 250 IDs, 195 have indexed asset associations,
represented by 202 ID-asset links across 124 assets; seven IDs link to
multiple assets. These associations do not establish per-key speakers or
playback order. The ledger has 41,843 asset-linked and 10,309 unlinked IDs.
See
[`dialogue-context-default-47250-47499-revalidation-20261112.md`](dialogue-context-default-47250-47499-revalidation-20261112.md).
Catalog/index reproduction, all 52,152 ledger fingerprints, nine related
tests, and line-ending-aware diff checks passed. No translation CSV was
modified.

As of the preceding `47000`-`47249` pass on November 12, the ledger recorded
51,957 of 65,135 IDs (79.77%), leaving 13,178. Sequential review reached
`47249`; this pass rechecked 66 recorded IDs and added 184. It had ten current
correction candidates and four evidence-limited holds; the other 236 IDs had
no current finding. Sixty exact-English duplicate groups touched the range;
one Korean difference occurred in the `14591`/`47146` group. Six multiline
rows contained 15 Korean breaks, with two additional breaks at `47165`.
Of 250 IDs, 201 had indexed asset associations and 203 ID-asset links across
132 assets. See
[`dialogue-context-default-47000-47249-revalidation-20261112.md`](dialogue-context-default-47000-47249-revalidation-20261112.md).
No translation CSV was modified.

As of the preceding `46750`-`46999` pass on November 12, the ledger recorded
51,773 of 65,135 IDs (79.49%), leaving 13,362. Sequential review reached
`46999`; this pass rechecked 73 recorded IDs and added 177. It had six
supported correction-candidate IDs and 11 evidence-limited holds; `46789` had
both dimensions, while 234 IDs had no current finding. Fifty-nine
exact-English duplicate groups touched that range and covered 1,183 rows;
the two Korean differences followed Japanese register distinctions. Six
multiline rows contained 44 Korean breaks with matching four-language
counts; embedded Korean separators were CRLF. Of 250 IDs, 190 had indexed
asset associations, including 117 newly recorded IDs; these do not establish
per-key speakers or playback order. See
[`dialogue-context-default-46750-46999-revalidation-20261112.md`](dialogue-context-default-46750-46999-revalidation-20261112.md).
No translation CSV was modified.

As of the preceding `46500`-`46749` pass on November 12, the ledger recorded
51,596 of 65,135 IDs (79.22%), leaving 13,539. Sequential review reached
`46749`; this pass rechecked 62 recorded IDs and added 188. It had nine
supported correction-candidate IDs and seven evidence-limited holds;
`46732` had a separate name-form hold despite its historical disposition,
while 234 IDs had no current finding. Sixty exact-English duplicate groups
touched that range and covered 1,333 rows, with matching Korean within every
group. Seven multiline rows contained 24 Korean breaks with matching
four-language counts. Of 250 IDs, 200 had indexed asset associations,
including 138 newly recorded IDs. See
[`dialogue-context-default-46500-46749-revalidation-20261112.md`](dialogue-context-default-46500-46749-revalidation-20261112.md).
No translation CSV was modified.

As of the preceding `46250`-`46499` pass on November 12, the ledger recorded
51,408 of 65,135 IDs (78.93%), leaving 13,727. Sequential review reached
`46499`; next was `46500`-`46749`. That pass rechecked 60 recorded IDs and
added 190; it had six supported correction-candidate IDs and three
evidence-limited holds. `46314` had both dimensions, while 242 IDs had no
current finding. Sixty exact-English duplicate groups touched the range and
covered 1,092 rows, with matching Korean within every group. Four multiline
rows contained 13 Korean breaks with matching four-language counts; embedded
Korean separators were CRLF. Of 250 IDs, 205 had indexed asset associations,
including 145 newly recorded IDs; these do not establish per-key speakers or
playback order. The ledger then had 41,313 asset-linked and 10,095 unlinked
IDs. See
[`dialogue-context-default-46250-46499-revalidation-20261112.md`](dialogue-context-default-46250-46499-revalidation-20261112.md).
No translation CSV was modified in that batch.

As of the preceding `46000`-`46249` pass on November 12, the ledger recorded
51,218 of 65,135 IDs (78.63%), leaving 13,917. Sequential review reached
`46249`; next was `46250`-`46499`. That pass rechecked 78 recorded IDs and
added 172; it had 20 current correction-candidate IDs and two evidence-limited
holds. ID `46241` had both dimensions, while 229 IDs had no current finding.
Sixty-three exact-English duplicate groups covered 1,188 rows, with matching
Korean within every group. Two multiline rows contained 14 Korean breaks with
matching four-language counts; embedded Korean separators were CRLF. Of 250
IDs, 194 had indexed asset associations, including 116 newly recorded IDs.
The ledger then had 41,168 asset-linked and 10,050 unlinked IDs. See
[`dialogue-context-default-46000-46249-revalidation-20261112.md`](dialogue-context-default-46000-46249-revalidation-20261112.md).

As of the preceding `45750`-`45999` pass on November 12, the ledger recorded
51,046 of 65,135 IDs (78.37%), leaving 14,089. Sequential review reached
`45999`; next was `46000`-`46249`. That pass rechecked 54 recorded IDs and
added 196; it had 20 current correction-candidate IDs and five evidence-limited
holds, with 225 IDs having no current finding. Fifty-eight exact-English
duplicate groups covered 935 rows, with matching Korean within every group.
Three multiline rows contained seven Korean breaks with matching four-language
counts; embedded Korean separators are CRLF. Of 250 IDs, 189 had indexed asset
associations, including 135 newly recorded IDs; these do not establish
per-key speakers or playback order. The ledger then had 41,051 asset-linked
and 9,995 unlinked IDs. Catalog reproduction, all 51,046 ledger fingerprints,
nine related tests, and the line-ending-aware diff check passed. See
[`dialogue-context-default-45750-45999-revalidation-20261112.md`](dialogue-context-default-45750-45999-revalidation-20261112.md).
No translation CSV was modified.

As of the preceding `45500`-`45749` pass, the ledger recorded 50,850 of
65,135 IDs (78.07%), leaving 14,285. Sequential review reached `45749`; next
was `45750`-`45999`. That pass rechecked 63 recorded IDs and added 187; it
had eight current correction candidates and six evidence-limited holds, with
236 IDs having no current finding. Sixty-seven exact-English duplicate
groups covered 1,026 rows, with matching Korean within every group. Seven
multiline rows contained 27 Korean breaks, all matching the four-language
counts. Of 250 IDs, 193 had indexed asset associations, including 131 newly
recorded IDs. See
[`dialogue-context-default-45500-45749-revalidation-20261112.md`](dialogue-context-default-45500-45749-revalidation-20261112.md).

As of the preceding `45250`-`45499` pass, the ledger recorded 50,663 of
65,135 IDs (77.78%), leaving 14,472. Sequential review reached `45499`; next
was `45500`-`45749`. That pass rechecked 77 recorded IDs and added 173; it had
12 current correction candidates and 13 evidence-limited holds, with 225 IDs
having no current finding. Fifty-six exact-English duplicate groups covered
1,027 rows, with matching Korean within every group. Five multiline rows
contained 33 Korean breaks with matching four-language counts. Of 250 IDs,
193 had indexed asset associations, including 116 newly recorded IDs. See
[`dialogue-context-default-45250-45499-revalidation-20261112.md`](dialogue-context-default-45250-45499-revalidation-20261112.md).

As of the preceding `45000`-`45249` pass on November 12, the ledger recorded
50,490 of 65,135 IDs (77.52%), leaving 14,645. Sequential review reached
`45249`; next was `45250`-`45499`. This pass rechecked 72 records and added
178; it had 26 current correction candidates and eight evidence-limited
holds. `45102` had both dimensions, while 217 IDs had no current finding.
Sixty-one exact-English duplicate groups touched the range; the only Korean
variation followed Japanese's `Later, then.` distinction. Three multiline
rows contained six Korean breaks with matching four-language counts. Of 250
IDs, 192 had indexed asset associations, including 120 newly recorded IDs.
The ledger then had 40,669 asset-linked and 9,821 unlinked IDs. See
[`dialogue-context-default-45000-45249-revalidation-20261112.md`](dialogue-context-default-45000-45249-revalidation-20261112.md).

As of the preceding `44750`-`44999` pass on November 12, the ledger recorded
50,312 of 65,135 IDs (77.24%), leaving 14,823. Sequential review reached
`44999`; the next range was `45000`-`45249`. That pass rechecked 49 recorded
IDs and added 201; it had 40 current correction-candidate IDs and five
evidence-limited holds. `44964` had both dimensions; 206 IDs had no current
finding. Sixty-two exact-English duplicate groups covered 874 corpus rows,
with matching Korean within every group. Eight multiline rows contained 77
Korean breaks with matching English and Chinese layouts; Japanese had one
fewer break at `44827`. Of 250 IDs, 195 had indexed asset associations,
including 146 newly recorded IDs. Catalog reproduction, all 50,312 ledger
fingerprints, nine related tests, and the line-ending-aware diff check
passed. See
[`dialogue-context-default-44750-44999-revalidation-20261112.md`](dialogue-context-default-44750-44999-revalidation-20261112.md).
No translation CSV was modified in that batch.

As of the preceding `44000`-`44249` pass, the ledger recorded 49,758 of
65,135 IDs (76.39%), leaving 15,377. Sequential review reached `44249`; the
next range was `44250`-`44499`. That pass rechecked 66 recorded IDs and added
184; it had 28 current correction candidates and one evidence-limited hold,
with 221 IDs having no supported finding. The hold at `44238` was cleared
after confirming its Japanese source differs from duplicate-English ID
`27910`, and Korean follows that distinction; the older ledger row remains
unchanged as historical evidence. There were 60 exact-English duplicate
groups covering 1,207 corpus rows. In the eight-row `I'll be back tomorrow.`
group, Korean follows Japanese's polite/plain variants. Five multiline rows
contained 15 Korean breaks with matching four-language counts; embedded
Korean separators are CRLF. Of 250 IDs, 189 had indexed asset associations,
including 123 newly recorded IDs. Catalog reproducibility, all 49,758 ledger
fingerprints, nine related tests, and the line-ending-aware diff check
passed. See
[`dialogue-context-default-44000-44249-revalidation-20261112.md`](dialogue-context-default-44000-44249-revalidation-20261112.md).
No translation CSV was modified in this batch.

As of the preceding `43250`-`43499` pass, the ledger recorded 49,216 of
65,135 IDs (75.56%), leaving 15,919. Sequential review reached `43499`;
that pass rechecked 59 records and added 191, with 19 current correction
candidates, three evidence-limited holds, and 228 IDs with no supported
finding. Fifty-one exact-English duplicate groups covered 490 corpus rows,
with matching Korean within every group. Seven multiline rows contained 18
Korean breaks, all matching the four-language counts. Of 250 IDs, 198 had
indexed asset associations, including 139 newly recorded IDs. See
[`dialogue-context-default-43250-43499-revalidation-20261112.md`](dialogue-context-default-43250-43499-revalidation-20261112.md).

As of the preceding `42500`-`42749` pass, the ledger recorded 48,649 of
65,135 IDs (74.69%), leaving 16,486. That pass rechecked 66 records and added
184; it had 35 current correction candidates and seven evidence-limited
holds, with `42738` carrying both. Fifty-six exact-English duplicate groups
(1,475 corpus rows) touched the range. Eight multiline rows contained 64
embedded Korean breaks, all matching the four-language counts. Of 250 IDs,
192 had indexed asset associations. See
[`dialogue-context-default-42500-42749-revalidation-20261112.md`](dialogue-context-default-42500-42749-revalidation-20261112.md).
No translation CSV was changed.

As of the preceding `42250`-`42499` pass, the ledger recorded 48,465 of
65,135 IDs (74.40%), leaving 16,670. That pass rechecked 51 records and added
199, with 26 current correction candidates and six evidence-limited holds;
`42447` had both dispositions and 219 IDs had no supported finding. See
[`dialogue-context-default-42250-42499-revalidation-20261112.md`](dialogue-context-default-42250-42499-revalidation-20261112.md).
No translation CSV was changed.

As of the preceding `42000`-`42249` pass, the ledger recorded 48,266 of
65,135 IDs (74.10%), leaving 16,869. That pass rechecked 66 records and added
184, with 27 correction candidates and nine evidence-limited holds; `42176`
had both dispositions and 215 IDs had no supported finding. See
[`dialogue-context-default-42000-42249-revalidation-20261112.md`](dialogue-context-default-42000-42249-revalidation-20261112.md).
No translation CSV was changed.

As of the preceding `41750`-`41999` pass on November 12, the ledger recorded
48,082 of 65,135 IDs (73.82%), leaving 17,053. Sequential review reached
`41999`; that pass rechecked 63 recorded IDs and added 187, with 17 current
correction candidates and 16 evidence-limited holds. `41798` and `41999`
had both dispositions. Fifty-eight exact-English duplicate groups (1,397
corpus rows) touched that range, with matching Korean in every group. Four
multiline rows had matching four-language break counts (10 embedded Korean
breaks). Of 250 IDs, 199 had indexed asset associations. See
[`dialogue-context-default-41750-41999-revalidation-20261112.md`](dialogue-context-default-41750-41999-revalidation-20261112.md).
No translation CSV was changed.

As of the preceding `41500`-`41749` pass on November 12, the ledger recorded
47,895 of 65,135 IDs (73.53%), leaving 17,240. Sequential review reached
`41749`; that pass rechecked 67 recorded IDs and added 183, with 11 correction
candidates and one evidence-limited hold. Sixty-seven exact-English duplicate
groups (1,051 corpus rows) touched that range, with matching Korean in every
group. Six multiline rows had matching four-language break counts (20
embedded Korean breaks). Of 250 IDs, 201 had indexed asset associations.
See [`dialogue-context-default-41500-41749-revalidation-20261112.md`](dialogue-context-default-41500-41749-revalidation-20261112.md).
No translation CSV was changed.

As of the preceding `41250`-`41499` pass, the ledger recorded 47,712 of
65,135 IDs (73.25%), leaving 17,423. Sequential review reached `41499`; next
was `41500`-`41749`. That pass rechecked 74 recorded IDs and added 176; the
range had 21 correction candidates and six evidence-limited holds, with
`41271` carrying both dimensions. The other 224 IDs had no supported
finding. Fifty-one exact-English duplicate groups (956 corpus rows) touched
the range; Korean differed only at `30574`, `33784`, and `41405`, where
Japanese greetings supported the distinct wording. Seven multiline rows
had matching four-language break counts (21 embedded Korean breaks). Of 250
IDs, 210 had indexed asset associations. See
[`dialogue-context-default-41250-41499-revalidation-20261112.md`](dialogue-context-default-41250-41499-revalidation-20261112.md).
No translation CSV was changed.

As of the preceding `41000`-`41249` pass, the ledger recorded 47,536 of
65,135 IDs (72.98%), leaving 17,599. Sequential review reached `41249`; next
was `41250`-`41499`. That pass rechecked 59 records and added 191; it had 28
correction candidates and six evidence-limited holds, with `41178` carrying
both dimensions and 217 IDs having no supported finding. Fifty-nine
exact-English duplicate groups (1,182 corpus rows) touched the range, and
Korean matched within every group. Five multiline rows had matching
four-language break counts (17 embedded Korean breaks). All 250 IDs had
indexed asset associations. See
[`dialogue-context-default-41000-41249-revalidation-20261112.md`](dialogue-context-default-41000-41249-revalidation-20261112.md).
No translation CSV was changed.

As of the preceding `40750`-`40999` pass, the ledger recorded 47,345 of
65,135 IDs (72.68%), leaving 17,790. Sequential review reached `40999`; next
was `41000`-`41249`. That pass rechecked 67 recorded IDs and added 183; the
range had 15 correction candidates and 21 evidence-limited holds, while 214
IDs had no supported finding. Fifty-four exact-English duplicate groups
(1,435 corpus rows) touched the range; one Korean difference was supported by
Japanese distinguishing accepting a request from completing it. Three
multiline entries had matching four-language break counts (eight embedded
Korean CRLF breaks). At `40814`, Korean followed the English/Japanese control
order while Chinese placed its localized dodge label later. See
[`dialogue-context-default-40750-40999-revalidation-20261112.md`](dialogue-context-default-40750-40999-revalidation-20261112.md).
No translation CSV was changed.

As of the preceding `40500`-`40749` pass on November 12, the ledger recorded
47,162 of 65,135 IDs (72.41%), leaving 17,973. Sequential review reached
`40749`; next was `40750`-`40999`. That pass rechecked 67 records and added
183; the range had 31 correction candidates and five evidence-limited holds,
while 214 IDs had no finding. Fifty-seven exact-English duplicate groups
(1,646 corpus rows) matched in Korean. Five multiline entries had matching
four-language break counts (16 embedded Korean CRLF breaks). At `40544`,
Japanese ordered placeholders differently from English, Chinese, and Korean;
the localized wrapper payloads at `40546` remained intact. See
[`dialogue-context-default-40500-40749-revalidation-20261112.md`](dialogue-context-default-40500-40749-revalidation-20261112.md).
No translation CSV was changed.

As of the preceding `40250`-`40499` pass, the ledger recorded 46,979 of
65,135 IDs (72.13%), leaving 18,156. Sequential review reached `40499`; next
was `40500`-`40749`. That pass rechecked 75 records and added 175, recorded 25
correction candidates and four evidence-limited holds, and had 223 IDs with
no finding. Four exact-English duplicate groups (eight range rows) matched
in Korean. Six multiline entries had matching line-break counts. At `40303`,
English, Japanese, and Korean used the same placeholder order, while Chinese
differed. See
[`dialogue-context-default-40250-40499-revalidation-20261112.md`](dialogue-context-default-40250-40499-revalidation-20261112.md).
No translation CSV was changed.

As of the preceding `40000`-`40249` pass on November 12, the ledger recorded
46,804 of 65,135 IDs (71.86%), leaving 18,331. Sequential review reached
`40249`; this pass rechecked 69 recorded IDs and added 181. It has 19
correction candidates and five evidence-limited holds, with one ID carrying
both dimensions. Fifty-seven exact-English duplicate groups (1,133 corpus
rows) touched the range; the only Korean variation follows a Japanese
distinction between a mine and a landmine. Four multiline entries have
matching line-break counts. At `40191`, Korean preserves the English and
Chinese parameter order while Japanese reverses two placeholders. See
[`dialogue-context-default-40000-40249-revalidation-20261112.md`](dialogue-context-default-40000-40249-revalidation-20261112.md).
No translation CSV was changed.

## Previous Checkpoint

As of the `38750`-`38999` pass on November 12, the ledger recorded 45,881 of
65,135 IDs (70.44%), leaving 19,254. Sequential review reached `38999`; next
was `39000`-`39249`. This pass rechecked 62 recorded IDs and added 188; the
range had 27 overall candidates and 11 overall uncertain IDs. `38799` also
had a separate meaning hold while its overall disposition remained candidate.
See
[`dialogue-context-default-38750-38999-revalidation-20261112.md`](dialogue-context-default-38750-38999-revalidation-20261112.md).
No translation CSV was changed.

As of the `38500`-`38749` pass on November 12, the ledger recorded 45,693 of
65,135 IDs (70.15%), leaving 19,442. Sequential review reached `38749`; next
was `38750`-`38999`. This pass rechecked 69 recorded IDs and added 181; the
range had 21 candidate and two uncertain statuses. See
[`dialogue-context-default-38500-38749-revalidation-20261112.md`](dialogue-context-default-38500-38749-revalidation-20261112.md).
No translation CSV was changed.

As of the `38250`-`38499` pass on November 12, the ledger records 45,512 of
65,135 IDs (69.87%), leaving 19,623. Sequential review reaches `38499`; next
is `38500`-`38749`. This pass rechecked 54 recorded IDs and added 196; the
range has 12 candidate and six uncertain statuses. All 64 duplicate-English
groups touching the range have matching Korean. See
[`dialogue-context-default-38250-38499-revalidation-20261112.md`](dialogue-context-default-38250-38499-revalidation-20261112.md).
No translation CSV was changed.

As of the `38000`-`38249` pass on November 12, the ledger records 45,316 of
65,135 IDs (69.57%), leaving 19,819. Sequential review reaches `38249`; next
is `38250`-`38499`. The range rechecked 69 recorded IDs and added 181.
Fourteen IDs have candidate status and five have uncertain status, with
format candidates also documented for two uncertain IDs. Current text at
`38114` already resolves the prior name-pairing finding. See
[`dialogue-context-default-38000-38249-revalidation-20261112.md`](dialogue-context-default-38000-38249-revalidation-20261112.md).
The translation CSVs were not changed.

As of the `37750`-`37999` pass on November 12, the ledger records 45,135 of
65,135 IDs (69.29%), leaving 20,000. Sequential review reaches ID `37999`;
next is `38000`-`38249`. This pass rechecked 75 recorded IDs and added 175.
It records 19 candidate IDs and four evidence-limited holds; seven existing
candidates and one hold were retained, three entries were promoted to
candidates, and two to holds. Sixty-nine exact-English duplicate groups
(1,210 corpus rows) touch the range. Korean varies in two groups, with
Japanese differences supporting both. English, Chinese, and Korean have 17
embedded line breaks across four rows; Japanese has 19 because of two extra
breaks at `37797`. Runtime-token and markup inventories match, with Japanese
reversing the `{1}` / `{2}` order at `37980`. The catalogs were regenerated;
findings await separate approval and translation CSVs remain unchanged. See
[`dialogue-context-default-37750-37999-revalidation-20261112.md`](dialogue-context-default-37750-37999-revalidation-20261112.md).

As of the `34750`-`34999` pass on November 12, the ledger records 42,887 of
65,135 IDs (65.84%), leaving 22,248. Sequential review reaches `34999`; next
is `35000`-`35249`. This pass rechecked 72 recorded IDs and added 178. It
identified 20 new correction-candidate IDs and six new evidence-limited holds,
with three overlaps among new IDs. Two prior candidates were cleared; the
existing findings at `34866` and `34952` also received separate holds. The
range has 21 overall candidates, eight uncertain entries, and 221 not flagged.
Fifty-four exact-English duplicate groups (1,203 corpus rows) touch the range;
both Korean wording differences are supported by Japanese differences.
Per-row line-break and normalized token/markup signatures match across all
four languages. The catalogs were regenerated; findings await separate
approval and the translation CSV was not changed. See
[`dialogue-context-default-34750-34999-revalidation-20261112.md`](dialogue-context-default-34750-34999-revalidation-20261112.md).

The preceding `33000`-`33249` pass on November 12 recorded 41,601 of
65,135 IDs (63.87%), leaving 23,534. Sequential review reached `33249`; next
was `33250`-`33499`. That pass rechecked 49 recorded IDs and added 201.
Thirteen new correction candidates were identified, with four new
evidence-limited holds; the pre-existing `not-issue` at `33096` was promoted
to a hold. Fifty-seven exact-English duplicate groups (1,031 corpus rows)
touch that range, with no divergent Korean text. Korean line-break counts
match English and Japanese, with one Chinese-only difference at `33089`.
The catalogs were regenerated; findings awaited separate approval and the
translation CSV was not changed. See
[`dialogue-context-default-33000-33249-revalidation-20261112.md`](dialogue-context-default-33000-33249-revalidation-20261112.md).

At the preceding `31500`-`31749` pass on November 12, the ledger recorded
40,455 of 65,135 IDs (62.10%), leaving 24,680. Sequential review reached
`31749`; this pass rechecked 71 recorded IDs and added 179. Nine new
correction candidates and two evidence-limited holds were recorded; four
existing candidates and one hold remained. Sixty-four exact-English
duplicate groups (1,206 corpus rows) touched that range. The only Korean
variation was `31562` / `55044`, where Japanese also differed. Per-row newline
counts and normalized runtime/layout-token and markup sequences matched
across all four languages; 14 Korean CRLF breaks were preserved. The catalogs
were regenerated; findings awaited separate approval and the translation
CSV was not changed. See
[`dialogue-context-default-31500-31749-revalidation-20261112.md`](dialogue-context-default-31500-31749-revalidation-20261112.md).

At the preceding `31250`-`31499` pass, the ledger recorded 40,276 of 65,135
IDs (61.83%), leaving 24,859. Sequential review reached `31499`; the
`31250`-`31499` pass rechecked 71 recorded IDs and added 179. Thirteen
additional candidates were identified: 11 on new IDs and two pre-existing
`not-issue` entries promoted to candidates. Eight earlier candidates and two
evidence-limited holds remained open. Fifty-seven exact-English duplicate
groups (1,141 corpus rows) touched that range; the only Korean variation was
the `Later.` group at `31385`, `38762`, and `48513`, where Japanese also
differed. Per-row newline counts and normalized runtime/layout-token and
markup sequences matched across all four languages. The catalogs were
regenerated; findings awaited separate approval and the translation CSV was
not changed. See
[`dialogue-context-default-31250-31499-revalidation-20261112.md`](dialogue-context-default-31250-31499-revalidation-20261112.md).

At the preceding `31000`-`31249` pass, the ledger recorded 40,097 of 65,135
IDs (61.56%), leaving 25,038. Sequential review reached `31249`; the
`31000`-`31249` pass rechecked 79 recorded IDs and added 171. Eleven
candidates were recorded among the new IDs, one with an evidence-limited
hold; existing `31002` and `31060` were promoted to candidates, and `31085`
was cleared. The range ended with 21 candidates and one hold. Sixty-nine
exact-English duplicate groups (1,402 corpus rows) matched in Korean;
newline counts and normalized runtime/layout-token sequences matched across
all four languages. The cove/cave source divergence at `31072` is held. The
catalogs were regenerated; findings awaited separate approval and the
translation CSV was not changed. See
[`dialogue-context-default-31000-31249-revalidation-20261112.md`](dialogue-context-default-31000-31249-revalidation-20261112.md).

## Earlier November 12 Checkpoint

At that checkpoint the review ledger contained 32,913 unique `default` IDs with
four-language fingerprints: 50.53% of all 65,135 IDs, leaving 32,222
unreviewed. Sequential full-corpus review reaches ID `21499`; the next range
is `21500`-`21749`. The `21250`-`21499` pass checked 61 existing fingerprints,
added 189 IDs, retained five candidates, cleared one, and recorded 17 new
correction findings plus six evidence-limited holds affecting six IDs.
Fifty-nine exact-English duplicate groups (1,112 corpus rows) match in Korean,
and line-break counts match in all four languages. The Japanese marker-order
exception at `21488` is documented. No translation CSV changed. See
[`dialogue-context-default-21250-21499-revalidation-20261112.md`](dialogue-context-default-21250-21499-revalidation-20261112.md).

The preceding `21000`-`21249` pass checked 58 existing fingerprints, added
192 IDs, retained three existing candidates and one hold, reclassified one
row as a candidate, and recorded 17 findings affecting 18 IDs plus three
holds. The ledger then stood at 32,724 / 65,135 (50.24%). No translation CSV
changed. See
[`dialogue-context-default-21000-21249-revalidation-20261112.md`](dialogue-context-default-21000-21249-revalidation-20261112.md).

## November 11 Checkpoint

At that checkpoint the review ledger contained 28,841 unique `default` IDs with
four-language fingerprints: 44.28% of all 65,135 IDs, leaving 36,294
unreviewed. Of the reviewed IDs, 25,433 have at least one indexed quest asset
link and 3,408 have no indexed link. There are 51,080 asset-linked IDs total;
that is a separate context-link measure, not the denominator for overall
re-review progress. The asset catalog records complete ledger coverage for
285 of 426 assets with linked IDs and partial coverage for 141; all matched
assets now have at least one ledger entry. The remaining 104 assets have no
linked `default` IDs. The catalogs cover all 530 extracted quest assets and
all 65,135 `default` IDs. Step 4 remains in progress.

The latest sequential range, `15750`-`15999`, checked 56 existing
fingerprints and added 194 records. It records two correction candidates and
17 evidence-limited holds; existing IDs `15794`, `15846`, and `15902` were
reclassified in place. Fifty-six exact-English duplicate groups (641 corpus
rows) were checked; the one Korean difference is supported by ID-specific
context. Line-break and runtime/layout-token signatures match across all
four languages, and 25 embedded Korean CRLF breaks were preserved. No
translation CSV changed. See
[`dialogue-context-default-15750-15999-revalidation-20261111.md`](dialogue-context-default-15750-15999-revalidation-20261111.md).

An earlier continuation covered IDs `8500`-`9749`, preserving 335 existing
records and adding 915 reviewed four-language records. The five reports
record 82 correction-candidate IDs and 49 IDs with evidence-limited findings
(six overlap). They distinguish source-token/brace anomalies from
translation errors and identify speakers only where supported by direct
evidence. Jubal Caledus (`8845`), Simeon Crowe (`8970`), and Ambassador
Jeanne Jorielle (`9314`) are explicit self-identifications; `9131` identifies
only the Elund office, and `9488` records the user's in-game attribution for
Brother Edwin. No CSV changed. Reports:
[`8500`-`8749`](dialogue-context-default-08500-08749-revalidation-20261111.md),
[`8750`-`8999`](dialogue-context-default-08750-08999-revalidation-20261111.md),
[`9000`-`9249`](dialogue-context-default-09000-09249-revalidation-20261111.md),
[`9250`-`9499`](dialogue-context-default-09250-09499-revalidation-20261111.md),
[`9500`-`9749`](dialogue-context-default-09500-09749-revalidation-20261111.md).

An earlier continuation covered IDs `10500`-`10999`, preserving 117 existing
records and adding 383 reviewed four-language records. The two reports record
21 correction-candidate IDs and 16 evidence-limited findings, with no overlap
within either range. For `10750`-`10999`, 138 new IDs have indexed asset
links and 57 do not; five IDs link to multiple assets. Three exact-English
duplicate groups (486 rows across the corpus) match in Korean. No translation
CSV changed. Reports:
[`10500`-`10749`](dialogue-context-default-10500-10749-revalidation-20261111.md)
and
[`10750`-`10999`](dialogue-context-default-10750-10999-revalidation-20261111.md).
At that checkpoint, `11000`-`11249` was next.

The latest sequential continuation compared IDs `11750`-`11999` across all
four languages, retaining 78 existing records and adding 172 new records.
Five correction candidates and four evidence-limited findings were recorded.
Thirty-four exact-English duplicate groups (734 rows across the corpus) all
match in Korean. Placeholder, runtime/layout-token, brace, and wrapper
signatures match; Chinese has one fewer line break than English, Japanese,
and Korean at `11821`. Of the new records, 118 have indexed asset links and
54 do not; three IDs link to multiple assets. Ten Korean strings contain 48
existing embedded CRLF breaks, all preserved. No individual speaker or
playback order was inferred. No translation CSV or extracted game asset
changed. The next range is `12000`-`12249`. See
[`dialogue-context-default-11750-11999-revalidation-20261111.md`](dialogue-context-default-11750-11999-revalidation-20261111.md).

The preceding sequential continuation compared IDs `11500`-`11749` across
all four languages, retaining 63 existing records and adding 187 new records.
Three correction candidates and four evidence-limited findings were recorded,
with `11599` in both groups. Forty-three exact-English duplicate groups
(665 rows across the corpus) all match in Korean; runtime/layout-token and
line-break signatures match in all four languages. Of the new records, 136
have indexed asset links and 51 do not; five IDs link to multiple assets. Six
Korean strings contain 30 existing embedded CRLF breaks, all preserved.
Direct textual self-identification supports Sister Twayn at `11691`; no
playback order was inferred. No translation CSV or extracted game asset
changed. See
[`dialogue-context-default-11500-11749-revalidation-20261111.md`](dialogue-context-default-11500-11749-revalidation-20261111.md).

The preceding sequential continuation compared IDs `11250`-`11499` across
all four languages, retaining 61 existing records and adding 189 new records.
Four correction candidates and eight evidence-limited findings were recorded.
Forty-three exact-English duplicate groups (405 rows across the corpus) all
match in Korean; runtime/layout-token and line-break signatures match in all
four languages. Of the new records, 130 have indexed asset links and 59 do
not; 11 IDs link to multiple assets. Seven Korean strings contain 23 existing
embedded CRLF breaks, all preserved. Direct self-identification supports only
Jakasen at `11254` and Templar Tancese at `11256`; the letter signature at
`11271` identifies its author but is not treated as dialogue-speaker evidence.
No translation CSV or extracted game asset changed. See
[`dialogue-context-default-11250-11499-revalidation-20261111.md`](dialogue-context-default-11250-11499-revalidation-20261111.md).

The preceding full-corpus pass compared IDs `8250`-`8499` across English,
Japanese, Chinese, and Korean, adding 170 previously unrecorded IDs; the
other 80 already had current ledger records. It recorded five correction
candidates and one evidence-limited hold. Forty-one exact-English duplicate
groups touching the range (1,017 rows) match in Korean. Logical line-break
counts and runtime/layout-token identities match across the four languages.
Four Korean strings contain 13 existing CRLF embedded breaks. Of the 170 new
IDs, 114 have indexed quest-asset links and 56 do not. No translation CSV was
changed. See
[`dialogue-context-default-08250-08499-revalidation-20261111.md`](dialogue-context-default-08250-08499-revalidation-20261111.md).

The preceding full-corpus pass compared IDs `8000`-`8249` across English,
Japanese, Chinese, and Korean, adding 179 previously unrecorded IDs; the
other 71 already had current ledger records. It recorded eight correction
candidates and three evidence-limited holds. Sixty-five exact-English
duplicate groups touching the range (1,547 rows) match in Korean. Logical
line-break counts and runtime/layout-token identities match across the four
languages; placeholder positions vary as expected at `8077` and `8127`. Six
Korean strings contain 21 existing CRLF embedded breaks. Of the 179 new IDs,
127 have indexed quest-asset links and 52 do not. No translation CSV was
changed. See
[`dialogue-context-default-08000-08249-revalidation-20261111.md`](dialogue-context-default-08000-08249-revalidation-20261111.md).
The preceding `3000`-`3249` range added 179 IDs, 16 candidates, and one
evidence-limited hold; see
[`dialogue-context-default-03000-03249-revalidation-20261111.md`](dialogue-context-default-03000-03249-revalidation-20261111.md).
The preceding range `2750`-`2999` added 183 IDs, seven candidates, and five
holds; see
[`dialogue-context-default-02750-02999-revalidation-20261111.md`](dialogue-context-default-02750-02999-revalidation-20261111.md).
The preceding range `2500`-`2749` added 195 IDs, 13 correction candidates,
and five holds; see
[`dialogue-context-default-02500-02749-revalidation-20261111.md`](dialogue-context-default-02500-02749-revalidation-20261111.md).
The preceding range `2250`-`2499` added 178 IDs, six candidates, and four
holds; see
[`dialogue-context-default-02250-02499-revalidation-20261111.md`](dialogue-context-default-02250-02499-revalidation-20261111.md).

The preceding asset-group continuation added 103 reviewed IDs from `1382473.quest_bxml`,
with 14 correction candidates and four holds. `22764` directly identifies
its speaker as Brun; other speakers and playback order remain unassigned.
No translation CSV was changed. See the
[SQ114 report](dialogue-context-1382473-sq114-brun-revalidation-20261111.md).

The preceding continuation added 102 reviewed IDs from `576353.quest_bxml`,
with 23 correction candidates and three holds. The `46969` English/Japanese
conflict about whether the apprentice could repair the sword remains on hold.
No translation CSV was changed. See the
[SQ46 report](dialogue-context-576353-sq46-master-touch-revalidation-20261111.md).

The preceding continuation added 102 reviewed IDs from `2026652.quest_bxml`,
with seven correction candidates and three holds (one overlap). Ollie's
job-title convention remains unresolved, and the source does not establish
which of the brothers is older. No translation CSV was changed. See the
[Ollie training report](dialogue-context-2026652-dlc1-ph07b-ollie-training-revalidation-20261111.md).

The preceding continuation added 101 reviewed IDs from `1262645.quest_bxml`,
with ten correction candidates and eight holds (one overlap). Conflicting
prior decisions for Herc's Warden title remain unresolved. No translation
CSV was changed. See the [SQ77 report](dialogue-context-1262645-sq77-building-bridges-revalidation-20261111.md).

The preceding continuation added 100 reviewed IDs from `507502.quest_bxml`,
with 19 correction candidates and three holds (one overlap). Its `SA08`
handler prefix does not establish per-key speaker or order. No translation
CSV was changed. See the [SA08 report](dialogue-context-507502-sa08-revalidation-20261111.md).

The preceding continuation added 292 reviewed IDs across three complete assets:
`521918` (97 IDs, 15 candidates), `611613` (97 IDs, 26 candidates), and
`731979` (98 IDs, six candidates). Eleven IDs have unresolved findings,
including five that also have a correction candidate. The reports keep
source conflicts, ranks, and unsupported speech-level changes on hold. Only
`24356` explicitly identifies its speaker as General Fynn. No playback order
was inferred and no translation CSV was changed. See the
[SQ13](dialogue-context-521918-sq13-antelope-revalidation-20261111.md),
[SQ66](dialogue-context-611613-sq66-lost-squad-revalidation-20261111.md),
and [Menetyre](dialogue-context-731979-menetyre-revalidation-20261111.md)
reports.

The preceding continuation added 380 reviewed IDs across four complete assets:
`1695875` (92 IDs, 11 correction candidates), `529073` (94 IDs, three
candidates), `1458189` (97 IDs, 15 candidates), and `501490` (97 IDs, 13
candidates). The reports record 29 IDs with unresolved findings, including
four that also have a correction candidate. Source conflicts, personal
Templar titles, and ungrounded register changes remain on hold. Textual
self-identification supports only `23836` (Lord Cras) and `30490` (Ruhnir
Wesnon); no playback order was inferred. No translation CSV was changed.
See the [SQ152](dialogue-context-1695875-sq152-under-watch-revalidation-20261111.md),
[SQ11](dialogue-context-529073-sq11-culn-revalidation-20261111.md),
[SQ122](dialogue-context-1458189-sq122-tidings-war-revalidation-20261111.md),
and [TR07](dialogue-context-501490-tr07-missives-revalidation-20261111.md)
reports.

Coverage was reconciled against actual reverse-index membership rather
than nonempty `linked_assets` text. Supplemental IDs are `1691`, `18005`,
`31283`, and `47041`; the last uses the sentinel `no_quest_asset_match`,
not an asset filename. The earlier three-supplemental/15,370-linked
checkpoint overcounted linked coverage by one; none of those review records
was deleted or reclassified as a completed asset.

The next wholly unrecorded asset in ascending matched-ID count is
`1946261.quest_bxml` (103 IDs); no linguistic review is claimed for it yet.
The latest continuation preserved the existing 15,753 ledger records and
left the active base/default CSV SHA-256 values unchanged.

Continuation validation passed: generator `--check` (reverse index and both
catalogs), `--check-review-ledger` (15,753 fingerprints at that checkpoint), all nine
`test_build_dialogue_context_index.py` tests, and
`git -c core.whitespace=cr-at-eol diff --check`. These are metadata and
structural checks, not independent linguistic approval of the candidates.

The latest revalidation covers all 89 IDs linked to `583289.quest_bxml`,
adding them to the ledger and recording 11 correction-candidate IDs. Its 15
NPC symbols and 43 `HV07`-prefixed handlers do not map IDs to individual
speakers or playback order; there is no explicit `QUEST_ID`. Five
exact-English duplicate groups matched in Korean, and all four-language
format signatures passed. No translation CSV was changed. See
[`dialogue-context-583289-hv07-arena-revalidation-20261111.md`](dialogue-context-583289-hv07-arena-revalidation-20261111.md).

The latest revalidation covers all 89 IDs linked to
`1993963.quest_bxml`, adding all 89 to the ledger and recording seven
correction candidates and one evidence-limited hold. Its 39 `DLC1_SQ08`-
prefixed handlers are only a quest clue; the asset has no explicit quest ID
or NPC symbol and does not map individual IDs to speakers or playback order.
Five exact-English duplicate groups matched in Korean, and all four-language
format signatures passed. No translation CSV was changed. See
[`dialogue-context-1993963-dlc1-sq08-tari-holstig-revalidation-20261111.md`](dialogue-context-1993963-dlc1-sq08-tari-holstig-revalidation-20261111.md).

The latest revalidation covers all 89 IDs linked to
`1521231.quest_bxml`, adding all 89 to the ledger and recording seven
correction candidates plus three evidence-limited hold IDs. Its `SQ127`
handler prefix is only a quest clue; the asset has no explicit quest ID or
NPC symbol and does not map IDs to speakers or playback order. Two
exact-English duplicate groups matched in Korean, and all four-language
format signatures passed. No translation CSV was changed. See
[`dialogue-context-1521231-sq127-malicious-practices-revalidation-20261111.md`](dialogue-context-1521231-sq127-malicious-practices-revalidation-20261111.md).

The latest revalidation covers all 89 IDs in `1632212.quest_bxml` (`SQ149`),
adding them to the ledger and recording eight correction candidates and
three evidence-limited holds. Its two NPC symbols and 37 dialogue handlers
do not map individual keys to speakers or playback order. ID `2835`
explicitly self-identifies Gwalchmai; no other per-key speaker was assigned.
Four exact-English duplicate groups matched in Korean, and all
four-language format signatures passed. No translation CSV was changed. See
[`dialogue-context-1632212-sq149-mixing-business-revalidation-20261111.md`](dialogue-context-1632212-sq149-mixing-business-revalidation-20261111.md).

The latest revalidation covers all 87 IDs in `630966.quest_bxml`, adding them
to the ledger and recording 18 correction candidates and one evidence-limited
hold. Its 41 `SQ65`-prefixed handlers provide only a quest clue; no explicit
quest ID, NPC symbol, per-key handler mapping, or playback order was found.
The two explicit first-person self-identifications support attribution of
IDs `25627` to Ordo and `25732` to Maura Chalin. Two exact-English duplicate
groups matched in Korean, and all four-language format signatures passed.
No translation CSV was changed. See
[`dialogue-context-630966-sq65-maura-ordo-revalidation-20261111.md`](dialogue-context-630966-sq65-maura-ordo-revalidation-20261111.md).

The latest revalidation covers all 86 IDs in `440729.quest_bxml`, adding them
to the ledger. Thirteen correction-candidate IDs and 12 evidence-limited holds
were recorded, with six IDs in both groups. Its `SQ04` handler prefix is only
a quest clue; the asset has no explicit quest ID or NPC symbol, so no
per-key speaker or dialogue order was inferred. Two exact-English duplicate
groups matched in Korean, and all four-language format signatures passed.
No translation CSV was changed. See
[`dialogue-context-440729-sq04-flowering-revalidation-20261111.md`](dialogue-context-440729-sq04-flowering-revalidation-20261111.md).

The preceding revalidation covers all 86 IDs in `747925.quest_bxml` (`FFQ24`),
adding them to the ledger and recording 16 correction candidates. Four
exact-English duplicate groups had matching Korean, and all four-language
line-break, runtime-token, and markup signatures passed. Its six NPC symbols
and 42 handlers do not establish per-key speakers or dialogue order. No
translation CSV was changed. See
[`dialogue-context-747925-ffq24-death-notices-revalidation-20261111.md`](dialogue-context-747925-ffq24-death-notices-revalidation-20261111.md).

The preceding revalidation covers all 171 IDs across `2009109.quest_bxml`
(`DLC1_PH05b`) and `439722.quest_bxml` (`SQ08`), adding all 171 to the ledger.
Four correction candidates were recorded for the first asset; 28 candidate
IDs and two evidence-limited holds were recorded for the second, with ID
`44477` appearing in both sets. Exact-English duplicate groups had matching
Korean, and all four-language line-break, runtime-token, and markup
signatures passed. The asset-level NPC symbols and handlers do not establish
per-key speakers or dialogue order. No translation CSV was changed. See
[`dialogue-context-2009109-dlc1-ph05b-gravehal-paintings-revalidation-20261111.md`](dialogue-context-2009109-dlc1-ph05b-gravehal-paintings-revalidation-20261111.md)
and
[`dialogue-context-439722-sq08-headsman-revalidation-20261111.md`](dialogue-context-439722-sq08-headsman-revalidation-20261111.md).

The preceding revalidation covers all 83 IDs linked to `571972.quest_bxml`
(`HV03` / House of Valor), adding all 83 to the ledger. Four correction
candidates and one evidence-limited hold were recorded. Its seven NPC symbols
and 48 dialogue handlers do not map individual speakers or playback order.
Ten exact-English duplicate groups had identical Korean, and all format
signatures passed. No translation CSV was changed. See
[`dialogue-context-571972-hv03-house-of-valor-revalidation-20261111.md`](dialogue-context-571972-hv03-house-of-valor-revalidation-20261111.md).

The preceding revalidation covers all 83 IDs linked to `525551.quest_bxml`
(`SQ17` / Canneroc-Webwood), adding all 83 to the ledger. Four correction
candidates and one evidence-limited hold were recorded. The BXML identifies
Garaner Vernt and Barten at asset level, but its two NPC symbols and 40
dialogue handlers do not map individual keys to speakers or playback order.
Six exact-English duplicate pairs have identical Korean, and all format
signatures match. No translation CSV was changed. See
[`dialogue-context-525551-sq17-canneroc-webwood-revalidation-20261111.md`](dialogue-context-525551-sq17-canneroc-webwood-revalidation-20261111.md).

The preceding revalidation covers all 56 IDs linked to `2605200.quest_bxml`
(`ao_sq_ch_006` / Invasive Species), adding 55 rows after excluding the
already-reviewed shared UI ID `60633`. Five correction candidates were
recorded. Direct BXML quest-stage evidence identifies the poacher/Critter
quest and Michaela Vogel, but does not establish per-key speakers or order.
See
[`dialogue-context-2605200-ao-sq-ch-006-invasive-species-revalidation-20261111.md`](dialogue-context-2605200-ao-sq-ch-006-invasive-species-revalidation-20261111.md).

The latest revalidation covers all 55 IDs linked to `2604801.quest_bxml`,
adding 54 records after excluding the already-reviewed shared UI ID `60633`.
It records six correction candidates. Its trophy-state variables and
Mithros/Hunting Party text support topic grouping only; there is no explicit
quest ID, NPC symbol, or dialogue handler, so per-key speakers and order
remain unknown. See
[`dialogue-context-2604801-hunting-party-revalidation-20261111.md`](dialogue-context-2604801-hunting-party-revalidation-20261111.md).

The latest revalidation covers all 53 IDs linked to `2603901.quest_bxml`,
whose BXML includes the lowercase `QUEST_ID` value `ao_sq_re_005`. Fifty-two
new ledger rows were added; shared ID `60633` was already reviewed and linked
to this asset among its 44 occurrences. Eight correction candidates and one
evidence-limited hold were recorded. The asset has no NPC symbol or dialogue
handlers, so no per-key speaker or dialogue order was inferred. See
[`dialogue-context-2603901-ao-sq-re-005-maisies-luck-revalidation-20261111.md`](dialogue-context-2603901-ao-sq-re-005-maisies-luck-revalidation-20261111.md).

The latest revalidation covers all 83 IDs linked to `510295.quest_bxml`
(`FFQ04` / Ring and Reprisal), recording 12 correction candidates. Its 38
`FFQ04`-prefixed handlers do not establish per-key speakers or dialogue order.
No exact-English duplicate groups or four-language format mismatches were
found; no translation CSV or extracted game asset was changed. See
[`dialogue-context-510295-ffq04-ring-reprisal-revalidation-20261111.md`](dialogue-context-510295-ffq04-ring-reprisal-revalidation-20261111.md).

The latest revalidation covers all 81 IDs in `497709.quest_bxml`. Three
correction-candidate IDs were recorded. Its 34 `HM06`-prefixed handlers do
not establish individual speakers or dialogue order. There are no
exact-English duplicate groups or four-language format mismatches; no
translation CSV or extracted asset was changed. See
[`dialogue-context-497709-hm06-maid-sagrell-revalidation-20261111.md`](dialogue-context-497709-hm06-maid-sagrell-revalidation-20261111.md).

The preceding revalidation covers all 80 IDs in `628550.quest_bxml`. Eight
correction-candidate IDs were recorded. Its 30 `SQ67`-prefixed handlers do
not establish individual speakers or dialogue order. Three exact-English
duplicate groups had matching Korean, and all four-language format checks
passed. See
[`dialogue-context-628550-sq67-audra-khleran-revalidation-20261111.md`](dialogue-context-628550-sq67-audra-khleran-revalidation-20261111.md).

The preceding revalidation covers all 80 IDs in `523508.quest_bxml`. It records
20 correction-candidate IDs and one evidence-limited hold. Its 40 `SQ12`-
prefixed handlers and Nanne Hanri / Karth topic do not establish individual
speakers or dialogue order. Two exact-English duplicate groups and all
four-language format checks passed; no translation CSV or extracted asset was
changed. See
[`dialogue-context-523508-sq12-revalidation-20261111.md`](dialogue-context-523508-sq12-revalidation-20261111.md).

The preceding revalidation covers all 79 IDs in `1600024.quest_bxml` (`SQ144`).
Fourteen correction-candidate IDs were recorded without changing the
translation CSV. Its two NPC symbols do not establish per-key speaker
attribution or dialogue order; five exact-English duplicate groups and all
four-language format checks passed. See
[`dialogue-context-1600024-sq144-lyra-ommer-revalidation-20261111.md`](dialogue-context-1600024-sq144-lyra-ommer-revalidation-20261111.md).

The preceding revalidation covers all 78 IDs in `600351.quest_bxml`. It records
one line-level register candidate: the Korean `-소/-하오` form at ID `44618`
is more archaic than the conversational polite Japanese source. The asset has
22 `FP02`-prefixed handlers but no explicit quest or NPC symbol, so individual
speaker attribution and dialogue order remain unknown. The repeated-English
group and four-language format checks passed; no translation CSV or extracted
asset was changed. See
[`dialogue-context-600351-revalidation-20261111.md`](dialogue-context-600351-revalidation-20261111.md).

The preceding revalidation covers all 421 IDs across
`1991492.quest_bxml`, `1993117.quest_bxml`, `1993119.quest_bxml`,
`1993121.quest_bxml`, and `1993123.quest_bxml`. Thirty-one correction
candidates and one evidence-limited hold were recorded. The first four assets
have `DLC1_PH02a` through `DLC1_PH05a` handler prefixes; the fifth has an
explicit `DLC1_MQ03` identifier and `DLC1_PH06a` handlers. These asset-level
clues do not map individual keys to speakers or dialogue order. Forty-five
exact-English duplicate groups covering 167 rows have matching Korean, and
format checks passed for all 421 IDs. No translation CSV or extracted asset
was changed. See
[`dialogue-context-five-gravehal-restoration-assets-revalidation-20261111.md`](dialogue-context-five-gravehal-restoration-assets-revalidation-20261111.md).

The preceding revalidation covers all 385 IDs across
`1944003.quest_bxml`, `1646483.quest_bxml`, `2023654.quest_bxml`,
`590984.quest_bxml`, and `589931.quest_bxml`. Six correction candidates and
three evidence-limited holds were recorded. The handler prefixes support
topic grouping only; no individual speakers or dialogue order were inferred.
Twenty exact-English duplicate groups covering 54 rows have matching Korean,
and line-break/token/markup checks passed for all 385 IDs. No translation CSV
or extracted asset was changed. See
[`dialogue-context-next-five-unrecorded-assets-revalidation-20261111.md`](dialogue-context-next-five-unrecorded-assets-revalidation-20261111.md).

The preceding revalidation covers all 213 IDs across
`1310318.quest_bxml`, `1320107.quest_bxml`, and `1335981.quest_bxml`.
Seven correction candidates and one evidence-limited speech-level hold were
recorded. Their `SQ91`, `SQ95`, and `SQ109` handler prefixes support topic
grouping only; no individual speaker or dialogue order was inferred.
Seventeen exact-English duplicate groups have no Korean divergence, and
line-break/token/markup checks passed for all rows. No translation CSV or
extracted asset was changed. See
[`dialogue-context-three-quest-assets-sq91-sq95-sq109-revalidation-20261111.md`](dialogue-context-three-quest-assets-sq91-sq95-sq109-revalidation-20261111.md).

The latest revalidation covered 207 IDs across
`1364459.quest_bxml`, `1961287.quest_bxml`, and `482304.quest_bxml` (`MQ17`).
It records 11 correction candidates and one evidence-limited speech-level
hold. The three assets contain 23 exact-English duplicate groups with no
Korean divergence; line-break/token/markup checks passed for all IDs.
Twenty-one clear crime action labels are classified as player choices.
No per-key speaker or playback order was inferred, and no translation CSV or
extracted asset was changed. See
[`dialogue-context-next-three-smallest-assets-revalidation-20261111.md`](dialogue-context-next-three-smallest-assets-revalidation-20261111.md).

The latest revalidation covered all 66 IDs in `744464.quest_bxml` (`SQ96`),
recording four correction candidates and one evidence-limited speech-level
hold. Four explicit self-introductions support Vincent Helvern and Bor Anjar
speaker records, and 14 first-person request/payment rows are player-choice
text. This does not establish branch placement or playback order. The ledger
contains current four-language fingerprints; no translation CSV or extracted
asset was changed. See
[`dialogue-context-744464-sq96-motus-mining-revalidation-20261111.md`](dialogue-context-744464-sq96-motus-mining-revalidation-20261111.md).

The latest revalidation added all 309 IDs across five previously unrecorded
assets: `345823.quest_bxml`, `1352899.quest_bxml`, `1568843.quest_bxml`,
`1965163.quest_bxml`, and `557095.quest_bxml`. It records 35
correction-candidate IDs and three evidence-limited speech-level holds, with
one ID in both sets. No exact-English duplicate diverged, and line-break,
runtime-token, and markup checks passed. Asset associations do not establish
individual speakers or playback order. The ledger now contains the reviewed
IDs with current four-language fingerprints; no translation CSV or extracted
asset was changed. See
[`dialogue-context-next-five-smallest-assets-followup-revalidation-20261111.md`](dialogue-context-next-five-smallest-assets-followup-revalidation-20261111.md).

The preceding revalidation covered all 273 IDs in five previously unrecorded
assets: `1987402.quest_bxml`, `528652.quest_bxml`, `2601300.quest_bxml`,
`1759742.quest_bxml`, and `1577264.quest_bxml`. It records 37
correction-candidate IDs and seven evidence-limited speech-level holds.
The 53 IDs in `2601300.quest_bxml` include 28 exact-key links also present in
`2601222.quest_bxml`; these associations do not establish shared speakers.
No exact-English duplicate diverged, and line-break/token/markup checks
passed. No per-key speakers or playback order were inferred, and no
translation CSV was changed. See
[`dialogue-context-next-five-assets-iddyla-turin-apotyre-ariad-eathe-revalidation-20261111.md`](dialogue-context-next-five-assets-iddyla-turin-apotyre-ariad-eathe-revalidation-20261111.md).

The preceding revalidation covered all 423 IDs in five previously unrecorded
assets: `1260381.quest_bxml` (SQ47), `1293651.quest_bxml` (SQ78),
`1310054.quest_bxml` (SQ97), `1310217.quest_bxml` (SQ100), and
`1310280.quest_bxml` (SQ103). It records 13 correction-candidate IDs and six
evidence-limited register holds. The SQ78 asset has two NPC symbols; the
other four assets have handler-prefix clues but no explicit NPC symbol.
These facts support topic grouping only, not per-key speakers or playback
order. No translation CSV was changed. See
[`dialogue-context-next-five-sq47-sq78-sq97-sq100-sq103-revalidation-20261111.md`](dialogue-context-next-five-sq47-sq78-sq97-sq100-sq103-revalidation-20261111.md).

The preceding follow-up revalidated all 252 IDs across five assets:
`1260457.quest_bxml` (SQ49), `1269299.quest_bxml` (SQ86),
`1310306.quest_bxml` (SQ82), `1363142.quest_bxml` (SQ112), and
`1652781.quest_bxml` (FFQ84). It records 25 correction candidates and two
evidence-limited register holds. Their quest-prefixed handlers do not map
individual keys to speakers or playback order. No translation CSV was
changed. See
[`dialogue-context-next-five-expanded-assets-followup-revalidation-20261111.md`](dialogue-context-next-five-expanded-assets-followup-revalidation-20261111.md).

The latest completed group is `522638.quest_bxml` (`SQ16`), covering all 107
IDs. The asset contains two NPC symbols, 45 dialogue handlers, and distinct
`find_barten`, `garaner_deal`, `killed_barten`, and `saved_barten` outcome
states. Six correction candidates and five evidence-limited holds were
recorded. The asset supports a Canneroc/Webwood grouping, but does not map
individual keys to speakers, callbacks, branches, or playback positions. No
translation CSV was changed. See
[`dialogue-context-522638-sq16-canneroc-webwood-revalidation-20261111.md`](dialogue-context-522638-sq16-canneroc-webwood-revalidation-20261111.md).

The preceding completed group is `522390.quest_bxml`, covering all 47 IDs. Its
13 serialized dialogue handlers carry an `SQ19` prefix, and quest-target
strings refer to meeting Sihtric in Rundamir and killing the Crudok. The
asset has no explicit `QUEST_ID` or NPC symbol; the prefix and content support
only an `SQ19` / Sihtric-Vorm / Rundamir-Crudok topic grouping. Nine
correction candidates were recorded, with no evidence-limited holds. The
handler prefix does not map keys to speakers or playback order. No translation
CSV was changed. See
[`dialogue-context-522390-sq19-sihtric-vorm-revalidation-20261111.md`](dialogue-context-522390-sq19-sihtric-vorm-revalidation-20261111.md).

The preceding completed group is `1944009.quest_bxml`, with 47 four-language
rows, three correction candidates, and four evidence-limited holds. Its
conditional quest/handler prefix supports `DLC2_SQ07`, but there is no
explicit `QUEST_ID` or NPC symbol, and the 15 handlers do not establish
per-key speaker attribution or playback order. No translation CSV was
changed. See
[`dialogue-context-1944009-dlc2-sq07-evenroot-revalidation-20261111.md`](dialogue-context-1944009-dlc2-sq07-evenroot-revalidation-20261111.md).

The preceding completed group is `596269.quest_bxml` (`SQ59`), with 46
four-language rows, five correction candidates, and one evidence-limited
hold. The asset has no NPC symbol; its 15 dialogue handlers do not establish
per-key speaker attribution or playback order. No translation CSV was
changed. See
[`dialogue-context-596269-sq59-feride-experiment-revalidation-20261111.md`](dialogue-context-596269-sq59-feride-experiment-revalidation-20261111.md).

The preceding completed group is `1937439.quest_bxml` (`DLC1_MQ03`), with 369
four-language rows, seven correction candidates, and four evidence-limited
holds. The asset-level `DLC1_NPC_GAL_DOK_Brattigan` symbol and 184 dialogue
handlers do not establish per-key speaker attribution or playback order. No
translation CSV was changed. See
[`dialogue-context-1937439-dlc1-mq03-brattigan-revalidation-20261111.md`](dialogue-context-1937439-dlc1-mq03-brattigan-revalidation-20261111.md).

The preceding completed group is `1962959.quest_bxml` (`DLC2_MQ06`), with 196
four-language rows, 15 correction candidates, and four evidence-limited
holds. The asset-level `DLC2_NPC_TON_KOL_Secandra` symbol and 68 dialogue
handlers do not establish per-key speaker attribution or playback order. No
translation CSV was changed. See
[`dialogue-context-1962959-dlc2-mq06-secandra-revalidation-20261111.md`](dialogue-context-1962959-dlc2-mq06-secandra-revalidation-20261111.md).

## Reverse-Mapping Results

The `default` row ID indexes an 8-byte key in
`src/csv/en_us/estrutura_hashes_flat.bin`. A byte-window scan of the extracted
quest, interaction, and FaceFX quest resources found:

- 51,080 of 65,135 unique `default` keys in 426 of 530 `quest_bxml` assets.
- 1,257 matched keys occur in more than one quest asset.
- No exact `default` key matches in the 517 interaction or 53 FaceFX quest
  assets scanned.
- 282 key-containing quest assets have no `NPC_` symbol. A quest-asset match
  establishes resource association, not dialogue status or speaker identity.

The following 56 assets meet a stronger discovery filter: at least one
localization key, exactly one distinct `NPC_` symbol, exactly one distinct
`QUEST_ID` value, and at least one `dialog_line_*` handler. This makes them
high-priority character/quest grouping candidates, not proof that every
matched key is spoken by that NPC. The localization keys still have not been
mapped one-to-one to dialogue callbacks.

| Asset | Quest | NPC symbol | Matched IDs | Dialog handlers |
| --- | --- | --- | ---: | ---: |
| `1164038.quest_bxml` | `FFQ35` | `NPC_DAL_LJO_MenriTogh` | 56 | 17 |
| `1272538.quest_bxml` | `SQ87` | `NPC_DET_ALM_Abblier` | 22 | 9 |
| `1297481.quest_bxml` | `SQ79` | `NPC_POE_SEE_Terenia` | 44 | 17 |
| `1310265.quest_bxml` | `SQ102` | `NPC_ALA_UNS_Aluck` | 58 | 23 |
| `1310335.quest_bxml` | `SQ93` | `NPC_YSA_SEE_Nomeron` | 55 | 24 |
| `1313479.quest_bxml` | `SQ100` | `NPC_ALA_UNS_Esha` | 97 | 55 |
| `1332203.quest_bxml` | `SQ108` | `NPC_DET_GNO_DecanusPaige` | 128 | 64 |
| `1388321.quest_bxml` | `SQ116` | `NPC_KLU_DOK_DrewnAnsilla` | 60 | 20 |
| `1388507.quest_bxml` | `SQ117` | `NPC_KLU_UNS_Malthon` | 42 | 13 |
| `1388540.quest_bxml` | `SQ118` | `NPC_KLU_DOK_ZanvilWhit` | 51 | 17 |
| `1388542.quest_bxml` | `FFQ116` | `NPC_KLU_ALM_KregerCoil` | 28 | 12 |
| `1485448.quest_bxml` | `SQ126` | `NPC_YSA_ALM_GwennaHand` | 111 | 41 |
| `1491990.quest_bxml` | `FFQ60` | `NPC_YSA_LJO_BritCodgan` | 40 | 20 |
| `1507672.quest_bxml` | `FFQ64` | `NPC_DAL_ALM_AgraivinHand` | 23 | 12 |
| `1511548.quest_bxml` | `FFQ66` | `NPC_KLU_Alm_HarrisetDonel` | 33 | 15 |
| `1511550.quest_bxml` | `FFQ67` | `NPC_POE_LJO_VulgarDonnoh` | 27 | 13 |
| `1565116.quest_bxml` | `SQ80` | `NPC_ALA_VAR_GoremKane` | 36 | 16 |
| `1573776.quest_bxml` | `FFQ71` | `NPC_MQ_UNS_Knave` | 34 | 13 |
| `1576008.quest_bxml` | `SQ140` | `NPC_DET_LJO_ColmAlba` | 76 | 25 |
| `1577269.quest_bxml` | `SQ143` | `NPC_DET_VAR_HreidAmlethoe` | 90 | 35 |
| `1583001.quest_bxml` | `SQ131` | `NPC_KLU_DOK_BronwenSenn` | 80 | 29 |
| `1610759.quest_bxml` | `SQ145` | `NPC_POE_LJO_LilaJanick` | 38 | 18 |
| `1621030.quest_bxml` | `SQ68` | `NPC_KLU_UNS_SQ68_Liordran` | 40 | 24 |
| `1621227.quest_bxml` | `TRSQ01` | `NPC_DAL_VAR_GunnarFrode` | 172 | 61 |
| `1633037.quest_bxml` | `TRSQ02` | `NPC_KLU_Ljo_MaireGanan` | 110 | 40 |
| `1637499.quest_bxml` | `SQ150` | `NPC_DET_LJO_LinaArdeen` | 61 | 22 |
| `1800351.quest_bxml` | `SASQ01` | `NPC_POE_DOK_IdrisTheonen` | 68 | 19 |
| `1800355.quest_bxml` | `SASQ02` | `NPC_POE_GNO_TelemachusRasp` | 31 | 10 |
| `1800357.quest_bxml` | `SASQ03` | `NPC_DAL_GNO_JorumQuintus` | 68 | 23 |
| `361668.quest_bxml` | `M0_SQ06` | `NPC_POE_VAR_AskelThorin` | 193 | 51 |
| `438799.quest_bxml` | `SQ01` | `NPC_SQ01_StrangePrisoner` | 71 | 28 |
| `441938.quest_bxml` | `SQ02` | `NPC_POE_ALM_KellsCafferty` | 213 | 85 |
| `457008.quest_bxml` | `TR01` | `NPC_DAL_GNO_CenturionGastet` | 119 | 50 |
| `457589.quest_bxml` | `HM01` | `NPC_DAL_SEE_Green` | 216 | 155 |
| `467727.quest_bxml` | `KV03` | `NPC_OstOrdura` | 96 | 47 |
| `467744.quest_bxml` | `TR03` | `NPC_ADE_GNO_ElorenCriet` | 104 | 35 |
| `494374.quest_bxml` | `TR06` | `NPC_DAL_Alm_GrimOnwig` | 97 | 23 |
| `495487.quest_bxml` | `FFQ03` | `NPC_DAL_VAR_MurdocHain` | 41 | 16 |
| `501659.quest_bxml` | `KV07` | `NPC_GwynAnwy` | 129 | 58 |
| `540798.quest_bxml` | `KVSQ02` | `NPC_KV10_Khamazandu` | 59 | 28 |
| `545970.quest_bxml` | `HP02` | `NPC_POE_DOK_ErionRaff` | 84 | 37 |
| `563881.quest_bxml` | `MQ05` | `NPC_DAL_SEE_Glianal` | 332 | 136 |
| `588388.quest_bxml` | `SQ54` | `NPC_DET_ALM_Beorn` | 114 | 46 |
| `589911.quest_bxml` | `MQ09` | `NPC_MQ_LJO_GeneralTilera` | 154 | 54 |
| `589924.quest_bxml` | `MQ14` | `NPC_MQ_UNS_Cydan` | 192 | 96 |
| `591256.quest_bxml` | `SQ59` | `NPC_ADE_GNO_FerideOuet` | 191 | 57 |
| `592526.quest_bxml` | `SQ53` | `NPC_DET_ALM_AetillAlgar` | 131 | 58 |
| `593901.quest_bxml` | `SQ58` | `NPC_DET_DOK_ParwenWell` | 92 | 33 |
| `597592.quest_bxml` | `SQ55` | `NPC_DET_SEE_Aergase` | 154 | 57 |
| `611596.quest_bxml` | `SQ69` | `NPC_ALA_LJO_CaptainKeloran` | 82 | 29 |
| `613083.quest_bxml` | `MQ01` | `NPC_MQ_GNO_Encel` | 267 | 188 |
| `616680.quest_bxml` | `U03` | `NPC_DAL_ALM_ThaddeusHoln` | 82 | 32 |
| `695918.quest_bxml` | `SQ15` | `NPC_DAL_STR_EnconegHoln_2` | 47 | 20 |
| `710527.quest_bxml` | `FFQ17` | `NPC_POE_ALM_ElrodEdman` | 91 | 43 |
| `747929.quest_bxml` | `FFQ26` | `NPC_DET_GNO_RuinImas` | 39 | 14 |
| `756361.quest_bxml` | `FFQ80` | `NPC_DET_VAR_BeraGrastar` | 17 | 6 |

The previously reviewed Brio `SQ81` asset is a separate, multi-NPC case and
remains documented in
[`dialogue-context-regroup-and-review-20261110.md`](dialogue-context-regroup-and-review-20261110.md).

## Sixth Expanded Group: Vulgar Donnoh / `FFQ67`

`1511550.quest_bxml` contains 27 distinct localization keys, `QUEST_ID FFQ67`,
the asset-level symbol `NPC_POE_LJO_VulgarDonnoh`, a `PLAYER` symbol, item
count checks for peasant clothing, and 13 serialized `dialog_line_*`
handlers. Content separates 19 dialogue-like strings from eight journal,
objective, or UI rows. A bounded search found all seven English
`peasant clothes` occurrences in this group. Six correction findings were
recorded, with no CSV edit applied. See
[`dialogue-context-ffq67-revalidation-20261110.md`](dialogue-context-ffq67-revalidation-20261110.md).

## Seventh Expanded Group: Kreger the Devout / `FFQ116`

`1388542.quest_bxml` contains 28 distinct localization keys, `QUEST_ID
FFQ116`, the asset-level symbol `NPC_KLU_ALM_KregerCoil`, two quest-target
handlers, and 12 serialized `dialog_line_*` handlers. The quest concerns
recovering Alfar soldiers' earrings from the Midden and counting the dead.
Content separates 22 dialogue-like or player-choice strings from six
objective, item/UI, journal, or title strings. ID `47022` explicitly
self-identifies Kreger; the asset symbol does not map the other keys to him
or to individual callbacks.

All 28 rows were reviewed in English, Japanese, Chinese, and active Korean.
One objective-form correction candidate was recorded at ID `10918`; no CSV
edit was applied. Details and the full ID list are in
[`dialogue-context-ffq116-revalidation-20261110.md`](dialogue-context-ffq116-revalidation-20261110.md).

## Eighth Expanded Group: Gwenna Hand / `SQ126`

`1485448.quest_bxml` contains 111 distinct localization keys, `QUEST_ID
SQ126`, the asset-level symbol `NPC_YSA_ALM_GwennaHand`, 15 quest-target
handlers, and 41 serialized `dialog_line_*` handlers. The asset covers the
Varani plot against Ysa, coded daggers, and assassination choices involving
Ambassadors Keen and Brenner. The single NPC symbol does not establish that
every key belongs to Gwenna, and no key has been mapped to an individual
dialogue callback.

All 111 rows were reviewed against English, Japanese, Chinese, and active
Korean. Ten fully duplicated English-string groups already have identical
Korean text. The grouped pass recorded 18 consistency/translation candidates
and one unresolved location-reference case, including repeated English
sentences that had been translated differently. No Korean CSV was changed.
See [`dialogue-context-sq126-revalidation-20261110.md`](dialogue-context-sq126-revalidation-20261110.md)
for the proposals and evidence.

## Ninth Expanded Group: Menri Togh / `FFQ35`

`1164038.quest_bxml` contains 56 distinct localization keys, `QUEST_ID
FFQ35`, the asset-level symbol `NPC_DAL_LJO_MenriTogh`, and 17 serialized
`dialog_line_*` handlers. The quest concerns Menri's family farm, the spider
attacks, and Cartery Jayck's murder of the Toghs. The NPC symbol does not map
each localization key to Menri or to an individual callback.

All 56 rows were reviewed against English, Japanese, Chinese, and active
Korean. Six correction/consistency candidates and one uncertain register case
were recorded. The duplicated journal sentences at `5313` and `53623` are
proposed for alignment; the earlier source-based reading of `5313`'s
deliberately contradictory final clause remains unchanged. No Korean CSV was
changed. See
[`dialogue-context-ffq35-revalidation-20261110.md`](dialogue-context-ffq35-revalidation-20261110.md).

## Tenth Expanded Group: Terenia / `SQ79`

`1297481.quest_bxml` contains 44 distinct localization keys, `QUEST_ID
SQ79`, the asset-level symbol `NPC_POE_SEE_Terenia`, three quest-target
handlers, and 17 serialized `dialog_line_*` handlers. The quest concerns the
Cradle of Summer barrier, the Wild Fae incursion, and magical sources and
Lorestones. The NPC symbol does not map each localization key to Terenia or
to an individual callback.

All 44 rows were reviewed against English, Japanese, Chinese, and active
Korean. Five correction candidates and two uncertain findings were recorded;
no Korean CSV was changed. The unresolved `Font` reading and the phrase
`alight on the surface` remain explicitly held. See
[`dialogue-context-sq79-revalidation-20261110.md`](dialogue-context-sq79-revalidation-20261110.md).

## Eleventh Expanded Group: Aluck's Quest / `SQ102`

`1310265.quest_bxml` contains 58 distinct localization keys, `QUEST_ID
SQ102`, the asset-level symbol `NPC_ALA_UNS_Aluck`, and 23 serialized
`dialog_line_*` handlers. Its text concerns Aluck, the Ashmoor survivors,
Gask, and the Cadsymyr camp in Twilight Pass. The asset association does not
map any individual key to a speaker, callback, branch, or playback position.

All 58 rows were revalidated against English, Japanese, Chinese, and active
Korean. Eleven findings were recorded: ten correction candidates and one
sentence-level hold at `17207`, where only the separate name-spelling issue
is proposed. All four-language rows lack embedded line breaks, runtime
placeholders, and markup. No translation CSV was changed. See
[`dialogue-context-sq102-revalidation-20261110.md`](dialogue-context-sq102-revalidation-20261110.md).

## Twelfth Expanded Group: Nomeron / `SQ93`

`1310335.quest_bxml` contains 55 distinct localization keys, `QUEST_ID SQ93`,
the asset-level symbol `NPC_YSA_SEE_Nomeron`, and 24 serialized
`dialog_line_*` handlers. Its text concerns the Font's waning flow, the Water
Lock, the Sacred Pools, and the Gardens of Ysa. The key matches do not map
individual rows to Nomeron, callbacks, branches, or playback order.

All 55 rows were revalidated against English, Japanese, Chinese, and active
Korean. Seventeen correction candidates and five unresolved findings were
recorded, including term consistency for the Font and Sacred Pools, a mixed
speech-level line, and one incomplete Korean sentence ending. Prior holds on
the omen phrase, king address, Fontmaster title, and Font's yield were
preserved. IDs `32258` and `39530` were not included because their key matches
belong to other assets. No translation CSV or extracted asset was changed.
See [`dialogue-context-sq93-revalidation-20261110.md`](dialogue-context-sq93-revalidation-20261110.md)
for the full evidence and ID list.

## Thirteenth Expanded Group: Esha / `SQ100`

`1313479.quest_bxml` contains 97 distinct localization keys, `QUEST_ID
SQ100`, the asset-level symbol `NPC_ALA_UNS_Esha`, and 55 serialized
`dialog_line_*` handlers. The text concerns Esha, Bareth's research into the
murghan, the Eventide and Ashmoor survivors, Gask, and Twilight Pass.

All 97 rows were revalidated against English, Japanese, Chinese, and active
Korean. Five correction candidates and one unresolved finding were recorded;
the exact-English duplicate groups have identical Korean text. No translation
CSV was changed. Details and the full ID list are in
[`dialogue-context-sq100-revalidation-20261110.md`](dialogue-context-sq100-revalidation-20261110.md).

## Fourteenth Expanded Group: Decanus Paige / `SQ108`

`1332203.quest_bxml` contains 128 distinct localization keys, `QUEST_ID
SQ108`, the asset-level symbol `NPC_DET_GNO_DecanusPaige`, and 64 serialized
`dialog_line_*` handlers. The text concerns Orsinian Paige's plan around the
Jottun, Kobolds, and Tearscotter Mine, alongside journal entries, objectives,
labels, and player choices.

All 128 rows were revalidated against English, Japanese, Chinese, and active
Korean. Eleven correction candidates were recorded. Three exact-English
duplicate groups have identical Korean text, and all four locales are free of
embedded line breaks, runtime markers, and markup in these rows. No translation
CSV was changed. See
[`dialogue-context-sq108-revalidation-20261110.md`](dialogue-context-sq108-revalidation-20261110.md)
for the findings and full ID list.

## Fifteenth Expanded Group: Drewn Ansilla / `SQ116`

`1388321.quest_bxml` contains 60 distinct localization keys, `QUEST_ID
SQ116`, the asset-level symbol `NPC_KLU_DOK_DrewnAnsilla`, and 20 serialized
`dialog_line_*` handlers. Its text concerns Drewn's claim to the Caeled Coast,
the Seal of Ansilla and Verdant Blades, and Hillared Gastyr.

All 60 rows were revalidated against English, Japanese, Chinese, and active
Korean. Eleven correction candidates were recorded. Three exact-English
duplicate groups have identical Korean text, and all four locales are free of
embedded line breaks, runtime markers, and markup in these rows. No translation
CSV was changed. See
[`dialogue-context-sq116-revalidation-20261110.md`](dialogue-context-sq116-revalidation-20261110.md)
for the findings and full ID list.

## Sixteenth Expanded Group: Malthon / `SQ117`

`1388507.quest_bxml` contains 42 distinct localization keys, `QUEST_ID
SQ117`, the asset-level symbol `NPC_KLU_UNS_Malthon`, and 13 serialized
`dialog_line_*` handlers. Its text concerns Malthon's request to kill the
leanashe Meathgra and the danger posed by corpses in the Midden.

All 42 rows were revalidated against English, Japanese, Chinese, and active
Korean. Six correction candidates and one unresolved reference were recorded.
No exact-English duplicate groups occur; all four locales are free of
embedded line breaks, runtime markers, and markup in these rows. No translation
CSV was changed. See
[`dialogue-context-sq117-revalidation-20261110.md`](dialogue-context-sq117-revalidation-20261110.md)
for the findings and full ID list.

## Seventeenth Expanded Group: Zanvil Whit / `SQ118`

`1388540.quest_bxml` contains 51 distinct localization keys, `QUEST_ID
SQ118`, the asset-level symbol `NPC_KLU_DOK_ZanvilWhit`, and 17 serialized
`dialog_line_*` handlers. Its text concerns recovering reconnaissance carried
by the Alfar scout Venris and following his wolf in the Midden.

All 51 rows were revalidated against English, Japanese, Chinese, and active
Korean. Ten correction candidates were recorded. No exact-English duplicate
groups occur, and all four locales are free of embedded line breaks, runtime
markers, and markup in these rows. No translation CSV was changed. See
[`dialogue-context-sq118-revalidation-20261110.md`](dialogue-context-sq118-revalidation-20261110.md)
for the findings and full ID list.

## Eighteenth Expanded Group: Brit Codgan / `FFQ60`

`1491990.quest_bxml` contains 40 distinct localization keys, `QUEST_ID
FFQ60`, the asset-level symbol `NPC_YSA_LJO_BritCodgan`, the
`QuestItem_FFQ60_HonorBrand` symbol, and 20 serialized `dialog_line_*`
handlers. The text concerns Brit Codgan's counterfeit and authentic Honor
Brands, their components, and their sale in Ysa. The NPC symbol does not map
each key to Codgan or to an individual callback.

All 40 rows were revalidated against English, Japanese, Chinese, and active
Korean. The speech-level inconsistency at `18796` remains a correction
candidate. The nested duplicate English gloss at `64046` was corrected at the
user's request to `이사의 아너 브랜드(Ysa Honor Brands) 제작` and its ledger
fingerprint was refreshed. The exact-English duplicate group at `18415`,
`21735`, `23911`, and `26924` already has matching Korean. No embedded line
breaks, runtime markers, or markup were found. ID `8192` names Brit Hagni, a
separate person, and is not attributed to the asset-level NPC. See
[`dialogue-context-ffq60-revalidation-20261110.md`](dialogue-context-ffq60-revalidation-20261110.md)
for evidence and the full ID list.

## Nineteenth Expanded Group: Harriset Donnel / `FFQ66`

`1511548.quest_bxml` contains 33 distinct localization keys, `QUEST_ID
FFQ66`, the asset-level symbol `NPC_KLU_Alm_HarrisetDonel`, and 15 serialized
`dialog_line_*` handlers. Its text concerns Harriset's request for iron
components and his trade as a tinker. The NPC symbol does not map each key to
Harriset or to an individual callback.

All 33 rows were revalidated against English, Japanese, Chinese, and active
Korean. Four correction candidates were recorded for meaning (`4671`),
objective wording (`9682`), camp-name pairing (`10985`), and naturalness
(`58868`); the reading of `custom` at `64954` remains unresolved. No exact
English duplicates, embedded line breaks, runtime markers, or markup were
found. No translation CSV was changed. See
[`dialogue-context-ffq66-revalidation-20261110.md`](dialogue-context-ffq66-revalidation-20261110.md)
for evidence and the full ID list.

## Twentieth Expanded Group: Gorem Kane / `SQ80`

`1565116.quest_bxml` contains 36 distinct localization keys, the explicit
`QUEST_ID SQ80`, the asset-level symbol `NPC_ALA_VAR_GoremKane`, and 16
serialized `dialog_line_*` handlers. The text concerns mercenaries at
Moondown and Captain Canwen's request to clear Tuatha watchtowers on Shadow
Pass. All 36 rows were revalidated against English, Japanese, Chinese, and
active Korean. One terminology-consistency candidate was recorded at
`46715`; no translation CSV was changed.

The asset's handler names and the gold variable in `29785`/`32219` carry an
`SQ94` prefix despite the explicit `QUEST_ID SQ80`. The index retains the
explicit `SQ80` value; the discrepancy is recorded without assigning keys to
callbacks or inferring that either ID is wrong. Details and the full ID list
are in
[`dialogue-context-sq80-revalidation-20261110.md`](dialogue-context-sq80-revalidation-20261110.md).

## Twenty-First Expanded Group: Knave of Pride / `FFQ71`

`1573776.quest_bxml` contains 34 distinct localization keys, `QUEST_ID
FFQ71`, the asset-level symbol `NPC_MQ_UNS_Knave`, and 13 serialized
`dialog_line_*` handlers. Its text concerns the Knave of Pride, the Bolgan
Masters, and their control of Bolgan forces at High Fulgen. All 34 rows were
revalidated against English, Japanese, Chinese, and active Korean. Four
findings were recorded: two terminology/meaning candidates, one objective
form candidate, and missing English title pairings at `30902` and `35843`.
The exact-English duplicate `Hello.` at `19751`/`43113` already matches in
Korean. No translation CSV was changed. See
[`dialogue-context-ffq71-revalidation-20261110.md`](dialogue-context-ffq71-revalidation-20261110.md)
for evidence and the full ID list.

## Twenty-Second Expanded Group: Colm and Giran Alba / `SQ140`

`1576008.quest_bxml` contains 76 keys, `QUEST_ID SQ140`, the asset-level
symbol `NPC_DET_LJO_ColmAlba`, and 25 serialized `dialog_line_*` handlers.
The quest follows Colm's attempt to save his twin Giran from Belen's
Testament. The group includes dialogue, choices, objectives, journals, and
UI/debug text; the NPC symbol does not map each key to a speaker or callback.

All 76 rows were revalidated in English, Japanese, Chinese, and active Korean.
Twenty-seven correction-candidate IDs have been applied and rechecked. The
uncertain readings at `48067` and `62309` remain unchanged; the oath nuance at
`50834` remains unresolved after applying its separate faction-name pairing.
Four exact-English duplicate groups already match in Korean. No extracted
asset was changed. See
[`dialogue-context-sq140-revalidation-20261110.md`](dialogue-context-sq140-revalidation-20261110.md).

## Twenty-Third Expanded Group: Galette Treasure / `SQ143`

`1577269.quest_bxml` contains 90 keys, `QUEST_ID SQ143`, the asset-level
symbol `NPC_DET_VAR_HreidAmlethoe`, and 35 serialized `dialog_line_*`
handlers. The quest concerns Hreid's treasure hunt, his former crew, a
combination-locked door, and Belen's Testament. Its full-name source spelling
is `Hreid Amelthoe`; the asset symbol alone does not settle its relation to
the separately recorded `Hreid Amlethoe` spelling.

All 90 rows were revalidated in four languages. Thirty-four IDs have
correction candidates, and the conflicting east/west combination at
`1410`/`52945` remains unresolved. Three exact-English duplicate groups
already match in Korean. No translation CSV or extracted asset was changed.
See [`dialogue-context-sq143-revalidation-20261110.md`](dialogue-context-sq143-revalidation-20261110.md).

## Twenty-Fourth Expanded Group: Bronwen Senn Arena / `SQ131`

`1583001.quest_bxml` contains 80 keys, `QUEST_ID SQ131`, the asset-level
symbol `NPC_KLU_DOK_BronwenSenn`, and 29 serialized `dialog_line_*` handlers.
The group covers Alfar arena challenges, the First Sword title, and Bronwen's
sister Ragna. Individual speakers and callback links remain unmapped.

All 80 rows were revalidated in four languages. Twenty-six IDs have
correction-candidate IDs, including objective wording for nonlethal training
fights and row-local Korean register outliers; all 26 corrections were
applied and rechecked. Four exact-English duplicate pairs already match in
Korean. No extracted asset was changed.
See [`dialogue-context-sq131-revalidation-20261110.md`](dialogue-context-sq131-revalidation-20261110.md).

## Twenty-Fifth Expanded Group: Lila Janick / `SQ145`

`1610759.quest_bxml` contains 38 keys, `QUEST_ID SQ145`, the asset-level
symbol `NPC_POE_LJO_LilaJanick`, and 18 serialized `dialog_line_*` handlers.
Its subject is Lila's Sativa Fiber harvest and a spider nest, with dialogue,
choices, quest text, and objective labels mixed in the resource.

All 38 rows were revalidated in four languages. Nine IDs have correction
candidates and one reply/register case remains uncertain. Exact-English
duplicate groups already match in Korean. No Korean CSV or extracted asset
was changed. See
[`dialogue-context-sq145-revalidation-20261110.md`](dialogue-context-sq145-revalidation-20261110.md).

## Twenty-Sixth Expanded Group: Liordran-Associated War Context / `SQ68`

`1621030.quest_bxml` contains 40 keys, `QUEST_ID SQ68`, the asset-level
symbol `NPC_KLU_UNS_SQ68_Liordran`, and 24 serialized `dialog_line_*`
handlers. Both Liordran and Audra Firan appear in the rows, so the one scanned
NPC symbol is not treated as a complete speaker map.

All 40 rows were revalidated in four languages. Four IDs have correction
candidates, including a source-supported register mismatch and consistency
of the full `Greater Niskaru` type name. No Korean CSV or extracted asset was
changed. See
[`dialogue-context-sq68-revalidation-20261110.md`](dialogue-context-sq68-revalidation-20261110.md).

## Twenty-Seventh Expanded Group: Star Camp Initiation / `TRSQ01`

`1621227.quest_bxml` contains 172 keys, `QUEST_ID TRSQ01`, the asset-level
symbol `NPC_DAL_VAR_GunnarFrode`, and 61 serialized `dialog_line_*` handlers.
It combines Gunnar's Draug's Toothpicks sale, Crilgarin's Traveler initiation,
the Hierophant's shrine test, Ealfwig Grilricas, player choices, journals, and
objectives. It is explicitly treated as a multi-character resource, not 172
Gunnar lines.

All 172 rows were revalidated in English, Japanese, Chinese, and active Korean.
Ten IDs have correction candidates, including item terminology, address,
objective naturalness, and speech-level issues; two source/title readings
remain unresolved. Exact-English duplicate groups were checked and already
match in Korean. No Korean CSV or extracted asset was changed. See
[`dialogue-context-trsq01-revalidation-20261110.md`](dialogue-context-trsq01-revalidation-20261110.md).

## Twenty-Eighth Expanded Group: Moon Camp and Maire Ganan / `TRSQ02`

`1633037.quest_bxml` contains 110 keys, `QUEST_ID TRSQ02`, the asset-level
symbol `NPC_KLU_Ljo_MaireGanan`, and 40 serialized `dialog_line_*` handlers.
It covers the theft assignments at Moon Camp, Maire and Irion's relationship,
and the Wyvyrn-Gifre Great House. The resource also includes other named NPCs,
choices, journals, and objectives, so the Maire symbol is not treated as a
per-key speaker map.

All 110 rows were revalidated in English, Japanese, Chinese, and active
Korean. Nine IDs have correction candidates, including a duplicated item
gloss, a Great House/mansion distinction, and a speech-level mismatch; one
`shade` address remains unresolved. Both exact-English duplicate groups
already match in Korean. No Korean CSV or extracted asset was changed. See
[`dialogue-context-trsq02-revalidation-20261110.md`](dialogue-context-trsq02-revalidation-20261110.md).

## Twenty-Ninth Expanded Group: Lina Ardeen / `SQ150`

`1637499.quest_bxml` contains 61 keys, `QUEST_ID SQ150`, the asset-level
symbol `NPC_DET_LJO_LinaArdeen`, and 22 serialized `dialog_line_*` handlers.
The quest concerns Lina, the Travelers, Mayor Eswin, and a stolen document in
Whitestone. Dialogue, player choices, journals, objectives, and UI labels are
mixed; the asset symbol does not identify a speaker for every key or map keys
to callbacks or playback order.

All 61 rows were revalidated in English, Japanese, Chinese, and active Korean.
Four correction candidates and one unresolved English/Japanese meaning
conflict were recorded. No exact-English duplicate group occurs within this
asset. No Korean CSV or extracted asset was changed. See
[`dialogue-context-sq150-revalidation-20261110.md`](dialogue-context-sq150-revalidation-20261110.md).

## Thirtieth Expanded Group: Idris Theonen / `SASQ01`

`1800351.quest_bxml` contains 68 keys, `QUEST_ID SASQ01`, the asset-level
symbol `NPC_POE_DOK_IdrisTheonen`, and 19 serialized `dialog_line_*` handlers.
The text concerns the Omnibus Arcana study and examination at the Scholia
Arcana. Dialogue, player choices, book text, journals, objectives, and UI
labels are mixed; the asset symbol does not identify a speaker for every key
or map keys to callbacks or playback order.

All 68 rows were revalidated in English, Japanese, Chinese, and active Korean.
Eight correction candidates and one unresolved source reading were recorded.
Five exact-English duplicate groups already have identical Korean text. No
Korean CSV or extracted asset was changed. See
[`dialogue-context-sasq01-revalidation-20261110.md`](dialogue-context-sasq01-revalidation-20261110.md).

## Thirty-First Expanded Group: Telemachus Rasp / `SASQ02`

`1800355.quest_bxml` contains 31 keys, `QUEST_ID SASQ02`, the asset-level
symbol `NPC_POE_GNO_TelemachusRasp`, and ten serialized `dialog_line_*`
handlers. The quest concerns field research at Gloamthicket and a Banshaen
Priestess attacking Scholia Arcana initiates. Dialogue, player choices,
objectives, journal text, and UI labels are mixed; the asset symbol does not
identify a speaker for every key or map keys to callbacks or playback order.

All 31 rows were revalidated in English, Japanese, Chinese, and active Korean.
Six correction candidates were recorded, including a direct speech-level
mismatch and a place-type mistranslation. No exact-English duplicate group
occurs within this asset. No Korean CSV or extracted asset was changed. See
[`dialogue-context-sasq02-revalidation-20261110.md`](dialogue-context-sasq02-revalidation-20261110.md).

## Thirty-Second Expanded Group: Jorum Quintus / `SASQ03`

`1800357.quest_bxml` contains 68 keys, `QUEST_ID SASQ03`, the asset-level
symbol `NPC_DAL_GNO_JorumQuintus`, and 28 serialized `dialog_line_*` handlers.
The quest concerns three missing Scholia Arcana initiates, a gem theft, and
their fate in the Sidhe. Dialogue, player choices, objectives, journals, and
status labels are mixed; the asset symbol does not identify a speaker for
every key or map keys to callbacks or playback order.

All 68 rows were revalidated in English, Japanese, Chinese, and active Korean.
Three correction findings and two unresolved readings were recorded. The
single exact-English duplicate group already has identical Korean text. No
Korean CSV or extracted asset was changed. See
[`dialogue-context-sasq03-revalidation-20261110.md`](dialogue-context-sasq03-revalidation-20261110.md).

## Thirty-Third Expanded Group: Ratofer's Sale Quest / `M0_SQ06`

`361668.quest_bxml` contains 193 keys, `QUEST_ID M0_SQ06`, the asset-level
symbol `NPC_POE_VAR_AskelThorin`, references to `M0_NPC_LordRatofer`, and 51
serialized `dialog_line_*` handlers. The quest mixes dialogue with objectives,
journal entries, choices, and status labels. These asset-level references do
not map individual keys to speakers, callbacks, branches, or playback order.

All 193 rows were revalidated in English, Japanese, Chinese, and active Korean.
Seven correction findings and three unresolved readings were recorded.
Eleven exact-English duplicate groups already have identical Korean text.
No Korean CSV or extracted asset was changed. See
[`dialogue-context-m0-sq06-revalidation-20261110.md`](dialogue-context-m0-sq06-revalidation-20261110.md).

## Thirty-Fourth Expanded Group: Ainmhi / `SQ01`

`438799.quest_bxml` contains 71 keys, `QUEST_ID SQ01`, the asset-level symbol
`NPC_SQ01_StrangePrisoner`, and 28 serialized `dialog_line_*` handlers. The
quest concerns Ainmhi's curse and the Wandering Well. Dialogue, choices,
objectives, journals, and status labels are mixed; the asset symbol does not
identify a speaker for every key or map keys to callbacks or playback order.

All 71 rows were revalidated in English, Japanese, Chinese, and active Korean.
Ten correction findings affecting 17 IDs were recorded. The single
exact-English duplicate group already has identical Korean text. No Korean
CSV or extracted asset was changed. See
[`dialogue-context-sq01-revalidation-20261110.md`](dialogue-context-sq01-revalidation-20261110.md).

## Fifth Expanded Group: Agraivin Hand / `FFQ64`

`1507672.quest_bxml` contains 23 distinct localization keys, the `FFQ64`
identifier, a `TRSQ01` reference, the asset-level symbol
`NPC_DAL_ALM_AgraivinHand`, and 12 serialized `dialog_line_*` handlers. Its
quest text concerns prison keys and imprisoned Travelers. Content separates
16 dialogue-like rows from four journal entries and three objective/UI
labels. Six correction candidates and one non-blocking insult-consistency
note were recorded; no CSV edit was applied. See
[`dialogue-context-ffq64-revalidation-20261110.md`](dialogue-context-ffq64-revalidation-20261110.md).

## Fourth Expanded Group: Adessa Prison Letter / `SQ87`

`1272538.quest_bxml` contains 22 distinct localization keys, the `SQ87`
identifier, the asset-level symbol `NPC_DET_ALM_Abblier`, and nine
serialized `dialog_line_*` handlers. The quest text concerns delivering a
letter to Esklad Teiner and claiming a reward from Abblier. Content separates
11 dialogue-like rows from 11 journal, objective, or UI labels, but does not
map individual keys to callbacks or speakers. Four correction candidates were
recorded; no CSV edit was applied. See
[`dialogue-context-sq87-revalidation-20261110.md`](dialogue-context-sq87-revalidation-20261110.md).

## Third Expanded Group: Bera Grastar / `FFQ80`

`756361.quest_bxml` contains 17 distinct localization keys, the `FFQ80`
identifier, the asset-level symbol `NPC_DET_VAR_BeraGrastar`, and six
serialized `dialog_line_*` handlers. This strongly associates the resource
with Bera's quest, but does not map each key to a callback. The 17 rows were
reviewed in English, Japanese, Chinese, and active Korean. Content separates
ten dialogue or player-choice strings from seven quest-log, objective, or UI
strings. Four correction candidates were recorded; no CSV edit was applied.
See [`dialogue-context-ffq80-revalidation-20261110.md`](dialogue-context-ffq80-revalidation-20261110.md).

## Second Expanded Group: Grim's Rescue / `TR01`

`457008.quest_bxml` contains 119 distinct localization keys, `QUEST_ID TR01`,
the asset-level symbol `NPC_DAL_GNO_CenturionGastet`, and 50 serialized
`dialog_line_*` callbacks. It contains quest text spanning Grim's captivity,
the rescue mission, and the gnomish release bargain; the single NPC symbol
does not make every key Gastet's dialogue. Key-to-callback mapping and exact
speaker turns remain unknown.

All 119 rows were revalidated against English, Japanese, Chinese, and active
Korean. Twelve findings were recorded: ten correction candidates and two
uncertain cases. Exact duplicate English groups retain identical Korean
translations; all four-language rows are free of embedded line breaks and
markup/runtime tokens. Details and the complete ID list are in
[`dialogue-context-tr01-revalidation-20261110.md`](dialogue-context-tr01-revalidation-20261110.md).

## First Expanded Group: Grim Onwig / `TR06`

`494374.quest_bxml` contains 97 distinct localization keys, the `TR06` quest
identifier, the `NPC_DAL_Alm_GrimOnwig` symbol, and 23 `dialog_line_*`
handlers. This strongly associates the resource with the Grim Onwig quest
context. It does not prove that all 97 keys are spoken by Grim or identify
which key belongs to which handler. The handler table order is not treated as
playback order.

All 97 matched IDs are present in the active Korean, English, Japanese, and
Chinese `default` tables. The Korean rows contain no embedded line breaks,
runtime brace tokens, or markup. Five groups have exact duplicate English
source strings within this asset; each group's Korean translations are
currently identical.

### Revalidation Findings

These are read-only reviewer findings and proposed text, not permission to
edit the active translation CSV.

| IDs | Finding | Proposed Korean / disposition |
| --- | --- | --- |
| `15811` | The quest context identifies `Missives` as the named book `Missives of Sable`; Japanese `黒紋章の書` and Chinese `萨贝尔书卷` also identify a book/title. Current `쪽지(Missives)` is both a literal mistranslation and inconsistent with the established title elsewhere in the same group. | `그럼 그게 앰비언트의 거울(Glass of Ambient)이야? 잘했군. 여기에 따르면 세이블의 서신(Missives of Sable)은... 흠, 아주 흥미롭군. 그건 나중에 보기로 하지.` High-confidence correction candidate. |
| `2270`, `17289`, `28445`, `56303`, `59057` | These shortened/capitalized references point to the Glass of Ambient, which the same quest context and aligned sources identify as a magical mirror. Current forms vary among `그 유리(Glass)`, `유리`, `유리(Glass)`, `글라스(Glass)`, and `글래스`. | Use the established `거울` sense consistently: `그 거울` at `2270`; `거울로` at `17289`; `거울(Glass)` at `28445`; `거울` at `56303`; `거울은 어디서 찾을 수 있지?` at `59057`. High-confidence terminology correction candidates. |
| `2270` | In the quest context, “get rid of the Hierophant” means remove the leader from power, as made explicit in repeated lines `5285` and `28129`; current `없애려면` can imply killing her. The English `dove` is a familiar address, not a name. Prior decision D-19432 uses `친구` for this vocative. | `친구, 초조해 죽겠어. 대사제(Hierophant)를 권좌에서 끌어내리려면 네가 그 거울을 가져와야 해. 알겠어?` High-confidence correction candidate. |
| `31011` | Casual English and Japanese are at odds with the literary vocative `그대여`; the quest-group voice is informal. `plot` here is Grim's plan, not a separate mysterious plot. | `돌아왔군, 친구. 이제 계획을 마무리하고 대사제(Hierophant)에게 복수하자.` High-confidence style candidate. |
| `37631` | The informal reassurance is weakened by `그대`, and the final `나도 그런 기분을 잘 아니까` is less direct than the source's “I know the feeling all too well.” | `기다릴게, 친구. 받아들이기 힘든 이야기란 거 알아. 나도 그런 기분 잘 알아.` Medium-high confidence naturalness/style candidate. |
| `4135`, `62969` | These are exact duplicate English/Japanese/Chinese/Korean source groups. Korean uses `그대` while other Grim-context rows render the same familiar `dove` vocative as `친구`. Older D-19433 left this address unresolved because the speaker context was unknown; the `TR06` asset now supplies stronger, though not line-level, context. | `다음은 숨겨진 길로 이루어진 미로, 어둠의 미로야. 친구, 네가 직접 길을 찾아 빠져나가야 해.` Reconsider the earlier address-only disposition; retain the same Korean wording for both IDs. |
| `44585` | The current `우리가 일정에 쫓기는 건 아닌 거 알아, 그대` is stiff and the elevated address conflicts with Grim's surrounding informal speech. Meaning and urgency are otherwise preserved. | `우리한테 정해진 일정이 있는 건 아니란 거 알아, 친구. 그래도 오래 기다릴수록 내 계획을 마무리하기 더 어려워져. 이제 움직여야 해.` Medium-high confidence naturalness/style candidate. |

The remaining rows did not show a clearly supported meaning, voice, or
formatting defect in this pass. This is not a claim that their exact speaker
or sequence has been proven. No Korean polite ending (`-요`, `-습니다`) was
found abruptly mixed into this quest group; the voice findings above concern
address choice, elevated diction, and naturalness rather than a formal/polite
speech-level switch.

## Thirty-Fifth Expanded Group: Kells Cafferty / `SQ02`

`441938.quest_bxml` contains 213 distinct localization keys, `QUEST_ID
SQ02`, the asset-level symbol `NPC_POE_ALM_KellsCafferty`, and 85 serialized
`dialog_line_*` handlers. The quest concerns Kells, the Amrynthian Band, and
the Seelie Fae. These asset-level references do not map individual keys to
speakers, callbacks, branches, or playback order.

All 213 rows were revalidated against English, Japanese, Chinese, and active
Korean. Six correction findings affecting ten IDs were recorded. The nine
exact-English duplicate groups (20 rows) have identical text in all four
locales. Both runtime markers are preserved in their corresponding rows;
there are no embedded line breaks or markup. No Korean CSV was changed. See
[`dialogue-context-sq02-revalidation-20261110.md`](dialogue-context-sq02-revalidation-20261110.md)
for the findings and complete evidence.

## Thirty-Sixth Expanded Group: House of Ballads Contest / `HM01`

`457589.quest_bxml` contains 216 distinct localization keys, `QUEST_ID
HM01`, the asset-level symbol `NPC_DAL_SEE_Green`, and 155 serialized
`dialog_line_*` handlers. The keys cover the House of Ballads, the contest
for Sir Sagrell's seat, and the Grave Thresh. The symbol and handler count do
not map individual keys to Green, other speakers, callbacks, branches, or
playback order.

All 216 rows were revalidated against English, Japanese, Chinese, and active
Korean. Fifteen correction findings affecting 18 IDs and three unresolved
source/context holds were recorded. The six exact-English duplicate groups
(14 rows) already have identical Korean text, although Japanese or Chinese
wording differs in some groups. No Korean CSV was changed. See
[`dialogue-context-hm01-revalidation-20261110.md`](dialogue-context-hm01-revalidation-20261110.md)
for the findings and complete evidence.

## Thirty-Seventh Expanded Group: Ost Ordura / `KV03`

`467727.quest_bxml` contains 96 distinct localization keys, `QUEST_ID KV03`,
the asset-level symbol `NPC_OstOrdura`, a `PLAYER` symbol, and 47 serialized
`dialog_line_*` handlers. Its text covers Ost's patrol, Brigand Hall Caverns,
the Niskaru and Heart of Sibun, the Fahrlangi, and Warsworn ranks and history.
The asset does not map localization keys to individual speakers, callbacks,
branches, or playback order.

All 96 rows were revalidated against English, Japanese, Chinese, and active
Korean. Six correction findings were recorded; one exact-English duplicate
group (two rows) already matches across all four locales. No Korean CSV was
changed. See
[`dialogue-context-kv03-revalidation-20261110.md`](dialogue-context-kv03-revalidation-20261110.md)
for the proposals and complete evidence.

## Thirty-Eighth Expanded Group: Gwyn Anwy / `KV07`

`501659.quest_bxml` contains 129 distinct localization keys, `QUEST_ID KV07`,
the asset-level symbol `NPC_GwynAnwy`, quest-state names including
`found_mother` and `gwyn_ran`, and 58 serialized `dialog_line_*` handlers.
The text covers Gwyn's search for her mother, the Mystic Hammer, the Hall of
the Firstsworn, the Sacred Passage, and Besin. The asset does not map
localization keys to individual speakers, callbacks, branches, or playback
order.

All 129 rows were revalidated against English, Japanese, Chinese, and active
Korean. Eight correction findings affecting 11 IDs were recorded. Four
exact-English duplicate groups already have identical text in all four
locales. No Korean CSV was changed. See
[`dialogue-context-kv07-revalidation-20261110.md`](dialogue-context-kv07-revalidation-20261110.md)
for the proposals and complete evidence.

## Thirty-Ninth Expanded Group: Khamazandu's Gift / `KVSQ02`

`540798.quest_bxml` contains 59 distinct localization keys, `QUEST_ID
KVSQ02`, the asset-level symbol `NPC_KV10_Khamazandu`, and 28 serialized
`dialog_line_*` handlers. Its text covers Khamazandu's offer, the killing of
Gwyn Anwy and other Warsworn leaders, Besin's helm, and the Heart of Sibun.
The asset does not map localization keys to individual speakers, callbacks,
branches, or playback order.

All 59 rows were revalidated against English, Japanese, Chinese, and active
Korean. Eight correction findings affecting 15 unique IDs were recorded,
including a repeated English sentence whose Korean rendering varied across
seven journal entries. There are no fully identical English-row groups. No
Korean CSV was changed. See
[`dialogue-context-kvsq02-revalidation-20261110.md`](dialogue-context-kvsq02-revalidation-20261110.md)
for the proposals and complete evidence.

## Fortieth Expanded Group: Erion Raff / `HP02`

`545970.quest_bxml` contains 84 distinct localization keys, `QUEST_ID HP02`,
the asset-level symbol `NPC_POE_DOK_ErionRaff`, five quest-target handlers,
and 37 serialized `dialog_line_*` handlers. Its text covers the three Fae
staffs, their recovery and reforging, the Deep Slumber, and exchanges with
several characters. The asset-level NPC symbol and handler count do not map
localization keys to speakers, callbacks, branches, or playback order.

All 84 rows were revalidated against English, Japanese, Chinese, and active
Korean. Twelve correction findings affecting 14 IDs and one unresolved
meaning case were recorded. All 14 correction-candidate IDs were applied and
rechecked; the reading at `33002` remains on hold. Four exact-English
duplicate groups already match across all four locales. No extracted game
asset was changed. See
[`dialogue-context-hp02-revalidation-20261110.md`](dialogue-context-hp02-revalidation-20261110.md)
for the findings and complete evidence.

## Forty-First Expanded Group: Ruin Imas / `FFQ26`

`747929.quest_bxml` contains 39 distinct localization keys, `QUEST_ID FFQ26`,
the asset-level symbol `NPC_DET_GNO_RuinImas`, and 14 serialized
`dialog_line_*` handlers. Its text concerns Ruin Imas, the mysterious
Culminite ore, and the prospects for Apotyre. The NPC symbol and handler
count do not map localization keys to speakers, callbacks, branches, or
playback order.

All 39 rows were revalidated against English, Japanese, Chinese, and active
Korean. Three correction findings affecting four IDs were applied and
rechecked. The format candidate at `7835` was retained as already compliant.
Three exact-English duplicate groups already match across all four locales.
No extracted game asset was changed. See
[`dialogue-context-ffq26-revalidation-20261110.md`](dialogue-context-ffq26-revalidation-20261110.md)
for the evidence and proposed corrections.

## Forty-Second Expanded Group: Murdoc Hain / `FFQ03`

`495487.quest_bxml` contains 41 distinct localization keys, `QUEST_ID FFQ03`,
the asset-level symbol `NPC_DAL_VAR_MurdocHain`, two quest-target handlers,
and 16 serialized `dialog_line_*` handlers. Its text concerns Murdoc Hain's
fire potions, the reagents Tindertwig and Scarwood Bark, and the village
militia's boggart problem. The NPC symbol and handler count do not map
localization keys to speakers, callbacks, branches, or playback order.

All 41 rows were revalidated against English, Japanese, Chinese, and active
Korean. Three correction findings affecting 10 IDs were applied and
rechecked; two source/context readings remain on hold. Three exact-English
duplicate groups already match across all four locales. No extracted game
asset was changed. See
[`dialogue-context-ffq03-revalidation-20261110.md`](dialogue-context-ffq03-revalidation-20261110.md)
for the evidence and proposed corrections.

## Forty-Third Expanded Group: Enconeg Holn / `SQ15`

`695918.quest_bxml` contains 47 distinct localization keys, `QUEST_ID SQ15`,
the asset-level symbol `NPC_DAL_STR_EnconegHoln_2`, and 20 serialized
`dialog_line_*` handlers. Its text covers Ettinmere, Enconeg Holn's family,
Imelda's grave charm, and the ettin threat. The NPC symbol and handler count
do not map localization keys to speakers, callbacks, branches, or playback
order.

All 47 rows were revalidated against English, Japanese, Chinese, and active
Korean. Both correction-candidate IDs were applied and rechecked. Uncertain
kinship readings at `9001` and `18532` remain on hold. Both exact-English
duplicate groups already match across all four locales. No extracted game
asset was changed. See
[`dialogue-context-sq15-revalidation-20261110.md`](dialogue-context-sq15-revalidation-20261110.md)
for the evidence and proposed corrections.

## Forty-Fourth Expanded Group: Captain Keloran / `SQ69`

`611596.quest_bxml` contains 82 distinct localization keys, `QUEST_ID SQ69`,
the asset-level symbol `NPC_ALA_LJO_CaptainKeloran`, seven quest-target
handlers, and 29 serialized `dialog_line_*` handlers. Its text covers the
assault on Shadow Pass, the Ariad reinforcements, and Desiderus Trav's
campaign against the Tuatha. The NPC symbol and handler count do not map
localization keys to speakers, callbacks, branches, or playback order.

All 82 rows were revalidated against English, Japanese, Chinese, and active
Korean. All five correction findings affecting nine IDs were applied and
rechecked. All nine exact-English duplicate groups already match across all
four locales. No extracted game asset was changed. See
[`dialogue-context-sq69-revalidation-20261110.md`](dialogue-context-sq69-revalidation-20261110.md)
for the evidence and proposed corrections.

## Forty-Fifth Expanded Group: Coilsbain Cavern / `U03`

`616680.quest_bxml` contains 82 distinct localization keys, the asset-level
symbol `NPC_DAL_ALM_ThaddeusHoln`, 19 serialized U03 quest-target handlers,
and 32 serialized U03 `dialog_line_*` handlers. The index extracts
`QUEST_ID ACTOR`; U03 is supported by the serialized handler and identifier
prefixes, so the two values are recorded separately rather than conflated.
The asset-level NPC symbol and handlers do not map individual keys to
speakers, callbacks, branches, or playback order.

All 82 rows were revalidated against English, Japanese, Chinese, and active
Korean. Seven correction findings affecting seven IDs and four unresolved
register questions were recorded. All three exact-English duplicate groups
already match across all four locales. No Korean CSV was changed. See
[`dialogue-context-u03-revalidation-20261110.md`](dialogue-context-u03-revalidation-20261110.md)
for the evidence and proposed corrections.

## Forty-Sixth Expanded Group: Elrod Edman / `FFQ17`

`710527.quest_bxml` contains 91 distinct localization keys, `QUEST_ID FFQ17`,
the asset-level symbol `NPC_POE_ALM_ElrodEdman`, six quest-target handlers,
and 43 serialized `dialog_line_*` handlers. Its text concerns suspected
Tuatha spies among the refugees and the fates of Anred, Froma, and Nag. The
NPC symbol and handler count do not map individual keys to speakers,
callbacks, branches, or playback order.

All 91 rows were revalidated against English, Japanese, Chinese, and active
Korean. Six correction findings affecting seven IDs and four unresolved
source/context questions were recorded. All four exact-English duplicate
groups already match across all four locales. No Korean CSV was changed. See
[`dialogue-context-ffq17-revalidation-20261110.md`](dialogue-context-ffq17-revalidation-20261110.md)
for the evidence and proposed corrections.

## Forty-Seventh Expanded Group: Master's Pick Quest / `TR03`

`467744.quest_bxml` contains 104 distinct localization keys, `QUEST_ID TR03`,
the asset-level symbol `NPC_ADE_GNO_ElorenCriet`, six quest-target handlers,
and 35 serialized `dialog_line_*` handlers. The content concerns the
Master's Pick, Eloren Criet, Argine, Grim Onwig, and the Hierophant, alongside
dialogue, journal, objective, and UI text. The asset-level NPC symbol and
handler count do not map individual keys to speakers, callbacks, branches,
or playback order.

All 104 rows were revalidated against English, Japanese, Chinese, and active
Korean. Eight correction candidates and three unresolved questions were
recorded; the two exact-English duplicate groups already match across all
four locales. No Korean CSV was changed. See
[`dialogue-context-tr03-revalidation-20261110.md`](dialogue-context-tr03-revalidation-20261110.md)
for the evidence and proposed corrections.

## Forty-Eighth Expanded Group: Glianal / `MQ05`

`563881.quest_bxml` contains 332 distinct localization keys, `QUEST_ID MQ05`,
the asset-level symbol `NPC_DAL_SEE_Glianal`, and 136 serialized
`dialog_line_*` handlers. The keys span the Codex of Destiny, Glianal,
Nyralim, Ysa, Gnarsh, the Tuatha, and related dialogue, choices, objectives,
journal, and UI text. The NPC symbol and handler count do not map individual
keys to speakers, callbacks, branches, or playback order.

All 332 rows were revalidated against English, Japanese, Chinese, and active
Korean. Seven correction findings affecting twelve IDs and two unresolved
register questions were recorded. All 41 exact-English duplicate groups (106
rows) already have matching Korean translations. No embedded line breaks,
runtime markers, or markup were found. All 12 correction-candidate IDs were
approved, applied, and rechecked; register holds at `60868` and `61926`
remain. No extracted game asset was changed. See
[`dialogue-context-mq05-revalidation-20261110.md`](dialogue-context-mq05-revalidation-20261110.md)
for the evidence and proposed corrections.

## Forty-Ninth Expanded Group: Family Rivalry / `SQ54`

`588388.quest_bxml` contains 114 distinct localization keys, `QUEST_ID SQ54`,
the asset-level symbol `NPC_DET_ALM_Beorn`, and 46 serialized
`dialog_line_*` handlers. The keys cover Steg Darkvari, Hrindi Zungar, the
rival mining families, Beorn, and the Whitestone cage, alongside dialogue,
quest, journal, objective, and UI text. The NPC symbol and handler count do
not map individual keys to speakers, callbacks, branches, or playback order.

All 114 rows were revalidated against English, Japanese, Chinese, and active
Korean. Ten correction findings affecting 23 IDs and one unresolved meaning
question were recorded. All six exact-English duplicate groups (12 rows)
already have matching Korean translations. The `$SQ54.bribe_value$` token is
preserved in both gold-offer rows; no embedded line breaks or other markup
were found. The 22 in-asset candidate IDs and supplemental cross-asset ID
`26210` were approved, applied, and rechecked; the meaning question at
`14051` remains on hold. See
[`dialogue-context-sq54-revalidation-20261110.md`](dialogue-context-sq54-revalidation-20261110.md)
for the evidence and proposed corrections.

## Fiftieth Expanded Group: General Tilera / `MQ09`

`589911.quest_bxml` contains 154 distinct localization keys, `QUEST_ID MQ09`,
the asset-level symbol `NPC_MQ_LJO_GeneralTilera`, 14 quest-target handlers,
and 54 serialized `dialog_line_*` handlers. The text covers General Tilera,
Alyn Shir, the Piercing Light, Urul-Tusk, the Windstones, and related
dialogue, quest updates, objectives, choices, and labels. The asset-level NPC
and handlers do not map each key to a speaker, callback, branch, or playback
position.

All 154 rows were revalidated against English, Japanese, Chinese, and active
Korean. Fourteen correction findings affecting 15 IDs and two unresolved
address/register questions were recorded. Three exact-English duplicate
groups already have matching Korean; two similar gate questions were kept
distinct because their English differs (`this gate` / `the gate`). No
embedded line breaks, runtime markers, or markup were found, and no Korean
game asset was changed. The 15 correction-candidate IDs were approved,
applied, and rechecked; address/register holds at `32239` and `32716` remain.
See
[`dialogue-context-mq09-revalidation-20261110.md`](dialogue-context-mq09-revalidation-20261110.md)
for the evidence and full ID list.

## Fifty-First Expanded Group: Dannestar Island / `MQ14`

`589924.quest_bxml` contains 192 distinct localization keys, `QUEST_ID MQ14`,
the asset-level symbol `NPC_MQ_UNS_Cydan`, seven quest-target handlers, and
96 serialized `dialog_line_*` handlers. The text covers the House of
Sorrows' shadow path, Dannestar Tower, the Well of Souls, Ventrinio, Cydan,
Hugues, Alyn Shir, the Laz, and related dialogue, choices, quest updates,
objectives, and labels. The asset-level NPC and handlers do not map each key
to a speaker, callback, branch, or playback position.

All 192 rows were revalidated against English, Japanese, Chinese, and active
Korean. Eleven correction findings affecting 17 IDs and three unresolved
register/address rows were recorded. The exact-English repeated Ventrinio
question and `Shadow Walk` title groups already match; punctuation-only rows
also match. No embedded line breaks, runtime markers, or markup were found,
and no extracted game asset was changed. All 17 correction-candidate IDs
were approved, applied, and rechecked; holds at `29557`, `30364`, and `32421`
remain unresolved. See
[`dialogue-context-mq14-revalidation-20261110.md`](dialogue-context-mq14-revalidation-20261110.md)
for the evidence and full ID list.

## Fifty-Second Expanded Group: Feride Ouet / `SQ59`

`591256.quest_bxml` contains 191 distinct localization keys, `QUEST_ID SQ59`,
the asset-level symbol `NPC_ADE_GNO_FerideOuet`, and 57 serialized
`dialog_line_*` handlers. The content concerns Feride's research, the
Sandstone Villa and Allestar, letters and observers, and the Hospitalis
Quarters, alongside dialogue, player choices, quest updates, objectives,
titles, and UI text. The asset-level NPC and handlers do not map each key to a
speaker, callback, branch, or playback position.

All 191 rows were revalidated against English, Japanese, Chinese, and active
Korean. Eight correction findings affecting 11 unique IDs and five unresolved
readings were recorded. Ten exact-English duplicate groups already have
matching Korean, and all four locales are free of embedded line breaks,
runtime markers, and markup in these rows. All 11 correction-candidate IDs
were approved, applied, and rechecked; the five unresolved readings remain on
hold. No extracted game asset was changed. See
[`dialogue-context-sq59-revalidation-20261110.md`](dialogue-context-sq59-revalidation-20261110.md)
for the evidence and full ID list.

## Fifty-Third Expanded Group: Aetill Algar / `SQ53`

`592526.quest_bxml` contains 131 distinct localization keys, `QUEST_ID SQ53`,
the asset-level symbol `NPC_DET_ALM_AetillAlgar`, and 58 serialized
`dialog_line_*` handlers. Its text concerns the Skoria mine and tyrenium
dispute, Aetill Algar, Adath Skoria, Whitestone, and Apotyre, alongside
dialogue, choices, quest updates, objectives, journal text, and UI labels.
The NPC symbol and handlers do not map individual keys to speakers, callbacks,
branches, or playback position.

All 131 rows were revalidated against English, Japanese, Chinese, and active
Korean. Six correction candidates and two unresolved readings were recorded.
All 11 exact-English duplicate groups already have identical Korean, and the
`$SQ53.bribe_value$` token is preserved in both offer rows. No embedded line
breaks, other runtime markers, or markup were found. All six correction
candidates were approved, applied, and rechecked; holds at `6405` and `27562`
remain unresolved. No extracted game asset was changed. See
[`dialogue-context-sq53-revalidation-20261110.md`](dialogue-context-sq53-revalidation-20261110.md)
for the findings and full ID list.

## Fifty-Fourth Expanded Group: Parwen Well / `SQ58`

`593901.quest_bxml` contains 92 distinct localization keys, `QUEST_ID SQ58`,
the asset-level symbol `NPC_DET_DOK_ParwenWell`, and 33 serialized
`dialog_line_*` handlers. The text concerns Courdan's missing letter, Parwen
Well's courier role, Scholar Airancourt's orders, and the Domus Politica.
The asset-level NPC and handler data do not map individual keys to speakers,
callbacks, branches, or playback positions.

All 92 rows were revalidated against English, Japanese, Chinese, and active
Korean. Seven correction findings were recorded, including inconsistent
`Isles` wording, incomplete English pairings, and two naturalness refinements.
The two exact-English duplicate groups already have matching Korean, and the
`$SQ58.parwen_bribe$` marker is preserved at both occurrences. No embedded
line breaks were found. All seven correction-candidate IDs were approved,
applied, and rechecked; no extracted game asset was changed. See
[`dialogue-context-sq58-revalidation-20261110.md`](dialogue-context-sq58-revalidation-20261110.md)
for the evidence and full ID list.

## Fifty-Fifth Expanded Group: Aergase's Quest / `SQ55`

`597592.quest_bxml` contains 154 localization keys, `QUEST_ID SQ55`, the
asset-level symbol `NPC_DET_SEE_Aergase`, and 57 serialized
`dialog_line_*` handlers. Its text concerns the Narca curse, the Crossing,
Caer Elatha, the Keepers, Pura, Maxen, Halcyor, and Florion, alongside
objectives, journal text, and UI labels. The asset symbol and handler count
do not map individual keys to speakers, callbacks, branches, or playback
positions. ID `63854` explicitly identifies Maxen; other speaker assignments
and dialogue order remain unknown.

All 154 rows were revalidated against English, Japanese, Chinese, and active
Korean. Fifteen corrections were applied to the Korean working CSV. Three
meaning or naturalness findings remain unresolved. The ten exact-English
duplicate groups have matching Korean, and no embedded line breaks, runtime
markers, or markup were found. See
[`dialogue-context-sq55-revalidation-20261110.md`](dialogue-context-sq55-revalidation-20261110.md)
for the evidence and full ID list.

## Fifty-Sixth Expanded Group: Wounded Well Gnome / `MQ01`

`613083.quest_bxml` contains 267 localization keys, `QUEST_ID MQ01`, the
asset-level symbol `NPC_MQ_GNO_Encel`, and 188 serialized
`dialog_line_*` handlers. Its content covers the attack on Allestar Tower,
the Well of Souls, Encel, Fomorous Hugues, the Tuatha, combat tutorials,
objectives, journal entries, and UI labels. The asset-level NPC and handler
data do not map individual keys to speakers or playback positions. IDs `6718`
and `55159` explicitly identify Fomorous Hugues; other speaker assignments
remain unknown.

All 267 rows were revalidated against English, Japanese, Chinese, and active
Korean. Thirty-three correction candidates were recorded for Well of Souls
terminology and pairing, missing Encel and `Children of Dust` pairings,
Praetorian terminology, and three speech-level mismatches. One source-nuance
hold remains at `15621`. Fourteen exact-English duplicate groups already have
matching Korean, and no embedded line breaks, runtime markers, or markup
were found. No Korean CSV was changed. See
[`dialogue-context-mq01-revalidation-20261110.md`](dialogue-context-mq01-revalidation-20261110.md)
for the evidence and full ID list.

## Fifty-Seventh Expanded Group: Drowned Forest / `1292772`

`1292772.quest_bxml` contains 70 localization keys, the asset-level symbol
`NPC_KLU_DOK_LucentPrinn`, and 87 serialized dialogue-handler names with the
`NQD_Region_DrownedForest` prefix. It has no explicit `QUEST_ID`. These are
scene and asset clues only; no key is mapped to an individual speaker,
callback, branch, or playback position.

All 70 rows were revalidated against English, Japanese, Chinese, and active
Korean. Four correction proposals and two speech-level holds were recorded.
Five exact-English duplicate groups match across all four languages. No
embedded line breaks, runtime markers, or markup were found, and no Korean CSV
was changed. See
[`dialogue-context-1292772-revalidation-20261110.md`](dialogue-context-1292772-revalidation-20261110.md)
for the full evidence and ID list.

## Fifty-Eighth Expanded Group: Aergase-Associated Asset / `1443829`

`1443829.quest_bxml` contains 138 localization keys, the asset-level symbol
`NPC_DET_SEE_Aergase`, and 53 serialized `dialog_line_*` handlers whose
generated names contain the `SQ124` prefix. It has no explicit `QUEST_ID`.
Neither the NPC symbol nor handler names map individual keys to a speaker,
callback, branch, or playback position.

All 138 rows were revalidated against English, Japanese, Chinese, and active
Korean. Thirteen correction candidates and seven evidence-limited holds were
recorded; two reviewed rows were retained without changes. Three exact-English
duplicate groups match across all four languages. No embedded line breaks,
runtime markers, or markup were found. No Korean CSV was changed. See
[`dialogue-context-1443829-revalidation-20261111.md`](dialogue-context-1443829-revalidation-20261111.md)
for the evidence and full ID list.

## Fifty-Ninth Expanded Group: Oasis of Ingress / `599193`

`599193.quest_bxml` contains 30 localization keys, nine NPC symbols (including
Aergase), and 20 serialized `dialog_line_*` handlers, with no explicit
`QUEST_ID`. It is a multi-NPC asset, so the Aergase symbol does not establish
the speaker of any key or map a key to a callback or playback position.

All 30 rows were revalidated against English, Japanese, Chinese, and active
Korean. The repeated `Era Ondrick` label matches across all four languages.
Two evidence-limited holds were recorded: a meaning conflict at `39367` and a
speaker/register question at `64468`. No Korean CSV was changed. See
[`dialogue-context-599193-revalidation-20261111.md`](dialogue-context-599193-revalidation-20261111.md)
for the full ID list and evidence.

## Sixtieth Expanded Group: Alserund / House of Valor / `1772558`

`1772558.quest_bxml` contains 169 localization keys, 17 NPC symbols
(including Aergase, Halcyor, Maxen, and Pura), and 116 serialized
`dialog_line_*` handlers, with no explicit `QUEST_ID`. It spans several
topics and NPCs; no per-key speaker, callback, branch, or playback position
was established.

All 169 rows were revalidated against English, Japanese, Chinese, and active
Korean. Nine correction candidates and two evidence-limited holds were
recorded. The 22 exact-English duplicate groups already match across all four
languages; no embedded line breaks, runtime markers, or markup were found.
No Korean CSV was changed. See
[`dialogue-context-1772558-revalidation-20261111.md`](dialogue-context-1772558-revalidation-20261111.md)
for the full ID list and evidence.

## Sixty-First and Sixty-Second Expanded Groups: `FFQ36` / `SQ89`

`1164089.quest_bxml` (`FFQ36`) and `1272808.quest_bxml` (`SQ89`) each
contain ten localization keys and one asset-level NPC symbol, respectively
Syllareta Vauner and Abblier. Neither asset contains serialized dialogue
handlers; these keys are quest objectives, journal/status text, and UI labels,
not evidence for speaker voice or dialogue order.

All 20 rows were revalidated against English, Japanese, Chinese, and active
Korean. The review recorded five name/terminology candidates and one title
hold. The repeated `Quest Failed` group matches across all four languages.
No Korean CSV was changed. See
[`dialogue-context-1164089-1272808-revalidation-20261111.md`](dialogue-context-1164089-1272808-revalidation-20261111.md)
for the evidence and full ID set.

## Additional Quest-Text and Dialogue-Context Assets

The read-only `FFQ31` / `FFQ32` / `FFQ53` pass covers 39 IDs across
`760709.quest_bxml`, `760711.quest_bxml`, and `1333132.quest_bxml`. These
assets contain quest text but no dialogue handlers; two correction findings
affecting five IDs were recorded. See
[`dialogue-context-760709-760711-1333132-revalidation-20261111.md`](dialogue-context-760709-760711-1333132-revalidation-20261111.md).

The next pass covers 91 IDs across `1611923.quest_bxml` (`SQ147`),
`747916.quest_bxml` (`FFQ23_A/B/C`), and `598316.quest_bxml` (`SQ60`). Three
correction findings affect four IDs, and five IDs remain on evidence-limited
holds. Repeated-English groups within the pass match in Korean; no embedded
line breaks, runtime markers, or markup were found. No Korean CSV was changed.
See
[`dialogue-context-1611923-747916-598316-revalidation-20261111.md`](dialogue-context-1611923-747916-598316-revalidation-20261111.md).

The `SQ81` completion pass reviewed the 110 rows omitted from the earlier
Brio pilot and completed ledger coverage for all 122 keys in
`1339422.quest_bxml`. Its five NPC symbols do not establish per-key speakers
or playback order. Six exact-English groups already match across the four
languages; four correction proposals and two holds are recorded in
[`dialogue-context-1339422-sq81-completion-20261111.md`](dialogue-context-1339422-sq81-completion-20261111.md).

The small quest-text pass reviewed 25 IDs across five assets:
`1619339.quest_bxml`, `1695866.quest_bxml`, `1698817.quest_bxml`,
`1698819.quest_bxml`, and `1913467.quest_bxml`. Three correction candidates
were recorded, with no holds and no translation CSV edits. None has an
explicit quest ID, NPC symbol, or dialogue handler. See
[`dialogue-context-small-quest-text-assets-revalidation-20261111.md`](dialogue-context-small-quest-text-assets-revalidation-20261111.md).

A dialogue-text pass reviewed 12 rows in `1392303.quest_bxml`,
`580435.quest_bxml`, `592788.quest_bxml`, and `695920.quest_bxml`. These
assets contain dialogue handlers but no quest ID or NPC symbol; they provide
no per-key speaker or playback-order mapping. One wording candidate and one
vocalization hold were recorded, without CSV edits. See
[`dialogue-context-unmapped-dialogue-assets-revalidation-20261111.md`](dialogue-context-unmapped-dialogue-assets-revalidation-20261111.md).

The following 19-row pass reviewed `1379398.quest_bxml` (alchemy dialogue),
`1963058.quest_bxml` (Wild Evenroot), and `462518.quest_bxml` (unmapped
dialogue). It recorded two correction candidates and one source/context hold.
The asset-level handlers do not establish per-key speaker or order; no
translation CSV was changed. See
[`dialogue-context-small-dialogue-and-evenroot-assets-revalidation-20261111.md`](dialogue-context-small-dialogue-and-evenroot-assets-revalidation-20261111.md).

The Chaos and druid armor pass reviewed all keys in
`2604102.quest_bxml`, `2607900.quest_bxml`, `2608000.quest_bxml`, and
`2608200.quest_bxml`: 19 distinct asset-linked IDs plus one cross-corpus
`Chaos Scholar` reference. It recorded 11 correction-candidate IDs and no
holds. The shared `Quest Complete` ID was recorded once with its 44 asset
links; no translation CSV was changed. See
[`dialogue-context-chaos-quest-assets-revalidation-20261111.md`](dialogue-context-chaos-quest-assets-revalidation-20261111.md).

The next pass revalidated 57 IDs across `749750.quest_bxml` (`FFQ23_A`),
`749752.quest_bxml` (`FFQ23_B`), `749754.quest_bxml` (`FFQ23_C`),
`1539079.quest_bxml` (`KVSQ06` handler prefix), and
`1991469.quest_bxml` (`DLC2_SQ14` handler prefix). It recorded 12 correction
candidates and no holds. The FFQ23 assets each contain one dialogue handler
but no explicit quest ID or NPC symbol; their prefixes do not map individual
keys to speakers or playback order. The KVSQ06 and DLC2_SQ14 assets contain
quest-condition handlers but no dialogue handlers. No translation CSV was
changed. See
[`dialogue-context-five-assets-revalidation-20261111.md`](dialogue-context-five-assets-revalidation-20261111.md).

## Progress and Limits

- **Earlier continuation checkpoint (2026-11-11):** the generated catalogs enumerate
  all 530 quest assets and all 65,135 `default` IDs. Of 426 assets with
  matched IDs, 192 now have complete ledger coverage (9,261 unique reviewed
  IDs), 38 are partial, and 196 have no ledger entries; 104 assets have no
  matched key. The corrected extractor recognizes `DLC#_NPC_` symbols in 30
  assets while retaining asset-level-only attribution. The latest completed
  quest-group review covers all 101 IDs in `1251244.quest_bxml` (`SQ50`) and
  records 16 correction candidates and one evidence-limited hold without
  changing the translation CSV. Its two NPC symbols do not establish
  per-key speakers or playback order. See
  [`dialogue-context-1251244-sq50-nareen-farm-revalidation-20261111.md`](dialogue-context-1251244-sq50-nareen-farm-revalidation-20261111.md).
  The preceding quest-group review covers all 108 IDs in
  `1241289.quest_bxml` (`SQ41`) and records 16 correction candidates and six
  evidence-limited IDs without changing the translation CSV. The asset has
  three NPC symbols, so no per-key speaker or playback order is inferred. See
  [`dialogue-context-1241289-sq41-adar-revalidation-20261111.md`](dialogue-context-1241289-sq41-adar-revalidation-20261111.md).
  The preceding quest-group review covers all 163 IDs in `1948054.quest_bxml`
  (`DLC2_MQ03` / Anokatos context) and records seven correction candidates
  without changing the translation CSV; per-key speaker attribution and
  dialogue order remain unknown. See
  [`dialogue-context-1948054-dlc2-mq03-anokatos-revalidation-20261111.md`](dialogue-context-1948054-dlc2-mq03-anokatos-revalidation-20261111.md).
  The preceding quest-group review covers all 132 IDs in
  `2012226.quest_bxml` (`DLC1_MQ06` / Cillian Keen) and aligns two
  inconsistent translations of “Bugs collected”; per-key speaker
  attribution and dialogue order remain unknown. The earlier quest-group
  review covers all 67 IDs in `1962515.quest_bxml` (`DLC1_SQ06` / Alder
  Malloi) and records three correction candidates plus two evidence-limited
  holds. See
  [`dialogue-context-2012226-dlc1-mq06-cillian-revalidation-20261111.md`](dialogue-context-2012226-dlc1-mq06-cillian-revalidation-20261111.md),
  [`dialogue-context-1962515-dlc1-sq06-revalidation-20261111.md`](dialogue-context-1962515-dlc1-sq06-revalidation-20261111.md) and
  [`dialogue-context-next-five-expanded-assets-revalidation-20261111.md`](dialogue-context-next-five-expanded-assets-revalidation-20261111.md).
  The 7,323-ID / 158-asset figures below are the earlier report snapshot.
- Reverse-map coverage: 51,080 / 65,135 unique IDs (78.4%) have at least one
  quest-asset association. This is not translation-review completion.
- Machine-readable reverse map: 52,381 ID/asset associations across the same
  51,080 IDs and 426 assets; 1,257 IDs map to multiple assets. The index can be
  regenerated and checked with `build_dialogue_context_index.py`.
- Priority grouping index: 56 strict NPC/quest/handler candidates identified.
- Context revalidation: 56 / 56 priority assets reviewed (100%), covering
  5,208 unique IDs; the ledger now covers 7,323 unique IDs across 158 fully
  recorded assets, including 102 additional assets, in
  `TR06`, `TR01`, `TRSQ01`, `TRSQ02`, `SQ150`, `SASQ01`, `SASQ02`, `SASQ03`, `M0_SQ06`, `SQ01`, `SQ02`, `HM01`, `KV03`, `KV07`, `KVSQ02`, `FFQ80`, `SQ87`, `FFQ64`, `FFQ67`,
  `FFQ116`, `SQ126`, `FFQ35`, `SQ79`, `SQ102`, `SQ93`, `SQ100`, `SQ108`, and
  `SQ116`, `SQ117`, `SQ118`, `FFQ60`, `FFQ66`, `SQ80`, `FFQ71`, `SQ140`,
  `SQ143`, `SQ131`, `SQ145`, `SQ68`, `HP02`, `FFQ26`, `FFQ03`, `SQ15`,
  `SQ69`, `U03`, `FFQ17`, `TR03`, `MQ05`, `SQ54`, `MQ09`, `MQ14`, `SQ59`,
  `SQ53`, `SQ58`, `SQ55`, `MQ01`, `FFQ31`, `FFQ32`, `FFQ53`, `SQ147`,
  `FFQ23_A/B/C`, `SQ60`, `SQ81`, `KandirFaePools`, `ShadowOfEnfamanir`,
  `TreasuresOfMeropis`, `Cureseeker`, `SpecialDelivery`, `1392303`,
  `580435`, `592788`, `695920`, `AlchemyDialogue`, `WildEvenroot`, and
  `462518`, `ChaosScholarArmor`, `SkaldChaosCore`, `JockChaosWeapon`, and
  `AidenOConorArmor`, the four Lorestone/small assets, the four FFQ56/HMSQ01/
  FFQ45/`ao_sq_as_001` assets, the four quest-text assets, the four sparse
  assets, five small assets, five further assets, and recent small-asset
  batches.
  The unique-ID count is independently checked against the ledger and its
  four-language fingerprints:
  `dialogue-context-review-ledger.tsv`.
- The exact mapping from localization key to `dialog_line_*`, speaker turn,
  branch, and playback order remains unresolved. Do not infer order from row
  IDs, CSV order, key occurrence order, or callback table serialization.
- The generated full catalogs cover all 530 quest assets and all 65,135
  `default` IDs. Of 426 assets with matched IDs, 158 have complete ledger
  coverage (the 56 priority assets plus 102 additional assets), 42 have
  partial coverage, and 226 matched assets have no ledger entries.
  The remaining 104 assets contain no matched `default` key.
- Expanded review has started with `1292772.quest_bxml`: 70 IDs reviewed,
  four correction proposals and two speech-level holds recorded. The asset
  has no explicit `QUEST_ID`; its NPC symbol and 87 dialogue handlers do not
  establish per-key speakers or order. No CSV edit was made. See
  [`dialogue-context-1292772-revalidation-20261110.md`](dialogue-context-1292772-revalidation-20261110.md).
- The next expanded pass reviewed all 138 IDs in
  `1443829.quest_bxml`, recording 13 correction candidates and seven holds.
  The asset has an Aergase symbol and `SQ124` handler-name prefix but no
  explicit quest ID or per-key speaker/order mapping. No CSV edit was made;
  see [`dialogue-context-1443829-revalidation-20261111.md`](dialogue-context-1443829-revalidation-20261111.md).
- Two further multi-NPC assets were fully reviewed: `599193.quest_bxml`
  (30 IDs, two holds) and `1772558.quest_bxml` (169 IDs, nine correction
  candidates and two holds). Their Aergase symbols do not prove speaker
  attribution. No CSV edits were made; reports contain the full evidence and
  ID sets.
- `FFQ36` / `1164089.quest_bxml` and `SQ89` / `1272808.quest_bxml` add 20
  reviewed quest/UI IDs, five terminology candidates, and one title hold.
  Neither asset contains dialogue handlers; no speaker or voice judgment was
  inferred.
- The latest expanded pass covers 100 IDs across
  `760713.quest_bxml` (55 keys, asset-level `NPC_DAL_GNO_AvicennEtelle`) and
  `1762903.quest_bxml` (45 keys, asset-level
  `NPC_ALA_LJO_CaptainKeloran`). Four correction candidates and three
  evidence-limited holds were recorded. Neither asset's symbols or handlers
  map keys to speakers or playback order; no translation CSV was changed.
  See [`dialogue-context-two-npc-assets-revalidation-20261111.md`](dialogue-context-two-npc-assets-revalidation-20261111.md).
- The preceding expanded pass revalidated 165 IDs across five assets, plus
  supplemental ID `31283`. It recorded 33 correction candidates and seven
  register holds; the supplemental urn-reference question remains unresolved.
  No translation CSV was changed. See
  [`dialogue-context-five-pending-assets-followup-revalidation-20261111.md`](dialogue-context-five-pending-assets-followup-revalidation-20261111.md).
- A prior expanded pass covers 158 IDs across
  `2606201.quest_bxml`, `533430.quest_bxml`, `1700657.quest_bxml`,
  `1704224.quest_bxml`, and `2604701.quest_bxml`; it recorded seven
  correction candidates and three evidence-limited holds. See
  [`dialogue-context-2606201-533430-1700657-1704224-2604701-revalidation-20261111.md`](dialogue-context-2606201-533430-1700657-1704224-2604701-revalidation-20261111.md).
- The latest small-asset pass covers nine IDs across
  `1500406.quest_bxml`, `1655270.quest_bxml`, `717986.quest_bxml`, and
  `751643.quest_bxml`. It records two Lorestone terminology/format candidates,
  with no holds or translation CSV edits. See
  [`dialogue-context-lorestone-and-small-assets-revalidation-20261111.md`](dialogue-context-lorestone-and-small-assets-revalidation-20261111.md).
- A pass reviewed 27 new IDs across `1340321.quest_bxml` (FFQ56),
  `1695620.quest_bxml` (HMSQ01), `1789094.quest_bxml` (FFQ45), and
  `2700379.quest_bxml` (`ao_sq_as_001`). Four correction candidates and one
  evidence-limited hold were recorded. Shared `Quest Complete` ID `60633`
  was not duplicated; its existing row already links all 44 assets. No
  translation CSV was changed. See
  [`dialogue-context-small-quest-assets-revalidation-20261111.md`](dialogue-context-small-quest-assets-revalidation-20261111.md).
- The latest pass reviewed 36 IDs across `1985677.quest_bxml` (FFQ87),
  `1987173.quest_bxml` (DLC2_SQ11), `1988191.quest_bxml` (DLC2_SQ12), and
  `1991466.quest_bxml` (DLC2_SQ13). Seven correction candidates were
  recorded, including the Stowaway troll's type/name pairing and inconsistent
  Sandstone Villa upgrade terminology. No holds or translation CSV edits
  were recorded. See
  [`dialogue-context-four-quest-text-assets-revalidation-20261111.md`](dialogue-context-four-quest-text-assets-revalidation-20261111.md).
- The preceding pass revalidated 196 IDs across
  `425982.quest_bxml`, `449611.quest_bxml`, `461580.quest_bxml`,
  `484880.quest_bxml`, and `508141.quest_bxml`. It records 20 correction
  candidates and three source/context holds. The assets do not establish
  per-key speaker or playback order; no translation CSV was changed. See
  [`dialogue-context-five-pending-assets-revalidation-20261111.md`](dialogue-context-five-pending-assets-revalidation-20261111.md).
- The preceding pass revalidated 73 IDs across
  `1304720.quest_bxml`, `1370376.quest_bxml`, `1375390.quest_bxml`,
  `1375392.quest_bxml`, and `1476188.quest_bxml`. It records six correction
  candidates and two source/context holds without changing the translation
  CSV. Dialogue handlers do not establish per-key speakers or order. See
  [`dialogue-context-next-five-small-assets-revalidation-20261111.md`](dialogue-context-next-five-small-assets-revalidation-20261111.md).
- The latest pass revalidated 88 IDs across `1540101.quest_bxml`,
  `1743353.quest_bxml`, `1875838.quest_bxml`, `1963060.quest_bxml`, and
  `1985675.quest_bxml`. It records seven correction candidates and carries
  forward one evidence-limited hold at `61782`. The assets do not establish
  per-key speakers or playback order; no translation CSV was changed. See
  [`dialogue-context-next-five-assets-revalidation-20261111.md`](dialogue-context-next-five-assets-revalidation-20261111.md).
- The latest follow-up revalidated 65 IDs across
  `2028142.quest_bxml`, `534119.quest_bxml`, `662564.quest_bxml`,
  `725343.quest_bxml`, and `843163.quest_bxml`. It records six correction
  candidates and one evidence-limited hold at `44978`. No per-key speaker or
  playback order was inferred, and no translation CSV was changed. See
  [`dialogue-context-next-five-assets-followup-revalidation-20261111.md`](dialogue-context-next-five-assets-followup-revalidation-20261111.md).
- Most proposed translation edits remain pending the separate editor step.
  In the current working CSV, four Brio corrections and three SQ93 Font
  pairings were rechecked and recorded as applied; the SQ93 ledger now has
  14 correction candidates and five unresolved findings.
- The review ledger's 17 changed four-language fingerprints were refreshed
  only after rechecking those rows. All 56 priority assets now have review
  reports and ledger coverage. After user approval, all 26 SQ131, 27 SQ140,
  33 MQ01, and 34 SQ143 correction candidates were applied and rechecked;
  unresolved findings at SQ140 `48067`/`62309` and MQ01 `15621`, and the
  SQ143 source conflict at `1410`/`52945`, remain.
- The 22 SQ54 correction-candidate IDs and supplemental name-pairing ID
  `26210` were also applied and rechecked; SQ54 `14051` remains unresolved.
- All 15 MQ09 correction-candidate IDs were applied and rechecked; the
  address/register holds at `32239` and `32716` remain unresolved.
- CSV preservation and source-fingerprint validation passed after the SQ54
  and MQ09 batches; the original mixed line-ending counts remain unchanged.
- All 17 MQ14 correction-candidate IDs were applied and rechecked; its three
  address/register holds remain unchanged.
- All 11 SQ59 correction-candidate IDs were applied and rechecked; its five
  unresolved readings remain on hold.
- All six SQ53 correction-candidate IDs were applied and rechecked; its two
  unresolved readings remain on hold.
- All seven SQ58 correction-candidate IDs were applied and rechecked.
- All 12 MQ05 correction-candidate IDs were applied and rechecked; its two
  register holds remain unresolved.
- All 14 HP02 correction-candidate IDs were applied and rechecked; its
  unresolved meaning reading at `33002` remains on hold.
