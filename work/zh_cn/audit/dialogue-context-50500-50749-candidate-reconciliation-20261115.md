# Candidate Application Reconciliation: IDs `50500`-`50749`

- Date: 2026-11-15.
- Rechecked all 11 sequential-report proposals against current Korean,
  English, Japanese, Chinese, and earlier linked-review decisions.
- Six active candidates were newly reconciled. `50572` and `50723` were
  already reconciled in prior reviews. Four other proposals are already
  `not-issue` in the current ledger.
- The remaining source-supported correction was applied at `50533`;
  supported wording for the other five new candidates is already present.

## Candidate Decisions

| ID | Decision | Revalidation |
| ---: | --- | --- |
| `50503` | Retained | The reagent list already pairs `혈근초(Bloodroot)` and preserves all quantities and line breaks. |
| `50533` | Corrected | Standardized the isolated label to the active corpus form `허바르의 문턱(Hurvar's Doorsill)`. The English source has the typo `Doorsil`; other source rows consistently use `Doorsill`. |
| `50541` | Retained | `비치스톤(Beachstone)`, `엠버우드(Emberwood)`, and `바다강철(seasteel)` are present. The lowercase parenthetical preserves the source row's lowercase `seasteel`. |
| `50684` | Retained | `에코즈(Echoes) 공연 감상하기` correctly identifies the musical group rather than literal echoes. |
| `50711` | Retained | `전설 속에서 만나자, 친구. 이제 가.` preserves the farewell without adding “someday” or implying a previous meeting. |
| `50724` | Retained | The current sentence naturally describes the effort to reach Alarane and preserves the conditional approval and King of Sorrows reference. |

## Previously Reconciled or Not-Issue

- `50572` was previously reconciled; the current `보름(Vorm) 가문` is
  supported.
- `50723` was previously reconciled with the linked Idylla surveyor group;
  the current title is `실종된 조사관`.
- `50506`, `50508`, `50710`, and `50725` are already `not-issue` in the
  ledger. The current text uses `선견자(Seer)`, pairs
  `아르케스의 서클릿(Circlet of Arkes)`, contains only one
  `Cowl of the Maiden` gloss, and pairs `신탁자(Oracle)`.
- The related `Hurvar's Doorsill` rows `5998`, `13362`, `21396`, `52747`,
  `55729`, and `57991` were cross-checked. Earlier reports had already
  retained their current wording, so they were not changed or counted again.
  Only `50533` was aligned to that existing form.

## Separate Holds

The existing evidence-limited holds remain unchanged: `50515` (Primos'
identity), `50517` and `50532` (speaker/register), `50589` (the meaning of
“It is just one”), `50602` (source-language interjection discrepancy),
`50656` (meaning of “breaking of the Fae”), `50663` (fragmentary response),
and `50703` (whether Etair is dead or merely absent). No speaker or dialogue
order was inferred from asset associations.

## Verification

- All 11 sequential proposals were compared across the four language
  tables. Existing exact-English duplicate groups and the three multiline
  rows retain their supported Korean text and line-break layout.
- Only `default:50533` changed in this range, using
  `tools/replace_text_preserve_eol.py`; only its source fingerprint was
  refreshed.
- Candidate reconciliation is now `3,281 / 4,026` (`81.50%`), with `745`
  remaining.
- Structural, fingerprint, regression-test, and line-ending checks are
  recorded in the accompanying decision manifest.
- No immutable source CSV or extracted asset was changed. No commit was
  made.
