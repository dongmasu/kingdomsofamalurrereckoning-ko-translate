# Sequential `default` Revalidation: IDs `4000`-`4249`

- Date: 2026-11-11.
- Scope: compare English, Japanese, Chinese, and active Korean for IDs
  `4000`-`4249`; add only IDs without a current ledger record.
- English controls meaning; Japanese is the primary voice/register and layout
  reference; Chinese is supporting evidence.
- 183 new IDs were reviewed and recorded. The other 67 IDs in this interval
  already had ledger records and were left unchanged.
- One correction candidate and one evidence-limited hold were identified.
  The candidate is a proposal, not approval to edit the translation CSV.
- Meaning, Korean naturalness, register where applicable, names/terms, and
  structure were checked. UI, objective, item, book, and other non-dialogue
  text was assessed according to its type.
- No translation CSV or extracted game asset was changed.

## Correction Candidate

This is an ID-scoped proposal, not approval to edit the CSV:

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `4013` | Meaning | English `I tried to warn her` and Japanese `警告した` say the speaker warned her. Korean `말리려 했는데` instead says the speaker tried to dissuade/stop her. Consider `경고했는데 듣지 않았어! 어떻게 이런 일이 벌어진 거지? 왜 이런 일이 생긴 거야?` | High |

## Evidence-Limited Hold

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `4237` | Meaning / naturalness | The English is a colloquial fragment (“good doing business”), Japanese says that the speaker expects to do good business with the listener, and Chinese reads as “well done.” Korean `그럼 거래 잘했네` is plausible but the references differ in tense and stance. Keep it provisional rather than choosing a more specific reading without dialogue context. |

## Duplicate and Structural Checks

- Fifty-four exact-English duplicate groups touching the newly reviewed IDs
  were checked across the full `default` corpus (911 rows total). Every group
  has identical Korean text.
- Embedded line-break counts match across English, Japanese, Chinese, and
  Korean for all 183 new IDs.
- Runtime and formatting markers are retained. At ID `4141`, Korean's
  localized `{*1[업그레이드]}` matches the localized display-label pattern.
  At ID `4171`, Korean follows English and Japanese in using
  `{LINE_INDENT}`; Chinese uses `{LINE_LEFT}` for that heading.
- The 67 pre-existing ledger records were not rewritten or duplicated.
  Asset associations do not establish a per-key speaker or playback order;
  unsupported attribution and order remain unknown.
- The accepted faction form at ID `4209` (`트래블러(Travelers)`) was retained;
  its prior ID-scoped disposition was not reopened.

Four-language fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
