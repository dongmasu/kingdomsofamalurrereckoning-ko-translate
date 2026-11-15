# Candidate Reconciliation: IDs `44750`-`44999`

- Date: 2026-11-15.
- Rechecked all 40 current candidates against English, Japanese, Chinese,
  the active Korean CSV, and linked terminology or exact-source entries.
  English anchors meaning; Japanese is the primary reference for voice and
  register; Chinese is supporting evidence.
- Exact-source counterpart `30142` was newly identified for candidate
  `44968`. English, Japanese, and Chinese are identical at both IDs, so both
  Korean titles were revised together and `30142` was reclassified as a
  candidate in the ledger.

## Candidate Decisions

| IDs | Result |
| --- | --- |
| `44750`, `44755`, `44756`, `44758`, `44776`, `44777`, `44784`, `44787`, `44807`, `44818`, `44822`, `44852`, `44853`, `44855`, `44866`, `44886`, `44891`, `44903`, `44908`, `44913`, `44914`, `44915`, `44916`, `44930`, `44950`, `44957`, `44958`, `44964`, `44973`, `44975`, `44977`, `44981`, `44983`, `44985`, `44999` | Rechecked against the source and current terminology. Their supported name pairings, meaning, register, and formatting are already present or the current wording is supported; retained. |
| `44840` | Added the source label to the material name: `유독성 잔류물(Toxic Residue)`. |
| `44861` | Replaced the partial `트롤(Troll)` pairing with the complete creature type `트롤 여족장(Troll Matriarch)`, retaining the sentence and location pairing. |
| `44887` | Changed the marked 하게체 `조심하게.` to the natural plain imperative `조심해.`, consistent with the direct English and Japanese instruction. |
| `44945` | Added the English pairing to the standalone profession label: `마법물품 제작자(Sagecrafter)`. This remains distinct from the `Sagecraft` skill. |
| `30142`, `44968` | Both source rows are exactly `A Second to a Duel` / `決闘の介添人` / `落败`. Changed both Korean titles from `결투의 보조인` to `결투의 조력자(A Second to a Duel)`. |

## Linked and Held Findings

- `30142` and `44968` were checked as one exact-source group. Both now use
  the same Korean title. The existing `30142` ledger row was reclassified
  from `not-issue` to `candidate` and linked to this report.
- The five evidence-limited holds remain unresolved: `44778` (the
  `THIS IS A BUG` placeholder), `44947` (`Hollow` place meaning), `44953`
  (`The Crux` name or common-noun reading), `44964` (`the Quays` referent;
  the separate `Pryderi` pairing is resolved), and `44978` (conflicting
  interpretations of the final clause).
- `44886` already expresses the consequence as preventing future deaths;
  it does not introduce the unsupported notion of a noble sacrifice.
- `44913` retains the existing paired book title and all intentional
  multiline verse layout. No speaker or dialogue order was inferred.

## Changes and Verification

- Korean rows `30142`, `44840`, `44861`, `44887`, `44945`, and `44968`
  changed using `tools/replace_text_preserve_eol.py`.
- Refreshed the four-language fingerprints for those six edited rows.
- Reconciled the 40 range candidates plus newly identified linked candidate
  `30142`: `3,064 / 4,029` (76.05%), with 965 remaining.
- The full ledger fingerprint check, index and both catalog reproducibility
  checks, 20 CSV-preservation and dialogue-context tests, CSV record/order/
  BOM/newline checks, and CRLF-aware diff check passed.
- The active CSV remains at 65,135 ordered records, with a UTF-8 BOM,
  71,839 CRLF, 242 LF-only, and no bare-CR line endings.
- No immutable source CSV, extracted asset, or game binary was changed.
  No commit was made.
