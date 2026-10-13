# Consolidated Context Review: `default` IDs 22551-22600

- Review date: 2026-10-11.
- Scope: the seven prior uncertain disposition groups in this range, aligned
  by ID across English, Japanese, Chinese, the Japanese-derived Korean draft,
  and the active Korean CSV; recurring names and accepted decisions were
  checked before disposition.
- Decisions: two accepted and two `not an issue`; seven uncertainty groups
  remain.

## Decisions

| Decision | ID | Finding | Disposition | Rationale |
| --- | ---: | --- | --- | --- |
| D-18453 | 22559 | `Piecing Light` / named spear | accepted | The same weapon is consistently `Piercing Light` at English-keyed IDs 459 and 8459, with accepted Korean `관통의 빛(Piercing Light)`. Chinese also uses “Piercing Light”; correct this row's apparent English source typo and reuse the exact accepted item form. |
| D-18454 | 22577 | `Caer` | not an issue | English, Japanese, and Chinese all retain the exact standalone source fragment. Korean `케어(Caer)` retains its traceable source form; the row does not require an unsupported common-noun interpretation. |
| D-18455 | 22582 | `From which you are freed.` | not an issue | English, Japanese, and Chinese retain the same context-dependent release fragment. Korean preserves the release relation without inventing its missing antecedent. |
| D-18456 | 22589 | House of Valor | accepted | Reuse the established accepted name `용맹의 집(House of Valor)` from D-148/D-650. This row names the same Fae House controlled by the Summer Court; change only the inconsistent House rendering. |

IDs 22560, 22570, 22571, 22579, 22592, 22596, and 22598 remain uncertain.
The retained questions are the letter fragment/name punctuation, the
speaker's register for `wench`, the malformed opening fragment, the
referent of `Lady's Children`, the status and Korean treatment of
`dustling`, whether `shadow-walk` is a route or ability, and the isolated
`Ding` label. The cross-locale evidence does not settle those questions.

## Edits and Verification

Change only ID 22559 `Texto` from
`빛을 꿰뚫는 창(Piecing Light)` to
`관통의 빛(Piercing Light)`, and ID 22589 from
`발러의 가문(House of Valor)` to `용맹의 집(House of Valor)`.
No key, row order, marker, embedded line break, or other CSV value changed.

Immediate byte-identical pre-edit backup:
`/private/tmp/ko-translate-backups/20261011/before-context-22559-22589-22667-22691-22699-D18453-D18457/locatexts_zh_cn.koalocatext_default.csv`.
Pre-edit SHA-256:
`89aa30b7aca402c0b14498862d9b194a0828270f5f96bf0238ce21b5412faab6`.
The complete five-substitution reversal check reproduces this backup
byte-for-byte. The UTF-8 BOM, 72,011 CRLF endings, and 73 bare-LF endings
remain unchanged.

This batch resolves four prior uncertainty groups: two accepted and two
`not an issue`. Reported totals through D-18456 are 2,030 accepted, 23,388
`not an issue`, and 13,106 uncertain (38,524 counted). Next decision:
D-18457 at ID 22601.
