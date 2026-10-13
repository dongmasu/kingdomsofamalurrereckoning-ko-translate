# Disposition Batch: `default` IDs 39151-39200

- Decision date: 2026-10-10.
- Scope: all 50 IDs; compared active Korean with immutable English,
  Japanese, and Chinese rows, the preliminary scan, historical audit notes,
  and prior terminology decisions.
- Evidence caution: Japanese evidence refers to immutable `src/csv/ja_jp/`;
  `work/ja_jp/` is the preserved Korean migration archive.
- New dispositions: one accepted, one `not an issue`, and two uncertain.
- CSV changes: ID 39198.

| ID | Finding | Disposition and rationale |
| ---: | --- | --- |
| 39159 | Navigation Warning / `항해 경고` | Uncertain: English supports the current generic navigation warning, Chinese specifies off-course warning, and Japanese instead reads as confirmation of an interruption. Without the UI state/context, do not narrow the label. |
| 39191 | Silkfarmers / `비단 채집꾼` | Uncertain: the occupation is represented, but prior decisions D-11449 and D-11865 leave cultivation, harvesting, gathering, and processing unresolved. |
| 39198 | mountain goats carrying the speaker through the pass | Accepted: English and Chinese make the goats the agents that smuggle/convey the speaker, while Korean made the speaker lead the goats. Japanese also supports passage using goats. Applied `산양 두어 마리가 좁은 고갯길을 지나 나를 몰래 데려다줬고, 라시르에서 알파르 군에 합류했어.` |
| Other rows in IDs 39151-39200, excluding separately listed findings | Dialogue, names, values, objectives, items, UI, and markers | Not an issue: the preliminary scan and source comparison found no additional supported row-local correction. |

## Historical Audit Reconciliation

- This range falls within the documented source-keyed audit gap at IDs
  37700-40349. Repeated Silkfarmers findings remain open, not approved.
- The localized tutorial markers at ID 39152 retain their source identities
  and order; no marker edit was needed.

## Verification

- The preliminary four-locale comparison reports matching keys/order,
  embedded line breaks, and runtime-marker identities/order.
- The corrected 39198 sentence restores the goats as the grammatical agents
  and retains the pass, Rathir, and Alfar Military.
- The active CSV retains its UTF-8 BOM, 72,046 CRLF endings, and 39
  bare-LF endings. SHA-256:
  `8ea1a42410fd6ec790a7bdbd94129421d9c7997730db063e5fb520d788c2dad6`.
- No immutable source or prohibited directory was edited.

## Checkpoint

Disposition is complete through ID 39200. Resume at ID 39201; 25,934
`default` IDs remain through ID 65134. The next preliminary scan is
`default-ids-39201-39250-preliminary.md`. Decisions D-12537 through D-12540
are recorded in the register; the next unused decision ID is D-12541.
