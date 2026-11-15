# Dialogue Context Translation Edit Batch: IDs `26750`-`26999`

- Date: 2026-11-14.
- Rechecked the 13 candidate rows against English, Japanese, Chinese, and
  Korean. English guided meaning, Japanese guided voice and form, and Chinese
  served as supporting evidence.
- Applied 12 in-range corrections. `26916` already matched the same-English
  translation at `23919` and was retained.
- Also aligned `16778` with `26940`, which share the exact English and
  Japanese objective text.
- The evidence-limited meaning hold at `26912` remains unchanged.

## Applied Corrections

| ID(s) | Correction |
| --- | --- |
| `26762` | Paired the named character as `아인미(Ainmhi)`. |
| `26781` | Corrected the sentence to say that anyone who learned too much had to die, without inventing who killed them. |
| `26783` | Reworked the book-history passage for natural Korean, paired Tyrenium, Scholar Joson, Basilica Gnostrum, and trec, and clarified the stone and ore-disposal sentences. All nine logical line breaks and the existing paragraph layout were preserved. `Motus Mining Interests` was already paired. |
| `26866` | Changed the stiff `사냥 잘하게` to the casual imperative `사냥 잘해`, matching the English and Japanese register. |
| `26880` | Aligned Syllareta's spelling and pairing as `실라리타(Syllareta)`. |
| `26884` | Aligned Dartan's name as `다르탄(Dartan)`. |
| `26897` | Clarified that Bisarane knows how to reach the magical force `비탄의 힘(Sorrows)`. |
| `26921` | Replaced the literal `유언단` with the established faction name `벨렌의 성약단(Belen's Testament)`. |
| `26929` | Corrected the Witch Knight spacing to `마녀 기사`. |
| `26933` | Paired the named military location as `번(The Burn)`. |
| `26939` | Initially recast the reward sentence as `내 도움에 보답했다`; the candidate-reconciliation follow-up further clarified the recipient as `고마움의 표시로 내게 보상을 줬다`, preserving the journal's first-person meaning. |
| `16778`, `26940` | Standardized the identical `Search Nuala Ignas` objectives as `누알라 이그나스(Nuala Ignas) 수색하기`. |

## Retained And Held

- `26916` was already identical to `23919` in Korean; the aligned Japanese
  and Chinese sources also match. No change was needed.
- `26912` remains on hold because English and Chinese say “Very noble,” while
  Japanese says “thank you.” The active Korean follows the Japanese reading;
  the available evidence does not resolve the conflict.

## Verification

- Refreshed only the 13 changed IDs' `source_fingerprint` values; the full
  65,135-ID review ledger validates.
- The default CSV retains its UTF-8 BOM, 65,135 ordered IDs, and 71,842 CRLF /
  244 LF-only newline inventory. The `26783` passage has nine logical line
  breaks, matching all three references.
- All 59 exact-English duplicate groups touching this range retain identical
  Korean text after the edits.
- The 11 CSV-preservation tests, nine context-index tests, ledger validation,
  and CRLF-aware diff check pass.

The next sequential candidate range is `27000`-`27249`.
