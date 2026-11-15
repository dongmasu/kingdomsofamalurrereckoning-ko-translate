# Sequential `default` Revalidation: IDs `4750`-`4999`

- Date: 2026-11-11.
- Scope: compare the active English, Japanese, Chinese, and Korean rows for
  IDs `4750`-`4999`; add only IDs without an existing review-ledger record.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- 198 new IDs were reviewed and recorded. The other 52 IDs already had ledger
  records and were left unchanged.
- Eight IDs have correction candidates. Fifteen IDs have one or more
  evidence-limited holds; two of those also have a correction candidate.
- Meaning, Korean naturalness, register where assessable, names/terms, and
  structure were checked. UI, objective, item, book, and other non-dialogue
  text was assessed according to its type.
- No translation CSV or extracted game asset was changed.

## Correction Candidates

These are ID-scoped proposals, not approval to edit the CSV:

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `4768` | Naturalness | `땅은 방부의 손길로 그들을 감싸네` is a stiff literal rendering of the earth's “embalming hand.” Preserve the image of the earth embracing and preserving the dead, but consider a more natural poetic line such as `대지는 죽은 이를 영원히 품어 보존하네`. Keep the four-line stanza and its meaning. | Medium |
| `4793` | Naturalness | `믿음직하고 단단한 사람` translates `a solid sort` too literally and sounds physical in Korean. The next word `Reliable` confirms a dependable-person reading; consider `믿을 만한 사람이야` or an equivalent that avoids repeating the same adjective. | High |
| `4803` | Meaning / naturalness | English `If I didn't know better` is an idiom, and Japanese recasts it as “a fool would call this fate.” `내가 이걸 잘 몰랐다면` instead reads as not knowing the matter well and weakens the sardonic contrast. Consider `사정을 모르면 이게 운명이라고 했겠지`, retaining the threat that the listener will not escape again. | High |
| `4814` | Naturalness | `침묵의 합의체 안에서 편하게 지내는 이들` is an opaque, overly literal rendering of `in the ease of silent quorums`. Japanese supports the idea that many people keep the objection unspoken while believing the garrison insults Adessa's founding principles. Consider expressing that they remain comfortable in silence or do not speak openly, without inventing a formal “quorum.” Preserve the letter's paragraph structure. | Medium |
| `4910` | Register / name format | The source and Japanese use emphatic but non-archaic speech; Korean `될 것이오`, `되찾을 것이오`, and `약속하겠소` shift to conspicuous 하오체. Recheck the register against the actual speaker context rather than inferring a speaker from adjacent IDs. The Korean title `경` also translates `Lord`, but its English parenthetical omits it (`Godric Payne`); consider pairing the full title as `고드릭 페인 경(Lord Godric Payne)`. | Medium |
| `4911` | Register | The Korean `좋소`, `마땅하오`, and `지켜야 하오` use 하오체, while the Japanese is plain declarative speech. Recheck whether the archaic form is supported by this line's speaker; if not, use a consistent contemporary register, for example `좋아. 권력을 남용한 대가로는 마땅한 처분이야. 워스원은 우리 가치관을 지켜야 해.` No speaker link is inferred from the neighboring ID. | Medium |
| `4925` | Meaning / naturalness | `아니라는 장인들을 억류하고 있는데도` makes the name Anira read like the connective `아니라` and produces an awkward concessive clause. English says the narrator cannot help free the Master Makers held by Anira; consider `이제 아니라(Anira)가 붙잡아 둔 장인들을 풀어 주는 일도 도울 수 없게 됐어`, preserving the source's regret and sequence. | High |
| `4991` | Meaning | `신성한 권리를 판정할 자격` says the Ljosalfar judge who is qualified to determine a divine right. English is difficult, but Japanese says they believe they possess sacred/divine rights, and Chinese likewise describes their claimed divinity. Consider `바람과 태양과 하늘 아래에서 신성한 권리를 지녔다고 여기며`, preserving the surrounding display markers and translated label. | Medium-high |

## Evidence-Limited Holds

### Format

The Korean embedded breaks use CRLF while English, Japanese, and Chinese use
LF at IDs `4752`, `4768`, `4780`, `4785`, `4791`, `4814`, `4819`, `4862`,
and `4892`. Logical break counts match at these IDs except `4819`: Japanese
has four breaks, while English, Chinese, and Korean each have one. Preserve
the current bytes and line segmentation until the intended game rendering is
established; do not normalize the mixed line endings automatically.

### Meaning or Context

| ID | Reason and disposition |
| ---: | --- |
| `4833` | All four sources contain the literal label `Crudok2`, but the available row does not establish whether it is player-facing or an internal asset label. Preserve it pending UI context. |
| `4885` | `Unarmed Fighter Parent` is a fragment in all four sources. `Parent` may be an internal hierarchy label; its player-facing role is not established. Keep `비무장 전투가 부모 항목` provisional rather than inventing a UI meaning. |
| `4892` | This poem's English syntax is opaque and the Japanese version diverges substantially in imagery. The Korean retains the English sequence and all 12 logical breaks, but several images cannot be confidently resolved from the references. Preserve the translation pending stronger context; the CRLF byte difference is separately held above. |
| `4958` | The sources do not settle whether `Experiorati` is a personal name, rank, or part of `Warlord Experiorati`. Retain the current form without assigning a role. |
| `4963` | `Racket` may mean a dubious operation, scheme, or group; Japanese explicitly reads it as a cult, while the other references differ. Korean `수작` is plausible but commits to the scheme reading. Retain it provisionally. |
| `4980` | The boundary and referent of `Bane of Three Winds Crutch` are unclear. Japanese treats “Three Winds Crutch” as part of a killer/epithet phrase, while Chinese reads a place-like expression. Do not standardize the name from this row alone. |
| `4985` | `Wormy` is ambiguous: Japanese suggests an inscrutable person and Chinese an obsequious one. Korean `음흉해` selects a sinister-person reading not established by all sources. Preserve it pending dialogue context. |

## Prior-Record and Preliminary-Scan Checks

- The 52 existing ledger records in this interval were not rewritten or
  duplicated; their existing candidate/uncertain dispositions remain intact.
- The old preliminary scan for `4750`-`4799` associates ID `4778` with a
  Cadsymyr encampment sentence. The active source row at ID `4778` is instead
  `Not for free, anyway`, and the current ledger links it to a different
  asset. The stale preliminary candidate was excluded.
- The active `Adept` rank at IDs `4796` and `4862` is already `숙련자`, in
  accordance with the accepted Scholia Arcana rank decision; no duplicate
  correction was proposed.
- The prior preliminary questions at IDs `4820` and `4941` were checked
  against the active rows: `정밀 사격` expresses `sharpshooting`, and
  `적은 쓰러져` correctly says the enemy falls. Neither was carried forward
  as an error.

## Duplicate and Structural Checks

- Forty-four exact-English duplicate groups touching the newly reviewed IDs
  were checked against the full `default` corpus (893 rows total). Korean
  text matched in every group.
- After accounting for localized text inside `{*N...}` display wrappers,
  runtime/layout marker identities and order match across all four languages.
  The visible `inventory`, `selling`, and `destroying` labels at ID `4887`,
  and the `Ljosalfar` display label at ID `4991`, are localized while their
  wrappers remain intact.
- Logical line-break counts match for 197 of the 198 new IDs. ID `4819` has
  a source-language segmentation difference described above. The nine
  Korean CRLF cases are byte-level differences, not additional logical
  breaks.
- The full-corpus exact-English duplicate check includes IDs `4786` and
  `4894` (`.`); their Korean text matches, as do all other groups.
- Unsupported speaker attribution and dialogue order remain unknown.

Four-language source fingerprints and per-ID dispositions are in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
