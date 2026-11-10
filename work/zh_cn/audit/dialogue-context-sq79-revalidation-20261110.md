# SQ79 / Terenia Quest Dialogue and Text Revalidation

- Date: 2026-11-10.
- Scope: all 44 `default` keys found in `1297481.quest_bxml` (`SQ79`).
- Translation CSVs and extracted resources were not modified.
- English anchors meaning; Japanese is the primary style/register check;
  Chinese is supporting evidence.

## Grouping Evidence

The asset contains `QUEST_ID SQ79`, the asset-level symbol
`NPC_POE_SEE_Terenia`, three quest-target handlers, and 17 serialized
`dialog_line_*` handlers. All 44 exact-key matches were compared across the
active Korean, English, Japanese, and Chinese `default` tables. The resource
concerns the barrier around the Cradle of Summer, the Wild Fae incursion,
Esharra's magical flow, and the Lorestones' role in protecting the Cradle.

The asset and NPC symbol establish a quest-resource association, not a
speaker assignment for each key. The localization keys have not been mapped
to individual callbacks, branches, addressees, or playback positions.
Several keys are quest objectives, journal text, titles, or UI labels, so
dialogue-register findings apply only to dialogue-like text and choices.
Neither callback serialization order nor the localization row order is
treated as dialogue order.

## Revalidation Findings

These are review proposals, not approval to edit the active translation CSV.
Candidate statuses identify rows for an editor decision; they are not claims
that every row is a confirmed error.

| ID | Dimension | Evidence and proposed direction | Confidence |
| ---: | --- | --- | --- |
| `9863` | Meaning / naturalness | `You cannot walk away!` directly addresses the listener and means they cannot simply leave. `도망칠 수 없다!` suggests escape and reads like an impersonal statement. Japanese `逃がしはしないぞ` also supports preventing the listener from leaving. Consider `그냥 떠날 순 없어!` while preserving the following responsibility accusation. | High |
| `11101` | Meaning / naturalness | English `You have a responsibility` and Japanese `お前に責任がある` state that the listener has responsibility; neither says “also.” Korean `네게도 책임이 있어` adds `도`. Consider `네가 한 일이야. 네 책임이야.` | High |
| `23898` | Terminology | English `Lorestones`, Japanese `ロアストーン`, and Chinese `智慧石` identify the established Lorestone collectible. Project decision D-133 establishes `로어스톤`; this same quest uses it at `36106`, while the current `지식의 돌(Lorestones)` conflicts with that term. Consider changing only the term to `로어스톤(Lorestones)`, preserving the sentence and its other wording. | High |
| `40332` | Meaning / naturalness | English says the Cradle and its importance within the Great Cycle are what the people have fought to protect. Japanese clarifies that the Cradle occupies an important place in that cycle. The current modifier order makes `위대한 순환에서 중요한` attach awkwardly to the Cradle. Consider `수많은 계절 동안 우리 종족은 위대한 순환(Great Cycle)에서 중요한 자리를 차지하는 여름의 요람(Cradle of Summer)을 지키기 위해 싸워 왔다.` | High |
| `63060` | Naturalness / speech level | The Korean shifts within one utterance from the marked `이해하게` command to casual `해야 해`; `이해하게` is also stiff in this context. Japanese uses a direct imperative (`理解しろ`) followed by plain speech. Consider `필멸자의 양심이 널 그냥 떠나게 두지 못해 돌아왔군. 알아 둬. 이 일은 함께 해야 해.` | Medium-high |

`44380` remains uncertain rather than being standardized: English `fonts`,
Japanese `泉`, and Chinese `圣泉` support a drying magical spring/source, but
the setting-specific status and Korean treatment of `Font` remain an
unresolved terminology question in earlier records. The current `샘물이
마르고` is understandable, and this pass does not treat the parallel
`샘(Font)` at `27275` as sufficient evidence to impose a global form.

`46491` also remains uncertain. English `alight on the surface` may describe
the power settling onto the ground or being alight there; Japanese `地表に
落ちる` supports “falling onto the surface,” while Chinese `在地面上燃烧`
supports “burning on the ground.” The current `지표면에 불붙어 있다`
preserves one source-supported reading, so no replacement is proposed without
stronger context.

The earlier term/context questions at `14839` and `33700` were rechecked.
`요람` at `14839` is clear in the barrier-restoration exchange and does not
require expanding every short `Cradle` reference into a global alias.
`33700` preserves the three sacred sources named in the English and aligned
references. Neither row shows a clearly supported correction in this pass.

There are no fully identical English strings among the 44 keys. The reviewed
Korean rows and aligned source rows contain no embedded line breaks, runtime
variables, or formatting markup.

## Coverage and Limits

All 44 asset-linked IDs were reviewed against their same-ID English,
Japanese, Chinese, and active Korean rows for meaning, Korean naturalness,
register where applicable, and formatting. Five correction candidates and
two uncertain findings are recorded with four-language fingerprints in
[`dialogue-context-review-ledger.tsv`](dialogue-context-review-ledger.tsv).
No translation CSV edit was applied.

The key-to-callback mapping, speaker attribution for individual keys, branch
flow, addressee, and exact dialogue sequence remain unknown. The asset-level
Terenia symbol and callback serialization order are not treated as proof of
those details.

The full ID set is:

`453`, `964`, `2443`, `2767`, `3311`, `4509`, `6111`, `6438`, `9863`,
`11101`, `11129`, `13091`, `13274`, `13942`, `14007`, `14839`, `17178`,
`22932`, `23898`, `24215`, `25881`, `26399`, `27275`, `31654`, `33700`,
`36106`, `40332`, `40945`, `44030`, `44380`, `44695`, `45488`, `46491`,
`47845`, `52451`, `53429`, `55392`, `55843`, `56240`, `57607`, `59513`,
`60191`, `60401`, `63060`.
