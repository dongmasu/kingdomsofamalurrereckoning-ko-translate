# Sequential `default` Revalidation: IDs `7750`-`7999`

- Date: 2026-11-11.
- Scope: compare the active English, Japanese, Chinese, and Korean rows for
  IDs `7750`-`7999`; add only IDs without a current review-ledger record.
- English controls meaning; Japanese is the primary voice, register, and
  layout reference; Chinese is supporting evidence.
- All 250 IDs were checked. The 63 existing records had current
  four-language fingerprints and their prior dispositions were retained.
  The other 187 IDs were reviewed and recorded.
- Five new IDs have correction candidates. Four new IDs have
  evidence-limited dimensions.
- Meaning, Korean naturalness, register where assessable, terminology, names,
  and structure were checked. UI, objective, item, and other non-dialogue
  text was assessed according to its type.
- No translation CSV or extracted game asset was changed. Candidates are
  proposals, not approval to edit.

## Correction Candidates

| ID | Dimension | Finding and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `7783` | Meaning / terminology | `Freezing Damage` is rendered `냉기 피해`, which collapses it with `Ice Damage`. The same source distinguishes the two at `7196`, and `Freezing Damage` is rendered `빙결 피해` at `7478`. Consider `빙결 피해(Freezing Damage)`. | High |
| `7850` | Format / terminology | The source says `sagecrafting`, but the Korean parenthetical is `Sagecraft`; the established term elsewhere is `Sagecrafting` (57 source rows use that term). Consider `마법물품 제작(Sagecrafting)`. | High |
| `7901` | Naturalness | `말은 편리하군` is a literal, awkward rendering of the sarcastic `How convenient.` Japanese preserves the speaker's distrust, while Chinese uses the idiomatic `说得轻巧`. Consider `참 편리한 소리군. 내가 왜 널 믿어야 하지?`. | High |
| `7907` | Naturalness | `살아 있는 사람이 왔네` reads literally as though the speaker were surprised that someone is alive. The line welcomes a visitor to Star Camp; Japanese emphasizes liveliness, while the English idiom is deliberately colloquial. Rephrase naturally without losing the playful greeting; the exact nuance of `live one` remains context-sensitive. | Medium |
| `7935` | Meaning / naturalness | `upstart` is rendered `출세주의자`, which suggests a careerist rather than a newly prominent, presumptuous newcomer. Other uses include `건방진 신참` at `7062` and `풋내기` at `1787`/`28842`. Consider `이 건방진 신참 아니신가`, preserving the taunting tone. | High |

## Evidence-Limited Holds

| ID | Reason |
| ---: | --- |
| `7824` | The English epithet for Vraekor and its language references do not converge: Japanese describes a capricious spirit, while Chinese and Korean suggest vengeance. The row does not resolve the intended characterization. |
| `7852` | `Well, I'll be... a Jottun's nose` is a comic exclamation. English and Chinese preserve the nose image, while Japanese omits it. The literal Korean retains the joke but sounds unusual; there is not enough context to choose whether to adapt or preserve the fantasy expression. |
| `7865` | English, Chinese, and Korean describe feeling especially well with him; Japanese instead says the speaker has never felt so proud to play him. Without the scene context, the intended meaning cannot be settled. |
| `7926` | `My apologies` is rendered `미안해`, while Japanese `ごめんなさい` and Chinese `我很抱歉` can support a more polite apology. The short line has no reliable speaker or relationship evidence, so the Korean speech level remains unresolved. |

## Duplicate and Structural Checks

- Forty-one exact-English duplicate groups touch the range (666 rows across
  the corpus). Korean text matches in every group.
- Logical line-break counts and runtime-variable/layout-wrapper signatures
  match across the four languages for all 187 new IDs. At `7807`, localized
  ability names inside the `{*1...}` wrappers differ by language as expected.
- Two Korean strings contain 13 existing CRLF embedded breaks: ID `7795`
  (5) and ID `7831` (8). They were preserved.
- Of the 187 new IDs, 138 have indexed quest-asset links and 49 have none.
  Asset membership does not establish a speaker, handler mapping, branch, or
  dialogue order.

Four-language source fingerprints and per-ID dispositions are recorded in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
