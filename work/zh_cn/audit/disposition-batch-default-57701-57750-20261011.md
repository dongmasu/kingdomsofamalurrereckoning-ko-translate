# Disposition Batch: `default` IDs 57701-57750

- Date: 2026-10-11. Rechecked all 50 Korean rows against English meaning,
  Japanese voice/register, Chinese supporting evidence, historical audit
  prompts, terminology, structure, markers, and numeric values. These are
  working dispositions, not independent final linguistic approval.
- No accepted corrections, 22 `not an issue` IDs, and 19 uncertain findings.
- The review uses immutable sources in `src/csv/en_us/`, `src/csv/ja_jp/`,
  and `src/csv/zh_cn/`. `work/ja_jp/` is a Korean migration draft, not the
  Japanese-language reference.

## Accepted Corrections

No translation CSV cells were changed. Unresolved terminology, names, and
cross-locale differences were retained as uncertain rather than edited.

## Uncertain Findings

| Decision | ID(s) | Rationale |
| --- | ---: | --- |
| D-17371 | 57701-57703, 57716, 57720, 57730 | Lykeios, Coilsbain, Rathir's Watch, Garaner Vernt, Canneroc, and Alyn Shir are identifiable, but the canonical Korean spellings and, for the Watch, named-institution status remain unsettled. |
| D-17372 | 57704 | The epitaph preserves Nora Duerr, Mitharu, the Authority's order, and 1489; the Authority's identity and Korean term remain unclear. Japanese alone explicitly marks 1489 as a year of death. |
| D-17373 | 57705 | Pledgeshield is a membership rank, but Japanese instead identifies a mercenary grade; the canonical rank and Korean title need context. |
| D-17374 | 57708 | Korean preserves the aggressive-mode behavior and `{1}`, `{*1...}`, `{LINE_SPACE}`, `{2}` order. English, Chinese, and Korean have one `{LINE_SPACE}`; Japanese has two, separating the friendly-fire explanation from the continue prompt. The UI label and layout exception need a terminology/structure decision. |
| D-17375 | 57709 | The magical-curse relation is clear, but the Trial of Commencement may be a named rite; retain the current title pending canonical terminology. |
| D-17376 | 57712 | Fyragnos's sleep, continuing blessing, and commanded corpses are retained; the deity's canonical Korean spelling remains provisional. |
| D-17377 | 57713 | The appointment as High King's Guide is clear; the canonical Korean title and High King terminology remain open. |
| D-17378 | 57715 | English asks whether the Rite is satisfied, while Japanese asks whether it was established/fulfilled and Chinese whether it was completed. Korean's `만족스러웠나` may imply subjective enjoyment or approval. |
| D-17379 | 57717 | Preordained is capitalized and may be a faction or formal group; the Korean descriptive rendering is plausible but not established. |
| D-17380 | 57719 | `Family arms` may mean weapons or heraldic arms. Japanese supports an heirloom-weapon reading, but the source remains ambiguous; Korean retains that reading without further invention. |
| D-17381 | 57722 | Bogstaunch is retained as a name. English says “all,” Chinese specifies five bottles, and Japanese does not give a quantity; do not add the Chinese-only count. |
| D-17382 | 57724 | `The Maid` may be a named Windemere figure/title rather than a generic maid; Korean `시녀` preserves the current reading without resolving identity. |
| D-17383 | 57726 | The Crows are a capitalized team/group that survived despite inferior numbers; the canonical Korean team name remains unsettled. |
| D-17384 | 57728 | The letter's proper names and political titles remain provisional. English and Chinese say warriors and supplies will follow, while Japanese says warriors have already been sent and supplies/relics will arrive soon; Korean follows English/Chinese. Japanese also has an additional paragraph break before the sign-off; Korean follows the English/Chinese layout. |
| D-17385 | 57731 | Erathi light-speech is linked to language and music's tonal qualities; the canonical Korean term is not established. |
| D-17386 | 57733 | English and Chinese leave the speaker's own great house unnamed; Korean correctly keeps it implicit by saying “our house.” Anwon's Korean spelling remains provisional. |
| D-17387 | 57737 | Capitalized Telling may be a named tradition, rite, or seasonal cycle rather than an ordinary story; the Korean term needs setting-wide alignment. |
| D-17388 | 57742-57743 | Trellis and Font may be named sacred places, while Great House is a setting-specific social/faction label; current transliteration and translations remain provisional. |
| D-17389 | 57744-57747 | Lords of Valor, King of Cups, and Universalist appear to be formal team/title/class labels; their canonical Korean forms need alignment. |

## Not an Issue

The 22 IDs are 57706-57707, 57710-57711, 57714, 57718, 57721, 57723,
57725, 57727, 57729, 57732, 57734-57736, 57738-57741, and 57748-57750.
They preserve the evident English meaning and Japanese voice/register.
ID 57725 retains the invoice arithmetic problem and its potential cost.
ID 57749 repairs the malformed English “do me great a great service” in a
way supported by Japanese and Chinese without reproducing the source error.

## Structural and Historical Reconciliation

- English, Japanese, Chinese, and Korean each contain IDs 57701-57750 once
  and in identical ascending order. Each full default file has 65,135 data
  records.
- ID 57708 preserves marker identity and order in Korean. The Japanese
  source has one additional `{LINE_SPACE}`; English, Chinese, and Korean
  have one. The Korean structure follows English/Chinese and is recorded
  here as an exception, not as a missing Korean marker.
- ID 57728 has two embedded newline characters (one blank-line separator)
  in English, Chinese, and Korean; Japanese has four (two separators),
  including an additional paragraph break before the sign-off. Korean
  preserves the salutation/body split and aligns with English/Chinese.
- The 1489 value at 57704 is preserved in all locales; Japanese adds an
  explicit year-of-death suffix. The two-house count at 57733 is also
  preserved, expressed as words in English/Chinese/Korean and as the digit
  `2` in Japanese. No numeric value was changed.
- Rechecked historical prompts for IDs 57701-57749 in
  `work/zh_cn/audit/from-ja_jp/open-questions.md`. These remain open prompts,
  not accepted corrections.
- The byte-identical pre-batch backup is
  `/private/tmp/ko-translate-backups/20261011/before-57701/locatexts_zh_cn.koalocatext_default.csv`
  (SHA-256 `e853b47160e5cd3670a35d213563388eb41c0ee27e20ec047f733db4ded304f7`).
  No translation CSV cell changed. The active CSV retains its UTF-8 BOM,
  65,135 records, key order, 72,045 CRLF endings, and 39 pre-existing bare
  LF endings.
- Active default CSV SHA-256 remains
  `e853b47160e5cd3670a35d213563388eb41c0ee27e20ec047f733db4ded304f7`.

D-17371 through D-17389 record the 19 uncertain findings; D-17390 records
the remaining 22 `not an issue` IDs. Direct register totals: 1,702 accepted,
12,086 `not an issue`, and 10,805 uncertain (24,593 decisions total); next
D-17391.

Resume at `default` ID 57751; 7,384 IDs remain through ID 65134. Findings
are working dispositions, not independent final linguistic approval.
