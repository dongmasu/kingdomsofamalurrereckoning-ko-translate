# Disposition and Edit Batch: `default` IDs 11900-11949

- Decision date: 2026-10-09.
- Scope: all nine findings in the preliminary report for this range.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, and archived questions.
- Nine findings received dispositions: two accepted, two `not an issue`, and
  five uncertain.
- Applied two supported corrections only to Korean `Texto` cells at IDs
  11906 and 11947.
- These are working dispositions, not independent final linguistic approval.

## Decisions

- ID 11906 is accepted: remove the leading period copied from the English
  source's `.With`. Japanese and Chinese begin the sentence without it, and
  the period is not meaningful Korean punctuation. The names and remaining
  narrative are unchanged.
- ID 11913 remains uncertain: English's `dog-face` is more specific and
  abrasive than Korean `멍청아`, but the exact insult and its interpersonal
  force cannot be safely reconstructed without scene context.
- ID 11917 remains uncertain: the parties, quantities, and trade terms are
  retained, but the compressed English and differing locale renderings do not
  settle whether this is a formal witnessed contract or the intended unit for
  the cheese.
- ID 11922 remains uncertain: `Compliance Testing` may be an internal test
  label or player-facing text; the isolated row does not establish its
  display context.
- ID 11923 is `not an issue`: the Korean transliteration retains the parody
  name and includes the English phrase in parentheses, preserving both its
  sound and source wording.
- ID 11931 remains uncertain: `Right now? No.` is a context-dependent
  fragment, and the implied question is not established by the references.
- ID 11932 remains uncertain: the item components and `Mitharan` rendering
  are retained, but the canonical item-name construction is not established.
- ID 11942 is `not an issue`: the objective first requires finding the
  Wandering Well before collecting its water; Japanese and Chinese support
  the Korean `샘을 찾아야 한다`.
- ID 11947 is accepted: replace `겸손한 마음으로 ... 환영하오` with
  `...삼가 환영하오`, a more idiomatic humble welcome that retains the
  speaker's formal register and aligns with Japanese `謹んで歓迎`.

## Applied Text

| ID | Previous Korean | Applied Korean | Decision |
| ---: | --- | --- | --- |
| 11906 | `".에틴(Ettin)...` | `"에틴(Ettin)...` | D-3494: remove source-artifact punctuation. |
| 11947 | `헬름가드(Helmgard)가 겸손한 마음으로 그대를 환영하오.` | `헬름가드(Helmgard)가 그대를 삼가 환영하오.` | D-3502: use natural humble register. |

## Verification

- English, Japanese, Chinese, and Korean contain IDs 11900-11949 in
  identical key order. The preliminary structural comparison found matching
  runtime-token sequences and embedded line-break counts.
- The accepted edits change no keys, variants, tokens, or line breaks. Only
  the approved Korean `Texto` cells at IDs 11906 and 11947 changed.
- The active default CSV retains its UTF-8 BOM, CRLF endings, 65,135 ordered
  ID records, and 72,085 physical lines.
- Active default CSV SHA-256 after the edits:
  `1818c47dea29b82893a7566662d2d8735193ed539fa768ad4e5728795676bf9d`.
- Before this batch: 503 accepted, 1,122 `not an issue`, and 1,868 uncertain.
  After this batch: 505 accepted, 1,124 `not an issue`, and 1,873 uncertain
  (3,502 dispositions total).
- Direct findings and carried historical questions through ID 11949 now have
  dispositions. Resume at ID 11950; 53,185 `default` rows remain.

These remain working dispositions, not independent linguistic approval.
Corpus-wide terminology, integrated voice review, and independent
verification remain open.
