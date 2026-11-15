# Sequential `default` Revalidation: IDs `6250`-`6499`

- Date: 2026-11-11.
- Scope: compare the active English, Japanese, Chinese, and Korean rows for
  IDs `6250`-`6499`; add only IDs without an existing review-ledger record.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- 184 new IDs were reviewed and recorded. The other 66 IDs already had
  review-ledger records and were left unchanged.
- Five IDs have correction candidates. One ID has an evidence-limited hold.
- Meaning, Korean naturalness, register where assessable, names/terms, and
  structure were checked. UI, objective, item, book, and other non-dialogue
  text was assessed according to its type.
- No translation CSV or extracted game asset was changed. Candidates are
  proposals, not approval to edit.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `6286` | Meaning / terminology | `the Den` is the gambling venue, as confirmed by the gladiator-and-gambler context and Japanese `賭博場`. Korean `덴` is an unexplained transliteration. Consider `도박장(The Den)` and review related venue references such as `5902` and `6117` together; do not globally replace generic uses of `den`. | High |
| `6312` | Name / format | `Day of the Pale Swans` is a named historical event, rendered `창백한 백조의 날` without the English name. Consider `창백한 백조의 날(Day of the Pale Swans)` while retaining the current meaning. | Medium |
| `6327` | Naturalness | The final clause, `우리를 위해 네가 해 준 것처럼`, is left as a dangling fragment. Japanese also makes the clause depend on the instruction to keep striving for one's dream. Consider joining the thought, e.g. `잘 지내. 네가 우리를 위해 해 준 것처럼, 네 꿈을 이루려고 늘 노력해.` | Medium |
| `6372` | Terminology | `fastings` refers to the Dverga-built tunnel/bunker network, not generic underground passages. The established Korean rendering is `패스팅(Fastings)` (also used at IDs `16478` and `54487`). Consider using that term here instead of `지하 통로`. | High |
| `6398` | Naturalness | `필요하면 엘와(Elwa)에게 물약이 있어` is understandable but awkward in casual speech. Consider `물약이 필요하면 엘와가 갖고 있어.` | Medium |

## Evidence-Limited Hold

| ID | Reason and disposition |
| ---: | --- |
| `6420` | The English line ends mid-thought (`So far our banner has fallen...`); Japanese, Chinese, and Korean also trail off. Preserve the existing ellipsis and wording pending the continuation/context rather than completing the sentence speculatively. |

## Duplicate and Structural Checks

- Fifty-two exact-English duplicate groups touching the new IDs (853 rows
  across the full corpus) were checked; Korean text matched within every
  group.
- Runtime-variable and layout-control signatures match across all four
  languages for the 184 new IDs.
- Logical line-break counts match across all four languages for the new IDs.
- Korean embedded breaks use CRLF at IDs `6347` (4 breaks) and `6441`
  (7 breaks). These are existing byte-level differences and were preserved.
- Of the 184 new IDs, 141 have indexed asset links and 43 do not. Asset
  membership does not establish an individual speaker, handler mapping,
  branch, or dialogue order; unsupported values remain unknown. No new line
  explicitly identifies its speaker by name.

Four-language source fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
