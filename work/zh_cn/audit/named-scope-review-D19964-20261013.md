# Consolidated Context Review D-19964

2026-10-13. Reviewed all 50 active `default` IDs 44451-44500 against
English, Japanese, Chinese, Korean, D-13637-D-13649 exact-key history,
and relevant official Korean manual context. English anchored meaning;
Japanese informed voice; Chinese was secondary. No PAK consulted.

| IDs | Disposition | English-led evidence |
| --- | --- | --- |
| 44454 | Accepted subsequent meaning correction | English `I was hoping you could tell us` asks the addressee to explain; prior `우리한테 물어봐 줬으면 해` instead asks the addressee to ask a question. Restore the direction of information. |
| 44459 | Accepted; closes D-13637 as a CSV-text correction | Existing Korean CSV stores literal U+005C backslashes immediately before doubled quote characters in a quoted field; ordinary CSV parsing retains the slashes in `Texto`, unlike the other locales. Remove only the two backslashes; retain correctly doubled CSV quotes so the parsed message reads `"우리는 배신당했다."`. Runtime display was not tested. |
| 44465, 44466 | Uncertain; retain D-13638/D-13639 | Manual discusses Wells but does not establish this proto-Well term; capitalized `Old Ost` does not settle epithet versus age. |
| 44469, 44470 | `not an issue`; closes D-13640/D-13641 | `케이맨 제도` faithfully renders the source's anomalous real-world place without rewriting the source; `복무 통지서` preserves duty and notice without inventing a precise legal function. |
| 44471, 44473 | Prior D-13642/D-13643 `not an issue` verified, not recounted | The invitation does not invent a game; `{1}` and `{2}` retain identity and order. |
| 44476 | Uncertain; retain D-13644 | English `currish stakes` is opaque; Japanese and Chinese diverge on the referent. Leave the existing guess rather than assert a new one. |
| 44477 | Prior accepted D-13645 verified, not recounted | Active `골짜기` no longer invents a Fae qualifier. |
| 44486, 44498 | Uncertain; retain D-13646 | Hierophant is the same formal title as at 44324/44427, but canonical Korean form is not established by the manual; leave the current transliteration pending reconciliation. |
| 44495 | Prior D-13647 `not an issue` verified, not recounted | Group privacy and burial preference survive. |
| 44497 | Accepted; closes D-13648's unsupported-category concern | English `St. Eadric's` is possessive, not explicitly a church. `성 에드릭에서 얻을 수 있는` preserves the comparison without adding `교회`; institution type still unknown, no separate category claim. |
| Remaining IDs | Prior D-13649 ordinary group checked, not recounted | Names, quest descriptions, values (+30% at 44484), and official `워스원` at 44496 remain source-aligned. |

All 50 IDs occur once and in order in each of four default locales.
Exactly three `Texto` cells changed. Inverse replacement recovers every
pre-edit byte outside them; BOM, 72,011 CRLF / 73 pre-existing bare-LF
endings, 65,135 ordered IDs and parsed quotation text verified.

Pre-edit SHA-256:
`404bd0ab15dcaf0e14606e08eea2b552667e74312b53b4147d3c176f38f22f65`.
Backup:
`/private/tmp/ko-translate-backups/20261013/before-named-scope-D19964/locatexts_zh_cn.koalocatext_default.csv`.
Post-edit SHA-256:
`a25175ce5779dacf4daa3d31966ed73eaadefe68f9041456a0a6796dfced5212`.
D-19964 complete; full default review incomplete. Last reviewed 44500;
resume D-19965 / 44501-44550; 20,634 actual rows remain to 65134.
