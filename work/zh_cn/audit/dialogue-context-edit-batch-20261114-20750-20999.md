# Dialogue Context Translation Edit Batch: IDs `20750`-`20999`

- Date: 2026-11-14.
- Rechecked candidate rows against current English, Japanese, Chinese, and
  Korean. English was used for meaning, Japanese for voice/register, and
  Chinese as supporting evidence. No speaker or playback order was inferred.
- Applied 18 in-range corrections and one linked correction at ID `3099`.
- Existing ledger dispositions were preserved; fingerprints were refreshed
  for all 19 changed IDs.

## Applied Corrections

| ID(s) | Correction |
| --- | --- |
| `20766` | Used the established Scholia Arcana rank form `초심자(Neophyte)`. |
| `20768` | Replaced the unnecessarily coarse `아가리` with `입속`, preserving the monster and spider-gland information. |
| `20779` | Standardized Nanne Hanri's formula as `조제법` throughout the journal entry. |
| `20787` | Corrected the object particle after `Tala-Rane`. |
| `20794` | Rendered `Master` as the item-grade modifier `장인급`; retained the existing Mitharan and item-part wording. |
| `20813` | Recast the entire utterance in consistent conversational plain speech. |
| `20865` | Removed the unsupported implication of wrongdoing from `everything I've done`, retaining the repeated cadence. |
| `20880`, `3099` | Aligned both identical `I want to sell you a kerchief` lines as `손수건 하나 팔게`, consistent with the same quest item's other references. |
| `20888` | Standardized the final `lichen` reference to `지의류`, matching the earlier use in the same journal entry. |
| `20891` | Corrected `seldom` from `대개` to `좀처럼` and made the implied object natural. |
| `20931` | Aligned the person and faction names to `인드레 칸드리안(Indre Kandrian)` and `칸드리안 경비대(Kandrian Guard)`. |
| `20939` | Clarified that Varani describes the handwriting, not ownership of the letter. |
| `20949` | Replaced the ominous-sounding farewell with the source-supported friendly `나중에 보자`. |
| `20964` | Expanded `the Well` to the established `영혼의 샘(Well of Souls)`. |
| `20978` | Recast the detection effect as `적에게 발각되지 않습니다`. |
| `20987` | Removed the unsupported claim that the speaker personally will kill the listener. |
| `20992` | Changed the epithet from a vocative to a descriptive phrase; preserved the poem's line and stanza breaks. |
| `20998` | Paired the complete title as `윈더미어의 시녀(The Maid of Windemere)`. |

## Retained Or Held

- `20866` remains `안실라 부인(Lady Ansilla)`, matching the existing
  person-specific glossary decision. The `여사(Lady Hartwen)` choice was
  recorded for Hartwen and was not generalized to other characters.
- The existing form at `20742`, `사그렐 부인(Lady Sagrell)`, remains aligned
  with the prior full Sagrell review.
- Evidence-limited holds at `20858`, `20874`, `20937`, and `20989` remain
  unresolved.

## Verification

- The review ledger validates all 65,135 IDs against the four current
  language tables.
- The CSV retains its UTF-8 BOM, 65,135 ordered records, 71,845 CRLFs, and
  244 LF-only newlines. The long entry at `20888` and poem at `20992`
  retain their logical line breaks; the poem's blank stanza separator remains.
- The 11 CSV-preservation tests and nine context-index tests passed (20 total).
- `git -c core.whitespace=cr-at-eol diff --check` passed.
- Current CSV SHA-256:
  `90e3dd16cf29da2f46d44c2ca20742dfc450f8c675242350c0ed5ada9a1b6e30`.
- Current ledger SHA-256:
  `83364ece23469eb1e613881a14283e5e42aa1d4538a07b075829175a5608d903`.

The next sequential application range is `21000`-`21249`.
