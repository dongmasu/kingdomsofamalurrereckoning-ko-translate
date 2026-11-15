# Dialogue Context Translation Edit Batch: IDs `19000`-`19999`

## In Progress: `19000`-`19249`

The 13 ledger candidates in this subrange were compared against the current
English, Japanese, Chinese, and Korean. No speaker or playback order was
inferred from an asset alone.

| IDs | Decision and evidence |
| --- | --- |
| `19037` | Pair the explicitly named sprite as `스프라이트(Sprite)`. |
| `19051` | Pair the full English name of the presented beast; the conflicting pronoun in another announcement remains unresolved. |
| `19058` | English and Japanese ask what is outside, not only what dangers to avoid. |
| `19063` | Pair the established name and title `사반트 메스닌(Savant Methneen)`. |
| `19071` | Pair the named game `하이 롤(High Roll)`, preserving the two-dice rules. |
| `19076` | Pair `프라이데리(Pryderi)` without deciding whether it denotes a market or company. |
| `19105` | Pair `라그널(Ragnall)` while preserving the epitaph's voice. |
| `19206` | Fix the grammatical relation: Anokatos requests the guards and narrator to escort his followers. |
| `19243` | Pair `투모스(thumos)` without changing the painting number, two vials, or creature requirements. |

`19097` and `19214` were already corrected. `19022` is held pending more
context for the intended cull; `19089` is held pending verification of the
multiline signature and its full naming context. Remaining ranges have not
yet been adjudicated.

## Checkpoint: `19000`-`19249`

Nine candidates were corrected, two already resolved, and two held. The
ledger validated across 65,135 IDs, the 11 preservation tests and
CRLF-aware diff check passed, and the BOM, 65,135 ordered rows, 71,845 CRLF
and 244 LF-only line endings were preserved.
CSV SHA-256:
`3b35bd25bf32f3d720f50e1667f995bfa82e1a68f467fa4dfa6b0bac249860dc`;
ledger SHA-256:
`1c3f74007c0e676f20defcf8d57f6d306b707a97f0cabea8e64f2340daf6879d`.

## Next Subrange

The following candidates in `19250`-`19499` were compared against all four
language rows and accepted for an ID-scoped edit: `19255` (named hood),
`19282` (Fae cave), `19285` (Wynn), `19300` (Reginald), `19319`
(Bolton), `19356` (item title), `19365` (Fae cave), `19382` (Authority),
`19400` (approved Seelie spelling), `19432` and `19444` (naturalness),
`19454` (place names), and `19467` (Nymph pairing). Other candidates in
this subrange require separate adjudication.

The 13 accepted edits above were applied; their fingerprints and structural
checks passed. Subsequent source comparison accepts `19284` (`culling`
here is a hunt, as supported by Japanese), `19303` (consistent informal
instructions), `19323` (natural conversational question), and `19360`
(journal narration rather than spoken dialogue, with the named apothecary).
Those four edits were also applied. The four remaining ledger candidates in
this subrange are `19311`, `19320`, `19431`, and `19466`; they are not yet
adjudicated. Continue from these IDs, then `19500`-`19999`.

## Latest Verification

- The 65,135-ID ledger fingerprint validation, 11 CSV-preservation tests,
  nine context-index tests, and CRLF-aware diff check passed.
- BOM and 65,135 ordered records remain intact, with 71,845 CRLF and 244
  LF-only line endings.
- Current CSV SHA-256:
  `8b66f221b1cfd4cf3e3fe4fcbcef4e8a7a921e0cdfbf5ee0cc16468e960712e5`.
- Current ledger SHA-256:
  `189491f46328adb35ed8c685e582723e22366c89f0d6ac9eb034e5fdada496b2`.

## Follow-up In Progress

The four `Century Flower` labels (`7989`, `9545`, `19320`, `57783`) were
compared across all four languages and against `6132`; align them to
`백년꽃`, retaining their individual numbers. At `19466`, pair `Runere`
and use conversational Korean to match the Japanese description. The
multiline `19311` and `19431` remain to be checked and applied.

For `19311`, retain the current Korean salutation, wording, signature spelling,
and two paragraph breaks, adding only `(Lord Gastyr)` to the signature.
For `19431`, the sources support the established `미타란족(Mitharans)` and
the named author and mountain range; add their English names while preserving
the dates and existing verse layout.

## Current Checkpoint

Both multiline edits and the four flower labels have been applied. All 21
ledger candidates in `19250`-`19499` were corrected; three related labels
outside the range were also changed. The preceding `19000`-`19249` has nine
corrections, two already-resolved entries, and two holds. The next range is
`19500`-`19999`; the overall work is incomplete.

The ledger validates for all 65,135 IDs, and 11 CSV-preservation tests, nine
context-index tests, and the CRLF-aware diff check passed. The CSV retains
its BOM, ordered row count, 71,845 CRLF and 244 LF-only line endings.
Current CSV SHA-256:
`0c225d62dbf1f9dcf51469e4f1e892190315f78a038dc31fb83de8654428f6a1`;
current ledger SHA-256:
`87b1c14bd9a51e9296353d4b5719edc6b52f05640fd394879047cc8dadaaace8`.

## `19500`-`19749`: In Progress

`19540`, `19597`, `19600`, `19613`, and `19715` are English action
objectives with corresponding Japanese action forms. Add the established
Korean `-하기` ending and pair `Weod Theoricas` at `19715`.
All other candidates in this subrange remain to be adjudicated.

These five edits have been applied. The 65,135-ID fingerprint check, 11
CSV-preservation tests, nine context-index tests, and CRLF-aware diff check
passed; BOM, record order, and the 71,845 CRLF / 244 LF-only line endings
remain unchanged. Resume `19500`-`19749` with `19510`, `19532`, `19536`,
`19539`, `19561`, `19580`, `19596`, `19603`, `19605`, `19621`, `19635`,
`19661`, `19667`, `19677`, `19682`, `19697`, `19733`, `19738`, `19745`,
and `19746`. These IDs have not yet received a final decision.

Current CSV SHA-256:
`3991a96316769076227aa4d9b447371a131c23a96a2fb070360ee50af97ed936`;
current ledger SHA-256:
`2722e7a9cb9e5e20f42af75ee35600fa0870fcc7e895769c7b5a5bb9d8dedde8`.

## 2026-11-14 Application Update

The candidate findings through ID `19999` were rechecked against the current
English, Japanese, Chinese, and Korean rows. Clear, source-supported
corrections were applied through the ID-targeted preservation tool. Existing
ledger dispositions were retained; fingerprints were refreshed only for
edited IDs.

In `19500`-`19749`, the continuation corrected `19532`, `19536`, `19539`,
`19561`, `19580`, `19596`, `19603`, `19605`, `19621`, `19635`, `19661`,
`19667`, `19677`, `19682`, `19697`, `19733`, `19745`, and `19746`.
`19510` had already received its source-aligned journal correction at the
start of this continuation. The shared Khamazandu offer sentence was checked
at all seven IDs (`7589`, `15148`, `19510`, `21922`, `54076`, `64167`,
`64664`); the other six already use the corrected wording. The five objective
corrections at `19540`, `19597`, `19600`, `19613`, and `19715` were already
applied, and `19738` already had its English pairing.

In `19750`-`19999`, the candidate corrections at `19755`, `19766`, `19779`,
`19781`, `19797`, `19806`, `19811`, `19817`, `19845`, `19879`, `19887`,
`19888`, `19889`, `19905`, `19918`, `19947`, `19981`, `19988`, and `19999`
were applied. Related, explicitly cross-referenced consistency edits were
made at `221`, `11999`, and `32595` for `Unseelie`; at `18902` and `28142`
for the `Praetorian` title (with `412` already using the aligned form); and
at `36231`, `48443`, `57408`, and `60282` for the same `vagrants` group.
`57408` also now uses the established place name `아다루스 동굴(Adarus
Hollow)`.

Meaning or terminology questions without sufficient evidence remain
unresolved rather than being guessed: the `telling` at `19561`, the
`barghest-tipping` incident at `19635`, `magical ordinance` at `19766`,
`Eternal Hireling` at `19900`, and the existing holds at `19512`, `19590`,
`19648`, `19658`, `19839`, `19897`, and `19996`. Applying a separately
supported name or wording correction does not resolve an unrelated hold on
the same row.

## Application Verification

- The review ledger validates all 65,135 IDs against the four current
  language tables; all 47 edited-ID fingerprints were verified.
- The CSV retains its UTF-8 BOM, 65,135 records, 71,845 CRLFs, and 244
  LF-only line endings. The multiline list at `19539` retains its two blank
  lines and all nine name entries.
- The 11 CSV-preservation tests, nine dialogue-context-index tests, and
  `git -c core.whitespace=cr-at-eol diff --check` passed.
- Current CSV SHA-256:
  `d299f8eff4830f49784e301440f98470d97fe0003dd3c8c350c4e1017f2eaa55`.
- Current ledger SHA-256:
  `f3384045169c686855bbcfc89c0e8307990ab047a30668ce1f130b8f3204891b`.
