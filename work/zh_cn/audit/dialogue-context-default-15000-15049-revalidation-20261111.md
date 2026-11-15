# Sequential `default` Revalidation: IDs `15000`-`15049`

- Date: 2026-11-11.
- Scope: compare active Korean with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Fifteen existing ledger records were fingerprint-checked; all match the
  current four-language sources. The other 35 IDs were added to the ledger.
- Two correction candidates and three evidence-limited holds are recorded.
- No translation CSV, source resource, extracted game asset, or localization
  binary was changed.

## Correction Candidates

These are review findings, not authorization to edit the active translation
CSV.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `15022` | Terminology | `our order` is rendered `우리 교단`. The same examination context describes the Scholia Arcana as an academic organization; Japanese and Chinese also use academy/institution wording. The linked `SASQ01` review found the same English phrase elsewhere and proposed `우리 결사단` for this organizational use. Recheck the term against that group before applying; this is not a global replacement. | Medium-high |
| `15041` | Terminology | `Reclaim the Invoices` is `송장 되찾기`, while the same Sigra quest uses `청구서` for its billing documents. The asset review found other invoice uses can refer to delivery paperwork, so decide this objective by its quest context rather than replacing `송장` globally. | Medium-high |

## Evidence-Limited Holds

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `15024` | Meaning | `her hollow` may refer to a cave-like Fae dwelling or a domain. English, Japanese, and Chinese do not establish that Korean `영지` is too specific; retain pending context evidence. |
| `15026` | Meaning | `living kin` is broader than immediate family. `살아 있는 친족` is literal but preserves that breadth; do not narrow it without stronger evidence. |
| `15039` | Meaning | `up again` and `anything on your side` can refer to recovery/standing and information/items. Korean chooses regaining consciousness and finding information; Japanese and Chinese support different parts of those readings. Retain pending dialogue context. |

## Source and Structural Checks

- IDs `15032` and `15050` share the exact English label `Customs House`;
  Korean is `세관(Customs House)` in both. The same Korean form also appears
  at IDs `13051` and `49182`.
- All 50 IDs are present in the four language tables in matching ID order.
  Logical line-break counts and runtime/layout-marker structure match.
- At `15017`, Chinese punctuation differs after the duration value; the
  Korean three-line stat layout and values match English and Japanese.
- The established `Dokkalfar`, `Beckoned`, `Warsworn`, and `Customs House`
  renderings were retained. No individual speaker or playback order was
  inferred from asset membership or row order.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
