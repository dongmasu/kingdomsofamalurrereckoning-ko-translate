# Lua Corpus Review: Translation Application

- Date: 2026-11-15.
- Scope: apply supported text proposals from the completed Lua-corpus
  translation review to exact localization rows; preserve unresolved or
  conflicting decisions.
- The source review remains in
  [Lua corpus translation review](lua-corpus-translation-review-20261115.md)
  and its [independent proposal review](lua-corpus-review-20261115/proposal-independent-review.md).

## Applied Changes

| Key | Before | After | Basis |
| --- | --- | --- | --- |
| `base:891:11` | `전승석` | `로어스톤` | The active English, Japanese, Chinese, and Korean `base` rows all have the exact `(ID_Linha, Tipo_Variante) = (891, 11)` key: `Lorestone`, `ロアストーン`, `智慧石`, and `전승석`. D-133 establishes `Lorestone = 로어스톤`. D-21766's `not-an-issue` disposition addressed entity registration and explicitly deferred lexical consistency; it is not a conflicting wording decision. |
| `default:53659` | `수석 아트 디렉터` | `총괄 아트 디렉터` | English and Japanese say `Executive Art Director`; Chinese `执行美术总监` supports the executive scope. No exact-key prior ruling was found. |
| `default:61109` | `크로싱의 수호자들(Crossing Keepers)과 대화하기` | `교차점의 수호자들(Crossing Keepers)과 대화하기` | English/Japanese source and the current glossary support the named Crossing Keepers. D-21166 explicitly accepted `교차점의 수호자들` for this exact key; only that scoped term was restored. |

These edits are justified by the aligned localization text, existing scoped
terminology decisions, and the user's instruction to proceed with supported
proposals. The Lua corpus supplies candidate context only: the review found
zero direct localization-key mappings and zero supported static display
call-site mappings. This report does not claim that any of these strings is
displayed by Lua at runtime.

## Held Proposal

`default:38785` remains `가이아(Gaea)의 예복`. D-20392's deity-name review
accepted the current full bilingual form, and the current proper-name
occurrence index records that exact wording. The Lua review's broader
`가이아(Gaea)의 의복` suggestion conflicts with that prior accepted wording;
the aligned source texts alone do not authorize silently superseding it.

## Reference And Ledger Updates

- Added the key-scoped Lorestone application and `default:53659` credit
  wording to the approved-decision index in
  `work/zh_cn/translation-reference/exceptions/translation-exceptions.md`.
- Preserved all review-ledger dispositions and refreshed only the
  `source_fingerprint` values for changed `default` IDs `53659` and `61109`.
  Their current fingerprints are `f3a94cd96d74ad778d09464f3712ceb50e034311cfabd6a43987cfc3c7c83025`
  and `c8889a60e8ee58cddf928b1b02f79813312f099d285811334517490f9af18555`,
  respectively. `base:891:11` is outside the default-only dialogue ledger.
- Left all unrelated, pre-existing working-tree edits intact.

## Verification

- `tools/replace_text_preserve_eol.py` applied each change by exact ID, exact
  variant where present, and expected old text.
- All 11 tests in `tools.test_replace_text_preserve_eol` passed.
- Parsed CSV row counts remain `base: 4,844` and `default: 65,135`; both UTF-8
  BOMs remain present. Line endings remain:
  `base: 4,845 CRLF, 0 LF-only, 0 bare CR`;
  `default: 71,839 CRLF, 242 LF-only, 0 bare CR`.
- The target-row values and both changed default fingerprints match their
  current four-language data. `git -c core.whitespace=cr-at-eol diff --check`
  passed for the edited CSVs and review ledger.
- Full review-ledger validation still reports the pre-existing stale
  fingerprint at `default:14712`. It is unrelated to this application and
  was not refreshed; a read-only scan found no other stale ledger rows.
- Post-application SHA-256 values for the complete working files are:
  `base` CSV `e8699ed6baf2a166ac69eb42343b162898aa7cbe43d7eaac5438ee74a2541ab3`,
  `default` CSV `8843f2168eaa3418b63ca571fdb0b9cf222bdd5c8c9e1698f099a54b5e7ec328`,
  and dialogue-context ledger
  `02f8fc868495b5c970d1abe574ed20edd0e5cccd4387199d692212c3f9b91cde`.
  The `default` CSV hash includes pre-existing user edits and is not a
  task-only patch hash.

No source CSV, extracted asset, binary, or game package was modified or built.
