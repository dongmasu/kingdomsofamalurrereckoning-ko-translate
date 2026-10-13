# Preliminary Language Scan: `default` IDs 56501-56550

- Review date: 2026-10-09
- Scope: all 50 active `default` rows, IDs 56501-56550 inclusive.
- Compared English meaning, Japanese voice/register, Chinese supporting
  evidence, active Korean, recurring terminology, historical audit notes,
  line breaks, runtime markers, and numeric values.
- Read-only preliminary work, not independent Reviewer approval.

## Preliminary Findings

| ID | Current Korean / term | Candidate / question | Evidence and rationale | Confidence |
| ---: | --- | --- | --- | --- |
| 56501 | `Reverie` / `몽환` | Determine whether Reverie is a named Fae state/place or ordinary “reverie,” and align it with related corpus uses. | Korean uses the common noun `몽환`; a separate in-corpus row describes Fae entering Reverie rather than sleeping, supporting a setting-specific state interpretation. Japanese says meditation; Chinese says daydream. | Medium |
| 56503 | wedding preparation / bear-musk | Preserve the speaker's interrupted, flustered delivery and clarify the unusual bear-musk preparation without adding context. | English contains false starts and dash interruptions; Korean smooths these into complete clauses and ellipses. Japanese/Chinese retain a more abrupt list. | Medium |
| 56518 | `Sewer Run` / `하수도 경주` | Cross-check the earlier `I ran the sewer` (56405) quest-log wording against this named activity. | This row explicitly names Sewer Run; Korean, Japanese, and Chinese all render it as a sewer race. It supports the race/quest reading for 56405 but does not prove whether that earlier line is a journal shorthand or literal running. | Medium |
| 56521 | sacred symbol / corpse-bearing rite | Identify the symbol's referent (likely the Gallows Tree) and align House of Sorrows terminology while retaining the sacred/profane contrast. | Korean preserves the Winter Fae symbol, the sacred rite of bearing a corpse on it, and Tuatha defilement with mortal remains, but leaves the object unnamed. Chinese explicitly names the gallows tree. Korean's House term also varies elsewhere. | Medium |
| 56525 | `Codex` / `법전` | Confirm whether Codex is a law code, formal book, or other document intended for the High King. | Korean chooses `법전`; Japanese says a book to deliver to the High King, while Chinese calls it a code. The item/context is not stated in this short line. | Medium |
| 56533 | “came ashore” / `해안에 떠밀려 왔을 때` | Check whether “washed/washed up ashore” is supported or whether the Korean adds an unspoken drift/force. | English only says the speaker came ashore; Korean says they were washed ashore, adding a passive arrival nuance. Japanese and Chinese keep the simpler arrival-on-shore meaning. | Medium |
| 56537 | `Scion` / `후계자` | Confirm whether the speaker names the formal Scion office/title or a generic successor, and align its Korean form. | The capitalized English title is rendered as “successor” plus English. Prior audit notes document multiple Korean forms and distinguish the Cape Solace office from generic descendant/successor senses. | Medium |
| 56542 | `Adept` / `숙련자여` | Standardize Adept as a formal rank/title and verify the appropriate address form. | Korean uses `숙련자`; the corpus also has `수습생`, `수행자`, and `견습 마법사`. Japanese gives no title in this row and Chinese uses a generic attendant/servant term. | Medium |
| 56547 | `Unseelie` / `언실리` | Confirm the formal faction/court name and maintain distinction from generic Winter Fae. | Korean transliterates the capitalized faction and preserves the attempt to unite them against a threat. Chinese generalizes the group as Winter Fae, so English remains the anchor. | Medium |

Other reviewed rows generally preserve the first-read English meaning. Names
and terms remain provisional, including Reverie, Aubrey Gilcrest, Peaches,
Captain Talibor, the Sparrows, the Fateless One, Bolgan, two-legs, Sandstone
Villa, Sewer Run, the House of Sorrows, Ametair, Telogrus, Lyria, Paddy,
Scion, Sydanus, Adept, the Unseelie, and Peter.

## Historical Audit Reconciliation

- Rechecked the source-keyed historical entry for IDs `56450-56549`.
  Relevant prompts include Reverie (56501), the corpse-bearing rite and
  object (56521), Codex (56525), recipe ingredients (56536), and Unseelie
  (56547). These remain open prompts, not accepted corrections.
- ID 56550 begins the next historical range (`56550-56649`) and is included
  once as this active batch's final row. The preceding active report covers
  through ID 56500; no active row is duplicated or omitted.

## Other Checks

- English, Japanese, Chinese, and Korean each contain IDs 56501-56550 once
  and in identical ascending order. All four default files contain 65,135
  records with identical full key order.
- Newline counts and normalized runtime-marker frame/order match throughout
  the batch. The recipe at 56536 retains three newline characters, its blank
  separator, and both ingredient quantities.
- The 25% bleeding-damage reduction at 56502 and the two `(2)` reagent
  quantities at 56536 are preserved.
- Active CSV SHA-256 values remain at the recorded checkpoint:
  - `base`: `c6adbf220bd66bab7ef61274886ea6a47427b58dc971f9e9703d4fd089b946a6`
  - `affix`: `7697d7d09933ca7f7f8f6e41fcd82bb5f29e4b092368b856489a8c62f1dc21b9`
  - `default`: `fd5c65786f1f3f854df3a55d388d241e883db384131c428c71f4aa1e86740df0`
- No translation CSV edit was made.

## Batch Status

IDs 56501-56550 received one preliminary reading. Findings remain open
candidates, not confirmed review dispositions. Continue at `default`
ID 56551.
