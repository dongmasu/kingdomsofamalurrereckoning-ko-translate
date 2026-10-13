# Disposition Batch: `default` IDs 34851-34900

- Decision date: 2026-10-10.
- Scope: all 50 IDs, reconciling the preliminary scan with the active Korean,
  immutable English/Japanese/Chinese source rows, historical questions,
  prior decisions, terminology, values, markers, and structure.
- Evidence caution: `work/ja_jp/` contains the same Korean draft and was not
  treated as Japanese evidence. Japanese wording below refers to the
  immutable `src/csv/ja_jp/` source.
- Decisions: one accepted, four `not an issue`, and six uncertain.
- CSV change: ID 34877 only.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 34860 | Permanent +5% Gold Looted effect | Not an issue: the Korean retains the permanent duration and `+5%` value. Its compressed parenthetical is terse, but no value or effect is lost. |
| 34866 | `sworn to war, one of the Order` | Uncertain: Korean conveys an oath and membership in an organization, while Japanese and Chinese treat the phrase as a formal status/group. The identity and canonical title remain unresolved. |
| 34877 | `Scholia Arcana` organization name | Accepted: replace `아르카나 학회` with `스콜리아 아르카나(Scholia Arcana)`, matching accepted decisions D-6297 and D-6368. The current wording omits `Scholia` and substitutes a generic institution name. |
| 34884 | `the Testament` | Uncertain: the Korean transliteration preserves a likely named entity, but Japanese/Chinese translate it as a society/covenant and historical notes leave its faction status open. |
| 34890 | `master-at-arms` | Uncertain: `무기 교관` is plausible for a lifelong fighter trainer; Japanese gives a guard chief and Chinese a weapons master. The formal office and canonical Korean title remain unsettled. |
| 34892 | `Murderer's Hold` | Uncertain: English/Chinese support a literal named fortress while Japanese identifies Didenhil Prison. Do not replace the English-supported place rendering without resolving the source conflict. |
| 34895 | Forest and Fae resisting human footsteps | Uncertain: Korean preserves the parallel rejection, but the English antecedent could mean the Fae likewise reject human intrusion or that Fae footsteps are likewise unwelcome. Locale readings do not settle the referent. |
| 34896 | `The Id Was Killed!` UI line | Not an issue: `이드 처치!` preserves the named entity and concise event/UI function; all locales treat `Id` as a name. |
| 34898 | “rose above the call of service” | Not an issue: the English is unusual, but Korean's “did far more than requested” matches Japanese and preserves the separate reward-exceeds-pay clause. |
| 34900 | `Unbind Destiny` | Uncertain: the Korean conveys unbinding fate, but whether this is a named ability/action and how it relates to other Destiny labels need broader UI context. |
| Remaining ordinary text in IDs 34851-34900 | Dialogue, labels, values, markers, and structure | Not an issue: no additional supported row-local defect was identified in the other 40 IDs. |

## Historical Audit Reconciliation

- Historical questions for IDs 34851-34900 were checked against active
  Korean and the three immutable locale sources. Existing decisions D-6297
  and D-6368 provide the established full name used for Scholia Arcana.
- The Order/Sworn to War status, Testament, `master-at-arms`, Murderer's
  Hold, forest/Fae relation, and Unbind Destiny remain open; no global
  terminology change is inferred from this batch.
- No unrelated or source-only uncertainty was treated as approval to edit.

## Verification

- All 50 IDs were checked in English, Japanese, Chinese, and active Korean
  tables in identical key order. There are no embedded line breaks in this
  range and no runtime-marker discrepancy.
- ID 34860 retains the permanent `+5%` value. At ID 34898 the “each and
  every one” count is preserved as “한 명도 남김없이.”
- The accepted correction is limited to ID 34877.
- Active default CSV SHA-256:
  `0f368909eb16b997744f372002acb388144519807e8a2b07299a43eb61abdfcc`.
  UTF-8 BOM, 72,046 CRLF, and 39 pre-existing bare-LF endings are preserved.
- These are working dispositions, not independent final linguistic
  approval.
- Resume at ID 34901; 30,234 default IDs remain through ID 65134.
