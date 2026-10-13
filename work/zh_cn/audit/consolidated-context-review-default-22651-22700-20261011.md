# Consolidated Context Review: `default` IDs 22651-22700

- Review date: 2026-10-11.
- Scope: all thirteen previously uncertain disposition rows, aligned by ID
  across English, Japanese, Chinese, the Japanese-derived Korean draft, and
  the active Korean CSV; repeated labels and source-marker structure were
  checked.
- Decisions: three accepted edits and ten `not an issue`.

## Decisions

| Decision | ID | Finding | Disposition | Rationale |
| --- | ---: | --- | --- | --- |
| D-18463 | 22660 | `dark crusade` | not an issue | English explicitly uses `crusade`; Korean's `어두운 성전` follows that meaning. Japanese and Chinese paraphrase it differently but do not overturn the English anchor. |
| D-18464 | 22661 | `{*3Extraction}` runtime display marker | not an issue | The Korean preserves the exact marker ID, wrapper, and position from English. Japanese and Chinese localize the display text, but the English marker itself is retained accurately; no marker edit is warranted without the Korean UI naming policy. |
| D-18465 | 22664 | `Your Grace` | not an issue | English and Chinese support the formal honorific `각하`. Japanese's letter-salutation convention is a register adaptation, not evidence that the Korean honorific changes the addressee or meaning. |
| D-18466 | 22667 | `spare a little extra for the dying` | accepted | Change the middle sentence to `가진 게 그렇게 많으면서 죽어 가는 이들에게 조금이라도 더 나눠 주는 게 최소한의 도리인데.` English and Chinese say the least they can do is give a little extra; the previous Korean instead said they gave nothing at all. |
| D-18467 | 22673 | Maire / Queen of Cups | not an issue | All locales present Maire with the Queen of Cups title. Korean preserves both; the unresolved canonical spelling does not prevent this row from identifying the same title and person. |
| D-18468 | 22676 | Shock enemies when Blocking | not an issue | English, Japanese, and Chinese all describe shocking/electrocuting enemies on a block. Korean `감전 피해` conveys that effect; no evidence in this row supports replacing it with a different mechanic. |
| D-18469 | 22677 | Crying Eyes | not an issue | The phrase is consistently treated as a named entity across the locales. Korean retains the source name in parentheses and asks the same location question. |
| D-18470 | 22678 | Freeman | not an issue | Japanese explicitly identifies the Freeman group, while English capitalizes the singular name and Chinese supports free people. Korean retains `Freeman` alongside its Korean rendering and preserves the contrast with imprisonment. |
| D-18471 | 22684 | Hierophant / Travelers / Temperance | not an issue | The Korean preserves the Hierophant's action, control over the Travelers, reward, new-hero role, and alias. It does not resolve unrelated faction/title canon beyond the source. |
| D-18472 | 22689 | Assistant Director, Talent Acquisition | not an issue | Chinese and Korean both render the recruiting role; Japanese retains the English title. The isolated title does not establish an out-of-world credit or a conflicting hierarchy, and Korean's `인재 채용 부책임자` preserves the role. |
| D-18473 | 22691 | `Don't make me hurt you.` | accepted | Change `널 다치게 만들지 마.` to `내가 널 다치게 해야 하는 상황을 만들지 마.` English, Japanese, and Chinese make the speaker the person being forced to use violence; the previous Korean obscured or reversed that agency. |
| D-18474 | 22694 | Murghan / Twilight Pass | not an issue | The caverns, blocked passages, approach condition, and additional beasts are preserved. Japanese and Chinese support the creature and spawning threat; unresolved creature-name spelling is non-blocking in this sentence. |
| D-18475 | 22699 | Docent of the Scholia Arcana | accepted | Change `도슨트(Docent)` to `강사(Docent)`. Japanese `導師` and Chinese `讲师` support an instructional office; Korean `도슨트` instead strongly suggests a museum guide and misleads about the institutional role. The English title remains for traceability. |

## Edits and Verification

Only the Korean `Texto` values at IDs 22667, 22691, and 22699 changed.
Together with the two accepted edits in IDs 22551-22600, all five approved
substitutions were reversed in memory and compared with the pre-edit backup;
the bytes matched exactly. The five source/active files contain IDs
22651-22700 once and in identical ascending order. BOM and line endings are
unchanged; the runtime marker at 22661 was not altered.

Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-22559-22589-22667-22691-22699-D18453-D18457/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`89aa30b7aca402c0b14498862d9b194a0828270f5f96bf0238ce21b5412faab6`.
Post-edit SHA-256:
`154574fbaba2a172558b0ec47c10f905e2e86ddfc2690213a752179c2ef6383c`.
The active file retains its UTF-8 BOM, 72,011 CRLF endings, and 73 existing
bare-LF endings.

This batch resolves thirteen prior uncertainties: three accepted and ten
`not an issue`. Totals through D-18475 are 2,033 accepted, 23,404
`not an issue`, and 13,087 uncertain (38,524 counted). Next decision:
D-18476 at ID 22701.
