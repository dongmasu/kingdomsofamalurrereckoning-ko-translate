# Edit Addendum D-20229

The active default CSV and byte-identical range backup were verified before
the range edits:

- Pre-edit SHA-256: `4888a62e9823614fca921dce65fbea5726c4e4877a380eb3237b1df1e4b90bce`
- Range backup: `/private/tmp/ko-translate-backups/20261013/before-named-scope-D20229/locatexts_zh_cn.koalocatext_default.csv`

| ID | Before | After | Reason |
| ---: | --- | --- | --- |
| 57726 | `까마귀단` | `크로우즈(The Crows)` | The English line announces the named arena team; reuse accepted team terminology. |
| 57728 | `도칼파르 왕립 무술 학교`; `신중의 가문`; `용맹의 가문`; two `발라드의 가문` references | `도크알브 왕립 무술 학교`; `신중의 집`; `용맹의 집`; two `발라드의 집` references | Apply official-manual Dokkalfar spelling and accepted House-name forms while preserving the letter's events and paragraphing. |
| 57730 | `앨린 쉬어가` | `앨린 쉬르가` | Reuse the accepted active Alyn Shir spelling at D-19929/42747. |

ID 57715 was deliberately left unchanged because D-19686 had already closed
that exact key as `not an issue`; no new evidence justified reopening it.

Only the three listed `Texto` cells changed. The applicator verified inverse
byte reconstruction, BOM, mixed line endings, all 65,135 ordered IDs, and
the 50 four-locale rows, line breaks, and runtime markers. The Japanese-only
marker/newline differences at 57708 and 57728 remain documented.

Post-edit SHA-256:
`f9fe3bea192893ca3f13045f1dbaf2b9ac06d5795fd16799bc2d528bd9dee0d5`.
An interim byte-identical safety snapshot was also retained at
`/private/tmp/ko-translate-backups/20261013/before-finalize-D20229/locatexts_zh_cn.koalocatext_default.csv`;
the final output was reconstructed from the original range backup above.
