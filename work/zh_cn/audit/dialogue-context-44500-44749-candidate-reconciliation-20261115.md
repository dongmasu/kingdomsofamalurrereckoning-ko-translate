# Candidate Reconciliation: IDs `44500`-`44749`

- Date: 2026-11-15.
- Rechecked all 20 candidates in the sequential range report against English,
  Japanese, Chinese, the active Korean CSV, and previous findings. English
  anchors meaning; Japanese is the primary reference for voice and register;
  Chinese is supporting evidence.
- Candidate `44580` is separately present in the ledger but was already
  reconciled as a linked exact-source candidate in the `43250`-`43499` pass;
  it is not included in this range's 20 candidates or counted again.

## Candidate Decisions

| IDs | Result |
| --- | --- |
| `44517`, `44552`, `44555`, `44575`, `44601`, `44618`, `44627`, `44629`, `44632`, `44671`, `44672`, `44681`, `44697`, `44727`, `44730` | The supported speech, name, title, terminology, and meaning corrections are already present in the active Korean CSV. Retained. The canonical Korean spelling of `Chrysalae` at `44672` remains held separately. |
| `44558` | Changed the archaic address and ending to `생각해 보니, 이제 네가 직접 현장 조사에 나설 때가 된 것 같아. 한번 조사해 볼래?`, matching Japanese's direct familiar address without assigning a speaker. |
| `44585` | Recast the opening naturally and removed the uncertain vocative: `우리한테 정해진 일정이 없다는 건 알아. 그래도 오래 기다릴수록 내 계획의 나머지를 마무리하기가 어려워져. 이제 움직여야 해.` This preserves the English schedule, plan, and urgency while avoiding an unsupported relationship term. |
| `44608` | Removed `자네` from the alternative question: `어느 쪽이지?` Japanese has no corresponding vocative, and Chinese's `你` does not require the archaic Korean address. |
| `44741` | Recast the spatial metaphor and old-fashioned address as `그렇다면 그동안 아무도 해내지 못한 일을 네가 해내겠군.`, matching the English and Japanese meaning in natural Korean. |
| `44742` | Removed the unnatural singular vocative `자매` and revised the line to `봐, 틸레라(Tilera)와 함께 싸우는 사람이야. 전장에 온 걸 환영해, 전사.` The separate kinship interpretation remains unresolved. |

## Linked and Held Findings

- `23436` remains `어디서 찾으면 돼?` and is not aligned to the other
  identical-English questions. The earlier FFQ03 review established that
  “them” refers to reagents, not people; this context-supported distinction
  supersedes the later report-only suggestion to unify the group.
- The seven evidence-limited holds remain open: `44521` (opposing source
  clauses), `44549` (meaning of `House`), `44576` (north/west conflict),
  `44672` (canonical Korean form of `Chrysalae`), `44709` (voice without
  per-key speaker mapping), `44731` (meaning of predecessor's mishaps), and
  `44742` (kinship/address). The naturalness change at `44742` does not
  resolve its relationship.
- `44580` was previously reconciled with exact-source counterpart `43364`;
  both read `의식 시작하기`.
- No speaker or dialogue order was inferred from asset associations.

## Changes and Verification

- Korean rows `44558`, `44585`, `44608`, `44741`, and `44742` changed using
  `tools/replace_text_preserve_eol.py`.
- Refreshed only the four-language source fingerprints for those five IDs;
  existing ledger records and other fields were preserved.
- Candidate reconciliation is `3,023 / 4,028` (75.05%), with 1,005
  remaining. All 20 current range candidates were reconciled; linked
  candidate `44580` was already counted in an earlier pass.
- Validation covers the active CSV's 65,135 ordered records, UTF-8 BOM, and
  preserved mixed line endings; full ledger fingerprints, index/catalog
  reproducibility, regression tests, and the CRLF-aware diff check are
  recorded in the accompanying manifest.
- No immutable source CSV, extracted asset, or game binary was changed.
  No commit was made.
