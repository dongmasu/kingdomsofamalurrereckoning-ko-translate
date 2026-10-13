# Disposition Batch: `default` IDs 44451-44500

- Date: 2026-10-10. Compared the active Korean rows with English, original
  Japanese, Chinese, source-keyed historical questions, and prior decisions.
  This is a working disposition pass, not independent final linguistic
  approval.
- Decisions: one accepted, four `not an issue`, and eight uncertain.
- CSV edit: ID 44477.

| ID | Decision | Rationale |
| ---: | --- | --- |
| 44459 | Uncertain | The Korean field contains literal backslashes before its quotation marks. Prior decisions on the same pattern defer editing until runtime display behavior is verified; retain the wording and bytes for now. |
| 44465 | Uncertain | `proto-Wells` may name a formal magical structure rather than a generic spring. The locale readings and historical notes do not establish a canonical Korean term. |
| 44466 | Uncertain | `Old Ost` is capitalized, but English, Japanese, and Chinese leave open whether `Old` is an epithet/name or an age description. |
| 44469 | Uncertain | `Cayman Islands` is anomalous in this setting, but all locale sources reproduce it. Preserve the source pending context rather than silently normalizing it. |
| 44470 | Uncertain | `복무 통지서` is plausible for `Notice of Duty`, but the exact document function and canonical label remain open. |
| 44471 | Not an issue | `한 판 하지, 지상 사람` retains the invitation and the address `topsider` without inventing the unspecified activity. |
| 44473 | Not an issue | `{1}` then `{2}` are preserved in source order, and `훈련 교관` is a reasonable rendering of `Trainer`. |
| 44476 | Uncertain | `currish stakes` remains obscure and may be a source error. Keep the current reading without confirming what is being paraded. |
| 44477 | Accepted | Change `페이의 골짜기` to `골짜기`. English has lowercase generic `a hollow`, Japanese/Chinese describe a cave, and prior disposition D-10399 accepts `골짜기` for a lowercase physical `hollow`; `Fae` is unsupported here. |
| 44486, 44498 | Uncertain | `Hierophant` is a recurring formal title with unsettled Korean treatment; preserve both the den label and standalone title pending corpus-wide terminology review. |
| 44495 | Not an issue | `외부인의 간섭을 꺼리는 민족` naturally conveys being a private/reclusive people and preserves the request to leave the dead buried. |
| 44497 | Uncertain | English's `St. Eadric's` does not specify a church or institution type. Korean's `교회` is plausible but not established by the isolated line. |
| Remaining IDs 44451-44500, excluding listed findings | Not an issue | No additional supported row-local correction was found; source meaning, values, markers, and layout are retained. |

Decision IDs D-13637 through D-13649. Direct register totals after this
batch: 1,391 accepted, 4,459 `not an issue`, and 7,793 uncertain (13,643
categorized dispositions). The next decision ID is D-13650.

The active CSV SHA-256 is
`d724e4788a06d7b729c5533351e18e745e9f8b500da529dbed8ddc2f447be9d7`.
The UTF-8 BOM, 72,046 CRLF endings, and 39 pre-existing bare-LF endings
are preserved. All 50 source rows remain present in matching order.
ID 44459's quote-adjacent backslashes remain unresolved; ID 44473 preserves
`{1}` then `{2}`, and ID 44484 retains `+30%`. Disposition is complete
through ID 44500; resume at ID 44501 (20,634 `default` IDs remain through
ID 65134). The next preliminary report is
`default-ids-44501-44550-preliminary.md`.
