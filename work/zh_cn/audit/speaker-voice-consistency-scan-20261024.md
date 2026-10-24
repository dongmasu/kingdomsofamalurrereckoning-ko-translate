# Full `_default` Voice Audit (2026-10-24)

## Scope

Completed a full row-by-row audit of all 65,135 `_default` records. Each
Korean row was reviewed with its aligned English, Japanese, and Chinese
source text. A second, independent AI pass re-read all 373 first-pass local
findings against the full four-language rows: 199 were retained as candidates
and 174 were rejected. At triage time, the retained set was not a
human-confirmed defect list; it included readability and phrasing issues as
well as register/address inconsistencies. User-approved corrections are
tracked separately.

The full-audit snapshot was captured before human review edits. Its input
hashes, row counts, review coverage, and per-batch results are recorded in
`full-voice-20261024/summary.json`; candidate details and second-pass
dispositions are in `full-voice-20261024/local-findings.json` and
`full-voice-20261024/triage/`. Human decisions and applied changes are tracked
separately in `full-voice-20261024/manual-review.json`.

The active `default` CSV contains only `ID_Linha` and `Texto`; it has no
speaker or conversation identifier. The English, Japanese, and Chinese
reference CSVs share that limitation. Therefore, matching rows by ID,
sentence ending, or a mentioned character alone cannot reliably establish
that two different rows belong to the same person or conversation. Japanese
is useful evidence for source register, but does not by itself determine the
Korean register. The audit therefore verifies local row-level issues, not
end-to-end voice continuity for every character across scattered IDs.

## Full-Audit Results

| Result | Count |
| --- | ---: |
| Rows reviewed with all four aligned locales | 65,135 / 65,135 |
| First-pass local candidates | 373 |
| Retained by independent second pass | 199 |
| Rejected by independent second pass | 174 |
| Unresolved same-speaker links inferred | 0 |

The 199 retained candidates break down by first-pass category as follows:
`within-line` 83, `written-dialogue` 97, `address` 17, and `archaic` 2.
These categories describe candidate type, not confirmed translation errors.
In particular, `written-dialogue` includes awkward phrasing and translationese;
it does not mean every retained row has a proven speech-level mismatch.

## Human Review

The bounded human review is complete: `manual-review.json` records 199 of 199
user-approved decisions and their applied changes. The original full-audit
hashes remain an immutable pre-review snapshot; they intentionally differ from
the post-review release inputs. Comparing that review log with this generated
triage snapshot shows two ID differences: the review log contains
`default:27460` and `default:27696`, while this triage snapshot retains
`default:20871` and `default:64585`. The approved review log remains
authoritative for released edits; the AI triage does not authorize additional
CSV changes.

## Calibration Findings

| Key(s) | Finding | Treatment |
| --- | --- | --- |
| `default:655` | Existing review D-19582 identified a mixed ending within one utterance: `좋소` conflicted with the same speaker's casual `있지`, `있어`, and `내놔`. It was corrected to `좋아`. | Confirmed example of the kind of inconsistency this audit should catch; already resolved, do not re-open. |
| `default:4` | Japanese uses familiar/plain speech while Korean uses friendly `-요`. D-19566 later found the Korean choice source-compatible across the locale references. | Historical false-positive guard; do not re-open based on Japanese alone. |
| `default:29691, 29783, 30458, 32022` | The same English `Greetings.` label has several Korean registers. D-19467 retained them because speaker identities differ or are unavailable and English does not specify one honorific level. | Exclude generic repeated labels unless dialogue context proves a speaker match. |

These cases confirm that consistency means keeping one character's voice
coherent where identity and context are supported, not forcing identical
phrasing across unrelated speakers.

## Additional Register Lead

| Key | Finding | Evidence | Confidence and limit |
| --- | --- | --- | --- |
| `default:1179` | Within one utterance, Korean moves from conversational `-군/-네` to the literary `-리라` in `함께할 미래가 있으리라 생각하기 시작했는데`. | English says “I was beginning to think we had a future”; Japanese remains colloquial throughout (`わね`, `だわ`, `のよ`). Chinese also gives no clear reason for a register shift. This row was not emitted by the automated first-pass finding list; it was found in the separate manual register-marker check. | Strong local lead for an abrupt Korean register shift, but not proof of a cross-ID same-speaker mismatch. The row has no speaker metadata, so related lines cannot be safely attributed to this speaker from ID or wording alone. No replacement wording is proposed. |

## Conclusion And Next Step

The full row audit and bounded human review are complete. The repository data
does not support a complete cross-ID same-speaker audit. The separately
observed `default:1179` register shift remains a local lead without a proposed
correction. Do not infer that scattered rows share a speaker. A cross-ID
finding still needs reliable identity and conversation linkage, such as
explicit self-identification plus continuous reply context or source
dialogue metadata.

No global ending substitutions or row reordering were performed. Do not
reopen the already corrected `default:655` example. If reliable speaker or
conversation metadata becomes available, use it to compare only linked
utterances; otherwise keep cross-ID voice conclusions unresolved.
