# Sequential `default` Revalidation: IDs `12250`-`12499`

- Date: 2026-11-11.
- Scope: compare active Korean with English meaning, Japanese
  voice/register/layout, and Chinese supporting evidence.
- Fifty-seven existing ledger records were retained after their
  four-language fingerprints were verified. The other 193 IDs were compared
  and added.
- Six newly recorded IDs have correction candidates. Five retain
  evidence-limited findings; no candidate and hold overlap.
- Of the 193 new IDs, 136 have indexed quest-asset links and 57 do not.
  Three IDs link to multiple assets. Asset association does not establish an
  individual speaker or playback order.
- No translation CSV, source resource, or extracted game asset was changed.

## Correction Candidates

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `12347` | Speech level / honorifics | English opens with `How may I serve you, your eminence?`, while Korean addresses the listener as `각하` and then switches to `뭘 도와드릴까?` and `난 ... 왔어`. Make the line consistently deferential or otherwise preserve one coherent register; retain Hallam's established name form. | High |
| `12353` | Speech level | Japanese uses casual `送るわ` and direct casual imperatives (`行って`, `話して`), while Korean shifts among `보내겠습니다`, `이야기하세요`, and `당장요`. Consider a consistent conversational register. No individual speaker is inferred from the asset association. | Medium |
| `12357` | Format | The Korean chapter heading is split across a blank line as `제3` / `장: 질서에 매달리다`. English and Chinese keep the chapter number and `Chapter/章` together; Japanese also splits its heading, but that does not make the Korean split natural. Keep `제3장` together and preserve the blank separation before the excerpt. | High |
| `12395` | Terminology / meaning | The epitaph uses `권위자(Authority)의 질서`, but the established divine title is `권능(Authority)` (for example, IDs `411` and `6908`). Align the title with that established form while preserving the prayer and epitaph structure. | High |
| `12416` | Naturalness / meaning | `내가 도둑맞은 부적이군` is an awkward rendering of `My stolen amulet`; Japanese and Chinese also identify it as the speaker's stolen amulet. Clarify the possession naturally (for example, `내게서 훔쳐 간 부적이군`) without changing who removed the curse. | High |
| `12434` | Naturalness | Korean stacks `감사 표시로` with `도움을 기리기 위해`, making the opening stiff. The English repeats gratitude and honoring Akara's help, so retain both ideas but recast the Korean purpose phrases more naturally. | Medium |

These are review proposals, not authorization to edit the translation CSV.

## Evidence-Limited Findings

| ID | Dimension | Reason and disposition |
| ---: | --- | --- |
| `12257` | Meaning / idiom | `Widow take us` may invoke the Widow as an oath or refer to being taken by the Widow. Japanese curses at the Widow, while Chinese reads it as the Widow having taken them. Keep the current reading provisional rather than selecting one without context. |
| `12306` | Meaning / tone | `I lack the sympathy to kill you personally` is an unusual, potentially ironic threat. The references preserve the same ambiguity rather than establishing whether the speaker means pity, willingness, or personal involvement. |
| `12320` | UI meaning | `Clear Spaces` does not identify whether it means clearing inventory slots, removing an area, or another UI operation. The isolated key does not resolve the target. |
| `12423` | Speech level / speaker | The line uses `축복하신다` for the Hierophant and then addresses the player with `무엇이 필요한가?`. That may be an intentional difference between reverence for the Hierophant and the speaker's register toward the player; without individual-speaker context, do not normalize it by assumption. |
| `12472` | Meaning / context | Japanese explicitly asks for casting recommendations, while English and Chinese are more general. Korean follows the casting interpretation; retain it provisionally until dialogue context establishes whether roles are meant. |

Existing findings were retained rather than recounted: `12293` remains
uncertain; `12344`, `12365`, `12382`, and `12427` retain their existing
candidate dispositions. No speaker or playback order was assigned.

## Source and Structure Checks

- Seventy-three exact-English duplicate groups touch the 193 newly recorded
  IDs, comprising 1,352 rows across the corpus. Korean matches in every
  group.
- Runtime placeholders, named variables, and layout-control identities and
  order match across the four languages. At `12273`, Japanese reverses
  `{1}`/`{2}` while Korean matches English and Chinese. At `12278`, localized
  label text differs as expected, while wrapper types and order match.
- Logical line-break counts match except at `12357`: Japanese has two more
  breaks than English, Chinese, and Korean. The Korean chapter-number split
  follows Japanese, while other line groupings differ. The format candidate
  above addresses the unnatural Korean split without normalizing the poem or
  prose layout generally.
- Source discrepancies retained without changing Korean include the
  ambiguous `left Anokatos with the Hyperian` at `12304` (Japanese explicitly
  says Anokatos was entrusted with the Hyperian, while English and Chinese
  permit the current Korean reading), `Niskau` / `Niskaru` at `12421` (Korean
  follows Japanese and Chinese), the
  Canneroc-tenure conflict at `12460` (Korean follows English and Chinese),
  and the shadows wording at `12493` (Korean follows English and Chinese).
- Nine Korean strings contain 51 existing embedded CRLF breaks:
  `12253` (4), `12288` (12), `12357` (10), `12359` (6), `12372` (4),
  `12383` (3), `12422` (8), `12453` (3), and `12459` (1). Their existing
  bytes were preserved.

Four-language fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
