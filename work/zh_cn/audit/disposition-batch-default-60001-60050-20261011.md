# Disposition Batch: `default` IDs 60001-60050

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence from the read-only
  locale CSV, the preliminary report, source-keyed historical audit,
  terminology, runtime markers, values, and multiline structure.
- One accepted correction, 36 `not an issue` IDs, and 13 uncertain findings.
  These are working dispositions, not independent final linguistic approval.
- English governs meaning; Japanese informs voice/register; Chinese is a
  supporting cross-check. Chinese evidence for this pass came from the
  read-only locale CSV under `src/csv/zh_cn/`.

## Accepted Correction

| Decision | ID | Previous Korean | Applied Korean | Rationale |
| --- | ---: | --- | --- | --- |
| D-17881 | 60048 | `우리를 위해 그만큼 해 주셨는데 정가를 다 받을 수는 없죠. 부디 할인된 가격으로 즐기세요.` | `우리를 위해 그만큼 해 주셨는데 정가를 다 받을 수는 없죠. 부디 할인 혜택을 받으세요.` | English, Japanese, and Chinese offer a discount. Replace the unnatural “enjoy a discounted price” collocation with natural Korean while retaining the polite offer. |

## Uncertain Findings

| Decision | ID | Rationale |
| --- | ---: | --- |
| D-17882 | 60005 | The repeated Hierophant title and Travelers' tacit knowledge carry emphasis; Japanese recasts this as a shadow-mastermind claim. Preserve the current source-aligned statement pending voice/lore context. |
| D-17882 | 60010 | English `fallen` does not specify whether the Hierophant was deposed, defeated, or killed; Japanese specifically says deposed. |
| D-17882 | 60012 | English spells the librarian `Idiris`, while ID 60037 uses `Idris`; the Scholia Arcana/Rathir Chapterhouse naming also varies by locale. |
| D-17882 | 60020 | The stones' gaze, glare, and listening are a stylized self-correction; Korean retains the sequence, but final punctuation/voice depends on scene context. |
| D-17882 | 60022 | `House Pride` may be a formal faction name or source variant; retain the found-item notice pending naming consistency review. |
| D-17882 | 60024 | Capitalized `Offering` may name a rite; Japanese quotes the term and Chinese says sacrifice, but exact rite identity is unknown. |
| D-17882 | 60034 | The force of `Feed the Cycle!` and the canonical rendering of `Cycle` remain lore-dependent; Japanese supports the current sustenance reading, Chinese diverges. |
| D-17882 | 60037 | `Idris` conflicts with `Idiris` at 60012, and English says to read pages while Korean calls them notes; retain pending item/context review. |
| D-17882 | 60038 | The memo preserves the complaint, guest precedence, Allestar Tower reference, and signature; the unnamed guest and its identity remain unresolved. |
| D-17882 | 60039 | `Pledgeshield` may be a rank/title; Japanese calls Fenan a second-class mercenary while Chinese transliterates the compound. |
| D-17882 | 60043 | Isolated UI `Collapse` could be an action, state, or noun; Japanese/Chinese support different interface actions. |
| D-17882 | 60044 | The formal `Queen of Staves` camp-leader title and preferred Korean treatment of `Staves` need terminology context. |
| D-17882 | 60049 | The Prison on the Mountain may be a formal place name; all locales render it descriptively, so preserve current wording pending naming policy. |

## Not an Issue

Decision D-17883 records these 36 IDs: 60001-60004, 60006-60009, 60011,
60013-60019, 60021, 60023, 60025-60033, 60035-60036, 60040-60042,
60045-60047, and 60050. Their first-read meaning, dialogue register,
runtime markers, values, and structure are preserved.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 60001-60050 once
  and in identical ascending order; each resource has 65,135 records.
- IDs 60002 preserve two blank-separated instructions and both styled
  ability labels. At 60016, `{2}`, `{1}`, `LINE_SPACE`, `{3}`, and ability
  markers remain present; Korean follows English/Japanese order while
  Chinese alone moves `{3}` before the final ability label. ID 60030 retains
  the nested `{LINE_BULLET}{*6Requires {1}}` structure.
- ID 60038 preserves its embedded signature break. ID 60036 retains
  `46/92/92` for magic/melee/ranged block values; ID 60018 retains the
  two-groups/one-former-group claim.
- Source-keyed questions were rechecked in
  `work/zh_cn/audit/from-ja_jp/open-questions.md` and
  `default-ids-60001-60050-preliminary.md`. Unresolved questions are
  retained as uncertain findings rather than edited.
- Pre-edit CSV SHA-256:
  `f46a326c9e4eb82f21fc637cf2b7a6a0a3685227ae7f6e1a9fbbec520a3ed2ef`.
- Post-edit CSV SHA-256:
  `09c2194038314e7842351349607b05a62266816b7d8e85beca79e0471509a5c6`.
  The approved ID 60048 `Texto` cell is the only change. Its byte-identical
  pre-edit backup is
  `/private/tmp/ko-translate-backups/20261011/before-60001/locatexts_zh_cn.koalocatext_default.csv`.

D-17881 records one accepted correction, D-17882 records 13 uncertain
findings, and D-17883 records 36 `not an issue` IDs. Direct register totals:
1,745 accepted, 13,623 `not an issue`, and 11,464 uncertain (26,832
dispositions total); next D-17884.

Resume at `default` ID 60051; 5,084 IDs remain through ID 65134. These are
working dispositions, not independent final linguistic approval.

Later review supersedes D-17882 for ID 60043: the UI command is accepted as
`접기` under D-18204. The batch counts above are its historical checkpoint.
