# Evidence-Hold Follow-up: IDs `64250`-`64499`

- Date: 2026-11-15.
- Reopened eight source/context holds from the sequential review and compared
  the same-ID English, Japanese, Chinese, and active Korean text. Related
  project translations were checked where they establish a matching term.
- Only source-supported wording was changed. The original range report and
  its append-only ledger decisions remain intact.

## Corrections

| ID | Decision | Evidence and change |
| ---: | --- | --- |
| `64276` | Corrected | English addresses a gladiator and calls the destination the Pit before the awaited match; Chinese also says pit. Japanese says waiting area, but exact related arena lines `57501` and `59142` already identify this destination as `투기장(The Pit)`. Changed `투기장 아래로 가` to `투기장(The Pit)으로 내려가`. |
| `64353` | Partially corrected | English `evil humors`, Japanese `毒のある笑いを好む`, and Chinese `邪恶的幽默` support a dark, biting sense of humor rather than an evil inner nature. Changed only `사악한 속내를 품고` to `악랄한 유머를 즐기며`; no line breaks or surrounding imagery were changed. The separate stain/blotter wordplay remains unresolved. |
| `64490` | Corrected | English names Didenhil's Warden; Japanese describes a guard who patrols and drives away danger, and Chinese uses a warden/jailer term. The related Didenhil Warden at `26374` is already `감시관`. Changed `관리인` to `감시관(Warden)`, retaining the explanation of his duties. |
| `64492` | Corrected | `Page Carolic` has the same person-plus-title structure as `Page Lilligild` at `3059`, where the project renders the role as `시종` and Japanese describes a servant. Changed `페이지 카롤릭` to `시종 카롤릭`, preserving the exact English pairing. |

## Still Held

- `64252`: `Higher` has no comparison target or operation in the isolated UI row; `높음` remains plausible but cannot be confirmed in context.
- `64258`: `Oathblade` is a name in English, a rank-like term in Japanese, and a literal blade label in Chinese; no source resolves the intended referent.
- `64341`: the Geoff/cape joke is clear in outline, but the odd punchline and its agency remain uncertain across the source versions.
- `64458`: “in this they are true” may refer to the stories, the Fae, or a particular claim; the sources do not resolve the antecedent.
- `64353`'s remaining ink/stain/blotter metaphor is still held; only the independently supported humor phrase was corrected.

The generic scavenger wording at `64412` is separately recorded in
`dialogue-context-final-edits-58000-65134-20261114.json` as
`폐품 수집꾼들`, supported by English, Japanese, and Chinese. The exact
group identity remains unknown; no creature or raider identity was inferred.

## Application

- Changed Korean IDs: `64276`, `64353`, `64490`, and `64492`.
- Updated only these IDs' `source_fingerprint` fields in the existing ledger;
  no ledger classifications, rows, or order were rewritten.
- CSV edits used `tools/replace_text_preserve_eol.py`.
- No source CSV or extracted game asset was changed.

## Verification

- All 11 CSV-preservation tests and all nine dialogue-context index tests passed.
- The review-ledger check validated all 65,135 IDs and four-language fingerprints.
- The index and both context catalogs reproduced byte-for-byte.
- The CSV retained its UTF-8 BOM, ordered IDs, and existing line-ending
  inventory: 71,839 CRLF, 242 LF-only, and zero bare CR.
- The CRLF-aware `git diff --check` passed; the edit manifest parsed as valid
  JSON.
